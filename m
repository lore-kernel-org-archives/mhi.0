Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B868F47
	for <mhi@lists.linux.dev>; Thu, 26 Oct 2023 04:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ih7wu2oz"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6b1e46ca282so458998b3a.2
        for <mhi@lists.linux.dev>; Wed, 25 Oct 2023 21:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698295830; x=1698900630; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zyw+tCacb0pesWXIiVE3DFUWnD0FKkDUZEIm1rsxoog=;
        b=Ih7wu2ozoPNC1uHjzMQT8/T/9+fYhJ4Ge3Ld+94M+5Dw4DGp5FGBM5PZDtTYmwOs2u
         v0Dpoo3kTXtU5/l0tgPP4LJ3J6+Uyky5VctGSlsPGx0gXpp3Oz8R1GRNvqb8h7e9bIVY
         0rYEVuYUER2twWJe3sLbSbAXbGC0YFMOvxyiKosL4USVB/9CTCXe8f9bJHMthbeG/Uwp
         Z8YX1DvB0JMAIcPtA5XXMALvdurpMU9wEehS/GfXTV+8VWorysWSd581J1h3zEKRgr9i
         s47fbcR+1qhsl1utcF7RZbJ5YbTcu7Br/D+W76QZ2IB7FfWZoP3doHY6m0eV5ANlnEQQ
         6TSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698295830; x=1698900630;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zyw+tCacb0pesWXIiVE3DFUWnD0FKkDUZEIm1rsxoog=;
        b=dGTZ9okJ/JqhHYSBW+E94+5ZWqbTALa+/EJxCMFfdZyjcq6EhLsmwUr1LCLrmG7GEh
         DIOz5QBQhFoabuMgbK8zZWzVVjAtKw4IlA/9DlG2lEfFvBqbVK749LCIk+KCq5c9ZMhn
         y6WBiDxcbxmzMeu62pNY/kfcAYqetWW1CTKPvP+WZcdmefci2PZefPwmw2PjzTtHDPH8
         Ap9HLlTeOYm7y17eufg4jCgbtaZppcYOFdrM3aruAW+3lFnJROxYkchm4PxHwcCn26Kk
         46azELkSnFTEVHG+vhr36TkRQSP/MP2K3Ngfx6qWF/rQWoI6svmCqQrgI7voPN3zwnmm
         iVzQ==
X-Gm-Message-State: AOJu0YyCA7LXXqU9HTxEtEOZ28dEtc47PMaW6XqMO8oZQy3mPy0NbTkS
	k8h+RWZbhoJT2trj00rgJTgAEoCR3xB2nVPY/A==
X-Google-Smtp-Source: AGHT+IH0dhRidMhQSTgnbwk8LPrmRtaFDLXg4YO8o0Mu9UK5b5D0KSlXE2bAlCFTB2cZpvmkxxre+w==
X-Received: by 2002:a05:6a21:9710:b0:172:eda5:36eb with SMTP id ub16-20020a056a21971000b00172eda536ebmr6384929pzb.55.1698295830463;
        Wed, 25 Oct 2023 21:50:30 -0700 (PDT)
Received: from localhost.localdomain ([103.28.246.120])
        by smtp.gmail.com with ESMTPSA id lr13-20020a17090b4b8d00b0027cbc50b826sm718225pjb.17.2023.10.25.21.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 21:49:53 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: mhi@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Alex Elder <elder@linaro.org>
Subject: [PATCH v2] bus: mhi: ep: Use slab allocator where applicable
Date: Thu, 26 Oct 2023 10:19:32 +0530
Message-Id: <20231026044932.11745-1-manivannan.sadhasivam@linaro.org>
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

Changes in v2:

* Rebased on top of mhi-next.

 drivers/bus/mhi/ep/main.c | 70 +++++++++++++++++++++++++++++----------
 include/linux/mhi_ep.h    |  3 ++
 2 files changed, 56 insertions(+), 17 deletions(-)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index e2513f5f47a6..b5af23f0e65a 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -74,7 +74,8 @@ static int mhi_ep_send_completion_event(struct mhi_ep_cntrl *mhi_cntrl, struct m
 	struct mhi_ring_element *event;
 	int ret;
 
-	event = kzalloc(sizeof(struct mhi_ring_element), GFP_KERNEL);
+	event = kmem_cache_zalloc(mhi_cntrl->ev_ring_el_cache,
+				   GFP_KERNEL | GFP_DMA);
 	if (!event)
 		return -ENOMEM;
 
@@ -83,7 +84,7 @@ static int mhi_ep_send_completion_event(struct mhi_ep_cntrl *mhi_cntrl, struct m
 	event->dword[1] = MHI_TRE_EV_DWORD1(ring->ch_id, MHI_PKT_TYPE_TX_EVENT);
 
 	ret = mhi_ep_send_event(mhi_cntrl, ring->er_index, event, MHI_TRE_DATA_GET_BEI(tre));
-	kfree(event);
+	kmem_cache_free(mhi_cntrl->ev_ring_el_cache, event);
 
 	return ret;
 }
@@ -93,7 +94,8 @@ int mhi_ep_send_state_change_event(struct mhi_ep_cntrl *mhi_cntrl, enum mhi_stat
 	struct mhi_ring_element *event;
 	int ret;
 
-	event = kzalloc(sizeof(struct mhi_ring_element), GFP_KERNEL);
+	event = kmem_cache_zalloc(mhi_cntrl->ev_ring_el_cache,
+				   GFP_KERNEL | GFP_DMA);
 	if (!event)
 		return -ENOMEM;
 
@@ -101,7 +103,7 @@ int mhi_ep_send_state_change_event(struct mhi_ep_cntrl *mhi_cntrl, enum mhi_stat
 	event->dword[1] = MHI_SC_EV_DWORD1(MHI_PKT_TYPE_STATE_CHANGE_EVENT);
 
 	ret = mhi_ep_send_event(mhi_cntrl, 0, event, 0);
-	kfree(event);
+	kmem_cache_free(mhi_cntrl->ev_ring_el_cache, event);
 
 	return ret;
 }
@@ -111,7 +113,8 @@ int mhi_ep_send_ee_event(struct mhi_ep_cntrl *mhi_cntrl, enum mhi_ee_type exec_e
 	struct mhi_ring_element *event;
 	int ret;
 
-	event = kzalloc(sizeof(struct mhi_ring_element), GFP_KERNEL);
+	event = kmem_cache_zalloc(mhi_cntrl->ev_ring_el_cache,
+				   GFP_KERNEL | GFP_DMA);
 	if (!event)
 		return -ENOMEM;
 
@@ -119,7 +122,7 @@ int mhi_ep_send_ee_event(struct mhi_ep_cntrl *mhi_cntrl, enum mhi_ee_type exec_e
 	event->dword[1] = MHI_SC_EV_DWORD1(MHI_PKT_TYPE_EE_EVENT);
 
 	ret = mhi_ep_send_event(mhi_cntrl, 0, event, 0);
-	kfree(event);
+	kmem_cache_free(mhi_cntrl->ev_ring_el_cache, event);
 
 	return ret;
 }
@@ -130,7 +133,8 @@ static int mhi_ep_send_cmd_comp_event(struct mhi_ep_cntrl *mhi_cntrl, enum mhi_e
 	struct mhi_ring_element *event;
 	int ret;
 
-	event = kzalloc(sizeof(struct mhi_ring_element), GFP_KERNEL);
+	event = kmem_cache_zalloc(mhi_cntrl->ev_ring_el_cache,
+				   GFP_KERNEL | GFP_DMA);
 	if (!event)
 		return -ENOMEM;
 
@@ -139,7 +143,7 @@ static int mhi_ep_send_cmd_comp_event(struct mhi_ep_cntrl *mhi_cntrl, enum mhi_e
 	event->dword[1] = MHI_CC_EV_DWORD1(MHI_PKT_TYPE_CMD_COMPLETION_EVENT);
 
 	ret = mhi_ep_send_event(mhi_cntrl, 0, event, 0);
-	kfree(event);
+	kmem_cache_free(mhi_cntrl->ev_ring_el_cache, event);
 
 	return ret;
 }
@@ -451,7 +455,7 @@ static int mhi_ep_process_ch_ring(struct mhi_ep_ring *ring, struct mhi_ring_elem
 		mhi_chan->xfer_cb(mhi_chan->mhi_dev, &result);
 	} else {
 		/* UL channel */
-		result.buf_addr = kzalloc(len, GFP_KERNEL);
+		result.buf_addr = kmem_cache_zalloc(mhi_cntrl->tre_buf_cache, GFP_KERNEL | GFP_DMA);
 		if (!result.buf_addr)
 			return -ENOMEM;
 
@@ -459,7 +463,7 @@ static int mhi_ep_process_ch_ring(struct mhi_ep_ring *ring, struct mhi_ring_elem
 			ret = mhi_ep_read_channel(mhi_cntrl, ring, &result, len);
 			if (ret < 0) {
 				dev_err(&mhi_chan->mhi_dev->dev, "Failed to read channel\n");
-				kfree(result.buf_addr);
+				kmem_cache_free(mhi_cntrl->tre_buf_cache, result.buf_addr);
 				return ret;
 			}
 
@@ -471,7 +475,7 @@ static int mhi_ep_process_ch_ring(struct mhi_ep_ring *ring, struct mhi_ring_elem
 			/* Read until the ring becomes empty */
 		} while (!mhi_ep_queue_is_empty(mhi_chan->mhi_dev, DMA_TO_DEVICE));
 
-		kfree(result.buf_addr);
+		kmem_cache_free(mhi_cntrl->tre_buf_cache, result.buf_addr);
 	}
 
 	return 0;
@@ -780,14 +784,14 @@ static void mhi_ep_ch_ring_worker(struct work_struct *work)
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
 
@@ -799,12 +803,12 @@ static void mhi_ep_ch_ring_worker(struct work_struct *work)
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
 
@@ -860,7 +864,7 @@ static void mhi_ep_queue_channel_db(struct mhi_ep_cntrl *mhi_cntrl, unsigned lon
 		u32 ch_id = ch_idx + i;
 
 		ring = &mhi_cntrl->mhi_chan[ch_id].ring;
-		item = kzalloc(sizeof(*item), GFP_ATOMIC);
+		item = kmem_cache_zalloc(mhi_cntrl->ring_item_cache, GFP_ATOMIC);
 		if (!item)
 			return;
 
@@ -1407,6 +1411,29 @@ int mhi_ep_register_controller(struct mhi_ep_cntrl *mhi_cntrl,
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
@@ -1415,7 +1442,7 @@ int mhi_ep_register_controller(struct mhi_ep_cntrl *mhi_cntrl,
 	mhi_cntrl->wq = alloc_workqueue("mhi_ep_wq", 0, 0);
 	if (!mhi_cntrl->wq) {
 		ret = -ENOMEM;
-		goto err_free_cmd;
+		goto err_destroy_ring_item_cache;
 	}
 
 	INIT_LIST_HEAD(&mhi_cntrl->st_transition_list);
@@ -1474,6 +1501,12 @@ int mhi_ep_register_controller(struct mhi_ep_cntrl *mhi_cntrl,
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
@@ -1495,6 +1528,9 @@ void mhi_ep_unregister_controller(struct mhi_ep_cntrl *mhi_cntrl)
 
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

base-commit: 12606ba1d46b34a241eb3d0956727e5379f0f626
-- 
2.25.1

