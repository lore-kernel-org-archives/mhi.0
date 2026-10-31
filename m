Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793470447;
	b=klo3fVNGKLqZP269l6SO55KApLPC9Osmqy/BBgGQl29j4Pa4awLxP0SzrNrNYbZgf5nD
	 yD0nbTH0ZnrU4kQL+rPoKT8BTauJZdfcypZ6B8Gnl66l3pa0UGmnpmWwCdCtiS/L18jDn
	 OC3LAV7p9GFc4X46F4NnlO69BmI3DM1CWt80qfE26O5OyR0YeENrFwVNNxlD4Vg7qUjuV
	 cZDOdtXGQXQj30gPzPT1VCeCa5+oYQ3HWDXm1uvt+dyfdRjGCHcZ5vU/fLzgjUTUQxcMa
	 6AUYipRnhIeTgyneKTPVBoYqFCKlGJLRr+vaR/N7tYoL+BemjK7bpZ2lqW0PXsuoBFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793470447;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HPgaghJrkhjhaTCDh5OHrX3iYY4k72sTTxon4CKmpQM=;
	b=gBQt5meW4j0btG3SfKXT1YHIwGAzwhMohMHjroYyakilHXH0takevegO5q+ATXEpwKB6
	 nKVEAaPdPtEJ+Gf4QXLaj7y5f+V+R6AOcDislRIyNox9R+8bej+/bhfeC47mDN0zGhNGO
	 qsZfbwTXZilv5bMrjkREytrCsnOp8SIjkYyxdFk/b/DWWfoPdGMCvoy20H918RK53ULb7
	 PP1Vv2uatYkzKIr+ts6oTvC6hGFhznph/2EKSQKeNl+HWkMCYiJoO6wzjL0JMd0ZXqaeW
	 9fKUy/IXrIMF0P/GwAH87it2U0IdI90C0n3RtoeAOlW+WiOqXvgs1g+zkmXH6UuRteQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FW8ul6C4;
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84F8606A32D
	for <mhi@lists.linux.dev>; Sat, 31 Oct 2026 18:14:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D84F8606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FW8ul6C4
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b4bd3d98bfso2009474a12.1
        for <mhi@lists.linux.dev>; Sat, 31 Oct 2026 11:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793470445; x=1794075245; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HPgaghJrkhjhaTCDh5OHrX3iYY4k72sTTxon4CKmpQM=;
        b=FW8ul6C4724ZxlBoArlYNjYlEv1gA9wGnUkonwKrt1WEr9qqwdp25qYaRloT075I/1
         bookqMRMQzavZUVMLKaQ9evKxqtSOXqcxnvaJV6c6V9e3/MFElv1Be+T3HSF5PZKX8vA
         WEUjRWYEJ6ewFWoXR1vHyBMn8Co1dMIfPXe1koYzNPvHbhwSb9+CrmGtHUC4TvwY2wkQ
         IWsKzC7X3U+hwjrv6y4s2Yqd7kukD/elbFf96VNZI80tUC2nqDwEcpDhg1MJyLBMoNFo
         1If4PacBVfxzfKOMLqszzTfDjFgkL2cql5kCFjPrS2/Vu3ihtn5lMMUGoizYFO1LRJPW
         /aNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793470445; x=1794075245;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HPgaghJrkhjhaTCDh5OHrX3iYY4k72sTTxon4CKmpQM=;
        b=GywSiTrxqLD+936MtSxB0srNcRaXNaFI6uxUFiGYjUvaggvOKos3ofbaNZRjtam7xz
         fnxcUaIS8xGt490vzAAV9NStlscwvj6Szil3N7hMO0mxg/sVJ/CRzSv4WRkGz+Tnx9Fg
         wy7PRMT7lp8ernQFoOKFsuG9eahC+1YZ/GCiMyJ0ic5uhaNPa/Z7u+JbPtBW7BqAauI6
         CCjcE6/r9evl7d8hyKoZZePjJ7DzdWSO5cWbYhSg3grRGIoilnidq8mRYZ/WCVyLUO4M
         B6PPoG0MNpkIZuk8tjKJT3r47pajaDpz/X/V1+zMCAw4lQrbGqrjKo0zHX+Al/frL6Ml
         RrEQ==
X-Gm-Message-State: AFq9FYKLA9ZSX3BJm7MqFS2loUdFc8crOxD2A/D0MdjPki7Eaq4Sdx6g
	EZwVaYnKX/F9GfAMZXUatNoN7ip3E9L8vSMQJtPGS788fTQeNAHvvG/Vybtci8M55xk=
X-Gm-Gg: AYBFou26qS1k0QjM5Uv8iBvL1USLthKCqb4ODWlHR52Vf2JApwiI3U3aX3WjjDbWv6b
	V1Gn0zr5C62cxPzfSTP/9hc9m7n0MT5MyI5fNDv2TgUc9no1ujc1XWAK1jc2OoMRXeeCwAnauE/
	G32Nzg6Vf3OQkU0R1VwtA4JAzlgpl3d5n1gJ7/iUTsEyCgqryQLoSj8erH0GgOBXJjhn9mOPzeP
	OiW088cGFWxg39hTAq4dKeiJb7CsAPrURAB9K77t5A4RZyc0OgvTHeT5d/YEImR0JpaSBQLHs0i
	oiEiT9//pmmWuT4PJnuwukeugL75ZzpN1MK/jhOc7G4P26PmyIXnu2SjSjhc7tLkJ9nxZ6Odx73
	pvd730+vCHLsstoKUq46rFc53myTbcfev7Ur5oOWUTVOn3G5aFYQ/znTsl8zv2CM17flevZFvwO
	Bp3m/wrIaID2U66C0KbsSukotzO2cDUN61Uir596L9uwdybeffLpn7i4aidkVJZLfPl4TYQdAsj
	7g63u5/ebqPplBrE/Tm88t2/w66tQmeb+++7YibOgGgFjtyv/ZD08bMtP7UkoiOKzQYwz2kQlQr
	xeap/nUfuzkhC0T49o8D8QTePx1oaKdJ+ddUc/oJp0r3Q1NsMH2CJ2AZmkFGKFl7m8wqVBg1Xgj
	tHl61GlTO5dJ6a7Xx
X-Received: by 2002:a05:6402:15:b0:6b3:a1ad:ef6d with SMTP id 4fb4d7f45d1cf-6b4d33c6910mr3217700a12.6.1793470445038;
        Sat, 31 Oct 2026 11:14:05 -0700 (PDT)
Received: from cachyos-x8664 (2a02-a44f-6bd8-0-365-d763-c748-da6c.fixed6.kpn.net. [2a02:a44f:6bd8:0:365:d763:c748:da6c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4ec9eeb26sm1223499a12.9.2026.10.31.11.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 11:14:03 -0700 (PDT)
From: Senna <sennas1633@gmail.com>
X-Google-Original-From: Senna <Sennas1633@gmail.com>
To: mhi@lists.linux.dev
Cc: mani@kernel.org,
	linux-arm-msm@vger.kernel.org,
	sumit.kumar@oss.qualcomm.com,
	Senna <Sennas1633@gmail.com>
Subject: [PATCH v2] bus: mhi: ep: Complete multi-TRE DL transfers after all TREs finish
Date: Sat, 31 Oct 2026 19:12:08 +0100
Message-ID: <20261031181208.19403-1-Sennas1633@gmail.com>
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

A buffer that spans several host TREs is written once per TRE, and the
client callback runs from each completion. A client that frees the
buffer from the callback, like the loopback driver, frees it while
later TREs still reference it and frees it again on the next callback.

Check up front that the TREs queued by the host can hold the whole
buffer, so a transfer does not run out of TREs halfway. Then track the
outstanding TREs of each transfer with a refcount and call the client
callback once, after all accepted TREs have completed. This does not
depend on write_async() completions being in order.

The queue functions now return 0 once at least one TRE has been
accepted. A later submission failure is reported through
transaction_status in the callback. A negative return still means
nothing was accepted and no callback will be issued. The path is shared
by raw buffers and SKBs, so both get the same handling.

A partial submission can still leave the host with OVERFLOW events and
no closing EOT. Fixing that needs a write_async() op that takes all
TREs of a buffer at once.

Fixes: f9ff616f5747 ("bus: mhi: ep: Add mhi_ep_queue_buf() API for raw buffer queuing")
Suggested-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Signed-off-by: Senna <Sennas1633@gmail.com>
---

Notes:
    Link to v1: https://lore.kernel.org/all/20261028175100.83406-1-Sennas1633@gmail.com/

    Changes in v2:
    - Check TRE room up front, as suggested by Sumit
    - Complete the client callback once after all accepted TREs finish, using a refcount, instead of relying on in-order completion
    - Report a later submission failure via transaction_status and document it
    - Also covers SKBs, since both share mhi_ep_queue()
    - Dropped the loopback.c error print from v1
    - Not tested on hardware; found by code inspection.

 drivers/bus/mhi/ep/main.c | 143 +++++++++++++++++++++++++++++++++-----
 include/linux/mhi_ep.h    |  30 ++++++--
 2 files changed, 147 insertions(+), 26 deletions(-)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index 4be20c368536..a4b0ef2fa4d9 100644
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
@@ -504,7 +506,33 @@ static int mhi_ep_process_ch_ring(struct mhi_ep_ring *ring)
 	return 0;
 }
 
-static void mhi_ep_buf_completion(struct mhi_ep_buf_info *buf_info)
+struct mhi_ep_buf_tx {
+	struct mhi_ep_device *mhi_dev;
+	void *buf;
+	refcount_t pending;
+	spinlock_t lock; /* protects bytes_xferd and status */
+	size_t bytes_xferd;
+	int status;
+	bool queued;
+};
+
+/* Check that the TREs queued by the host can hold @len before queueing any */
+static bool mhi_ep_queue_has_room(struct mhi_ep_ring *ring,
+				  struct mhi_ep_chan *mhi_chan, size_t len)
+{
+	size_t rd = mhi_chan->rd_offset;
+
+	while (len && rd != ring->wr_offset) {
+		struct mhi_ring_element *el = &ring->ring_cache[rd];
+
+		len -= min_t(size_t, len, MHI_TRE_DATA_GET_LEN(el));
+		rd = (rd + 1) % ring->ring_size;
+	}
+
+	return !len;
+}
+
+static int mhi_ep_send_buf_completion(struct mhi_ep_buf_info *buf_info)
 {
 	struct mhi_ep_device *mhi_dev = buf_info->mhi_dev;
 	struct mhi_ep_cntrl *mhi_cntrl = mhi_dev->mhi_cntrl;
@@ -512,25 +540,55 @@ static void mhi_ep_buf_completion(struct mhi_ep_buf_info *buf_info)
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
 }
 
 /* TODO: Handle partially formed TDs */
@@ -541,11 +599,14 @@ static int mhi_ep_queue(struct mhi_ep_device *mhi_dev, void *buf, size_t len,
 	struct mhi_ep_chan *mhi_chan = mhi_dev->dl_chan;
 	struct device *dev = &mhi_chan->mhi_dev->dev;
 	struct mhi_ep_buf_info buf_info = {};
+	struct mhi_ep_buf_tx *tx;
 	struct mhi_ring_element *el;
 	size_t buf_left, read_offset;
 	struct mhi_ep_ring *ring;
 	size_t tr_len;
 	u32 tre_len;
+	bool queued = false;
+	unsigned long flags;
 	int ret;
 
 	buf_left = len;
@@ -553,14 +614,32 @@ static int mhi_ep_queue(struct mhi_ep_device *mhi_dev, void *buf, size_t len,
 
 	mutex_lock(&mhi_chan->lock);
 
-	do {
-		/* Don't process the transfer ring if the channel is not in RUNNING state */
-		if (mhi_chan->state != MHI_CH_STATE_RUNNING) {
-			dev_err(dev, "Channel not available\n");
-			ret = -ENODEV;
-			goto err_exit;
-		}
+	/* Don't process the transfer ring if the channel is not in RUNNING state */
+	if (mhi_chan->state != MHI_CH_STATE_RUNNING) {
+		dev_err(dev, "Channel not available\n");
+		ret = -ENODEV;
+		goto err_unlock;
+	}
+
+	/* Don't start the transfer if the host TREs can't hold the whole buffer */
+	if (!mhi_ep_queue_has_room(ring, mhi_chan, len)) {
+		dev_err(dev, "Not enough TREs available\n");
+		ret = -ENOSPC;
+		goto err_unlock;
+	}
 
+	tx = kzalloc_obj(*tx, GFP_KERNEL);
+	if (!tx) {
+		mutex_unlock(&mhi_chan->lock);
+		return -ENOMEM;
+	}
+
+	tx->mhi_dev = mhi_dev;
+	tx->buf = cb_buf;
+	refcount_set(&tx->pending, 1);
+	spin_lock_init(&tx->lock);
+
+	do {
 		if (mhi_ep_queue_is_empty(mhi_dev, DMA_FROM_DEVICE)) {
 			dev_err(dev, "TRE not available!\n");
 			ret = -ENOSPC;
@@ -576,8 +655,9 @@ static int mhi_ep_queue(struct mhi_ep_device *mhi_dev, void *buf, size_t len,
 		buf_info.dev_addr = buf + read_offset;
 		buf_info.host_addr = MHI_TRE_DATA_GET_PTR(el);
 		buf_info.size = tr_len;
+		refcount_inc(&tx->pending);
 		buf_info.cb = mhi_ep_buf_completion;
-		buf_info.cb_buf = cb_buf;
+		buf_info.cb_buf = tx;
 		buf_info.mhi_dev = mhi_dev;
 
 		/*
@@ -591,13 +671,19 @@ static int mhi_ep_queue(struct mhi_ep_device *mhi_dev, void *buf, size_t len,
 		else
 			buf_info.code = MHI_EV_CC_EOT;
 
+		/*
+		 * If a later write_async() fails, accepted TREs still reference
+		 * the buffer and the host may see OVERFLOW without a closing EOT.
+		 */
 		dev_dbg(dev, "Writing %zd bytes to channel (%u)\n", tr_len, ring->ch_id);
 		ret = mhi_cntrl->write_async(mhi_cntrl, &buf_info);
 		if (ret) {
 			dev_err(dev, "Error writing to the channel\n");
+			refcount_dec(&tx->pending);
 			goto err_exit;
 		}
 
+		queued = true;
 		buf_left -= tr_len;
 
 		/*
@@ -609,11 +695,30 @@ static int mhi_ep_queue(struct mhi_ep_device *mhi_dev, void *buf, size_t len,
 
 	mutex_unlock(&mhi_chan->lock);
 
+	tx->queued = true;
+	mhi_ep_buf_tx_put(tx, 0, 0);
+
 	return 0;
 
 err_exit:
 	mutex_unlock(&mhi_chan->lock);
 
+	if (queued) {
+		tx->queued = true;
+		spin_lock_irqsave(&tx->lock, flags);
+		if (!tx->status)
+			tx->status = ret;
+		spin_unlock_irqrestore(&tx->lock, flags);
+		ret = 0;
+	}
+
+	mhi_ep_buf_tx_put(tx, 0, 0);
+
+	return ret;
+
+err_unlock:
+	mutex_unlock(&mhi_chan->lock);
+
 	return ret;
 }
 
diff --git a/include/linux/mhi_ep.h b/include/linux/mhi_ep.h
index 852f331f03fd..76f77b35dfde 100644
--- a/include/linux/mhi_ep.h
+++ b/include/linux/mhi_ep.h
@@ -300,7 +300,16 @@ bool mhi_ep_queue_is_empty(struct mhi_ep_device *mhi_dev, enum dma_data_directio
  * @mhi_dev: Device associated with the DL channel
  * @skb: SKBs to be queued
  *
- * Return: 0 if the SKBs has been sent successfully, a negative error code otherwise.
+ * The DL transfer callback is invoked once after all accepted TREs for the
+ * SKB complete. If submitting a later TRE fails after at least one TRE was
+ * accepted, the callback reports the error through
+ * result->transaction_status.
+ *
+ * Return: 0 if one or more TREs were accepted. When the client callback is
+ * registered, it is invoked after all accepted TREs complete. If a later
+ * submission fails, check result->transaction_status in the callback. A
+ * negative error code is returned if no TRE was accepted and no callback will
+ * be issued.
  */
 int mhi_ep_queue_skb(struct mhi_ep_device *mhi_dev, struct sk_buff *skb);
 
@@ -309,14 +318,21 @@ int mhi_ep_queue_skb(struct mhi_ep_device *mhi_dev, struct sk_buff *skb);
  * @mhi_dev: Device associated with the DL channel
  * @buf: Buffer to be queued. On success, ownership passes to the MHI stack;
  *       the caller must not free @buf until the DL transfer callback fires
- *       with result->buf_addr equal to @buf. On failure, the caller retains
- *       ownership and must free @buf.
- *       Note: if @len spans multiple host DL TREs, the DL transfer callback
- *       fires once per TRE, each time with result->buf_addr equal to @buf.
+ *       with result->buf_addr equal to @buf. If no TRE is accepted, the
+ *       caller retains ownership and must free @buf.
  * @len: Size of the buffer
  *
- * Return: 0 if the buffer contents have been transferred successfully, a
- * negative error code otherwise.
+ * If @len spans multiple host DL TREs, the DL transfer callback fires once,
+ * after all accepted TREs complete. If write_async() fails on a later TRE
+ * after earlier TREs were queued, those transfers remain in flight and still
+ * reference @buf, and the host sees OVERFLOW events without a closing EOT.
+ * In this case, the callback reports the error through
+ * result->transaction_status.
+ *
+ * Return: 0 if one or more TREs were accepted. The client callback is invoked
+ * after all accepted TREs complete and reports a later submission failure
+ * through result->transaction_status. A negative error code is returned if no
+ * TRE was accepted and no callback will be issued.
  */
 int mhi_ep_queue_buf(struct mhi_ep_device *mhi_dev, void *buf, size_t len);
 
-- 
2.56.0

