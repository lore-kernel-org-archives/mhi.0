Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD122C82
	for <mhi@lists.linux.dev>; Thu,  2 Dec 2021 11:37:47 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id 133so8597377pgc.12
        for <mhi@lists.linux.dev>; Thu, 02 Dec 2021 03:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8f7zzXKVcLX/dqa48zIkMnAKOzRJcJHZ6VvK4PzmNdM=;
        b=cYZHNmuiNkDaLaDpepX+4T5ZGpmGqI9b+2oJh5CvRFOYdUff6keezBOmYE88HDGmEc
         IpykMpEUoMDlayxW0Uh/PX4xDVtVbULgaw0TDQToYbfz3XGgHy/pTZOYevTjeTjidZzh
         D4SNZd6Qf68MS/qp0fx6OCvdH80cigAbmPRzWR+54kYK/ahg7UpML1hJO5oLgNdAToIa
         NKgCtUqAncjjy8YEEGLLFionHv78WSFrTb/dkEntVlxFyrXZOIRVluzohrjmZgnFQV+u
         G1e2lMnHLbX3yxVx0KiyangryHe/PcljeGwKdlDs2DuKSHn1Why6qAEbOd6a5HauwkhV
         +WDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8f7zzXKVcLX/dqa48zIkMnAKOzRJcJHZ6VvK4PzmNdM=;
        b=sEaLigOANF4DCqExC3DUShd9GoJWYVuq5ULQkRcP39f/7/EeaPeXk6cs2XYK2WMhvZ
         ewZEhCKbe0JfSP+Y7EoY4PHJqg9TZ0zsRu1usJRXjkyb7MZ7wJTrrxTfrT7wblnsjK6n
         2Kgtmen16N9Ok0VIE5gZyB8JI9X+bIFV7Lb3t8tyKpNGH7NCwnPbBIVJx//R4170wx/K
         MlgZo6lPHne+PZ+q1VWnQ7P1rxWXePVDEM2hIKpbFPVYGI0NBUUwNSv2lLSIGSN/ic/E
         6BYoCwQTGXN5Hof1xS77n530x8j46DxkDU6fHMGtO9K3+x6pCNWvLigeyIJp9mvTgsEO
         HtIw==
X-Gm-Message-State: AOAM5300Ra+n5LoqygSB1c2MLjy1Zl2tM24jR5e5EkwLAqXxpT4JJREH
	6Bx/vDVZygO+xl+YjZ7bVJ5QZsj8DEYe
X-Google-Smtp-Source: ABdhPJz59UVu2atFTvt4iRGhhE5UhVfFfc/L/4EQIIAWRhG95naOeowbEWy/PE8mxPePKoE6Kugmvg==
X-Received: by 2002:aa7:9d9e:0:b0:4a0:25d0:a06f with SMTP id f30-20020aa79d9e000000b004a025d0a06fmr12272302pfq.82.1638445066983;
        Thu, 02 Dec 2021 03:37:46 -0800 (PST)
Received: from localhost.localdomain ([117.202.184.5])
        by smtp.gmail.com with ESMTPSA id h5sm3602552pfi.46.2021.12.02.03.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 03:37:46 -0800 (PST)
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
Subject: [PATCH 10/20] bus: mhi: ep: Add support for sending events to the host
Date: Thu,  2 Dec 2021 17:05:42 +0530
Message-Id: <20211202113553.238011-11-manivannan.sadhasivam@linaro.org>
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

Add support for sending the events to the host over MHI bus from the
endpoint. Following events are supported:

1. Transfer completion event
2. Command completion event
3. State change event
4. Execution Environment (EE) change event

An event is sent whenever an operation has been completed in the MHI EP
device. Event is sent using the MHI event ring and additionally the host
is notified using an IRQ if required.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/ep/internal.h |   4 ++
 drivers/bus/mhi/ep/main.c     | 126 ++++++++++++++++++++++++++++++++++
 include/linux/mhi_ep.h        |   2 +
 3 files changed, 132 insertions(+)

diff --git a/drivers/bus/mhi/ep/internal.h b/drivers/bus/mhi/ep/internal.h
index a7a4e6934f7d..3551e673d99a 100644
--- a/drivers/bus/mhi/ep/internal.h
+++ b/drivers/bus/mhi/ep/internal.h
@@ -214,4 +214,8 @@ void mhi_ep_mmio_get_mhi_state(struct mhi_ep_cntrl *mhi_cntrl, enum mhi_state *s
 void mhi_ep_mmio_init(struct mhi_ep_cntrl *mhi_cntrl);
 void mhi_ep_mmio_update_ner(struct mhi_ep_cntrl *mhi_cntrl);
 
+/* MHI EP core functions */
+int mhi_ep_send_state_change_event(struct mhi_ep_cntrl *mhi_cntrl, enum mhi_state state);
+int mhi_ep_send_ee_event(struct mhi_ep_cntrl *mhi_cntrl, enum mhi_ep_execenv exec_env);
+
 #endif
diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index 6d448d42f527..999784eadb65 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -18,6 +18,131 @@
 
 static DEFINE_IDA(mhi_ep_cntrl_ida);
 
+static int mhi_ep_send_event(struct mhi_ep_cntrl *mhi_cntrl, u32 event_ring,
+			     struct mhi_ep_ring_element *el)
+{
+	struct mhi_ep_ring *ring = &mhi_cntrl->mhi_event[event_ring].ring;
+	struct device *dev = &mhi_cntrl->mhi_dev->dev;
+	union mhi_ep_ring_ctx *ctx;
+	int ret;
+
+	mutex_lock(&mhi_cntrl->event_lock);
+	ctx = (union mhi_ep_ring_ctx *)&mhi_cntrl->ev_ctx_cache[event_ring];
+	if (ring->state == RING_STATE_UINT) {
+		ret = mhi_ep_ring_start(mhi_cntrl, ring, ctx);
+		if (ret) {
+			dev_err(dev, "Error starting event ring (%d)\n", event_ring);
+			goto err_unlock;
+		}
+	}
+
+	/* Add element to the primary event ring (0) */
+	ret = mhi_ep_ring_add_element(ring, el, 0);
+	if (ret) {
+		dev_err(dev, "Error adding element to event ring (%d)\n", event_ring);
+		goto err_unlock;
+	}
+
+	/* Ensure that the ring pointer gets updated in host memory before triggering IRQ */
+	wmb();
+
+	mutex_unlock(&mhi_cntrl->event_lock);
+
+	/*
+	 * Raise IRQ to host only if the BEI flag is not set in TRE. Host might
+	 * set this flag for interrupt moderation as per MHI protocol.
+	 */
+	if (!MHI_EP_TRE_GET_BEI(el))
+		mhi_cntrl->raise_irq(mhi_cntrl);
+
+	return 0;
+
+err_unlock:
+	mutex_unlock(&mhi_cntrl->event_lock);
+
+	return ret;
+}
+
+static int mhi_ep_send_completion_event(struct mhi_ep_cntrl *mhi_cntrl,
+					struct mhi_ep_ring *ring, u32 len,
+					enum mhi_ev_ccs code)
+{
+	struct mhi_ep_ring_element event = {};
+	u32 er_index, tmp;
+
+	er_index = mhi_cntrl->ch_ctx_cache[ring->ch_id].erindex;
+	event.ptr = ring->ring_ctx->generic.rbase +
+			ring->rd_offset * sizeof(struct mhi_ep_ring_element);
+
+	tmp = event.dword[0];
+	tmp |= MHI_TRE_EV_DWORD0(code, len);
+	event.dword[0] = tmp;
+
+	tmp = event.dword[1];
+	tmp |= MHI_TRE_EV_DWORD1(ring->ch_id, MHI_PKT_TYPE_TX_EVENT);
+	event.dword[1] = tmp;
+
+	return mhi_ep_send_event(mhi_cntrl, er_index, &event);
+}
+
+int mhi_ep_send_state_change_event(struct mhi_ep_cntrl *mhi_cntrl, enum mhi_state state)
+{
+	struct mhi_ep_ring_element event = {};
+	u32 tmp;
+
+	tmp = event.dword[0];
+	tmp |= MHI_SC_EV_DWORD0(state);
+	event.dword[0] = tmp;
+
+	tmp = event.dword[1];
+	tmp |= MHI_SC_EV_DWORD1(MHI_PKT_TYPE_STATE_CHANGE_EVENT);
+	event.dword[1] = tmp;
+
+	return mhi_ep_send_event(mhi_cntrl, 0, &event);
+}
+
+int mhi_ep_send_ee_event(struct mhi_ep_cntrl *mhi_cntrl, enum mhi_ep_execenv exec_env)
+{
+	struct mhi_ep_ring_element event = {};
+	u32 tmp;
+
+	tmp = event.dword[0];
+	tmp |= MHI_EE_EV_DWORD0(exec_env);
+	event.dword[0] = tmp;
+
+	tmp = event.dword[1];
+	tmp |= MHI_SC_EV_DWORD1(MHI_PKT_TYPE_EE_EVENT);
+	event.dword[1] = tmp;
+
+	return mhi_ep_send_event(mhi_cntrl, 0, &event);
+}
+
+static int mhi_ep_send_cmd_comp_event(struct mhi_ep_cntrl *mhi_cntrl, enum mhi_ev_ccs code)
+{
+	struct device *dev = &mhi_cntrl->mhi_dev->dev;
+	struct mhi_ep_ring_element event = {};
+	u32 tmp;
+
+	if (code > MHI_EV_CC_BAD_TRE) {
+		dev_err(dev, "Invalid command completion code: %d\n", code);
+		return -EINVAL;
+	}
+
+	event.ptr = mhi_cntrl->cmd_ctx_cache->rbase
+			+ (mhi_cntrl->mhi_cmd->ring.rd_offset *
+			(sizeof(struct mhi_ep_ring_element)));
+
+	tmp = event.dword[0];
+	tmp |= MHI_CC_EV_DWORD0(code);
+	event.dword[0] = tmp;
+
+	tmp = event.dword[1];
+	tmp |= MHI_CC_EV_DWORD1(MHI_PKT_TYPE_CMD_COMPLETION_EVENT);
+	event.dword[1] = tmp;
+
+	return mhi_ep_send_event(mhi_cntrl, 0, &event);
+}
+
 static void mhi_ep_ring_worker(struct work_struct *work)
 {
 	struct mhi_ep_cntrl *mhi_cntrl = container_of(work,
@@ -268,6 +393,7 @@ int mhi_ep_register_controller(struct mhi_ep_cntrl *mhi_cntrl,
 
 	INIT_LIST_HEAD(&mhi_cntrl->ch_db_list);
 	spin_lock_init(&mhi_cntrl->list_lock);
+	mutex_init(&mhi_cntrl->event_lock);
 
 	/* Set MHI version and AMSS EE before enumeration */
 	mhi_ep_mmio_write(mhi_cntrl, MHIVER, config->mhi_version);
diff --git a/include/linux/mhi_ep.h b/include/linux/mhi_ep.h
index 729f4b802b74..323cd3319b13 100644
--- a/include/linux/mhi_ep.h
+++ b/include/linux/mhi_ep.h
@@ -67,6 +67,7 @@ struct mhi_ep_db_info {
  * @ch_db_list: List of queued channel doorbells
  * @st_transition_list: List of state transitions
  * @list_lock: Lock for protecting state transition and channel doorbell lists
+ * @event_lock: Lock for protecting event rings
  * @chdb: Array of channel doorbell interrupt info
  * @raise_irq: CB function for raising IRQ to the host
  * @alloc_addr: CB function for allocating memory in endpoint for storing host context
@@ -101,6 +102,7 @@ struct mhi_ep_cntrl {
 	struct list_head ch_db_list;
 	struct list_head st_transition_list;
 	spinlock_t list_lock;
+	struct mutex event_lock;
 	struct mhi_ep_db_info chdb[4];
 
 	void (*raise_irq)(struct mhi_ep_cntrl *mhi_cntrl);
-- 
2.25.1

