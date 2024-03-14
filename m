Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2159674C17
	for <mhi@lists.linux.dev>; Thu, 14 Mar 2024 15:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710429894; cv=none; b=VAroZE/GK/4HkY2dZF4fW31ToZ9SXJi02ICjSDnspy1jWjimF8/IXDJZV39X3PhCtrDaXtWWBI3yc5kImZFyeGD9htMaOpo+bIPH9GmNXSUjQfz8Ki89O7V0J8tJFrPP1Caf8GomzEtpCvUCDHLEMDyhvPWS9BAE6cA6ztBKusM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710429894; c=relaxed/simple;
	bh=hHeQESdb2n2JfoPbQGhczuNq7aes0p4VCwzYiQEpxZY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oSb1Fpd4kHn5Dra7xfBE0lSKAUEMU/C5n7fyP1QuybPzcxTJ2JRMY+uXlfHL0MxpA45O+zTdg1cMxgPi8UYJqZfvIY8CWJqvYnIDLTjxM5eU6Bo5DjOlErocEG3Br1y8Shk3tdFMSh3sRaNIQG3WqUeuau2XJPhhw6rcz05qlTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KNusbqV5; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KNusbqV5"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-21eea6aab5eso670622fac.0
        for <mhi@lists.linux.dev>; Thu, 14 Mar 2024 08:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710429891; x=1711034691; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eAPCqDad3eib+irwWdn4c3jB6WrUBpvIqANM1/Xo8ds=;
        b=KNusbqV5fobOpP2jXe3C0X59ubxreJaNzfxjszDQSDyVPkLt2DgNb+bEvmq99mgAbL
         fWsAXbT892h/m3CIMBP0hklYjihGBBtxiFrJOh731QekECwfzjtS9Tj+btOsCfwHWCyz
         7o4hmrTtMmUxlxVPN7gsAhMcbTPZXVWB8fmuIBhAZ6iCogejujT10G+XfyVIZzSn/vn2
         42IwY8A6CEACr8+IKUKqLAzRwKle1fT9UoqnExjO71zImwrikZ4P8RjnGJUFNONHZ9Dy
         7zDpEnEyOvsYvDDBscwp/8O3C01QLzGQpMz10kbqRA6PFO/sG/XuhobSDknZBiBUC2KT
         vqAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710429891; x=1711034691;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eAPCqDad3eib+irwWdn4c3jB6WrUBpvIqANM1/Xo8ds=;
        b=Q7eQojSJ3RxmGAx2EZJgtnXU13KT81XBO3bhWxxZYzMexuNGP6mo2fl+rueEhKFF/8
         4FU+y/t1iFmGev5CeAkxKrBSCcNcKLl1EzqMO6n/j7zIaCtmyiVVIzctJw9R0fv5gpbP
         o0TA0JyQ2M7kgMu5VCBpusLYerHMo0DygFHKIN2+NFy0nbkaxUrRB7lYLd8wKIcNZgru
         9EpPc+uqn6PtrkcJmDIAcpPQ/BR96Bld4NFPJOU1rWRj4AMxuShVDB4SrjfX8hwzvnOS
         Z6kvXCsyNUJ4y3zSp7v51/xs71BEypXUlmwGfnYog9tH6xD5tLIuTmdomj3ZXVXoXliz
         tZiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTZxBBjKa3otECTLgb+CzLIgbupXYeS5qsS6a+AJwFyttWW6ZVJ9gcPkRhCO24YNxgvEmdw3bOOMiLE3/p0q6uibaE
X-Gm-Message-State: AOJu0Yx4a1jimLilWJB9xsdmv0C6HZU6/qqJjlw8E6FFul0xkwxomHXd
	yTOOqsjVoGEOBPRAlyF2QdqQOquPB/sXvmfQoJ4LT4VBshnxpG4cazk4VAOizQ==
X-Google-Smtp-Source: AGHT+IE64oFvYSc5N18qT9eho49uPQW+36wypqNmg2HTtOjDLk47z73mf9gPacmb4/W/bBMA5EydJQ==
X-Received: by 2002:a05:6870:64a5:b0:21f:d173:4f19 with SMTP id cz37-20020a05687064a500b0021fd1734f19mr2087318oab.40.1710429891056;
        Thu, 14 Mar 2024 08:24:51 -0700 (PDT)
Received: from [127.0.1.1] ([117.207.30.211])
        by smtp.gmail.com with ESMTPSA id m4-20020a63ed44000000b005e438ea2a5asm824021pgk.53.2024.03.14.08.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 08:24:50 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Thu, 14 Mar 2024 20:53:49 +0530
Subject: [PATCH 10/11] PCI: qcom-ep: Rework {start/stop}_link() callbacks
 implementation
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240314-pci-epf-rework-v1-10-6134e6c1d491@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2908;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=hHeQESdb2n2JfoPbQGhczuNq7aes0p4VCwzYiQEpxZY=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl8xaQfg97viBuOIgmUL62KebaBZQIQNgdeCdUj
 aCgxk36waWJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZfMWkAAKCRBVnxHm/pHO
 9dH/B/93GdKJANpOSa22x4XiYazPXmYMSF7FXM0F0/rb0MhOjtc62toq2EEl6mi3yPtj3T/Gz5j
 ea1MwxgLD8daifKkQZmj1ZyR6luJ4Xar+fQFq3jcSvB+S2TDdgPmHA/dMtCYUBnO415ZZlEgxyi
 kn5bs1s2wkckx37TU65QJHX+Hffu/kuodZSw+zYUvnLwSEfkbw4xXUjuySbTnVVoR1pa6TuQT4M
 eLFMtcYj4maR+1bcv7bSGm9KXeJWHl3j7igzlknj4moBwRwE4UBQlVAxbhSIlsh9ObXdfhE12c0
 tZAkWrM06kPRlEbBYazKyTQ6wbkB+Vfid8ikgvuzgVrcUsdR
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

DWC specific start_link() and stop_link() callbacks are supposed to start
and stop the link training of the PCIe bus. But the current implementation
of this driver enables/disables the PERST# IRQ.

Even though this is not causing any issues, this creates inconsistency
among the controller drivers. So for the sake of consistency, let's just
start/stop the link training in these callbacks.

Also, PERST# IRQ is now enabled from the start itself, thus allowing the
controller driver to initialize the registers when PERST# gets deasserted
without waiting for the user intervention though configfs.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom-ep.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index 811f250e967a..653e4ace0a07 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -122,6 +122,9 @@
 /* PARF_CFG_BITS register fields */
 #define PARF_CFG_BITS_REQ_EXIT_L1SS_MSI_LTR_EN	BIT(1)
 
+/* PARF_LTSSM register fields */
+#define LTSSM_EN				BIT(8)
+
 /* ELBI registers */
 #define ELBI_SYS_STTS				0x08
 #define ELBI_CS2_ENABLE				0xa4
@@ -250,8 +253,12 @@ static int qcom_pcie_dw_link_up(struct dw_pcie *pci)
 static int qcom_pcie_dw_start_link(struct dw_pcie *pci)
 {
 	struct qcom_pcie_ep *pcie_ep = to_pcie_ep(pci);
+	u32 val;
 
-	enable_irq(pcie_ep->perst_irq);
+	/* Enable LTSSM */
+	val = readl_relaxed(pcie_ep->parf + PARF_LTSSM);
+	val |= LTSSM_EN;
+	writel_relaxed(val, pcie_ep->parf + PARF_LTSSM);
 
 	return 0;
 }
@@ -259,8 +266,12 @@ static int qcom_pcie_dw_start_link(struct dw_pcie *pci)
 static void qcom_pcie_dw_stop_link(struct dw_pcie *pci)
 {
 	struct qcom_pcie_ep *pcie_ep = to_pcie_ep(pci);
+	u32 val;
 
-	disable_irq(pcie_ep->perst_irq);
+	/* Disable LTSSM */
+	val = readl_relaxed(pcie_ep->parf + PARF_LTSSM);
+	val &= ~LTSSM_EN;
+	writel_relaxed(val, pcie_ep->parf + PARF_LTSSM);
 }
 
 static void qcom_pcie_dw_write_dbi2(struct dw_pcie *pci, void __iomem *base,
@@ -484,11 +495,6 @@ static int qcom_pcie_perst_deassert(struct dw_pcie *pci)
 
 	dw_pcie_ep_init_notify(&pcie_ep->pci.ep);
 
-	/* Enable LTSSM */
-	val = readl_relaxed(pcie_ep->parf + PARF_LTSSM);
-	val |= BIT(8);
-	writel_relaxed(val, pcie_ep->parf + PARF_LTSSM);
-
 	return 0;
 
 err_disable_resources:
@@ -707,7 +713,6 @@ static int qcom_pcie_ep_enable_irq_resources(struct platform_device *pdev,
 	}
 
 	pcie_ep->perst_irq = gpiod_to_irq(pcie_ep->reset);
-	irq_set_status_flags(pcie_ep->perst_irq, IRQ_NOAUTOEN);
 	ret = devm_request_threaded_irq(&pdev->dev, pcie_ep->perst_irq, NULL,
 					qcom_pcie_ep_perst_irq_thread,
 					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,

-- 
2.25.1

