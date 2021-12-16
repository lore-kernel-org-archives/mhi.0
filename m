Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19872CA4
	for <mhi@lists.linux.dev>; Thu, 16 Dec 2021 08:13:25 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id np6-20020a17090b4c4600b001a90b011e06so21881415pjb.5
        for <mhi@lists.linux.dev>; Thu, 16 Dec 2021 00:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=enNvAidD7aC1MSQe5kOL/Uwk02cQQ2m1aOWlTzGJAQU=;
        b=QESxoDtBBXJwq0idcsyzVJiP5Xgi15Hl+mYL2yzNHK8FoVf+XgWIIhgSeJb+uQ2lwT
         BvLzlmXmUcsza25QUAlhHSbSxXQ4QZWx4Jypfq0l6pM/pZCoT8ZsON8ZtD6FOKYoJQu1
         jzXCVLAFTX8b/viIkeznC3Q0f/dGrhHLzBThyVuihiHi3qt32oMqRFIw+oouvM18T94u
         CvypPQOla11GhxWekfkUxtcX9ENOWiapIiumxShhp9FAU2B0wH+WGsvNUoSgiUtdj2Xl
         fyYOZH1KcJrzoMUfWFEEBEplC2E7xgg9hBMSmxIbm4Q25uyHBgbeyysoMg15+PP5fu3l
         jtIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=enNvAidD7aC1MSQe5kOL/Uwk02cQQ2m1aOWlTzGJAQU=;
        b=A4H6koDnye03UPxBm6e0cpBUnqZjpgGZ6Y1AikS5WSE9YGr1lKsOSrSQic5HOlPIC+
         ZjL42iy3m7+K9UhZnq6CGLet3VD5Z7EnOcP6oGA7z5Prplpc0V9Lo0tvTBvHloKGvAQM
         xrYchFOk3x7jngBgZn3b1uhZ/awRJ2D5Ax2/fAWxx2Y+ZFh75Oto0wE1MgfSZqvL4egT
         Nklicup7+Nr0xBbrGROWW+Uun5fpbrhVUKocYnuMIqZQItOzK7KMHTcX7kt2g8r6CEGX
         x8rErR9k0V+wa6JR1r8y8O2U+eR+kvjilUcQlnqzPvH6MneIPxkEMCxM200McGV7OGui
         E8Sg==
X-Gm-Message-State: AOAM530f3t0jfvUcB+LQGbvKVQ+YHwJZdhiypPkUTDOk8qnsS8nm0JuT
	lV3iuvMhXrCJy/8s4wHmmqiS
X-Google-Smtp-Source: ABdhPJwlReClAX9+UMTwttFpEG/42fmLGQdm2dkTiZlLNsC/iQnt2ITEHo589IPN6Cc856LjR77ZJQ==
X-Received: by 2002:a17:902:e750:b0:148:a2e8:277b with SMTP id p16-20020a170902e75000b00148a2e8277bmr8449380plf.130.1639642405385;
        Thu, 16 Dec 2021 00:13:25 -0800 (PST)
Received: from localhost.localdomain ([117.193.208.121])
        by smtp.gmail.com with ESMTPSA id u38sm326835pfg.4.2021.12.16.00.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 00:13:25 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: gregkh@linuxfoundation.org
Cc: mhi@lists.linux.dev,
	hemantk@codeaurora.org,
	bbhatt@codeaurora.org,
	loic.poulain@linaro.org,
	thomas.perrot@bootlin.com,
	aleksander@aleksander.es,
	slark_xiao@163.com,
	christophe.jaillet@wanadoo.fr,
	keescook@chromium.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH 07/10] bus: mhi: core: Fix race while handling SYS_ERR at power up
Date: Thu, 16 Dec 2021 13:42:24 +0530
Message-Id: <20211216081227.237749-8-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211216081227.237749-1-manivannan.sadhasivam@linaro.org>
References: <20211216081227.237749-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During SYS_ERR condition, as a response to the MHI_RESET from host, some
devices tend to issue BHI interrupt without clearing the SYS_ERR state in
the device. This creates a race condition and causes a failure in booting
up the device.

The issue is seen on the Sierra Wireless EM9191 modem during SYS_ERR
handling in mhi_async_power_up(). Once the host detects that the device
is in SYS_ERR state, it issues MHI_RESET and waits for the device to
process the reset request. During this time, the device triggers the BHI
interrupt to the host without clearing SYS_ERR condition. So the host
starts handling the SYS_ERR condition again.

To fix this issue, let's register the IRQ handler only after handling the
SYS_ERR check to avoid getting spurious IRQs from the device.

Cc: stable@vger.kernel.org
Fixes: e18d4e9fa79b ("bus: mhi: core: Handle syserr during power_up")
Reported-by: Aleksander Morgado <aleksander@aleksander.es>
Tested-by: Aleksander Morgado <aleksander@aleksander.es>
Tested-by: Thomas Perrot <thomas.perrot@bootlin.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/pm.c | 35 ++++++++++++-----------------------
 1 file changed, 12 insertions(+), 23 deletions(-)

diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index 7464f5d09973..9ae8532df5a3 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -1038,7 +1038,7 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
 	enum mhi_ee_type current_ee;
 	enum dev_st_transition next_state;
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
-	u32 val;
+	u32 interval_us = 25000; /* poll register field every 25 milliseconds */
 	int ret;
 
 	dev_info(dev, "Requested to power ON\n");
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
+		goto error_exit;
 	}
 
 	state = mhi_get_mhi_state(mhi_cntrl);
@@ -1081,20 +1077,12 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
 
 	if (state == MHI_STATE_SYS_ERR) {
 		mhi_set_mhi_state(mhi_cntrl, MHI_STATE_RESET);
-		ret = wait_event_timeout(mhi_cntrl->state_event,
-				MHI_PM_IN_FATAL_STATE(mhi_cntrl->pm_state) ||
-					mhi_read_reg_field(mhi_cntrl,
-							   mhi_cntrl->regs,
-							   MHICTRL,
-							   MHICTRL_RESET_MASK,
-							   MHICTRL_RESET_SHIFT,
-							   &val) ||
-					!val,
-				msecs_to_jiffies(mhi_cntrl->timeout_ms));
-		if (!ret) {
-			ret = -EIO;
+		ret = mhi_poll_reg_field(mhi_cntrl, mhi_cntrl->regs, MHICTRL,
+				 MHICTRL_RESET_MASK, MHICTRL_RESET_SHIFT, 0,
+				 interval_us);
+		if (ret) {
 			dev_info(dev, "Failed to reset MHI due to syserr state\n");
-			goto error_async_power_up;
+			goto error_exit;
 		}
 
 		/*
@@ -1104,6 +1092,10 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
 		mhi_write_reg(mhi_cntrl, mhi_cntrl->bhi, BHI_INTVEC, 0);
 	}
 
+	ret = mhi_init_irq_setup(mhi_cntrl);
+	if (ret)
+		goto error_exit;
+
 	/* Transition to next state */
 	next_state = MHI_IN_PBL(current_ee) ?
 		DEV_ST_TRANSITION_PBL : DEV_ST_TRANSITION_READY;
@@ -1116,10 +1108,7 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
 
 	return 0;
 
-error_async_power_up:
-	mhi_deinit_free_irq(mhi_cntrl);
-
-error_setup_irq:
+error_exit:
 	mhi_cntrl->pm_state = MHI_PM_DISABLE;
 	mutex_unlock(&mhi_cntrl->pm_mutex);
 
-- 
2.25.1

