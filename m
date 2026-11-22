Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795316255;
	b=igtRHjKn37u31ZK2M1w3wPx/LXwBuBXXhcT4vLkGPRm1j2Paf3ANN+BrfPu6DI4D2i9g
	 LLib1ZLtDhOhHj7CUfA4wpJ3Ll82fLAtksVauzs829Bt5l2HRLNO74wVaCDrbNmTHQmMm
	 HmD8UqNx6djyyvjlp9di8FXUoDsqa6bnUHQoSyNEcIh2SikmiVjCnmC5I5eoluubYdrcy
	 2PLTbYm/vm+B0Z2wjdhc7yyautskLmUKQyBcJ5rgzabCidQ4X6n4XRYyMZpn+/KB8cjSy
	 8bbaD7KV87LGRrLmw7PkgpT6ROmz6Lc7HnH0uKNEwm4xE1dSgkvp9EeclPFRmmyGW0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795316255;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=6bHLtadpQ3PZnFRKDgMiZ1QZT7HKwXJXcGhdxPv4ego=;
	b=EzxnI/F9IBiY6hViDXI8SDdspLoT5lmBFqpDyDrWLdmmp/xK0fa8pYryZe2wgAlCM8Wd
	 XBXAZdHyFXYxq4HbhirXH+raAGBdxLK7Xg0lEJrd6QqlPxTwmdlQpqbbDdFZ7a9VtkL2N
	 q045YM2qrPHEFIouHUtOT/2wC5LiiShbrmRRCNH2QKIa4CFKPkxMu1q96/CTw1vBxYSap
	 TizEw6THzVtvWsnY2sHf1obaZWZ1oFH0SSPYzw1PQTsGDxPcUvDScycW2795mkevCyEmA
	 BdNudHUCx2mTQnm0YUb9z4ZKH6lcwfcGKBj8OWSM10JMplf6yZd7EvQgUTMAfqby/+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bg1kxkQp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jsajkBpD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA1D606A32A
	for <mhi@lists.linux.dev>; Sun, 22 Nov 2026 02:57:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FA1D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bg1kxkQp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jsajkBpD
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AM07n1t1032705
	for <mhi@lists.linux.dev>; Sun, 22 Nov 2026 02:57:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6bHLtadpQ3PZnFRKDgMiZ1QZT7HKwXJXcGhdxPv4ego=; b=bg1kxkQpfoNFuQk1
	XU3tvuDHduXd5FSsTB88+hXeWCiBebY0+OrTzduUgdmhlw+6Q9IlHnfVrfNm4wRJ
	+Ik3kxTM8m4j+503cNMrmlEzE7wsnnKMi0Hz8PWWY7WClIB668/0THkwGOXA4Hy3
	PeZ1evtQPkO1RH4ezqRCurjiXGfnWyPUg7duec59KqRSSNrlXK17bu9cD3n+1O+I
	gAFqV9ObXzdqlRfCWLe9LdfGywq9d3D028cWuiADOrtzuqTsQKo1v3LdaYTziXDC
	tUl6Coc0JsRwzdYAW2//lEU7WPojwKGsAfWP04s6ZDuqpCbGqlemuOq1UKCJGosm
	YpVDdw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j34ka2cw8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Sun, 22 Nov 2026 02:57:33 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3869865a304so3511230eec.0
        for <mhi@lists.linux.dev>; Sat, 21 Nov 2026 18:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795316253; x=1795921053; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6bHLtadpQ3PZnFRKDgMiZ1QZT7HKwXJXcGhdxPv4ego=;
        b=jsajkBpDWU094X/NoZuXbnu0BoecZdUUAtBq9J2Gp9q9AWPmgB9GM1FaazJI13aU1A
         Zn1xTvbJFlkHtakZIZMd2BrjpKrxJjvkkuYn6zcKgkLh2AplgMnEbTVg/eDE0Hd4kGem
         jAwtAAvHWKdGwHzK5/74lpLJseLOjfsM9VOa0h60wTPuvf+kGXWuvSE1c7MWNaik4XmR
         OvBx6vJMvgxCtYuIW/RBEQZD2aD9Kt6znUoeJ9VbhGExr4HqoPN0tg46QaqHYz5O0XeZ
         2m7uPNABugSrayQHAm5hZpEYviCFqJhpadkCAfQXnDYnKY8mH3a4zKnwOkfQvRBaXX81
         1vfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795316253; x=1795921053;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6bHLtadpQ3PZnFRKDgMiZ1QZT7HKwXJXcGhdxPv4ego=;
        b=FRTFqszGGisJ0fW5cosvnTlmeJwYvfwbmUWaH8F8nx7H4g/zPIdKPMcjUi7gyvfOUH
         eA8VJGl3JhLn30PiukmiYCl9mTU68y4TcDqbQs7V3ZysKDkRiY6mnEqwx+FWrDEXas2G
         uTElGWjs7ncJ3NAoMbLN7AnzKE0Cq1GYmg/SqjJocOVC2YCY4Lh5XXey9KFyqnP9d5Nu
         v4gv51LLDsi3OUTVr3S3mvB7dT03Rm6JmIllo465HLU3i6S8NWL/h+MW8mcXPF3s0QA9
         zu3rbJr/chTUzXyBskEXAMD3GukxR2Ftxeq68lvVCooh98ybVCBj8/rorFyyxnDyMdNI
         UUWQ==
X-Gm-Message-State: APuU4Z/tUn1J0Bi+LRROpbyeA0+gudckxTzv76IEXqYej7QrJTBlLkav
	wwwTHU3pF6cBR+5MTC9O4AjLFad/1WCpI24mZmJN3mmTpKbbNnAmOuMQcQaJvKnvKkW7WNx6ytY
	a0wdoIlR93n2Sn0q0+eJQjs/01laAnv033JM7VMeceuMREvW7ssCef3Q=
X-Gm-Gg: AZFdTZf06GsQntmD4GIvBwkMJhylDBJjDinnAkLuG6DI5wBzyAyDwj7KT8YovDVgcSU
	hg+EjzQIGFiFcKe1HhK8ynweg/fxD2vewFiuQlfKAnlgfGN8F/olyEvxsxIMsGDmqlXTWFEkC37
	7cl30xR8OH5Cnwlne10Jg2sIrjT53/dkYnGIJyyGhfyqa3JuOK9VOcTdwHAXnqCOdVb7qCf2FeF
	G31IqkA6s9+ohmST6qNTLKKdIRFO2o/zbTECOn6Y3Ey4ree7sEg+evQEzWEfNV6mKv/Q0Ycng1n
	/MN91Oi/TmBrfACzVTtW0Fi1wrDE1jXJoju2ifw2SENosrOyE9sF9CYrSbP7rEXFvv6kR/cGD5u
	kDrikxyKuyGUvNXjD+7Kj4oBTAORg4RMjNpfwT2xylFJ8TYPzDqt9mvpKjtIsnjkDtQ5vA+949q
	le2nFSS6qJ
X-Received: by 2002:a05:7300:2156:b0:386:42f5:37c4 with SMTP id 5a478bee46e88-38642f53d72mr8113385eec.6.1795316253302;
        Sat, 21 Nov 2026 18:57:33 -0800 (PST)
X-Received: by 2002:a05:7300:2156:b0:386:42f5:37c4 with SMTP id 5a478bee46e88-38642f53d72mr8113338eec.6.1795316252785;
        Sat, 21 Nov 2026 18:57:32 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm312044eec.18.2026.11.21.18.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 18:57:32 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sun, 22 Nov 2026 08:26:22 +0530
Subject: [PATCH 09/11] PCI: epf-mhi: Add Nord endpoint support
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Post: <mailto:mhi@lists.linux.dev>
List-Help: <mailto:mhi+help@lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mhi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261122-nord_ep-v1-9-6d8839ffa9aa@oss.qualcomm.com>
References: <20261122-nord_ep-v1-0-6d8839ffa9aa@oss.qualcomm.com>
In-Reply-To: <20261122-nord_ep-v1-0-6d8839ffa9aa@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Niklas Cassel <cassel@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795316184; l=1777;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=rwRoe+74f7bx2POD29Ux+YxHW+5iqQHbqs8P/8PmtSU=;
 b=YZQKTBQOD10iDyG681HTh0xmsqt4Qmo5XYL1FKzxtHq5eUKwzTtsF7luTOX+KE2ZcdN//i0Gu
 l+gQgQfTVhGAeykiDXJVJhvPyafafbh6y6wu5HMuigJUIPsLaVD/vZc
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDAxMSBTYWx0ZWRfX7f36Q5+myTe7
 CxhUczYrBAw8YDDWGIrfz4D21AJ5KKjBlz2qPAnVzn/gUo34TOlIAWIB77AZot1rR2zOqPdff+p
 dp9hUaXLoRp7qmVpQpqHdK+w2DIqhPzrteS6WXiSkLeh5waRdc1wHD9J3zAxTd/AYzx4/S2+r6V
 h1t7wO/DOLYdc3OlxCBTq0Gw5oLylhzHGF5SMQUPSxWgdejCt58oBM7hHczQtwopnMm74OukAUn
 7YFsuPaFt84KEUFarB1qWxWhdCLc+pv+OZ21cSoMhAFchVTiQr9NKtcZjPhbTuKJIKMx96iHvfB
 ZbbeXBdTLm6nrQPyP/pnBJ1GDsi6udSMV1euF7pog+xR6fpynqpDyY0Y0n2UGjqBP3LxeBAkxd2
 zLnHURO+rOiArtYOaxDMuV8+39Kww8armL4ctT+z6fBcazDPaeWm+Qt0LBcuMe7ml4n2ThU+9PU
 VSegysNkvcCUsKx7Vtw==
X-Authority-Analysis: v=2.4 cv=RJEmjIi+ c=1 sm=1 tr=0 ts=6b025a1d cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=-BGyM8POLA_osPWRVsoA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: lhowLIAYbPjTdQ6ONKb7W0-Z9AVIbGsc
X-Proofpoint-ORIG-GUID: lhowLIAYbPjTdQ6ONKb7W0-Z9AVIbGsc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDAxMSBTYWx0ZWRfX1y8ry+cO+HjF
 ZmOr97iAgyoRUc6a19aqDC4j6OMk1Al5LFDdB49yMzXDQU5hjbt79DSbSSIQDjRUkT+GJcEdNY5
 gD+hwwYlPDWaaRWyWTg7o5DWcRQJX50=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-21_06,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611220011

Add the pci_epf_mhi_nord endpoint function info for the Nord platform.
It uses the v1 MHI config over BAR_1 with 32 MSI vectors and eDMA, and a
Qualcomm vendor/device ID.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/endpoint/functions/pci-epf-mhi.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/pci/endpoint/functions/pci-epf-mhi.c b/drivers/pci/endpoint/functions/pci-epf-mhi.c
index a8765beffe06..6476a2f33f6d 100644
--- a/drivers/pci/endpoint/functions/pci-epf-mhi.c
+++ b/drivers/pci/endpoint/functions/pci-epf-mhi.c
@@ -140,6 +140,23 @@ static const struct pci_epf_mhi_ep_info sa8775p_info = {
 	.flags = MHI_EPF_USE_DMA,
 };
 
+static struct pci_epf_header nord_header = {
+	.vendorid = PCI_VENDOR_ID_QCOM,
+	.deviceid = 0x0120,
+	.baseclass_code = PCI_CLASS_OTHERS,
+	.interrupt_pin = PCI_INTERRUPT_INTA,
+};
+
+static const struct pci_epf_mhi_ep_info nord_info = {
+	.config = &mhi_v1_config,
+	.epf_header = &nord_header,
+	.bar_num = BAR_1,
+	.epf_flags = PCI_BASE_ADDRESS_MEM_TYPE_32,
+	.msi_count = 32,
+	.mru = 0x8000,
+	.flags = MHI_EPF_USE_DMA,
+};
+
 struct pci_epf_mhi {
 	const struct pci_epc_features *epc_features;
 	const struct pci_epf_mhi_ep_info *info;
@@ -993,6 +1010,7 @@ static int pci_epf_mhi_probe(struct pci_epf *epf,
 }
 
 static const struct pci_epf_device_id pci_epf_mhi_ids[] = {
+	{ .name = "pci_epf_mhi_nord", .driver_data = (kernel_ulong_t)&nord_info },
 	{ .name = "pci_epf_mhi_sa8775p", .driver_data = (kernel_ulong_t)&sa8775p_info },
 	{ .name = "pci_epf_mhi_sdx55", .driver_data = (kernel_ulong_t)&sdx55_info },
 	{ .name = "pci_epf_mhi_sm8450", .driver_data = (kernel_ulong_t)&sm8450_info },

-- 
2.34.1

