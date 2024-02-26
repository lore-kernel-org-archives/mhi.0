Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063B938DF9
	for <mhi@lists.linux.dev>; Mon, 26 Feb 2024 11:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708947477; cv=none; b=PpY5V7Uua/wC+KXdws5OWdSUDC+gyZpYJWvxqqIMJkpHuXyTTLwe8vUeD0Sj57T2Wl5QsxmtkVrbIP9YIzSgHq8xq1Dn5NtRhtk7WVe6Xd/4V/epsPel2T75w2Fy5oGfvmZ+FNchJuGrtGSUPJwrzshggt6lKNFW4OpiLMELRsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708947477; c=relaxed/simple;
	bh=WcbOX7Mto0c1BGHRXqQ6U7dCJ8afc+aUAohuOTqaRuY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wuyx7hksg9gZDRFMn931cGA9WdMJ39n8CpePmBTghg5SlxO9hfc2mkyi6Kk8EnnehK49VsbzXunP0KXtfo4XVDtYgahUbY2EDjq4f4DYZFEy3kxEZChD4fUiKcgaOZ/vV2Xw4NpUDn9i46VpjlF69KyyR2Ed3qMD1gMXNY7nV/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uU26dpZa; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uU26dpZa"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-42e7f6e957cso5155061cf.1
        for <mhi@lists.linux.dev>; Mon, 26 Feb 2024 03:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708947474; x=1709552274; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EYL0y9tWhN7SH+jeAOGY/jbLEk1NIed7kqGutW5jR3I=;
        b=uU26dpZahrBOGbLA0IKpVE8FarOrAHlR2KNR2NBoLdvjTB2IOXE5zw/1CO+gVtEwZJ
         2T6eyUZoPwqH/hB0ZiIqd22j4A2t3RXzIeYaoxGtJJIBNHqCIa/XieAGc/UQksOVGF2P
         HtKUJeeHCP60FIIgzSOdi6sNJOxtuQNX9c0rUy21wG6mtlBfwrLi4Pief7tp0qthmglQ
         fcVOx8gt/E0O+OJ4Q1q/2uSZ0iVL5tkDOtwjv3ODLcDRsyOHpZA0j6lnIe0JbRrokTsw
         rMNIUsBKhasBy2Zb0MII3KjEepCpnprObniuMBgknccSZJbG60eNUXGDmv5HkKURozRn
         qrJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708947474; x=1709552274;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EYL0y9tWhN7SH+jeAOGY/jbLEk1NIed7kqGutW5jR3I=;
        b=SbMeY7HFVT4ddHMagY1FwZVGO5thOsVjVY6ZFNEPNBaerdUwokUjnCRBNwhiwG7w21
         sxqpUvowty/FTLTfDJgW8GUeevrjaWhVko68WR6b9/KGlIuPF/+K2G4gn91CyH+ThcEx
         jDM0d+ZR2VLwrUYmRpvadIT4rlSOF2PpQUvlr/jPDyzenEbc25O9zYl61ekVdpaYU1Mz
         FjO4+c1Tolf12p+N+PbjQlQZA90CPcQpVyKFzokyV16qeTEMrEDtg4nee534B8MsZtP0
         3G2Sk9oozF+rBeQOKd6FA3isM2zjglkuO1n8mhvs8hlBiMXx5KuwlhWx2wUU3jyNGNcC
         kw6w==
X-Forwarded-Encrypted: i=1; AJvYcCX4De39ngVh3wEmhdKHbjdrP8LKV3yPhpMisYq9Dc/ufA00VAwp6WZr9XwZvkK/OdZqWNQ72mg+H9GRFm1t2TI4zeJL
X-Gm-Message-State: AOJu0YxSyke5zmbEJu3ImjsKh9BjBM6PGotgn7PlK3l7OaZF+gCmqB3Z
	tgPqS+zKLuMzl4QES326dWwxDP1dHVzSfPxHuNdomjG5pyWxJdw4O3P8PfXbcg==
X-Google-Smtp-Source: AGHT+IHuWpaOENwwArEM6m/vdlMMGgNpfJ/kNDP4tXZvfsnC4dwJbFir7UIomSl1kHxj0YReiFgf8w==
X-Received: by 2002:ac8:5701:0:b0:42e:7f29:9efc with SMTP id 1-20020ac85701000000b0042e7f299efcmr4475781qtw.39.1708947474011;
        Mon, 26 Feb 2024 03:37:54 -0800 (PST)
Received: from [127.0.1.1] ([117.202.184.81])
        by smtp.gmail.com with ESMTPSA id q15-20020a05620a0c8f00b007878babb96asm2341842qki.94.2024.02.26.03.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 03:37:53 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Mon, 26 Feb 2024 17:07:26 +0530
Subject: [PATCH v3 1/5] PCI: dwc: Refactor dw_pcie_edma_find_chip() API
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-dw-hdma-v3-1-cfcb8171fc24@linaro.org>
References: <20240226-dw-hdma-v3-0-cfcb8171fc24@linaro.org>
In-Reply-To: <20240226-dw-hdma-v3-0-cfcb8171fc24@linaro.org>
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
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2890;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=WcbOX7Mto0c1BGHRXqQ6U7dCJ8afc+aUAohuOTqaRuY=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl3HgFyYup7jym/LtqWaupNXR74OV2VbzwWJrkH
 tEM6mBeAL6JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZdx4BQAKCRBVnxHm/pHO
 9R86B/958Cp/+Pz70HZ9LC1l9vbXmsJZ5PmimkFurM1/Bd9WLaQ9SIK6kpmWAQhnckUZySHX48C
 X75w//3ffLd1MeUhpOQNERUXyl7+SEj5Ugydpun2zp+9PMxYWxZ2gpUWII4d/O5oR1WqER5qMNi
 SOQ6VUSBgJ+L7cGr89i4H/vrQoPASGw1lWTYRZ10BMeyOWoSyqelXUFGCBt122rc3UiueeGKH7R
 kjA16aYf4z8vZedV2pfzr/cu6+AW4qb8qiP9bNDSbeDlMZbp3jqTGKHTpIIt/fdigwip67GrNkC
 nADoNQAZQPsD3mfgstgk1VLFQXjZch0KhwolrHK8kfTgkmi0
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

In order to add support for Hyper DMA (HDMA), let's refactor the existing
dw_pcie_edma_find_chip() API by moving the common code to separate
functions.

No functional change.

Suggested-by: Serge Semin <fancer.lancer@gmail.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-designware.c | 52 +++++++++++++++++++++-------
 1 file changed, 39 insertions(+), 13 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
index 250cf7f40b85..193fcd86cf93 100644
--- a/drivers/pci/controller/dwc/pcie-designware.c
+++ b/drivers/pci/controller/dwc/pcie-designware.c
@@ -880,7 +880,17 @@ static struct dw_edma_plat_ops dw_pcie_edma_ops = {
 	.irq_vector = dw_pcie_edma_irq_vector,
 };
 
-static int dw_pcie_edma_find_chip(struct dw_pcie *pci)
+static void dw_pcie_edma_init_data(struct dw_pcie *pci)
+{
+	pci->edma.dev = pci->dev;
+
+	if (!pci->edma.ops)
+		pci->edma.ops = &dw_pcie_edma_ops;
+
+	pci->edma.flags |= DW_EDMA_CHIP_LOCAL;
+}
+
+static int dw_pcie_edma_find_mf(struct dw_pcie *pci)
 {
 	u32 val;
 
@@ -900,24 +910,27 @@ static int dw_pcie_edma_find_chip(struct dw_pcie *pci)
 	else
 		val = dw_pcie_readl_dbi(pci, PCIE_DMA_VIEWPORT_BASE + PCIE_DMA_CTRL);
 
-	if (val == 0xFFFFFFFF && pci->edma.reg_base) {
-		pci->edma.mf = EDMA_MF_EDMA_UNROLL;
-
-		val = dw_pcie_readl_dma(pci, PCIE_DMA_CTRL);
-	} else if (val != 0xFFFFFFFF) {
-		pci->edma.mf = EDMA_MF_EDMA_LEGACY;
+	/* Set default mapping format here and update it below if needed */
+	pci->edma.mf = EDMA_MF_EDMA_LEGACY;
 
+	if (val == 0xFFFFFFFF && pci->edma.reg_base)
+		pci->edma.mf = EDMA_MF_EDMA_UNROLL;
+	else if (val != 0xFFFFFFFF)
 		pci->edma.reg_base = pci->dbi_base + PCIE_DMA_VIEWPORT_BASE;
-	} else {
+	else
 		return -ENODEV;
-	}
 
-	pci->edma.dev = pci->dev;
+	return 0;
+}
 
-	if (!pci->edma.ops)
-		pci->edma.ops = &dw_pcie_edma_ops;
+static int dw_pcie_edma_find_channels(struct dw_pcie *pci)
+{
+	u32 val;
 
-	pci->edma.flags |= DW_EDMA_CHIP_LOCAL;
+	if (pci->edma.mf == EDMA_MF_EDMA_LEGACY)
+		val = dw_pcie_readl_dbi(pci, PCIE_DMA_VIEWPORT_BASE + PCIE_DMA_CTRL);
+	else
+		val = dw_pcie_readl_dma(pci, PCIE_DMA_CTRL);
 
 	pci->edma.ll_wr_cnt = FIELD_GET(PCIE_DMA_NUM_WR_CHAN, val);
 	pci->edma.ll_rd_cnt = FIELD_GET(PCIE_DMA_NUM_RD_CHAN, val);
@@ -930,6 +943,19 @@ static int dw_pcie_edma_find_chip(struct dw_pcie *pci)
 	return 0;
 }
 
+static int dw_pcie_edma_find_chip(struct dw_pcie *pci)
+{
+	int ret;
+
+	dw_pcie_edma_init_data(pci);
+
+	ret = dw_pcie_edma_find_mf(pci);
+	if (ret)
+		return ret;
+
+	return dw_pcie_edma_find_channels(pci);
+}
+
 static int dw_pcie_edma_irq_verify(struct dw_pcie *pci)
 {
 	struct platform_device *pdev = to_platform_device(pci->dev);

-- 
2.25.1

