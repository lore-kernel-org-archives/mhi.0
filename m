Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978C92C82
	for <mhi@lists.linux.dev>; Thu,  2 Dec 2021 11:38:13 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id nn15-20020a17090b38cf00b001ac7dd5d40cso4408691pjb.3
        for <mhi@lists.linux.dev>; Thu, 02 Dec 2021 03:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MQpuLNYbNEk4H3hjLraNYlFa80x0Jc5kbBWvJgY8MCY=;
        b=d6pjc/4+ke7zeA04PwXzsExF2m7sEhoOLVk/k2VhBUwUWDp3SV8DHL6yzARWC33RNV
         D9c1WlH1fVTEZKUXPMzdzaFaBQVoxpYa3LQR0/UL+Tkg57By5NFYWLWxfq+UodcfOUzy
         qTZ/sWr6D8/ZqDUySdXVkPpI3SlVcSgbZvkSqM5A2dZKi/lpQcJkPPOJwsjWKvDgmetW
         01UUp2EZT6CHtDyFhBUm5MGm0DjpywpKE1B+M99eTiTx/CWwjr863nu7NDL71rdg9bqD
         9ezYZDdVg1GD3Dn8KSWa7jaV5cKWpWzmx9VxLBtX7QNR+Db5+Z3Iq/PK5HPmSQ3ljd+J
         oljw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MQpuLNYbNEk4H3hjLraNYlFa80x0Jc5kbBWvJgY8MCY=;
        b=73TB1nJdYnfMx3s6EBMEQcz9iohfDQYUamBezKJgCWc8My97fIeFaXxqn58qj02IV2
         X/dHc+WfEr3tSPyKksOJOWHFHFKIdbAuk8//IT2GFPUfXYV4PT7VUEB5zxbnRFjndKKU
         VvQIHrbYhZB+LODwTxC0wULJzwfLlPKZueKluKBk3HXgiEL2Kwg5T4xUzNIeg8sFC+Jp
         qF5BKc/TgCG8pT5UStKACJba552Agit4QOorOJ+goSNGIzdV8ehG8Wky3NLQq4edxeqO
         Ormi92wpSCW15mwzyj8jMO6BqA7K/U/ib9Be2RV54b91LJEJYTMiCI+O+OJmnMvfl9+f
         w/3g==
X-Gm-Message-State: AOAM533/rEl/Z6z+Shjh1WgaBVpzUihpVyI+uxdq8yPesUKkLOUwWh27
	hR2i6TpMLKVWN4FX3UcZWwHPF0O98qml
X-Google-Smtp-Source: ABdhPJzUwEZeU1c8UgjJMRhmgJ+L7SdM1HOzaq0rA8VT+svZDvxm+CT7Gz/AkIeWhio02WDOnUTkoA==
X-Received: by 2002:a17:90b:224f:: with SMTP id hk15mr5399079pjb.173.1638445092509;
        Thu, 02 Dec 2021 03:38:12 -0800 (PST)
Received: from localhost.localdomain ([117.202.184.5])
        by smtp.gmail.com with ESMTPSA id h5sm3602552pfi.46.2021.12.02.03.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 03:38:12 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: mhi@lists.linux.dev
Cc: hemantk@codeaurora.org,
	bbhatt@codeaurora.org,
	quic_jhugo@quicinc.com,
	vinod.koul@linaro.org,
	bjorn.andersson@linaro.org,
	dmitry.baryshkov@linaro.org,
	skananth@codeaurora.org,
	vpernami@codeaurora.org,
	vbadigan@codeaurora.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 15/20] bus: mhi: ep: Add support for handling MHI_RESET
Date: Thu,  2 Dec 2021 17:05:47 +0530
Message-Id: <20211202113553.238011-16-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211202113553.238011-1-manivannan.sadhasivam@linaro.org>
References: <20211202113553.238011-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for handling MHI_RESET in MHI endpoint stack. MHI_RESET will
be issued by the host during shutdown and during error scenario so that
it can recover the endpoint device without restarting the whole device.

MHI_RESET handling involves resetting the internal MHI registers, data
structures, state machines, resetting all channels/rings and setting
MHICTRL.RESET bit to 0. Additionally the device will also move to READY
state if the reset was due to SYS_ERR.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/ep/main.c | 53 +++++++++++++++++++++++++++++++++++++++
 include/linux/mhi_ep.h    |  2 ++
 2 files changed, 55 insertions(+)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index 89d1bb780747..0b0fad6bf69a 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -464,6 +464,7 @@ static irqreturn_t mhi_ep_irq(int irq, void *data)
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
 	enum mhi_state state;
 	u32 int_value = 0;
+	bool mhi_reset;
 
 	/* Acknowledge the interrupts */
 	mhi_ep_mmio_read(mhi_cntrl, MHI_CTRL_INT_STATUS_A7, &int_value);
@@ -472,6 +473,14 @@ static irqreturn_t mhi_ep_irq(int irq, void *data)
 	/* Check for ctrl interrupt */
 	if (FIELD_GET(MHI_CTRL_INT_STATUS_A7_MSK, int_value)) {
 		dev_dbg(dev, "Processing ctrl interrupt\n");
+		mhi_ep_mmio_get_mhi_state(mhi_cntrl, &state, &mhi_reset);
+		if (mhi_reset) {
+			dev_info(dev, "Host triggered MHI reset!\n");
+			disable_irq_nosync(mhi_cntrl->irq);
+			schedule_work(&mhi_cntrl->reset_work);
+			return IRQ_HANDLED;
+		}
+
 		mhi_ep_process_ctrl_interrupt(mhi_cntrl, state);
 	}
 
@@ -552,6 +561,49 @@ static void mhi_ep_abort_transfer(struct mhi_ep_cntrl *mhi_cntrl)
 	mhi_cntrl->is_enabled = false;
 }
 
+static void mhi_ep_reset_worker(struct work_struct *work)
+{
+	struct mhi_ep_cntrl *mhi_cntrl = container_of(work, struct mhi_ep_cntrl, reset_work);
+	struct device *dev = &mhi_cntrl->mhi_dev->dev;
+	enum mhi_state cur_state;
+	int ret;
+
+	mhi_ep_abort_transfer(mhi_cntrl);
+
+	spin_lock_bh(&mhi_cntrl->state_lock);
+	/* Reset MMIO to signal host that the MHI_RESET is completed in endpoint */
+	mhi_ep_mmio_reset(mhi_cntrl);
+	cur_state = mhi_cntrl->mhi_state;
+	spin_unlock_bh(&mhi_cntrl->state_lock);
+
+	/*
+	 * Only proceed further if the reset is due to SYS_ERR. The host will
+	 * issue reset during shutdown also and we don't need to do re-init in
+	 * that case.
+	 */
+	if (cur_state == MHI_STATE_SYS_ERR) {
+		mhi_ep_mmio_init(mhi_cntrl);
+
+		/* Set AMSS EE before signaling ready state */
+		mhi_ep_mmio_set_env(mhi_cntrl, MHI_EP_AMSS_EE);
+
+		/* All set, notify the host that we are ready */
+		ret = mhi_ep_set_ready_state(mhi_cntrl);
+		if (ret)
+			return;
+
+		dev_dbg(dev, "READY state notification sent to the host\n");
+
+		ret = mhi_ep_enable(mhi_cntrl);
+		if (ret) {
+			dev_err(dev, "Failed to enable MHI endpoint: %d\n", ret);
+			return;
+		}
+
+		enable_irq(mhi_cntrl->irq);
+	}
+}
+
 int mhi_ep_power_up(struct mhi_ep_cntrl *mhi_cntrl)
 {
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
@@ -824,6 +876,7 @@ int mhi_ep_register_controller(struct mhi_ep_cntrl *mhi_cntrl,
 
 	INIT_WORK(&mhi_cntrl->ring_work, mhi_ep_ring_worker);
 	INIT_WORK(&mhi_cntrl->state_work, mhi_ep_state_worker);
+	INIT_WORK(&mhi_cntrl->reset_work, mhi_ep_reset_worker);
 
 	mhi_cntrl->ring_wq = alloc_ordered_workqueue("mhi_ep_ring_wq", WQ_HIGHPRI);
 	if (!mhi_cntrl->ring_wq) {
diff --git a/include/linux/mhi_ep.h b/include/linux/mhi_ep.h
index 57fa445661f6..6482b0c91865 100644
--- a/include/linux/mhi_ep.h
+++ b/include/linux/mhi_ep.h
@@ -75,6 +75,7 @@ struct mhi_ep_db_info {
  * @ring_wq: Dedicated workqueue for processing MHI rings
  * @state_work: State transition worker
  * @ring_work: Ring worker
+ * @reset_work: Worker for MHI Endpoint reset
  * @ch_db_list: List of queued channel doorbells
  * @st_transition_list: List of state transitions
  * @list_lock: Lock for protecting state transition and channel doorbell lists
@@ -123,6 +124,7 @@ struct mhi_ep_cntrl {
 	struct workqueue_struct	*ring_wq;
 	struct work_struct state_work;
 	struct work_struct ring_work;
+	struct work_struct reset_work;
 
 	struct list_head ch_db_list;
 	struct list_head st_transition_list;
-- 
2.25.1

