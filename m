Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C554615A7
	for <mhi@lists.linux.dev>; Mon,  2 May 2022 04:39:52 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id k1so3018710pll.4
        for <mhi@lists.linux.dev>; Sun, 01 May 2022 21:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Q6JAdcJJ5Qoz6lAJknf+7RgOR6g1kzTLvudjVEl/CYY=;
        b=k9DoJBIeLjtq7XTDsgDYhnunfFtS3OjDrzj25MKoXmKOVHaSvYwy4wWxKR7RLP1C4p
         ahOFyr2uL2oR+LXLd1Xh0rjo/t83aM/td7si3cf3mwZAEQf7QdnI95XorOKffwUqxhai
         KfWzGfOzeBSYn+20ZegeUpXcHtSJZFqABrsm2nZogrmy8eCLI9O/G9URUmLNNnyYIdiU
         7omSW+Ib7TyNhC0W/oL0C2bMp3oaR9c7g20RfYRYu9+tefwj2DrAG9HMXnE3yxHbr4mj
         tKDFYgtBNKK/IkK6k0bdPwx/P74KUgXErxS8IC6NUtus3pAh/uy13mXV+8BpjexUCZri
         zSGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Q6JAdcJJ5Qoz6lAJknf+7RgOR6g1kzTLvudjVEl/CYY=;
        b=ZYs2yplFTL5UzIy906It9dDZC5WGFeAExzS3JQOOY8KfXJCyy2RsJgB3+lt+IbdEQy
         cX7u/TSBWNobs5APs5vz3pOfDLnZYgs/MqlrJ2yX7kayUVqwY1KjH6i82m3jz1xEbOfc
         qnqKBUZ4PjpiP+psHXnnhr042zrrsKMB4p3oedQftcVWvmhPknXSMSf0VZfxvrLOpbGI
         9BbwIxzMsZ/6w+bXwsn2gpTv5+4j5PktyLO1sSxtQ6nLhiUoHPLo3Y/kBvtcD68MbC/u
         otCQAdzIUjp/5PAN3fW/6JwuixkEQ82ZBFeglDPAMgyo/7AbWpFluNGtRVQ4rAXKcaIo
         c/ww==
X-Gm-Message-State: AOAM5333DkXPY8uUvwsjqC2Nv2RtKg0nacIdE36iGn67hkxC5EHYMBxa
	4erTtbVCeTxIh3+ABWkC0FejzjIfBUlm
X-Google-Smtp-Source: ABdhPJws5mLlqRV9/kn0AvQrQHPyMTyEdrmcG2GWvpHvmg9kKNkP/Ht87dmDzG//yhrRrCUyc0qasg==
X-Received: by 2002:a17:90a:dd46:b0:1b8:8:7303 with SMTP id u6-20020a17090add4600b001b800087303mr16177172pjv.197.1651466392013;
        Sun, 01 May 2022 21:39:52 -0700 (PDT)
Received: from localhost.localdomain ([27.111.75.99])
        by smtp.gmail.com with ESMTPSA id s25-20020a62e719000000b0050dc76281cbsm3644657pfh.165.2022.05.01.21.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 May 2022 21:39:51 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: mhi@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quic_hemantk@quicinc.com,
	quic_bbhatt@quicinc.com,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2] bus: mhi: ep: Power up/down MHI stack during MHI RESET
Date: Mon,  2 May 2022 10:09:46 +0530
Message-Id: <20220502043946.24432-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During graceful shutdown scenario, host will issue MHI RESET to the
endpoint device before initiating shutdown. In that case, it makes sense
to completely power down the MHI stack as sooner or later the access to
MMIO registers will be prohibited. Also, the stack needs to be powered
up in the case of SYS_ERR to recover the device.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---

Changes in v2:

* Removed unused variables

 drivers/bus/mhi/ep/main.c | 35 +++++++----------------------------
 1 file changed, 7 insertions(+), 28 deletions(-)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index 40109a79017a..59fe8633d4c9 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -973,11 +973,9 @@ static void mhi_ep_abort_transfer(struct mhi_ep_cntrl *mhi_cntrl)
 static void mhi_ep_reset_worker(struct work_struct *work)
 {
 	struct mhi_ep_cntrl *mhi_cntrl = container_of(work, struct mhi_ep_cntrl, reset_work);
-	struct device *dev = &mhi_cntrl->mhi_dev->dev;
 	enum mhi_state cur_state;
-	int ret;
 
-	mhi_ep_abort_transfer(mhi_cntrl);
+	mhi_ep_power_down(mhi_cntrl);
 
 	spin_lock_bh(&mhi_cntrl->state_lock);
 	/* Reset MMIO to signal host that the MHI_RESET is completed in endpoint */
@@ -990,27 +988,8 @@ static void mhi_ep_reset_worker(struct work_struct *work)
 	 * issue reset during shutdown also and we don't need to do re-init in
 	 * that case.
 	 */
-	if (cur_state == MHI_STATE_SYS_ERR) {
-		mhi_ep_mmio_init(mhi_cntrl);
-
-		/* Set AMSS EE before signaling ready state */
-		mhi_ep_mmio_set_env(mhi_cntrl, MHI_EE_AMSS);
-
-		/* All set, notify the host that we are ready */
-		ret = mhi_ep_set_ready_state(mhi_cntrl);
-		if (ret)
-			return;
-
-		dev_dbg(dev, "READY state notification sent to the host\n");
-
-		ret = mhi_ep_enable(mhi_cntrl);
-		if (ret) {
-			dev_err(dev, "Failed to enable MHI endpoint: %d\n", ret);
-			return;
-		}
-
-		enable_irq(mhi_cntrl->irq);
-	}
+	if (cur_state == MHI_STATE_SYS_ERR)
+		mhi_ep_power_up(mhi_cntrl);
 }
 
 /*
@@ -1089,11 +1068,11 @@ EXPORT_SYMBOL_GPL(mhi_ep_power_up);
 
 void mhi_ep_power_down(struct mhi_ep_cntrl *mhi_cntrl)
 {
-	if (mhi_cntrl->enabled)
+	if (mhi_cntrl->enabled) {
 		mhi_ep_abort_transfer(mhi_cntrl);
-
-	kfree(mhi_cntrl->mhi_event);
-	disable_irq(mhi_cntrl->irq);
+		kfree(mhi_cntrl->mhi_event);
+		disable_irq(mhi_cntrl->irq);
+	}
 }
 EXPORT_SYMBOL_GPL(mhi_ep_power_down);
 
-- 
2.25.1

