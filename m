Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B363419C
	for <mhi@lists.linux.dev>; Wed, 18 Oct 2023 12:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i0iQKUrO"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-57f0f81b2aeso3726557eaf.3
        for <mhi@lists.linux.dev>; Wed, 18 Oct 2023 05:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697632109; x=1698236909; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gWJF8w+ZmKp1jb1CoVlOBJDONP0RLpMI50cE905pgWg=;
        b=i0iQKUrOSzl0hGJIIxB35Q0v10A9WH8qTbwDM+9o8bz8OZaQg0EFB+/iRSCPJcXghZ
         jinlVPmVgKbenj0nyzl550aFnnZH1iWgLwoZ26ZIrX0gjpjW6d14tfQkkieWeVaC9PSF
         IlBuVSPrBqHHjrNBkKplra1GBGojPD5Vp+YcFhDl14p10izrVMKbBiuBAVYgM37PLqzD
         VVkuRWyUxvTFuWq3Z5ugUXfrDCdYva74ZHdj5+EnKGo+e6AQW3LShLTaL41S3sYHnmBc
         bmTn7+aHz8V+wfin02IYcDB2xMW3DC4ZkinbyxrRkAnMyNNBCuqZjcCPbOgfjlj021hb
         yLow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697632109; x=1698236909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gWJF8w+ZmKp1jb1CoVlOBJDONP0RLpMI50cE905pgWg=;
        b=fRfChyO5gNtv/AEhUVTtFZ+0fZq8XOV8rQ7LZL5GpDvmLMz+w4Er11xXgFtj0Zzrqf
         7QzjpxnFfQih0VS6xR7ZelLBTk0e61UQKhngwtH0vjXRtCKHxZ8PSoFF84k9yoB2GtGA
         UNhxlryFeoznYh/3YjGBfbLXEEQ64S57QFrw0szkU03fdc6srte09stvWOchDmi/S2wz
         qFA+HrImBNWVWZ3VS+aU1y85gcwgeL6K78pzRogXK8cZjekaQD6pqqvYj/k16iozYqq+
         suHiafe7ngNIGejyx7yQ5ktrz5WPrdOBrS3M3ZUrQPQeEuVyyZaACMfCkI95FBM2sw3l
         4z3A==
X-Gm-Message-State: AOJu0Yz65h8OV+HQoUcRLcUXNygBPnI1Hs/Jmd/E2RtZq9Bc4ysipcmt
	Bj0Pal8jDJ5YG6PkKBRdhe51mcZ5XgVWe+bs6A==
X-Google-Smtp-Source: AGHT+IH+ZPOle3U+H6TZ/sMIPLF6eFrT7YLOVduG7uxDTyeVQuqGmjsQUbEA3+9fBXs2Yer4/7sE9g==
X-Received: by 2002:a05:6358:e87:b0:150:8ba9:4d with SMTP id 7-20020a0563580e8700b001508ba9004dmr5613112rwg.3.1697632109011;
        Wed, 18 Oct 2023 05:28:29 -0700 (PDT)
Received: from localhost.localdomain ([117.202.186.25])
        by smtp.gmail.com with ESMTPSA id k3-20020aa79d03000000b0069102aa1918sm3180708pfp.48.2023.10.18.05.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 05:28:28 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: mhi@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Alex Elder <elder@linaro.org>
Subject: [PATCH] bus: mhi: ep: Use slab allocator where applicable
Date: Wed, 18 Oct 2023 17:58:12 +0530
Message-Id: <20231018122812.47261-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use slab allocator for allocating the memory for objects used frequently
and are of fixed size. This reduces the overheard associated with
kmalloc().

Suggested-by: Alex Elder <elder@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/ep/main.c | 70 +++++++++++++++++++++++++++++----------
 include/linux/mhi_ep.h    |  3 ++
 2 files changed, 56 insertions(+), 17 deletions(-)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index 66ca470bf302..834e7afadd64 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -71,7 +71,8 @@ static int mhi_ep_send_event(struct mhi_ep_cntrl *mhi_cntrl, u32 ring_idx,
 static int mhi_ep_send_completion_event(struct mhi_ep_cntrl *mhi_cntrl, struct mhi_ep_ring *ring,
 					struct mhi_ring_element *tre, u32 len, enum mhi_ev_ccs code)
 {
-	struct mhi_ring_element *event = kzalloc(sizeof(struct mhi_ring_element), GFP_KERNEL);
+	struct mhi_ring_element *event = kmem_cache_zalloc(mhi_cntrl->ev_ring_el_cache,
+							   GFP_KERNEL | GFP_DMA);
 	int ret;
 
 	event->ptr = cpu_to_le64(ring->rbase + ring->rd_offset * sizeof(*tre));
@@ -79,42 +80,45 @@ static int mhi_ep_send_completion_event(struct mhi_ep_cntrl *mhi_cntrl, struct m
 	event->dword[1] = MHI_TRE_EV_DWORD1(ring->ch_id, MHI_PKT_TYPE_TX_EVENT);
 
 	ret = mhi_ep_send_event(mhi_cntrl, ring->er_index, event, MHI_TRE_DATA_GET_BEI(tre));
-	kfree(event);
+	kmem_cache_free(mhi_cntrl->ev_ring_el_cache, event);
 
 	return ret;
 }
 
 int mhi_ep_send_state_change_event(struct mhi_ep_cntrl *mhi_cntrl, enum mhi_state state)
 {
-	struct mhi_ring_element *event = kzalloc(sizeof(struct mhi_ring_element), GFP_KERNEL);
+	struct mhi_ring_element *event = kmem_cache_zalloc(mhi_cntrl->ev_ring_el_cache,
+							   GFP_KERNEL | GFP_DMA);
 	int ret;
 
 	event->dword[0] = MHI_SC_EV_DWORD0(state);
 	event->dword[1] = MHI_SC_EV_DWORD1(MHI_PKT_TYPE_STATE_CHANGE_EVENT);
 
 	ret = mhi_ep_send_event(mhi_cntrl, 0, event, 0);
-	kfree(event);
+	kmem_cache_free(mhi_cntrl->ev_ring_el_cache, event);
 
 	return ret;
 }
 
 int mhi_ep_send_ee_event(struct mhi_ep_cntrl *mhi_cntrl, enum mhi_ee_type exec_env)
 {
-	struct mhi_ring_element *event = kzalloc(sizeof(struct mhi_ring_element), GFP_KERNEL);
+	struct mhi_ring_element *event = kmem_cache_zalloc(mhi_cntrl->ev_ring_el_cache,
+							   GFP_KERNEL | GFP_DMA);
 	int ret;
 
 	event->dword[0] = MHI_EE_EV_DWORD0(exec_env);
 	event->dword[1] = MHI_SC_EV_DWORD1(MHI_PKT_TYPE_EE_EVENT);
 
 	ret = mhi_ep_send_event(mhi_cntrl, 0, event, 0);
-	kfree(event);
+	kmem_cache_free(mhi_cntrl->ev_ring_el_cache, event);
 
 	return ret;
 }
 
 static int mhi_ep_send_cmd_comp_event(struct mhi_ep_cntrl *mhi_cntrl, enum mhi_ev_ccs code)
 {
-	struct mhi_ring_element *event = kzalloc(sizeof(struct mhi_ring_element), GFP_KERNEL);
+	struct mhi_ring_element *event = kmem_cache_zalloc(mhi_cntrl->ev_ring_el_cache,
+							   GFP_KERNEL | GFP_DMA);
 	struct mhi_ep_ring *ring = &mhi_cntrl->mhi_cmd->ring;
 	int ret;
 
@@ -123,7 +127,7 @@ static int mhi_ep_send_cmd_comp_event(struct mhi_ep_cntrl *mhi_cntrl, enum mhi_e
 	event->dword[1] = MHI_CC_EV_DWORD1(MHI_PKT_TYPE_CMD_COMPLETION_EVENT);
 
 	ret = mhi_ep_send_event(mhi_cntrl, 0, event, 0);
-	kfree(event);
+	kmem_cache_free(mhi_cntrl->ev_ring_el_cache, event);
 
 	return ret;
 }
@@ -435,7 +439,7 @@ static int mhi_ep_process_ch_ring(struct mhi_ep_ring *ring, struct mhi_ring_elem
 		mhi_chan->xfer_cb(mhi_chan->mhi_dev, &result);
 	} else {
 		/* UL channel */
-		result.buf_addr = kzalloc(len, GFP_KERNEL);
+		result.buf_addr = kmem_cache_zalloc(mhi_cntrl->tre_buf_cache, GFP_KERNEL | GFP_DMA);
 		if (!result.buf_addr)
 			return -ENOMEM;
 
@@ -443,7 +447,7 @@ static int mhi_ep_process_ch_ring(struct mhi_ep_ring *ring, struct mhi_ring_elem
 			ret = mhi_ep_read_channel(mhi_cntrl, ring, &result, len);
 			if (ret < 0) {
 				dev_err(&mhi_chan->mhi_dev->dev, "Failed to read channel\n");
-				kfree(result.buf_addr);
+				kmem_cache_free(mhi_cntrl->tre_buf_cache, result.buf_addr);
 				return ret;
 			}
 
@@ -455,7 +459,7 @@ static int mhi_ep_process_ch_ring(struct mhi_ep_ring *ring, struct mhi_ring_elem
 			/* Read until the ring becomes empty */
 		} while (!mhi_ep_queue_is_empty(mhi_chan->mhi_dev, DMA_TO_DEVICE));
 
-		kfree(result.buf_addr);
+		kmem_cache_free(mhi_cntrl->tre_buf_cache, result.buf_addr);
 	}
 
 	return 0;
@@ -764,14 +768,14 @@ static void mhi_ep_ch_ring_worker(struct work_struct *work)
 		if (ret) {
 			dev_err(dev, "Error updating write offset for ring\n");
 			mutex_unlock(&chan->lock);
-			kfree(itr);
+			kmem_cache_free(mhi_cntrl->ring_item_cache, itr);
 			continue;
 		}
 
 		/* Sanity check to make sure there are elements in the ring */
 		if (ring->rd_offset == ring->wr_offset) {
 			mutex_unlock(&chan->lock);
-			kfree(itr);
+			kmem_cache_free(mhi_cntrl->ring_item_cache, itr);
 			continue;
 		}
 
@@ -783,12 +787,12 @@ static void mhi_ep_ch_ring_worker(struct work_struct *work)
 			dev_err(dev, "Error processing ring for channel (%u): %d\n",
 				ring->ch_id, ret);
 			mutex_unlock(&chan->lock);
-			kfree(itr);
+			kmem_cache_free(mhi_cntrl->ring_item_cache, itr);
 			continue;
 		}
 
 		mutex_unlock(&chan->lock);
-		kfree(itr);
+		kmem_cache_free(mhi_cntrl->ring_item_cache, itr);
 	}
 }
 
@@ -844,7 +848,7 @@ static void mhi_ep_queue_channel_db(struct mhi_ep_cntrl *mhi_cntrl, unsigned lon
 		u32 ch_id = ch_idx + i;
 
 		ring = &mhi_cntrl->mhi_chan[ch_id].ring;
-		item = kzalloc(sizeof(*item), GFP_ATOMIC);
+		item = kmem_cache_zalloc(mhi_cntrl->ring_item_cache, GFP_ATOMIC);
 		if (!item)
 			return;
 
@@ -1391,6 +1395,29 @@ int mhi_ep_register_controller(struct mhi_ep_cntrl *mhi_cntrl,
 		goto err_free_ch;
 	}
 
+	mhi_cntrl->ev_ring_el_cache = kmem_cache_create("mhi_ep_event_ring_el",
+							sizeof(struct mhi_ring_element), 0,
+							SLAB_CACHE_DMA, NULL);
+	if (!mhi_cntrl->ev_ring_el_cache) {
+		ret = -ENOMEM;
+		goto err_free_cmd;
+	}
+
+	mhi_cntrl->tre_buf_cache = kmem_cache_create("mhi_ep_tre_buf", MHI_EP_DEFAULT_MTU, 0,
+						      SLAB_CACHE_DMA, NULL);
+	if (!mhi_cntrl->tre_buf_cache) {
+		ret = -ENOMEM;
+		goto err_destroy_ev_ring_el_cache;
+	}
+
+	mhi_cntrl->ring_item_cache = kmem_cache_create("mhi_ep_ring_item",
+							sizeof(struct mhi_ep_ring_item), 0,
+							0, NULL);
+	if (!mhi_cntrl->ev_ring_el_cache) {
+		ret = -ENOMEM;
+		goto err_destroy_tre_buf_cache;
+	}
+
 	INIT_WORK(&mhi_cntrl->state_work, mhi_ep_state_worker);
 	INIT_WORK(&mhi_cntrl->reset_work, mhi_ep_reset_worker);
 	INIT_WORK(&mhi_cntrl->cmd_ring_work, mhi_ep_cmd_ring_worker);
@@ -1399,7 +1426,7 @@ int mhi_ep_register_controller(struct mhi_ep_cntrl *mhi_cntrl,
 	mhi_cntrl->wq = alloc_workqueue("mhi_ep_wq", 0, 0);
 	if (!mhi_cntrl->wq) {
 		ret = -ENOMEM;
-		goto err_free_cmd;
+		goto err_destroy_ring_item_cache;
 	}
 
 	INIT_LIST_HEAD(&mhi_cntrl->st_transition_list);
@@ -1458,6 +1485,12 @@ int mhi_ep_register_controller(struct mhi_ep_cntrl *mhi_cntrl,
 	ida_free(&mhi_ep_cntrl_ida, mhi_cntrl->index);
 err_destroy_wq:
 	destroy_workqueue(mhi_cntrl->wq);
+err_destroy_ring_item_cache:
+	kmem_cache_destroy(mhi_cntrl->ring_item_cache);
+err_destroy_ev_ring_el_cache:
+	kmem_cache_destroy(mhi_cntrl->ev_ring_el_cache);
+err_destroy_tre_buf_cache:
+	kmem_cache_destroy(mhi_cntrl->tre_buf_cache);
 err_free_cmd:
 	kfree(mhi_cntrl->mhi_cmd);
 err_free_ch:
@@ -1479,6 +1512,9 @@ void mhi_ep_unregister_controller(struct mhi_ep_cntrl *mhi_cntrl)
 
 	free_irq(mhi_cntrl->irq, mhi_cntrl);
 
+	kmem_cache_destroy(mhi_cntrl->tre_buf_cache);
+	kmem_cache_destroy(mhi_cntrl->ev_ring_el_cache);
+	kmem_cache_destroy(mhi_cntrl->ring_item_cache);
 	kfree(mhi_cntrl->mhi_cmd);
 	kfree(mhi_cntrl->mhi_chan);
 
diff --git a/include/linux/mhi_ep.h b/include/linux/mhi_ep.h
index f198a8ac7ee7..ce85d42b685d 100644
--- a/include/linux/mhi_ep.h
+++ b/include/linux/mhi_ep.h
@@ -128,6 +128,9 @@ struct mhi_ep_cntrl {
 	struct work_struct reset_work;
 	struct work_struct cmd_ring_work;
 	struct work_struct ch_ring_work;
+	struct kmem_cache *ring_item_cache;
+	struct kmem_cache *ev_ring_el_cache;
+	struct kmem_cache *tre_buf_cache;
 
 	void (*raise_irq)(struct mhi_ep_cntrl *mhi_cntrl, u32 vector);
 	int (*alloc_map)(struct mhi_ep_cntrl *mhi_cntrl, u64 pci_addr, phys_addr_t *phys_ptr,
-- 
2.25.1

