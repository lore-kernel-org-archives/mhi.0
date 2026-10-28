Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793209874;
	b=qC4Nv8ZPfvJ0yW72zH1kTiVBh959mbq3KjGSXOgL8MXhnXqcFTiigcQVTGMBNZWf71ih
	 Km5yxefVtHQPa2qZmOBL5wJx5sESrSVhSxQx/jb3G2RYwNxwE6fApazN0faiTFfcB9gUh
	 hPhFpkmvIjhDYIu9sip2cGZwxo7/7MpYj6YTIG3fNZuVrFDQDSCueE/4kWuqFZY7lsltg
	 l8Aerl7AtzCnRijfLREBn58Jx5iuWTo9OW9vUupkauWjymT5V3p28o444ZBcbIqB8Ybns
	 ALzT7RArWlgV3QVqN42kq5cueabkVb7GOtCpZKUdut9L6EqS8YZMCRMtWHQyqzbp8RA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793209874;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=v43fYjL5X0v05WZ0mlxoCxASofy9eK+d0SvMy+pQcbs=;
	b=OODIYkFIrkVLP/3tJ0QMtObi1DJBpA0ENPq9wYvy4H8dezpdhze8UQ1k1vkGVJXW7avn
	 8/OpD5ZwoKE+CQvX5P/QYnOM/x9VhLObTisj4qaTBmvyTCGVY6G7vBjZvBD85O24nxScw
	 eRexhQJBZ/nKUWQTNzgVUZSLnC+3feZng2XigdFH6KRsxf1tH2QIU/otUBBDMY2EHXSJx
	 HDu3rXn3pyM60VTEy+MCgL6f6V9I15ApxmcIC2EtwNeVS6cOBYi/dK8gOb3jZDntz99g1
	 0DDCLg9BuVrYbZqiy7oeB+/+eRRSSp1Mfji7N9OjR4amtVMfMPqKULkY99Er3kdorYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HgABsIu9;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93C4606A31D
	for <mhi@lists.linux.dev>; Wed, 28 Oct 2026 17:51:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C93C4606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HgABsIu9
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c450ab1483cso197032566b.3
        for <mhi@lists.linux.dev>; Wed, 28 Oct 2026 10:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793209872; x=1793814672; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v43fYjL5X0v05WZ0mlxoCxASofy9eK+d0SvMy+pQcbs=;
        b=HgABsIu96AOPOZVii689NTQhgj+QJ8kWUMYqemf1CWDtStTaLFBre/SlTowmvaqVq9
         TPBtT3uzZp/kZzeHiBgsIqPm91sHIIC3ANJUkN3NhZ9OUNK2b9yQKuQsXVkQYNaXs4p2
         yQ7qJwN/W7U3lWBRAeEpxyXOH6XORjuUFZfiIO1306GHsHueOptfF5ri3odPcXGb/WgY
         n+Zts97BjblMCYSqhZoJzwBPX8wk8ML36NViq1wyoHVqf3opyyIroS1+Y/URUbpblqEo
         Y4zwf/59/2w3W2+/QKZQgJcoaGTAPhxU9h7n9WhmyOB/ux/a6NAjGsLoO09DIHbYmUZ0
         eOgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793209872; x=1793814672;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v43fYjL5X0v05WZ0mlxoCxASofy9eK+d0SvMy+pQcbs=;
        b=ds/m+JdZvB+EOtzkraGPfnyhiEikrKQu3iJt+/bmIYYSCxII77nn2nKNOx6K+JVVMb
         sDnRbPRhWXsnvOj6Y3FUnWNhB51uSa9PpaODxKGgrbhQD/bhW66JaSuDP6FMbOEXl9YD
         YS9n9dhFceLLqYeKMOgPrSl855T4XhMiRh4mIOq4XuOHeDSYp36RqX7YnPYFAoEY7Iz7
         C65V4bgeGwB0ZatSssERIawp8wsKhhkwJ3UCw+wbwDxhvUtPXmr/PjWs2cKLNlcNedrm
         LvabKDX6zsaeWEskxlh0zfHna4Nq9gd9aN8bQa9XNhPeEjeBzpHqC/sssJnOnZrkGMtz
         JdIA==
X-Gm-Message-State: AFq9FYL17YwcoJYeaBG11jCzV4HhuMynzFCxlFUdL4Z4vtsqzoTD7yku
	+rcQlH1k5qtoREUA1LBeRs7csmDEhi+OfdXIjGuMIc4+5LfemoKPDD4nwEAL9RxA
X-Gm-Gg: AYBFou0MYIxkayqqwv3CpA2ncjsyDE1V+cWJWIP4C8DhITpcHcakbRV4poEng5ZIRRD
	mzkO/wXVSadyjtrsxGli49xSQUsqbfgMlvo7Vmtq0kZEpAyjUquXHA8d+q3JfGg7sEHp7EnbU5D
	0cvNl++OArUFQP9BdFtE7lic3gKO+bp228m/8X1PEhjYUb4bJAqjo9QGhqW1AZEkpl6HladuI9a
	WbHz9HLz6stSiJaBrvG+X537U5Jgc1hyXMdLre+dekZZi9B//4C735Iw8V5D8rVzTO+6T70zp67
	TUgmmqJhRxOt06hz8OEoudYt2SSi3Nz/aZMFNW/BeSs4bJ5jWoWYnhAxCG1IU+URvEIY2zgSFSq
	oRMjJgh2ukinUHECvgLhPGTWKlDyAmVuTanV6GOZ/6yORk2dCewVy4G1lvYwCqR2Z/9zfCc9FWj
	RkeTce7oRqm7h4RZGjWtCl2G76lu7IWDWeQ177JblIVzAAChfFipzkNgyO0DW3aRcGA1nbT/djv
	1Tc2C+4b5gynv4AGbuWnONHkVxKZX4Ol18yPTPXb5yLoRXrOm74Jbmn3Gprsk13TSVb4eXPY68D
	wdqtMzPxVa/rvZLh4PbPrKKMLgMENqgICxv+0IKFhJ0PXo1pyOu562kyEhknpWIdYz7nNsgXZ42
	+XXMdaO6HUSaiYA==
X-Received: by 2002:a17:907:d516:b0:c25:2688:8212 with SMTP id a640c23a62f3a-c49bd9ce44dmr320000866b.0.1793209871794;
        Wed, 28 Oct 2026 10:51:11 -0700 (PDT)
Received: from cachyos-x8664 (2a02-a44f-6bd8-0-365-d763-c748-da6c.fixed6.kpn.net. [2a02:a44f:6bd8:0:365:d763:c748:da6c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4e9995sm629906566b.15.2026.10.28.10.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 10:51:11 -0700 (PDT)
From: Senna <sennas1633@gmail.com>
X-Google-Original-From: Senna <Sennas1633@gmail.com>
To: mhi@lists.linux.dev
Cc: mani@kernel.org,
	linux-arm-msm@vger.kernel.org,
	Senna <Sennas1633@gmail.com>
Subject: [PATCH] bus: mhi: ep: aggregate raw buffer completions
Date: Wed, 28 Oct 2026 18:51:00 +0100
Message-ID: <20261028175100.83406-1-Sennas1633@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Post: <mailto:mhi@lists.linux.dev>
List-Help: <mailto:mhi+help@lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mhi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Aggregate raw-buffer completions in the endpoint core and invoke the
client callback once after all accepted TREs complete. This prevents
the loopback worker from freeing a buffer still referenced by an earlier
asynchronous submission.

Fixes: 0b1883ca75c0 ("bus: mhi: ep: clients: Add loopback driver for data path testing")
Signed-off-by: Senna <Sennas1633@gmail.com>
---
 drivers/bus/mhi/ep/clients/loopback.c |   4 +
 drivers/bus/mhi/ep/main.c             | 131 ++++++++++++++++++++++----
 include/linux/mhi_ep.h                |  19 ++--
 3 files changed, 130 insertions(+), 24 deletions(-)

diff --git a/drivers/bus/mhi/ep/clients/loopback.c b/drivers/bus/mhi/ep/clients/loopback.c
index c7452428d0b7..6f6a1b5a51c4 100644
--- a/drivers/bus/mhi/ep/clients/loopback.c
+++ b/drivers/bus/mhi/ep/clients/loopback.c
@@ -71,6 +71,10 @@ static void mhi_ep_loopback_ul_callback(struct mhi_ep_device *mhi_dev,
 static void mhi_ep_loopback_dl_callback(struct mhi_ep_device *mhi_dev,
 					struct mhi_result *mhi_res)
 {
+	if (mhi_res->transaction_status)
+		dev_err(&mhi_dev->dev, "Downlink transfer failed: %d\n",
+			mhi_res->transaction_status);
+
 	kfree(mhi_res->buf_addr);
 }
 
diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index 4be20c368536..ec3f5cca66e7 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -14,6 +14,8 @@
 #include <linux/irq.h>
 #include <linux/mhi_ep.h>
 #include <linux/module.h>
+#include <linux/refcount.h>
+#include <linux/spinlock.h>
 #include "internal.h"
 
 #define M0_WAIT_DELAY_MS	100
@@ -504,7 +506,17 @@ static int mhi_ep_process_ch_ring(struct mhi_ep_ring *ring)
 	return 0;
 }
 
-static void mhi_ep_buf_completion(struct mhi_ep_buf_info *buf_info)
+struct mhi_ep_buf_tx {
+	struct mhi_ep_device *mhi_dev;
+	void *buf;
+	refcount_t pending;
+	spinlock_t lock;
+	size_t bytes_xferd;
+	int status;
+	bool queued;
+};
+
+static int mhi_ep_send_buf_completion(struct mhi_ep_buf_info *buf_info)
 {
 	struct mhi_ep_device *mhi_dev = buf_info->mhi_dev;
 	struct mhi_ep_cntrl *mhi_cntrl = mhi_dev->mhi_cntrl;
@@ -512,42 +524,101 @@ static void mhi_ep_buf_completion(struct mhi_ep_buf_info *buf_info)
 	struct mhi_ep_ring *ring = &mhi_cntrl->mhi_chan[mhi_chan->chan].ring;
 	struct mhi_ring_element *el = &ring->ring_cache[ring->rd_offset];
 	struct device *dev = &mhi_dev->dev;
-	struct mhi_result result = {};
 	int ret;
 
-	if (mhi_chan->xfer_cb) {
-		result.buf_addr = buf_info->cb_buf;
-		result.dir = mhi_chan->dir;
-		result.bytes_xferd = buf_info->size;
-
-		mhi_chan->xfer_cb(mhi_dev, &result);
-	}
-
 	ret = mhi_ep_send_completion_event(mhi_cntrl, ring, el, buf_info->size,
 					   buf_info->code);
 	if (ret) {
 		dev_err(dev, "Error sending transfer completion event\n");
-		return;
+		return ret;
 	}
 
 	mhi_ep_ring_inc_index(ring);
+
+	return 0;
+}
+
+static void mhi_ep_buf_tx_put(struct mhi_ep_buf_tx *tx, size_t bytes_xferd,
+			      int status)
+{
+	struct mhi_ep_chan *mhi_chan = tx->mhi_dev->dl_chan;
+	struct mhi_result result = {
+		.buf_addr = tx->buf,
+		.dir = mhi_chan->dir,
+	};
+	unsigned long flags;
+
+	spin_lock_irqsave(&tx->lock, flags);
+	tx->bytes_xferd += bytes_xferd;
+	if (status && !tx->status)
+		tx->status = status;
+	spin_unlock_irqrestore(&tx->lock, flags);
+
+	if (!refcount_dec_and_test(&tx->pending))
+		return;
+
+	if (tx->queued && mhi_chan->xfer_cb) {
+		result.bytes_xferd = tx->bytes_xferd;
+		result.transaction_status = tx->status;
+		mhi_chan->xfer_cb(tx->mhi_dev, &result);
+	}
+
+	kfree(tx);
+}
+
+static void mhi_ep_buf_completion(struct mhi_ep_buf_info *buf_info)
+{
+	struct mhi_ep_buf_tx *tx = buf_info->cb_buf;
+	int ret;
+
+	ret = mhi_ep_send_buf_completion(buf_info);
+	mhi_ep_buf_tx_put(tx, buf_info->size, ret);
+}
+
+static void mhi_ep_skb_completion(struct mhi_ep_buf_info *buf_info)
+{
+	struct mhi_ep_device *mhi_dev = buf_info->mhi_dev;
+	struct mhi_ep_chan *mhi_chan = mhi_dev->dl_chan;
+	struct mhi_result result = {
+		.buf_addr = buf_info->cb_buf,
+		.bytes_xferd = buf_info->size,
+		.dir = mhi_chan->dir,
+	};
+
+	if (mhi_chan->xfer_cb)
+		mhi_chan->xfer_cb(mhi_dev, &result);
+
+	mhi_ep_send_buf_completion(buf_info);
 }
 
 /* TODO: Handle partially formed TDs */
 static int mhi_ep_queue(struct mhi_ep_device *mhi_dev, void *buf, size_t len,
-			void *cb_buf)
+			void *cb_buf, bool aggregate)
 {
 	struct mhi_ep_cntrl *mhi_cntrl = mhi_dev->mhi_cntrl;
 	struct mhi_ep_chan *mhi_chan = mhi_dev->dl_chan;
 	struct device *dev = &mhi_chan->mhi_dev->dev;
 	struct mhi_ep_buf_info buf_info = {};
+	struct mhi_ep_buf_tx *tx = NULL;
 	struct mhi_ring_element *el;
 	size_t buf_left, read_offset;
 	struct mhi_ep_ring *ring;
 	size_t tr_len;
 	u32 tre_len;
+	bool queued = false;
 	int ret;
 
+	if (aggregate) {
+		tx = kzalloc_obj(*tx, GFP_KERNEL);
+		if (!tx)
+			return -ENOMEM;
+
+		tx->mhi_dev = mhi_dev;
+		tx->buf = cb_buf;
+		refcount_set(&tx->pending, 1);
+		spin_lock_init(&tx->lock);
+	}
+
 	buf_left = len;
 	ring = &mhi_cntrl->mhi_chan[mhi_chan->chan].ring;
 
@@ -576,8 +647,14 @@ static int mhi_ep_queue(struct mhi_ep_device *mhi_dev, void *buf, size_t len,
 		buf_info.dev_addr = buf + read_offset;
 		buf_info.host_addr = MHI_TRE_DATA_GET_PTR(el);
 		buf_info.size = tr_len;
-		buf_info.cb = mhi_ep_buf_completion;
-		buf_info.cb_buf = cb_buf;
+		if (tx) {
+			refcount_inc(&tx->pending);
+			buf_info.cb = mhi_ep_buf_completion;
+			buf_info.cb_buf = tx;
+		} else {
+			buf_info.cb = mhi_ep_skb_completion;
+			buf_info.cb_buf = cb_buf;
+		}
 		buf_info.mhi_dev = mhi_dev;
 
 		/*
@@ -595,9 +672,12 @@ static int mhi_ep_queue(struct mhi_ep_device *mhi_dev, void *buf, size_t len,
 		ret = mhi_cntrl->write_async(mhi_cntrl, &buf_info);
 		if (ret) {
 			dev_err(dev, "Error writing to the channel\n");
+			if (tx)
+				refcount_dec(&tx->pending);
 			goto err_exit;
 		}
 
+		queued = true;
 		buf_left -= tr_len;
 
 		/*
@@ -609,23 +689,42 @@ static int mhi_ep_queue(struct mhi_ep_device *mhi_dev, void *buf, size_t len,
 
 	mutex_unlock(&mhi_chan->lock);
 
+	if (tx) {
+		tx->queued = true;
+		mhi_ep_buf_tx_put(tx, 0, 0);
+	}
+
 	return 0;
 
 err_exit:
 	mutex_unlock(&mhi_chan->lock);
 
+	if (tx) {
+		if (queued) {
+			unsigned long flags;
+
+			spin_lock_irqsave(&tx->lock, flags);
+			tx->queued = true;
+			tx->status = ret;
+			spin_unlock_irqrestore(&tx->lock, flags);
+			ret = 0;
+		}
+
+		mhi_ep_buf_tx_put(tx, 0, 0);
+	}
+
 	return ret;
 }
 
 int mhi_ep_queue_skb(struct mhi_ep_device *mhi_dev, struct sk_buff *skb)
 {
-	return mhi_ep_queue(mhi_dev, skb->data, skb->len, skb);
+	return mhi_ep_queue(mhi_dev, skb->data, skb->len, skb, false);
 }
 EXPORT_SYMBOL_GPL(mhi_ep_queue_skb);
 
 int mhi_ep_queue_buf(struct mhi_ep_device *mhi_dev, void *buf, size_t len)
 {
-	return mhi_ep_queue(mhi_dev, buf, len, buf);
+	return mhi_ep_queue(mhi_dev, buf, len, buf, true);
 }
 EXPORT_SYMBOL_GPL(mhi_ep_queue_buf);
 
diff --git a/include/linux/mhi_ep.h b/include/linux/mhi_ep.h
index 852f331f03fd..ac4f484373ee 100644
--- a/include/linux/mhi_ep.h
+++ b/include/linux/mhi_ep.h
@@ -307,16 +307,19 @@ int mhi_ep_queue_skb(struct mhi_ep_device *mhi_dev, struct sk_buff *skb);
 /**
  * mhi_ep_queue_buf - Transfer buffer contents to host over MHI Endpoint
  * @mhi_dev: Device associated with the DL channel
- * @buf: Buffer to be queued. On success, ownership passes to the MHI stack;
- *       the caller must not free @buf until the DL transfer callback fires
- *       with result->buf_addr equal to @buf. On failure, the caller retains
- *       ownership and must free @buf.
- *       Note: if @len spans multiple host DL TREs, the DL transfer callback
- *       fires once per TRE, each time with result->buf_addr equal to @buf.
+ * @buf: Buffer to be queued. If at least one TRE is queued, ownership passes
+ *       to the MHI stack and the DL transfer callback fires once after all
+ *       queued TREs complete, with result->buf_addr equal to @buf and
+ *       result->bytes_xferd equal to the total completed bytes. If queuing
+ *       fails before any TRE is accepted, the caller retains ownership.
+ *       A failure after a TRE has been accepted is reported through
+ *       result->transaction_status in the callback.
  * @len: Size of the buffer
  *
- * Return: 0 if the buffer contents have been transferred successfully, a
- * negative error code otherwise.
+ * Return: 0 if one or more TREs were accepted, including when a later TRE
+ * submission fails. In that case, the callback reports the error after all
+ * accepted TREs complete. A negative error code is returned if no TRE was
+ * accepted and no callback will be issued.
  */
 int mhi_ep_queue_buf(struct mhi_ep_device *mhi_dev, void *buf, size_t len);
 
-- 
2.56.0

