Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E30F477980
	for <mhi@lists.linux.dev>; Mon,  5 Oct 2026 10:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791196787; cv=none; b=UWh3KI1y6ecY7glhy0LfJrmn5AN3QG7uNRh21D29oMWN03S7lnwA6GA+SoZfOnCDQfXYeWR8Du/MHT10C3v5pgEWEk2KYouyyxyINSEeRhNXBr2/J7bQefuRUeve2EkHQdRWy2GvY3X2M/P6sMdUac1+bgM5AUJ9O++AzQvAX9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791196787; c=relaxed/simple;
	bh=WQwZuEMFI0EGrTL8vHKAukXCmiRo/SaTCgvzlteroVc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oDCHm5PyKMIecatDNG1yP4YlryQoKF+TT6RsJRd35ArDmXGwiNeGBcvANHO3OgToVpxT5O3R/3SJGVZwyW0dGsMEkQ5A+SAekmsOpB6wIxo73Lu97PlFf4nOT/csn8ZEaTHh4wnitMs6SaWWf2Ixa7b8CG7s/9k5npojOCNZrd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D+8T1ekZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DIZtkwZP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D+8T1ekZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DIZtkwZP"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6958xOgw646018
	for <mhi@lists.linux.dev>; Mon, 5 Oct 2026 10:39:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y9oUSEdsnHJrKTM7IFgvHlcAuPB6PaqD5TTrEShb2fU=; b=D+8T1ekZ4wcJqczj
	Qw0RNnawd6dNCHXGJTm1K42yqfGAcXnhx8XWlMbb2F42R0JSoNk69p7juaEfMgow
	vBLb2gxqouT1U/ZBjC2XMwBHpBzBiRSkyURNXkwChQej8upV/4H9cvdcx9XPEbxY
	K8fDRGpVX0kKQK+4SeBCZTNJI27joQ+9qhGxgmhNi9ML1gm1r3MxRAbJSOJUbdW3
	/AGuoTmb/SkxLsVi76KvqC3nJrc6sAdatLAok/0yyLBloOS7tfVYPbvdcTt849cm
	6QwdRlBrxF4MNCTqI0e3IgNjAEsup6qaNy4knmhlyFX473B85hWwIEuuzBbsq2oh
	peSkyw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2u08nc9u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 05 Oct 2026 10:39:45 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so1928987a91.1
        for <mhi@lists.linux.dev>; Mon, 05 Oct 2026 03:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791196784; x=1791801584; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y9oUSEdsnHJrKTM7IFgvHlcAuPB6PaqD5TTrEShb2fU=;
        b=DIZtkwZPj7KCmCWCgRH7T/3CshJbrBy5f5H6AeA4K+a/lp25OnzRqGTWTi7lgtv0fI
         otEGjai63jbkNo+h1cOXKhuXxxG6SdoziQd9JBHl3SqKBCAQ5HzDNmx12MGbzTrS7GWD
         pnfzrezD1nOYpcBGOmEFhd5+doO0jZIGPSNzZDpwiQ89KYWh2bOI2KOuvko8BF5trpD3
         jPKeaGPQMcrjOhQ2v/c0noRhTx6BSVBooJTY99CZEMzjELgyO8Gtm3a5mCJ1OyJX3zFV
         a+qdkrNXA6bevCqS7d4vUBOxiVvXrM8L40K4kUMnTyQPQRi44F8/DJTIs4tTmNswqS2/
         pKNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791196784; x=1791801584;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y9oUSEdsnHJrKTM7IFgvHlcAuPB6PaqD5TTrEShb2fU=;
        b=gTbc8GvpkWSOE9Ftt+tI2BuZik83zdYK9xzFGxPWiTtIyu9Fa7SzsZk0yfksdkb2XY
         GW5B0M05hi0X1b+n5StBrIW9CNsxwOn/NERUPwok9qVn/wBh2peFaE3ebm3XuhaS69JF
         YskOHtCCkIsp7KuIvsqARO0iEIwsbOmN9AlBVwxPzARhHsU/kHZMvkS80Yi5Lmwov4XU
         I8oQeM2BiIHX4smYGr5aRg/p8UaYFxv3IDuWSHXCzyqSwciMxOjgqjZOV2S11WZ68NMi
         GEPAFNp9Uy1V6XxkNU1uYmVceDe6UMhttPqK6sW2bdvHj/Ycth+1+9hn2X7PSkcY4njd
         x7Gw==
X-Gm-Message-State: AFq9FYKTftPICKANvmT6l8AsmYX+SCdnSvkWIMzi7+X09gtT7tBpVX5D
	FSpNvFrkdctUXpbE+p/TakZkmt99B/8xIvqs6MSCQ7Q5fFK8AVLG2nvw8H7TP1FBZyVgNb7WsN7
	9NmLUkTXUk5i7SwV/5yWK7mhU8LVHWbyJQMRfpmGXGAX7Gv9U8g5XP4Q=
X-Gm-Gg: AYBFou3y1122+N+/bUxpMucfLdD4AMAISvg1p4IZOjyQinwg+CR685ty7MIDUdnFzzM
	WD+3GdT5maOC6/clZqaLgKnGbVbO+r3SE15tYC7mzK88WwlYC1meypLefV6lGFDx9F2OZvNpeQc
	7IXeATcxo8akICsJoZGBeX/jzGOOgcHSnq8Fjm/6Ggtn267vy7KsdK2XJcbOcKzklcVRgDz2oj4
	mj85LvYd6DjEkS8E+OphXE0YJSDRxDWvEz2Pp9JGI+liiRFi0qPTUQKAXttHAYt1eFKICXz6MXT
	KZjPEf7gZK2yVWz+dLRkdxfS1zgdHT0fUeMEZlP/YefcCBhjaj6HO15Yeffs5s4Wkz95u9vguSv
	mEH9ebrK8CaOcyOsmGLAQ4Ue6
X-Received: by 2002:a17:90b:5285:b0:3a8:211b:6c6f with SMTP id 98e67ed59e1d1-3a8211b748fmr1067269a91.67.1791196784328;
        Mon, 05 Oct 2026 03:39:44 -0700 (PDT)
X-Received: by 2002:a17:90b:5285:b0:3a8:211b:6c6f with SMTP id 98e67ed59e1d1-3a8211b748fmr1067246a91.67.1791196783719;
        Mon, 05 Oct 2026 03:39:43 -0700 (PDT)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78e61386csm11223918a91.17.2026.10.05.03.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 03:39:43 -0700 (PDT)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 16:09:30 +0530
Subject: [PATCH v7 2/3] bus: mhi: ep: Add mhi_ep_queue_buf() API for raw
 buffer queuing
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-lb-v7-2-36a268b6386f@oss.qualcomm.com>
References: <20261005-lb-v7-0-36a268b6386f@oss.qualcomm.com>
In-Reply-To: <20261005-lb-v7-0-36a268b6386f@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sumit Kumar <sumit.kumar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791196775; l=4444;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=WQwZuEMFI0EGrTL8vHKAukXCmiRo/SaTCgvzlteroVc=;
 b=SNdArPsDZmVUJXgAX0uLNZemyLJdkOcTqb1APkZzAcUJM1zNuHq5jQQn97aryKXTw7atAUPlB
 z/6VGSHgkzdDbZyi1Op9ynsW4nRP2JOPijYHdC4qYBr0iyLDjynnlDw
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Proofpoint-ORIG-GUID: SpNz9wLYSI7zEpifIXPcVLg6YFL-_fdh
X-Proofpoint-GUID: SpNz9wLYSI7zEpifIXPcVLg6YFL-_fdh
X-Authority-Analysis: v=2.4 cv=JqlkP84C c=1 sm=1 tr=0 ts=6ac37e71 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=27Ti7_ZD70JoqEhemiIA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0MSBTYWx0ZWRfX+tDoUv1ohKwa
 RRan+UDhYqbubHYCmR84rgVVb3/hRyX1JhS4+nm0cEnrM1ZJlDR3pU7RWuRr6Ew/dU13hRSGs2w
 61K8Nk2lc+wTjfCtJJtCF2O7Bwz6sDg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0MSBTYWx0ZWRfX60M9P5Sl4kUg
 Ys38xmco5admIjGe9m+LpTlB5KbEvZwVLWoUaEDqRMyFEygDaQBuAcp5DDnkw2IkQsJXYKBkwGO
 Zs3mLPHtL5FUgX6knfJM1EsA7jmJ4ASM7T5sOI9yYdEiD+56e4iT2TB9LH/uayMV2z24c7rCArh
 39dAGarx0TJiYIYtKsWoxuGu3puqLeFJNyYeGrSV6DPb4f/iVjf2AxvR4KUHle8DSwfNTV1lU8t
 WCyaYmk6jhsgLHmlMF4gPhpWLaCSQX/04CSx1OP2bXwIC2pSO0IeL3zMyOSYLAtbQhCvTgyzNpT
 o3KgkWQ30TRccOv/1F7ia+np/hdIwRHJD/2pzAloEEQl5mt9YwlfLlzV2jyHpzktnFUY9jdKair
 ycRaen/NEp5cCffCmImMJGD8YGUUrVA423q0zHoUtSzUZgOaWyqT0d0hg/3KsiBz5AnWgn293hE
 RBaotkluBHoJgoTuyPw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050041

Some MHI endpoint clients do not use socket buffers and need a way to queue
raw buffers for DL transfers. Add mhi_ep_queue_buf() to support this use
case.

Refactor mhi_ep_queue_skb() to delegate to a new internal mhi_ep_queue()
helper shared by both APIs, and rename mhi_ep_skb_completion() to
mhi_ep_buf_completion() to reflect its broader use.

Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
---
 drivers/bus/mhi/ep/main.c | 28 ++++++++++++++++++++--------
 include/linux/mhi_ep.h    | 16 ++++++++++++++++
 2 files changed, 36 insertions(+), 8 deletions(-)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index db7ee6547eefa75995393f761ac3b66a6e37112d..b57dea00aaf52d16843ee72d98cf3e8afc08a10a 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -504,7 +504,7 @@ static int mhi_ep_process_ch_ring(struct mhi_ep_ring *ring)
 	return 0;
 }
 
-static void mhi_ep_skb_completion(struct mhi_ep_buf_info *buf_info)
+static void mhi_ep_buf_completion(struct mhi_ep_buf_info *buf_info)
 {
 	struct mhi_ep_device *mhi_dev = buf_info->mhi_dev;
 	struct mhi_ep_cntrl *mhi_cntrl = mhi_dev->mhi_cntrl;
@@ -534,20 +534,21 @@ static void mhi_ep_skb_completion(struct mhi_ep_buf_info *buf_info)
 }
 
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
@@ -570,13 +571,13 @@ int mhi_ep_queue_skb(struct mhi_ep_device *mhi_dev, struct sk_buff *skb)
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
@@ -615,8 +616,19 @@ int mhi_ep_queue_skb(struct mhi_ep_device *mhi_dev, struct sk_buff *skb)
 
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

