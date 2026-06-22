Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5BB3559F5
	for <mhi@lists.linux.dev>; Mon, 22 Jun 2026 05:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782104969; cv=none; b=J7FmVVd1KVEis0+4iOSA8q7L7ToBMQiJZJVXe0ubkxrb+jajkGVSy6d7GLGYVgUXzOstX0D09x8SUymhyHWL8xPCDdOU3fxp0+aq84QChsaow71Qu8leY/X7cT8+1DFvgUNyK410cyLdprzT3CCDnoRuABtseiDO4+nGRPektDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782104969; c=relaxed/simple;
	bh=gGfaQBQV4ve45W3l4vga1g6v8XiqE+OMpkXU/G8WWwU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VoLQTZtswWFF8JX8g6JNSH9HRLisQmFyH1dw1yzlF9YmEte7myAN0AEljrDT/Q8vJJGAR6mpl67Qjt+itdIP5CaJXLZTtDpO6Ww3zYGrJYO7cnVF2ESsll+rrNEsAerlBHA1lt21O/gr5UhZpLdZG+Q14D5EJiVZdhqOlcRmXqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hvRL0yEL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HXtxk2l6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hvRL0yEL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HXtxk2l6"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65M59BNu3786566
	for <mhi@lists.linux.dev>; Mon, 22 Jun 2026 05:09:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rFRW4uvz7oIyfQLLlTaUlea6eRZCi9oGvqy2/uhqCNc=; b=hvRL0yELe8o/N2tO
	J9l/e+TBTR0BSS8yq8+ypjq9FklOyYMpl/yExOtjX4PWLjwDQ/MjtnZQL/N8cQhE
	oMdl7X+ORpcnCYlkLpz5EYkG8dwCwp4/G/rmYFx6JFpg63f+2tQSu4DNOoxhCZSY
	vJK/jNa8NDcD8Dk1Ub6eWJsyaa9G+DhWtTb7r+MRZM3p0RDPlkiwjj7JNEjOT4uZ
	WVjKsyt+nnNOqOeEFljezIJp5Byf+4hnbWoEiIRvEbhFE6vC1UVx7pDi8nTQtWU7
	9FMGFkNA+XhnW+EN5B8FjFr8JxwRyv9am+kd25X3ws/ri/RQiJjzq3B4VkkRH7A5
	1cEc+g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewkmecpra-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 22 Jun 2026 05:09:27 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8428384f31fso2803464b3a.3
        for <mhi@lists.linux.dev>; Sun, 21 Jun 2026 22:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782104967; x=1782709767; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rFRW4uvz7oIyfQLLlTaUlea6eRZCi9oGvqy2/uhqCNc=;
        b=HXtxk2l67sHU/SbA9WfUi+49BwEA/PdUq/Sp2qcDUs3SsMpOvzeQo76vQMH16eFdC/
         HYr46qU6cH1l1cmARZrUWvFODXQYGuwpBlqJ5Znd9CZc+M4QjhdTwVxH2Hm61/d1P25J
         VB7VIexppnQMwLRucy39bdecI+bkU0zbNqV4PfwGgZ2oCP7M806CIXv5zLtZ0vTB5f5b
         31rx/HKzyM1wyQDv7FPuNcw8bellYWuEAMR9jvuS+zPCpblMdvD99emVBZHmuZjneISS
         RwR/1/FdreYERPyHT6adWzDBRCXpyTPCb25p7TgGP1JHyqX/PZ5R+xzRnG1C7M7wJHHi
         pWkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782104967; x=1782709767;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rFRW4uvz7oIyfQLLlTaUlea6eRZCi9oGvqy2/uhqCNc=;
        b=ckJKl7Nud6/DU5hHWyLHGHabtpgcFM6fCYHaRgS4skJIZ5/7RBaQafLjGGa29UiuR3
         ZJhvjQ76oo7hZ8IjnBIVsnmTHV2JgSdRa/mxRRYVadJJaYP8sWiT6xWP2ZonQrhKFZb7
         YHC0ynSJbjH5bFSte0U9k38/edsO81J+AfHskwMADruXWUIwsa2oKiskyujgeJHDzFWR
         wuqNx1mcw+CSrtfpd+fD7fdHwZn1auRisEWB690zKmrrDhMEEkGcAjrM6VHOqLR5w26z
         kTlfW7/GVoCz9eyje8HwiYKjnay9WfGWm++25PoEkLVUHAYYjiUl7C+qkIWRBzaEDNZn
         Lutg==
X-Gm-Message-State: AOJu0YyNoOVpv3GbILOJjhh1fgaV+UCVRqxTdrzQouvXbt/oW/Fe0h1z
	cQPRohRij87h00k95uvTEcIOa0/y2r+1UAfnzStTYYzgj1PsUTU4Y8PlRPxYyfTG1zzfAr0n/Eg
	ygS94lEYF2khqtekNIE6WYnx9r37PxnohXfPYy4AFeCiMct1/B/agukA=
X-Gm-Gg: AfdE7ckZYDiM7m0mvi21WiB8E0er3B94C9IGOIx7d029/ZzYScUspP/LKDUP+wZvqVp
	XfPEejTDD4Qq+dFVjOoUqSXdTq9laHjH2MNHG45FltWm8GTnQLvqHgEc7jEf98CPYk/c+8ier1d
	1v3E1gfGPiV7xJZl8fvrN39IBEzAQA3FYC3JdRpPVuZ8Yd56bgh0k72YbYLksjU6jw7FjAfXPaB
	u4JrpB3cA/bx4jFz23EKxS5t34W9sfkD5h6O4koYJf3qc8e3eiUYsSox5yv9INfPUSUyKc9gECP
	tLpL+qBeAsVS1iuMoLAwdmSaKyhC3abyNOlrMN7MHuct0fM3m8QPiSgRKZ0zZsp4fpxLiI+Mgm2
	byXZ6bjdFL2/6HPPBVOufpiNOfvIi8DxYNN95
X-Received: by 2002:a05:6a00:1307:b0:842:21f0:5113 with SMTP id d2e1a72fcca58-8455088e136mr13692081b3a.24.1782104966652;
        Sun, 21 Jun 2026 22:09:26 -0700 (PDT)
X-Received: by 2002:a05:6a00:1307:b0:842:21f0:5113 with SMTP id d2e1a72fcca58-8455088e136mr13692050b3a.24.1782104965798;
        Sun, 21 Jun 2026 22:09:25 -0700 (PDT)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564d6c5dbsm5905996b3a.12.2026.06.21.22.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 22:09:25 -0700 (PDT)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 10:39:16 +0530
Subject: [PATCH v4 2/3] bus: mhi: ep: Add mhi_ep_queue_buf() API for raw
 buffer queuing
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-loopback_mhi-v4-2-782b3a0f2eef@oss.qualcomm.com>
References: <20260622-loopback_mhi-v4-0-782b3a0f2eef@oss.qualcomm.com>
In-Reply-To: <20260622-loopback_mhi-v4-0-782b3a0f2eef@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sumit Kumar <sumit.kumar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782104957; l=4444;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=gGfaQBQV4ve45W3l4vga1g6v8XiqE+OMpkXU/G8WWwU=;
 b=Inx12IRZtn+PGKi5C1sB8q4ewBGMbnrNj8GYASSzmUwR1k7xA3mbnVEG8aUXfV+Xod2ur6uq5
 01H8HcJBDr8BFAzLvLBvrjsrtJTYRYlP8ncdGf4jBCr4NQ0tn5QOv4s
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA0NyBTYWx0ZWRfX4I28dHeSTU5h
 d4/zZMFigS4cojkbdLlxm6xMqTtjqI2bPVw/PX2hLADv9YtAAqB3VnuO3GqnBULG8jG5M4ahtPQ
 ifZpGc9UE+FBveJLYk9c3RJIFkx0eFueruU5468soJt4MaKSN05ppJLPqlfNmfYFFVZx8M5q457
 mCu1v6Et0B30OX/EgpvYaHTh/D222kQyASsBfHUVLmjtyABZWphbN97bCkkeq/a/QMTBGNpGAV5
 gTX7BS1XVccYTxAXVCWv5W90Ys6BdDVPkVF+arCQpwsA4BcWiAQZUcUtdkTcw7OP6kF5ZU4ScOE
 tMSNEpAJsuORoes638aco99sm2RXihKHqbD1B8mGhSK/hO6R4qAR23x48giiNADpU1fRyIN+z4n
 D+i65bM4L81Kld/HD57D4EmSxAAwZvdVXVnhiD747pusV307QeIAMpEQwjBRNEsuln5W5HS1sFa
 T1y6jl52WYfLshvzwzA==
X-Authority-Analysis: v=2.4 cv=MtFiLWae c=1 sm=1 tr=0 ts=6a38c387 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=27Ti7_ZD70JoqEhemiIA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: _ImSpiPEJe_bM5dN9VW6lxIZNs7rzcCl
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA0NyBTYWx0ZWRfXwzUgMqDTIzAB
 lpMQrXmjDvuBrzMScuk/Eb11Dpen3tmeHFDGHUl3TcjPIpZkebeeZBgM5MB4RNor/0foTe9M3lE
 yJRVjRltnoCgK8DzGe2bTQ5RMEBw4I8=
X-Proofpoint-ORIG-GUID: _ImSpiPEJe_bM5dN9VW6lxIZNs7rzcCl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0
 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220047

Some MHI endpoint clients do not use socket buffers and need a way to queue
raw buffers for DL transfers. Add mhi_ep_queue_buf() to support this use
case.

Refactor mhi_ep_queue_skb() to delegate to a new internal mhi_ep_queue()
helper shared by both APIs, and rename mhi_ep_skb_completion() to
mhi_ep_buf_completion() to reflect its broader use.

Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
---
 drivers/bus/mhi/ep/main.c | 29 ++++++++++++++++++++---------
 include/linux/mhi_ep.h    | 15 +++++++++++++++
 2 files changed, 35 insertions(+), 9 deletions(-)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index b3eafcf2a2c50d95e3efd3afb27038ecf55552a5..d44e1e54cfb4404b6589aab372e687db7492d3c3 100644
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
@@ -544,22 +544,22 @@ static void mhi_ep_skb_completion(struct mhi_ep_buf_info *buf_info)
 
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
 	struct device *dev = &mhi_chan->mhi_dev->dev;
 	struct mhi_ep_buf_info buf_info = {};
 	struct mhi_ring_element *el;
-	u32 buf_left, read_offset;
+	size_t buf_left, read_offset;
 	struct mhi_ep_ring *ring;
 	size_t tr_len;
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

