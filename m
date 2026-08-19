Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A58A3ABD80
	for <mhi@lists.linux.dev>; Wed, 19 Aug 2026 13:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787146002; cv=none; b=F3pkSB1rtNN0rJQMGHa+roFvXRem71WIOcsOvgFWGGKd/RIuNIY2wKsc9mPB/nn1BVr5UeHHHZuypFIDHG2KM/cDtpYcX0fheKfdovnBHfuLgCSttcV0ehb87PG2pVdUwopY2zLTeyrMpWeE+LvF4g6Mou32pHa5gXPFyYMPyV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787146002; c=relaxed/simple;
	bh=WyEzptVv7uRVS+fTWzoU6Xos6GT52swB3MLhrEXcDEg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oagZUV+/m+YVhbhyJ2KDe1DleYTmbVgeHsAVMs5ejlAdvcFdKYqVKzT5AX5hH50RX5+aZtQTbcA46T/+/skNm4iTA/jvvRAge2NmdHwb7upPfiOGzmJvKZhT0Buonn4lgwxmALemrbEW/voyzwZHxdYwbPLHFHOyeSHV8o8Pydg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o/OiSXex; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I1UQBjV2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o/OiSXex";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I1UQBjV2"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JD088b4045452
	for <mhi@lists.linux.dev>; Wed, 19 Aug 2026 13:26:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GA7vzClWeSwWPtSLmTimBFoLovSegooKkc2VbhIOLI4=; b=o/OiSXexN8V1G/qJ
	gWfaMRTTi5zuo3GeCBei+dNNHGcXWkq0R/MUJHYxoAhrN03eGN+Jp3kh3qF/zcox
	vL0l4Cz40c+Ii+79dFKJaoH7efydHgAv4BWPgLZ4yuYZjk6S+Nq9Np8M5aVhsKhw
	cQp5JAeB0SJrrTWTpU9cghboyHUnTgOI/fjXVklnMZ+Y9mnpJZiHL7KV4mxl+z1M
	lzQLtlsFn/KXYcEhYHCA7bAK4jlXgwUoyTTJcFU7XG+vXrm8NIFTg5Ts7DAujsO7
	KY6sgbhELpDqErttvjV8NxGfuAb4sUObP9ePsNE0vZSoONBpko29SadPBXsY8mqo
	qZ0iLw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfkketa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Wed, 19 Aug 2026 13:26:31 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ce7dff6253so22666845ad.1
        for <mhi@lists.linux.dev>; Wed, 19 Aug 2026 06:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787145990; x=1787750790; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GA7vzClWeSwWPtSLmTimBFoLovSegooKkc2VbhIOLI4=;
        b=I1UQBjV23A9JkmT3P0qRSs7KaHVzvuFAi9ckWKDgSX6RyE1XI0K+0bGESoWlr9Sr6C
         p0Z4gZXIkdoupTXjYQ78v5fRNWZxCaeEgySADvfRSgf1/kgHszokXrCT2e0Z0nea27wQ
         GC9e2HMbdy/f18QYr2r1jxNVTdY5p2WopuwOtXuSX4QrLcivpDTZoWJmkw9/PdjLH5qu
         Ex+iOY50/stupkVI5yzWlcdjljc27RGk1yPT04L0QyhLlbnQmU2eAk8s2SyB/Wcsmlou
         0mtLz2un0ZpwGDXK1aD7EmadGbXL8rzuBWZ3sliPEDD1SR9liVguYr/KRoULx8OBriDR
         EO3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787145990; x=1787750790;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GA7vzClWeSwWPtSLmTimBFoLovSegooKkc2VbhIOLI4=;
        b=R1WulpwHWte7+g5TZyLMJ9X3A73Nnj0vTeKla8e/3UuEhem2b3Hz2IAz7NwGPxXpqI
         um+rY0+BWTrj7WOAwiUYAcpTI8hji10p6fMRtnwRzGw99aHJPIjU88Tl29iTYGkPb4dU
         5tVhYDL0hlDX5HBxDa93e4fWTmTtS02PR28xoVQM175tPqWdc9MgvJD8gwRuHjxzDHfT
         KBPFRMnOxOtcdHJzrZ++IOXRrJqWW/YTA6uhvV/kMTZ48a4IkPpZ9KEu34fUKLVAYeJb
         AlTIjhgk8H/YuOF/Ohs2HfPMTkf9TRMmnvMi/Kbkyb5V16Y5jIztf1+wX+rIcC/lkH3u
         PyOA==
X-Forwarded-Encrypted: i=1; AHgh+RqHSVZRVuUeTOtMrHRwhG0djxUF6a8KvnwQ2IqVkb7tK9YYM4QJgfnhs+PHmSBVJbk5NHQ=@lists.linux.dev
X-Gm-Message-State: AFuF++kYso5riQ69qEwX7Ktk0DDEbQdkRtsCVflY29SAXjwx/Al8vPP0
	+g2vVSIQ82qQRBeeUZ5yt4x4jSffW8MVv+PeorxlzTMSX1ls2RmYGX7nlo5PQrTofLZG2VdHOF0
	i7Yo3rhms4Y4BbgnNguwslGmnaQAXmJWdPB4xBP65tpBNqTvqnK0ib5k=
X-Gm-Gg: AR+sD102yKX8t049UgN3pRt7Pnbw50Y4asEhsMxcSTWquUESuwA31ZIVaHbESCQQxYb
	AnT0BcrCE9Q0v04xOmMXCzNnTh19yK+CKwRcFQCJsORTXDekN4aURD6YcX1Uesu91FYk8bUV1Jf
	CD6FvzZWedSxzFPgxqMcjJtnIdN5K/uUzyaWwpY1WF9yfJCoTP+6J2K6Nko2ppJZKf588br9pDk
	fY+UvvqDGfyNKxDz4aR4PSKgvxGTW80f4VUnuWGdu8UpflLXAjbi4G8tYUzKnJDWt2TEAJ2y2da
	13Q/VkDRWOZsup7t2w2iPtHdZio6OUV0I5qklw9NiLlUO1KsuzCwE0dqi2dRIaC9ekshOVEKMFD
	hcfDAXPvmFFi7q1Yt01FIDwcs/jZe/HP1DAc=
X-Received: by 2002:a17:90a:ec83:b0:36b:b903:994 with SMTP id 98e67ed59e1d1-3957f86d960mr7218174a91.4.1787145990555;
        Wed, 19 Aug 2026 06:26:30 -0700 (PDT)
X-Received: by 2002:a17:90a:ec83:b0:36b:b903:994 with SMTP id 98e67ed59e1d1-3957f86d960mr7218129a91.4.1787145990140;
        Wed, 19 Aug 2026 06:26:30 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327c2a92406sm6126465eec.11.2026.08.19.06.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 06:26:29 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 18:55:53 +0530
Subject: [PATCH v5 2/6] PCI: Export pci_set_target_speed()
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260819-bwscale-v5-2-6dea79786b37@oss.qualcomm.com>
References: <20260819-bwscale-v5-0-6dea79786b37@oss.qualcomm.com>
In-Reply-To: <20260819-bwscale-v5-0-6dea79786b37@oss.qualcomm.com>
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
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787145973; l=734;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=WyEzptVv7uRVS+fTWzoU6Xos6GT52swB3MLhrEXcDEg=;
 b=Ck/CEbFLWH7VTG9uktRjIhO+x0ADX2v3SpS1gJJH7UzHym4rKnJTUhEfeNLXMl2jzTD885c9j
 O0ztEcXozknDPDijfAx6Myn/TJhPpQpE+bnqryQw6/AfJURhBkxpzdQ
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=NoPhtcdJ c=1 sm=1 tr=0 ts=6a85af07 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=5E3R6_0bZ0f_H1kkCjQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 4_w4CTrwa7DstsCkkcvjHspd1tKZF65b
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEwNCBTYWx0ZWRfXx4SlUAMgxbWl
 6DpHteKjPuw+Z0vf4j1Pt5F57pHk9o+KMCGhK+kzFZrKMYO9/zzSvEbLwan7g24NI3bhPHGnQYu
 H3wXSCt7B24uRJuquepKDjSMqr1G1Mc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEwNCBTYWx0ZWRfX0k7Gl4w0F8Qy
 qbDvPM420rPh+YOomfi1SffrYUb0S7qut8wO0WSHMSGVSZcO3aOe3IHvsKEliZ51z/rpHSIv0DV
 a9nq4jo+mIBgRLJ1daLuvPt9KGOdKrr/nfDARyza7A1ve7T3MdoY/vyoOogj6NfAhwkGZT62Hew
 UOu/rhmpppuRwP+BPq/rW3kBZ+Zxdv08mwO8bGrP/JYUrxKkptqO9NHjj+d6EIuIsNgcxVYHFOE
 w7JS+VD3Lqago7iZ4FWKxCl1w/aaSjHLAE47y7FZJepgEigIzTzMr7PK0Q9A6/We+/c/D/PE/kG
 0bXyWCppCEqjawIGDbUNL0hV20f/ZbfjjBNWlEPVlL5KDW26Wjb46eT2+erSD0x5ntxJrxwUPlm
 iDaX9WQUYbXG5umbfuf1qY97havecvMMCQgauE0fLaMN9HVg+XL2bOWVqCWjTqyGAI2dtpBkpiN
 Z6FAkdyuzjM0uHEDkxA==
X-Proofpoint-GUID: 4_w4CTrwa7DstsCkkcvjHspd1tKZF65b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190104

Export pci_set_target_speed() so that other kernel drivers can use it
to change the PCIe data rate.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Acked-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/pcie/bwctrl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/pcie/bwctrl.c b/drivers/pci/pcie/bwctrl.c
index 6fa1522c47db..a337f166465e 100644
--- a/drivers/pci/pcie/bwctrl.c
+++ b/drivers/pci/pcie/bwctrl.c
@@ -239,6 +239,7 @@ int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(pcie_set_target_speed);
 
 static void pcie_bwnotif_enable(struct pcie_device *srv)
 {

-- 
2.34.1

