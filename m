Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCE041775
	for <mhi@lists.linux.dev>; Tue, 30 Apr 2024 06:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714457669; cv=none; b=bCSWtCMkaXbwv6n9K30mgsPl+Hz9SocA7cQDzZvsqdhuH4PBFtBd6oeSh4oAtbPV9eAFZBbMqDoaHAZhdwFJ1h5yJ2PVaMyS/T4WaZQTlJVKlQAPkTbCKWH37ysmiSjt9KRa6dKLudUxuT5T1qYUs0qU3W1aqoLKLBbKdxE1yDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714457669; c=relaxed/simple;
	bh=bGt+X/i2ZC4r4u7849G7cSM/cOIC/TabQxZyQ/Cl8ZE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IIKSvuak93kX5OOtc+ct1qRc5L1yLCoHx0/g5bpmE64p7/NhlHoaSFfXK+Wq3PdtAmAC0oZVmPTm5tm7acFirNHMvLhRltH2W8cd0wvI2C9eQdJxU7NcyQ/PlDpYOGwgm+loC3MwuxflBlv3rnGiiEwcb1E7nl93HawhHTJ57o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T9ZggU2w; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T9ZggU2w"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1eac92f7c74so41485445ad.3
        for <mhi@lists.linux.dev>; Mon, 29 Apr 2024 23:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714457666; x=1715062466; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hNi/qtFkLFLZz/waE6YUdyXfhsyOD/C0ipSKGQQehTw=;
        b=T9ZggU2w0MHOQjF1PgoACkOHI25EIQzldlhDdDVX4vGP2is8QvBy1pGZtytxFerfDq
         GjxmZAc16fS8GTUfYMDwnhR3Dh2efJZIcnrzbq37rLTLWkCpDhioDZq0BWEIT+wzaEsk
         9Na1LvU32pHUSzvfZGwXFfi4ReiaIRgBkl7IfYgJ9B+W6jIvDsHk72T7qykU489X0vbR
         ulblqFumjsOZWCETMfC4zVEFBBdQMuBxmqkahsFq5FfBGeUwQpPbApKOzKrP3DX0+3Cj
         1dBt51an4TpZ/wFsu9nprDrX+FugDJjbfTr3O8/8gwPha5+X6hVTk0XEprA+FWJZh265
         GHSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714457666; x=1715062466;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hNi/qtFkLFLZz/waE6YUdyXfhsyOD/C0ipSKGQQehTw=;
        b=jA6BTmhzMfyf193vVkE9v8a3ZI/ijkjdjbSHd8GTANm5OCwU1obm4Nyk5RVEIMkvbV
         /20OYrB+4UTVvAuIT08eJyDinD/C3wHjjs4o6GcgHwAhcdWewqHYHRCnAD4w+F51eQhc
         KEzBY6xszpjiGNMwlTWkxH6Ot6rA0Ft3HyhUM4vY1PlkILmuS3nvgIIbRNWTaHfbIbfR
         bkgKrJX6niNiLihXMPdWjJKBKpEj9MUQZ00EeiF5qjLpBkKLG56y03tM3wNydgVYYleY
         FdS1oB7Lb41FMDP5+J8KmWz4x0fG8PC0zuhw0pr0XlqPLObo35ZL+I7z/CJInNsemvxl
         cV0w==
X-Forwarded-Encrypted: i=1; AJvYcCWS45KIL3m/RmJIaVRZgPW4C88CEMidq8z8coCzJUeaij34Tn7rTa9n82Usj37Rz6OnisO8AbH+RMuSyazFpO4z9WZ/
X-Gm-Message-State: AOJu0YwVbFFNQ3yPHPniseJoLPuza3lKVJACFQ5eq2bohmbwHDX0jo0W
	8Fl2OEBVT4MeUz2T9m88A5uhCrXOfUNPYnBQ0ZTTTDiRwwKA5XbD7qhDNP71Ag==
X-Google-Smtp-Source: AGHT+IG1pJHZMsAzu7ccSnj9j8IX0I6hzhc4T+v5oZgy6lzMNubY775q4Qo3IDIUbLhTSG6XpL2//w==
X-Received: by 2002:a17:902:a705:b0:1e3:e39a:2e49 with SMTP id w5-20020a170902a70500b001e3e39a2e49mr1526667plq.18.1714457665718;
        Mon, 29 Apr 2024 23:14:25 -0700 (PDT)
Received: from [127.0.1.1] ([220.158.156.15])
        by smtp.gmail.com with ESMTPSA id bi2-20020a170902bf0200b001e27ad5199csm21393298plb.281.2024.04.29.23.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 23:14:25 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Tue, 30 Apr 2024 11:43:48 +0530
Subject: [PATCH v4 07/10] PCI: endpoint: Introduce 'epc_deinit' event and
 notify the EPF drivers
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240430-pci-epf-rework-v4-7-22832d0d456f@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8829;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=bGt+X/i2ZC4r4u7849G7cSM/cOIC/TabQxZyQ/Cl8ZE=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBmMIwcrWQ9AXNa3HSx8EkiSzDGUqJxPN+SHoMUx
 lP8NaJ5Rt2JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZjCMHAAKCRBVnxHm/pHO
 9WIWB/4xvRq7D9RXIX/tQEylcSejZoE3pRqoiwffe9HFzdZm9WcQjxaCi1Rf3xF3eTM1JMObTcb
 gKIrGEKqSnPacUFW7pmii8iBIhnGs4pH4ouTISwMhDUoTnxL0ZPU4aukc2/WuENKUie+Fea3Tme
 ZsQU1pniL70WgWduaCPS2A+PIt58isGL0XoeWLU4l9HsORo2tp7bgsyXBPncDrLWgbvaye6b1s2
 FrXf1kgX5PMeggOdBLE/tUT+N5hn7hd8HWkRuAPCPVWh0CsBo/O6P8i3AIY4xOhg2D3Z+GGwgOs
 VVAlbd9Z/enoVo38Z02ZRxjY2zgYb1kyLmJNl6gUDkXdD4t3
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

As like the 'epc_init' event, that is used to signal the EPF drivers about
the EPC initialization, let's introduce 'epc_deinit' event that is used to
signal EPC deinitialization.

The EPC deinitialization applies only when any sort of fundamental reset
is supported by the endpoint controller as per the PCIe spec.

Reference: PCIe Base spec v5.0, sections 4.2.4.9.1 and 6.6.1.

Currently, some EPC drivers like pcie-qcom-ep and pcie-tegra194 support
PERST# as the fundamental reset. So the 'deinit' event will be notified to
the EPF drivers when PERST# assert happens in the above mentioned EPC
drivers.

The EPF drivers, on receiving the event through the epc_deinit() callback
should reset the EPF state machine and also cleanup any configuration that
got affected by the fundamental reset like BAR, DMA etc...

This change also warrants skipping the cleanups in unbind() if already done
in epc_deinit().

Reviewed-by: Niklas Cassel <cassel@kernel.org>
Tested-by: Niklas Cassel <cassel@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-designware-ep.c |  1 -
 drivers/pci/controller/dwc/pcie-qcom-ep.c       |  1 +
 drivers/pci/controller/dwc/pcie-tegra194.c      |  1 +
 drivers/pci/endpoint/functions/pci-epf-mhi.c    | 19 +++++++++++++++++++
 drivers/pci/endpoint/functions/pci-epf-test.c   | 17 +++++++++++++++--
 drivers/pci/endpoint/pci-epc-core.c             | 25 +++++++++++++++++++++++++
 include/linux/pci-epc.h                         |  1 +
 include/linux/pci-epf.h                         |  2 ++
 8 files changed, 64 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index 47391d7d3a73..2063cf2049e5 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -632,7 +632,6 @@ void dw_pcie_ep_cleanup(struct dw_pcie_ep *ep)
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
 
 	dw_pcie_edma_remove(pci);
-	ep->epc->init_complete = false;
 }
 EXPORT_SYMBOL_GPL(dw_pcie_ep_cleanup);
 
diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index dcac177b55fb..3ee715df36ea 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -501,6 +501,7 @@ static void qcom_pcie_perst_assert(struct dw_pcie *pci)
 {
 	struct qcom_pcie_ep *pcie_ep = to_pcie_ep(pci);
 
+	pci_epc_deinit_notify(pci->ep.epc);
 	dw_pcie_ep_cleanup(&pci->ep);
 	qcom_pcie_disable_resources(pcie_ep);
 	pcie_ep->link_status = QCOM_PCIE_EP_LINK_DISABLED;
diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
index 93f5433c5c55..4b28f8beedfe 100644
--- a/drivers/pci/controller/dwc/pcie-tegra194.c
+++ b/drivers/pci/controller/dwc/pcie-tegra194.c
@@ -1715,6 +1715,7 @@ static void pex_ep_event_pex_rst_assert(struct tegra_pcie_dw *pcie)
 	if (ret)
 		dev_err(pcie->dev, "Failed to go Detect state: %d\n", ret);
 
+	pci_epc_deinit_notify(pcie->pci.ep.epc);
 	dw_pcie_ep_cleanup(&pcie->pci.ep);
 
 	reset_control_assert(pcie->core_rst);
diff --git a/drivers/pci/endpoint/functions/pci-epf-mhi.c b/drivers/pci/endpoint/functions/pci-epf-mhi.c
index 205c02953f25..5832989e55e8 100644
--- a/drivers/pci/endpoint/functions/pci-epf-mhi.c
+++ b/drivers/pci/endpoint/functions/pci-epf-mhi.c
@@ -764,6 +764,24 @@ static int pci_epf_mhi_epc_init(struct pci_epf *epf)
 	return 0;
 }
 
+static void pci_epf_mhi_epc_deinit(struct pci_epf *epf)
+{
+	struct pci_epf_mhi *epf_mhi = epf_get_drvdata(epf);
+	const struct pci_epf_mhi_ep_info *info = epf_mhi->info;
+	struct pci_epf_bar *epf_bar = &epf->bar[info->bar_num];
+	struct mhi_ep_cntrl *mhi_cntrl = &epf_mhi->mhi_cntrl;
+	struct pci_epc *epc = epf->epc;
+
+	if (mhi_cntrl->mhi_dev) {
+		mhi_ep_power_down(mhi_cntrl);
+		if (info->flags & MHI_EPF_USE_DMA)
+			pci_epf_mhi_dma_deinit(epf_mhi);
+		mhi_ep_unregister_controller(mhi_cntrl);
+	}
+
+	pci_epc_clear_bar(epc, epf->func_no, epf->vfunc_no, epf_bar);
+}
+
 static int pci_epf_mhi_link_up(struct pci_epf *epf)
 {
 	struct pci_epf_mhi *epf_mhi = epf_get_drvdata(epf);
@@ -898,6 +916,7 @@ static void pci_epf_mhi_unbind(struct pci_epf *epf)
 
 static const struct pci_epc_event_ops pci_epf_mhi_event_ops = {
 	.epc_init = pci_epf_mhi_epc_init,
+	.epc_deinit = pci_epf_mhi_epc_deinit,
 	.link_up = pci_epf_mhi_link_up,
 	.link_down = pci_epf_mhi_link_down,
 	.bus_master_enable = pci_epf_mhi_bus_master_enable,
diff --git a/drivers/pci/endpoint/functions/pci-epf-test.c b/drivers/pci/endpoint/functions/pci-epf-test.c
index ab714108dfdb..c8d0c51ae329 100644
--- a/drivers/pci/endpoint/functions/pci-epf-test.c
+++ b/drivers/pci/endpoint/functions/pci-epf-test.c
@@ -790,6 +790,15 @@ static int pci_epf_test_epc_init(struct pci_epf *epf)
 	return 0;
 }
 
+static void pci_epf_test_epc_deinit(struct pci_epf *epf)
+{
+	struct pci_epf_test *epf_test = epf_get_drvdata(epf);
+
+	cancel_delayed_work(&epf_test->cmd_handler);
+	pci_epf_test_clean_dma_chan(epf_test);
+	pci_epf_test_clear_bar(epf);
+}
+
 static int pci_epf_test_link_up(struct pci_epf *epf)
 {
 	struct pci_epf_test *epf_test = epf_get_drvdata(epf);
@@ -802,6 +811,7 @@ static int pci_epf_test_link_up(struct pci_epf *epf)
 
 static const struct pci_epc_event_ops pci_epf_test_event_ops = {
 	.epc_init = pci_epf_test_epc_init,
+	.epc_deinit = pci_epf_test_epc_deinit,
 	.link_up = pci_epf_test_link_up,
 };
 
@@ -907,10 +917,13 @@ static int pci_epf_test_bind(struct pci_epf *epf)
 static void pci_epf_test_unbind(struct pci_epf *epf)
 {
 	struct pci_epf_test *epf_test = epf_get_drvdata(epf);
+	struct pci_epc *epc = epf->epc;
 
 	cancel_delayed_work(&epf_test->cmd_handler);
-	pci_epf_test_clean_dma_chan(epf_test);
-	pci_epf_test_clear_bar(epf);
+	if (epc->init_complete) {
+		pci_epf_test_clean_dma_chan(epf_test);
+		pci_epf_test_clear_bar(epf);
+	}
 	pci_epf_test_free_space(epf);
 }
 
diff --git a/drivers/pci/endpoint/pci-epc-core.c b/drivers/pci/endpoint/pci-epc-core.c
index 56b60330355d..47a91dcb07d7 100644
--- a/drivers/pci/endpoint/pci-epc-core.c
+++ b/drivers/pci/endpoint/pci-epc-core.c
@@ -774,6 +774,31 @@ void pci_epc_notify_pending_init(struct pci_epc *epc, struct pci_epf *epf)
 }
 EXPORT_SYMBOL_GPL(pci_epc_notify_pending_init);
 
+/**
+ * pci_epc_deinit_notify() - Notify the EPF device about EPC deinitialization
+ * @epc: the EPC device whose deinitialization is completed
+ *
+ * Invoke to notify the EPF device that the EPC deinitialization is completed.
+ */
+void pci_epc_deinit_notify(struct pci_epc *epc)
+{
+	struct pci_epf *epf;
+
+	if (IS_ERR_OR_NULL(epc))
+		return;
+
+	mutex_lock(&epc->list_lock);
+	list_for_each_entry(epf, &epc->pci_epf, list) {
+		mutex_lock(&epf->lock);
+		if (epf->event_ops && epf->event_ops->epc_deinit)
+			epf->event_ops->epc_deinit(epf);
+		mutex_unlock(&epf->lock);
+	}
+	epc->init_complete = false;
+	mutex_unlock(&epc->list_lock);
+}
+EXPORT_SYMBOL_GPL(pci_epc_deinit_notify);
+
 /**
  * pci_epc_bus_master_enable_notify() - Notify the EPF device that the EPC
  *					device has received the Bus Master
diff --git a/include/linux/pci-epc.h b/include/linux/pci-epc.h
index 11115cd0fe5b..c39eed3ee73e 100644
--- a/include/linux/pci-epc.h
+++ b/include/linux/pci-epc.h
@@ -226,6 +226,7 @@ void pci_epc_linkup(struct pci_epc *epc);
 void pci_epc_linkdown(struct pci_epc *epc);
 void pci_epc_init_notify(struct pci_epc *epc);
 void pci_epc_notify_pending_init(struct pci_epc *epc, struct pci_epf *epf);
+void pci_epc_deinit_notify(struct pci_epc *epc);
 void pci_epc_bus_master_enable_notify(struct pci_epc *epc);
 void pci_epc_remove_epf(struct pci_epc *epc, struct pci_epf *epf,
 			enum pci_epc_interface_type type);
diff --git a/include/linux/pci-epf.h b/include/linux/pci-epf.h
index dc759eb7157c..0639d4dc8986 100644
--- a/include/linux/pci-epf.h
+++ b/include/linux/pci-epf.h
@@ -71,12 +71,14 @@ struct pci_epf_ops {
 /**
  * struct pci_epc_event_ops - Callbacks for capturing the EPC events
  * @epc_init: Callback for the EPC initialization complete event
+ * @epc_deinit: Callback for the EPC deinitialization event
  * @link_up: Callback for the EPC link up event
  * @link_down: Callback for the EPC link down event
  * @bus_master_enable: Callback for the EPC Bus Master Enable event
  */
 struct pci_epc_event_ops {
 	int (*epc_init)(struct pci_epf *epf);
+	void (*epc_deinit)(struct pci_epf *epf);
 	int (*link_up)(struct pci_epf *epf);
 	int (*link_down)(struct pci_epf *epf);
 	int (*bus_master_enable)(struct pci_epf *epf);

-- 
2.25.1

