Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D0C2F2B
	for <mhi@lists.linux.dev>; Wed,  9 Feb 2022 10:06:36 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id u12so1757349plq.10
        for <mhi@lists.linux.dev>; Wed, 09 Feb 2022 02:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Vpuz8aXWI5EYcahKgpkMysw7/xzFPPTFLRAj0oOQKL8=;
        b=P7hJLM6YZaZQPjLA1pOJ9yDXKcypTkzae/u7P8drrhPPD2UeEbBC3D8tc5qk6lbNju
         UUjvdYWGRIVZKI6IHq/M/VB7T+UwFrWUMIi4ez2V+k6zOzZfi+sc/SPE9KUj7SEmI4rM
         yM4ih83UEZJRNz2KPjIBZRHMPxf4jIMj4UWYGxRk05sltGmQqy40zMI40Lw52an1aVSI
         IDp3xKOOo/lk2dHxEVQlyD6W5qQFoXKO5IUCHWyDKeIOBlTm7nZKC9t2Kq9CB+1O0FeK
         rG71mOlquJbGbxLPEuix1V4Lck0DoZWbLfhj3Y+P7n8DW1NGyLIiKLFqFrx82MsZucEp
         2B5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Vpuz8aXWI5EYcahKgpkMysw7/xzFPPTFLRAj0oOQKL8=;
        b=M5nI6FGnxOSEjKaDORD+0c9SxEY9EVi9O3VFcfvCVpbMpnJSvvsh88asVvutCkD8sV
         Mm56JS8qDOGzjeGvu1BN61ZwkK66R0m2g/kj+CiTngjYkv/Yc1G9eLg7Ou6zE58keHhu
         5gQbtC1cby2rl6Cz15Qw8vgdghgq6lXe4V+ORczEgDSlaKMyTSvBDkCo9flPU+9aINgx
         HPoh4xdipzeYrXDQ4sCjDJjCVzGPyZdLetZufIbDy0QldPbryEB4LxdvnOSHNcncQcGZ
         V7A3dHjqUyN5PkNiz34bK6UFcQlx5n6/34gNoyixxnrKE+mfSic+u/lUzcFOTdQRZJrH
         4BJg==
X-Gm-Message-State: AOAM5331JAXGrCaCbCeUn5fL3OijTFm3Y6AWb6zWPOi4Td8ZK7+wbU00
	7/xlPYkP40yGn8xReEAukywDcPRZKbKXN+M=
X-Google-Smtp-Source: ABdhPJyGe+c34R7+fzQjF2ZfE3pPsI7szSOza+8jFqgVf5JakliHqCO6Kk3Ke7NR10PzObN6/ayWfw==
X-Received: by 2002:a17:90b:3808:: with SMTP id mq8mr2562953pjb.225.1644401196016;
        Wed, 09 Feb 2022 02:06:36 -0800 (PST)
Received: from localhost.localdomain ([117.217.179.178])
        by smtp.gmail.com with ESMTPSA id p2sm6722024pfo.125.2022.02.09.02.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 02:06:35 -0800 (PST)
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
Subject: [PATCH v2 15/23] bus: mhi: ep: Add support for processing MHI endpoint interrupts
Date: Wed,  9 Feb 2022 15:26:16 +0530
Message-Id: <20220209095624.26389-16-manivannan.sadhasivam@linaro.org>
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

Add support for processing MHI endpoint interrupts such as control
interrupt, command interrupt and channel interrupt from the host.

The interrupts will be generated in the endpoint device whenever host
writes to the corresponding doorbell registers. The doorbell logic
is handled inside the hardware internally.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/ep/main.c | 113 +++++++++++++++++++++++++++++++++++++-
 include/linux/mhi_ep.h    |   2 +
 2 files changed, 113 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index ed2427f954d7..fed18e34a1d1 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -184,6 +184,56 @@ static void mhi_ep_ring_worker(struct work_struct *work)
 	}
 }
 
+static void mhi_ep_queue_channel_db(struct mhi_ep_cntrl *mhi_cntrl,
+				    unsigned long ch_int, u32 ch_idx)
+{
+	struct device *dev = &mhi_cntrl->mhi_dev->dev;
+	struct mhi_ep_ring_item *item;
+	struct mhi_ep_ring *ring;
+	unsigned int i;
+
+	for_each_set_bit(i, &ch_int, 32) {
+		/* Channel index varies for each register: 0, 32, 64, 96 */
+		i += ch_idx;
+		ring = &mhi_cntrl->mhi_chan[i].ring;
+
+		item = kmalloc(sizeof(*item), GFP_ATOMIC);
+		item->ring = ring;
+
+		dev_dbg(dev, "Queuing doorbell interrupt for channel (%d)\n", i);
+		spin_lock(&mhi_cntrl->list_lock);
+		list_add_tail(&item->node, &mhi_cntrl->ch_db_list);
+		spin_unlock(&mhi_cntrl->list_lock);
+
+		queue_work(mhi_cntrl->ring_wq, &mhi_cntrl->ring_work);
+	}
+}
+
+/*
+ * Channel interrupt statuses are contained in 4 registers each of 32bit length.
+ * For checking all interrupts, we need to loop through each registers and then
+ * check for bits set.
+ */
+static void mhi_ep_check_channel_interrupt(struct mhi_ep_cntrl *mhi_cntrl)
+{
+	u32 ch_int, ch_idx;
+	int i;
+
+	mhi_ep_mmio_read_chdb_status_interrupts(mhi_cntrl);
+
+	for (i = 0; i < MHI_MASK_ROWS_CH_EV_DB; i++) {
+		ch_idx = i * MHI_MASK_CH_EV_LEN;
+
+		/* Only process channel interrupt if the mask is enabled */
+		ch_int = (mhi_cntrl->chdb[i].status & mhi_cntrl->chdb[i].mask);
+		if (ch_int) {
+			mhi_ep_queue_channel_db(mhi_cntrl, ch_int, ch_idx);
+			mhi_ep_mmio_write(mhi_cntrl, MHI_CHDB_INT_CLEAR_A7_n(i),
+							mhi_cntrl->chdb[i].status);
+		}
+	}
+}
+
 static void mhi_ep_state_worker(struct work_struct *work)
 {
 	struct mhi_ep_cntrl *mhi_cntrl = container_of(work, struct mhi_ep_cntrl, state_work);
@@ -221,6 +271,53 @@ static void mhi_ep_state_worker(struct work_struct *work)
 	}
 }
 
+static void mhi_ep_process_ctrl_interrupt(struct mhi_ep_cntrl *mhi_cntrl,
+					 enum mhi_state state)
+{
+	struct mhi_ep_state_transition *item = kmalloc(sizeof(*item), GFP_ATOMIC);
+
+	item->state = state;
+	spin_lock(&mhi_cntrl->list_lock);
+	list_add_tail(&item->node, &mhi_cntrl->st_transition_list);
+	spin_unlock(&mhi_cntrl->list_lock);
+
+	queue_work(mhi_cntrl->state_wq, &mhi_cntrl->state_work);
+}
+
+/*
+ * Interrupt handler that services interrupts raised by the host writing to
+ * MHICTRL and Command ring doorbell (CRDB) registers for state change and
+ * channel interrupts.
+ */
+static irqreturn_t mhi_ep_irq(int irq, void *data)
+{
+	struct mhi_ep_cntrl *mhi_cntrl = data;
+	struct device *dev = &mhi_cntrl->mhi_dev->dev;
+	enum mhi_state state;
+	u32 int_value;
+
+	/* Acknowledge the interrupts */
+	int_value = mhi_ep_mmio_read(mhi_cntrl, MHI_CTRL_INT_STATUS_A7);
+	mhi_ep_mmio_write(mhi_cntrl, MHI_CTRL_INT_CLEAR_A7, int_value);
+
+	/* Check for ctrl interrupt */
+	if (FIELD_GET(MHI_CTRL_INT_STATUS_A7_MSK, int_value)) {
+		dev_dbg(dev, "Processing ctrl interrupt\n");
+		mhi_ep_process_ctrl_interrupt(mhi_cntrl, state);
+	}
+
+	/* Check for command doorbell interrupt */
+	if (FIELD_GET(MHI_CTRL_INT_STATUS_CRDB_MSK, int_value)) {
+		dev_dbg(dev, "Processing command doorbell interrupt\n");
+		queue_work(mhi_cntrl->ring_wq, &mhi_cntrl->ring_work);
+	}
+
+	/* Check for channel interrupts */
+	mhi_ep_check_channel_interrupt(mhi_cntrl);
+
+	return IRQ_HANDLED;
+}
+
 static void mhi_ep_release_device(struct device *dev)
 {
 	struct mhi_ep_device *mhi_dev = to_mhi_ep_device(dev);
@@ -408,7 +505,7 @@ int mhi_ep_register_controller(struct mhi_ep_cntrl *mhi_cntrl,
 	struct mhi_ep_device *mhi_dev;
 	int ret;
 
-	if (!mhi_cntrl || !mhi_cntrl->cntrl_dev || !mhi_cntrl->mmio)
+	if (!mhi_cntrl || !mhi_cntrl->cntrl_dev || !mhi_cntrl->mmio || !mhi_cntrl->irq)
 		return -EINVAL;
 
 	ret = parse_ch_cfg(mhi_cntrl, config);
@@ -453,12 +550,20 @@ int mhi_ep_register_controller(struct mhi_ep_cntrl *mhi_cntrl,
 		goto err_destroy_state_wq;
 	}
 
+	irq_set_status_flags(mhi_cntrl->irq, IRQ_NOAUTOEN);
+	ret = request_irq(mhi_cntrl->irq, mhi_ep_irq, IRQF_TRIGGER_HIGH,
+			  "doorbell_irq", mhi_cntrl);
+	if (ret) {
+		dev_err(mhi_cntrl->cntrl_dev, "Failed to request Doorbell IRQ\n");
+		goto err_ida_free;
+	}
+
 	/* Allocate the controller device */
 	mhi_dev = mhi_ep_alloc_device(mhi_cntrl, MHI_DEVICE_CONTROLLER);
 	if (IS_ERR(mhi_dev)) {
 		dev_err(mhi_cntrl->cntrl_dev, "Failed to allocate controller device\n");
 		ret = PTR_ERR(mhi_dev);
-		goto err_ida_free;
+		goto err_free_irq;
 	}
 
 	dev_set_name(&mhi_dev->dev, "mhi_ep%d", mhi_cntrl->index);
@@ -476,6 +581,8 @@ int mhi_ep_register_controller(struct mhi_ep_cntrl *mhi_cntrl,
 
 err_put_dev:
 	put_device(&mhi_dev->dev);
+err_free_irq:
+	free_irq(mhi_cntrl->irq, mhi_cntrl);
 err_ida_free:
 	ida_free(&mhi_ep_cntrl_ida, mhi_cntrl->index);
 err_destroy_state_wq:
@@ -498,6 +605,8 @@ void mhi_ep_unregister_controller(struct mhi_ep_cntrl *mhi_cntrl)
 	destroy_workqueue(mhi_cntrl->state_wq);
 	destroy_workqueue(mhi_cntrl->ring_wq);
 
+	free_irq(mhi_cntrl->irq, mhi_cntrl);
+
 	kfree(mhi_cntrl->mhi_cmd);
 	kfree(mhi_cntrl->mhi_chan);
 
diff --git a/include/linux/mhi_ep.h b/include/linux/mhi_ep.h
index 72ce30cbe87e..a207058a4991 100644
--- a/include/linux/mhi_ep.h
+++ b/include/linux/mhi_ep.h
@@ -90,6 +90,7 @@ struct mhi_ep_db_info {
  * @chdb_offset: Channel doorbell offset set by the host
  * @erdb_offset: Event ring doorbell offset set by the host
  * @index: MHI Endpoint controller index
+ * @irq: IRQ used by the endpoint controller
  */
 struct mhi_ep_cntrl {
 	struct device *cntrl_dev;
@@ -142,6 +143,7 @@ struct mhi_ep_cntrl {
 	u32 chdb_offset;
 	u32 erdb_offset;
 	int index;
+	int irq;
 };
 
 /**
-- 
2.25.1

