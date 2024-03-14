Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F1E74BED
	for <mhi@lists.linux.dev>; Thu, 14 Mar 2024 15:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710429884; cv=none; b=FLeaexwq3bcwLkuEmqhC6Ug76hT69sn401UsRhH28VTRMlw300y2QnMypVbUTKeaXXw2Lraz7c4UTPtvs9jdxbSCW5yq55AFixaLCbXGvgDJ9N1/+D8AoNMoGYUpPSfB1j+wBf1M+9nlBuQCFjSwO0mj5T98pNflZMv/FPriihE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710429884; c=relaxed/simple;
	bh=8yY6jCOZX7OXEAdw+SEiYpcVr/6cp2rpK2Wx/LrayPc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qDBnbB4amxpjr6taOji9dGBTfnRttUG0JXVVYS8X1zHGGh/z+JyIAysWOXZRcPBg8g4CjNoXFGyP+McPDdHtxjDxpuRfjg0EQDcBViQyHeXVQV788N6FVo1KDCOIiFveQqTZLnD4ZoR7+91U2Q32A0KldaszPuKvi9W4Iaun1S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YfYR4/jl; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YfYR4/jl"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6e6b5432439so1133359b3a.1
        for <mhi@lists.linux.dev>; Thu, 14 Mar 2024 08:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710429882; x=1711034682; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3jszqw6C2qSlbopOLyelwWx4NbFpqH3DEAKuVgxD1es=;
        b=YfYR4/jl7QhURCb6DQwAT3QZGURNEoB3iWiKDLWsG3noJHaxHvSbFaQpqsz27vrhUn
         TCWH1HqnNKvsdE6ePBWXb3dJmXMetF7AZcvrgs8TAKZ3lVN3b0v6h91ISqPxUk1CVHlL
         gkwtX6O4PpZ77S8Y9Cj3bzMKKhR46mjDFuNaKaqvMVuBMK/lcWJ9UKicnHKJyfiyWLd9
         PnFQ2SX45PpYFwzIXdunvCGFi8YJv2GC0wCjjwuNEybHiA4BkoKA2l7M4aC3rBsaouuO
         ITCvXS8kUgn0RChxMCdhBETM0ty/xPN7DZYkRYZZTZsm4v9TsOOvErDTTjylhl61eatj
         Ewyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710429882; x=1711034682;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3jszqw6C2qSlbopOLyelwWx4NbFpqH3DEAKuVgxD1es=;
        b=llJxr6KVJZFXctfUesqfOMDAn/f6qrTDeT7PZENI/jU3+R3nTOmcoB2gglGZB/TY1q
         PbI1b/HW9WNl+bi+k37H5cBOCz+AVF2DSULKGpFBjoVLAFIQeOiA+5yIVM8f54WFQe3c
         NoHvMOoppnaGzFXxRN2bW9y8AQNAl9Sr4UhxRc1oMOA7Uj8yUf6ybHlC9avOoOMBO1Zx
         n671zcwd9mXt1JJCC9O/ZbklFACbk62IynhQ76OhfQYhDCetb8M9zPTPjURTNGeB9I2u
         xBGP4H4jLShkO8sSBCVUe/J8A40lraojdPk8eUr73I7uuaKNcJ0k0brtrO6Hv45XPHWT
         LZrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNkuRCCNCEHOVVDYB9JWHXdNtQtW0Y/O+GYAroL53mrEhSA8zk+79lo4rJdLdGmDhsR/UdIOWzZQwa33/iNcqvmBrZ
X-Gm-Message-State: AOJu0Yy7ogz4F6AMAkWGA0/p4/0TAdJSCudN7M+Vx0H8SyfxDGg5quPm
	6cqyaNPGTz8JVM91MupG+44uehLsQ0mI505akm0wT1T4nLtNEBGJ69OLeU8ZKQ==
X-Google-Smtp-Source: AGHT+IFqt+sRuuR59l5UBgyhSralt2fMPJ++RVgtbXM6AaZBZz2N5SktxvMJHu8zPfBFuuvsgJOfJA==
X-Received: by 2002:a05:6a21:33a0:b0:1a1:7874:624b with SMTP id yy32-20020a056a2133a000b001a17874624bmr2551859pzb.44.1710429882287;
        Thu, 14 Mar 2024 08:24:42 -0700 (PDT)
Received: from [127.0.1.1] ([117.207.30.211])
        by smtp.gmail.com with ESMTPSA id m4-20020a63ed44000000b005e438ea2a5asm824021pgk.53.2024.03.14.08.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 08:24:41 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Thu, 14 Mar 2024 20:53:47 +0530
Subject: [PATCH 08/11] PCI: qcom-ep: Use the generic dw_pcie_ep_linkdown()
 API to handle Link Down event
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240314-pci-epf-rework-v1-8-6134e6c1d491@linaro.org>
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
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Niklas Cassel <cassel@kernel.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1139;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=8yY6jCOZX7OXEAdw+SEiYpcVr/6cp2rpK2Wx/LrayPc=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl8xaQCNKJOlWwe8RodKKLofvIgtsPM+QC0KzEr
 d5ct1FtCx+JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZfMWkAAKCRBVnxHm/pHO
 9eJ1B/9obhN4c98iqWSryFP+O4cuxzfB1o+fXJW4sZEpv8w0oh6h9Wf9PG+f1rjoJtqAuESwROF
 JSA5SrqUqJa29tP/aMMFO/R8e92mVb3R8sDDpTWfnjmD8ql5RTf0XU5P9+03DKLwLq/s6AOqOhl
 50CgS9WazeW+ndicHA4XRprAzzqJObaw7zhB4gQoiLXQ3ZWczj6SoGdiCWouISxXC7ATrCIlENb
 CLNOCyl3oo7LJRhPie1IQdMmZ2DuOngH/Xv3sgqn6t44aDMX8XuHW+YT8e8mlB0axBpuZzVZAXO
 7Fq33HYFqb/gn1/aD44BtactsmW0vQmNvJZ8pHKLcKgwkNzo
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

Now that the API is available, let's make use of it. It also handles the
reinitialization of DWC non-sticky registers in addition to sending the
notification to EPF drivers.

Reviewed-by: Niklas Cassel <cassel@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom-ep.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index e4b742355d57..811f250e967a 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -635,7 +635,7 @@ static irqreturn_t qcom_pcie_ep_global_irq_thread(int irq, void *data)
 	if (FIELD_GET(PARF_INT_ALL_LINK_DOWN, status)) {
 		dev_dbg(dev, "Received Linkdown event\n");
 		pcie_ep->link_status = QCOM_PCIE_EP_LINK_DOWN;
-		pci_epc_linkdown(pci->ep.epc);
+		dw_pcie_ep_linkdown(&pci->ep);
 	} else if (FIELD_GET(PARF_INT_ALL_BME, status)) {
 		dev_dbg(dev, "Received BME event. Link is enabled!\n");
 		pcie_ep->link_status = QCOM_PCIE_EP_LINK_ENABLED;

-- 
2.25.1

