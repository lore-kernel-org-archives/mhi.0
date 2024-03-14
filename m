Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6D8757E8
	for <mhi@lists.linux.dev>; Thu, 14 Mar 2024 15:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710429898; cv=none; b=uenamw1zJHv0iBSjoIk+WvGRXDyXpTMUMGByJsxx6Fj/OngKAie0qSI1mzRDffeToi6Xxej7GpGo/mVJinIoYmSc2LlZF7sAZzy9Azb+9nHFHDSuZ7mKbE1YbE1Bf22J6wRx0VgFqWCId76NgGyTP32Z2/6oslefmskgd/arGo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710429898; c=relaxed/simple;
	bh=vvIRN7ZBKQkTFnoIHX/YU42aYhGdx8c3NJ1/9vK0fxY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HV4tuwsDM7IqQV2hnyINUAIQWEUyi+4fOCZY6/lE4pMOw0yIvFfE0fJUJ5onz3Sx/H125QHY/CM6ZwteiA2nUbWPNYj23QuQuLe65Af2mdG8QcYMgg6dEF1dG6VV8vcnkScMHbMNLbLG62SFtOrZEX/XmuqhiWKhjfS+Sdx09PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=STHRtIXG; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="STHRtIXG"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6e6b729669bso1253696b3a.3
        for <mhi@lists.linux.dev>; Thu, 14 Mar 2024 08:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710429896; x=1711034696; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MmIxA+VBny71iA9Jy1KHGto+GTLx5DDrGCoZw8mb/UA=;
        b=STHRtIXG7fONid7LxEDsyABnFfSe01umt+jCMARQDLuRtQ0Pk6Z8OEhgSaXYllvi4b
         z7bnVqS1rs0EiSznipE+Cd2gwPJVf5UWGZaFJlljZe056Uoy2hanYCsu6mQAzG1cDpvd
         Nkew4G6xvCLllelKN5QZveXjq75b6Jwu4qJ68G8OynpuVOw4Rml/2ZzA6+EZFjzZR+4Q
         w/c/7rXH9vkMWezDY+WveD271eGFpIj1qFhl3U9wongHI6tdoGKot6dVK2GB1fSQPueq
         aWbxQzEy/jKqITP3WJ1erCG7FYga99OUWeZA3E8IDdWbWYtRR5dri89yD1U+UsvPResN
         z7YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710429896; x=1711034696;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MmIxA+VBny71iA9Jy1KHGto+GTLx5DDrGCoZw8mb/UA=;
        b=niqPYSq0hwBh8BcTFynfaKHZnAP4KJGctpp0Oqv79Z8isNBahufpP1VBOlvQSW3Iv1
         dgwRmj9eGap5esnxPjaYLSFDzmKGQMhVT0x92x2MhcRXrjoZ2YcIUkmDZNLRN9IzZFyI
         kG7r1zlfnr1vlYgxVUi1ZGMcjuuaS4E84+wCwFtVOuSCug6WTkjeVQAlCOXncwDgBIuH
         30jBPbRsj8zHZm4JYAuQNwJIKqjT6gScOXNQTDj5yLi7nsi3AY5LM4LN0/kM2kNpkmpf
         Qiv5e3Y+jAssZeJqILfLIEczMgNLYq1++RhNQ+COcAUroP5bGglujCD/uF2H+cOJmLT5
         0xGg==
X-Forwarded-Encrypted: i=1; AJvYcCVgIdTZqNV4lKhAzorrKc3X5bCUQFQQh2tCNkvWdYDnRvWXFySKKBAeq7raiM3iSQn/N28OLUozkJp/B3TjUeecf74E
X-Gm-Message-State: AOJu0YxosM7vt92qDM4QwNKHBMBBRcTjqB3KreQzFCsIRO3Y+ykiE4sN
	vLxPiCs71D/II7cTb5n/KEZNndNgLDLkCjrx+U9q1OCrmJDMsu4b1apRPUUk2A==
X-Google-Smtp-Source: AGHT+IG2peiit6xwcjpcw9vql2fJguzg+I2xNUy/9EetKehF958tqEIaolzuG1KSOVbZPjbZAJd13g==
X-Received: by 2002:a05:6a20:2d2b:b0:1a3:3ab7:d736 with SMTP id g43-20020a056a202d2b00b001a33ab7d736mr2249535pzl.43.1710429895604;
        Thu, 14 Mar 2024 08:24:55 -0700 (PDT)
Received: from [127.0.1.1] ([117.207.30.211])
        by smtp.gmail.com with ESMTPSA id m4-20020a63ed44000000b005e438ea2a5asm824021pgk.53.2024.03.14.08.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 08:24:55 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Thu, 14 Mar 2024 20:53:50 +0530
Subject: [PATCH 11/11] PCI: tegra194: Rework {start/stop}_link() callbacks
 implementation
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240314-pci-epf-rework-v1-11-6134e6c1d491@linaro.org>
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
 Vidya Sagar <vidyas@nvidia.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2999;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=vvIRN7ZBKQkTFnoIHX/YU42aYhGdx8c3NJ1/9vK0fxY=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl8xaQGEjDj7V9nOkxQFG9KkzYhi7NMZ5fNY+WX
 /IyNnSDeqKJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZfMWkAAKCRBVnxHm/pHO
 9SzzB/0arBeoE0MTmN+C/QkksG5pbqe/k/wuAGkk2EO/pFuNZ20j163lecjuj4DJmfj5tmd3nQ1
 sAaCxZ9VlIvHRrPnsmX/3tFhHtVqyxOKzTOuhfn5I81q5drJ/txgjtjvFbhRwQINFlCTKg/5/wU
 HyMA4ky1/DL4Qm9TiHqzEXMp5dgKj0vDTJ/mu1zOoZKcyyQl7eXfFxkLrS6tc1RzIk/k+bFJBdl
 S9R94h+EwTv/Ug+F3LeXIqmMfV2zi0wTgZiGX6RfxVWHy9E5V+uiRUk87DcZwAfnti60B6mP36m
 LGER5WQ8R6URgGjyDvuAN+Txnfrra4uwGHRL0AKboqnPQ40S
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

DWC specific start_link() and stop_link() callbacks are supposed to start
and stop the link training of the PCIe bus. But the current endpoint
implementation of this driver enables/disables the PERST# IRQ.

Even though this is not causing any issues, this creates inconsistency
among the EP controller drivers. So for the sake of consistency, let's just
start/stop the link training in these callbacks.

Also, PERST# IRQ is now enabled from the start itself, thus allowing the
controller driver to initialize the registers when PERST# gets deasserted
without waiting for the user intervention though configfs.

Cc: Vidya Sagar <vidyas@nvidia.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-tegra194.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
index 3e6e08b321fb..03d6f248bc6f 100644
--- a/drivers/pci/controller/dwc/pcie-tegra194.c
+++ b/drivers/pci/controller/dwc/pcie-tegra194.c
@@ -964,7 +964,11 @@ static int tegra_pcie_dw_start_link(struct dw_pcie *pci)
 	bool retry = true;
 
 	if (pcie->of_data->mode == DW_PCIE_EP_TYPE) {
-		enable_irq(pcie->pex_rst_irq);
+		/* Enable LTSSM */
+		val = appl_readl(pcie, APPL_CTRL);
+		val |= APPL_CTRL_LTSSM_EN;
+		appl_writel(pcie, val, APPL_CTRL);
+
 		return 0;
 	}
 
@@ -1049,8 +1053,12 @@ static int tegra_pcie_dw_link_up(struct dw_pcie *pci)
 static void tegra_pcie_dw_stop_link(struct dw_pcie *pci)
 {
 	struct tegra_pcie_dw *pcie = to_tegra_pcie(pci);
+	u32 val;
 
-	disable_irq(pcie->pex_rst_irq);
+	/* Disable LTSSM */
+	val = appl_readl(pcie, APPL_CTRL);
+	val &= ~APPL_CTRL_LTSSM_EN;
+	appl_writel(pcie, val, APPL_CTRL);
 }
 
 static const struct dw_pcie_ops tegra_dw_pcie_ops = {
@@ -1702,11 +1710,6 @@ static void pex_ep_event_pex_rst_assert(struct tegra_pcie_dw *pcie)
 	if (pcie->ep_state == EP_STATE_DISABLED)
 		return;
 
-	/* Disable LTSSM */
-	val = appl_readl(pcie, APPL_CTRL);
-	val &= ~APPL_CTRL_LTSSM_EN;
-	appl_writel(pcie, val, APPL_CTRL);
-
 	ret = readl_poll_timeout(pcie->appl_base + APPL_DEBUG, val,
 				 ((val & APPL_DEBUG_LTSSM_STATE_MASK) >>
 				 APPL_DEBUG_LTSSM_STATE_SHIFT) ==
@@ -1913,11 +1916,6 @@ static void pex_ep_event_pex_rst_deassert(struct tegra_pcie_dw *pcie)
 		appl_writel(pcie, val, APPL_LTR_MSG_2);
 	}
 
-	/* Enable LTSSM */
-	val = appl_readl(pcie, APPL_CTRL);
-	val |= APPL_CTRL_LTSSM_EN;
-	appl_writel(pcie, val, APPL_CTRL);
-
 	pcie->ep_state = EP_STATE_ENABLED;
 	dev_dbg(dev, "Initialization of endpoint is completed\n");
 
@@ -2060,8 +2058,6 @@ static int tegra_pcie_config_ep(struct tegra_pcie_dw *pcie,
 		return -ENOMEM;
 	}
 
-	irq_set_status_flags(pcie->pex_rst_irq, IRQ_NOAUTOEN);
-
 	pcie->ep_state = EP_STATE_DISABLED;
 
 	ret = devm_request_threaded_irq(dev, pcie->pex_rst_irq, NULL,

-- 
2.25.1

