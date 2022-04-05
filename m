Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C742F3A
	for <mhi@lists.linux.dev>; Tue,  5 Apr 2022 13:59:02 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id n8so3993486plh.1
        for <mhi@lists.linux.dev>; Tue, 05 Apr 2022 06:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JVY0XWgEFqKBcBODC2aUro0wfNuh9F1jWG0iBRjJKlc=;
        b=CECHhSi/ChNCnFKW2Ngi29bDNCcnGA/F27Lvfwc5z7aBv8cgV89+bLnAJZXED1q3Rt
         4LYOl3F28MFjBtioSeqm4Y0Po6Ofj8EPYewrSfcdIsdZJr10IW/RIIRCAN2rBu48CJqI
         +pVdaNOgH90MUSkdnMI8re8aei67Zf51SmgwBsLI+qrpI85OgQRnpommdDfFpBu0rSXR
         CvevSEUGmSluIXyF1Zl0wmL1MUwnB966oQlBf4SyBaXcKetVw0PQf14m0Rxgg1B5EAjk
         JrDRs5hyuAnpdSqcFJVXIGyfie366HBo0oNqaT/bDxpAnu2PlB1AiG1K1WLlMB6K9M0K
         6owA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JVY0XWgEFqKBcBODC2aUro0wfNuh9F1jWG0iBRjJKlc=;
        b=TqIp2szTOrhz9EiSRNqLTuKjd47Jf8/Hf0CbsUWngwq+PbeJfXe08Dj/i8IEmerXnF
         7Yoy/gmZXVk/RHGhpf+M/yFeEsQjdsZcYIOLjXRGD3TQwpOzuHvV7/shUZxS3NEQyr+5
         19i/fe+PYrqFQRZ3d3QYQDqTsc0hwvXo5zPy1yVjAlxLZ42GZ88M7drfC0jqVtCq5yFL
         D+hH50KlXxD3VvY2xkQ3LSed19swRnuS6LPFNdSkbQzIchfr6qkmVyeYbMprbkBMnhg+
         uAQ10n+ELWe+w+Z4IxgRKwLU4sSXVR0Mz9zhW+S9gcnoTXecaOZzoUB84tGULQh7h6as
         fy/g==
X-Gm-Message-State: AOAM533PJuOmzqJ1NJeyIcV3M8rN1D+slNprdGt+vQLjRDnAIF+n2RaG
	Oct1QZ1UFDB23r+LEcv3QDn2
X-Google-Smtp-Source: ABdhPJwK3St2JVbbAtrnVzRWtsiBsVw3gbgAM6i1UuW6XZU7wesesimCY8QWNogjeThdPm+Ge5XA7w==
X-Received: by 2002:a17:902:f792:b0:153:1566:18 with SMTP id q18-20020a170902f79200b0015315660018mr3666448pln.115.1649167141703;
        Tue, 05 Apr 2022 06:59:01 -0700 (PDT)
Received: from localhost.localdomain ([59.92.98.98])
        by smtp.gmail.com with ESMTPSA id u14-20020a056a00124e00b004fab8f3245fsm16785402pfi.149.2022.04.05.06.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 06:59:01 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: gregkh@linuxfoundation.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	elder@linaro.org,
	mhi@lists.linux.dev,
	quic_hemantk@quicinc.com,
	quic_bbhatt@quicinc.com,
	quic_jhugo@quicinc.com,
	bjorn.andersson@linaro.org,
	dmitry.baryshkov@linaro.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 11/18] bus: mhi: ep: Add support for handling MHI_RESET
Date: Tue,  5 Apr 2022 19:27:47 +0530
Message-Id: <20220405135754.6622-12-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220405135754.6622-1-manivannan.sadhasivam@linaro.org>
References: <20220405135754.6622-1-manivannan.sadhasivam@linaro.org>
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
index 968025e4d3ac..d36708d43eb6 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -381,6 +381,7 @@ static irqreturn_t mhi_ep_irq(int irq, void *data)
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
 	enum mhi_state state;
 	u32 int_value;
+	bool mhi_reset;
 
 	/* Acknowledge the ctrl interrupt */
 	int_value = mhi_ep_mmio_read(mhi_cntrl, MHI_CTRL_INT_STATUS);
@@ -389,6 +390,14 @@ static irqreturn_t mhi_ep_irq(int irq, void *data)
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
 
@@ -464,6 +473,49 @@ static void mhi_ep_abort_transfer(struct mhi_ep_cntrl *mhi_cntrl)
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
@@ -738,6 +790,7 @@ int mhi_ep_register_controller(struct mhi_ep_cntrl *mhi_cntrl,
 	}
 
 	INIT_WORK(&mhi_cntrl->state_work, mhi_ep_state_worker);
+	INIT_WORK(&mhi_cntrl->reset_work, mhi_ep_reset_worker);
 
 	mhi_cntrl->wq = alloc_workqueue("mhi_ep_wq", 0, 0);
 	if (!mhi_cntrl->wq) {
diff --git a/include/linux/mhi_ep.h b/include/linux/mhi_ep.h
index 9da683e8302c..2f31a54c205f 100644
--- a/include/linux/mhi_ep.h
+++ b/include/linux/mhi_ep.h
@@ -76,6 +76,7 @@ struct mhi_ep_db_info {
  * @ch_db_list: List of queued channel doorbells
  * @wq: Dedicated workqueue for handling rings and state changes
  * @state_work: State transition worker
+ * @reset_work: Worker for MHI Endpoint reset
  * @raise_irq: CB function for raising IRQ to the host
  * @alloc_map: CB function for allocating memory in endpoint for storing host context and mapping it
  * @unmap_free: CB function to unmap and free the allocated memory in endpoint for storing host context
@@ -122,6 +123,7 @@ struct mhi_ep_cntrl {
 
 	struct workqueue_struct *wq;
 	struct work_struct state_work;
+	struct work_struct reset_work;
 
 	void (*raise_irq)(struct mhi_ep_cntrl *mhi_cntrl, u32 vector);
 	int (*alloc_map)(struct mhi_ep_cntrl *mhi_cntrl, u64 pci_addr, phys_addr_t *phys_ptr,
-- 
2.25.1

