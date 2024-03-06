Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F433604CA
	for <mhi@lists.linux.dev>; Wed,  6 Mar 2024 10:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709720553; cv=none; b=RzH4KzsfQUV7i7OL9z5GMXvN6whn8mhZNxOfI2dXsc8y3iRjqhnxnQiGw4ZXoGAla3ZZoipiq+oXsXQ/ipsELZ/60i3eg/xNyYFvQWn6Saha3ejlAEw0VxWN8/NoXkiEP+aTrn6HIhaRtojXNK2IVhUuzFjEL2Exuki1f8HYGi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709720553; c=relaxed/simple;
	bh=GNg1QejkcoZ5fK4swcrLBbBe1IA73m5a3pHFG5FA1Sc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fYO4xW+7F6yojZVTfT0truX0WBs99WmKV9MeMwNri7IyHwky3MHzeL+fSV2WcDgH32Wo6mwkJQ9/1TJ7rC4c3KAMriMfbzl2QerYnOtowFWbbAAXqwwOzRVxNO//QGPsXd3AYspeFhif2AY3A1/1MyAtUd0nEgtr2B6/X6LMzpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Sbkvto7y; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Sbkvto7y"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-5d4d15ec7c5so607306a12.1
        for <mhi@lists.linux.dev>; Wed, 06 Mar 2024 02:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709720551; x=1710325351; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j3vP/5bP/RBlYdf1td9wb5cvuOaEn1shwa0DYeck2dA=;
        b=Sbkvto7ylahV176ZoNOUMKbC4CTCPuSDv0WHuIC04RiYn/FDdEGzzfB2lP37Cd02FY
         okGBOXkjv19g5+EhUTFb2rHoLtwLN4cp96FdqXFXYS5CQQGfzqB9r6fvE/QncM2oZz75
         IzXa7vB9cyDl790Z0XVYR4mg27e69fjwLuHCnUKvNUwm22D3qpg8+K23iZGZapqMJhfV
         3rgTRZfgH8jnTLDRyWHcqyW16ByL4JzS/A9115174S4LWp2qwOLYC4EOaz6tuSpdVvml
         oXZQEySVtzlT5HE6pDVRJJcHH9VSh9mEWgpUSKric2PqozRyM1R/OyqyD1NB0lyfRNIV
         DmCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709720551; x=1710325351;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j3vP/5bP/RBlYdf1td9wb5cvuOaEn1shwa0DYeck2dA=;
        b=vpjSI1vTxvDERbpGn/BDF11Y5BXpK3PlUI+ScSRtbCN7djt7RiYRNdpzD/svpkoLmd
         PqcSUAXd1otoAG15GhuesZOq2k8L4eUju9oy4oHDmtB/LvKConCzg1Ese/gL+4bng3/p
         63rCFyizEjS6v7zioCA9C5Zrf/Vts73yD6Sile+GyQWs3N+d8acC6o9tB/VFf7ohGST7
         k2m5uD1+8zSUoH5GK7yCO7wiNSIv8gX2Zlivt5wH67OUiBSK66R7Wu47uHtgO49WQlqE
         ljaDJqV8Og8VFnq9h25mWsltYH+N5tVD7WINte4zBV0pxOxiGf1KI6HP0vpBe3xz8Nlj
         UIHw==
X-Forwarded-Encrypted: i=1; AJvYcCVISeO9YgFwRjRi9O2PySFddDSKO1NzhIgjKl5D5q/r+M9gUuTV4UJ4CO/DtGOKmAeLxmWebYI0BRTk2boDFA5Jc3XJ
X-Gm-Message-State: AOJu0YwALQSiQhWfvPHXhJmTxnbr0k3h6j2AO6+O1Ix2h4BVhmjZMVsX
	XVliHddbqsjg8rsgQ8Sh158ERs3XuBIjiFALUnCZhmzRYc+KPM5NjuLv0UXobg==
X-Google-Smtp-Source: AGHT+IFJWhLefxgpPBPNhLypUf8mUHiWTVtuXiQSlNKB7G0ZWFGQdWmy89hjVGzwR0VhVJGZhJklCA==
X-Received: by 2002:a17:90a:dd93:b0:29a:7579:88bc with SMTP id l19-20020a17090add9300b0029a757988bcmr11410022pjv.46.1709720550661;
        Wed, 06 Mar 2024 02:22:30 -0800 (PST)
Received: from [127.0.1.1] ([117.248.1.194])
        by smtp.gmail.com with ESMTPSA id li17-20020a17090b48d100b0029ab96b13ebsm13339320pjb.40.2024.03.06.02.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 02:22:30 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Wed, 06 Mar 2024 15:51:59 +0530
Subject: [PATCH v4 3/5] PCI: dwc: Pass the eDMA mapping format flag
 directly from glue drivers
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240306-dw-hdma-v4-3-9fed506e95be@linaro.org>
References: <20240306-dw-hdma-v4-0-9fed506e95be@linaro.org>
In-Reply-To: <20240306-dw-hdma-v4-0-9fed506e95be@linaro.org>
To: Jingoo Han <jingoohan1@gmail.com>, 
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Marek Vasut <marek.vasut+renesas@gmail.com>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Serge Semin <fancer.lancer@gmail.com>, linux-pci@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Siddharth Vadapalli <s-vadapalli@ti.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3424;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=GNg1QejkcoZ5fK4swcrLBbBe1IA73m5a3pHFG5FA1Sc=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl6EPQdbpcSFeeqHfUcnEzcW09XZpqMwjds4rW7
 ouUkY/9IMKJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZehD0AAKCRBVnxHm/pHO
 9d3JB/49m7E14UAaGxtNaUW/tGfbFfFeT7L9Hqxa5OvwPAi/pI5Oh2VrUZbziA/w+y5CL5y2uRq
 MfIhLMAbL4Bmiw3W+GTGLoZa1OpuxjLc8rB8nMJf8SHxRT4yrP7M6buZQ2keE1vpet7zl4IexM/
 b+DbyZvsMTgRg4bCCoFb388eVZiRUTEsVtwE0MFRwaoDmtJ+a9L3Vz3S05Et39FePV+70ySWySe
 TjADU8T3jb7KIirsSxu6Bht3kQtDeldVIdek/NRmQd+pwRbQTc7nPQgSF8i0CCD0aOHcsJV7UEV
 tH/A38ghBvN2d+OceSAfnqCYrnScGl3GuIgwg0w61wycWg7H
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

Instead of maintaining a separate capability for glue drivers that cannot
support auto detection of the eDMA mapping format, let's pass the mapping
format directly from them.

This will simplify the code and also allow adding HDMA support that also
doesn't support auto detection of mapping format.

Suggested-by: Serge Semin <fancer.lancer@gmail.com>
Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-designware.c | 16 +++++++++-------
 drivers/pci/controller/dwc/pcie-designware.h |  5 ++---
 drivers/pci/controller/dwc/pcie-rcar-gen4.c  |  2 +-
 3 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
index 599991b7ffb2..c59b2876e5d4 100644
--- a/drivers/pci/controller/dwc/pcie-designware.c
+++ b/drivers/pci/controller/dwc/pcie-designware.c
@@ -894,18 +894,20 @@ static int dw_pcie_edma_find_mf(struct dw_pcie *pci)
 {
 	u32 val;
 
+	/*
+	 * Bail out finding the mapping format if it is already set by the glue
+	 * driver. Also ensure that the edma.reg_base is pointing to a valid
+	 * memory region.
+	 */
+	if (pci->edma.mf != EDMA_MF_EDMA_LEGACY)
+		return pci->edma.reg_base ? 0 : -ENODEV;
+
 	/*
 	 * Indirect eDMA CSRs access has been completely removed since v5.40a
 	 * thus no space is now reserved for the eDMA channels viewport and
 	 * former DMA CTRL register is no longer fixed to FFs.
-	 *
-	 * Note that Renesas R-Car S4-8's PCIe controllers for unknown reason
-	 * have zeros in the eDMA CTRL register even though the HW-manual
-	 * explicitly states there must FFs if the unrolled mapping is enabled.
-	 * For such cases the low-level drivers are supposed to manually
-	 * activate the unrolled mapping to bypass the auto-detection procedure.
 	 */
-	if (dw_pcie_ver_is_ge(pci, 540A) || dw_pcie_cap_is(pci, EDMA_UNROLL))
+	if (dw_pcie_ver_is_ge(pci, 540A))
 		val = 0xFFFFFFFF;
 	else
 		val = dw_pcie_readl_dbi(pci, PCIE_DMA_VIEWPORT_BASE + PCIE_DMA_CTRL);
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 26dae4837462..995805279021 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -51,9 +51,8 @@
 
 /* DWC PCIe controller capabilities */
 #define DW_PCIE_CAP_REQ_RES		0
-#define DW_PCIE_CAP_EDMA_UNROLL		1
-#define DW_PCIE_CAP_IATU_UNROLL		2
-#define DW_PCIE_CAP_CDM_CHECK		3
+#define DW_PCIE_CAP_IATU_UNROLL		1
+#define DW_PCIE_CAP_CDM_CHECK		2
 
 #define dw_pcie_cap_is(_pci, _cap) \
 	test_bit(DW_PCIE_CAP_ ## _cap, &(_pci)->caps)
diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
index e9166619b1f9..3c535ef5ea91 100644
--- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
+++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
@@ -255,7 +255,7 @@ static struct rcar_gen4_pcie *rcar_gen4_pcie_alloc(struct platform_device *pdev)
 	rcar->dw.ops = &dw_pcie_ops;
 	rcar->dw.dev = dev;
 	rcar->pdev = pdev;
-	dw_pcie_cap_set(&rcar->dw, EDMA_UNROLL);
+	rcar->dw.edma.mf = EDMA_MF_EDMA_UNROLL;
 	dw_pcie_cap_set(&rcar->dw, REQ_RES);
 	platform_set_drvdata(pdev, rcar);
 

-- 
2.25.1

