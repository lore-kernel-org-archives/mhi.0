Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33678C8C4
	for <mhi@lists.linux.dev>; Mon, 27 Nov 2023 12:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f14OtfmJ"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-77d72aeae3bso172777185a.1
        for <mhi@lists.linux.dev>; Mon, 27 Nov 2023 04:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701089153; x=1701693953; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eJdqJoClpTS7fqDf791uIaijLcGC8pNYAqyRdW5OMs4=;
        b=f14OtfmJY/V3EczQGFtMoe/TYld08uoR09nhIi3Yotpuj8h5rBa/atMZV6JR5ij4R8
         YpgzETBJ86j+CCBL+Jm/Nj2vLFTElCQWQAN6Pe7Y8mhHjkw3ATMLfYtLYBU0nswPgXGm
         +PM8yIVGzHIznV8dUnN5V4N4PAY+1PQn3DKsntAw82v2t9HgqFQAD5WOA7najVRXGfEv
         dgy/eJl2BrW9gbZJqCktftgKReHWghZCs/WbZegBAEdZ4n9yMXRibYZrfK9/Nfcpv9Nl
         o8qaMo3uXIOGSqxvA7/7Du3ha0wDPQ6zkjx3B6S1bBjTynoEMxLvMZ3bfXw56AkX+3MN
         36mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701089153; x=1701693953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eJdqJoClpTS7fqDf791uIaijLcGC8pNYAqyRdW5OMs4=;
        b=Nuzmk7yWOV6XT8jXG5JKqKuNIUE+S+bYnmB+XkY8VyEQDmDKK1VM9GT5uJ6E/bImsM
         LHAowFYcgw1VjhAJtZIFPsb4/osEvixo9reRZZ+Mew5NrdeNLbZ3DXiWOYvL2XcQmSx1
         ogP7RnDqDwg2GBASAWhMuLnDiSls9AShvkWi0k9J6WkM/JjEltj9qq4eoB/yTyT3uNgI
         ehDi+E+aDdG3CHY+SqNWBtKuZ1JqJoVB6QKTD8+HyuS57dTmua/TWkDwLGdyn+cdVtcQ
         CmMX5VQcGoO9lGxBko542r4VZUIhJFhhKtK2wAvilZtDJ0k7p70rqXC/JXYMghppONeg
         ebjQ==
X-Gm-Message-State: AOJu0YyOucNQbZuyDDPqPa0Qzwafd8UQXcFE1ockpZeCYdftz7H6C5Dp
	CFoy25R1iP1HdAXe+S3OheZM
X-Google-Smtp-Source: AGHT+IHHFiydlH5dK8iSV8PMwXuYzFkx7SuLOEGF/fo5W8bAxDfHHMiuC2aBFQbxTuWHYuWWal/HtA==
X-Received: by 2002:ad4:452c:0:b0:67a:338d:2efc with SMTP id l12-20020ad4452c000000b0067a338d2efcmr5135972qvu.11.1701089152934;
        Mon, 27 Nov 2023 04:45:52 -0800 (PST)
Received: from localhost.localdomain ([117.213.103.241])
        by smtp.gmail.com with ESMTPSA id er10-20020a056214190a00b0067a204b4688sm2832231qvb.18.2023.11.27.04.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 04:45:52 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: lpieralisi@kernel.org,
	kw@linux.com
Cc: kishon@kernel.org,
	bhelgaas@google.com,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 2/9] bus: mhi: ep: Rename read_from_host() and write_to_host() APIs
Date: Mon, 27 Nov 2023 18:15:22 +0530
Message-Id: <20231127124529.78203-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231127124529.78203-1-manivannan.sadhasivam@linaro.org>
References: <20231127124529.78203-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the preparation for adding async API support, let's rename the existing
APIs to read_sync() and write_sync() to make it explicit that these APIs
are used for synchronous read/write.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/ep/main.c                    | 4 ++--
 drivers/bus/mhi/ep/ring.c                    | 8 ++++----
 drivers/pci/endpoint/functions/pci-epf-mhi.c | 8 ++++----
 include/linux/mhi_ep.h                       | 8 ++++----
 4 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index cdf5a84d1f21..5748a1da0803 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -381,7 +381,7 @@ static int mhi_ep_read_channel(struct mhi_ep_cntrl *mhi_cntrl,
 		buf_info.size = tr_len;
 
 		dev_dbg(dev, "Reading %zd bytes from channel (%u)\n", tr_len, ring->ch_id);
-		ret = mhi_cntrl->read_from_host(mhi_cntrl, &buf_info);
+		ret = mhi_cntrl->read_sync(mhi_cntrl, &buf_info);
 		if (ret < 0) {
 			dev_err(&mhi_chan->mhi_dev->dev, "Error reading from channel\n");
 			return ret;
@@ -543,7 +543,7 @@ int mhi_ep_queue_skb(struct mhi_ep_device *mhi_dev, struct sk_buff *skb)
 		buf_info.size = tr_len;
 
 		dev_dbg(dev, "Writing %zd bytes to channel (%u)\n", tr_len, ring->ch_id);
-		ret = mhi_cntrl->write_to_host(mhi_cntrl, &buf_info);
+		ret = mhi_cntrl->write_sync(mhi_cntrl, &buf_info);
 		if (ret < 0) {
 			dev_err(dev, "Error writing to the channel\n");
 			goto err_exit;
diff --git a/drivers/bus/mhi/ep/ring.c b/drivers/bus/mhi/ep/ring.c
index 7ea952860def..aeb53b2c34a8 100644
--- a/drivers/bus/mhi/ep/ring.c
+++ b/drivers/bus/mhi/ep/ring.c
@@ -48,7 +48,7 @@ static int __mhi_ep_cache_ring(struct mhi_ep_ring *ring, size_t end)
 		buf_info.host_addr = ring->rbase + (start * sizeof(struct mhi_ring_element));
 		buf_info.dev_addr = &ring->ring_cache[start];
 
-		ret = mhi_cntrl->read_from_host(mhi_cntrl, &buf_info);
+		ret = mhi_cntrl->read_sync(mhi_cntrl, &buf_info);
 		if (ret < 0)
 			return ret;
 	} else {
@@ -56,7 +56,7 @@ static int __mhi_ep_cache_ring(struct mhi_ep_ring *ring, size_t end)
 		buf_info.host_addr = ring->rbase + (start * sizeof(struct mhi_ring_element));
 		buf_info.dev_addr = &ring->ring_cache[start];
 
-		ret = mhi_cntrl->read_from_host(mhi_cntrl, &buf_info);
+		ret = mhi_cntrl->read_sync(mhi_cntrl, &buf_info);
 		if (ret < 0)
 			return ret;
 
@@ -65,7 +65,7 @@ static int __mhi_ep_cache_ring(struct mhi_ep_ring *ring, size_t end)
 			buf_info.dev_addr = &ring->ring_cache[0];
 			buf_info.size = end * sizeof(struct mhi_ring_element);
 
-			ret = mhi_cntrl->read_from_host(mhi_cntrl, &buf_info);
+			ret = mhi_cntrl->read_sync(mhi_cntrl, &buf_info);
 			if (ret < 0)
 				return ret;
 		}
@@ -143,7 +143,7 @@ int mhi_ep_ring_add_element(struct mhi_ep_ring *ring, struct mhi_ring_element *e
 	buf_info.dev_addr = el;
 	buf_info.size = sizeof(*el);
 
-	return mhi_cntrl->write_to_host(mhi_cntrl, &buf_info);
+	return mhi_cntrl->write_sync(mhi_cntrl, &buf_info);
 }
 
 void mhi_ep_ring_init(struct mhi_ep_ring *ring, enum mhi_ep_ring_type type, u32 id)
diff --git a/drivers/pci/endpoint/functions/pci-epf-mhi.c b/drivers/pci/endpoint/functions/pci-epf-mhi.c
index 6dc918a8a023..34e7191f9508 100644
--- a/drivers/pci/endpoint/functions/pci-epf-mhi.c
+++ b/drivers/pci/endpoint/functions/pci-epf-mhi.c
@@ -536,11 +536,11 @@ static int pci_epf_mhi_link_up(struct pci_epf *epf)
 	mhi_cntrl->alloc_map = pci_epf_mhi_alloc_map;
 	mhi_cntrl->unmap_free = pci_epf_mhi_unmap_free;
 	if (info->flags & MHI_EPF_USE_DMA) {
-		mhi_cntrl->read_from_host = pci_epf_mhi_edma_read;
-		mhi_cntrl->write_to_host = pci_epf_mhi_edma_write;
+		mhi_cntrl->read_sync = pci_epf_mhi_edma_read;
+		mhi_cntrl->write_sync = pci_epf_mhi_edma_write;
 	} else {
-		mhi_cntrl->read_from_host = pci_epf_mhi_iatu_read;
-		mhi_cntrl->write_to_host = pci_epf_mhi_iatu_write;
+		mhi_cntrl->read_sync = pci_epf_mhi_iatu_read;
+		mhi_cntrl->write_sync = pci_epf_mhi_iatu_write;
 	}
 
 	/* Register the MHI EP controller */
diff --git a/include/linux/mhi_ep.h b/include/linux/mhi_ep.h
index 96f3a133540d..b96b543bf2f6 100644
--- a/include/linux/mhi_ep.h
+++ b/include/linux/mhi_ep.h
@@ -94,8 +94,8 @@ struct mhi_ep_buf_info {
  * @raise_irq: CB function for raising IRQ to the host
  * @alloc_map: CB function for allocating memory in endpoint for storing host context and mapping it
  * @unmap_free: CB function to unmap and free the allocated memory in endpoint for storing host context
- * @read_from_host: CB function for reading from host memory from endpoint
- * @write_to_host: CB function for writing to host memory from endpoint
+ * @read_sync: CB function for reading from host memory synchronously
+ * @write_sync: CB function for writing to host memory synchronously
  * @mhi_state: MHI Endpoint state
  * @max_chan: Maximum channels supported by the endpoint controller
  * @mru: MRU (Maximum Receive Unit) value of the endpoint controller
@@ -149,8 +149,8 @@ struct mhi_ep_cntrl {
 			 void __iomem **virt, size_t size);
 	void (*unmap_free)(struct mhi_ep_cntrl *mhi_cntrl, u64 pci_addr, phys_addr_t phys,
 			   void __iomem *virt, size_t size);
-	int (*read_from_host)(struct mhi_ep_cntrl *mhi_cntrl, struct mhi_ep_buf_info *buf_info);
-	int (*write_to_host)(struct mhi_ep_cntrl *mhi_cntrl, struct mhi_ep_buf_info *buf_info);
+	int (*read_sync)(struct mhi_ep_cntrl *mhi_cntrl, struct mhi_ep_buf_info *buf_info);
+	int (*write_sync)(struct mhi_ep_cntrl *mhi_cntrl, struct mhi_ep_buf_info *buf_info);
 
 	enum mhi_state mhi_state;
 
-- 
2.25.1

