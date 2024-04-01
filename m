Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7375482C1
	for <mhi@lists.linux.dev>; Mon,  1 Apr 2024 15:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711986657; cv=none; b=PL47DKtaJm5hdDvZzCsM63CjAuke+GNb39OHpSd0UsfdmpfsM814PF93S85bnFoUoS8r1BLmZtDLItjd/wcnjGhv9r/TtWSPtF/P73h1I5C0UikUxgUKqZtD/WYhM+Ytgw1VLPt2nULSziNFbleWMcngpDC6xjSqxMnA34tj99Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711986657; c=relaxed/simple;
	bh=rwb0ErsAMOJOBGTVMRpx900gyCjG88g972dlNjto2GQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IbM+LHKpQ3XLVuIIDfNpsQaqBounKb2IV9aavYSWIuRh5ONCELzu35/zVjN7ZuQBAUAcv7PP1x7GUnnRnCq6dbVqeCDe51ARL5t89vdg1usNwCSfkuBtXT9Ps7T44djP3i28oa206NOrNXPVJ2WHqTG8dVrqH+2cIqwgAITEjz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VAdLRMZH; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VAdLRMZH"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1e0f0398553so37211145ad.3
        for <mhi@lists.linux.dev>; Mon, 01 Apr 2024 08:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711986655; x=1712591455; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WrN5HMtM25sMebZ7OPzRb4bH/7+xLTv/ToBzj1D+nVM=;
        b=VAdLRMZH4JbcpkHHrn7oDm3rAmCpLA3b55RwwtiOIm74IFJsLVTF/xXfdDSkrQd+Ak
         vkGS5mOv7AGyVcOR5nERD3GEubFoc55NEyuHURkmMbbt9LA5xVvbhru7OATU3LWF8Bd7
         9HCu+mCixMJJDxAiMuF1Xr+rMiSpb/dUCJSfYhIpNnZchlrEYTt0u2GN8SA0UoHraNzw
         fgyFI0X0R2SVKDf4Cp4QLuEHqQnu3Dgv+UihbMzrwyNxq1r/Lf5khCn1AZQR3rj2g1Ux
         0ZXHAbPJP5BngWte5d0aAKGcUVtckF1wq9kTjWLMOx7fO4KGTuOFX7iUOE0kpsxkGjp3
         CULQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711986655; x=1712591455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WrN5HMtM25sMebZ7OPzRb4bH/7+xLTv/ToBzj1D+nVM=;
        b=PJR/1jqjEzKBAJoeYw1g1p73/xSg2sRAoOdHQNqVa7bimUq9k/O+yyYpabQYh3edAg
         PfsN5jtSjz9sjkvuvb3BwYURaG1mb0JAzaRfHMxbEkMEmzcUCVpYb240rC4iqbUkTjMX
         QLY8Gx8Q9fYhkakbRTKkxPqWezh4SxBUi0No1O7+NtE6W1/S3xJ4lFjz6mRGzBvKHOSE
         jAktS9e9DJD97qGXP4C+xFxjDm1FQvJq+vBRCZMY+SzWtVnJgxtag31bpOPfSXG5nwiz
         3MpBGT+8Ke9BdiEtf1y/cEHxssdlOXNBi3P0qWlzaoLGZqaC4TQ34Fktlq6vkV3VRD7u
         0IuQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5//0fNSNMZ4KihKBS6hGoNsd/jHdtTEYWrb0JrYyLzVI6HhxiJD3JMawLDUm0I67uN5I6qpargcZy+779V4DZ17vg
X-Gm-Message-State: AOJu0Yxz2n421bfVV6g775J98F0QT7YRcIwqATl+QhEX9LQx+Y0GlJVy
	cg2prD0r361/930aU9n5U/Egz1XZdv7UG8m/6nCeN84gEl1cyBn+luNlUsDoCQ==
X-Google-Smtp-Source: AGHT+IF39HRm8jjnMyloFugbCcUu8btXf6eiHmmOu5g4fIblYTCoIk5bCK6gKkCClyNdWAmIhWpeiw==
X-Received: by 2002:a17:903:1112:b0:1e0:b689:950b with SMTP id n18-20020a170903111200b001e0b689950bmr12426593plh.16.1711986654875;
        Mon, 01 Apr 2024 08:50:54 -0700 (PDT)
Received: from [127.0.1.1] ([103.28.246.102])
        by smtp.gmail.com with ESMTPSA id kh6-20020a170903064600b001e21957fecdsm8949076plb.246.2024.04.01.08.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Apr 2024 08:50:54 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Mon, 01 Apr 2024 21:20:27 +0530
Subject: [PATCH v2 01/10] PCI: qcom-ep: Disable resources unconditionally
 during PERST# assert
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240401-pci-epf-rework-v2-1-970dbe90b99d@linaro.org>
References: <20240401-pci-epf-rework-v2-0-970dbe90b99d@linaro.org>
In-Reply-To: <20240401-pci-epf-rework-v2-0-970dbe90b99d@linaro.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Jingoo Han <jingoohan1@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mhi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, Niklas Cassel <cassel@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1389;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=rwb0ErsAMOJOBGTVMRpx900gyCjG88g972dlNjto2GQ=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBmCtfTbHdb/NIZ4j2oaEOmJtQbURUAdORx/0MXJ
 2C+AX0dVXyJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZgrX0wAKCRBVnxHm/pHO
 9VaACACeknBp/KA4sTwit2LLbMMFCbWmaxjzozgXzDR6cM8p3cnLQfaO840eMISjPS+6luIH5Js
 rWpBVMbkc5CqPad3QyA4/nGN/XWVSLpPFs7xpv/k8m6uAucHOsFkotHQToKVgSnPFjoMTDqyf6h
 dgEHUBvZjmyk5Gd4ajsjuGsOm2iuXEobRe+F/VwvtWYODEKE1gx3BKF1JicHxgMGUpqZ/4cchVj
 2CjZvKYvSitmy+EXNj3ZDBNXgPbAunKidHvpuDiKoLEH3nrOtzr9M4BL6Ziyfig5x6zHsBAaz2Z
 zdBh5sM4eKVDqaPEvufI0LNt6UwHfKpJoNOb2dipbSD/0RPn
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

All EP specific resources are enabled during PERST# deassert. As a counter
operation, all resources should be disabled during PERST# assert. There is
no point in skipping that if the link was not enabled.

This will also result in enablement of the resources twice if PERST# got
deasserted again. So remove the check from qcom_pcie_perst_assert() and
disable all the resources unconditionally.

Fixes: f55fee56a631 ("PCI: qcom-ep: Add Qualcomm PCIe Endpoint controller driver")
Reviewed-by: Niklas Cassel <cassel@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom-ep.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index 2fb8c15e7a91..50b1635e3cbb 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -500,12 +500,6 @@ static int qcom_pcie_perst_deassert(struct dw_pcie *pci)
 static void qcom_pcie_perst_assert(struct dw_pcie *pci)
 {
 	struct qcom_pcie_ep *pcie_ep = to_pcie_ep(pci);
-	struct device *dev = pci->dev;
-
-	if (pcie_ep->link_status == QCOM_PCIE_EP_LINK_DISABLED) {
-		dev_dbg(dev, "Link is already disabled\n");
-		return;
-	}
 
 	dw_pcie_ep_cleanup(&pci->ep);
 	qcom_pcie_disable_resources(pcie_ep);

-- 
2.25.1

