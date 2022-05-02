Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FB717D3
	for <mhi@lists.linux.dev>; Mon,  2 May 2022 10:41:55 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id i1so5996994plg.7
        for <mhi@lists.linux.dev>; Mon, 02 May 2022 03:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JKnMyfhOMcsp0MsdczDOFIryPKT28w/sEU1b3opPMj4=;
        b=O6R4e4fF2JRQwROcaZV6fUssqeJO//zhbZl/mygKM0rUko6rIudC3TWlpYR5xD+w5j
         O1vko1UT0iYKBb0nGllAQkYuWbGg6j4UwfxRykZE0CFhYm/2yLZ6e62W4jFWnHbBrpiB
         IQ023QuotgXM4STWbFo8BHA/y6a6KSGVNJWBwGAxBPB634un15s3CDi579H9vn/V9hYM
         PLRWjk471I80dm6Utq8xoVVQXzwsXJ+CIqWTEHlqIc+MkyYWnikgzIAJDGudnRU9iNGs
         XEFbzOACRYMjI69uPXA27wSm/+SNxklYUZO33zXj4pcemEfGYoPQW9ritWjopwk+pQyv
         Fm5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JKnMyfhOMcsp0MsdczDOFIryPKT28w/sEU1b3opPMj4=;
        b=OlpiNZxmp46mcsdEoh8MrGQ6zm0jjICxRb0lcyMC5NaQxHw6TcyBjWU8ep0i5n0Ihr
         ker8gn9ssh8oekvFV6vHSilwA8fDi96u9/z/684M3YYKyfMt99xBWVWjVWjbMxmjRRVT
         jhWze/w/YnHIQv23Bv8aZFhZPVKdhXSuhckhwEaM6jEsscch7Z+ZPOyXOj71pIh7z2HC
         cJofQC+tPDXQIPx+Xpj+Yl1lre1XKATEs6fSXNl9LSqDHwnWAz4Sg6Mjsn0SqkWWvD9s
         nrMMLDTXn19NOXEZyFcrjh4Pwd4nu9V0JvGEjE4r6tIoYYkMllqFBEtPRty2PGO6fJdf
         m7lw==
X-Gm-Message-State: AOAM533KMkZ1rq5sijKUQ3L9MCw57tiOnQVPLfpSgXieWzHNLThkFUrA
	bLUcW0KaqFQt30/4jMz2hkToluzMGuDQ
X-Google-Smtp-Source: ABdhPJxeoDTclX0N6gVfJXR/OjRtjLRieZ90rR0+HvO760NBSIZXKa71fIyZSZ6sgxVOrrg51R2Nnw==
X-Received: by 2002:a17:90b:1d92:b0:1dc:3f14:f8d0 with SMTP id pf18-20020a17090b1d9200b001dc3f14f8d0mr8882476pjb.7.1651488115195;
        Mon, 02 May 2022 03:41:55 -0700 (PDT)
Received: from localhost.localdomain ([27.111.75.99])
        by smtp.gmail.com with ESMTPSA id x10-20020a1709029a4a00b0015e8d4eb2ccsm4368434plv.278.2022.05.02.03.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 03:41:54 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: mhi@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quic_hemantk@quicinc.com,
	quic_bbhatt@quicinc.com,
	loic.poulain@linaro.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 1/5] bus: mhi: host: Rename process_db callback to ring_db
Date: Mon,  2 May 2022 16:11:40 +0530
Message-Id: <20220502104144.91806-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220502104144.91806-1-manivannan.sadhasivam@linaro.org>
References: <20220502104144.91806-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"process_db" might be confusing at times as it also implies that the
function is used to process the doorbells from the endpoint device.
So rename it to "ring_db" to make it clear that it is only used to ring
doorbell to the device.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/host/init.c     | 8 ++++----
 drivers/bus/mhi/host/internal.h | 2 +-
 drivers/bus/mhi/host/main.c     | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
index e43e2e145871..50d2a1f66e5e 100644
--- a/drivers/bus/mhi/host/init.c
+++ b/drivers/bus/mhi/host/init.c
@@ -669,9 +669,9 @@ static int parse_ev_cfg(struct mhi_controller *mhi_cntrl,
 			goto error_ev_cfg;
 
 		if (mhi_event->db_cfg.brstmode == MHI_DB_BRST_ENABLE)
-			mhi_event->db_cfg.process_db = mhi_db_brstmode;
+			mhi_event->db_cfg.ring_db = mhi_db_brstmode;
 		else
-			mhi_event->db_cfg.process_db = mhi_db_brstmode_disable;
+			mhi_event->db_cfg.ring_db = mhi_db_brstmode_disable;
 
 		mhi_event->data_type = event_cfg->data_type;
 
@@ -806,9 +806,9 @@ static int parse_ch_cfg(struct mhi_controller *mhi_cntrl,
 		}
 
 		if (mhi_chan->db_cfg.brstmode == MHI_DB_BRST_ENABLE)
-			mhi_chan->db_cfg.process_db = mhi_db_brstmode;
+			mhi_chan->db_cfg.ring_db = mhi_db_brstmode;
 		else
-			mhi_chan->db_cfg.process_db = mhi_db_brstmode_disable;
+			mhi_chan->db_cfg.ring_db = mhi_db_brstmode_disable;
 
 		mhi_chan->configured = true;
 
diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
index b10a99f8200c..3305f4d93580 100644
--- a/drivers/bus/mhi/host/internal.h
+++ b/drivers/bus/mhi/host/internal.h
@@ -142,7 +142,7 @@ struct db_cfg {
 	u32 pollcfg;
 	enum mhi_db_brst_mode brstmode;
 	dma_addr_t db_val;
-	void (*process_db)(struct mhi_controller *mhi_cntrl,
+	void (*ring_db)(struct mhi_controller *mhi_cntrl,
 			   struct db_cfg *db_cfg, void __iomem *io_addr,
 			   dma_addr_t db_val);
 };
diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
index 7da5a16d721b..c46bd2dd546b 100644
--- a/drivers/bus/mhi/host/main.c
+++ b/drivers/bus/mhi/host/main.c
@@ -112,7 +112,7 @@ void mhi_ring_er_db(struct mhi_event *mhi_event)
 {
 	struct mhi_ring *ring = &mhi_event->ring;
 
-	mhi_event->db_cfg.process_db(mhi_event->mhi_cntrl, &mhi_event->db_cfg,
+	mhi_event->db_cfg.ring_db(mhi_event->mhi_cntrl, &mhi_event->db_cfg,
 				     ring->db_addr, le64_to_cpu(*ring->ctxt_wp));
 }
 
@@ -141,7 +141,7 @@ void mhi_ring_chan_db(struct mhi_controller *mhi_cntrl,
 	dma_wmb();
 	*ring->ctxt_wp = cpu_to_le64(db);
 
-	mhi_chan->db_cfg.process_db(mhi_cntrl, &mhi_chan->db_cfg,
+	mhi_chan->db_cfg.ring_db(mhi_cntrl, &mhi_chan->db_cfg,
 				    ring->db_addr, db);
 }
 
-- 
2.25.1

