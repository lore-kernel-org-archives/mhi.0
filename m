Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002262686B3
	for <mhi@lists.linux.dev>; Thu, 13 Mar 2025 11:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741866095; cv=none; b=XRbj4/361Vvm8FWy/ER072EynDxIkaYdIcq2OjFa31X2m+Ya6674Nl3tzGiQ+xTxlsraqX2rLgI9KR/ZMz2QMWz3WdnnzTd6qg9n2C0MvExoXcLAyJHG6km4WGGi9gKhWvijBMpJCtwBSp1MNyo3So2bGv2oyaqGUV5MCtIJINA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741866095; c=relaxed/simple;
	bh=3/AZwolXIW5cKbAxXRHbs5DefoIovq9yHb7EehF+eNw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=akhSu78spt9MEzSE+4Ww41MIjyg5f2DAneJtA7sfmzFI/JQgWHxIDDTvwHvKe+iJ6X15t4mMMb55lYjTlJpQqaDQLTlaJXZV1bBBgJUSl4QHulmnhVZmuBhojdY3jbzQH3gI3C2c76YeiodNcm14EjXWOfWj2NE9iSjhMdyBbiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cDV3EEl6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cDV3EEl6"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52D9gBgT030363
	for <mhi@lists.linux.dev>; Thu, 13 Mar 2025 11:41:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v3zJCrBTVQCy9dIu5GFnMtWwOClfbTclT70zN522sBM=; b=cDV3EEl6LHcI+tEE
	nYMOuLEt4GrTFu9SKJ1fzC8b3NXiINfTHNbTONXbp9y59vpYsMvHiORnw/t43dUZ
	IMTqFbtxNqZ16inMGFgUWUkxTXOcphj8l/G5Up4ymI8oxBs0SLht0rCNTINqNcz4
	5EvsiCJnt7lGciLVGAYLro0IunvqiaLhgZB3awsjWbe5ecIkia2EUM60mQFwA5ef
	9dgoq7yz2Nef+7VopwENJvkebQDOAvLSyzwTuWWLjiLl5OcvPU3ltsa0VesyD0k7
	M6d6OAH0mtjCWxZcpi5pAheV7crU7/uYKyncmMG00NWW2GY4cpKaoT6WOVa1lb/q
	OQniLA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2qnq6q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 13 Mar 2025 11:41:32 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3011bee1751so1591484a91.1
        for <mhi@lists.linux.dev>; Thu, 13 Mar 2025 04:41:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741866091; x=1742470891;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v3zJCrBTVQCy9dIu5GFnMtWwOClfbTclT70zN522sBM=;
        b=eMDC2m1ZspJ4eFokOREViGNfYnuaTy3cjeveJRYoNfiF1GJZ73AgaU+60L3SyRKEgW
         DFnciabIJCQNqB1l5m3CmiqWZi2DdrPi23mBiMw6nSNPjyJ/owdJfiUu2qolm/GjgefM
         33SUSer4+hedeDE4FNbcspEVmRbv5E5kZxbw6xcFzMEJ492sNLrNZw8ul+dj+CTMYy6p
         SeiALcOuxx6aMlrt6suAF0oesBeVGqBzeXgxadt1KYk1YiPnU4QRj+8f7j7Ju6Bjpojz
         9/D9baAHU0OYDpopO/YQ52cCpeYtgFpNLXLNlKFd2X/X9pR4Q7663dl75jzMeq0dKlP6
         PhVg==
X-Forwarded-Encrypted: i=1; AJvYcCUvoaWIscOk1i1gHa1q1nnJ5WgWiVl2ADkMzJwjm83fV1s2cZAwbpcPsDJGusA5LiWwfnk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1kjD9i50gDDWCQANn96hJ8HKQadu0ZVKnLvgFgo8JNd/YUVSZ
	TxL7xs88n6q6jbOf4GixipLwoanTjmNQ7CrgIKzs94idw3VQHNkBK2slzJ8bMWImC5yp8txEUNo
	ipNQ+lUnyv2feawdhrSRbwAVKBIxmB7a6O1aDRUqPeVuSeHTeJpE=
X-Gm-Gg: ASbGnctQyBKXPd3nyJitZCoVcp/GBkJMlQCpXU0tM8t+NCRLlB952RcSFRLwtaHLuLL
	yIr77CDQlIAMw3/0Z03xh3yT/4MZ+JB0TkZIjmmN5sdWvgZCQEF1KQ9wor3qnwdA3ODtlrpEtRj
	hvXgR0nT8pEXcerTL5Stfwshk7x1iGxJmp1RnvErJhpr00+hdCqxelal7SnxcYF6GZsjThQ2ohN
	T5DRWuOuuvZmfS2z//GTzjkj+Hvzhs0dBFaf0x6B1IOXYwuUsRsjFOzrEoa4IyNtvjdX2YdipVK
	8M2vfoT713DwCOv2cj24619RUZ0S+YJkqoPo2VBJzqtZ1t5mgmE=
X-Received: by 2002:a05:6a20:ac43:b0:1f5:63f9:9ea1 with SMTP id adf61e73a8af0-1f563f9a1a8mr30614405637.13.1741866091338;
        Thu, 13 Mar 2025 04:41:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwj3JmLyPQkLsfI6gJoP4XbctAwSqw8uIKw7LM/Ne531+FcfnFHjbrNVL/Xv6msV1+SwyuBQ==
X-Received: by 2002:a05:6a20:ac43:b0:1f5:63f9:9ea1 with SMTP id adf61e73a8af0-1f563f9a1a8mr30614356637.13.1741866091000;
        Thu, 13 Mar 2025 04:41:31 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56ea964e3sm1063219a12.76.2025.03.13.04.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 04:41:30 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 13 Mar 2025 17:10:15 +0530
Subject: [PATCH v2 08/10] PCI: Export pci_set_target_speed()
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250313-mhi_bw_up-v2-8-869ca32170bf@oss.qualcomm.com>
References: <20250313-mhi_bw_up-v2-0-869ca32170bf@oss.qualcomm.com>
In-Reply-To: <20250313-mhi_bw_up-v2-0-869ca32170bf@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Rob Herring <robh@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        quic_pyarlaga@quicinc.com, quic_vbadigan@quicinc.com,
        quic_vpernami@quicinc.com, quic_mrana@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741866038; l=676;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=3/AZwolXIW5cKbAxXRHbs5DefoIovq9yHb7EehF+eNw=;
 b=zKJq5M4CXyOL37AZbNCDJW0CpM7sEda2QrAhkTjI4dHnWBawjVpXTxfF1TYNjl2s8xVzpobQE
 r29Hg6xPtj8CEjejYXzE5f7H2PNfaT2RgMtYA/DAZvsKxlIqSBZXku3
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: gI9iSYQG4RpI5fXC7uwjm9oY-HmuuGPu
X-Proofpoint-GUID: gI9iSYQG4RpI5fXC7uwjm9oY-HmuuGPu
X-Authority-Analysis: v=2.4 cv=TIhFS0la c=1 sm=1 tr=0 ts=67d2c46c cx=c_pps a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=JOcJ30pghDwnvxMqNTgA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_05,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=985 mlxscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503130092

Export pci_set_target_speed() so that other kernel drivers can use it
to change the PCIe data rate.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/pcie/bwctrl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/pcie/bwctrl.c b/drivers/pci/pcie/bwctrl.c
index b1d660359553..0f4f68c170cd 100644
--- a/drivers/pci/pcie/bwctrl.c
+++ b/drivers/pci/pcie/bwctrl.c
@@ -214,6 +214,7 @@ int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(pcie_set_target_speed);
 
 static void pcie_bwnotif_enable(struct pcie_device *srv)
 {

-- 
2.34.1

