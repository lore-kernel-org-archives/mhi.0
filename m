Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C153C7C
	for <mhi@lists.linux.dev>; Sat, 12 Feb 2022 18:23:11 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id i30so21933719pfk.8
        for <mhi@lists.linux.dev>; Sat, 12 Feb 2022 10:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ng+FJmRFoQc89QlNXGEu6Nz+DsWMowqD6JzTm0cBnHI=;
        b=VPJI5RfGfxcBSf0QCISXQcbfstewq+3Xs+C4gL6WufagubJPmyHN1LYFaXIqL+YlHz
         uIAzpSjT5zk7jpumLD3QfrKQhj3xn5kGYFV5jNqIDx/rtokTPd8Ha7wvaJKeUwAM8bum
         HP2OhF0laEajy6uQVBDTxSssHFmyF1ZI1JEXWoszjyLyJD0nJWiKT8Hw8ObO/FNuJ1Qq
         R4bTaty9M3qIo/tQ9N0Z4g5Ei9uEFtTn4eyArgXPkIHKAz+fIn6CXjS3+JoQplEsxgbA
         Bbo5M/ycAM8KLD+TR7m17FbqyfP53rA/ojJd8EcCnmU9nsnO3RnU5NoqBskCILFHmIXL
         T+HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ng+FJmRFoQc89QlNXGEu6Nz+DsWMowqD6JzTm0cBnHI=;
        b=jHY9Zpj4RuLqFQMkfFYzdxyfWbGACBje9+B6lum5L75q+FefxfenLCjpg7ua7TJ6BR
         RzzHZOAAZE+OJMjQAy1efNKM+YcGtby97/mFotQkVZ5Rth9MQMkDnGgVi7pd38BSHzEq
         Ke8lPd3mtcQPghw8vxNyZNVKUPgjTHAC627ynwsi5yvJ7uzMWjI+AQblb1nqSAGTlXm+
         4XSIkN1i9wpDblJREnE/tTqfKEus/njsexDTEXGnn61zto03SK58rDIWfsKievZHMELQ
         OQ1j6r0RE3VkI7raxd0xOFbIlcgw2nzHmRT9GmM1dJsq8/NM0LqBa/cfYnQ7RVdkBNoE
         Z7KQ==
X-Gm-Message-State: AOAM533C9c0v45Nha8W2f7vyqQpOeyojGERiY9a5K32VufYZPIGqYLHY
	GiGhvestJEkZ5dfnNpUW8aDWhVmH124j3EE=
X-Google-Smtp-Source: ABdhPJxzQw7S9tasrOjpKXFp+CMbejZJTVo1V7X6T1PPGnxNyTmSRhp1q/FXC/uKEFOs432QgWAE4A==
X-Received: by 2002:a65:458f:: with SMTP id o15mr4100193pgq.92.1644690191159;
        Sat, 12 Feb 2022 10:23:11 -0800 (PST)
Received: from localhost.localdomain ([27.111.75.57])
        by smtp.gmail.com with ESMTPSA id g12sm14961987pfj.148.2022.02.12.10.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Feb 2022 10:23:10 -0800 (PST)
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
Subject: [PATCH v3 18/25] bus: mhi: ep: Add support for handling MHI_RESET
Date: Sat, 12 Feb 2022 23:51:10 +0530
Message-Id: <20220212182117.49438-19-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220212182117.49438-1-manivannan.sadhasivam@linaro.org>
References: <20220212182117.49438-1-manivannan.sadhasivam@linaro.org>
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
index 14cb08de4263..ddedd0fb19aa 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -471,6 +471,7 @@ static irqreturn_t mhi_ep_irq(int irq, void *data)
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
 	enum mhi_state state;
 	u32 int_value;
+	bool mhi_reset;
 
 	/* Acknowledge the interrupts */
 	int_value = mhi_ep_mmio_read(mhi_cntrl, MHI_CTRL_INT_STATUS_A7);
@@ -479,6 +480,14 @@ static irqreturn_t mhi_ep_irq(int irq, void *data)
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
 
@@ -559,6 +568,49 @@ static void mhi_ep_abort_transfer(struct mhi_ep_cntrl *mhi_cntrl)
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
@@ -827,6 +879,7 @@ int mhi_ep_register_controller(struct mhi_ep_cntrl *mhi_cntrl,
 
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

