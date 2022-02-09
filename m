Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0F72F2B
	for <mhi@lists.linux.dev>; Wed,  9 Feb 2022 10:06:54 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id ki18-20020a17090ae91200b001b8be87e9abso3510670pjb.1
        for <mhi@lists.linux.dev>; Wed, 09 Feb 2022 02:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4o9xCQUHVRvja/FToQCLxxhmJS9+mNwbw+kIoBrp6zw=;
        b=gx7iHvWuC+9XU8vKL8OuEBuOE52BrYE3H3qd+1iRgs6ImoYrxga9CePaAeuyaB67Jn
         eiK2bp8QDmc1T1RiNWCs1owh1bU3kFQfAe1L+mCLHSFDE3sE5OMdRfoUwer/xjyYkFxH
         C6u5UOxvFtqNmCxhwgWbir5MZdpWgSRqplMzXGVxdGgvsNUgiKUjYyyT9g+0iAgNWeAt
         ZVZ09Nsf68wYitS5rt4Ol7gu7EsTlmAqesy4bt5vSP56Lg8ddDoAJlS4XmahbLeO8Qhe
         rbHCePSPgmv7XswKmu9BwBP3j95GzafhKjd4OGv3QnsYcWAM1HrEkn4pv9ID0tbUPt40
         c26A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4o9xCQUHVRvja/FToQCLxxhmJS9+mNwbw+kIoBrp6zw=;
        b=QzJF6/ztxIXsZstIIFD5T3Ns41VO/jYmS3R77Xjty8J7FIAj1s4QZj97thxPYXfRK1
         zA0yj0d9GFHfdutY9wNQr248h5d5K7vOEgjMNy27hjJp/ZrJaTjyZST8Lpu0qU0nMFUc
         c7GA+PGaplYwX68sZOgKJvNM9/Kx9shozGKG2QIL8DVcVPvUAiaL8/yXN2g1a9siJML7
         I9SLivWe+p4Yug07vsdyPmDxTlAqBXM5EdODka0WFYo5XEcVGd6mDG/a8Rex+6L8aTj7
         ReoZTqvNX+7Vd2rNGu9wlSzC+UJJuNSRMShRGwEQUKMv/YI/TD0qmB/ajbqhqHx8IQv9
         RN8A==
X-Gm-Message-State: AOAM533CpG/y/qAXtJslQREJC+O2disUrbsMCpy/zKs38U9CvhYndUFZ
	BiyIn4WY2a6NYcpkErhAZfeDe4tDk6KGTyo=
X-Google-Smtp-Source: ABdhPJx536QW/Ho9u8GXzCDchikyLTE3xYhc8KXip2Z5k20UZiYQYVrp1c6TOdkP3PBH+s6nZo7wyA==
X-Received: by 2002:a17:90a:2ac4:: with SMTP id i4mr2539391pjg.204.1644401213435;
        Wed, 09 Feb 2022 02:06:53 -0800 (PST)
Received: from localhost.localdomain ([117.217.179.178])
        by smtp.gmail.com with ESMTPSA id p2sm6722024pfo.125.2022.02.09.02.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 02:06:53 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: mhi@lists.linux.dev
Cc: quic_hemantk@quicinc.com,
	quic_bbhatt@quicinc.com,
	quic_jhugo@quicinc.com,
	vinod.koul@linaro.org,
	bjorn.andersson@linaro.org,
	dmitry.baryshkov@linaro.org,
	vbadigan@codeaurora.org,
	quic_cang@quicinc.com,
	quic_skananth@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	elder@linaro.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 18/23] bus: mhi: ep: Add support for handling MHI_RESET
Date: Wed,  9 Feb 2022 15:26:19 +0530
Message-Id: <20220209095624.26389-19-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220209095624.26389-1-manivannan.sadhasivam@linaro.org>
References: <20220209095624.26389-1-manivannan.sadhasivam@linaro.org>
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
index 905d91dd67c0..7d7757784dde 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -470,6 +470,7 @@ static irqreturn_t mhi_ep_irq(int irq, void *data)
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
 	enum mhi_state state;
 	u32 int_value;
+	bool mhi_reset;
 
 	/* Acknowledge the interrupts */
 	int_value = mhi_ep_mmio_read(mhi_cntrl, MHI_CTRL_INT_STATUS_A7);
@@ -478,6 +479,14 @@ static irqreturn_t mhi_ep_irq(int irq, void *data)
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
 
@@ -558,6 +567,49 @@ static void mhi_ep_abort_transfer(struct mhi_ep_cntrl *mhi_cntrl)
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
@@ -826,6 +878,7 @@ int mhi_ep_register_controller(struct mhi_ep_cntrl *mhi_cntrl,
 
 	INIT_WORK(&mhi_cntrl->ring_work, mhi_ep_ring_worker);
 	INIT_WORK(&mhi_cntrl->state_work, mhi_ep_state_worker);
+	INIT_WORK(&mhi_cntrl->reset_work, mhi_ep_reset_worker);
 
 	mhi_cntrl->ring_wq = alloc_workqueue("mhi_ep_ring_wq", 0, 0);
 	if (!mhi_cntrl->ring_wq) {
diff --git a/include/linux/mhi_ep.h b/include/linux/mhi_ep.h
index 4f86e7986c93..276d29fef465 100644
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
@@ -126,6 +127,7 @@ struct mhi_ep_cntrl {
 	struct workqueue_struct	*ring_wq;
 	struct work_struct state_work;
 	struct work_struct ring_work;
+	struct work_struct reset_work;
 
 	struct list_head ch_db_list;
 	struct list_head st_transition_list;
-- 
2.25.1

