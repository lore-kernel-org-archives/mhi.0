Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141D45CAB
	for <mhi@lists.linux.dev>; Tue,  1 Mar 2022 16:03:53 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id bd1so13773075plb.13
        for <mhi@lists.linux.dev>; Tue, 01 Mar 2022 08:03:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=epkJ7zhKzflmJ4Sb+fdD/npWZQQh5mOHuoLtSJrKS7w=;
        b=sB1Yl+W2EfhycExJ5/KSfzSL3PfyIbEn03BHmMelKTdyZSV9bQY9TXYIyzLuy/PR9G
         8+lKtslBGUIwcY8HPAUL5QmYn2mpNzjPpWRUwVXqbamWw3h1JpdAHrRjcAwtvrRKF8/K
         pfafw+f5OAYr7MRmRSUB3XbNvE3kjHo2jUR2E5JzoMsJgIqF46zlSb1NABKfUiPfX4RJ
         U6lalUKIUDaoe25F4N5/StYhrLqlnHaeRaCFS1tKQoLoeRC1ZT7Nyjx97EJuyIX9Z8PF
         T0IHGEA5nUhjJsiR0AdoNLVykBOPBJv5BZJscadHcYiwpYHOauq8g2FgoL9M+gl79SEM
         1oAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=epkJ7zhKzflmJ4Sb+fdD/npWZQQh5mOHuoLtSJrKS7w=;
        b=dRHE22brZMm/j4mCAuf/oxZS2XVlNpbhKUFKXgBKRD0b9ipSPFtmqq71GlvPKKIBer
         qEKK9ncVnZsbgciiOhdx2VNaPcYXCgvKa0HfTl+rGF60Fzmjemz21AFgSUIDcs/oCr7R
         vWXXkl3sSSaUeKPmjn2j3pMWYyXW+oiyPQDxCxL3C54qF1T4RZbzo1/U8+87KGwr4/dz
         w67YFPrIOzi2/opsmnWT2XzoSCuS1ASK7EooVF7OLzl+9tYYRvnSI1KDoLMmjeCuz8qC
         45vZHM3y5fnvpie/xFKt7yheqjFjfdzRvTYsgAc2uy20ahETSXQRGP04mUGLzpP1BY2J
         af8Q==
X-Gm-Message-State: AOAM533YpaW8noUVIPxyuvGRGVCM/gWQGpVYCRwL4r+BK5TF2RLu2Gdc
	QUNlEUUoI49fO40jQwdFwDJ9
X-Google-Smtp-Source: ABdhPJzF3kfGzsIclpx9SHxWVSGda1TrMNSzne1mc66YZoDDncCE5miDwm+EV+TcKECsX2CG7grgfg==
X-Received: by 2002:a17:902:c942:b0:150:251c:e015 with SMTP id i2-20020a170902c94200b00150251ce015mr22951038pla.49.1646150632554;
        Tue, 01 Mar 2022 08:03:52 -0800 (PST)
Received: from localhost.localdomain ([117.207.25.80])
        by smtp.gmail.com with ESMTPSA id m17-20020a17090a859100b001bc20ddcc67sm2489530pjn.34.2022.03.01.08.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 08:03:52 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: gregkh@linuxfoundation.org
Cc: mhi@lists.linux.dev,
	quic_hemantk@quicinc.com,
	quic_bbhatt@quicinc.com,
	elder@linaro.org,
	paul.davey@alliedtelesis.co.nz,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 08/10] bus: mhi: host: Rename "struct mhi_tre" to "struct mhi_ring_element"
Date: Tue,  1 Mar 2022 21:33:06 +0530
Message-Id: <20220301160308.107452-9-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301160308.107452-1-manivannan.sadhasivam@linaro.org>
References: <20220301160308.107452-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Structure "struct mhi_tre" is representing a generic MHI ring element and
not specifically a Transfer Ring Element (TRE). Fix the naming.

Reviewed-by: Alex Elder <elder@linaro.org>
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

