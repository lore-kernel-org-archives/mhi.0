Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E573AFAE6
	for <mhi@lists.linux.dev>; Wed, 19 Aug 2026 13:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787146019; cv=none; b=Qf3oaYXQDngANMouX4UaXqC7k7FIKSXl0heSJIGnGB4+lRVH3NofVEHcYjMM72aIQmNRdBdnk+aaZBzhJnT0KddZ8uwB6DXAz86xFMQNOqmguySUVzwTqEG1b8azEAFlOW0S6etygoWoAxCK9wGn1JJJuTaROcaLPg2sIPFIlsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787146019; c=relaxed/simple;
	bh=f9YlB0Fh+bNAledBbgwJEMD/HQiDELnKiSK0+Ha5n1U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ltKGiBEdETuEowj20mvxlGD8gbK7XdlFOQ4B6rmwCJT1sNtCVzSl18iCOxFiL3RND69JGFh6ZeNfep6cV5zVJotmBJqEtiOXkDxxXqZdursvB79Hfel6SGaIquRJZ7ixH18d6DsN8RQRRpQu8CFH/ALiyJwGjKHzXupTrzVFaIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AI4H7C3b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LVZKuddI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AI4H7C3b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LVZKuddI"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JD0CKd901367
	for <mhi@lists.linux.dev>; Wed, 19 Aug 2026 13:26:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tzW5IHj5NxVpXb/NDn7q5pRWgTqd/agwSM5EqGTVbRM=; b=AI4H7C3b2DllNm2C
	mfg1zG4Qe5AQ2RDvEozScu2JhP59LxOlpO0t8kYdXGsG6rvLT4oTJV6kIKItX2SV
	6UpDb80fjlTebjInuL7bYXpQua+NFIF5K3oqhl+VvrorbLWr7wDi/3DrBf72MGco
	pHGj1IXiBZl9/pmhgeXGOqb9IMVStj9yHg+T8wUsiOVnnHHLbudJIKpRrg2P3lXb
	y7LEdNPzdVRtknGlZ8dDuDqpuB58QjdDJPujDAtaLqoBnUFcHwWTcGEeAwG/xuaJ
	ca2vRrZJDCucdQb4oVZb63L2u4Pi81PFW0YmfaA4MZ5g1ZftrY4X4MEE9kA4i2s1
	YosDxQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfpubx7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Wed, 19 Aug 2026 13:26:53 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38f57e31b6eso1096537a91.1
        for <mhi@lists.linux.dev>; Wed, 19 Aug 2026 06:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787146013; x=1787750813; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tzW5IHj5NxVpXb/NDn7q5pRWgTqd/agwSM5EqGTVbRM=;
        b=LVZKuddIxLsw56lFEoZJQjb/Pw67XA0sRBWICSkHhQEQRqB0naoAp0nwJXL2zPHLpT
         UbObJpxdxGHYMyvsNxBv1zdJG4lgpY+XWSiWw7KmMQucF0vc4UKZ9g5iElB1IjZNHeVZ
         gIMGqXKOlAyr1A2xsUPSVrqmXUkYfVv440lCXBZ9HFtlfuM6sN0ySKMusYfAxjj78DTa
         WRlhuE02y/2Y2sGxcmiUtA27T6ZU8W6QDADu4gI1ZV4MxN0MyX1OPQvYRAl6mx+Px2RD
         TAPe2JP0V9MVlYltiQ7iCULiYfnSEyX8U8Dvhkdijum47/7RyUh4y8nbyL5/7GRMh8ke
         SYlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787146013; x=1787750813;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tzW5IHj5NxVpXb/NDn7q5pRWgTqd/agwSM5EqGTVbRM=;
        b=VJFo3EcYwrD6IKI9fRVan8QGJEyrEx66RF+Rv7l/nIkPFyxGbfg1JdVQ9rgQQHKPoq
         XF68bWuZ6M6uD6Aq0RL2zmxotodAdEcFUE1rQnmDXT/94gVUO+A2mN2qbfHZiwbt4OoD
         ddzgxVwAcu1DH7pR3DFpmsx7Yejetg4KDVcudvtOXHPQZBC1fdgeHD99tfwPfFdbaB7R
         zK8hOYvixRmxdHO7qVhv+BkHe8HqP5Pn6gkgJjQ/ncb1muzEzYMtRYb6VJYtMAqJdVWL
         nFUNYGhjhZW/z9d81VNGaQ+6NOpBERJgxP2cXCpFJuaagM9WjPGhuEmjf84rfEihvSja
         JvvQ==
X-Forwarded-Encrypted: i=1; AHgh+RoT3RFVGqoGCSktgc1eX9nVXm3VVfDUP9YJHPqrC+40i15rWXDWJ/vhAeS6+Br6KLaNBgQ=@lists.linux.dev
X-Gm-Message-State: AFuF++mYwTvbXDKZzweURk/TJjYQPMPwq3UslOmMjqzPIMaVr5DrwkVF
	tkGaByxwDHvRTRvTgyrLkeAePbowfhbmxelFreNR7Sp0e0zUNbRts0puj4894bm0GUEpmgUJTY2
	riq1pclUUWe+5MHxvcyk3kXXAJ17U4KwCgxZBJAgoV2cCJ7R+cvLfLLs=
X-Gm-Gg: AR+sD11rIJYidBr/uChUw2cBBFu9eGUBOnWpvUZxpaVXZDi3euRILYBImITdZgPGS+s
	SHMs/6wNDW45dMB+uoKPab+f+sjWQzGnOmruF9+cMOjJwSDp1D50pK5k1WatvqMgmn1EB8f5PPW
	mOc6BWl33q2OGnR/Z+CLoOsOOVAsryopJbpP5U5Hcc3O8DL/x3JTfwhJ6YFFUv0CrORdUEoFVqi
	pE5vR8pKQ7lQ2J9CPpSgjJanOu6wV+rER3RWaVCQwkbxsx3d54UbbwpmXsPag+2gEe+K7qALbr2
	Znnudo2ZH8Wp3PZvn7uV3GYvAtvHxih6jMn5/J95pt2irn0Hbt18jH+UjxCMAMfnlvcSyrJ16xe
	zhOh0EitIa8cECDO0zlbIBDGYbGk9KZRcvFo=
X-Received: by 2002:a17:90b:510d:b0:38f:18f9:785 with SMTP id 98e67ed59e1d1-39580f2d498mr9334500a91.8.1787146013014;
        Wed, 19 Aug 2026 06:26:53 -0700 (PDT)
X-Received: by 2002:a17:90b:510d:b0:38f:18f9:785 with SMTP id 98e67ed59e1d1-39580f2d498mr9334409a91.8.1787146012498;
        Wed, 19 Aug 2026 06:26:52 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327c2a92406sm6126465eec.11.2026.08.19.06.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 06:26:52 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 18:55:57 +0530
Subject: [PATCH v5 6/6] PCI: qcom: Enable ASPM disabling during link
 retraining
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-bwscale-v5-6-6dea79786b37@oss.qualcomm.com>
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
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishnac@codeaurora.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787145973; l=907;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=f9YlB0Fh+bNAledBbgwJEMD/HQiDELnKiSK0+Ha5n1U=;
 b=OgQCeukC0yqHkRBcMr7JYdM2b51+4QKimpjb1JOms87pWnVBZMA/wPJfz26Gp6RTe0N2xIQPZ
 HXv8nvTacz5BZOz8pgiG9ztzWQqkRsKziXtqPbqDfuD+EpVFPQQZzA2
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: WmkLNRMHUTOaoKWtGOfGO1g59jDPhTwY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEwNCBTYWx0ZWRfX7Ws15/SbjKP9
 2R9qISNiid0k1pEutqoNffeoFodYSvMpNDgXfJ+JW0pFDUI58LRdQKOTI9LQ53wFP0Mmacy0D93
 Faa1N4LIhk0/yPwDH994C/fC7hwHO+5nWex9vFgoEFIJp/816QBwbTsCPh8W2op72rTWY7PkbZw
 oWELNeK47PioM0xPDWazW/yZV4SkkDa3lFSPAopfyMWG1myJM6M6moBAjIP6DSysnRwjwMb3Xf9
 WRu5z7XmqHrETZre368CJNphKLP+ys87ygp6x9sRx/IUh/Fe9QODf5OnIZaJ+9QqMjTW0HdHOTB
 anussS4DVHlhT9nKXkYP6toi/H92ShsoeJKzHC24fKNRBoNAUAu4oA6OUGoBkLFVR9/3KmKZwE4
 D69/Nn2Kw34CY80ItkCcHy5IK3oObXpwzVWY/kNFBlfDXLENHTY/KOS99iOzi80WRNrCCm7QlM8
 /PHAWRXeFFC+Y0vyysA==
X-Authority-Analysis: v=2.4 cv=aMrAb79m c=1 sm=1 tr=0 ts=6a85af1d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=LpQP-O61AAAA:8 a=0KoEUwRExAGgTGxQCIUA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=pioyyrs4ZptJ924tMmac:22
X-Proofpoint-ORIG-GUID: WmkLNRMHUTOaoKWtGOfGO1g59jDPhTwY
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEwNCBTYWx0ZWRfX0mhhOJQGoXLC
 TKwZ8JGlnVSdgnOhdpb3BUIXqy9OTe08tfI6kjVtXE4aYoSyl/sOFw1/jCFvuKzvGuvPqKHrCH1
 Z0i+OQ2zvHWb/wSDHseJ6fkuSFGgYto=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190104

Set the disable_aspm_for_retrain flag in qcom_pcie_host_init() to ensure
ASPM is disabled during link retraining operations. This prevents potential
issues with link state transitions during bandwidth scaling on Qualcomm
PCIe controllers.

Signed-off-by: Krishna Chaitanya Chundru <krishnac@codeaurora.org>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 45f4caeb0814..0237f747b69a 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1395,6 +1395,8 @@ static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
 
 	qcom_pcie_perst_deassert(pcie);
 
+	pp->bridge->disable_aspm_for_retrain = true;
+
 	if (pcie->cfg->ops->config_sid) {
 		ret = pcie->cfg->ops->config_sid(pcie);
 		if (ret)

-- 
2.34.1

