Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18C873161
	for <mhi@lists.linux.dev>; Thu, 14 Mar 2024 15:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710429853; cv=none; b=bxsobn36PPcJc4FLTeh2Pwr1VRLrStzi22+pRJSedeBdJS4rEMQyDWKRHIfDYNDpVTzYQmz4rymSITsaVJTfNbloYJ0p8t6jD3nfzy5/iJ0d/zl12ACWcxR0Vcs8LJVoMQRqPWf+Yj+g53j11xFgoHdq4MxAfP2KtFlwRIWQxZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710429853; c=relaxed/simple;
	bh=JRZLwKxhEM0x8HfB67G9+Fzppqg8xFqlyA8aRxI9XHM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KMKJs0NYfgl9vD5dh509jFg5sucNOdMBBuCRzLEZRyx9vpcXm13TwZST5j5jIdNfLXadviuvv+J2M5jHEsAki54B95PKcxAfA7+2CE4v0geAP7xRNp05mQdKV1wR2wVmie2AeoMqthba8ZDyBFsMiT0HBkJQ48csJbXoWFE1qng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BQDQdEyw; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BQDQdEyw"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6e6ee9e3cffso340953b3a.1
        for <mhi@lists.linux.dev>; Thu, 14 Mar 2024 08:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710429851; x=1711034651; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/IrOa9F9FCptyyElLcaGG4pDepSH3LTIYhrJfnXA2HI=;
        b=BQDQdEywBSzzitkZY6QhGkxjuoGcY+qXAGvSJMci8JMLvZ/LHDQ40dm8MjqTInZ1eA
         Ov4QkBhtK42qEzT4xYkyCfdTwPVTCSZp0IcjtDRUZCq307d3XYh5R4Mh5SHS4VDTI4cf
         nK3trjaQuj7q5/ALBQXR3XieGLraJP4rii3dHlYKrHb5RAvibNtAEsFXEBsXqIvY7W0a
         3sJnHbxMEcRjQiUoo8u9GWejk8tU6O6io1wVU1XW37KCxxECC1qNv99R1Aq/QSBjVRMD
         3WunNQRGcgcGLDanYjF/0w4fx/rD5V+mRH6/7g9nfIDW2D5vjiIUxcH7OAXTNP3dxPZd
         IHuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710429851; x=1711034651;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/IrOa9F9FCptyyElLcaGG4pDepSH3LTIYhrJfnXA2HI=;
        b=k6EByS1CoMSM1f5sOzI2slQEBTBx0m95FkrXh0QyQBlicL21a4tmeBugg01nxX+MwH
         RAnyXUyGiwVf3qfv8Xm3wTsvAk/W342+NURgdUWmvEnyy0i+YcJM9HuDsSVb4Y2T/WTk
         H8EESR875GMgjouARKszjgEBj4rAqp+GtIGDGAlN+71Mr6ucISqspoXSX4hphtlLaofn
         XmA44/A4drz+Xl96b1TbR3ppIQO+r6FpXQDuPIjQo5KuMlrr/YGP6sSstjn2d/vNEJQY
         N/9uN9AjVVtzVFAo89fxCjYDFgwO8jcDzh8Z1O9Vo9XhWoQbA5YB8/n7f4DEyoe4lg60
         Q1Ww==
X-Forwarded-Encrypted: i=1; AJvYcCWp8SapYqJw1Tpa/zFSa7P1ywbjHwmgcPmtzt2CN0tie0AmsTfzvD1l530f1uUuWFBhNrDlJQbvWjcW7ONuCn1oWlpU
X-Gm-Message-State: AOJu0YxHpfmtuOQfy14aVUAizf5CsuAbWfqGEOKb4FY9aXZsBQ99+zBA
	Y09hlOY5SzWcI2rXFnqe4M1JJ8Rl61zsoxPWhTv8u0oJJc+X0nHC7zknmhqO+A==
X-Google-Smtp-Source: AGHT+IG7jwbZIclHbE1GnAK6Rj5Bq8CoICWzMlScgrOOGIyJU6eaD/H0E/Up5FStL4M0GtXAcOvRKg==
X-Received: by 2002:a05:6a20:3941:b0:1a1:e41:3edb with SMTP id r1-20020a056a20394100b001a10e413edbmr3110511pzg.11.1710429850762;
        Thu, 14 Mar 2024 08:24:10 -0700 (PDT)
Received: from [127.0.1.1] ([117.207.30.211])
        by smtp.gmail.com with ESMTPSA id m4-20020a63ed44000000b005e438ea2a5asm824021pgk.53.2024.03.14.08.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 08:24:10 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Thu, 14 Mar 2024 20:53:40 +0530
Subject: [PATCH 01/11] PCI: qcom-ep: Disable resources unconditionally
 during PERST# assert
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240314-pci-epf-rework-v1-1-6134e6c1d491@linaro.org>
References: <20240314-pci-epf-rework-v1-0-6134e6c1d491@linaro.org>
In-Reply-To: <20240314-pci-epf-rework-v1-0-6134e6c1d491@linaro.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Jingoo Han <jingoohan1@gmail.com>, 
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mhi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1341;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=JRZLwKxhEM0x8HfB67G9+Fzppqg8xFqlyA8aRxI9XHM=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl8xaOLrQOPVb1HVr/175Bwj4SLK9E64perYmGL
 IBSuWUMVHGJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZfMWjgAKCRBVnxHm/pHO
 9ROLCACSxVDvqf0sTonqAB4efCgXpbE8NA//bIFdXLvO2DxsLrdraqYdwvMEiH+CAtxrSHwW3cE
 FCGe61CdFCnn3hhtoh05WnTStcOoxu7X2p8Lah7zUn7BBg7dScjvASClkPt0iqwsQjNhi0LmwHW
 xSofd+6XrLFHrATDGnodX1uVN2PcZZSXJdHw5oINOdggFxeHD1m9exuzvl6s5gY5SJ3lgg4q8Nw
 SZ86dARIy67pxK4Tkui+6vLp8YpJuby4gtksND4QVksT3VGTatVl30dDQE+e86Ntl1YgSKaJost
 K6XAXGDFLhZf0jQo8+mwwqh3P5s4NtOxeKumlgu2yg6kSQ4B
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

All EP specific resources are enabled during PERST# deassert. As a counter
operation, all resources should be disabled during PERST# assert. There is
no point in skipping that if the link was not enabled.

This will also result in enablement of the resources twice if PERST# got
deasserted again. So remove the check from qcom_pcie_perst_assert() and
disable all the resources unconditionally.

Fixes: f55fee56a631 ("PCI: qcom-ep: Add Qualcomm PCIe Endpoint controller driver")
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

