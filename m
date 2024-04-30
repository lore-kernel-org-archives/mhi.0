Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E23918E29
	for <mhi@lists.linux.dev>; Tue, 30 Apr 2024 06:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714457641; cv=none; b=QbaOSnDN7A0b4Z51uZPth5rGYp4PKs2oEJqrzU39PRMz86iaDG9HrL2OJilZXoh0PH63utZEsDajqftwzuQECIUYqYehFyq/BhfH/6HF+fh0IUEz1UCXru01+MYz2ycHE1VJT9nEAEtqwrB9b4jh0Etm749eFCMA+4KUd0lQe9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714457641; c=relaxed/simple;
	bh=jt1D2ByjrZn+3+b2hbWiJrAvnVxKB+ZADxZB6BY649I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DmlqTTdliYrAUmh9gn2DC5gnUXFar+geQFGelRYQABrQYkojhnNdfJq7/+y8XhCwreCc1kJW4CvDV7uiV0J0wH/W8G6HmT6eitb8voaS1xh/qYuTjQQ6u5lHdSl1w4gCm+64/zEllaBSBBFaIr6BOtXoTa3ixigBv3+XiYRLmXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NX00Ccfj; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NX00Ccfj"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-5ce2aada130so3659702a12.1
        for <mhi@lists.linux.dev>; Mon, 29 Apr 2024 23:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714457639; x=1715062439; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wXh9sF7R3fzAgfyMkAPr9tJsPtu8XJez/oIKM/eXa7g=;
        b=NX00CcfjPJVafrwv5/opElShqkcNg1UpgEyvePhCJxv//X6ZInr+lU6JZQwnC3/6F+
         4iH2dUZ69XsDIGoMyyZHMBzFB0uM/pWnDYRgrImIM1AfUzkR/o00cTsXJpOr//LvGOGA
         z18O7AY85B0pQ1q2H8uBpF8GpgXIBgZ08mNEmNTI/e7hhp1i5k5TSIaTg261lqPiJpFU
         hsykwUea2nrI7numyh31bmZL8rsx95V2k4CP8dNK91yP4zFPFc0BODlHIKPiqpQ2wKnl
         pZxGs4lKX3aa21O6ypSUQdBMXE9+4zKdU9Bpa6Nj1re0pij87mwn6MAe3oK6dltkQ/uy
         8/hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714457639; x=1715062439;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wXh9sF7R3fzAgfyMkAPr9tJsPtu8XJez/oIKM/eXa7g=;
        b=bt1wS0H++T6APBfYT3nrOw+K7BKCnWgwD5lwVF3+eZ0zj4MO/Pfd92xVvzjkwq/APL
         80L8Mld9hYoDxrwR7RWmM3scbuOLLBb8ZUKiYiqBk0IegSKhA2aRAQB1/dwUB7AhcjQM
         yc33zqw0xxNCVICNJPQgiO/TKK/ymoBEx12YbDjPObnSsva8JzikuINTVP5HvnZQRtvz
         lduhkklfn7NF7Z+i1Doeua31qHld2LIbUrl9EifufoJTmSh58+jjLOPbIx6SU/EHUFE9
         QtnTwcAseC+uZdWuM1IJ/MAc0onRCboh07RKLL3h1/lynZ+1QEKIXIQ9Cuhz3YfQbeAj
         Z6dg==
X-Forwarded-Encrypted: i=1; AJvYcCVj9/XmZzLVeWdcyD969Wat8qZzvOjOs5jGczFaxW/JFmy6M+usUm4xnsgCdxYKJhKgoXutrNWUC6YDJgaenzkF4g0E
X-Gm-Message-State: AOJu0YyQXjSDTvlcwk3weFX0hCOrIZieSPbz4SOd6sL7urW/tYfxTiCg
	y7P9xKtFE4Gv2D5qLXBHszkZUbMYmPlnFPxZRRQ8C0ShTDLBocS2wBezQTlvvQ==
X-Google-Smtp-Source: AGHT+IERNIpcVXnSkXOmcaImsK+5bkppIPbBwq2zMma4pGcKZ6IuGe+V26L0xyysFM6Tlh3EGcEAVw==
X-Received: by 2002:a05:6a21:8801:b0:1ae:42f0:dd40 with SMTP id ta1-20020a056a21880100b001ae42f0dd40mr11483048pzc.10.1714457638098;
        Mon, 29 Apr 2024 23:13:58 -0700 (PDT)
Received: from [127.0.1.1] ([220.158.156.15])
        by smtp.gmail.com with ESMTPSA id bi2-20020a170902bf0200b001e27ad5199csm21393298plb.281.2024.04.29.23.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 23:13:57 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Tue, 30 Apr 2024 11:43:42 +0530
Subject: [PATCH v4 01/10] PCI: qcom-ep: Disable resources unconditionally
 during PERST# assert
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240430-pci-epf-rework-v4-1-22832d0d456f@linaro.org>
References: <20240430-pci-epf-rework-v4-0-22832d0d456f@linaro.org>
In-Reply-To: <20240430-pci-epf-rework-v4-0-22832d0d456f@linaro.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mhi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, Niklas Cassel <cassel@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1435;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=jt1D2ByjrZn+3+b2hbWiJrAvnVxKB+ZADxZB6BY649I=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBmMIway5+22p+3zzxNye4e9nY6gatrHr6KQJdEi
 xojXepGaKCJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZjCMGgAKCRBVnxHm/pHO
 9exSCACQpshGLWqd2q2FIap/b/j21N7ezIygTykNAuBoxRvI52wZ7AgL4XAc7ehW7jUy7ug5Yj4
 TTAr9ibRkE5YNpUxp2kwf08BbNC5DRpcuZCIQYpK1rXSXrQBmDkotbUlhyVLxbe7jiQJsXxMetC
 K/WGd+ng5BS8AmHl2eEkY4QMivJbKBKS5edIIKZ16T2pxXe3vyIonISkA1AIwtlpGT9MU6mu4cf
 6VlwgFmFLZqzZ6M1H1FFyVRFfLDUMRbDmW65qFy07zxaptW12SOqb3qt3wiknS/pnqHopJ90JYg
 TkFD1kWZCtArPpPV3V8m+m1BYaStbdLk91RodRTAtyF0wDmH
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
Tested-by: Niklas Cassel <cassel@kernel.org>
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

