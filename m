Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1138F17D3
	for <mhi@lists.linux.dev>; Mon,  2 May 2022 10:41:58 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id j6so11959618pfe.13
        for <mhi@lists.linux.dev>; Mon, 02 May 2022 03:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FBdbkVGAzuaeQDBgV20xOmT+zyjp47jPmUnwKT47dlc=;
        b=EBh6YGZIjpIFC2SNfFPc82lXzO601HLLH+rHoUn2YEmxoGnSyTHldkR1EtuuQ0m48j
         c/jtfDsRzEh8eQqbEGEa23JsDtbA5LVu/BbqPXLuFymmQi5sIGhv+7s1fCb0JYoabmVY
         3wdnu9WiAUU/YNnH45Y38mYXjxKS2S/KxQh1wrWB5wlAJogH1lBQz0bYjoiQqkXeRTP1
         MdGUhib7wqwVOvqJzwcnSkVLN1S2s8DkouWSoNg+iWrbysYN3LSAQlYFyKg5eZuMsoRZ
         txw9GASjNS0t2d/ic9Cdhv95LB9oWDrFMruEQDNvtyRHE/a70s973rM3b183SbplehNu
         1/Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FBdbkVGAzuaeQDBgV20xOmT+zyjp47jPmUnwKT47dlc=;
        b=DzzQXR+Udp2/TzZkI1SC+L9mJqQiCEjCch7seOcP/7qXxF+5OwUhyAwC/BVAUtdXgI
         KS7DdHhVmMgx71B/ZqveM0qHOPGDr9dAO5NZyW8lrCTJ2yTpAMsaeUzSNkSjarfFuCdT
         GhcrM4YOYJlblDuHPiEQzuEwOZRmWq0edAB2Ou7XUBX3e/tQaZ4kVWGIVxqdOGRZDpZC
         UtFsqxxjzRMdSbRwubsyh8M1OWDJ4OwU8Pjf9uPBtFsIZ2+d9xyFMaFr1xxFibs8WlX+
         OKOX4z8rXIcWkyCtH/s5FAMD6TCenqwdNJz/GnuIar69gYABR5ytdQhMYr+uGaHkVzth
         iowA==
X-Gm-Message-State: AOAM531ssWCBtUcEi84ujwAJeue3dy7KGJ0/m0O0YcDnptMLaknq8XMg
	z16w3X/ViZMYH9iFj5AZSvvmEkNi2Uzu
X-Google-Smtp-Source: ABdhPJymVO1976tfbGSmg39VeVfIKNV0yCEkUhutxyQrfu3upmOnnZa7nuhgE7jOcgf5usPl9tW53Q==
X-Received: by 2002:a05:6a00:2310:b0:4fa:7eb1:e855 with SMTP id h16-20020a056a00231000b004fa7eb1e855mr10581224pfh.14.1651488118335;
        Mon, 02 May 2022 03:41:58 -0700 (PDT)
Received: from localhost.localdomain ([27.111.75.99])
        by smtp.gmail.com with ESMTPSA id x10-20020a1709029a4a00b0015e8d4eb2ccsm4368434plv.278.2022.05.02.03.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 03:41:58 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: mhi@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quic_hemantk@quicinc.com,
	quic_bbhatt@quicinc.com,
	loic.poulain@linaro.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 2/5] bus: mhi: host: Rename mhi_db_brstmode() and mhi_db_brstmode_disable()
Date: Mon,  2 May 2022 16:11:41 +0530
Message-Id: <20220502104144.91806-3-manivannan.sadhasivam@linaro.org>
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

These functions are ringing the channel and event ring doorbells based on
the doorbell mode configured. So in order to better reflect their
functionality, let's rename them to mhi_ring_db_brstmode() and
mhi_ring_db_no_brstmode().

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/host/init.c     | 8 ++++----
 drivers/bus/mhi/host/internal.h | 4 ++--
 drivers/bus/mhi/host/main.c     | 4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
index 50d2a1f66e5e..e095d2999c06 100644
--- a/drivers/bus/mhi/host/init.c
+++ b/drivers/bus/mhi/host/init.c
@@ -669,9 +669,9 @@ static int parse_ev_cfg(struct mhi_controller *mhi_cntrl,
 			goto error_ev_cfg;
 
 		if (mhi_event->db_cfg.brstmode == MHI_DB_BRST_ENABLE)
-			mhi_event->db_cfg.ring_db = mhi_db_brstmode;
+			mhi_event->db_cfg.ring_db = mhi_ring_db_brstmode;
 		else
-			mhi_event->db_cfg.ring_db = mhi_db_brstmode_disable;
+			mhi_event->db_cfg.ring_db = mhi_ring_db_no_brstmode;
 
 		mhi_event->data_type = event_cfg->data_type;
 
@@ -806,9 +806,9 @@ static int parse_ch_cfg(struct mhi_controller *mhi_cntrl,
 		}
 
 		if (mhi_chan->db_cfg.brstmode == MHI_DB_BRST_ENABLE)
-			mhi_chan->db_cfg.ring_db = mhi_db_brstmode;
+			mhi_chan->db_cfg.ring_db = mhi_ring_db_brstmode;
 		else
-			mhi_chan->db_cfg.ring_db = mhi_db_brstmode_disable;
+			mhi_chan->db_cfg.ring_db = mhi_ring_db_no_brstmode;
 
 		mhi_chan->configured = true;
 
diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
index 3305f4d93580..007c7554439f 100644
--- a/drivers/bus/mhi/host/internal.h
+++ b/drivers/bus/mhi/host/internal.h
@@ -309,9 +309,9 @@ static inline void mhi_trigger_resume(struct mhi_controller *mhi_cntrl)
 }
 
 /* Register access methods */
-void mhi_db_brstmode(struct mhi_controller *mhi_cntrl, struct db_cfg *db_cfg,
+void mhi_ring_db_brstmode(struct mhi_controller *mhi_cntrl, struct db_cfg *db_cfg,
 		     void __iomem *db_addr, dma_addr_t db_val);
-void mhi_db_brstmode_disable(struct mhi_controller *mhi_cntrl,
+void mhi_ring_db_no_brstmode(struct mhi_controller *mhi_cntrl,
 			     struct db_cfg *db_mode, void __iomem *db_addr,
 			     dma_addr_t db_val);
 int __must_check mhi_read_reg(struct mhi_controller *mhi_cntrl,
diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
index c46bd2dd546b..28b41621e004 100644
--- a/drivers/bus/mhi/host/main.c
+++ b/drivers/bus/mhi/host/main.c
@@ -87,7 +87,7 @@ void mhi_write_db(struct mhi_controller *mhi_cntrl, void __iomem *db_addr,
 	mhi_write_reg(mhi_cntrl, db_addr, 0, lower_32_bits(db_val));
 }
 
-void mhi_db_brstmode(struct mhi_controller *mhi_cntrl,
+void mhi_ring_db_brstmode(struct mhi_controller *mhi_cntrl,
 		     struct db_cfg *db_cfg,
 		     void __iomem *db_addr,
 		     dma_addr_t db_val)
@@ -99,7 +99,7 @@ void mhi_db_brstmode(struct mhi_controller *mhi_cntrl,
 	}
 }
 
-void mhi_db_brstmode_disable(struct mhi_controller *mhi_cntrl,
+void mhi_ring_db_no_brstmode(struct mhi_controller *mhi_cntrl,
 			     struct db_cfg *db_cfg,
 			     void __iomem *db_addr,
 			     dma_addr_t db_val)
-- 
2.25.1

