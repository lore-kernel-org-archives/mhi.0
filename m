Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F0153BA
	for <mhi@lists.linux.dev>; Mon, 28 Feb 2022 12:44:36 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id s11so691727pfu.13
        for <mhi@lists.linux.dev>; Mon, 28 Feb 2022 04:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PE9CgvE4/CMk5CfWwB0BSUGPQ2yftNehgiOsx4r0KEw=;
        b=UwChw/Uz6Gcrq9v5Doy/tBKQsjyDjQ5n7a3NRfHxBziEBpyo/wXhgmc1k8W56oYjoy
         pT+kgs816mk2N94a5F2oIRYK0EtQr6vkqdElajp0s50xkND2AODkpRTG3FUVKi6dDt51
         hS+9trxIVEFRaZ2idt4L+jyO9C/tVfebq8bXhZz6hGk3Up7i9BynQzgY6VVkpLjw442X
         hLC5PSSqpx0M/qgDJdEkZod9yzuIDXHxPEdzMhjrlzgZ9VJaMwZdwo6bE7cBEZwMh2cV
         e0WyN8AMZvGMMy73PipKaCurx6dXslQBDv9kyAT5dKAgSR66cz0XvuqER1QEmZsUpyva
         sA3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PE9CgvE4/CMk5CfWwB0BSUGPQ2yftNehgiOsx4r0KEw=;
        b=BzUEdtPzRY8RhBbYvXl7hLrlPunlrrDeBD7aPcXYm/bwf3z7K4Y+FS97FeI99HpwHE
         iPTsIrXljvX+g37yGqcMTkJkCyuvtr2hsNNbQsV6wSXzPWTmTOYcf5KlGUTJFDR9mMY3
         3gSb7p1jWsn1PCzntK1oznb3sP5TrqVOGFGz+hsGGo1Qt2taGjFfqkAHMiX4ea3rQQGg
         ZoAZDrVNCr79ks7c6nPbVCLaotUlI8Nyj/UnxmviPDFKMa5VXPJ/ThUxFambxmRNF9qk
         ke5jMaVWEMFNbyCdgtbYp7+hUJYr+WVm67VkM+OAG93W4RKry/MnBB7vT3yawU4QO/mk
         F96g==
X-Gm-Message-State: AOAM5337cBur80NnqumTokNkjyqjIC0zn38Z05MGWx4f3HI1fiALDTe7
	ugjw6myP8hyMFKo6NHYDSR8KPp7v5VUt
X-Google-Smtp-Source: ABdhPJxf431kFjK3nyr0xfdblBiIsdWSrIiJOqJT8lyvfuxhzwmlGOCNoh0M+aYMW/AG6n0pEQsCJw==
X-Received: by 2002:a63:e59:0:b0:374:a169:d558 with SMTP id 25-20020a630e59000000b00374a169d558mr16850279pgo.304.1646052275358;
        Mon, 28 Feb 2022 04:44:35 -0800 (PST)
Received: from localhost.localdomain ([117.207.25.37])
        by smtp.gmail.com with ESMTPSA id y12-20020a056a00190c00b004f39e28fb87sm14256737pfi.98.2022.02.28.04.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 04:44:35 -0800 (PST)
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
Subject: [PATCH v4 07/27] bus: mhi: host: Rename "struct mhi_tre" to "struct mhi_ring_element"
Date: Mon, 28 Feb 2022 18:13:24 +0530
Message-Id: <20220228124344.77359-8-manivannan.sadhasivam@linaro.org>
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

Structure "struct mhi_tre" is representing a generic MHI ring element and
not specifically a Transfer Ring Element (TRE). Fix the naming.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/host/init.c     |  6 +++---
 drivers/bus/mhi/host/internal.h |  2 +-
 drivers/bus/mhi/host/main.c     | 20 ++++++++++----------
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
index ca068a017a42..016dcc35db80 100644
--- a/drivers/bus/mhi/host/init.c
+++ b/drivers/bus/mhi/host/init.c
@@ -339,7 +339,7 @@ int mhi_init_dev_ctxt(struct mhi_controller *mhi_cntrl)
 		er_ctxt->msivec = cpu_to_le32(mhi_event->irq);
 		mhi_event->db_cfg.db_mode = true;
 
-		ring->el_size = sizeof(struct mhi_tre);
+		ring->el_size = sizeof(struct mhi_ring_element);
 		ring->len = ring->el_size * ring->elements;
 		ret = mhi_alloc_aligned_ring(mhi_cntrl, ring, ring->len);
 		if (ret)
@@ -371,7 +371,7 @@ int mhi_init_dev_ctxt(struct mhi_controller *mhi_cntrl)
 	for (i = 0; i < NR_OF_CMD_RINGS; i++, mhi_cmd++, cmd_ctxt++) {
 		struct mhi_ring *ring = &mhi_cmd->ring;
 
-		ring->el_size = sizeof(struct mhi_tre);
+		ring->el_size = sizeof(struct mhi_ring_element);
 		ring->elements = CMD_EL_PER_RING;
 		ring->len = ring->el_size * ring->elements;
 		ret = mhi_alloc_aligned_ring(mhi_cntrl, ring, ring->len);
@@ -598,7 +598,7 @@ int mhi_init_chan_ctxt(struct mhi_controller *mhi_cntrl,
 
 	buf_ring = &mhi_chan->buf_ring;
 	tre_ring = &mhi_chan->tre_ring;
-	tre_ring->el_size = sizeof(struct mhi_tre);
+	tre_ring->el_size = sizeof(struct mhi_ring_element);
 	tre_ring->len = tre_ring->el_size * tre_ring->elements;
 	chan_ctxt = &mhi_cntrl->mhi_ctxt->chan_ctxt[mhi_chan->chan];
 	ret = mhi_alloc_aligned_ring(mhi_cntrl, tre_ring, tre_ring->len);
diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
index 1c7a48be033f..5860cd326db6 100644
--- a/drivers/bus/mhi/host/internal.h
+++ b/drivers/bus/mhi/host/internal.h
@@ -168,7 +168,7 @@ struct mhi_ctxt {
 	dma_addr_t cmd_ctxt_addr;
 };
 
-struct mhi_tre {
+struct mhi_ring_element {
 	__le64 ptr;
 	__le32 dword[2];
 };
diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
index 3e6e615466b7..dabf85b92a84 100644
--- a/drivers/bus/mhi/host/main.c
+++ b/drivers/bus/mhi/host/main.c
@@ -554,7 +554,7 @@ static void mhi_recycle_ev_ring_element(struct mhi_controller *mhi_cntrl,
 }
 
 static int parse_xfer_event(struct mhi_controller *mhi_cntrl,
-			    struct mhi_tre *event,
+			    struct mhi_ring_element *event,
 			    struct mhi_chan *mhi_chan)
 {
 	struct mhi_ring *buf_ring, *tre_ring;
@@ -590,7 +590,7 @@ static int parse_xfer_event(struct mhi_controller *mhi_cntrl,
 	case MHI_EV_CC_EOT:
 	{
 		dma_addr_t ptr = MHI_TRE_GET_EV_PTR(event);
-		struct mhi_tre *local_rp, *ev_tre;
+		struct mhi_ring_element *local_rp, *ev_tre;
 		void *dev_rp;
 		struct mhi_buf_info *buf_info;
 		u16 xfer_len;
@@ -689,7 +689,7 @@ static int parse_xfer_event(struct mhi_controller *mhi_cntrl,
 }
 
 static int parse_rsc_event(struct mhi_controller *mhi_cntrl,
-			   struct mhi_tre *event,
+			   struct mhi_ring_element *event,
 			   struct mhi_chan *mhi_chan)
 {
 	struct mhi_ring *buf_ring, *tre_ring;
@@ -753,12 +753,12 @@ static int parse_rsc_event(struct mhi_controller *mhi_cntrl,
 }
 
 static void mhi_process_cmd_completion(struct mhi_controller *mhi_cntrl,
-				       struct mhi_tre *tre)
+				       struct mhi_ring_element *tre)
 {
 	dma_addr_t ptr = MHI_TRE_GET_EV_PTR(tre);
 	struct mhi_cmd *cmd_ring = &mhi_cntrl->mhi_cmd[PRIMARY_CMD_RING];
 	struct mhi_ring *mhi_ring = &cmd_ring->ring;
-	struct mhi_tre *cmd_pkt;
+	struct mhi_ring_element *cmd_pkt;
 	struct mhi_chan *mhi_chan;
 	u32 chan;
 
@@ -791,7 +791,7 @@ int mhi_process_ctrl_ev_ring(struct mhi_controller *mhi_cntrl,
 			     struct mhi_event *mhi_event,
 			     u32 event_quota)
 {
-	struct mhi_tre *dev_rp, *local_rp;
+	struct mhi_ring_element *dev_rp, *local_rp;
 	struct mhi_ring *ev_ring = &mhi_event->ring;
 	struct mhi_event_ctxt *er_ctxt =
 		&mhi_cntrl->mhi_ctxt->er_ctxt[mhi_event->er_index];
@@ -961,7 +961,7 @@ int mhi_process_data_event_ring(struct mhi_controller *mhi_cntrl,
 				struct mhi_event *mhi_event,
 				u32 event_quota)
 {
-	struct mhi_tre *dev_rp, *local_rp;
+	struct mhi_ring_element *dev_rp, *local_rp;
 	struct mhi_ring *ev_ring = &mhi_event->ring;
 	struct mhi_event_ctxt *er_ctxt =
 		&mhi_cntrl->mhi_ctxt->er_ctxt[mhi_event->er_index];
@@ -1185,7 +1185,7 @@ int mhi_gen_tre(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
 			struct mhi_buf_info *info, enum mhi_flags flags)
 {
 	struct mhi_ring *buf_ring, *tre_ring;
-	struct mhi_tre *mhi_tre;
+	struct mhi_ring_element *mhi_tre;
 	struct mhi_buf_info *buf_info;
 	int eot, eob, chain, bei;
 	int ret;
@@ -1256,7 +1256,7 @@ int mhi_send_cmd(struct mhi_controller *mhi_cntrl,
 		 struct mhi_chan *mhi_chan,
 		 enum mhi_cmd_type cmd)
 {
-	struct mhi_tre *cmd_tre = NULL;
+	struct mhi_ring_element *cmd_tre = NULL;
 	struct mhi_cmd *mhi_cmd = &mhi_cntrl->mhi_cmd[PRIMARY_CMD_RING];
 	struct mhi_ring *ring = &mhi_cmd->ring;
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
@@ -1518,7 +1518,7 @@ static void mhi_mark_stale_events(struct mhi_controller *mhi_cntrl,
 				  int chan)
 
 {
-	struct mhi_tre *dev_rp, *local_rp;
+	struct mhi_ring_element *dev_rp, *local_rp;
 	struct mhi_ring *ev_ring;
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
 	unsigned long flags;
-- 
2.25.1

