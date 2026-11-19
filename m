Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795093030;
	b=TBg01AT/NHjGhR01F8DmsqBEbJNnOQDXjyIraz64gYtDjJKr2d82j5id41Fjr9vNiLWf
	 ZB7bs6q0DuITlGGkmiGPKlErBGqEyRVXc80c8IY7NLT7VWDBO61SpNCrlVmzy+vi/Kb9k
	 wwblKx4cSp8NOY24kz7gTig7byrAVOPm5G8bCE+XkcW49XzkJzvb2ERmgXvirTPbixHw+
	 GaVeqtYpudaN/zqhF81rPmeYbfWVgBtOmRW9Qvw8CEPZkHvnkZxYqwwvI/z0gaeLfrNDQ
	 3U+CNptRL0NmKHJKVj+bl2bGRpyFh6r9YByNb9dU16kd51q/nWHog1iXNU+KDfa3CPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795093030;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cK9FQB1eQfoYcGbuRQMgSid2tZEykErFFsoGc4qtmho=;
	b=zwhjl5PzXsqhwC9YDgf1A5eLQSB0xlySFYLVhKXURs7aibKzegB7gWNsvlOpu0m2U4t4
	 WxcOSso6ddntnQNRciub6oeuUqbwbnfeFXOKt1+viSbeIo1lJ9Yx54fmloc1lfuKWwpZd
	 m5NoaqO+yQA1mT1g7KotQTfAOA2TfKmZ9BWmqsc13X5vgB8DdDAxMy2FFXTvCcV7ve/Gz
	 VsM3kV00BfADdOXk7ji5MmCB9tWPk82nH0XJ0LKj3xKyMYpBisVuzR/voHD273nGutuR3
	 NYssJa6W/kEgA941fk7qE2l2J9pExKoAXkPdLQfawjSItMwIja6PAikNqpCq+6MW2sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m8nRjkNO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QqPiuAzE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECBF3606A320
	for <mhi@lists.linux.dev>; Thu, 19 Nov 2026 12:57:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECBF3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m8nRjkNO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QqPiuAzE
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJBjxVj2842853
	for <mhi@lists.linux.dev>; Thu, 19 Nov 2026 12:57:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cK9FQB1eQfoYcGbuRQMgSid2tZEykErFFsoGc4qtmho=; b=m8nRjkNOW3VPr3Db
	nULsFpFVKB4d+oAm1XxQzMs6sU04/hZg25z6kvlIEnVyHGUyIFPeCuOSC1og88QX
	pD/n3jwP2ciTLpHtt4ovUbDQAHsEt1ONIpuWEaKMjQOnLdePpfS8S3A32A8rjVqt
	gGtzhWhC+pE8rPQHUzbCusc6542yrC0hxHr06nMMaC0B6hmld1rPbdzO3C2mJl5m
	ekCm4Dp7oSZhkKDWMTLnLUq6qeq7v6p169cp+FMPbjks8aavxmMhc+0qBNVzpXNk
	8O4jqv6bKsXxeBCRVwJZw7+SE4+IrwqKi+dVNguahul9MjaixLPoCEgYv+hDnG70
	suRBMw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1xc6rtrn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 19 Nov 2026 12:57:06 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-383d1190b49so1111719eec.1
        for <mhi@lists.linux.dev>; Thu, 19 Nov 2026 04:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795093026; x=1795697826; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cK9FQB1eQfoYcGbuRQMgSid2tZEykErFFsoGc4qtmho=;
        b=QqPiuAzEHGDP9mota61KnKD9njnfPZbDLKf6viwawi7wZ+0SAKvFqtXG4NzsVjfLtF
         p3LibX6YhGaSJ92SzCOoEGOEEvOqVo+lvF1ehLsVNjo/1DGcdP+gW3oxmVvAIbwbRdDX
         ed5xP1b42fq/nYDk2b7fT8QuNoqBSaIiKqqqej1QazOySFAEBzhk+7LaE/9x7/Te0cn0
         sRbaI4CnYAzwFanANB5rWvm8ht84I796M5BEpXX6lWFx5Bj5L+AjgHbsP/8192BFZ6ys
         ijzPviQU53Yqq/EQ+A6vJRarJcleLnlPejHv5IH/9Gu8Y1/SESj2wU0ayDUdVyZGYQwW
         vDNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795093026; x=1795697826;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cK9FQB1eQfoYcGbuRQMgSid2tZEykErFFsoGc4qtmho=;
        b=bCh2PGJPDFP0hE2UyJtvCVAk4xk3a+P6BVu0P3A7uyRqZqEnyiGchkVU1byrz2bNgo
         eH97y3QgAaOiCs1y0lt5Wap/DSMNoYrDBSJjmOslmZp5RiPskItjbLvkr1GmBz/AQ6aR
         y+jYQMdpi9oW2C9YObXi1mYWKLYziRQ0Fu0dZ0rV0GN1aC20TpboJn9D6AQUfWJzncnC
         nx6A5UJAWGb4eEWzmXJ/gISI5yDqIk33z0NC1OXVB0f60f2WFe4QaDi6FVTaiCi3BHhU
         XhRy0V3OcSR0EP+yTSBLaitwQqs4P1+F4mdBQys3hEFWXAiztIULps0aaJb7V/WKnt06
         whfA==
X-Forwarded-Encrypted: i=1; AL+hErGxLANKD+Z5c7SfT7YqU9enLsNI2DQpZec/PBhAl5Z2sVn//AHljozxRWxqDTI75om42po=@lists.linux.dev
X-Gm-Message-State: APuU4Z+LVVooIvFSOYQaRlL2N8gBlhnw2VBJpi2cbrr1IwzQJcjockf4
	ymfri4sIYYlkqHOWkTkJG+1pmfQXhGFJvKrCz/0naTE879wVbZASqk0PZd+N+EgGOoT9cj0K9I1
	/zsAGA9I+HP5wbmY/fv3Bycjt10hXC2D4wyIJ/Hu62xPg29nO+eoI6Xo=
X-Gm-Gg: AZFdTZfDOszQ0xlLyqcTFwdAd4Kug42DA6dBdPK8lZX7bOpqRXqNfrOQqMGctJcadfm
	/wEHDxewj7pLSZqn/W9jKvLEvdeBoDPsEukUsDRUPgAoEDMa6DxpfiRW0yaizBH7jJtRW6IVkFs
	hVPOitCX3HSNI+F1v1luYHgmM5ekP8ejZ7NsNQIL/+Vr1LO2b/6tQ+cXzq+fNWRdWuBZ5HVIrmB
	PP5zaqq6ViG0SLvpbwoLtkHAoGhl5LLTIYZ9KN5fX0uEK2MYOH403MovVjcVdMeMa/noRnpvYdE
	DUP/tBudkLoFKS1lr+xkBJFJf8aGSQANyvP2oCtlIQT/L7bAKww1TzqRKJ1F/JMj6efQYTt+gnK
	o3DK50e9FXy9/oE4SfmTf9hm1LELuc5qv64OKt+KOKulKQkl7uo3msJVBYrYXSLBw2XuqNLg7XD
	Xs8gRToNQB
X-Received: by 2002:a05:693c:41c2:20b0:35e:2c6:d46c with SMTP id 5a478bee46e88-3828101fdc8mr4842005eec.10.1795093026238;
        Thu, 19 Nov 2026 04:57:06 -0800 (PST)
X-Received: by 2002:a05:693c:41c2:20b0:35e:2c6:d46c with SMTP id 5a478bee46e88-3828101fdc8mr4841978eec.10.1795093025585;
        Thu, 19 Nov 2026 04:57:05 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7fbceffsm18529369eec.28.2026.11.19.04.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:57:05 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 18:26:34 +0530
Subject: [PATCH v6 2/7] PCI: Export pci_set_target_speed()
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261119-bwscale-v6-2-9a9a715fcb46@oss.qualcomm.com>
References: <20261119-bwscale-v6-0-9a9a715fcb46@oss.qualcomm.com>
In-Reply-To: <20261119-bwscale-v6-0-9a9a715fcb46@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Manivannan Sadhasivam <mani@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        qiang.yu@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795093007; l=808;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=W18AFjHkuzlMzGO5/R1VBtRoQyqAsmAJi1evG/8xi5I=;
 b=AkA+fwfO2ceq8nugH0tjdw+xo2pslyfEUD1FzyiS2YWEXpHinZQOqVDEDsAbZ9lUz+gfkXnIo
 AFXVLo0LYELAglKOVKcuHsbzpeARu2iv9LhZUhJLhRf/a2lkOhivbXW
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=ef+o7LEH c=1 sm=1 tr=0 ts=6afef222 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=JOcJ30pghDwnvxMqNTgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA1MSBTYWx0ZWRfX62dSGSo79Qnk
 Ceg6gIMs7Xt5IjlzpPh+Q+IkcBS6O+qGjimvgHginmc6CnJIyP0rNOeclOJ9TtEzTiKJvqiIdMI
 BzgalpHE8US/zp3VkeedfvmQH6t+T3ZL1oiJM5hWY4fhN0tihMF6CQ99Az+a7Ki1/mJj7JsaRAb
 yQmSnKo4KKz1ksgzjCkcRSswIMQMInIeALbAxlRIbG56QbOXJPze9u4u0Rjh7ibFJg3uu/ozylL
 c0dQU4jq7YlhgOeYtZ7woU9rukByMMPdckI20y+CrD027qfkzgEqL3vWxXY+N554OlWaoS4W6xL
 FX+oSquRJl8IfzkrvpvSr1QHUyAiJzt6i6L2BjHhyUSZv4CEiAPdIPViq906k7hVoM9j3NSgH+C
 Vbqqt1AWjvTIo+I46hU5L25UYz8oGvARAIQ4KHj1XOIAPgCFN5I+0Yx2d0SC9UvHC/HAJDLRN8B
 Y48QsZUxeCR+mtfgVFQ==
X-Proofpoint-ORIG-GUID: rAUtJlF3hAslm2QiYe-ZXpxHtw47K1As
X-Proofpoint-GUID: rAUtJlF3hAslm2QiYe-ZXpxHtw47K1As
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA1MSBTYWx0ZWRfX0TKrmHS6RY8A
 goCb1tifsLivL9drcJrsLRmM3UJiQ2PZrKaN6X3xtt8hGeIhvLA91VaJZVgOAIDn3HSBxTesSSb
 ieIy9mQR7JwQozrj6n9uQphV4Tp2Z50=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190051

Export pci_set_target_speed() so that other kernel drivers can use it
to change the PCIe data rate.

Acked-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/pcie/bwctrl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/pcie/bwctrl.c b/drivers/pci/pcie/bwctrl.c
index c1e749df5bbe..0512ec62dd5b 100644
--- a/drivers/pci/pcie/bwctrl.c
+++ b/drivers/pci/pcie/bwctrl.c
@@ -219,6 +219,7 @@ int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(pcie_set_target_speed);
 
 static void pcie_bwnotif_enable(struct pcie_device *srv)
 {

-- 
2.34.1

