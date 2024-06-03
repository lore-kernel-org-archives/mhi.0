Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A49136674
	for <mhi@lists.linux.dev>; Mon,  3 Jun 2024 16:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717433047; cv=none; b=HDn9biNj8awEhvUv6qRdpf2DP7SEUXeSgaju5mS3o1ZT6RHahptXUsgLDagyTi3dbdjWpG4qLhBlZNtknZxko36UuCD8wnwCQFwu0/U+JWPhXVYRnZsvUkMcEVFMwQpy4ddEEuMXnr5EB5QApnTI2atIlp2c07uDuAK4hPBv/dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717433047; c=relaxed/simple;
	bh=j9efUysIbU+0fDZp59JmxjJMpgDLHkYjIzf8rBgtCHo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=A5iE4CR0rlabidOnNFdFqyZ84WMWyNU4i2bQwokCyNeuQ1fqX3ejQ3QK7Ph5Fufs93brU4ni0kWvcKkgdANHXT6HKmL8InOexhY5bUFy81uKPb44QJnGB7sbxJCGMr6huTgqOP/iMN2cPu0G1uEJx1nAACy3jb54PrvasVvYCRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O+RbbcA3; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O+RbbcA3"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1f44b42e9a6so35713395ad.0
        for <mhi@lists.linux.dev>; Mon, 03 Jun 2024 09:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717433045; x=1718037845; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kQJCX2mLLjVwtGvAcK2JVSlXXTTlVczYVL9TcQ37x9I=;
        b=O+RbbcA3wlossbQYhPvFeIoQo5ZzBNSJ0YOkSkmcf/9y7MVxAltL7GMFxtppvY4gkG
         vMpVik+73inctngDseRuEPWiJCxQy+GDkvb/q9Q7J8d1ndjwJ6M4vS0ima9hFpFiHcfp
         zs9QgQHF1TdGt7jOP978cdkTi5kLS92RzivPNbHOb/vSklgnF313/WECpj+PFAQwMGKf
         YQkmxoz+YLlXnKZu7fQKwoo3OOVn6gR3pJG2Eat6VxA7Ko4GtrFflP0c1ABLcogOUUeh
         m9OwPcorxo6LMVRd9BRbCZC0qOxTUO/O5wGWtUKMs7H4kCyAkfvSUhE7mloJpwEqxILk
         Jg/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717433045; x=1718037845;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kQJCX2mLLjVwtGvAcK2JVSlXXTTlVczYVL9TcQ37x9I=;
        b=fDQLCKwyf0TnOU6WHLMGv8QmGVFLvWgCAdTZpXIAUIg1OqCO7X8fNA+VN4gpAdXyqM
         Zgz4KWhGEdGfVr7Yqk9dxRFiYSjBes8rixnw/K5WDYaV5/fAbLzUvaq+x6jZcHkm0vDC
         IOhT/XvNb0AF4LE8nGxcKR59S9EyCEtB1b6HWYQXboVsd6HJFYazmIZW7DU8gk3/k7CJ
         TZhupZN9rQcsGdHm0H4ro9ziv1fg5MKyXI1y5V7z3ZvNOP0A5kjcURuuYoA36uNlE5J/
         3YCXk/P0+2OgglltZTsYp6A1w+gkop8ahiFZINKaogl0QXKFfCemSb8vMBp4OdMt88NX
         huFQ==
X-Gm-Message-State: AOJu0YyHysj2K8KNpADotD3Qw4CaGt9Gc4/ONkG9gzqAuWveVzx6LtUK
	rL7wm6sjs4bMNLCSGyuYXL4lJ1e368eoEwAxu8UHmr+atz4oD1r2zP+dSc2TIC2PkeNy5gbaCDw
	=
X-Google-Smtp-Source: AGHT+IGYx+sx85xzgEc86M80PuqE2ZoS4273PGYCLxOQNlGQ9YXpPTVaa2w3bk5t3yHX6kqLl4+hdA==
X-Received: by 2002:a17:902:e546:b0:1f6:5bba:f134 with SMTP id d9443c01a7336-1f65bbaf520mr68933315ad.46.1717433045079;
        Mon, 03 Jun 2024 09:44:05 -0700 (PDT)
Received: from localhost.localdomain ([120.60.128.29])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f632401919sm67523825ad.248.2024.06.03.09.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 09:44:04 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: mhi@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH] bus: mhi: ep: Do not allocate memory for MHI objects from DMA zone
Date: Mon,  3 Jun 2024 22:13:54 +0530
Message-Id: <20240603164354.79035-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MHI endpoint stack accidentally started allocating memory for objects from
DMA zone since commit 62210a26cd4f ("bus: mhi: ep: Use slab allocator
where applicable"). But there is no real need to allocate memory from this
naturally limited DMA zone. This also causes the MHI endpoint stack to run
out of memory while doing high bandwidth transfers.

So let's switch over to normal memory.

Cc: stable@vger.kernel.org # 6.8
Fixes: 62210a26cd4f ("bus: mhi: ep: Use slab allocator where applicable")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/ep/main.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index f8f674adf1d4..4acfac73ca9a 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -90,7 +90,7 @@ static int mhi_ep_send_completion_event(struct mhi_ep_cntrl *mhi_cntrl, struct m
 	struct mhi_ring_element *event;
 	int ret;
 
-	event = kmem_cache_zalloc(mhi_cntrl->ev_ring_el_cache, GFP_KERNEL | GFP_DMA);
+	event = kmem_cache_zalloc(mhi_cntrl->ev_ring_el_cache, GFP_KERNEL);
 	if (!event)
 		return -ENOMEM;
 
@@ -109,7 +109,7 @@ int mhi_ep_send_state_change_event(struct mhi_ep_cntrl *mhi_cntrl, enum mhi_stat
 	struct mhi_ring_element *event;
 	int ret;
 
-	event = kmem_cache_zalloc(mhi_cntrl->ev_ring_el_cache, GFP_KERNEL | GFP_DMA);
+	event = kmem_cache_zalloc(mhi_cntrl->ev_ring_el_cache, GFP_KERNEL);
 	if (!event)
 		return -ENOMEM;
 
@@ -127,7 +127,7 @@ int mhi_ep_send_ee_event(struct mhi_ep_cntrl *mhi_cntrl, enum mhi_ee_type exec_e
 	struct mhi_ring_element *event;
 	int ret;
 
-	event = kmem_cache_zalloc(mhi_cntrl->ev_ring_el_cache, GFP_KERNEL | GFP_DMA);
+	event = kmem_cache_zalloc(mhi_cntrl->ev_ring_el_cache, GFP_KERNEL);
 	if (!event)
 		return -ENOMEM;
 
@@ -146,7 +146,7 @@ static int mhi_ep_send_cmd_comp_event(struct mhi_ep_cntrl *mhi_cntrl, enum mhi_e
 	struct mhi_ring_element *event;
 	int ret;
 
-	event = kmem_cache_zalloc(mhi_cntrl->ev_ring_el_cache, GFP_KERNEL | GFP_DMA);
+	event = kmem_cache_zalloc(mhi_cntrl->ev_ring_el_cache, GFP_KERNEL);
 	if (!event)
 		return -ENOMEM;
 
@@ -438,7 +438,7 @@ static int mhi_ep_read_channel(struct mhi_ep_cntrl *mhi_cntrl,
 		read_offset = mhi_chan->tre_size - mhi_chan->tre_bytes_left;
 		write_offset = len - buf_left;
 
-		buf_addr = kmem_cache_zalloc(mhi_cntrl->tre_buf_cache, GFP_KERNEL | GFP_DMA);
+		buf_addr = kmem_cache_zalloc(mhi_cntrl->tre_buf_cache, GFP_KERNEL);
 		if (!buf_addr)
 			return -ENOMEM;
 
@@ -1481,14 +1481,14 @@ int mhi_ep_register_controller(struct mhi_ep_cntrl *mhi_cntrl,
 
 	mhi_cntrl->ev_ring_el_cache = kmem_cache_create("mhi_ep_event_ring_el",
 							sizeof(struct mhi_ring_element), 0,
-							SLAB_CACHE_DMA, NULL);
+							0, NULL);
 	if (!mhi_cntrl->ev_ring_el_cache) {
 		ret = -ENOMEM;
 		goto err_free_cmd;
 	}
 
 	mhi_cntrl->tre_buf_cache = kmem_cache_create("mhi_ep_tre_buf", MHI_EP_DEFAULT_MTU, 0,
-						      SLAB_CACHE_DMA, NULL);
+						      0, NULL);
 	if (!mhi_cntrl->tre_buf_cache) {
 		ret = -ENOMEM;
 		goto err_destroy_ev_ring_el_cache;
-- 
2.25.1

