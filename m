Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA153EC6B0
	for <mhi@lists.linux.dev>; Mon, 17 Aug 2026 10:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786961688; cv=none; b=tdKhh9LeFe7JdygaKpUaguLvXCEl+aEgH9YJCTFeGFzQ1OwfyY/GFzsiiINrJnSB9c22lvweaYsDdbMkxOuCiPc5SVs/68Vf5ewilBOE5AAscn5xuKk/Rqbt1MxWzyozf0xrpIBah0y08CHrIEpLtSlKOMyY1j5MS6jzbDBa4A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786961688; c=relaxed/simple;
	bh=ApMUAuZs3L2v5RzHWa7346il7lYG55ETS5DCt1UhV9I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EFV6oxNcP3xZl3IVe0JJH5Srol6KvLCMSoeG0oNjv36lfWNKC+2Ww3NfFaAtfnrnB+1JqzH/MtvQ2I+n52Vs/IaoAM0JVFlEjF8U+6jPJA92+ZBETnjfDjZP8hzSf9crTDfpiQk/KW2K/BbQCB07h9rt/yScL1fFUd+MbiocwgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LUoZz0O4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CzgHjAL0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LUoZz0O4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CzgHjAL0"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67H9ddEf2990881
	for <mhi@lists.linux.dev>; Mon, 17 Aug 2026 10:14:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s08t3lOMFf+kNQ18LHM3sQsH9kbgW1CP2CV275SRJLM=; b=LUoZz0O43HuxfbdA
	5RdfhAqWVwvHtWOYuCn9rzCcJ8VxcH+Ilmp6GbqDHbEp3GgMl+RH/Vz4rCrWXD+b
	Q2Dp/ngTGUoUyB0ZIv1tHpDr5TjDcTYaCaIWlzQCaBumu7IAeIToSjeYJmsUsMW+
	htLySgYC7CeIZNF8s+bLn+Qs+qpR2Yu9/ENbiwZF6CgXMQOd/JeovkJsEN3XY9gV
	Ug5HXnVnUFztllhqRWtHmIaqxKx1RsPxbGpi+9UUkvxqQt9Pl/T71DvkyZx9Br4c
	CYoGs1C7kVDf4hO4Da4NN/hZRDgVsZYDWbMrgt0mk4HRnUzyp11xbxojmrh7psYn
	2qNFJQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3y7kr9v0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 17 Aug 2026 10:14:46 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-388b404eaa4so4550356a91.0
        for <mhi@lists.linux.dev>; Mon, 17 Aug 2026 03:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786961685; x=1787566485; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s08t3lOMFf+kNQ18LHM3sQsH9kbgW1CP2CV275SRJLM=;
        b=CzgHjAL0buTYu8481oADMzBepZmZAeeNWxtdgN1gIRBH9bYlGnzmy3TD9yr4mU6Vg/
         qQ1CgRmIV80k9lbJAjOhR8mdRZ8jrPGBPS55S6X6sipzdnvwDGjgygqYXC7jpoXXlG9N
         4Iu5+rhS+ulRt1f33wNNLuMVZTHAP5CBkuedrWbrsBI/LvMg6RdOWV75XzTQ71L2QMaQ
         zfh4qoi426p3tjwzN7shd2a3R3LWJGN3QlpqPZSq9JFxkcOYqVszsYY2AnS8PPqMD+7j
         vEfbbYWiMZOu/GGMEmcjnjrtk/k7ygbb2GDbDL0MRbslzm9YPCWMDb9k4tT/jR9QzTit
         CG+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786961685; x=1787566485;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s08t3lOMFf+kNQ18LHM3sQsH9kbgW1CP2CV275SRJLM=;
        b=cVgYzmFAJYIPGtPuSwfrbKrysBeGsC+5JHIWvePz49S9b2FYankyghd77R4Ge1LX8N
         sYXADubc5By5EGE+5qtMV3B5Scc+d+Sr5Y200nvnMpxU9fTxAqvV/NWnhdVOgLQ7AkYw
         VOo8Ls3JuMHK1GhQxy+Q5rodsO9TO7VJvS9KUkWjWJd7OFXALb+oXGW+BqrOgUTvBvvu
         bfiyzLp30NzVsGWhOOn7Z+yIBcKZUhLXGy2rXiCqLIPmJt0UC5BulOFQvgSkisSO4zzD
         VXA2f2VktsehHc5HD+1iddLuV6hd4XlFXvDLvO58ztOj9O8F2lW8M0AY/zcA6DTcCDnC
         UzgA==
X-Gm-Message-State: AOJu0YwgnZGB4b1EQFd+1efVhLWbgwrWmept7l1tvlwRGsOIYJfTBAYQ
	SsDUYJqtCBMpOEY5Vihrr63i/SDcDc6JTdbW8DxOz+xuYDIBJwcLa/PgMvTwtiy5hIRuv+Jvkvq
	QOXxUrjt8VQuVXBcfxk7QJtB0DJYSe8D+OzD50q5gLirHIktEWEL1FGY=
X-Gm-Gg: AR+sD10DwWtPiCRE49/RHEo7KdmO0nU2mgcJLEjUjBQCmPreXCeRIj1HLK+neo44c9f
	w+uhMvhmhQsHGDWY5VaG6atQBzN9Lcg74o1xJU2bQARTPpzoPn/TZzkZAxXyH6bv4Wg3d/VB1Kf
	E48eLOITDe8LBjqeyPwGt1PRisffXWJadzmUYJpzVUacKlThDIKNmdDR1Q5NV5r5mtZprUWFtJP
	7TLbZhLfCcg2ZFxIfErd+quyeGyacvd4yweXtjBGucM4qIWCoZKWyVrvI0KfTwKhwDdJCezoBnL
	JEkndKfpJbmObljXyf3seibiafYEKvtMLLB14gPvGIRWfnDgahz7lYfpTT8q+NHG4jNgtz8HozV
	5dofLuQesP0e2hGx/6W0exbRizA==
X-Received: by 2002:a17:90b:2f0d:b0:38e:7268:220d with SMTP id 98e67ed59e1d1-3933ed5e238mr26276650a91.20.1786961685357;
        Mon, 17 Aug 2026 03:14:45 -0700 (PDT)
X-Received: by 2002:a17:90b:2f0d:b0:38e:7268:220d with SMTP id 98e67ed59e1d1-3933ed5e238mr26276588a91.20.1786961684805;
        Mon, 17 Aug 2026 03:14:44 -0700 (PDT)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3954d3d2adcsm1744315a91.17.2026.08.17.03.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 03:14:44 -0700 (PDT)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 15:44:35 +0530
Subject: [PATCH v5 2/3] bus: mhi: ep: Add mhi_ep_queue_buf() API for raw
 buffer queuing
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260817-loopback_mhi-v5-2-50efc7360b7f@oss.qualcomm.com>
References: <20260817-loopback_mhi-v5-0-50efc7360b7f@oss.qualcomm.com>
In-Reply-To: <20260817-loopback_mhi-v5-0-50efc7360b7f@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sumit Kumar <sumit.kumar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786961675; l=4480;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=ApMUAuZs3L2v5RzHWa7346il7lYG55ETS5DCt1UhV9I=;
 b=t1VhTPN6kzGBpFfFaDq9P+GpbUSoTNNPt96OcLRkBbdB+qO5xEt10P9IafMXqPtGefWixkP2U
 GkiUlE3ZbEYCzWXObScFhi4FvoINKcxzpn+hXD89a5zbH4nYH3Bcre6
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Proofpoint-GUID: 4moq1CE_0KuN5fV1nDTBtawoOp3KZHWr
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA3NSBTYWx0ZWRfXwnCLgt7D8J19
 8b/RgBa4yKcUacUtsGi1OmUZms+e9EvzTaJzFH78ifQfCCoS4n5397FktVIpTw8Z1nUD/MSXuRU
 zqwAzWX2AMhaE4RXlF8nU0d8Vqon/wA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA3NSBTYWx0ZWRfX5uZKDoaCyfJi
 ve4Zd3yr3sEj9Ir0Z9LSb5qfzoB/C19s4gSxKs5fpa00SKenQ2/4PrlyyCMhuciHjWlcst+vrv4
 QBFq7AbDM/2phwYLz1vqdgrPC1rYCgDIUADL5aFvaSI34jXcIfuPKVkNxAc6qtyrm3dwhiCkPRm
 ms7wcEx0B1K7xm0BtTWgIO0NxuTCONBMY/4x/YKhSh4E/7fC86G6ZWF+dYsAPjqatykY5KjN74O
 pU6sp7pYrRwzMHhnKJgdVkG05ekWA4xCjJIpTPWaO4sGQ9N/GKKdYEsXOjlU3kL22n9TxOrynCk
 Q7OQCg79u12Nv+pkjP4McHtsZqVZcvEx7tH/z07ViUKRgvD9eyFhaBqInmYd3M4LNTJNFj81SiZ
 sjGzSSsAN9t44ZdLgrFbZF7vsFEhs2OWTFjlZ6jcoFBckSLW1URthNLIQcEzYYkZRFLXgxeao+d
 ptEKnxzrG5h1fxPjoUg==
X-Authority-Analysis: v=2.4 cv=HYEkiCE8 c=1 sm=1 tr=0 ts=6a82df16 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=27Ti7_ZD70JoqEhemiIA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: 4moq1CE_0KuN5fV1nDTBtawoOp3KZHWr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 malwarescore=0
 spamscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170075

Some MHI endpoint clients do not use socket buffers and need a way to queue
raw buffers for DL transfers. Add mhi_ep_queue_buf() to support this use
case.

Refactor mhi_ep_queue_skb() to delegate to a new internal mhi_ep_queue()
helper shared by both APIs, and rename mhi_ep_skb_completion() to
mhi_ep_buf_completion() to reflect its broader use.

Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
---
 drivers/bus/mhi/ep/main.c | 29 ++++++++++++++++++++---------
 include/linux/mhi_ep.h    | 16 ++++++++++++++++
 2 files changed, 36 insertions(+), 9 deletions(-)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index 038b47158f0e0c905194779e24da1ad851e76061..7be1d3bbf5339156fee85d6b47603a5c8d46a8d5 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -505,7 +505,7 @@ static int mhi_ep_process_ch_ring(struct mhi_ep_ring *ring)
 	return 0;
 }
 
-static void mhi_ep_skb_completion(struct mhi_ep_buf_info *buf_info)
+static void mhi_ep_buf_completion(struct mhi_ep_buf_info *buf_info)
 {
 	struct mhi_ep_device *mhi_dev = buf_info->mhi_dev;
 	struct mhi_ep_cntrl *mhi_cntrl = mhi_dev->mhi_cntrl;
@@ -533,22 +533,22 @@ static void mhi_ep_skb_completion(struct mhi_ep_buf_info *buf_info)
 
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
@@ -571,13 +571,13 @@ int mhi_ep_queue_skb(struct mhi_ep_device *mhi_dev, struct sk_buff *skb)
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
@@ -616,8 +616,19 @@ int mhi_ep_queue_skb(struct mhi_ep_device *mhi_dev, struct sk_buff *skb)
 
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
index f6383a57a872bf3cdea236ae9fe65f4ec8747b3e..852f331f03fda5c0212585de7d6f4eb9f8270609 100644
--- a/include/linux/mhi_ep.h
+++ b/include/linux/mhi_ep.h
@@ -304,4 +304,20 @@ bool mhi_ep_queue_is_empty(struct mhi_ep_device *mhi_dev, enum dma_data_directio
  */
 int mhi_ep_queue_skb(struct mhi_ep_device *mhi_dev, struct sk_buff *skb);
 
+/**
+ * mhi_ep_queue_buf - Transfer buffer contents to host over MHI Endpoint
+ * @mhi_dev: Device associated with the DL channel
+ * @buf: Buffer to be queued. On success, ownership passes to the MHI stack;
+ *       the caller must not free @buf until the DL transfer callback fires
+ *       with result->buf_addr equal to @buf. On failure, the caller retains
+ *       ownership and must free @buf.
+ *       Note: if @len spans multiple host DL TREs, the DL transfer callback
+ *       fires once per TRE, each time with result->buf_addr equal to @buf.
+ * @len: Size of the buffer
+ *
+ * Return: 0 if the buffer contents have been transferred successfully, a
+ * negative error code otherwise.
+ */
+int mhi_ep_queue_buf(struct mhi_ep_device *mhi_dev, void *buf, size_t len);
+
 #endif

-- 
2.34.1

