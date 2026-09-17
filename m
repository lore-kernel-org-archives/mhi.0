Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755E648F034
	for <mhi@lists.linux.dev>; Thu, 17 Sep 2026 07:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789628930; cv=none; b=nbYT12prUCtrLl3X+l8ShAvCw7X4H/Fqclwkx1QSfv3hdKuxEhfJOTs+SqX1Qo9aPor2WN/0eCYd2ecsLqcczhRrNfT2RvJBus5+zB2cwEKLnY6cNW1MaUxiJ/4Cr+YjSrGiFhtuthmAXAGnql5W9PeP9tm/5pwSXZveTLtUjWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789628930; c=relaxed/simple;
	bh=OED1Xg9S3SY51ta3t3mrt819UPQ3wW6IVv1lWH/7UEk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V3kr3kD1Qht/5ZbcaalvRXdopH7Ag4g7+0R0M/o9pQbxLEziWICk+rJTktGPVYKsTvY0UARE8fS7PjQD+Lm3wkOrzaP3NEOZ7g84mKu0cXNV2k7MslrbMNZU0j9PXt7vdQEwhmB3Bckv6Quo/hSZm6vev6l7uyHty7+CfV2FAdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dJsDnUwm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DOKL8xbV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dJsDnUwm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DOKL8xbV"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H60dge1211966
	for <mhi@lists.linux.dev>; Thu, 17 Sep 2026 07:08:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gYxybknD8fyl/ZIeJU/5fWIVVbydgp9JHWKqHgXGOx4=; b=dJsDnUwmZ6T+ylZW
	MnZ1y7IHLV6y9+rz3xQtFkPBkJNo1DE1wl2nviWAq5klmOKfvA9TEz/FjB94+SOw
	hfVmoIa0N4aEhtfF5Ecp+sFMN3dJjbivK2NYUGpW7W6eVHZ6Vuv4scbZ7mLoV2T3
	oYPejvfUOvHafio2YjPDlm+8V6rPcoKu9CTBptsygt0YWlqfAdSn2QauGyl+QM25
	XGLrwXd826ieySuDolaQ46gh4xOGmABPfqr150g8wpIMQ42TGVYuRDWHOdPHNE2U
	6/e7fYOlOtbfHTrB1QdkUm+Hsn2gEIF2peyBcYpE7T4GLtcXErb/xUe2zCnpflEI
	J70hoA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqxayb7yp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 17 Sep 2026 07:08:48 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so905687a91.3
        for <mhi@lists.linux.dev>; Thu, 17 Sep 2026 00:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789628927; x=1790233727; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gYxybknD8fyl/ZIeJU/5fWIVVbydgp9JHWKqHgXGOx4=;
        b=DOKL8xbV/b5EZpD2z1NZ3xM7Sjf7RryW0w6dniTI3JNLDwVPiU4ggfMVm2RFq8GI03
         1DN3RNEjz+KQ5KwI0/zLAFyqrgzgEcKOzI7zoInW/9iYxcWhh0XyaFhF0n9CIZls4JES
         8RnloSkQQ5Vnd8WPBdzM9b0nJvC6wb7I/f3oOK5xw9hzmoFJ/UgqAITuae0LSTABuMdq
         IeEAwjW60RzZiYw+1zDQDNURfLFteHSQTWVYLvodI5mdHbO5MtTAwFyrZIUyHw7Xs1y6
         5a9/236wN5TanUeZ95hF2tEwlZQOPdk0ImgGCy32+XPOm+DunthbW5zJHgQzKgcuDthm
         8f7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789628927; x=1790233727;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gYxybknD8fyl/ZIeJU/5fWIVVbydgp9JHWKqHgXGOx4=;
        b=N3zG/hXGx+OSz63Fs16MIipybCiwG+WbPEMNdIND0V4qW8DqDk7T+bqDU6hu5T/vZz
         objiaHfcYOsbjfdcZUytJnWG9wz3mJ64xiR3nBEzICpUu+2yVWlBPzYbdwGsKVrGqRl+
         VtBE9V+MyS8zTyKzsQ9HZEjCahoc+vDa7R7Uccb8b8FLITjk0mVjrEhUh9ltPcxnncLy
         exlCUC2hMzo1yKpUEWkOP4WdBDtH4Ano+wPRBSOlYA3COGzTxf5hkYm5zBkbCmeAVvvf
         wZ68Tppmcs/00Q4soAER2epvBL3hN4ZxfhL1DE6RcInOz9WUmr/5MxL89bp79mkffhn9
         lbcg==
X-Gm-Message-State: AFuF++kvF9nR8Fbkg+k0IMx0xnX6lFSCRm+4ZmDqN1C62ENJyw6+OO9b
	Y18WzXX0KwY5s3o3S6CULFJg3klqHZM34PCQjoauKqxh0oG5FFDvSHrwTHy70UCwnIQtohJt1xG
	7mFA8iu1t2aTSv0H8+WeL5ON1AY1OpoJQqOApXYiRFsfy251pqgRy1es=
X-Gm-Gg: AYBFou2jESImVSnxx2duqTG6foek028QwCrontLc8fXpk5MgsgLyPeZyRNs2QA3NRfS
	E8njaBSMLxVnhrMfBxG8u8vvagI9Clfh9L/yCl4mwLvNdlWsuqT8iKRhbS+FmT8knTAMB48EC9h
	ihx92tXeGi2QhCRFDr6OKWpKUDhCA13qF/AOvWU3XOtqwnp0MDbogALn/ceQmNh4K+J7TDhL8Yw
	iyAytnzoCVBwjJImPF2lMTrV9gK1bQ2uRb4SrgxhIRCDDD/7G8/DMwz1fhkWNWr9fg4y+xjMW5V
	yzLuaG58+fijw1Ehj1nUi50GYH49kXs5lZq7BBfwn+LPyf+b8Ldr4kNn/Ud8Qb7RQ5YCauuzEyD
	2+AuQw4KHgeS4GxA6V0h2kdh4HC35IVUeWZ8=
X-Received: by 2002:a17:90b:5866:b0:39d:f97c:bb2f with SMTP id 98e67ed59e1d1-39e1e25a32fmr12976112a91.3.1789628927177;
        Thu, 17 Sep 2026 00:08:47 -0700 (PDT)
X-Received: by 2002:a17:90b:5866:b0:39d:f97c:bb2f with SMTP id 98e67ed59e1d1-39e1e25a32fmr12976047a91.3.1789628926542;
        Thu, 17 Sep 2026 00:08:46 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5e40494sm13280835eec.15.2026.09.17.00.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 00:08:46 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 12:38:06 +0530
Subject: [PATCH v3 5/6] bus: mhi: host: Export mhi_read_reg
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-tsc_timesync-v3-5-6826d5d2d527@oss.qualcomm.com>
References: <20260917-tsc_timesync-v3-0-6826d5d2d527@oss.qualcomm.com>
In-Reply-To: <20260917-tsc_timesync-v3-0-6826d5d2d527@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Richard Cochran <richardcochran@gmail.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789628904; l=768;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=OED1Xg9S3SY51ta3t3mrt819UPQ3wW6IVv1lWH/7UEk=;
 b=j6FqE8uIa9myda6e0cGJaEMyZV5FzuN+gNvRGsEJK2+iBFQtaMsERaolLY+L5XroL4jWTvl82
 pnUZEryBqnfAggYjQK3PyeHlbN+6jhhaD9e1BpY8eiIcZcSeTmvBpbW
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDA5NCBTYWx0ZWRfX6eboTeu4RT+0
 ifCVmiA4SCppkDQVwAVR15PBZrSWrtK6/Zt2nhpDbGh9gTc/E8o9/PjO8JfHrwNuy2o1h8MRxfr
 xxfJ97dC0F21NPAlTvZNwb80D+zk5bAsXf4fZhzMCcFOIHjNTbyk0KicsjfkM2xsb1RNs7g2k0F
 btErcg0QTQrEzzZSsK3tDpCSTY+jwCPoPi0vtR5Gcw7lETTKo9SGwiCRxT0VrwdyX+sAMMo1bFu
 EXmnamMWNWeE9AlZ9NJOdIzPSMcvNz1MmjHVbHJrzaZzI+5/O3rRevDFmUaOWLGZ1ENQwic/4wT
 enSenqGD/M0ivlIjKS80nG1t1XpRreTB96V9pAU8srAVsDCkIhyN1OtT/286KwWbg9Ipt9B7pRC
 UPkdkcaqxnKXwKCvH7GGNsEiFpiBKRtuSorm5Ebr034/YphMpdrlIfIZzMlb5CwJaBB+OXfzPPC
 OMT0dcUJwpYZJZVlQ7g==
X-Proofpoint-GUID: rBLM4fZFjdjpLIr0UjL7YOfLUHZvg7eB
X-Authority-Analysis: v=2.4 cv=EoJHPicA c=1 sm=1 tr=0 ts=6aab9200 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=V1CThsli6YUvQZXG0mQA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: rBLM4fZFjdjpLIr0UjL7YOfLUHZvg7eB
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDA5NCBTYWx0ZWRfX3yoXCoBgKrhW
 pzrsmeg5Qip4xgLxGJXfPV0gN4ztO9oW05WltpEA8oSZDgmvB8kgxrg2Fxso66J1UyYo6Re8Q/r
 86tiEL3y2/SnMvdyAachFa6TM7y8jP4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170094

Export mhi_read_reg() so it can be called from other MHI bus modules
that are built separately from mhi.ko.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/bus/mhi/host/main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
index bfeb5cf53448..1ca9f781bbdb 100644
--- a/drivers/bus/mhi/host/main.c
+++ b/drivers/bus/mhi/host/main.c
@@ -22,6 +22,7 @@ int __must_check mhi_read_reg(struct mhi_controller *mhi_cntrl,
 {
 	return mhi_cntrl->read_reg(mhi_cntrl, base + offset, out);
 }
+EXPORT_SYMBOL_GPL(mhi_read_reg);
 
 int __must_check mhi_read_reg_field(struct mhi_controller *mhi_cntrl,
 				    void __iomem *base, u32 offset,

-- 
2.34.1

