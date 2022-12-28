Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F181C08
	for <mhi@lists.linux.dev>; Wed, 28 Dec 2022 16:17:20 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id gv5-20020a17090b11c500b00223f01c73c3so16648034pjb.0
        for <mhi@lists.linux.dev>; Wed, 28 Dec 2022 08:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xfte3Mm+Q7Ad+w1mdjEpYINvANGy6sSgiMeaTWx+ZUM=;
        b=AVus0hl2aWU+oOARmRRFGyJNgBJkZJ01FOmx33rCQRJh5e3ByUiks54iFbVwZwKACE
         Es0ZECVwsUMNP4xRgUeRbGIYwuOwuzZWg+zQYSsYGmdan5/M8sCS2KR8Rq+wqebSZCI0
         YVr/UAo8BFAmVWVKpmhFefnGhsnSDhRUr35t1xUeTDzLBbeso2ykmjX87W7ykNtWQ8dM
         88XMvC3g22yUbDAy61wH2hjFuOIvw9le+qCO2xL/Gls+45derwF9U7ZrVm5i4sWPnrYQ
         TzGUV007cL84pFaCNuETvGaUJwdwMqNrqe01IyqUiglkyeg3XRl5lk7JYq6GalJGln2l
         jRhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xfte3Mm+Q7Ad+w1mdjEpYINvANGy6sSgiMeaTWx+ZUM=;
        b=c4kiAJ+Qxwx8+GXQWEjiZzhi/D3NjHcoDb7W394UQypr1+3pez8zRj9aNnS+xgoA6q
         qDc8oNjn9oWlV2Y2bfJY8fgojvpkPPngrEhp0vC7Zyn17jeY+pOkJB1C2xCEq6oI8tGn
         i+oTtXRHOF9MdaE5gNngpPZkot+GvGVRV963ExPUOdrBJCbiaoIGBYCCK7oS6ArE0VF2
         K6jXxcqNobX8/7FWn13c80hBhCFbFv+BiddXVedlEpIYlSUVEr7ZmNA2h2zR+/lJtULh
         rSEIc9Jpy+tarBxRl/Uzqw//IVJmClQhjOcYCSioJJpg7VR/uKOnriXHvQ8jeCAPtUxn
         opxA==
X-Gm-Message-State: AFqh2kpPWYorBu55OiULMx7dPHpG201tOSi6iCc59X2n2+b5i5gYO0xA
	31QYFj63EJYA78j6GsQeufm1O4aNnlMx+s8=
X-Google-Smtp-Source: AMrXdXuEuym/JhzuETL9tBs/wdXrqO8QQFhK1bOtIXgoB2SzkarO3/+/7Jkb4Pk7gDHgCuIE/ItPZw==
X-Received: by 2002:a17:902:8c8b:b0:189:c536:c745 with SMTP id t11-20020a1709028c8b00b00189c536c745mr27298284plo.2.1672244239307;
        Wed, 28 Dec 2022 08:17:19 -0800 (PST)
Received: from localhost.localdomain ([117.217.178.100])
        by smtp.gmail.com with ESMTPSA id s3-20020a170902c64300b00186abb95bfdsm11256798pls.25.2022.12.28.08.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 08:17:18 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: mhi@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 1/6] bus: mhi: ep: Power up/down MHI stack during MHI RESET
Date: Wed, 28 Dec 2022 21:46:59 +0530
Message-Id: <20221228161704.255268-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221228161704.255268-1-manivannan.sadhasivam@linaro.org>
References: <20221228161704.255268-1-manivannan.sadhasivam@linaro.org>
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
 drivers/bus/mhi/ep/main.c | 35 +++++++----------------------------
 1 file changed, 7 insertions(+), 28 deletions(-)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index 1dc8a3557a46..55209d42a995 100644
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

