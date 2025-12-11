Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D1829B8C7
	for <mhi@lists.linux.dev>; Thu, 11 Dec 2025 08:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765440495; cv=none; b=S5rwkJlsaNN3YUUdqRaWZZhDtCZqn/7tKVWlaaLVk55vkNTG7Mp6c9jxm6A15XtWyDWu9UyVQdjWNGULet6S1Ns6RsEKUpkvPzhVX3OOzz4/fdxAJleypnkkUSLXwtkubsCe9MyNfQiu/TfLT4zfaI9vyb6dJQDfXemWu6rafEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765440495; c=relaxed/simple;
	bh=s+FNB++v7IfGmf57Pqig2HTWZMYlY6YEcAX7CTQhXX8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NGABb51rxM6cmGMInFm2DcrfFlkff2k8lvxDnlF6cdN0lToN+A8ZSrV558vFLONW9qYLPlQY1+qwNY4rPtVqymUKrZ5Ma7n3cwq15XqFBM1PJAGWwQ7yIJZgtD4JkMC1CxUT8877nrCchEMxN1W650N/QvfOObTAs7XQa0BI4jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z/5qX8T4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FZuMoasw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z/5qX8T4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FZuMoasw"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BB7kGae3735712
	for <mhi@lists.linux.dev>; Thu, 11 Dec 2025 08:08:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	111IfXca0zE2+PdPVy3i5zCq9JodBmxBq5+evWFRlUQ=; b=Z/5qX8T4FLcEclx8
	JG8wMJ5nYYmY5bOsEEypymJ/cXbOPjpNUAb9AUiLyVrCNo7gqnEaCTD0rejtIdOe
	nZMotvjm+Mgu/kflqEBiDE1Adn3hvTx64FKWPlOi7n+JKD3yIkqZ/7CiXiWIRxaM
	nnAKSrR92Q0UgfD2PWy0N06WGL9UVcpTmflPz0T3/s8lwPluIETzQQ+UDVAXwOC8
	Cp2l85P9RuFahleqatPqF3Cqm1lPUyLOH2Jt+PB9lFFmadWD52o4l9lUN5sbxeSN
	6Lfy9uRkNeBCR0RTdntUHCv5PsDo/CCAbrHOzgHKnJmtnZqhMvzru+6NNTxpK9wK
	yLDs7w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ayg0psnwh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 11 Dec 2025 08:08:11 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7b8973c4608so1835052b3a.3
        for <mhi@lists.linux.dev>; Thu, 11 Dec 2025 00:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765440491; x=1766045291; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=111IfXca0zE2+PdPVy3i5zCq9JodBmxBq5+evWFRlUQ=;
        b=FZuMoaswidYKrhIkzws65zDwqx0T4JD3k4SiK64TFWvkmr6p4BwemTieKY5AuQmsNu
         4id0NyyNLpUH0sD7ytyFtI15TwpMk1woavL//qwHvxxNygziD/bEoggFvgXfAVSuUeby
         sdexCEyLfqiJmO7aJ5uwIaOdNvqSfSfvqhRu9WMam1eJbZxu7eCNj4vpiW80fgiib16w
         5uvKZblOJHnZxMyy1Tc7SnWBV3RMNK35ckmhqvpoiGvxxiuPARV1Lpt1m8JMUpjr+dsU
         3WfsWgMQIB5jIw6uYcyVEG74AyyzrjsQWbg5K7WkyaaLrt7CLsBmmU5EBKvrEijELRGj
         u1sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765440491; x=1766045291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=111IfXca0zE2+PdPVy3i5zCq9JodBmxBq5+evWFRlUQ=;
        b=UJIQphehGG2VzN8FK1xIJfs9LlBb2FR3zRFWICC/dYycJDmf7QBFU7qJ66/B6Sh4nY
         mYDcqFLiM0gGbYyGdlyNPfqnL6UpD2yjQcJiHFO1GwFc9MHWTB8qVn6/31b36mQ6+kXE
         +p/O//U6sWDY8xB3Qhnt4pKk/uYLyfG9oXytBVTBTV+HQSjBvzHvxwBntuIu5iOJue9P
         UncUOp1lIvFh6SpKMyASUoTQtPZ/i3N5eBCcAeqA3IP2wR6Wpm7x35H8kiytt4HODfYK
         hn8gS506kDQ8Ae8UY7VaeAKJ32XLgY2lXovMjzp10Xx9uogkjem1hej5dwt1YT1Gk33q
         NvDQ==
X-Gm-Message-State: AOJu0Yz17Pc+H9v36aDWhCpeJ+H2v2rsrxKbTHomhmB0ykbSBfzgkrxB
	b0kWyWexNRABh9Z211CyuJzVo+7tqjURDRSnZ2siHFRgVPheIrUin484A0IGL1CnYsHAelkGLC2
	+jUxyNT7ddxXwxFQ0rMjj5C4pYjT+sbUUJcKlxzBqSD+BB/vACUHCEB0=
X-Gm-Gg: AY/fxX5odl/kECa71wefLlh8mIQnfa/fm/+ejmpRMF8xG+oqSj9aTpGuUCcdrpKns5S
	eyRExLd8d7Rc0KFqJOHVI8hrKd22SVwg5ThjioasSFwxQ5iLzkc9/6YPwxCm55LDu5Qj2P+suGX
	Fc0ZUcwstJBEbJnK0e0joneSruV5B8p5kCwI8zpHtAf3nsQCWGjRu1b4uxQnhDtnCRpwitzcJYK
	f1gk75aGLAqBiYMsZ+oiS+dTLun+g8utw+Bv3Jmh/0DANAtidwe4w64u33Mln8SZtwssNIdOtI/
	G/UM9sV4YPXysnVBFh9HdnmEKDcy8HYY05LSjPpzxdlcUi+yal+FErs9OUJAugc5e7q68C5Lh9F
	IdopJbi6yrCqbU5Msb6Qj8hQ6jVtBQHJpXg==
X-Received: by 2002:a05:6a00:92a2:b0:7e8:450c:618c with SMTP id d2e1a72fcca58-7f22e48b131mr4569288b3a.35.1765440491185;
        Thu, 11 Dec 2025 00:08:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEIAYwm+z0TOG32ljWatFrX0eU4zdDhayjbHFyD4F3Q46utf+Lqzc0bk70UaOPpXBIVgiVOFw==
X-Received: by 2002:a05:6a00:92a2:b0:7e8:450c:618c with SMTP id d2e1a72fcca58-7f22e48b131mr4569257b3a.35.1765440490686;
        Thu, 11 Dec 2025 00:08:10 -0800 (PST)
Received: from [10.213.102.126] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c22848a7sm1706651b3a.3.2025.12.11.00.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 00:08:10 -0800 (PST)
From: Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>
Date: Thu, 11 Dec 2025 13:37:40 +0530
Subject: [PATCH 08/11] bus: mhi: MHI CB support for Channel error
 notification
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-siva_mhi_dp2-v1-8-d2895c4ec73a@oss.qualcomm.com>
References: <20251211-siva_mhi_dp2-v1-0-d2895c4ec73a@oss.qualcomm.com>
In-Reply-To: <20251211-siva_mhi_dp2-v1-0-d2895c4ec73a@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Upal Kumar Saha <upal.saha@oss.qualcomm.com>,
        Himanshu Shukla <quic_himashuk@quicinc.com>,
        Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>,
        Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Proofpoint-ORIG-GUID: XDNknWBgt_SIqBoqj6jlyfeiNMdmnXBN
X-Authority-Analysis: v=2.4 cv=b46/I9Gx c=1 sm=1 tr=0 ts=693a7beb cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=sWKEhP36mHoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=H6w75S3OD7A-s3ocmMQA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDA1OSBTYWx0ZWRfXxnQkrPR2bQxh
 J43TrymkIP7U0AuVuWOTSlbwKKG/NvnFkcifS+OdSOriD3M8nu8VHCtNRwlz3noeK2sZsUjgdOx
 RVI4GBHx4Umm0ZeqhEjk8kY9R/EIUQbftdjSrktB7YACouOqfeM796BYN0p+HnDBy3x+6XoJWVd
 lFZ0eCv+3mPZrBvS4ZGJS2NBYMdiSnpr5OQQcVajoDFTOLKmRfHnO09G9vQwaqjuA8TkglbHxFV
 IG50E2cpx4B99KC1VXoIniu5AwI9QHouzTokAAVRpb5AyKNrM+waxhGvmGg+UJKxHorHiqdhx+q
 fKu5exgCswXkH7lZncSVOO7P2a9LQByI/EH3xlQ3Do65NZ8PjpMI0Id5Eym7jIzK1pj+uHBvzqp
 o1YKzap/QobMuNnTp/Im3hj5yJjrPQ==
X-Proofpoint-GUID: XDNknWBgt_SIqBoqj6jlyfeiNMdmnXBN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 clxscore=1011 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110059

From: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>

If a device reports an error on any channel, it sends a
CH_ERROR_EVENT over the control event ring. Update the host to
parse the entire channel list, check the channel context ring
for CH_STATE_ERROR, and notify the client. This enables the
client driver to take appropriate action as needed.

Signed-off-by: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
Signed-off-by: Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>
---
 drivers/bus/mhi/common.h    |  1 +
 drivers/bus/mhi/host/main.c | 24 ++++++++++++++++++++++++
 include/linux/mhi.h         |  2 ++
 3 files changed, 27 insertions(+)

diff --git a/drivers/bus/mhi/common.h b/drivers/bus/mhi/common.h
index 31ff4d2e6eba..3b3ecbc6169f 100644
--- a/drivers/bus/mhi/common.h
+++ b/drivers/bus/mhi/common.h
@@ -230,6 +230,7 @@ enum mhi_pkt_type {
 	MHI_PKT_TYPE_TX_EVENT = 0x22,
 	MHI_PKT_TYPE_RSC_TX_EVENT = 0x28,
 	MHI_PKT_TYPE_EE_EVENT = 0x40,
+	MHI_PKT_TYPE_CH_ERROR_EVENT = 0x41,
 	MHI_PKT_TYPE_TSYNC_EVENT = 0x48,
 	MHI_PKT_TYPE_BW_REQ_EVENT = 0x50,
 	MHI_PKT_TYPE_STALE_EVENT, /* internal event */
diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
index 53bb93da4017..9772fb13400c 100644
--- a/drivers/bus/mhi/host/main.c
+++ b/drivers/bus/mhi/host/main.c
@@ -798,6 +798,27 @@ static int parse_rsc_event(struct mhi_controller *mhi_cntrl,
 	return 0;
 }
 
+static void mhi_process_channel_error(struct mhi_controller *mhi_cntrl)
+{
+	struct mhi_chan *mhi_chan;
+	struct mhi_chan_ctxt *chan_ctxt;
+	struct mhi_device *mhi_dev;
+	int i;
+
+	mhi_chan = mhi_cntrl->mhi_chan;
+	for (i = 0; i < mhi_cntrl->max_chan; i++, mhi_chan++) {
+		chan_ctxt = &mhi_cntrl->mhi_ctxt->chan_ctxt[mhi_chan->chan];
+
+		if ((chan_ctxt->chcfg & CHAN_CTX_CHSTATE_MASK) == MHI_CH_STATE_ERROR) {
+			dev_err(&mhi_cntrl->mhi_dev->dev,
+				"ch_id:%d is moved to error state by device", mhi_chan->chan);
+				mhi_dev = mhi_chan->mhi_dev;
+			if (mhi_dev)
+				mhi_notify(mhi_dev, MHI_CB_CHANNEL_ERROR);
+		}
+	}
+}
+
 static void mhi_process_cmd_completion(struct mhi_controller *mhi_cntrl,
 				       struct mhi_ring_element *tre)
 {
@@ -961,6 +982,9 @@ int mhi_process_ctrl_ev_ring(struct mhi_controller *mhi_cntrl,
 
 			break;
 		}
+		case MHI_PKT_TYPE_CH_ERROR_EVENT:
+			mhi_process_channel_error(mhi_cntrl);
+			break;
 		case MHI_PKT_TYPE_TX_EVENT:
 			chan = MHI_TRE_GET_EV_CHID(local_rp);
 
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 926a20835467..66fd83bed306 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -34,6 +34,7 @@ struct mhi_buf_info;
  * @MHI_CB_SYS_ERROR: MHI device entered error state (may recover)
  * @MHI_CB_FATAL_ERROR: MHI device entered fatal error state
  * @MHI_CB_BW_REQ: Received a bandwidth switch request from device
+ * @MHI_CB_CHANNEL_ERROR: MHI channel entered error state from device
  */
 enum mhi_callback {
 	MHI_CB_IDLE,
@@ -45,6 +46,7 @@ enum mhi_callback {
 	MHI_CB_SYS_ERROR,
 	MHI_CB_FATAL_ERROR,
 	MHI_CB_BW_REQ,
+	MHI_CB_CHANNEL_ERROR,
 };
 
 /**

-- 
2.34.1

