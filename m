Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E5A331A59
	for <mhi@lists.linux.dev>; Thu,  6 Nov 2025 13:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762435708; cv=none; b=gzpvpVsG98Wzx65YlpAGpPt2GXKtnG0sdFjMZUFS4UBOKJlAOHdYCV/FQElrn/2xOWKl74FRUW+mXCSHXy0LcyIlu3lM3aAX+f39zFzBBQGKiCV88+ID5iixDVAhy4zc2Tz0/Sb0B/hBI3n7opJgvmFREy68WmpWp3xAhkhRNOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762435708; c=relaxed/simple;
	bh=uTPUynvEcw6KdyQKFRCWP++7wpSfzU3ZtWnOxsXH5Hg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KS8M/IA1Yh46IFGyA0rqpZ/HX7/t/P9SX0vdPQjmvBgyw9cEMcgFqK41Y9VcR6xkNwbTeVbuxTom25D8M4I+67cLMpzxloByggT1IkhpB05pxVGq3ZvZ/4umIGa3Br8QbxmKMHZKhNmbWAQOX5HhKCU2hZ5jqRxGlN0EYaI1I0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hhxd9tg3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DWFkxzeE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hhxd9tg3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DWFkxzeE"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A6DLmSP3217616
	for <mhi@lists.linux.dev>; Thu, 6 Nov 2025 13:28:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K6Uln7viSoIgV4FeL3cGSMSD52CLesxi81fBrMA1F2g=; b=hhxd9tg3e0RMQImA
	13EGTQTYI0cDpPbFrOBvP9yjdtqTTkfZeoDP0BtemuHcNPEU1yzJrzbor8JwT0u8
	G+mmVwiLUN1i1T87i33NnEe4ITELZll1fru74+zbGhS9hvZX3m8yIh1Q2vTL8cWX
	r4/iJ4GL0x1IGXaeNMKov+/ppyYFAmg3l9Wi8PDxPM3CtT+PtYQ7WgX9fLkf2c/w
	p4iW6kXUdnNG0VP/BqN+7/5URdsAnevwDeM0h32H48ga9tv5UgZ/+AL4ESAdVHJn
	jRBW8qbOxI7ehcPcQxlLMHDMX6ZNpcTPW71DijnMmdpBOgmsxq1UOS0PFnLbj4D4
	DYRBxw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8n7phb7j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 06 Nov 2025 13:28:26 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-297b355d33eso3784555ad.2
        for <mhi@lists.linux.dev>; Thu, 06 Nov 2025 05:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762435706; x=1763040506; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K6Uln7viSoIgV4FeL3cGSMSD52CLesxi81fBrMA1F2g=;
        b=DWFkxzeE9h5/JkenIWr2Q7GJp8KOrvfxEGDyT4Pa1spXPS1d02XPmpTy6XIq6gshIe
         Dw3auLLrCJvg841bzRsaJ1DCogmhJmD3TRcL+R/iG4HnusWf13KNyyWiFT1qQDTlBZLU
         WiCiveYIC4o87XiaQ7DX+/HJD2+wT+j4RAuTm9iLID6EAmeY9NemlUqBkG74eICOp5m+
         9I3nJmhT2f1j9tBMkNjZA6JymH2Lm5+zOLWPbwkE+1kWYoOBQegXhfKf+eiBGQOfAiD4
         dLQIrmMKFd/mr7/4+zAP/OmIXugZ3qR3TrRiY5B4Yib0sUmRAEYbB5m01BpU9qrkKYkk
         o+2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762435706; x=1763040506;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K6Uln7viSoIgV4FeL3cGSMSD52CLesxi81fBrMA1F2g=;
        b=MYh8BOKLfeGBNK6ux0xW5y+ZmfWbCys+KVMUxWErQauLhho8qs25AtBQs2C7NSm3Af
         wyPMmuml77TtuLuaHwha+YAY/89+uxN+TyAtliw15BRBzUaypzMUPRTwy8V946p/JP4p
         MO1pEaoL/cFXAHM9y0DFBKdv8EwlNn7qeKCb7+G37HcQC00bSO2/hOGRM0jmnxHF4uvY
         Ivv/zE9txY4erdKagvehxdknpbzsf7HI415AUmbEK1m/QfxmTr1EvWjJQ7P4TZx9voYu
         80KnFpC4AR3Cn86rL1S7Xhx5b2hMUSPYq6KD6/DTgMg6wWSKasOSqVWiodioDA29T4xc
         KZ7g==
X-Forwarded-Encrypted: i=1; AJvYcCV5+5LGxfyuWXOmR6cZMdIQ7DYOx2SJQ3VEgAiSCuj2J8rr+BuYuLO58QNEfWH1icKTXBQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxYrJrJVby0q9WlJ04f8PkGNRmSoGv95KFhihO61UPlh8+PMcnL
	9Y3FLiw2bID9PqvoUMFXxXPN30EX2cUEkXdHKxQENK7GgqVb1juxsVfYNtSrFpqbEr2LbDjiKsg
	gD9PxwJswg4WChLZT65Ltu+9nHtxyu3nVxrCguI9yV5zfWuaxBJnHBBU=
X-Gm-Gg: ASbGnctBFXvprGtaaoGQbkvqxwgOifjPZzMMVb6H9G5qY9EjrPiHUBfwCTj0s1PJutL
	DLdXilIfzr+9NdtNak/STNMhMTutqUgrb3RxiegA68sj0jkfjVUWYtUABaHo0uHOuBiRtvHLWv/
	jrn6LEyiUXUS/GhIO4sxxJdxrNdE9jNpxIoprTh5XlfIMag7H9d1NZzK9VYFxcgghUhgBdeZsM1
	iNFCF7T6VvlicpyCwHSa1s8FmFBg+i32pxD1WmeSVGEiT7d6rrGjkpDsXOeGC52MpN0rtIoubdh
	7/0Osetnj3V5ifXrZmSL47JfopWTFlNWAMXUpRdjMRbkNls8LMfKQEEGMr6E6IjTbpvi8OurQKI
	5y/AjuOayJvzUyFOt3trmiNCzbA==
X-Received: by 2002:a17:903:b90:b0:295:6d30:e26f with SMTP id d9443c01a7336-2962ad1aea4mr84378605ad.22.1762435705631;
        Thu, 06 Nov 2025 05:28:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEH5wlKyQgfPrvVMcvI9YDewl2pp4uhag48hOeK/UPGzA9fBI7LtxtQdulJ/CTlS0XS4PBYQA==
X-Received: by 2002:a17:903:b90:b0:295:6d30:e26f with SMTP id d9443c01a7336-2962ad1aea4mr84378175ad.22.1762435705074;
        Thu, 06 Nov 2025 05:28:25 -0800 (PST)
Received: from hu-vpernami-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651ca1669sm28770225ad.94.2025.11.06.05.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 05:28:24 -0800 (PST)
From: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
X-Google-Original-From: Vivek Pernamitta
Date: Thu, 06 Nov 2025 18:58:10 +0530
Subject: [PATCH v5 3/3] bus: mhi: host: pci: Enable IP_SW1, IP_ETH0 and
 IP_ETH1 channels for QDU100
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-vdev_next-20251106_eth-v5-3-bbc0f7ff3a68@quicinc.com>
References: <20251106-vdev_next-20251106_eth-v5-0-bbc0f7ff3a68@quicinc.com>
In-Reply-To: <20251106-vdev_next-20251106_eth-v5-0-bbc0f7ff3a68@quicinc.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org,
        Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762435691; l=1454;
 i=<quic_vpernami@quicinc.com>; s=20241114; h=from:subject:message-id;
 bh=hVsENnFNyiwEUKV4o8qHH64MADCXodAIn37DvsarU7A=;
 b=iKzNM9tlyU2l3rDwYcTOubaB8VZjoj1abicD2JDlL/PTPVLIcfYtHVo0Ll6PmqkhhuNna5E2n
 VpnZexmrvb3C1H0wYtVN3s+NfWlsVIc8AAo0Eymiibx90C7JMj+3/qq
X-Developer-Key: i=<quic_vpernami@quicinc.com>; a=ed25519;
 pk=HDwn8xReb8K52LA6/CJc6S9Zik8gDCZ5LO4Cypff71Y=
X-Proofpoint-ORIG-GUID: D36Q3JUB4wWON4vnc538R21Gim_MnKYa
X-Proofpoint-GUID: D36Q3JUB4wWON4vnc538R21Gim_MnKYa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDEwNyBTYWx0ZWRfXzUXg9/78Ike6
 1BSbKgZCeIUyzLVLKWUfO1g8Z5cdJjbQZYVX48zCbiOKUd00/oAHfgNiOFyUaLpXEhCaDukVmW/
 p7P7WnSc3nf57IqW4YoLxNTETqjRzFyIq1PQaZ2kbCCqG+I0OmqI2KyaK3vopn/LuMaVP1vYJK9
 nolGtS/DaD3L3ebYbxGKZEOJXHY9EZoCqDrd31fqQS3ETMdv9eV2UcyvqWKfcawGQXGf1FJXvPK
 TbgKD6wk4T5ESr1BRXQXARc4ongAr3XFQrW98FLbdWHZWF0/1Bm3lYBVf/DagPKRKLNXbwDT47H
 3PAUhoJtD2xXL5izCJPqQ6XT0mz14Lu1KRoYky4u86A5J20ug8LPmIw0LLuzRFeF+LWPOUFJa2V
 a4vDManu/HvL4T5EcrlqtIq0dfhCug==
X-Authority-Analysis: v=2.4 cv=ErnfbCcA c=1 sm=1 tr=0 ts=690ca27a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Vo5YzJSDI_NEo2NC7oIA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_03,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1011 adultscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511060107

From: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>

Enable IP_SW1, IP_ETH0 and IP_ETH1 channels for M-plane, NETCONF and
S-plane interface for QDU100.

Signed-off-by: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
---
 drivers/bus/mhi/host/pci_generic.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 3d8c9729fcfc57f38315d0386e2d2bdf8b7a8e1d..eace36054af9d04ac24538c8b9beeaa37c15b84d 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -269,6 +269,13 @@ static const struct mhi_channel_config mhi_qcom_qdu100_channels[] = {
 	MHI_CHANNEL_CONFIG_DL(41, "MHI_PHC", 32, 4),
 	MHI_CHANNEL_CONFIG_UL(46, "IP_SW0", 256, 5),
 	MHI_CHANNEL_CONFIG_DL(47, "IP_SW0", 256, 5),
+	MHI_CHANNEL_CONFIG_UL(48, "IP_SW1", 256, 6),
+	MHI_CHANNEL_CONFIG_DL(49, "IP_SW1", 256, 6),
+	MHI_CHANNEL_CONFIG_UL(50, "IP_ETH0", 256, 7),
+	MHI_CHANNEL_CONFIG_DL(51, "IP_ETH0", 256, 7),
+	MHI_CHANNEL_CONFIG_UL(52, "IP_ETH1", 256, 8),
+	MHI_CHANNEL_CONFIG_DL(53, "IP_ETH1", 256, 8),
+
 };
 
 static struct mhi_event_config mhi_qcom_qdu100_events[] = {
@@ -284,6 +291,7 @@ static struct mhi_event_config mhi_qcom_qdu100_events[] = {
 	MHI_EVENT_CONFIG_SW_DATA(5, 512),
 	MHI_EVENT_CONFIG_SW_DATA(6, 512),
 	MHI_EVENT_CONFIG_SW_DATA(7, 512),
+	MHI_EVENT_CONFIG_SW_DATA(8, 512),
 };
 
 static const struct mhi_controller_config mhi_qcom_qdu100_config = {

-- 
2.34.1

