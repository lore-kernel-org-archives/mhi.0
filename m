Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC5512B94
	for <mhi@lists.linux.dev>; Fri, 16 Oct 2026 03:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792119811; cv=none; b=t/f/H8olEbx9uuBYj9Sk58BgY333vRpl2Bdxw+Z5iVQcRP714iI/4wgw4BBw+tiParTHWVXaLzezvfeodB1/pKIpk0fQz+tzYEB6vtpl+xOY5bwY8sYA1cMbD2clPTSImIrDUcJzQNVuvJEkFdp+z29l2Ers+NlsM7d0zKMxIfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792119811; c=relaxed/simple;
	bh=hi8QUkDJjYb9tla0itlhIBs76aFemgbce24maF8ufNw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iB2VmNEDe+Nzf2mtAyxanyu/iJathRbLirS7I32ao1offEVQ0UEcPK8zE1C3EWufcdOKQoDcBK3bF8+9Td5pYeuQudbfdM2WZfIY9bOsHH61jQpTXqcAfoKexH64diNJsgaCuhspfQn4y4Pln9H8PIpB9O5NId09N7eB/0Dv+gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=E+3hLxse; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="E+3hLxse"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=mF
	5kp6KNNlfuZkatXpO5l7eSWT76TyqYqCl9b+emBuU=; b=E+3hLxseODb8OmkLB6
	GV6LKp6UdjJhFbzjBtd88lWCpj9hukPiYX8n72+hplj5UfbVnrsitRnoagdjNeZ4
	805DdSXIhXvv/uvdaW8tlBrPV5XliYQpxXTJ7yYJ5fjpdq7F7IZXgxKjvWa9ctOZ
	q/EkuKG8liTDHTepUxfiPr4+s=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wDnfybzk9FqNkeeAQ--.46746S3;
	Fri, 16 Oct 2026 11:03:19 +0800 (CST)
From: Slark Xiao <slark_xiao@163.com>
To: mani@kernel.org,
	jeff.hugo@oss.qualcomm.com,
	krishna.chundru@oss.qualcomm.com
Cc: mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Slark Xiao <slark_xiao@163.com>
Subject: [PATCH v2 1/2] bus: mhi: host: pci_generic: Add autosuspend_delay customized support
Date: Fri, 16 Oct 2026 11:03:03 +0800
Message-Id: <20261016030304.13677-2-slark_xiao@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261016030304.13677-1-slark_xiao@163.com>
References: <20261016030304.13677-1-slark_xiao@163.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnfybzk9FqNkeeAQ--.46746S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxAr13JFyrWw17WFyfKryxuFg_yoW5Kr13pF
	WF9FW3trW0gryjk34qyws5XF4fGry5C3yYkrZrC34Ik3sxKFyFqry8tFy5t3W09FZ3ZFy3
	Ar1jq3yUursrtaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRnXo5UUUUU=
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/xtbC6BcxlWrRk-eQLQAA35

For some WWAN device, it may get a SYS ERROR issue when resuming
from suspend state frequently. Refer to the Qualcomm recomendation,
we need to set the default value of autosuspend_delay_ms as 5000ms.
But in Linux side, all WWAN device were set as 2000ms.

So we add a support to allow vendor to set a difference value for
specific WWAN device.

BTW, based on the principle of structure alignment, I moved the
location of 'trigger_edl'.

Signed-off-by: Slark Xiao <slark_xiao@163.com>
---
 drivers/bus/mhi/host/pci_generic.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 7193a384cca4..680a63eeedbb 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -23,6 +23,8 @@
 
 #define HEALTH_CHECK_PERIOD (HZ * 2)
 
+#define AUTOSUSPEND_DELAY_MS 2000
+
 /* PCI VID definitions */
 #define PCI_VENDOR_ID_THALES	0x1269
 #define PCI_VENDOR_ID_QUECTEL	0x1eac
@@ -38,11 +40,12 @@
  * @name: name of the PCI module
  * @fw: firmware path (if any)
  * @edl: emergency download mode firmware path (if any)
- * @edl_trigger: capable of triggering EDL mode in the device (if supported)
  * @bar_num: PCI base address register to use for MHI MMIO register space
  * @dma_data_width: DMA transfer word size (32 or 64 bits)
  * @vf_dma_data_width: DMA transfer word size for VF's (optional)
  * @mru_default: default MRU size for MBIM network packets
+ * @autosuspend_delay: customized autosuspend_delay_ms value for specific mhi device
+ * @edl_trigger: capable of triggering EDL mode in the device (if supported)
  * @sideband_wake: Devices using dedicated sideband GPIO for wakeup instead
  *		   of inband wake support (such as sdx24)
  * @no_m3: M3 not supported
@@ -54,11 +57,12 @@ struct mhi_pci_dev_info {
 	const char *name;
 	const char *fw;
 	const char *edl;
-	bool edl_trigger;
 	unsigned int bar_num;
 	unsigned int dma_data_width;
 	unsigned int vf_dma_data_width;
 	unsigned int mru_default;
+	unsigned int autosuspend_delay;
+	bool edl_trigger;
 	bool sideband_wake;
 	bool no_m3;
 	bool reset_on_remove;
@@ -1387,6 +1391,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	struct mhi_pci_device *mhi_pdev;
 	struct mhi_controller *mhi_cntrl;
 	unsigned int dma_data_width;
+	unsigned int autosuspend_delay;
 	int err;
 
 	dev_info(&pdev->dev, "MHI PCI device found: %s\n", info->name);
@@ -1412,6 +1417,9 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	dma_data_width = (pdev->is_virtfn && info->vf_dma_data_width) ?
 			  info->vf_dma_data_width : info->dma_data_width;
 
+	autosuspend_delay = info->autosuspend_delay ? info->autosuspend_delay :
+			  AUTOSUSPEND_DELAY_MS;
+
 	mhi_cntrl->cntrl_dev = &pdev->dev;
 	mhi_cntrl->iova_start = 0;
 	mhi_cntrl->iova_stop = (dma_addr_t)DMA_BIT_MASK(dma_data_width);
@@ -1483,7 +1491,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	/* Allow runtime suspend only if both PME from D3Hot and M3 are supported */
 	if (pci_pme_capable(pdev, PCI_D3hot) && !(info->no_m3)) {
-		pm_runtime_set_autosuspend_delay(&pdev->dev, 2000);
+		pm_runtime_set_autosuspend_delay(&pdev->dev, autosuspend_delay);
 		pm_runtime_use_autosuspend(&pdev->dev);
 		pm_runtime_mark_last_busy(&pdev->dev);
 		pm_runtime_put_noidle(&pdev->dev);
-- 
2.25.1

