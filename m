Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6B3161930
	for <mhi@lists.linux.dev>; Thu, 18 Apr 2024 11:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713441562; cv=none; b=NIETh1Yur621sJTlBIxo5mP9By5YlYPhvgUTkibKyfSmcfT3mWpgFPbIU3qbsb6EMn9wxkJaQXl7bhh1xUsAoDXfxTHlCghoduKoKbJ0kQ0ZNN71aV5GdksrB2UVa83EeNlSNf7xQexnDZOLNhqmClPWECDXvMx7tZ2CnRX2aaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713441562; c=relaxed/simple;
	bh=HPfONLtsy/MnvLDF1/hjLcYap8xzDzzAp+j/LvPJsHU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jMtskjQBim9V2wMP2NtmH/LrKxBcJnEfN7C7yaO7XUln++pGktGIfMdWg33wXXp/k+ryJb6OSxX4LoW4TdUB6rnkrf3PxwCgEpdd5+FVIFoqdz7hPzpZNQizsNbSfgmj3dHuCSd9w8csAdmavlK6rzk6EIBzG8V1qhKLHjr7h5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fY9H6tBL; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fY9H6tBL"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6ed11782727so734754b3a.1
        for <mhi@lists.linux.dev>; Thu, 18 Apr 2024 04:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713441559; x=1714046359; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cPzNHD9JI2uetjXO2Kh7vp5CIb8zYoijo0y8bQC99Ow=;
        b=fY9H6tBLphZ6IdlEYEt2zbD7jDTtVSet5IZTsQ0EVE8XtdgLhX/WpOanrcIthg3i14
         iF0NUMkQXVJVkc+udTzsbo4ud8DTJ57FkqkvXJiFYJMoSCLqv3Z8E+S/LODJOxG+7UUI
         f4KcSUg9n+LR6/9A8Dd+ehaMznFXyR8I2Dl5LS9JggPRlASQBygeML4m2YfV1uT4GyZD
         /Ku6EA0aFGo2BSbxKyl0oV7tsXnNuog2zK/7dYhyvbZp4JdwcQNm4iyJXj9XzR7r2vy2
         iXREhvHV6C9KFa3p0bTWaVAFUY0mAPb8imsnVKNpm2SOYEZarmuLJFfDXgPzubkkFR4F
         1f+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713441559; x=1714046359;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cPzNHD9JI2uetjXO2Kh7vp5CIb8zYoijo0y8bQC99Ow=;
        b=BcK7lRhgf8v5c6hH5aCqMtTMAspsSw0AevCYpYGmxFwZOnoxs4Uthu6T7A+eRmORGr
         QjzJfsBqjIII9r+elI2OqOPTuvFbqdcCaaO5FNxFWMJg4FzQS1tcx8imVadGXL79T346
         cHxHYrWYUdzt+NbRaWkq12WJc5yWH9jxlpbTndInjfzT/QiaHZ/3JYEqIfRnkknsFXkb
         hRIzByGHj/bLgqYJ7NqsySYr31amhplfZigb8NdcM9Sgkexz2kbav2yjRNsvfMKZuDlW
         KdaCsLzKosahuVYF8xibL1/4zk41QL8VII7fXSGWVyT+hZWIMt6KJri+fnQYINuMQ0ey
         owcw==
X-Forwarded-Encrypted: i=1; AJvYcCXMexOA7DaNr43Bqp4tVMmr/sAUY5XGrfdBSKVNuduqQy8uJITFoyACEquRvZF4SL4Ls3YCvR9Z1tD9qnTNp5WmjRvn
X-Gm-Message-State: AOJu0YwlVMxYAJ50jtHWqY89yarLnbMCq8YTXS6xEA/tnEez8jjuLYGe
	QX/Y/KZODvlzBUPjoNvsRKcOuBgkzfh0jQhzpmN9Ar1eeF1z/q5M14bxPGVY4g==
X-Google-Smtp-Source: AGHT+IEXip66h8Nk0h1IbVHoaXh8m1Zz/EdBdxj9XMqe7Xf1WJOO+AEsLUuA3n4l406sXGpUWZVsgg==
X-Received: by 2002:a05:6a00:1786:b0:6e6:ac71:8b38 with SMTP id s6-20020a056a00178600b006e6ac718b38mr3018707pfg.22.1713441558645;
        Thu, 18 Apr 2024 04:59:18 -0700 (PDT)
Received: from [127.0.1.1] ([120.56.197.253])
        by smtp.gmail.com with ESMTPSA id ei16-20020a056a0080d000b006ed06c4074bsm1305512pfb.85.2024.04.18.04.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 04:59:18 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Thu, 18 Apr 2024 17:28:35 +0530
Subject: [PATCH v3 7/9] PCI: dwc: ep: Add a generic dw_pcie_ep_linkdown()
 API to handle Link Down event
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240418-pci-epf-rework-v3-7-222a5d1ed2e5@linaro.org>
References: <20240418-pci-epf-rework-v3-0-222a5d1ed2e5@linaro.org>
In-Reply-To: <20240418-pci-epf-rework-v3-0-222a5d1ed2e5@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6881;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=HPfONLtsy/MnvLDF1/hjLcYap8xzDzzAp+j/LvPJsHU=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBmIQrz5eCB8TEv5nHkrrSLkJMMIyRInJrsD4fnm
 c+dPW7Yi0CJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZiEK8wAKCRBVnxHm/pHO
 9aAEB/4mypailLWgiffEbKroVv4//BFpSp/TMOhopRHH1IcjnySnW0/g2xgJw9+1TgvSDN9Gayx
 ZoFJoYhRLovMRVJlFleQCqBk3okGsOa9nILQVhi9PUI3zw2uCj2AqqNitFaH47ti1CZo/e1J9c4
 xN4ouPOyp1Xgbofs4eexzu2GOxM453Jgwxv7bFb3VdwmUyCDktz2vBPkogZB/bP05qiTOy0Ixfp
 LrxrghEz7C4+HkS4ZHChg4MpSVXT0ZBU97QtSFxTvnstbTixvb31ronuCD8aIVptMKwPtHTcAwc
 Nm38hqX000txrJDME9u07TbFVRYO5vFxDppZAwVJbtMhgOhJ
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

As per the PCIe base spec r5.0, section 5.2, Link Down event can happen
under any of the following circumstances:

1. Fundamental/Hot reset
2. Link disable transmission by upstream component
3. Moving from L2/L3 to L0

In those cases, Link Down causes some non-sticky DWC registers to loose the
state (like REBAR, etc...). So the drivers need to reinitialize them to
function properly once the link comes back again.

This is not a problem for drivers supporting PERST# IRQ, since they can
reinitialize the registers in the PERST# IRQ callback. But for the drivers
not supporting PERST#, there is no way they can reinitialize the registers
other than relying on Link Down IRQ received when the link goes down. So
let's add a DWC generic API dw_pcie_ep_linkdown() that reinitializes the
non-sticky registers and also notifies the EPF drivers about link going
down.

This API can also be used by the drivers supporting PERST# to handle the
scenario (2) mentioned above.

NOTE: For the sake of code organization, move the dw_pcie_ep_linkup()
definition just above dw_pcie_ep_linkdown().

Reviewed-by: Niklas Cassel <cassel@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-designware-ep.c | 103 ++++++++++++++++--------
 drivers/pci/controller/dwc/pcie-designware.h    |   5 ++
 2 files changed, 73 insertions(+), 35 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index 2063cf2049e5..b878b62460f3 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -15,18 +15,6 @@
 #include <linux/pci-epc.h>
 #include <linux/pci-epf.h>
 
-/**
- * dw_pcie_ep_linkup - Notify EPF drivers about Link Up event
- * @ep: DWC EP device
- */
-void dw_pcie_ep_linkup(struct dw_pcie_ep *ep)
-{
-	struct pci_epc *epc = ep->epc;
-
-	pci_epc_linkup(epc);
-}
-EXPORT_SYMBOL_GPL(dw_pcie_ep_linkup);
-
 /**
  * dw_pcie_ep_init_notify - Notify EPF drivers about EPC initialization complete
  * @ep: DWC EP device
@@ -673,6 +661,34 @@ static unsigned int dw_pcie_ep_find_ext_capability(struct dw_pcie *pci, int cap)
 	return 0;
 }
 
+static void dw_pcie_ep_init_non_sticky_registers(struct dw_pcie *pci)
+{
+	unsigned int offset;
+	unsigned int nbars;
+	u32 reg, i;
+
+	offset = dw_pcie_ep_find_ext_capability(pci, PCI_EXT_CAP_ID_REBAR);
+
+	dw_pcie_dbi_ro_wr_en(pci);
+
+	if (offset) {
+		reg = dw_pcie_readl_dbi(pci, offset + PCI_REBAR_CTRL);
+		nbars = (reg & PCI_REBAR_CTRL_NBAR_MASK) >>
+			PCI_REBAR_CTRL_NBAR_SHIFT;
+
+		/*
+		 * PCIe r6.0, sec 7.8.6.2 require us to support at least one
+		 * size in the range from 1 MB to 512 GB. Advertise support
+		 * for 1 MB BAR size only.
+		 */
+		for (i = 0; i < nbars; i++, offset += PCI_REBAR_CTRL)
+			dw_pcie_writel_dbi(pci, offset + PCI_REBAR_CAP, 0x0);
+	}
+
+	dw_pcie_setup(pci);
+	dw_pcie_dbi_ro_wr_dis(pci);
+}
+
 /**
  * dw_pcie_ep_init_registers - Initialize DWC EP specific registers
  * @ep: DWC EP device
@@ -687,13 +703,11 @@ int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep)
 	struct dw_pcie_ep_func *ep_func;
 	struct device *dev = pci->dev;
 	struct pci_epc *epc = ep->epc;
-	unsigned int offset, ptm_cap_base;
-	unsigned int nbars;
+	u32 ptm_cap_base, reg;
 	u8 hdr_type;
 	u8 func_no;
-	int i, ret;
 	void *addr;
-	u32 reg;
+	int ret;
 
 	hdr_type = dw_pcie_readb_dbi(pci, PCI_HEADER_TYPE) &
 		   PCI_HEADER_TYPE_MASK;
@@ -756,25 +770,8 @@ int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep)
 	if (ep->ops->init)
 		ep->ops->init(ep);
 
-	offset = dw_pcie_ep_find_ext_capability(pci, PCI_EXT_CAP_ID_REBAR);
 	ptm_cap_base = dw_pcie_ep_find_ext_capability(pci, PCI_EXT_CAP_ID_PTM);
 
-	dw_pcie_dbi_ro_wr_en(pci);
-
-	if (offset) {
-		reg = dw_pcie_readl_dbi(pci, offset + PCI_REBAR_CTRL);
-		nbars = (reg & PCI_REBAR_CTRL_NBAR_MASK) >>
-			PCI_REBAR_CTRL_NBAR_SHIFT;
-
-		/*
-		 * PCIe r6.0, sec 7.8.6.2 require us to support at least one
-		 * size in the range from 1 MB to 512 GB. Advertise support
-		 * for 1 MB BAR size only.
-		 */
-		for (i = 0; i < nbars; i++, offset += PCI_REBAR_CTRL)
-			dw_pcie_writel_dbi(pci, offset + PCI_REBAR_CAP, BIT(4));
-	}
-
 	/*
 	 * PTM responder capability can be disabled only after disabling
 	 * PTM root capability.
@@ -791,8 +788,7 @@ int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep)
 		dw_pcie_dbi_ro_wr_dis(pci);
 	}
 
-	dw_pcie_setup(pci);
-	dw_pcie_dbi_ro_wr_dis(pci);
+	dw_pcie_ep_init_non_sticky_registers(pci);
 
 	return 0;
 
@@ -803,6 +799,43 @@ int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep)
 }
 EXPORT_SYMBOL_GPL(dw_pcie_ep_init_registers);
 
+/**
+ * dw_pcie_ep_linkup - Notify EPF drivers about Link Up event
+ * @ep: DWC EP device
+ */
+void dw_pcie_ep_linkup(struct dw_pcie_ep *ep)
+{
+	struct pci_epc *epc = ep->epc;
+
+	pci_epc_linkup(epc);
+}
+EXPORT_SYMBOL_GPL(dw_pcie_ep_linkup);
+
+/**
+ * dw_pcie_ep_linkdown - Notify EPF drivers about Link Down event
+ * @ep: DWC EP device
+ *
+ * Non-sticky registers are also initialized before sending the notification to
+ * the EPF drivers. This is needed since the registers need to be initialized
+ * before the link comes back again.
+ */
+void dw_pcie_ep_linkdown(struct dw_pcie_ep *ep)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
+	struct pci_epc *epc = ep->epc;
+
+	/*
+	 * Initialize the non-sticky DWC registers as they would've reset post
+	 * Link Down. This is specifically needed for drivers not supporting
+	 * PERST# as they have no way to reinitialize the registers before the
+	 * link comes back again.
+	 */
+	dw_pcie_ep_init_non_sticky_registers(pci);
+
+	pci_epc_linkdown(epc);
+}
+EXPORT_SYMBOL_GPL(dw_pcie_ep_linkdown);
+
 /**
  * dw_pcie_ep_init - Initialize the endpoint device
  * @ep: DWC EP device
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index f8e5431a207b..152969545b0a 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -668,6 +668,7 @@ static inline void __iomem *dw_pcie_own_conf_map_bus(struct pci_bus *bus,
 
 #ifdef CONFIG_PCIE_DW_EP
 void dw_pcie_ep_linkup(struct dw_pcie_ep *ep);
+void dw_pcie_ep_linkdown(struct dw_pcie_ep *ep);
 int dw_pcie_ep_init(struct dw_pcie_ep *ep);
 int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep);
 void dw_pcie_ep_init_notify(struct dw_pcie_ep *ep);
@@ -688,6 +689,10 @@ static inline void dw_pcie_ep_linkup(struct dw_pcie_ep *ep)
 {
 }
 
+static inline void dw_pcie_ep_linkdown(struct dw_pcie_ep *ep)
+{
+}
+
 static inline int dw_pcie_ep_init(struct dw_pcie_ep *ep)
 {
 	return 0;

-- 
2.25.1

