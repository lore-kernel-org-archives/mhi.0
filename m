Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022EC26FA67
	for <mhi@lists.linux.dev>; Thu, 11 Dec 2025 08:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765440487; cv=none; b=WiC8Y0s3vXa2ff5tnX+sjArnrtiLmJH2/chEh1HyDhDKFYUepwAmuGOJ+L1TFJM3P7urXHkJZfcdgOeoPvm4q1R7GxTbY4H9FG42wdtbXyfmNm26VTjfbvsSqgYb1cgmgp7JuT7WTAFdZVvhPnEZ5+jY7P9NaWY32ATUwh48hFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765440487; c=relaxed/simple;
	bh=EUy5+o9ctuwHtsvHKuRoH4GAI5s52zWgfYjcIQa0QvU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nq6d8Mm6JsIekirNIss56wtSjXXsg9KOHfADZQuLx4bAEW9pztipXJMVIDhslTWDR7XNJwlV/BVRESaudaNIg+IdvONUzm1mU+dByUAWlZevfajSoIxrZcjrOB3zWQNCx0OzhkyxLWynOvc7hRvH51p7dBCqy6PilMgnE+iRThk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iyMnuQ7I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eic6cBS0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iyMnuQ7I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eic6cBS0"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BB6unMl873774
	for <mhi@lists.linux.dev>; Thu, 11 Dec 2025 08:08:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u/9ZfPqzgF6DCfy5LrWQ+wzKhawBTN4QpQZmQLYFRHw=; b=iyMnuQ7IaK7yrFoS
	UbXvhk+dPRc5NfEhgX3mUS1dG3ptXbolnF2p1Z7muDVNLREwLNGzMEy2K7Pu5/Pg
	9GZxz3wc1Xqdryp9RHMpghyFqdYBNfx3L4324//p2kOlpRlV2uNI1vUGYWH8jxSM
	nQUA1q3UqxzzJ4an5X9VdGxJrlAwSkFm96VKED09HDiecgrF+2kS7FIXpWKq6j2e
	Ikjpv+1PO3wM4fT9lR7ID8CGU5pGBGtQS0FXdRSaDXx0XSa/TexzHAsgdCnboEhJ
	TlDwbFyUpezy1aPJ3tZ9REUGybFWUYDbapNF12V4LyTB1c16mNC1bJnvVq5RAx39
	msoqvA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ays4qg6m9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 11 Dec 2025 08:08:04 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7b9ef46df43so911551b3a.1
        for <mhi@lists.linux.dev>; Thu, 11 Dec 2025 00:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765440484; x=1766045284; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u/9ZfPqzgF6DCfy5LrWQ+wzKhawBTN4QpQZmQLYFRHw=;
        b=eic6cBS0BqGo7OrKj8u/wYWAqKilwm2T5TjDE+zvglWaQnvjiJRgj3IPrdcC1CBQO/
         GJs/JKMmIJaaxXv664PtC2y5FsVRZRYCS8pN52r60eXVjTRavZ6FIea31SgYBG/K4+ac
         eM4jYdWUyMZ8aXh1BISlw0bmhs6wAJCRpZUl8U9b6rWf6GvNmwPhIxwyRtWt6RgVTmfk
         RNb7igiYYQJH9G/+brTghQ4kVx/pIYMqyfPKsfE7IJIoDov0DTNAHWz9EmUtQgMZFlCG
         FNFt7BD0XpUgGNSBMHdexH2F5yJVIMBen4GW/NzAQ9RuyFMZPmJXoPihAeqgsfmgJTIp
         BMtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765440484; x=1766045284;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u/9ZfPqzgF6DCfy5LrWQ+wzKhawBTN4QpQZmQLYFRHw=;
        b=Th8vS9z8+Jf0na0rGbqsWU/iLFOzJ+SPyjW6NvJfDs44SRb0RYLBiN4iLnkdGpgvSu
         LDeI+JyNZp+CL9Y62yECb1FwCETfaGdx4lo63GYeyhAV/cQE69+u0fiG38I95kTuMFOP
         DXATiAEI0hrGPq/ZT0Bu1Y+CUeXoEa5mlg6VnmMBiSgRloKJQXnQQcrdGdU3LNxPHjax
         3bD0dpNw+6qIZKn9SK1qDArIbJf1jCNedfNVc2+WJDXU+KQyjQSt3Vy8Ul5E9Xh9dqcw
         grCMr8OAcUtwvawbbR5IEVe5pIY+/ys0HI+dsjxoTYlGrwY5hcqkVCBRYP3mn0P2zHoA
         0gFQ==
X-Gm-Message-State: AOJu0YxFuQID6BCqiaWRyiE2UroDHt/a4CajOw6hq3JoefaMDdDI+4TH
	VTcKxPE9cvidBc11uOSWNvwm7iAoJ5IwNMPlKASGn3+TwEpyeT1ty54RlZDsP0ajhTcu1QYxfG9
	qjPBkBvdwnxxWhaUx++P71Bpn0rVzYCI3NYJAl9U5HcLp4L1hvz+Cjjw=
X-Gm-Gg: AY/fxX4wNvZ/NzZc+AoolJKiA5Yt27PCwnXb5kTYzRb9gMDFmhw2FSR7o54Bkbjy9F+
	XWm1+uAlJHGdAZMJUUPjw8aLjlOExfU/UMVClU+EBt45qXBQPPFvh/zfdNDw8VPq4H9nI8lxmrz
	8EwLSmOVGHW1YvHLRaVxVo/F88TS3Qs5pGi2QQHvE12JEOJsMIO9kdXzAaa/0LXJr7jRP8OyX/u
	oTE2swG4SLi4wtDKVdiwcBE8zv/JgWPoIxxXR1fBEj1ONiPvqKcUZOa6LfnnmgzEthtS+GhFdz9
	fnrGjwfzH4HbKEj4yn0tmRYA5OXV9l5K7KBNy5TfYyIF2eJMHd0hLBIwCUukrJkkwhWr4tOP5eF
	DLInWVZuDfnyUsL+f6Q/5bSPmEKbkktQqDg==
X-Received: by 2002:a05:6a00:3a0b:b0:7e8:4587:e8bf with SMTP id d2e1a72fcca58-7f22ed5e757mr4987703b3a.50.1765440483915;
        Thu, 11 Dec 2025 00:08:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGUs0/qZCjwhM7lX53s2z5+FW36UFQs4JEXJJA+T+nSHigm9/IZWx2EY6j4guwOqOJKLlyfcA==
X-Received: by 2002:a05:6a00:3a0b:b0:7e8:4587:e8bf with SMTP id d2e1a72fcca58-7f22ed5e757mr4987671b3a.50.1765440483433;
        Thu, 11 Dec 2025 00:08:03 -0800 (PST)
Received: from [10.213.102.126] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c22848a7sm1706651b3a.3.2025.12.11.00.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 00:08:03 -0800 (PST)
From: Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>
Date: Thu, 11 Dec 2025 13:37:38 +0530
Subject: [PATCH 06/11] bus: mhi: host: pci: Add overflow disable flag for
 QDU100 H/W channels
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-siva_mhi_dp2-v1-6-d2895c4ec73a@oss.qualcomm.com>
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
X-Proofpoint-GUID: 3elDRlWTFo-iIgC-SN0Ig2W2u-zqtpN4
X-Proofpoint-ORIG-GUID: 3elDRlWTFo-iIgC-SN0Ig2W2u-zqtpN4
X-Authority-Analysis: v=2.4 cv=B/S0EetM c=1 sm=1 tr=0 ts=693a7be4 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=bAolQom50hykzV7YMrMA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDA1OSBTYWx0ZWRfX3mk1bI/nPxCs
 GHjEvaS8xA3e4WrUaUFMSliKn0ErQ5HAXEwZDCYB12sg4L0vC5NZ/xM3GaSJyiRK59rwIv20vhu
 mElCwDuHoSqDuMFZGJRoEjX1P5ZJfh5RU51qScJbSTuEC3QyYTLQMRDAY8LB+n3IEgQvz06AG6g
 svHx8e+fZtFcztyMWsgRLe9tou2Si5IzXN98NhVnh3yPxTCJ1GmP0J+vdEwZ5wUPBI7TZ80tqLF
 fFOy5EnUhds6M4y0/CUr7JykYbpYrVw3nD++p435QulMdbobtrWmXC4DCXhf1m8FA16g1y0xkgJ
 A9etc1HiDEQIdw/mHi+gNEkTd/FVx6J/QSJp/gDMqGFnLp92jZiWod635S9myBfbSC7sWNQ8bEU
 6O53qY07c19oAKtBVlWhRm59quqLzg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110059

From: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>

Add overflow disable flag for QDU100 H/W channels.

Signed-off-by: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
Signed-off-by: Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>
---
 drivers/bus/mhi/host/pci_generic.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index bb3c5350a462..814f8fdae378 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -94,6 +94,22 @@ struct mhi_pci_dev_info {
 		.doorbell_mode_switch = false,		\
 	}
 
+#define MHI_CHANNEL_CONFIG_DL_OVF_DISABLE(ch_num, ch_name, el_count, ev_ring) \
+	{						\
+		.num = ch_num,				\
+		.name = ch_name,			\
+		.num_elements = el_count,		\
+		.event_ring = ev_ring,			\
+		.dir = DMA_FROM_DEVICE,			\
+		.ee_mask = BIT(MHI_EE_AMSS),		\
+		.pollcfg = 0,				\
+		.ovf_disable = true,			\
+		.doorbell = MHI_DB_BRST_DISABLE,	\
+		.lpm_notify = false,			\
+		.offload_channel = false,		\
+		.doorbell_mode_switch = false,		\
+	}
+
 #define MHI_CHANNEL_CONFIG_DL_AUTOQUEUE(ch_num, ch_name, el_count, ev_ring) \
 	{						\
 		.num = ch_num,				\
@@ -295,9 +311,9 @@ static const struct mhi_channel_config mhi_qcom_qdu100_channels[] = {
 static const struct mhi_channel_config mhi_qcom_qdu100_vf_channels[] = {
 	/* HW channels */
 	MHI_CHANNEL_CONFIG_UL(104, "IP_HW1", 2048, 1),
-	MHI_CHANNEL_CONFIG_DL(105, "IP_HW1", 2048, 2),
+	MHI_CHANNEL_CONFIG_DL_OVF_DISABLE(105, "IP_HW1", 2048, 2),
 	MHI_CHANNEL_CONFIG_UL(106, "IP_HW2", 2048, 3),
-	MHI_CHANNEL_CONFIG_DL(107, "IP_HW2", 2048, 4),
+	MHI_CHANNEL_CONFIG_DL_OVF_DISABLE(107, "IP_HW2", 2048, 4),
 };
 
 static struct mhi_event_config mhi_qcom_qdu100_events[] = {

-- 
2.34.1

