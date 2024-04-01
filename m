Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615075472A
	for <mhi@lists.linux.dev>; Mon,  1 Apr 2024 15:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711986686; cv=none; b=tZXZrkKNkWHS7Q1j2rLk7rtCQaShAKh2TK9WXUYHzKe6wyzIVTBmmWcvtMeuBJYt4UZ9WEySF80yoXr35luoM+5oG/mDSgp+P8Wa3ehVT/bSAL2nwDUNnad+KNH/iW/s9IkJX2TBRfc/u1q6rysMdI/dQPVvpFLZcTkRTmYkUxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711986686; c=relaxed/simple;
	bh=8yY6jCOZX7OXEAdw+SEiYpcVr/6cp2rpK2Wx/LrayPc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fL9tXDzZpyATLM8nDC38NbUz4QOmUO6iPlxjqY1SlRDt86ij7onGoEkJ2lsriqCdkZCZbtR2d0fha21FH4j4lkLHZv4fG2WeLxZSIOLNidoZ+TZzFm5IOOs7ZELJUpstPQbsHwWf1KcpHAvcWH6QKKLeTVXbWyig3qTkJirBHDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bFzz7BPi; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bFzz7BPi"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1e00d1e13acso26841415ad.0
        for <mhi@lists.linux.dev>; Mon, 01 Apr 2024 08:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711986684; x=1712591484; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3jszqw6C2qSlbopOLyelwWx4NbFpqH3DEAKuVgxD1es=;
        b=bFzz7BPicnsIw4aTlvIDbUB8cmr6HgzqcnNRWTULcR7M4uKdTUbrK5TJL1tskgCc9l
         pSfvjpFUe3KsXpzXH4vxXuDqXkEXg5hBOjG3WlPwkuhtBvwVNdmmUbBiJmRQYXj0Bdcy
         uEnV5lStwjNmGxtRfvZkrXWxK0TXZ/ujXOfGDi8V3eZFDQLakbzqusDWhL9E6f4xRmvI
         lmouMSg73t45qj5jdCGCQLRW9/zBmTfBoqNy6GByhTG/SqtGvd/7n8ooR1hXu0X2vCYQ
         /H/PvbbPJzXaN/JaVUR0lyyOCc0kbhD7TZRGHtwFU9eWmaSfkAvZRVN9TrFJaEkOz9I2
         2E1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711986684; x=1712591484;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3jszqw6C2qSlbopOLyelwWx4NbFpqH3DEAKuVgxD1es=;
        b=AxtzYnyasywDpzY5mcTxfrC1cIcgw/Y8hoMmMNxqpgeOuPK85k4g+TOGgqh5cxifay
         +S+/UndC9/Xi+6jmQo39xEy+kPeEP0YUsboYEOfCsVyya/M9zKDtVlvPv9MR0fAa4oG7
         qGsBYAKqGR7ceKbu7ZsaCEs6VQK8Oq+bH8NYJdkfjFFI2zPn/6iFKsVODuy5TRymwxAv
         TmX9Dr6AnCYY3jGtcSWVYK7yadU69XfXLNSrnRc7z+PZUDtInGz0L6VDbEBRPrMvEd+7
         UBvhxeUAL+bvoE+RjeTk4JWFwGuYOL1hBFoyZXiIfoKL4OT723URua+OgWAoFvSHs4xu
         1oUw==
X-Forwarded-Encrypted: i=1; AJvYcCUlQstKqgM27ypXoCShZzAS48nUTJrorzgjcAn30hMrC574gfkhLEngmjKsSg01xfk/KZAZ7NwmTllQaOiyzrKnTASx
X-Gm-Message-State: AOJu0YxQa4Ss5Ze8S22fADcEya0Gf1sVoQT5/Z9vIgIu9yS7WW9LYk+A
	Jrw6tm/ZUcjwR1+jGoUj7y6xip1rwGc7c34towsAKo6RxU5xWo9W4Sj69Uq7xQ==
X-Google-Smtp-Source: AGHT+IHULv2dcA00LFbG4IUgT0rHHhvPKHKi4w6PpAp6Nyjs1Q6Qxfsn8NeioUr4m216ngvIirDE6g==
X-Received: by 2002:a17:902:d492:b0:1e0:e2a4:1b1b with SMTP id c18-20020a170902d49200b001e0e2a41b1bmr11748880plg.0.1711986683577;
        Mon, 01 Apr 2024 08:51:23 -0700 (PDT)
Received: from [127.0.1.1] ([103.28.246.102])
        by smtp.gmail.com with ESMTPSA id kh6-20020a170903064600b001e21957fecdsm8949076plb.246.2024.04.01.08.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Apr 2024 08:51:23 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Mon, 01 Apr 2024 21:20:34 +0530
Subject: [PATCH v2 08/10] PCI: qcom-ep: Use the generic
 dw_pcie_ep_linkdown() API to handle Link Down event
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240401-pci-epf-rework-v2-8-970dbe90b99d@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1139;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=8yY6jCOZX7OXEAdw+SEiYpcVr/6cp2rpK2Wx/LrayPc=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBmCtfV6J8VpiGQ+aH7wa+/NlTond9MlF7bJLsXm
 d9oE/+P1emJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZgrX1QAKCRBVnxHm/pHO
 9c18B/4wB2b/Olqnabq+LzKAm23UYq0JFUhH2Qhade00RQj3OTcedNVpMx4UL8xMRS+4B8p/SeS
 xCYORBSL4g0whqjretPvkDWShAqvZozuSdlJg9HALExtjrSPRUVwFUPkCU3ckGOSOq3GFDnlxtE
 OCufJkeUAdH61kw1HG3N68f76R73Hx1TxiHD4fdou4clcoUE2UyGcwWNUpepCV1jAoIX9U3/mC7
 0hghQdaBJfpjKBPI3paNexfLsN3OULjAQJ0VqOHVAoQzy2wrFDLsB3EJEBMMmp0ISggPfiVM53P
 P5aYybqqH9z/OHedlriYtvH64hEBIsX+WdwDpbiKUMkUCnl/
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

