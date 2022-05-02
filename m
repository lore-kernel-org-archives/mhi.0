Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E53817D3
	for <mhi@lists.linux.dev>; Mon,  2 May 2022 10:42:02 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id 7so7521085pga.12
        for <mhi@lists.linux.dev>; Mon, 02 May 2022 03:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rws2TGaCdrtsZUYlCLkotIgdXs2LD27ns9J6VXpRQwY=;
        b=zkaMqL9T1xgN/X3qxgOfcZGBNNoxdsHT2U5GxutedfsLuabNF2R7FPyuEj2uJsqsK0
         sLx/avESwyRE69doAMGUiotVe7Le4ST1LE3Ew3IG5tuDHCtWDkzVSJE0dV6eW55LLTZt
         2XLXG+ihN3ZkvAqaqoILc2pDCM7WNy4wm2aXr2fkrz6zGc9LPdui8ClNg8bCrpRuTrOr
         Fw7cjIkkVAePqB62DgMNIdr1I8I9EisDGysJcotjV5YRhK36FdJPr7NaNrfh+NYDtzCf
         yQgmEreb9jAYctZekHh6OtXEsEPgMiOHtfab4jEJbrWiYM1HBKHkxBoGFbYH3JQ0iuBU
         Tv1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rws2TGaCdrtsZUYlCLkotIgdXs2LD27ns9J6VXpRQwY=;
        b=K8g8L74IoxsIOjh1qWotRt3H72mWR8vVoMQUUH5Pvg4ROiu81QqVgo3/GzdCLETMOd
         qvumPmENtwqsa9OqXRQ/HIPjMBnDLu+Tk4RaylrUMcrhGwc4TTtkHjcYk/nFqoe/Tdrh
         fZu71/8sLo97o0+PGcUKLM1SJgS2FjuiQSUfB0jZFuyGlttobzsTlOnpHZZHhAfkbyfq
         nsVhcEm1o36fWqdKGmUpZXBNFTQqvuB++e5tQgdddFFC71KFnk1HT3RR3hZOGZ2ppOAY
         yrJ5hvZuhdUyImL0s1cEG9ft/Y3LLPflZcpej2HbKg9nG7Y6JeX8JlYwXKNN9SGdI6aS
         H8Vg==
X-Gm-Message-State: AOAM531aYA3zfIQu2GTL7lgBEYUT6Vy2YY7gOdno/qkNOD9NBG2aANTM
	UGDBFJ7udKdWMvsyNSuTc7rbvidp5Kjw
X-Google-Smtp-Source: ABdhPJwvnP8a0lAKWMWebvL6W4+GVc5NbuQCn5/P8vH9tTWnfTMan6KiQQXHkibjRA2m8hPF1vYPGQ==
X-Received: by 2002:a05:6a00:1312:b0:4e1:58c4:ddfd with SMTP id j18-20020a056a00131200b004e158c4ddfdmr10775250pfu.65.1651488121726;
        Mon, 02 May 2022 03:42:01 -0700 (PDT)
Received: from localhost.localdomain ([27.111.75.99])
        by smtp.gmail.com with ESMTPSA id x10-20020a1709029a4a00b0015e8d4eb2ccsm4368434plv.278.2022.05.02.03.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 03:42:01 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: mhi@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quic_hemantk@quicinc.com,
	quic_bbhatt@quicinc.com,
	loic.poulain@linaro.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 3/5] bus: mhi: host: Use {READ/WITE}_ONCE macros for db_mode and db_val
Date: Mon,  2 May 2022 16:11:42 +0530
Message-Id: <20220502104144.91806-4-manivannan.sadhasivam@linaro.org>
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

In order to prevent the compiler from optimizing these fields that could
be used parallely, let's use the {READ/WRITE}_ONCE macros for reading and
updating. Since these fields are defined as bool, let's use the true/false
instead of 0/1.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/host/init.c |  4 ++--
 drivers/bus/mhi/host/main.c | 14 +++++++++-----
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
index e095d2999c06..906bdf584860 100644
--- a/drivers/bus/mhi/host/init.c
+++ b/drivers/bus/mhi/host/init.c
@@ -325,7 +325,7 @@ int mhi_init_dev_ctxt(struct mhi_controller *mhi_cntrl)
 
 		er_ctxt->ertype = cpu_to_le32(MHI_ER_TYPE_VALID);
 		er_ctxt->msivec = cpu_to_le32(mhi_event->irq);
-		mhi_event->db_cfg.db_mode = true;
+		WRITE_ONCE(mhi_event->db_cfg.db_mode, true);
 
 		ring->el_size = sizeof(struct mhi_ring_element);
 		ring->len = ring->el_size * ring->elements;
@@ -615,7 +615,7 @@ int mhi_init_chan_ctxt(struct mhi_controller *mhi_cntrl,
 
 	tre_ring->rp = tre_ring->wp = tre_ring->base;
 	buf_ring->rp = buf_ring->wp = buf_ring->base;
-	mhi_chan->db_cfg.db_mode = 1;
+	WRITE_ONCE(mhi_chan->db_cfg.db_mode, true);
 
 	/* Update to all cores */
 	smp_wmb();
diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
index 28b41621e004..bb3b20207c4e 100644
--- a/drivers/bus/mhi/host/main.c
+++ b/drivers/bus/mhi/host/main.c
@@ -92,10 +92,14 @@ void mhi_ring_db_brstmode(struct mhi_controller *mhi_cntrl,
 		     void __iomem *db_addr,
 		     dma_addr_t db_val)
 {
-	if (db_cfg->db_mode) {
-		db_cfg->db_val = db_val;
+	if (READ_ONCE(db_cfg->db_mode)) {
+		/*
+		 * There is no barrier required here, since both compiler and
+		 * CPU will honor the load/store control dependency.
+		 */
+		WRITE_ONCE(db_cfg->db_val, db_val);
 		mhi_write_db(mhi_cntrl, db_addr, db_val);
-		db_cfg->db_mode = 0;
+		WRITE_ONCE(db_cfg->db_mode, false);
 	}
 }
 
@@ -104,7 +108,7 @@ void mhi_ring_db_no_brstmode(struct mhi_controller *mhi_cntrl,
 			     void __iomem *db_addr,
 			     dma_addr_t db_val)
 {
-	db_cfg->db_val = db_val;
+	WRITE_ONCE(db_cfg->db_val, db_val);
 	mhi_write_db(mhi_cntrl, db_addr, db_val);
 }
 
@@ -665,7 +669,7 @@ static int parse_xfer_event(struct mhi_controller *mhi_cntrl,
 	{
 		unsigned long pm_lock_flags;
 
-		mhi_chan->db_cfg.db_mode = 1;
+		WRITE_ONCE(mhi_chan->db_cfg.db_mode, true);
 		read_lock_irqsave(&mhi_cntrl->pm_lock, pm_lock_flags);
 		if (tre_ring->wp != tre_ring->rp &&
 		    MHI_DB_ACCESS_VALID(mhi_cntrl)) {
-- 
2.25.1

