Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557921A2645
	for <mhi@lists.linux.dev>; Mon, 17 Feb 2025 06:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739774076; cv=none; b=c4mJs6KjAIxN7iF/6j0+6GrHTXfMTTdr6WHOokzmL9gXUWZm44J7KzBnHouyluA61hCYvb/+2XeILNvmTvtvsYg0+DB09Jklbwi/Rjxf2JeQ1/uGXdhqeT69LIT9mXadLwWEN9DV4BNuQquPmLYK84tOVBTxGR8/uDJu5N2lc3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739774076; c=relaxed/simple;
	bh=PmKuDjh7TYnL36BsL4uFK3e2cvQCdB+O1CmCQrAD7C4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XKawL8fuJpiSWN9clevYu4mlZKkOQUT0tmQZSfAzgZ5N+zVteo4amic2leXb4twMxshR172DU1TGXSMQkYO8kJkHK8JmM6iAE7qc2pM8rN5cNC1305dXogU27+Bb0kra1xYD5kJcG5fAkz5CEOq3F5EkdpcytG4Vd1jhMuyNmrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lpgZ3EW0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lpgZ3EW0"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51H0m2Wq015302
	for <mhi@lists.linux.dev>; Mon, 17 Feb 2025 06:34:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9igTd27vOSt75Vx+/a3cETdMPX96Kxrxr1+ntLhQKa0=; b=lpgZ3EW0mpxwv0E+
	gOQua5pAEUvV8uXKt1DFU5yZi9T70izQxPhRTgxYwuaykNzHK7K+x9p+kp6RGPG6
	vGAH78mWGghvsA37SywtIrcO9orkbPba3eY/r+lkUeOI3bt4ha+6lewAp5FoT9+w
	mIg8ZK3Xoz+3cKR58j8ELCl81IHXBbC6tnbi9TV8rle4eUdH6R4gkwzAfcKWKV4R
	hX96s/lVoNo/uAGaeH4QzeTAU3UpqlEr9RuHuamen/XcSwNrVXmLgqhmoBxgKjQf
	wVY8Zfr3X/HamYup4fC/pDhTYeiPOE+mxhoVoTxjJY4vIiqCFXru98FFpwaD96iu
	v0pr/g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ut7s0pjy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 17 Feb 2025 06:34:34 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2fbff6426f5so8331160a91.3
        for <mhi@lists.linux.dev>; Sun, 16 Feb 2025 22:34:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739774074; x=1740378874;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9igTd27vOSt75Vx+/a3cETdMPX96Kxrxr1+ntLhQKa0=;
        b=JYA7KX8Hiwv2g+jEZscUWlg/dc2M6dYWSvlTBDdadDlP6TFufP9A0rwr2yTSfkgyDy
         6wZti6pRW+3lBA/DdXxNjpmdJD3xV90tzaB1a+EwqLYM/4Ri7Bdzu1DsV96GkVyl38vc
         4ZHX2yT2aR7xViu3QeqekQqqjAYuFPGoJKuYEMGh6rNu5k/ldD2WJFShUl45y5lGvcXZ
         NkpKXNXoCHjOuqNGee/APQOHSyZ7xPrTXgAx4m3xNL6Pu4t119WT4H1gRadihEoZUCLs
         GaAmgW4iqnmIRILSNBmdbtorsQRZXZuh8tAwzMy2PgUgMHrt2haxnuWYoDkkhGJjW8Dt
         j49g==
X-Forwarded-Encrypted: i=1; AJvYcCUZF25KXcIHCeGYCvfxpf2ahwpNQ1DdiMv+eAJdnIPyGDz6XBLYRxtPLq1+4RGj+9AW/jE=@lists.linux.dev
X-Gm-Message-State: AOJu0YyZoWdEJ5J2sO3YTQaIKUrZuk0AHwsKnBytCtvMTgRq/RW8M2ib
	GaaK7SRCsB7hZuT3ehDJbSf0GcXaf9qURy58lpNq0rrGdJHYLCOXKiWlQOOUDEHSCibshJ1YYHV
	nwplyc2KSiip4PAAgbGY0KH9Aj0NzjPMKlA9i8BWDxO7p7so0A0M=
X-Gm-Gg: ASbGncvMhJoLqNqc+ylHzpq/aspP7Lm+eQwBvk5kDZk/hHtc5x0YHCNE3yHTGyphj7V
	ltt7LjKXgKpJPG6af3NrhQnmqo6tG60rQOhH2gR19sMC9/OgLzrOfQo377g23xuf/im6/yJTg6m
	OiMnMUF8UyZPxDnLTsIlchBTJYvAWgZTbepVhYNFKH7n5ZmpUYt8fHnIAZQv6jue6GkZx2dWgaB
	RYCfvutYHkkA4j5iqfCwZnAoJf4LW5e9apEWv9xxK81rdQitjiBsaoIrpo6TUIfteRMgJRt+Gqc
	ke5Pse6JjlUxT7gKd6DymlTsELM7uS2zGX0g6onY
X-Received: by 2002:a05:6a00:3e0c:b0:730:75b1:7218 with SMTP id d2e1a72fcca58-732618c1ec6mr14974778b3a.16.1739774073598;
        Sun, 16 Feb 2025 22:34:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHafDTAFp1GvU3CHv9ZBptsIxiiNWeH9I/2oU2Kp5bCj1qR25DKxmHgRfZiANV5piuH5zfVkA==
X-Received: by 2002:a05:6a00:3e0c:b0:730:75b1:7218 with SMTP id d2e1a72fcca58-732618c1ec6mr14974721b3a.16.1739774073159;
        Sun, 16 Feb 2025 22:34:33 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73263b79287sm3771800b3a.29.2025.02.16.22.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 22:34:32 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 17 Feb 2025 12:04:10 +0530
Subject: [PATCH 3/8] PCI: dwc: Implement .pre_scale_bus_bw() &
 .post_scale_bus_bw hook
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-mhi_bw_up-v1-3-9bad1e42bdb1@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739774050; l=2235;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=PmKuDjh7TYnL36BsL4uFK3e2cvQCdB+O1CmCQrAD7C4=;
 b=klwj+7NCfeWvDoVYvXPeVg69yujP2GAfYPvAEuiF+KnPezPhilQ8VrheQA2mmkJNa+z/rwiGr
 7Ap/JoRXXsNBio5kxhs4s02TShlZdF+K/JhEklaBhvKYW0tWNirUE6I
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: BrtF4NRkGLWHMl_HlsAGXrUQE5XEBG5w
X-Proofpoint-ORIG-GUID: BrtF4NRkGLWHMl_HlsAGXrUQE5XEBG5w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-17_03,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502170056

Add support for pre_scale_bus_bw() & post_scale_bus_bw() function op's.
Add support for DWC glue drivers to register for these ops.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 21 +++++++++++++++++++++
 drivers/pci/controller/dwc/pcie-designware.h      |  2 ++
 2 files changed, 23 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index ffaded8f2df7..4da4df62c3f8 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -697,10 +697,31 @@ void __iomem *dw_pcie_own_conf_map_bus(struct pci_bus *bus, unsigned int devfn,
 }
 EXPORT_SYMBOL_GPL(dw_pcie_own_conf_map_bus);
 
+static int dw_pcie_pre_scale_bus_bw(struct pci_bus *bus, int target_speed)
+{
+	struct dw_pcie_rp *pp = bus->sysdata;
+	int ret = 0;
+
+	if (pp->ops->pre_scale_bus_bw)
+		ret = pp->ops->pre_scale_bus_bw(pp, target_speed);
+
+	return ret;
+}
+
+static void dw_pcie_post_scale_bus_bw(struct pci_bus *bus, int current_speed)
+{
+	struct dw_pcie_rp *pp = bus->sysdata;
+
+	if (pp->ops->pre_scale_bus_bw)
+		pp->ops->post_scale_bus_bw(pp, current_speed);
+}
+
 static struct pci_ops dw_pcie_ops = {
 	.map_bus = dw_pcie_own_conf_map_bus,
 	.read = pci_generic_config_read,
 	.write = pci_generic_config_write,
+	.pre_scale_bus_bw = dw_pcie_pre_scale_bus_bw,
+	.post_scale_bus_bw = dw_pcie_post_scale_bus_bw,
 };
 
 static int dw_pcie_iatu_setup(struct dw_pcie_rp *pp)
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 501d9ddfea16..16e02646a8b4 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -354,6 +354,8 @@ struct dw_pcie_host_ops {
 	void (*post_init)(struct dw_pcie_rp *pp);
 	int (*msi_init)(struct dw_pcie_rp *pp);
 	void (*pme_turn_off)(struct dw_pcie_rp *pp);
+	int (*pre_scale_bus_bw)(struct dw_pcie_rp *pp, int target_speed);
+	void (*post_scale_bus_bw)(struct dw_pcie_rp *pp, int current_speed);
 };
 
 struct dw_pcie_rp {

-- 
2.34.1

