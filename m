Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597E12C96
	for <mhi@lists.linux.dev>; Mon,  8 Nov 2021 17:42:03 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id r80so5486895pgr.9
        for <mhi@lists.linux.dev>; Mon, 08 Nov 2021 09:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EnIJwxmNa0x7pf7LGo/bEAx4wU18K4eSu1l9NYLvfDo=;
        b=ny8gfZ8QcojE5hEkgD9kHFXY0PTyNb8itrZETCnbig69rmjw1knw49E0o0QuY0oNSK
         paV0qrFEvHUF4qqHBAA6m+y/JgwcjeQ+LLcIqW4Xc9cO4XUdUsdT2UzCC51Nu4SVh9Kp
         58vqFD6WVHMedEmybDgiF3j5cyF3L6Qmb3E2IFNOQbDr0FD5cKJ6MJ5WqeAAfLy/E5p3
         jANh4nc/Sy2LnPMOqk9EVbITkOREy//FGTmztRUDxeed0MBQpw7pXav24JSEkhUQhcMa
         EpP5ZFgZWPsWDH9dC1+jaZwvGmvJXm+HHyA0nJE3UoJGWDjsRZ+WGx+96Ce/dXg1UEUI
         6sxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EnIJwxmNa0x7pf7LGo/bEAx4wU18K4eSu1l9NYLvfDo=;
        b=RRUtVEYFeGvdxC3ASLaUS/PdTHlxYfXkZSf9JbhvtUtG3g3ch09SU3RPlEQLaJp+jY
         mIC0atZh2tbNhRH78qRkAYbkdPZYm/DIIFLnYh9+C0ZtOZyfHMe9UGZE1ZKuydiiExSd
         jLw9VffeHGUV2ZUJwqFDbUiclvzO8MSVWXjHDFC2oiutJho2m/SKWn0MVfqJ1duARg+8
         VDqfW2xjDKep1dW3hGlnmy5f8DzJKZ0Bcsfvy+yKRf22/cbeCgtgEv8XOq+VXwZlAL+h
         vF8iFCz6j32BtheZ9GUkvg56b9K2XyAngg6kOHYijzoH6qGcPX74P6+0brwnHarlG0V7
         KIVQ==
X-Gm-Message-State: AOAM532Uu8yzTh0Ud2m5HeRMhvnr5Cej8IC320fbI9Vn53ymjAG73Rxo
	3y986vbQ7VYoiDBgnf+HcaEsCiJulUzK
X-Google-Smtp-Source: ABdhPJzNGTaXBntg242TJpgcqBieHwJUJhrigvr4K1ppIHlMlYfkRzCFug2BiwJY7f1l47UKLFqgiw==
X-Received: by 2002:a05:6a00:1511:b0:492:61fe:9fa6 with SMTP id q17-20020a056a00151100b0049261fe9fa6mr880423pfu.57.1636393322348;
        Mon, 08 Nov 2021 09:42:02 -0800 (PST)
Received: from localhost.localdomain ([117.202.191.159])
        by smtp.gmail.com with ESMTPSA id v10sm4388120pfg.162.2021.11.08.09.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 09:42:01 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: mhi@lists.linux.dev
Cc: aleksander@aleksander.es,
	loic.poulain@linaro.org,
	thomas.perrot@bootlin.com,
	hemantk@codeaurora.org,
	bbhatt@codeaurora.org,
	quic_jhugo@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH] bus: mhi: Fix race while handling SYS_ERR at power up
Date: Mon,  8 Nov 2021 23:11:42 +0530
Message-Id: <20211108174142.52835-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some devices tend to trigger SYS_ERR interrupt while the host handling
SYS_ERR state of the device during power up. This creates a race
condition and causes a failure in booting up the device.

The issue is seen on the Sierra Wireless EM9191 modem during SYS_ERR
handling in mhi_async_power_up(). Once the host detects that the device
is in SYS_ERR state, it issues MHI_RESET and waits for the device to
process the reset request. During this time, the device triggers SYS_ERR
interrupt to the host and host starts handling SYS_ERR execution.

So by the time the device has completed reset, host starts SYS_ERR
handling. This causes the race condition and the modem fails to boot.

Hence, register the IRQ handler only after handling the SYS_ERR check
to avoid getting spurious IRQs from the device.

Cc: stable@vger.kernel.org
Fixes: e18d4e9fa79b ("bus: mhi: core: Handle syserr during power_up")
Reported-by: Aleksander Morgado <aleksander@aleksander.es>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/pm.c | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index fb99e3727155..ec5f11166820 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -1055,10 +1055,6 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
 	mutex_lock(&mhi_cntrl->pm_mutex);
 	mhi_cntrl->pm_state = MHI_PM_DISABLE;
 
-	ret = mhi_init_irq_setup(mhi_cntrl);
-	if (ret)
-		goto error_setup_irq;
-
 	/* Setup BHI INTVEC */
 	write_lock_irq(&mhi_cntrl->pm_lock);
 	mhi_write_reg(mhi_cntrl, mhi_cntrl->bhi, BHI_INTVEC, 0);
@@ -1072,7 +1068,7 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
 		dev_err(dev, "%s is not a valid EE for power on\n",
 			TO_MHI_EXEC_STR(current_ee));
 		ret = -EIO;
-		goto error_async_power_up;
+		goto error_setup_irq;
 	}
 
 	state = mhi_get_mhi_state(mhi_cntrl);
@@ -1082,19 +1078,18 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
 	if (state == MHI_STATE_SYS_ERR) {
 		mhi_set_mhi_state(mhi_cntrl, MHI_STATE_RESET);
 		ret = wait_event_timeout(mhi_cntrl->state_event,
-				MHI_PM_IN_FATAL_STATE(mhi_cntrl->pm_state) ||
-					mhi_read_reg_field(mhi_cntrl,
-							   mhi_cntrl->regs,
-							   MHICTRL,
-							   MHICTRL_RESET_MASK,
-							   MHICTRL_RESET_SHIFT,
+					 mhi_read_reg_field(mhi_cntrl,
+							    mhi_cntrl->regs,
+							    MHICTRL,
+							    MHICTRL_RESET_MASK,
+							    MHICTRL_RESET_SHIFT,
 							   &val) ||
 					!val,
 				msecs_to_jiffies(mhi_cntrl->timeout_ms));
 		if (!ret) {
 			ret = -EIO;
 			dev_info(dev, "Failed to reset MHI due to syserr state\n");
-			goto error_async_power_up;
+			goto error_setup_irq;
 		}
 
 		/*
@@ -1104,6 +1099,10 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
 		mhi_write_reg(mhi_cntrl, mhi_cntrl->bhi, BHI_INTVEC, 0);
 	}
 
+	ret = mhi_init_irq_setup(mhi_cntrl);
+	if (ret)
+		goto error_setup_irq;
+
 	/* Transition to next state */
 	next_state = MHI_IN_PBL(current_ee) ?
 		DEV_ST_TRANSITION_PBL : DEV_ST_TRANSITION_READY;
@@ -1116,9 +1115,6 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
 
 	return 0;
 
-error_async_power_up:
-	mhi_deinit_free_irq(mhi_cntrl);
-
 error_setup_irq:
 	mhi_cntrl->pm_state = MHI_PM_DISABLE;
 	mutex_unlock(&mhi_cntrl->pm_mutex);
-- 
2.25.1

