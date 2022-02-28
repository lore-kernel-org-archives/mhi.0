Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EB253BA
	for <mhi@lists.linux.dev>; Mon, 28 Feb 2022 12:45:46 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id z2so10609293plg.8
        for <mhi@lists.linux.dev>; Mon, 28 Feb 2022 04:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qAd5tuICBA/mz38+wQcupcTon68tNTjrPLc0vh+jMAQ=;
        b=qQxVfAVEFMExkMvXsS7AHxIKwhYGmsWPRMGG9908BwLekSgNvfP2V2u5nkHV52YqBE
         pnpAaKGWzfdtuXxAYcndXjnVkXhSWLHJdGRCedZUSzMlbJ6o7qrpnWbO5tCvA2jDeQcE
         /+KBaLAuQzO/QYQ+azxkqOqn4HA8E9Q865zjo31g+63yuLQiIqjGMod0MmVgeG6ae+WO
         P9Ku2e7YAy9cjcMYqQnPPqXwtCXHd2T5zSTpRpUqki/n40RVKxBMA1BuoIF6GEn7b6O8
         nmxatfLFConM34h744jzMJeghseJQlHJp99F4IIxeb//xzCT9fFE+THCs6Ls2fn9EHzI
         PqUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qAd5tuICBA/mz38+wQcupcTon68tNTjrPLc0vh+jMAQ=;
        b=SFn1ll+vrSvkyx983scyxAWDcuUWYWlGovUuwfeZTDA4UyN9LiwSxnFtmuhs+61tSr
         n+p6aGDqykre80knarSnGM0ztIYVqmykCdCufk9HE9+RqzhE3QEz91oCTAL8He0/UiOq
         77oimIrelnok5fSb5v0qBI5S69ahBDd2SfFj1ZpyoYI+HcSJEunSWhm6EAU7LphFtqGj
         nx3KPH6wUZ7SfjCqQI2ehdE1xF+L2e9ceMQUm2R5SpHGbDi+J+/wZXKq4PNgmTYjNUOD
         UJFPl+gZ02Ui37v5sn/Vn3bntZv/sG3MjoATFzHuaCbTSx2ziRB0dr8pCGub8VKFucsf
         BUWA==
X-Gm-Message-State: AOAM531WUKIqk2cXWfjVz6MdTX7kLSsSOR8bS7GlXqUyp2SArNt4ZfGW
	z/PINfdKnFCZPu4ls14AWpAo54XB+FG3
X-Google-Smtp-Source: ABdhPJzma/V9/rO3NWuMTq3gWTCShWlgDB6cj601A3a/dFpa8yDSYz4T7+l6rPRRv1oK27mCIfVe/A==
X-Received: by 2002:a17:902:f606:b0:14b:4c2d:e1fa with SMTP id n6-20020a170902f60600b0014b4c2de1famr20168442plg.24.1646052345672;
        Mon, 28 Feb 2022 04:45:45 -0800 (PST)
Received: from localhost.localdomain ([117.207.25.37])
        by smtp.gmail.com with ESMTPSA id y12-20020a056a00190c00b004f39e28fb87sm14256737pfi.98.2022.02.28.04.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 04:45:45 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: mhi@lists.linux.dev
Cc: quic_hemantk@quicinc.com,
	quic_bbhatt@quicinc.com,
	quic_jhugo@quicinc.com,
	vinod.koul@linaro.org,
	bjorn.andersson@linaro.org,
	dmitry.baryshkov@linaro.org,
	quic_vbadigan@quicinc.com,
	quic_cang@quicinc.com,
	quic_skananth@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	elder@linaro.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v4 20/27] bus: mhi: ep: Add support for handling MHI_RESET
Date: Mon, 28 Feb 2022 18:13:37 +0530
Message-Id: <20220228124344.77359-21-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220228124344.77359-1-manivannan.sadhasivam@linaro.org>
References: <20220228124344.77359-1-manivannan.sadhasivam@linaro.org>
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

Reviewed-by: Alex Elder <elder@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/ep/main.c | 53 +++++++++++++++++++++++++++++++++++++++
 include/linux/mhi_ep.h    |  2 ++
 2 files changed, 55 insertions(+)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index 4956440273ad..99cbad2a94c9 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -413,6 +413,7 @@ static irqreturn_t mhi_ep_irq(int irq, void *data)
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
 	enum mhi_state state;
 	u32 int_value;
+	bool mhi_reset;
 
 	/* Acknowledge the ctrl interrupt */
 	int_value = mhi_ep_mmio_read(mhi_cntrl, MHI_CTRL_INT_STATUS);
@@ -421,6 +422,14 @@ static irqreturn_t mhi_ep_irq(int irq, void *data)
 	/* Check for ctrl interrupt */
 	if (FIELD_GET(MHI_CTRL_INT_STATUS_MSK, int_value)) {
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
 
@@ -496,6 +505,49 @@ static void mhi_ep_abort_transfer(struct mhi_ep_cntrl *mhi_cntrl)
 	mhi_cntrl->enabled = false;
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
+		mhi_ep_mmio_set_env(mhi_cntrl, MHI_EE_AMSS);
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
@@ -770,6 +822,7 @@ int mhi_ep_register_controller(struct mhi_ep_cntrl *mhi_cntrl,
 	}
 
 	INIT_WORK(&mhi_cntrl->state_work, mhi_ep_state_worker);
+	INIT_WORK(&mhi_cntrl->reset_work, mhi_ep_reset_worker);
 
 	mhi_cntrl->wq = alloc_workqueue("mhi_ep_wq", 0, 0);
 	if (!mhi_cntrl->wq) {
diff --git a/include/linux/mhi_ep.h b/include/linux/mhi_ep.h
index 8e062a4c84f4..e77a7b025430 100644
--- a/include/linux/mhi_ep.h
+++ b/include/linux/mhi_ep.h
@@ -76,6 +76,7 @@ struct mhi_ep_db_info {
  * @ch_db_list: List of queued channel doorbells
  * @wq: Dedicated workqueue for handling rings and state changes
  * @state_work: State transition worker
+ * @reset_work: Worker for MHI Endpoint reset
  * @raise_irq: CB function for raising IRQ to the host
  * @alloc_addr: CB function for allocating memory in endpoint for storing host context
  * @map_addr: CB function for mapping host context to endpoint
@@ -124,6 +125,7 @@ struct mhi_ep_cntrl {
 
 	struct workqueue_struct *wq;
 	struct work_struct state_work;
+	struct work_struct reset_work;
 
 	void (*raise_irq)(struct mhi_ep_cntrl *mhi_cntrl, u32 vector);
 	void __iomem *(*alloc_addr)(struct mhi_ep_cntrl *mhi_cntrl, phys_addr_t *phys_addr,
-- 
2.25.1

