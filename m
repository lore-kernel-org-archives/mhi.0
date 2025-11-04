Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6AE72D979D
	for <mhi@lists.linux.dev>; Tue,  4 Nov 2025 05:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762234763; cv=none; b=aQ0phmIT/5qUJgE4liDtMt0nDuGYQPlcltQ5JVy6dqd0wu0YAbv5PyVKCIAU/7rH17us768d23yc2cE1ZzUPdgHsLsMC8DPeNk87zqqSre9q90Ir5gqHsB2Xt1Ugvw0uRzpI9IE07WBZQmS03PgPdVsgT9/N7K+QW0Oqgixu9DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762234763; c=relaxed/simple;
	bh=dtuRZyZEtqGlK3U1hCkrQMWdm+YNj/fJVZiAp7dQZSw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N4HzLEKUR5pyoxlenzp4II9KIxEtRx4UUOLQXEP4sVsUIEWSG4laH6XclOx/EkzbHqPRSdx7VZmIdIAzzGLIdCMoDfCGTcSJi/iKtk3iGZKWUZPhkSaPuF1oBLSuLjzx8ZgLufbIg/CTM/o7N3qGDievMsgzbgTn+wVtvxpCzfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HCtI5r6V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f4VLyppI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HCtI5r6V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f4VLyppI"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A43CJ353658801
	for <mhi@lists.linux.dev>; Tue, 4 Nov 2025 05:39:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IjuSOJy8CVVTczhbx4CkNfodIVaw9oUxb4d0A+FKYtg=; b=HCtI5r6VEh9rj/9a
	EhN5tEhvLFJs5RahS6bAgJJZNBja75eoeGOqYVN4CLM6YDaVJHph7vXHJwgmTqWk
	9ZmVA7zA2CwEnS9GtYwhZPWXmkWYsaVG8HRLCqJ12etY1+kgztlCn7HKREa3X/eS
	NeqZ5tJILoq8UGI6WCq9tHR/wTpCb7pxJ7ZNLGmiZTr6gV2QjW+oW3amk0TVSMw4
	aNyxusM1/0T5GIrIU9NGfB+JmW+jrNLd+LB8ywWcx3DX0J5XDKB7O41C0fC4/Akj
	N9Dj3XArUU+rNgNFuv8Fne85+A3Tl2nJgcczyw+Ww1j4BOy1ezGOc70snqB8eRVL
	84rWUg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a70ge9rkf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Tue, 04 Nov 2025 05:39:20 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b57cf8dba28so4459532a12.1
        for <mhi@lists.linux.dev>; Mon, 03 Nov 2025 21:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762234760; x=1762839560; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IjuSOJy8CVVTczhbx4CkNfodIVaw9oUxb4d0A+FKYtg=;
        b=f4VLyppIaZLK1dYHuZ7+zvkvGuDCP9CRGWnXEgWUsqnCaCvHrhEgg81NkPbu23VeJI
         0XtKuxgbro6TKKhT1j/TJ3NjU/25fHqvVZf7fFCmvafG97Z2Vx8dgoGqAl9UvY9HPKX4
         44nD04FUuNqta0ZqRnDoq0qhZEVy0YEczu89AWOKH0niI3aT+tACKIwWgUzfA5txvXBM
         vL/xiZKNzE86eCt8bScYdXazj3Y1DuTnW7DF4fJKcG1IzXZfAvJsCAV5eBOtV/OqxjB/
         fBuf4SzxrhFu4kFrmeZ3+oRMwn1I1cyofOugKZvT/foJUdZo3Okr0LXVp3XliY4RCr16
         HgJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762234760; x=1762839560;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IjuSOJy8CVVTczhbx4CkNfodIVaw9oUxb4d0A+FKYtg=;
        b=aeKXTSTOUwDdOcX7qTanOvnGpi4jdKkO/1UyWjJLnMSg7m3tqMrBl+VzYRdDkGSf+u
         u3V9MDZN2Tul+YXCcMEfFxFdsW2eFVgoVxJXa4/i0wejVQbuV1+2LMlmga8FQTQrZfdU
         ElX4Ti/zugOiffiZH1cc/RXOVz1Y5qlx1eSS05gMtHMo5WaBt+trXM7yfZGXTWzuFUTx
         wI0nRxpEMFXMVMM708WoYRtL3IhSImvV2BLrEt+HUO+I6QZOOyli2p6kuivXZdBJ6+N3
         woQgokA4nYXs2SulOkUeSBJVDxdB/k/F01cVdrkGr/R6AkXnDpiirqmKG6kBDp+3eBHq
         AuXA==
X-Forwarded-Encrypted: i=1; AJvYcCXdpL9J7HG2e7Twkoz98xFRbRLe9QP7VTFy3rQ0YAtTevRoXqp7zDOV5Qp+eX97BWE2oX8=@lists.linux.dev
X-Gm-Message-State: AOJu0YyhrIKqcC10DnuOnkf81Wltg2Yxi17XPF7aEyj+3ZaHZEiWPI/u
	jTDN1XaIeBkzxLfZFiVEya0BhvCi6ktjSTwB3zUATQWASAmQEoW9G5/UUO8NdguSS+U4WlAVrMq
	ZYZfX4eT1+NhUhuiqt/mWsUCb8ww7JGn8/qQeaoaHMulVBYjPXMaqXXc=
X-Gm-Gg: ASbGnctuUZ4oVB98rLzw4310BwL9hEVNnLKqoGnPLCKJeSsoXMZaa1bwEo1wCjbDfcB
	fe1PlxoDFbyF3rjcVWmMNHeEiORELLCKEw31oAFQs82Y3zcaJmN6S+n+HNz/DZwNs5HWEnGvsOv
	UwxILOXq8uA0v1/NRcBpPaEPE/2QZ82V47HYMkb0ONFJzdFJnh5pzXInmjX3KMeh4+c6Qy6aSlF
	N2SnvZivBkAIckne9OgIDIeHrA7cmRg9rgNtm+WIQq1ob7AVLRhcMbdcua+ReN9GQriEQo1yUQ3
	dfigQKn+HIwCK1wcGS9ZTdZy19OPKBwNbCt0LNG+dpu4H5ghhEIWGfjFgGRJs/nwokrWfP1ySNC
	VHQGj/dpd9ByefRCZHBbctwRz
X-Received: by 2002:a05:6a21:33a9:b0:341:3b91:69d1 with SMTP id adf61e73a8af0-348c9d69eabmr16053847637.5.1762234760175;
        Mon, 03 Nov 2025 21:39:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH4oakAA99qWn20v9F+HqkC6GSdg8e3l70zkxie1GH4jCVBdFgzAOkin2sgcj0o0WonnR9e3A==
X-Received: by 2002:a05:6a21:33a9:b0:341:3b91:69d1 with SMTP id adf61e73a8af0-348c9d69eabmr16053809637.5.1762234759546;
        Mon, 03 Nov 2025 21:39:19 -0800 (PST)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7acd3150f0asm1462402b3a.2.2025.11.03.21.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 21:39:19 -0800 (PST)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Date: Tue, 04 Nov 2025 11:09:06 +0530
Subject: [PATCH v2 2/3] bus: mhi: ep: Create mhi_ep_queue_buf API for raw
 buffer queuing
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251104-loopback_mhi-v2-2-727a3fd9aa74@oss.qualcomm.com>
References: <20251104-loopback_mhi-v2-0-727a3fd9aa74@oss.qualcomm.com>
In-Reply-To: <20251104-loopback_mhi-v2-0-727a3fd9aa74@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Akhil Vinod <akhil.vinod@oss.qualcomm.com>,
        Subramanian Ananthanarayanan <subramanian.ananthanarayanan@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, quic_vpernami@quicinc.com,
        Sumit Kumar <sumit.kumar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762234749; l=3486;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=dtuRZyZEtqGlK3U1hCkrQMWdm+YNj/fJVZiAp7dQZSw=;
 b=anM+z/tuk/MuWJ6IIFZE7opgozQIgdOmTmSJhVlWnAbN8ndTGBEJix6HMiTuOgjL1hPgl7ZJw
 Hu6PxWCqPrwBg1wAsEYa93j9wN6jSQA0BPlntypUuxDxLWg09ZLZeql
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Proofpoint-ORIG-GUID: v57pWPEuiVBWghe32eeAVDc-_epuQ-BO
X-Authority-Analysis: v=2.4 cv=bqBBxUai c=1 sm=1 tr=0 ts=69099188 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=udtdykpXU_nWVPwV3aUA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDA0NCBTYWx0ZWRfX2qrwIgOOEq/R
 6liC9X4arFQVxUZdOVcCety1J4PhQLtwno6+Tenyoq/+lFt4sHqtGf1e5sbe5rMFhyX8RSR85qL
 RUZ8TuGI4Z+xpW28OKW4dp9XyViCN7jEoEtz0SYbeQI/LW/kaf2l10KBW5IPTEyCp4H4JBG/Dkn
 BBBm6kErBfSkNZuy5yL+OU6/vwTNYqlh2s9erdo8+BK20KrRDDwmjNV8uCRF5O+pqKqArcDZTKC
 fGbOsg7DfB2MXJlDHfiPbC/nkJfmgzqKJ2WBAJ3a2UjVzmWDVk9stNdGdvilfwWcv2gqDXZXdJ+
 hAyN11aSFxkZAZJxBCmXNo1LF/DpRq9/4jY5I84Ob6Z5jN3uGhrMDjIosVTVSAncmzQl6jl+AUO
 ZsexFm16jD/e8R2IchRZVB08l+PFgg==
X-Proofpoint-GUID: v57pWPEuiVBWghe32eeAVDc-_epuQ-BO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511040044

Create and export a new mhi_ep_queue_buf() API that allows raw buffer
queuing for client not using skb.

Extract core logic for queuing buffers into a new internal mhi_ep_queue()
function that provides a unified implementation for both mhi_ep_queue_skb()
and mhi_ep_queue_buf(). This internal function uses a cb_buf parameter to
handle both socket buffers and raw buffers through the same code path.
---
 drivers/bus/mhi/ep/main.c | 23 +++++++++++++++++------
 include/linux/mhi_ep.h    | 10 ++++++++++
 2 files changed, 27 insertions(+), 6 deletions(-)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index b3eafcf2a2c50d95e3efd3afb27038ecf55552a5..f4b119a8dca2dbfb3ffc24b04c85743fb57088fd 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
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
 		buf_info.cb = mhi_ep_skb_completion;
-		buf_info.cb_buf = skb;
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
index 7b40fc8cbe77ab8419d167e89264b69a817b9fb1..7186eb667b081009927af48513519084fb0be3a6 100644
--- a/include/linux/mhi_ep.h
+++ b/include/linux/mhi_ep.h
@@ -302,4 +302,14 @@ bool mhi_ep_queue_is_empty(struct mhi_ep_device *mhi_dev, enum dma_data_directio
  */
 int mhi_ep_queue_skb(struct mhi_ep_device *mhi_dev, struct sk_buff *skb);
 
+/**
+ * mhi_ep_queue_buf - Send buffer to host over MHI Endpoint
+ * @mhi_dev: Device associated with the DL channel
+ * @buf: Buffer to be queued
+ * @len: Size of the buffer
+ *
+ * Return: 0 if the buffer has been sent successfully, a negative error code otherwise.
+ */
+int mhi_ep_queue_buf(struct mhi_ep_device *mhi_dev, void *buf, size_t len);
+
 #endif

-- 
2.34.1

