Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6E32C82
	for <mhi@lists.linux.dev>; Thu,  2 Dec 2021 11:38:07 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id f125so13498792pgc.0
        for <mhi@lists.linux.dev>; Thu, 02 Dec 2021 03:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nV8vHxyZkpSnq48aLAVk9vWe3JSWpiq16Z/xCyUhjNk=;
        b=Y8YiN5H2VJrW66Jul8DtVt+vPTBGorE5JkAQNt5Pfqh0p1zZffWZMqz+ZgOzkQjQW8
         PU81FmoyDguGJJV6l9fxt6rgDCCNtvMiB0mks1nN6CKlsbnMR13HRODeaDfEbL751WG9
         4Jy4J7F79S37q4xR/TlNyNmLqIMqwvUWLUSf4H8GT9b6KosBheKjhkn3pNgsv0eDe9KL
         F8YqtX3ZgZ/w88OAUVGb4jdHdNrTDYqFBf1oIo2A1n+Sprutp6oEMZfb29AKUqsFft7B
         V8b+4oTAUyzZ4HbkDORrCQhhyb9qMlAWo5TADfv/jgSoETMC2E7kps/ng445CndAeuDt
         jZNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nV8vHxyZkpSnq48aLAVk9vWe3JSWpiq16Z/xCyUhjNk=;
        b=TFJPe/IU2dIIP1KwVKcdiwi3R9Ptwv7NcwyqIzIROrH8f9hzNF3WSX/d0N3CxI/6jj
         VCavzBVpq3WT39+vroglOgET+LxaThPDh1OBK2o9uoxQugTK8QRSMc/KNkNJPt+VJ0eh
         Xv0hrnhgeUB5jH70Q9eHuAvgh4EwsAj1eD5sNvAGXpN0zOhtHZ0vRI1ptCHbNODXgHUw
         4fX+dgmBajjCv9R1PGL+drWmfGFs2UqWAXyMSODzPKEJ8gvsZTqaLDANgZ9rr/UmKihg
         GASyX9uYCVOQr23UTvczNim4vAKTcZJtiw4N+S3JNgLavBDPnkBDn56c5HsDXgNKIitB
         S7EA==
X-Gm-Message-State: AOAM533wE2BVj+KuZspIa9v4Tmq0yDmnOi/ho7dNyYSs5v730qsa/Waw
	YEDENsGYv2ikRPLRGdrzgNjv89YaIqBB
X-Google-Smtp-Source: ABdhPJwpqrSSnOrT7D2SRy1GCdYfVGlS+Hb9qNXef7DD3HfUnGZOuYU/lpSmNu3ustqALzJtRuQmaQ==
X-Received: by 2002:a63:66c7:: with SMTP id a190mr9181345pgc.463.1638445087251;
        Thu, 02 Dec 2021 03:38:07 -0800 (PST)
Received: from localhost.localdomain ([117.202.184.5])
        by smtp.gmail.com with ESMTPSA id h5sm3602552pfi.46.2021.12.02.03.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 03:38:06 -0800 (PST)
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
Subject: [PATCH 14/20] bus: mhi: ep: Add support for powering down the MHI endpoint stack
Date: Thu,  2 Dec 2021 17:05:46 +0530
Message-Id: <20211202113553.238011-15-manivannan.sadhasivam@linaro.org>
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

Add support for MHI endpoint power_down that includes stopping all
available channels, destroying the channels, resetting the event and
transfer rings and freeing the host cache.

The stack will be powered down whenever the physical bus link goes down.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/ep/main.c | 81 +++++++++++++++++++++++++++++++++++++++
 include/linux/mhi_ep.h    |  6 +++
 2 files changed, 87 insertions(+)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index 5f62b6fb6dbc..89d1bb780747 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -21,6 +21,8 @@
 
 static DEFINE_IDA(mhi_ep_cntrl_ida);
 
+static int mhi_ep_destroy_device(struct device *dev, void *data);
+
 static int mhi_ep_send_event(struct mhi_ep_cntrl *mhi_cntrl, u32 event_ring,
 			     struct mhi_ep_ring_element *el)
 {
@@ -485,6 +487,71 @@ static irqreturn_t mhi_ep_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static void mhi_ep_abort_transfer(struct mhi_ep_cntrl *mhi_cntrl)
+{
+	struct mhi_ep_ring *ch_ring, *ev_ring;
+	struct mhi_result result = {};
+	struct mhi_ep_chan *mhi_chan;
+	int i;
+
+	/* Stop all the channels */
+	for (i = 0; i < mhi_cntrl->max_chan; i++) {
+		ch_ring = &mhi_cntrl->mhi_chan[i].ring;
+		if (ch_ring->state == RING_STATE_UINT)
+			continue;
+
+		mhi_chan = &mhi_cntrl->mhi_chan[i];
+		mutex_lock(&mhi_chan->lock);
+		/* Send channel disconnect status to client drivers */
+		if (mhi_chan->xfer_cb) {
+			result.transaction_status = -ENOTCONN;
+			result.bytes_xferd = 0;
+			mhi_chan->xfer_cb(mhi_chan->mhi_dev, &result);
+		}
+
+		/* Set channel state to DISABLED */
+		mhi_chan->state = MHI_CH_STATE_DISABLED;
+		mutex_unlock(&mhi_chan->lock);
+	}
+
+	flush_workqueue(mhi_cntrl->ring_wq);
+	flush_workqueue(mhi_cntrl->state_wq);
+
+	/* Destroy devices associated with all channels */
+	device_for_each_child(&mhi_cntrl->mhi_dev->dev, NULL, mhi_ep_destroy_device);
+
+	/* Stop and reset the transfer rings */
+	for (i = 0; i < mhi_cntrl->max_chan; i++) {
+		ch_ring = &mhi_cntrl->mhi_chan[i].ring;
+		if (ch_ring->state == RING_STATE_UINT)
+			continue;
+
+		mhi_chan = &mhi_cntrl->mhi_chan[i];
+		mutex_lock(&mhi_chan->lock);
+		mhi_ep_ring_stop(mhi_cntrl, ch_ring);
+		mutex_unlock(&mhi_chan->lock);
+	}
+
+	/* Stop and reset the event rings */
+	for (i = 0; i < mhi_cntrl->event_rings; i++) {
+		ev_ring = &mhi_cntrl->mhi_event[i].ring;
+		if (ev_ring->state == RING_STATE_UINT)
+			continue;
+
+		mutex_lock(&mhi_cntrl->event_lock);
+		mhi_ep_ring_stop(mhi_cntrl, ev_ring);
+		mutex_unlock(&mhi_cntrl->event_lock);
+	}
+
+	/* Stop and reset the command ring */
+	mhi_ep_ring_stop(mhi_cntrl, &mhi_cntrl->mhi_cmd->ring);
+
+	mhi_ep_free_host_cfg(mhi_cntrl);
+	mhi_ep_mmio_mask_interrupts(mhi_cntrl);
+
+	mhi_cntrl->is_enabled = false;
+}
+
 int mhi_ep_power_up(struct mhi_ep_cntrl *mhi_cntrl)
 {
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
@@ -541,6 +608,16 @@ int mhi_ep_power_up(struct mhi_ep_cntrl *mhi_cntrl)
 }
 EXPORT_SYMBOL_GPL(mhi_ep_power_up);
 
+void mhi_ep_power_down(struct mhi_ep_cntrl *mhi_cntrl)
+{
+	if (mhi_cntrl->is_enabled)
+		mhi_ep_abort_transfer(mhi_cntrl);
+
+	kfree(mhi_cntrl->mhi_event);
+	disable_irq(mhi_cntrl->irq);
+}
+EXPORT_SYMBOL_GPL(mhi_ep_power_down);
+
 static void mhi_ep_release_device(struct device *dev)
 {
 	struct mhi_ep_device *mhi_dev = to_mhi_ep_device(dev);
@@ -825,6 +902,10 @@ int mhi_ep_register_controller(struct mhi_ep_cntrl *mhi_cntrl,
 }
 EXPORT_SYMBOL_GPL(mhi_ep_register_controller);
 
+/*
+ * It is expected that the controller drivers will power down the MHI EP stack
+ * using "mhi_ep_power_down()" before calling this function to unregister themselves.
+ */
 void mhi_ep_unregister_controller(struct mhi_ep_cntrl *mhi_cntrl)
 {
 	struct mhi_ep_device *mhi_dev = mhi_cntrl->mhi_dev;
diff --git a/include/linux/mhi_ep.h b/include/linux/mhi_ep.h
index 105e8067409a..57fa445661f6 100644
--- a/include/linux/mhi_ep.h
+++ b/include/linux/mhi_ep.h
@@ -257,4 +257,10 @@ void mhi_ep_unregister_controller(struct mhi_ep_cntrl *mhi_cntrl);
  */
 int mhi_ep_power_up(struct mhi_ep_cntrl *mhi_cntrl);
 
+/**
+ * mhi_ep_power_down - Power down the MHI endpoint stack
+ * @mhi_cntrl: MHI controller
+ */
+void mhi_ep_power_down(struct mhi_ep_cntrl *mhi_cntrl);
+
 #endif
-- 
2.25.1

