Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2623E3438A2
	for <mhi@lists.linux.dev>; Wed, 10 Jun 2026 05:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781070773; cv=none; b=ogT+/Oc3pzthmrxe6Rl6cXczq/DMNk7nWXa3RkFXHgxGHWF+VpE2/wSphqCEbHRwwHa/6deL0w6a7OtZ8n+HA/+9qqSwJ/2RSQIUDToTnTezJPnFINdSpUvwXtwAaITSBSCRuu9GzsyHVeLKY7jAY9ixi3mquEgzb72sE2frwyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781070773; c=relaxed/simple;
	bh=kPiK4VVYK2YYSSKt+UOoRg5CfNLvCgE5KlbH1vf/nME=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZzE90LRJrTyNMpbcM9YJ2CoPQiRGqMU/dT7AGJniAhtSUxb4ykWlkENjL+KFSmva/5Cyt2EfzDOhUR1Af8u2Cw/CD3//I80OoBDuE2871EuAHn7QO2/05miziQrH0ihW9W1YYKCL5A2pEq+rVTL3QgME5oOXdZ7BVh36xrI7DOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jpDXfsIT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ShXhvctC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jpDXfsIT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ShXhvctC"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A2ehxH3999688
	for <mhi@lists.linux.dev>; Wed, 10 Jun 2026 05:52:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	avk5meTGBcIz3G48y/NS8SFzaal/HS1a4+vUZxSJN6o=; b=jpDXfsIT4AT4ka9V
	kFpZtT7578UkocoomF56qut2haoZtqeJoPeXeKJcyhW8LXhspVLysomeYybXw0Gt
	zhMYWTgeWZ3B0stIFdOtQTjA1CzFZLA0XZTnL/yMSVeQHkF8HNgO13GS/PqRsHpX
	dIPb33a+v3SXukEuUCjJUSWs+r1cU8cns6cvkXNm1Xz0lfiSGMy3bf0yRX2tAv33
	90JglukacCflDwjlcY5GFWhRc1L6EUc2PASloykGTI8+R90DNB7g6tJFyvjk48hq
	UnA6wJ79hxjXcdDQEEq37cPEdBHOY9YVOLbDdY+hhnynzMS1Y20RuvemP6l8mnkI
	xXKKBw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epxuvgnu2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Wed, 10 Jun 2026 05:52:51 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf243973c2so44373595ad.1
        for <mhi@lists.linux.dev>; Tue, 09 Jun 2026 22:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781070771; x=1781675571; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=avk5meTGBcIz3G48y/NS8SFzaal/HS1a4+vUZxSJN6o=;
        b=ShXhvctC0DfhuEeqXwgunUA5OxH4GMvrfo49d7D//gVkHd7kg5U1L/prdp4M1YqQzx
         JTwJPvYfS1Hfou4DwuRcPqddxi8QO9nVBRh5EPBFwnUVQmoMlrMZ2/zllfbLDOp6bund
         y1M4bBpbh1XnmmkouSvcL9EJ0luCJulB+c8xn9TU2o1cg8FBKGwjYLOZ9dDcb1CJOlxO
         BR1LY2lld23k7H9yZVN36pNB9A6Z2atbQEZBLtaz8BYSVNNPqKPsF3JnYDnDBWqrff9q
         AZU3ovmh2PVIS9IH3mCzKHYghITWrKiTu/FPNCpwoS+OsG8n8MlgAXMcPVrMxfDJc8Gf
         XQTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781070771; x=1781675571;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=avk5meTGBcIz3G48y/NS8SFzaal/HS1a4+vUZxSJN6o=;
        b=kmj+wdnIgEsudBYz8mNZjn05kj3XwjZ2UWUTiM1xQxMi2Xp70904UvABhCRiuc/hPS
         6xxJ3QSB95EtVtc3UXtdfzkToalx9RGxUjkepED7v1lYvYGmiqTi1moudsgu7bm3SCP/
         WWjjcUNfV3lWEyFTa2XeKcfBP6xqb6awmPYSBiHG/ascIi2tISVK9JoYNuJMdc7O9ov0
         SfYGYEsMkxdw9njFWHpFEYuno49Q4OJ+fYx3/cwdWq/w1BU913JRDxaK4DYycxEwAfog
         GEMKwmkNcyxY+qDJcmHvojmdm12xoOANC2a7rKXvqFJrWWJc/nPYXey9nqDkSCsHln3w
         iNeA==
X-Gm-Message-State: AOJu0YxI30OpeLdOJY+UuOBARMJDz7N7lGCNO0HwwZwicNbS9YvsxH/W
	+EVut2B7U0Apxz5ynM+azR8bVPeYhvf7N43t6rXAgveLa8O11UqSPfiLUvARkwomKU6FrTKEB5+
	rCxNti3tl+/nf6cBzyGT8NANR2cN5AF4pGxXKnKtTDFSV7/gAR/ABRpw=
X-Gm-Gg: Acq92OE23eBuZIcWJVPvtjUORhrbTLxiC3+Z9AwdngEWGqS43kDBt7xzNYNHcvh4iUo
	C8hVZ9W1KAFmSNnbZvyHQvWeqUg3rf0Dxu5wG+XTEOonMCtRDTOnVubXv/RkbshJTlYVuJB0nBm
	WQp/ezTRBsgIaJBJ7Eush6DLBAGI1fPjvCEhnEZ3O65l+UXf2UPTLqOeDQuDiEOIHwOULkZA3EC
	iDV0Id4c1DGgn+cyjHy6e1x0oBMdcKQH6E2XOeSpQaOs03fdc0cwlVfbWa7o7kbJNWgQW84oxhv
	Fbwuxbo/5aAX92Eo5IX+RnUsYEMCXrvYm9nfcViPjZjOVOoSE8XygxTRJNXoaSWrkqYlpQY56Ng
	y/uE+w5z9N3Qf1EV1qenElLlULvrcWbZLuIlo1n2BqAPcnwc2PkVxxSxESg==
X-Received: by 2002:a17:902:ffce:b0:2c0:a746:7aff with SMTP id d9443c01a7336-2c1e80ebb9amr268984235ad.24.1781070770784;
        Tue, 09 Jun 2026 22:52:50 -0700 (PDT)
X-Received: by 2002:a17:902:ffce:b0:2c0:a746:7aff with SMTP id d9443c01a7336-2c1e80ebb9amr268983905ad.24.1781070770232;
        Tue, 09 Jun 2026 22:52:50 -0700 (PDT)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c24edc8acasm108601105ad.45.2026.06.09.22.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 22:52:49 -0700 (PDT)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 11:22:26 +0530
Subject: [PATCH v3 2/3] bus: mhi: ep: Add mhi_ep_queue_buf() API for raw
 buffer queuing
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-loopback_mhi-v3-2-a733c0cef61a@oss.qualcomm.com>
References: <20260610-loopback_mhi-v3-0-a733c0cef61a@oss.qualcomm.com>
In-Reply-To: <20260610-loopback_mhi-v3-0-a733c0cef61a@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sumit Kumar <sumit.kumar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781070762; l=4302;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=kPiK4VVYK2YYSSKt+UOoRg5CfNLvCgE5KlbH1vf/nME=;
 b=q4wkcXgb9kSyURpLBh9O/mKjiY/e3Q45Mu4AC/46kfOxEMBEgeGRBEwxDgEYIfi4SctX4pwcR
 D7bJIgV7+RWC93s7so8eWsurMOAJUZhs1AD3sJj9oOuUYon+1d0ryER
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Proofpoint-GUID: iYP46ATbOyo1GrcKX_AtyuPSpM9jZFKL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA1MiBTYWx0ZWRfX73r3avgsmVSv
 9zbBNJXHN3oS9v+tpSIxqJNoMpYghZXIZQgY92B7SoQme/YwYNJKWqq7YjqK9lcPGFL3fSVy6ji
 UshyedP1EGBsfMr1C+GsP4nK9FmnF8oA3iwSJ6CZ66/j+WMI8CXNMSKpSim8sp6LqTt7sezfUG0
 Vr8DopxpcRKVkN88baTu7/gTZFAwlDB2shKYLm+mdaIxcVLpDWLrXu1mb08jK26kClwo/Focl4O
 aemzooyXUL3rTToflb5t4YXYcbUf8bNXDqgJFBK6lHal+/Ms1eGLxA9VpDp6mGFYe9PrI60kqmL
 w+lCz5XqY//P+TTYRbzKAkEpGbNdJK1Avty/Mb6QzChRtnZfWaoK7yPSlNEKXGA3zddSVxPqNGw
 u1ON+JR7Jx7cMNAbX8BrRL6RFBogxVhIJIzDluvUzkf3XpZGvu8mZijMTalcNGAfAmglHk0UVbj
 6VrR4S0STQE+nlhbHOw==
X-Authority-Analysis: v=2.4 cv=Co+PtH4D c=1 sm=1 tr=0 ts=6a28fbb3 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=27Ti7_ZD70JoqEhemiIA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: iYP46ATbOyo1GrcKX_AtyuPSpM9jZFKL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100052

Some MHI endpoint clients do not use socket buffers and need a way to queue
raw buffers for DL transfers. Add mhi_ep_queue_buf() to support this use
case.

Refactor mhi_ep_queue_skb() to delegate to a new internal mhi_ep_queue()
helper shared by both APIs, and rename mhi_ep_skb_completion() to
mhi_ep_buf_completion() to reflect its broader use.

Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
---
 drivers/bus/mhi/ep/main.c | 27 +++++++++++++++++++--------
 include/linux/mhi_ep.h    | 15 +++++++++++++++
 2 files changed, 34 insertions(+), 8 deletions(-)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index b3eafcf2a2c50d95e3efd3afb27038ecf55552a5..6c4c5ca473b821f9c2abe11cfe5043ec4c5545f4 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -516,7 +516,7 @@ static int mhi_ep_process_ch_ring(struct mhi_ep_ring *ring)
 	return 0;
 }
 
-static void mhi_ep_skb_completion(struct mhi_ep_buf_info *buf_info)
+static void mhi_ep_buf_completion(struct mhi_ep_buf_info *buf_info)
 {
 	struct mhi_ep_device *mhi_dev = buf_info->mhi_dev;
 	struct mhi_ep_cntrl *mhi_cntrl = mhi_dev->mhi_cntrl;
@@ -544,9 +544,9 @@ static void mhi_ep_skb_completion(struct mhi_ep_buf_info *buf_info)
 
 	mhi_ep_ring_inc_index(ring);
 }
-
 /* TODO: Handle partially formed TDs */
-int mhi_ep_queue_skb(struct mhi_ep_device *mhi_dev, struct sk_buff *skb)
+static int mhi_ep_queue(struct mhi_ep_device *mhi_dev, void *buf, size_t len,
+			void *cb_buf)
 {
 	struct mhi_ep_cntrl *mhi_cntrl = mhi_dev->mhi_cntrl;
 	struct mhi_ep_chan *mhi_chan = mhi_dev->dl_chan;
@@ -559,7 +559,7 @@ int mhi_ep_queue_skb(struct mhi_ep_device *mhi_dev, struct sk_buff *skb)
 	u32 tre_len;
 	int ret;
 
-	buf_left = skb->len;
+	buf_left = len;
 	ring = &mhi_cntrl->mhi_chan[mhi_chan->chan].ring;
 
 	mutex_lock(&mhi_chan->lock);
@@ -582,13 +582,13 @@ int mhi_ep_queue_skb(struct mhi_ep_device *mhi_dev, struct sk_buff *skb)
 		tre_len = MHI_TRE_DATA_GET_LEN(el);
 
 		tr_len = min(buf_left, tre_len);
-		read_offset = skb->len - buf_left;
+		read_offset = len - buf_left;
 
-		buf_info.dev_addr = skb->data + read_offset;
+		buf_info.dev_addr = buf + read_offset;
 		buf_info.host_addr = MHI_TRE_DATA_GET_PTR(el);
 		buf_info.size = tr_len;
-		buf_info.cb = mhi_ep_skb_completion;
-		buf_info.cb_buf = skb;
+		buf_info.cb = mhi_ep_buf_completion;
+		buf_info.cb_buf = cb_buf;
 		buf_info.mhi_dev = mhi_dev;
 
 		/*
@@ -627,8 +627,19 @@ int mhi_ep_queue_skb(struct mhi_ep_device *mhi_dev, struct sk_buff *skb)
 
 	return ret;
 }
+
+int mhi_ep_queue_skb(struct mhi_ep_device *mhi_dev, struct sk_buff *skb)
+{
+	return mhi_ep_queue(mhi_dev, skb->data, skb->len, skb);
+}
 EXPORT_SYMBOL_GPL(mhi_ep_queue_skb);
 
+int mhi_ep_queue_buf(struct mhi_ep_device *mhi_dev, void *buf, size_t len)
+{
+	return mhi_ep_queue(mhi_dev, buf, len, buf);
+}
+EXPORT_SYMBOL_GPL(mhi_ep_queue_buf);
+
 static int mhi_ep_cache_host_cfg(struct mhi_ep_cntrl *mhi_cntrl)
 {
 	size_t cmd_ctx_host_size, ch_ctx_host_size, ev_ctx_host_size;
diff --git a/include/linux/mhi_ep.h b/include/linux/mhi_ep.h
index 7b40fc8cbe77ab8419d167e89264b69a817b9fb1..59f796e56207aaf8be09edc9ba4d1f59b665581f 100644
--- a/include/linux/mhi_ep.h
+++ b/include/linux/mhi_ep.h
@@ -302,4 +302,19 @@ bool mhi_ep_queue_is_empty(struct mhi_ep_device *mhi_dev, enum dma_data_directio
  */
 int mhi_ep_queue_skb(struct mhi_ep_device *mhi_dev, struct sk_buff *skb);
 
+/**
+ * mhi_ep_queue_buf - Send buffer to host over MHI Endpoint
+ * @mhi_dev: Device associated with the DL channel
+ * @buf: Buffer to be queued. On success, ownership passes to the MHI stack;
+ *       the caller must not free @buf until the DL transfer callback fires
+ *       with result->buf_addr equal to @buf. On failure, the caller retains
+ *       ownership and must free @buf.
+ *       Note: if @len spans multiple host DL TREs, the DL transfer callback
+ *       fires once per TRE, each time with result->buf_addr equal to @buf.
+ * @len: Size of the buffer
+ *
+ * Return: 0 if the buffer has been sent successfully, a negative error code otherwise.
+ */
+int mhi_ep_queue_buf(struct mhi_ep_device *mhi_dev, void *buf, size_t len);
+
 #endif

-- 
2.34.1

