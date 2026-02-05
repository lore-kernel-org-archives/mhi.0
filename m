Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF553A8FE8
	for <mhi@lists.linux.dev>; Thu,  5 Feb 2026 10:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770287696; cv=none; b=f9dAOZ5ldaZmvjEIP9QigezI+76Sbgbdd00Sbj7Gp9TPIA+btxACDkGeAHrd9wfr5CzSXE66JMr6EDHZlTXGZLIp7AHmrf/6mrWgObtVa+057zEM7nYglEWYm813d3Y69tx+z9KSKmUvkDQruXWHKlr3lS4xZJwptcqnhnj6DbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770287696; c=relaxed/simple;
	bh=Pp2grdy0HGvxTDX/hIeiquPXDauTvrRjkXfG0y5tgGM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PklbaHn9iCI7rV9D+j+/la25EAFxlo68hSa5xpGCxpD2yvwN597RtBOsikiMIAdvxSsdiJwE9VZwNEqktk8i7T21QWUvWPVltJcTAsxgYsbgfcyxj79OjIbiowzbUumawEBsa2AA8umN/tssekShlPay1q9PZApnSCHwbyK/TSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GCOgMNh7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h2M2s3Xi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GCOgMNh7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h2M2s3Xi"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6153djXG2759475
	for <mhi@lists.linux.dev>; Thu, 5 Feb 2026 10:34:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0pDwIFMOmIHXKjSM/iN19GndmiqDGOze1XVUOoV9B2w=; b=GCOgMNh7efuVs+98
	9moa17eJiYyL83XDjUq4BOAOWrwj5RtstAHVeo1sX4gvODJczrWzafi/TeP3fMMA
	hTCKtajZRr/cN7RPT6Q0aNI7GYE6w4ID1SCHnY9/1HLwoWoDSZl3mEi+e3qadoZg
	wsYv+8Z7YcrsZqr+XK5IPZwvX6I+IlnFZexCc1ukK7QgApqylxo4PfFcthI95N7F
	8gfTEgt/Xwt51+iYqvisEWzDcKy/v9eFQ8u+9loz9Qf+h3Sdh+UrcVaGTuVViOmu
	alhXWIKnIt1LrqdGSRg/IAqrUcgws0AfLqE952YDwJv9REmh+rslVPazsMLWpnxD
	hBuHBA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4jpd1btw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 05 Feb 2026 10:34:55 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a92a3f5de9so5739555ad.2
        for <mhi@lists.linux.dev>; Thu, 05 Feb 2026 02:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770287694; x=1770892494; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0pDwIFMOmIHXKjSM/iN19GndmiqDGOze1XVUOoV9B2w=;
        b=h2M2s3XiB2wrl78KRtmpvXWcIuulmozuYV0jc/NBLYX9PRdIfAJoz/O5wjIEOIsB/k
         5V5+gfCw/6hdA7pCKjcdC2ilwvJ1w6aGeKMW4DZBF1ijwkXl1l+GgT7+CUm8mpV0TB9S
         vLjDZAo9FVcrpMhFKZByIINn5Ehn+DZXpsWd4KfmYhTbqjba877Qpq9yOKNIkpcIrkGg
         mFLSmuaiDFt8pf+qpc2PoQ/+kTfnFHZ87HfnUtuY6VFR6VJUuglU9mPTn6iu5fIkDV7v
         N79hv9uxt2m0d5d9PsYdNR2luHr3WP4Q08G78n0lLbeAWapl1WT4fLrgn9Ws5PiokF0X
         WNyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770287694; x=1770892494;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0pDwIFMOmIHXKjSM/iN19GndmiqDGOze1XVUOoV9B2w=;
        b=K8hFS8N3owVoetzBcYKRn9qA2qmvHmRmmVToXLaRURWshlxVBYsE59qBQrjp7Nu7mL
         +AU5yPZ04HIJkbIMZbGDJpdxFh+x0RNJZmO8J9TyNlVDNLRcHuhFqRxPDQEcLCbCeBOU
         YqwmyoJCZVudC9mtB4l+zw+Xu3a8grQB+kiVv0ZXxb/bCk6ZcL8G8TZgwDN2UvOEmpet
         6i42lLZn8QX3FE7bCU/Xj5k7n0Hy/gqyunpFxbyW116ZNjem1ETVnTORhGbf3XxdvbdZ
         t7W1AYDXogBSie+LgvRAjPzJdRc0QG4pbedk8sAZoMn2+Ko7jbp89CVcLyfTWzU8k667
         6CUA==
X-Forwarded-Encrypted: i=1; AJvYcCU6X27WzhxO9EEFe2eOU3ScHRYUxxWqZmErye/FD2BIq5+ONAGxfH2SEwak3n/HDJyr9kU=@lists.linux.dev
X-Gm-Message-State: AOJu0YyMyXJbzDT5XBQL/e3ySfC9zY2NVNayDOFN2YEA5fPkEWKgfKNT
	kdiBOkJtihBWW4eJgyisEC/33zfcSf0UMSeoK/kk5lT7thNBEbREqsCXrnIMAKTVmb0Ku3cpjU6
	wrfpwuxsrPiCJCq7KfmUn9reeAWp4w6qWhsIpQ7Nyl+YvDBbeLbDeg1A=
X-Gm-Gg: AZuq6aJ4DZWVwiR3EC/ljQFP+FvHqoN57aF9+qcA7VWTNVqFJw51RKJ5p8ZUQFYazVa
	flD1dldxr1MjOZdhymnod1UVEnDTYkChyLnzPrO8crQ0yfSR2ljjUe4UDT4AHK85TWqg1vPE+FG
	Ozjih7vyyZkh/Y8WYnbY+2Dwl8LnJjwThkHxKgkCgRjS6V4W0bdLl4gvQMVTWlnDMIvRKMEa+nW
	QKa9FULjb03vK5VCK/vC1nsy8hG0yyAr9JTz7owRKbXvPkqrMmDSYxLsSXzdZ96doQXzrl+Yxa3
	QBXx1yEjKRFcg3AMfF9BruTcW80TeQ6jfU7Xo6PYkX34a2U6fdLDDMaN8VCsaT57AVRc3FkxCHN
	ogdSaaKG9yyQ9MhY2V9yvKw3gY5QMZstB669o
X-Received: by 2002:a17:902:e742:b0:2a9:33ab:e46a with SMTP id d9443c01a7336-2a933fbac63mr72094415ad.36.1770287694357;
        Thu, 05 Feb 2026 02:34:54 -0800 (PST)
X-Received: by 2002:a17:902:e742:b0:2a9:33ab:e46a with SMTP id d9443c01a7336-2a933fbac63mr72094125ad.36.1770287693886;
        Thu, 05 Feb 2026 02:34:53 -0800 (PST)
Received: from hu-vpernami-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a933851341sm50539255ad.4.2026.02.05.02.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 02:34:53 -0800 (PST)
From: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
X-Google-Original-From: Vivek Pernamitta <vpernami@qti.qualcomm.com>
Date: Thu, 05 Feb 2026 16:04:41 +0530
Subject: [PATCH v7 2/2] bus: mhi: host: pci: Enable IP_SW1, IP_ETH0 and
 IP_ETH1 channels for QDU100
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260205-eth_vdev_next-20260204_eth-v7-2-f85645210f81@qti.qualcomm.com>
References: <20260205-eth_vdev_next-20260204_eth-v7-0-f85645210f81@qti.qualcomm.com>
In-Reply-To: <20260205-eth_vdev_next-20260204_eth-v7-0-f85645210f81@qti.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org,
        Vivek Pernamitta <vpernami@qti.qualcomm.com>,
        Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770287681; l=1454;
 i=vpernami@qti.qualcomm.com; s=20241114; h=from:subject:message-id;
 bh=fXCaUq7DjiO3Pq6d/1jvpSm3bp5ZFTxYXJXZa9U8DDM=;
 b=1xn9CEuu91jQ6i4jgrM4k/C0PILnlK7O23NbhkkI5mW0xlMRgcokLmovr3vM/HZ80L2D+EFF5
 5uVz4XjYlYeAAg59ASEGAIKpRXTXKLROzoKsj84yUIYlBLgTJYMwe3j
X-Developer-Key: i=vpernami@qti.qualcomm.com; a=ed25519;
 pk=HDwn8xReb8K52LA6/CJc6S9Zik8gDCZ5LO4Cypff71Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDA3NyBTYWx0ZWRfX+fR4D1F8wr7S
 eD/zcRXrK0c08BuqHQ0T0KrWufj80MtG1N5PHHVLHyAqAHch9LMsQ9fRI2iG060ujsTPIBPT7Ci
 m22+WOwKibVSC5jqLmOGrQCJG4WxUA63rOlsgq7y4AEvIfJgpj/1Gp2ECvpkIbL9gBeXo0jwT46
 +LmQT6bLuTlcFgPkuRc2biqMsCSqW+Z8e2XtmJq2IcYQOZYzgIquGzMZ67tYSR9GLwLeARG19eK
 nKd7MJPdmXFuhkfbn6iqJ9Jrv66s5zEG3qmDvBZ9tWUQt2s4XGFu27+SZV7Pk/BzsBTzqvOwJIl
 a8Pbvy2c3m/atHKol3Wik4o5/8Rfoz2KI+iNLyzrbRsVmXN9kU7GSttI+4o/L5RodLQzIkqe94c
 8hzw5xcJNj//aNQkiKkmVWmmGfe62SoUITsVzJ+zFRq0qPrI18Ssj1Kf4G+N9PpNBv2YdGJT5a1
 D/O5IirPWM3LYhWyf/w==
X-Proofpoint-GUID: SWW-lGe1-l9bPAeTinEPBBllyHbw_Ado
X-Authority-Analysis: v=2.4 cv=d7j4CBjE c=1 sm=1 tr=0 ts=6984724f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Vo5YzJSDI_NEo2NC7oIA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: SWW-lGe1-l9bPAeTinEPBBllyHbw_Ado
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_02,2026-02-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050077

From: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>

Enable IP_SW1, IP_ETH0 and IP_ETH1 channels for M-plane, NETCONF and
S-plane interface for QDU100.

Signed-off-by: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
---
 drivers/bus/mhi/host/pci_generic.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 0884a384b77fc3f56fa62a12351933132ffc9293..6affef34ffc449eb48cd254bf3d8d69a49aeafdb 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -253,6 +253,13 @@ static const struct mhi_channel_config mhi_qcom_qdu100_channels[] = {
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
@@ -268,6 +275,7 @@ static struct mhi_event_config mhi_qcom_qdu100_events[] = {
 	MHI_EVENT_CONFIG_SW_DATA(5, 512),
 	MHI_EVENT_CONFIG_SW_DATA(6, 512),
 	MHI_EVENT_CONFIG_SW_DATA(7, 512),
+	MHI_EVENT_CONFIG_SW_DATA(8, 512),
 };
 
 static const struct mhi_controller_config mhi_qcom_qdu100_config = {

-- 
2.34.1

