Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE281DFD2
	for <mhi@lists.linux.dev>; Mon, 27 Nov 2023 12:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UmMp0LSG"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-67a12079162so16284066d6.1
        for <mhi@lists.linux.dev>; Mon, 27 Nov 2023 04:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701089180; x=1701693980; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XP1Q62qn1qYbW0mN98jl6FxqyTfpy980y9btw+6Mx30=;
        b=UmMp0LSG4WtK0ntd0jRUP5IyRl8aO2E+HR2JMzs1BuiithUqpgG0qVOc/AQQjBWNZs
         WR2tDVkMIpBIsHtPfuPA6NBE/NAbUkDZvXmsH9TcrlD9goG9t0J+eK9J51zrbS3KqzoA
         sVgWqQMAA63vNX9YPyubD0FrBiZgVvh7eOe9MriivB9ptRDubW2gUzDZwVcRh6MERoUA
         gdDChJTg1j5LNfjaUMNeOhIn4/NsFNa5bnMb8wpPrpORt65hSKjkrXPBd5mVyLQZTqQG
         mldNNhQjc3T+54W7E90a0Def6yjjWpy8dOdQm6bks2KdvB5Xsy7GbkVigvvy4pO64nyA
         exBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701089180; x=1701693980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XP1Q62qn1qYbW0mN98jl6FxqyTfpy980y9btw+6Mx30=;
        b=rvFGMY3Ejfpiuvdm2c8IjmzmkVB3X7KvuR3wniyrE4t0jEsXQ64yPepe2xjfeI4B4j
         m6mjS2ThwIlebTNI3ATjWFZQdb/E5ZljudmCfA898CaYUlMBwARb7AjJkx+WjC60gdW2
         /xOGRemSf7WyHenIN1GuMTTYkxn1zNysFLbiPD/F66KTR2E/e52lcNyTLhBaxs9WbzH6
         6jb6L7c/CEsv6l1QeuiEpdodQVuGRRz8sYOhrzzAYs+5nkMnXqMeVqH12LYHjqIwJuF1
         yaIIAF+cByogLKJu0k+ndDZX9Qdumy/huhkpT+s4H0KDU9GiJQPAoVlkdsVZQ/qpi6w9
         9hRQ==
X-Gm-Message-State: AOJu0YxdpBHzUx4lWUmd8IAIQN0OKWVLCs1TSqDdJeW4j5zBS4Hltv/m
	Ady+t5MgKtKXlEdVflinFzfyWL99axHiUzaDjw==
X-Google-Smtp-Source: AGHT+IEhhSlGm9jGIVtYRxFiZjw7yEzavFBoXCkhJpRjyMEKjMSY70wOHufalLLn6XKMn005Stusaw==
X-Received: by 2002:a05:6214:d8e:b0:67a:3b18:1b1e with SMTP id e14-20020a0562140d8e00b0067a3b181b1emr5073397qve.54.1701089180007;
        Mon, 27 Nov 2023 04:46:20 -0800 (PST)
Received: from localhost.localdomain ([117.213.103.241])
        by smtp.gmail.com with ESMTPSA id er10-20020a056214190a00b0067a204b4688sm2832231qvb.18.2023.11.27.04.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 04:46:19 -0800 (PST)
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
Subject: [PATCH 8/9] bus: mhi: ep: Add support for async DMA read operation
Date: Mon, 27 Nov 2023 18:15:28 +0530
Message-Id: <20231127124529.78203-9-manivannan.sadhasivam@linaro.org>
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

As like the async DMA write operation, let's add support for async DMA read
operation. In the async path, the data will be read from the transfer ring
continuously and when the controller driver notifies the stack using the
completion callback (mhi_ep_read_completion), then the client driver will
be notified with the read data and the completion event will be sent to the
host for the respective ring element (if requested by the host).

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/ep/main.c | 162 +++++++++++++++++++++-----------------
 1 file changed, 89 insertions(+), 73 deletions(-)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index 81d693433a5f..3e599d9640f5 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -338,17 +338,81 @@ bool mhi_ep_queue_is_empty(struct mhi_ep_device *mhi_dev, enum dma_data_directio
 }
 EXPORT_SYMBOL_GPL(mhi_ep_queue_is_empty);
 
+static void mhi_ep_read_completion(struct mhi_ep_buf_info *buf_info)
+{
+	struct mhi_ep_device *mhi_dev = buf_info->mhi_dev;
+	struct mhi_ep_cntrl *mhi_cntrl = mhi_dev->mhi_cntrl;
+	struct mhi_ep_chan *mhi_chan = mhi_dev->ul_chan;
+	struct mhi_ep_ring *ring = &mhi_cntrl->mhi_chan[mhi_chan->chan].ring;
+	struct mhi_ring_element *el = &ring->ring_cache[ring->rd_offset];
+	struct mhi_result result = {};
+	int ret;
+
+	if (mhi_chan->xfer_cb) {
+		result.buf_addr = buf_info->cb_buf;
+		result.dir = mhi_chan->dir;
+		result.bytes_xferd = buf_info->size;
+
+		mhi_chan->xfer_cb(mhi_dev, &result);
+	}
+
+	/*
+	 * The host will split the data packet into multiple TREs if it can't fit
+	 * the packet in a single TRE. In that case, CHAIN flag will be set by the
+	 * host for all TREs except the last one.
+	 */
+	if (buf_info->code != MHI_EV_CC_OVERFLOW) {
+		if (MHI_TRE_DATA_GET_CHAIN(el)) {
+			/*
+			 * IEOB (Interrupt on End of Block) flag will be set by the host if
+			 * it expects the completion event for all TREs of a TD.
+			 */
+			if (MHI_TRE_DATA_GET_IEOB(el)) {
+				ret = mhi_ep_send_completion_event(mhi_cntrl, ring, el,
+							     MHI_TRE_DATA_GET_LEN(el),
+							     MHI_EV_CC_EOB);
+				if (ret < 0) {
+					dev_err(&mhi_chan->mhi_dev->dev,
+						"Error sending transfer compl. event\n");
+					goto err_free_tre_buf;
+				}
+			}
+		} else {
+			/*
+			 * IEOT (Interrupt on End of Transfer) flag will be set by the host
+			 * for the last TRE of the TD and expects the completion event for
+			 * the same.
+			 */
+			if (MHI_TRE_DATA_GET_IEOT(el)) {
+				ret = mhi_ep_send_completion_event(mhi_cntrl, ring, el,
+							     MHI_TRE_DATA_GET_LEN(el),
+							     MHI_EV_CC_EOT);
+				if (ret < 0) {
+					dev_err(&mhi_chan->mhi_dev->dev,
+						"Error sending transfer compl. event\n");
+					goto err_free_tre_buf;
+				}
+			}
+		}
+	}
+
+	mhi_ep_ring_inc_index(ring);
+
+err_free_tre_buf:
+	kmem_cache_free(mhi_cntrl->tre_buf_cache, buf_info->cb_buf);
+}
+
 static int mhi_ep_read_channel(struct mhi_ep_cntrl *mhi_cntrl,
-				struct mhi_ep_ring *ring,
-				struct mhi_result *result,
-				u32 len)
+			       struct mhi_ep_ring *ring)
 {
 	struct mhi_ep_chan *mhi_chan = &mhi_cntrl->mhi_chan[ring->ch_id];
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
 	size_t tr_len, read_offset, write_offset;
 	struct mhi_ep_buf_info buf_info = {};
+	u32 len = MHI_EP_DEFAULT_MTU;
 	struct mhi_ring_element *el;
 	bool tr_done = false;
+	void *buf_addr;
 	u32 buf_left;
 	int ret;
 
@@ -378,83 +442,50 @@ static int mhi_ep_read_channel(struct mhi_ep_cntrl *mhi_cntrl,
 		read_offset = mhi_chan->tre_size - mhi_chan->tre_bytes_left;
 		write_offset = len - buf_left;
 
+		buf_addr = kmem_cache_zalloc(mhi_cntrl->tre_buf_cache, GFP_KERNEL | GFP_DMA);
+		if (!buf_addr)
+			return -ENOMEM;
+
 		buf_info.host_addr = mhi_chan->tre_loc + read_offset;
-		buf_info.dev_addr = result->buf_addr + write_offset;
+		buf_info.dev_addr = buf_addr + write_offset;
 		buf_info.size = tr_len;
+		buf_info.cb = mhi_ep_read_completion;
+		buf_info.cb_buf = buf_addr;
+		buf_info.mhi_dev = mhi_chan->mhi_dev;
+
+		if (mhi_chan->tre_bytes_left - tr_len)
+			buf_info.code = MHI_EV_CC_OVERFLOW;
 
 		dev_dbg(dev, "Reading %zd bytes from channel (%u)\n", tr_len, ring->ch_id);
-		ret = mhi_cntrl->read_sync(mhi_cntrl, &buf_info);
+		ret = mhi_cntrl->read_async(mhi_cntrl, &buf_info);
 		if (ret < 0) {
 			dev_err(&mhi_chan->mhi_dev->dev, "Error reading from channel\n");
-			return ret;
+			goto err_free_buf_addr;
 		}
 
 		buf_left -= tr_len;
 		mhi_chan->tre_bytes_left -= tr_len;
 
-		/*
-		 * Once the TRE (Transfer Ring Element) of a TD (Transfer Descriptor) has been
-		 * read completely:
-		 *
-		 * 1. Send completion event to the host based on the flags set in TRE.
-		 * 2. Increment the local read offset of the transfer ring.
-		 */
 		if (!mhi_chan->tre_bytes_left) {
-			/*
-			 * The host will split the data packet into multiple TREs if it can't fit
-			 * the packet in a single TRE. In that case, CHAIN flag will be set by the
-			 * host for all TREs except the last one.
-			 */
-			if (MHI_TRE_DATA_GET_CHAIN(el)) {
-				/*
-				 * IEOB (Interrupt on End of Block) flag will be set by the host if
-				 * it expects the completion event for all TREs of a TD.
-				 */
-				if (MHI_TRE_DATA_GET_IEOB(el)) {
-					ret = mhi_ep_send_completion_event(mhi_cntrl, ring, el,
-								     MHI_TRE_DATA_GET_LEN(el),
-								     MHI_EV_CC_EOB);
-					if (ret < 0) {
-						dev_err(&mhi_chan->mhi_dev->dev,
-							"Error sending transfer compl. event\n");
-						return ret;
-					}
-				}
-			} else {
-				/*
-				 * IEOT (Interrupt on End of Transfer) flag will be set by the host
-				 * for the last TRE of the TD and expects the completion event for
-				 * the same.
-				 */
-				if (MHI_TRE_DATA_GET_IEOT(el)) {
-					ret = mhi_ep_send_completion_event(mhi_cntrl, ring, el,
-								     MHI_TRE_DATA_GET_LEN(el),
-								     MHI_EV_CC_EOT);
-					if (ret < 0) {
-						dev_err(&mhi_chan->mhi_dev->dev,
-							"Error sending transfer compl. event\n");
-						return ret;
-					}
-				}
-
+			if (MHI_TRE_DATA_GET_IEOT(el))
 				tr_done = true;
-			}
 
 			mhi_chan->rd_offset = (mhi_chan->rd_offset + 1) % ring->ring_size;
-			mhi_ep_ring_inc_index(ring);
 		}
-
-		result->bytes_xferd += tr_len;
 	} while (buf_left && !tr_done);
 
 	return 0;
+
+err_free_buf_addr:
+	kmem_cache_free(mhi_cntrl->tre_buf_cache, buf_addr);
+
+	return ret;
 }
 
-static int mhi_ep_process_ch_ring(struct mhi_ep_ring *ring, struct mhi_ring_element *el)
+static int mhi_ep_process_ch_ring(struct mhi_ep_ring *ring)
 {
 	struct mhi_ep_cntrl *mhi_cntrl = ring->mhi_cntrl;
 	struct mhi_result result = {};
-	u32 len = MHI_EP_DEFAULT_MTU;
 	struct mhi_ep_chan *mhi_chan;
 	int ret;
 
@@ -475,27 +506,15 @@ static int mhi_ep_process_ch_ring(struct mhi_ep_ring *ring, struct mhi_ring_elem
 		mhi_chan->xfer_cb(mhi_chan->mhi_dev, &result);
 	} else {
 		/* UL channel */
-		result.buf_addr = kmem_cache_zalloc(mhi_cntrl->tre_buf_cache, GFP_KERNEL | GFP_DMA);
-		if (!result.buf_addr)
-			return -ENOMEM;
-
 		do {
-			ret = mhi_ep_read_channel(mhi_cntrl, ring, &result, len);
+			ret = mhi_ep_read_channel(mhi_cntrl, ring);
 			if (ret < 0) {
 				dev_err(&mhi_chan->mhi_dev->dev, "Failed to read channel\n");
-				kmem_cache_free(mhi_cntrl->tre_buf_cache, result.buf_addr);
 				return ret;
 			}
 
-			result.dir = mhi_chan->dir;
-			mhi_chan->xfer_cb(mhi_chan->mhi_dev, &result);
-			result.bytes_xferd = 0;
-			memset(result.buf_addr, 0, len);
-
 			/* Read until the ring becomes empty */
 		} while (!mhi_ep_queue_is_empty(mhi_chan->mhi_dev, DMA_TO_DEVICE));
-
-		kmem_cache_free(mhi_cntrl->tre_buf_cache, result.buf_addr);
 	}
 
 	return 0;
@@ -804,7 +823,6 @@ static void mhi_ep_ch_ring_worker(struct work_struct *work)
 	struct mhi_ep_cntrl *mhi_cntrl = container_of(work, struct mhi_ep_cntrl, ch_ring_work);
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
 	struct mhi_ep_ring_item *itr, *tmp;
-	struct mhi_ring_element *el;
 	struct mhi_ep_ring *ring;
 	struct mhi_ep_chan *chan;
 	unsigned long flags;
@@ -849,10 +867,8 @@ static void mhi_ep_ch_ring_worker(struct work_struct *work)
 			continue;
 		}
 
-		el = &ring->ring_cache[ring->rd_offset];
-
 		dev_dbg(dev, "Processing the ring for channel (%u)\n", ring->ch_id);
-		ret = mhi_ep_process_ch_ring(ring, el);
+		ret = mhi_ep_process_ch_ring(ring);
 		if (ret) {
 			dev_err(dev, "Error processing ring for channel (%u): %d\n",
 				ring->ch_id, ret);
-- 
2.25.1

