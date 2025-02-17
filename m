Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C361991A1
	for <mhi@lists.linux.dev>; Mon, 17 Feb 2025 06:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739774065; cv=none; b=GMF2nq70+STblhLL4H3gi8uWfBKd/rEjEPAAwdQ9mkf1OmGqLQv6sDlHJtK8pt7VK48jWoUk/k/d++FBepEpfhDoVXdPyWu3S613M7mt4FMt7o9Q6XZOtytwP9tWQTCGm655FVGFvrbRIgXMYk1tLZEdMZLNUO8HHFZAzqtOhhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739774065; c=relaxed/simple;
	bh=kC8jbRyoGWHcr5F6bMdpdYEPmSroHXkD/t16CewXuhA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lU9X7E/XTIXZeb/4gIblWF6acP8hjmyQpLtqWni6Rkvp9PVJsPUcQBDWR4cqtcQaR9XOjscDtzxH9+VzHs/bkCxnPSRwulVslkGUc5uvRQTzykVtZmA5G/MDMFpNADApZaa5eZ95Ri0byLf4bf3wjrSo22Ow2bmEm5Uy9GCVJGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j7KHwzRY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j7KHwzRY"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51H02tjK026648
	for <mhi@lists.linux.dev>; Mon, 17 Feb 2025 06:34:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FDJhVDK2s1wMdCivo+PnGOHqGOzFfulqMDQxzsMg+uQ=; b=j7KHwzRY5vXBgrHI
	MmRCxQQX2Mp8LXTA9yqjjGzlH/LhsFIl1mF3GemMHOY7Zheu8OpQkqtySnaSBtD5
	lR6pQ3cgbnThz4iZpuj67xTxvx8IvZLSMHOkttAXjFEuZzuSfPZV0AmoXoLQYix/
	ga5XW3BNKZxnGPtBgcpZP9sWkW8gsG9+fsRnrw+OlJJDDpWA10OetDt0ufiRARs2
	alhuRaZd+/05a95Zfchlb4q65SBT29bt0qoo3Zabjr5LZFntIP8JetFXTLtJtYJd
	cAXwgNIGELntwAWg2rs1ajnn3rpqlP1zLpsISDkZkmcYsMDvaIZmwQ46+WwbKqkd
	HM1bmA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ut7sgq51-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 17 Feb 2025 06:34:23 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2fc2b258e82so6207879a91.0
        for <mhi@lists.linux.dev>; Sun, 16 Feb 2025 22:34:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739774062; x=1740378862;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FDJhVDK2s1wMdCivo+PnGOHqGOzFfulqMDQxzsMg+uQ=;
        b=F6mfgdS3IBgLfmUFikibGv5N1Zh3TUD3TQFh0HXdDFOLwUpxmqJG0BerQE7y+iQ9DN
         fYLa1xwjeePnIYlMQyDZV2kuEo0YJn5hUVRgbAVTnB7+oE7/iYRjb7YTQLsnFG4ZToc1
         eWM+7rL93EMkaeKjLYvPWqQUkZtPCm5PZun1Heh/bvk/pJ+aIc5PTXDpuKmYvRDkVlEu
         EtLOUzKQ910/NaXoq3XQIyYvPQYHsBiNVQhLnCeU6ob27ORHbciJPXYOCSyT0K08iS2i
         xI5wGI4mM/AaJ/fSyQUZo/0r2DK+oxhvFYdyecjMJnlvbf4wQVVsqdMM1KvK5IU9pY1Q
         fdFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgtQ69LTqaYwupRu93ybWVw93s3Sc/BM8MAcGJpL4pGmZKGwz4vh9wiTVKTP4ckqc6LUE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwyC3XfAbcWjt3Bst75s+PG8EvDTRyFryvEJSyAfFOWtsIK2Pqs
	1GuI41WXVGMSLWBZedWxZm42jyhwcAEDkaT61IgBri7QIgKNRmlbmv8U/mXet/VFG3radd4DnP0
	DEQXCodfpmt9IARdwK97m+QAS2kSwbAw7d1GnykY1LUA1TygigHI=
X-Gm-Gg: ASbGncuvFyXT20fJ+S+rAXxPhlPXr30lr6s4XcaukLiK0Nch6SuinQ9Qs/jKhqWAo5q
	K3EjY92PY2IN3hmCIeRnKwgERJOcOjZOAfR1gDhqKqUccx0WTU+VM28IOzRw4Yr0YWFNraEnhQK
	sSLLS44zR/vlsWeJCGB86zbLZX7KYwPvlPhnhUPSjWmFL7/0b5KXPB/KyeJ4i/g+rUiJCkuWNVt
	rhW/6DokLPCgCPsYSRQQJXKAs/imX4uY+afLJVc3IGvT47dagHd3roWHyPGtsSIwSixAZrg/C3P
	niyVuv8x2WIl8VgJLix6Mdb8+fDMcGFXwm9NAEfb
X-Received: by 2002:a05:6a00:234c:b0:732:13fd:3f1f with SMTP id d2e1a72fcca58-732618fb56cmr14240334b3a.24.1739774062248;
        Sun, 16 Feb 2025 22:34:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHYqHKfP8yt8Qc9a4irh4K2X23Pjq+LDBH/UrCtt41Jc31megJXVhKOSJ0WGBaKxJlBENpI8w==
X-Received: by 2002:a05:6a00:234c:b0:732:13fd:3f1f with SMTP id d2e1a72fcca58-732618fb56cmr14240280b3a.24.1739774061833;
        Sun, 16 Feb 2025 22:34:21 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73263b79287sm3771800b3a.29.2025.02.16.22.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 22:34:21 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 17 Feb 2025 12:04:08 +0530
Subject: [PATCH 1/8] PCI: update current bus speed as part of
 pci_bus_add_devices()
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-mhi_bw_up-v1-1-9bad1e42bdb1@oss.qualcomm.com>
References: <20250217-mhi_bw_up-v1-0-9bad1e42bdb1@oss.qualcomm.com>
In-Reply-To: <20250217-mhi_bw_up-v1-0-9bad1e42bdb1@oss.qualcomm.com>
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
        quic_jjohnson@quicinc.com, quic_pyarlaga@quicinc.com,
        quic_vbadigan@quicinc.com, quic_vpernami@quicinc.com,
        quic_mrana@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739774050; l=865;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=kC8jbRyoGWHcr5F6bMdpdYEPmSroHXkD/t16CewXuhA=;
 b=hAVSW6/mEXLaE68LTQRU1W1pp3AwKigPt8H4z9WgsiwikLyZ6pqw33aV64WLb27DPL5BJXnt+
 HjostU9NnzzB+r3K5WlQydd1j70lmCZqQ728uCojPDlkaI92/xfpO8z
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: vWOFFzSyRsBGrVoUooQNvFoTJ-f3q6ub
X-Proofpoint-ORIG-GUID: vWOFFzSyRsBGrVoUooQNvFoTJ-f3q6ub
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-17_03,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502170056

If the link is not up till the pwrctl drivers enable power to endpoints
then cur_bus_speed will not be updated with correct speed.

As part of rescan, pci_bus_add_devices() will be called and as part of
it update the link bus speed.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/bus.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pci/bus.c b/drivers/pci/bus.c
index 98910bc0fcc4..994879071d4c 100644
--- a/drivers/pci/bus.c
+++ b/drivers/pci/bus.c
@@ -432,6 +432,9 @@ void pci_bus_add_devices(const struct pci_bus *bus)
 	struct pci_dev *dev;
 	struct pci_bus *child;
 
+	if (bus->self)
+		pcie_update_link_speed((struct pci_bus *)bus);
+
 	list_for_each_entry(dev, &bus->devices, bus_list) {
 		/* Skip already-added devices */
 		if (pci_dev_is_added(dev))

-- 
2.34.1

