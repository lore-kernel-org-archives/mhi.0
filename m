Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07CEC4CB55
	for <mhi@lists.linux.dev>; Mon, 26 Feb 2024 11:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708947489; cv=none; b=eVmuE9g7fDPJOqmeTlv53aPvP9D4OOZ5kuRcIuB5hiV5l6Sn+XB5fyOM+fnSYm56CBmSiM7att3lPXbn7Fni7lrSXib20VRG6KvGTv8ZRi9tY6BSuwIMQ5J+9dnWURDyPmCPolvZ8mmt4KsHrRIqaq69+QzX1XxnugCHFOViU9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708947489; c=relaxed/simple;
	bh=Wy7LJuC8h0Gs3GX5VCOt1uxpsY9Nepi+sgqSN6HRB18=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VviSEsnvimMAqS/qfOlhHRk0g7lT7eAOw+lgUMsL5PdOG3xvJtjqQNsV0A1wDVA2KMCoPNrZMLCM/PcAvVBD1TRmEn6MyghPY1lvkTVXhRVq3hiLRJ4CmWVOegI968jOH1ZsgadI1aDZCazD61JnjKT5ZvPiXL0CMtH4aBKk9Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pa6r8H4r; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pa6r8H4r"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-608cf2e08f9so20738427b3.0
        for <mhi@lists.linux.dev>; Mon, 26 Feb 2024 03:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708947486; x=1709552286; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4KNkTka0JljgsliYTECP2ewGRxvpOhNGNlugq+4lG+k=;
        b=pa6r8H4rLJCPBpWGV0bri84ht0fY3WXqqvsDttJHaLcwmbtevtXmnyCI0K0rStBGnU
         YIFaMSKV7SX5ChPs2I1Ut8HbeVtVi0YXkte6ahQQYCjFuw6ewOKShncugDo8+R/L09Te
         8sty+PJpm3FB/Avqrw4q1UnsV/uLZi5ZKVrMWSxmWz6Ec5NtZXiyEj0xKuYfDHihwgtS
         pJbbgMx/w+mPYMIBn1M7bvVqpiln9IWqp8O+XeLAYvorLTaIn9b0v23MQmpg6OB9c05P
         11D+ga9qv8Kkvsq0RHJiKKNYY0f/SiwS6rjn7YVX9W81ayJ59IIVZBMSbJFiPVQyg6dP
         KuKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708947486; x=1709552286;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4KNkTka0JljgsliYTECP2ewGRxvpOhNGNlugq+4lG+k=;
        b=lfHn/XxoNAuRVTuoSUaQGLnanHF3d5QiLxfPpqqUlrR+tLL1CHa9ya2f7QGjs+88p3
         JPkoCTNljQFXjq4d3uvzhUyl5qmZnA6mRr/l1qPp1L8WuuE47fVh2quGBI1HPjKjn2u9
         /5oMgTX+LHmrexYr8SdlKfFjkoPSWRuCHnTYB09+7ze181WJKIUSrl6Gt6BqFzbhgtyd
         FBH/MfdNTDOORSp1CRKJfCmvylOSWDN8hwlamsYWatI26VAfL7IbASAoAGJyRIYOoUha
         aPrdLGiC0uuPbiTmS8GDUDE2SuAqgQJ28END8GhBmrFrTAa6nkXOznqbHALdZGIWc7wP
         j+GA==
X-Forwarded-Encrypted: i=1; AJvYcCV3Z3OlyJttO1FUYp3zrhWGJ0OrbnAnGkJXuESfTb9k47S6zAAddqT/CCP74AXAw14XlPEK+IOcQIP3qC2Fkly+6iLn
X-Gm-Message-State: AOJu0YwIEGjisTzzo7w/Muk0CP91gAOq77oZNSg8F6B8cvia0wpX5Z5F
	+TBEGwugA3dsVWwr8hveKF6TnSofh8IbdivyksCmbYqknfdL466iR3JANIevjA==
X-Google-Smtp-Source: AGHT+IE/mGz3ZyjgFiK3TAv9t858cL7lgsk+HTGLU6NfD9LcJe1EXPU7mYQwsS9Im3n/GqJXakNHNw==
X-Received: by 2002:a81:4005:0:b0:608:d6d3:33fc with SMTP id l5-20020a814005000000b00608d6d333fcmr3975142ywn.34.1708947486073;
        Mon, 26 Feb 2024 03:38:06 -0800 (PST)
Received: from [127.0.1.1] ([117.202.184.81])
        by smtp.gmail.com with ESMTPSA id q15-20020a05620a0c8f00b007878babb96asm2341842qki.94.2024.02.26.03.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 03:38:05 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Mon, 26 Feb 2024 17:07:28 +0530
Subject: [PATCH v3 3/5] PCI: dwc: Pass the eDMA mapping format flag
 directly from glue drivers
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-dw-hdma-v3-3-cfcb8171fc24@linaro.org>
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
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Siddharth Vadapalli <s-vadapalli@ti.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3372;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=Wy7LJuC8h0Gs3GX5VCOt1uxpsY9Nepi+sgqSN6HRB18=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl3HgFbG62OQCkQ3VnNidmAAH0htQtC/tS8ex+O
 2uHD4sYRe6JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZdx4BQAKCRBVnxHm/pHO
 9S9CB/9MAYdgUSAUy/h0KZWWs19lAViTLux8j83QIpS/MERsfZXcfZQZ2sie4X4OgQttZjsEcMB
 P5NDfstxgjCk42dJuDOo2CcGMQ7lv1Kh8E4yX4+LufhRqXLlJUd6D+jSdcrmnvRfcxScvRkuQl5
 +OjGmE/s6+i+bj9dWW7TrMv9FVceabxGEQCTx1ntGvkdc7taVTzoG9U6xvVuT8NwrGX8PELSJM8
 h61+cg5x13hJe3Jp9TQrilsBuV/8HGm+OCI0orbl00Pz69HUF6vU73ikdJKISsluBi2hD2qDsCN
 fUWOIR7V0B+Ob2lxFgH5J7jNltgC6ZMa69CX7k84SFn1TgQ+
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

Instead of maintaining a separate capability for glue drivers that cannot
support auto detection of the eDMA mapping format, let's pass the mapping
format directly from them.

This will simplify the code and also allow adding HDMA support that also
doesn't support auto detection of mapping format.

Suggested-by: Serge Semin <fancer.lancer@gmail.com>
Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-designware.c | 16 +++++++++-------
 drivers/pci/controller/dwc/pcie-designware.h |  5 ++---
 drivers/pci/controller/dwc/pcie-rcar-gen4.c  |  2 +-
 3 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
index ce273c3c5421..3e90b9947a13 100644
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

