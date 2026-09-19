Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F9454705C
	for <mhi@lists.linux.dev>; Sat, 19 Sep 2026 09:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789811730; cv=none; b=IIu7yqcWAbrEjVNG8Aq36h9WTo8aYRxodjv5lxKv5VYRhx6ZC27vHh1gaSQVPXvT9iJ8qPO8UnW6EFYy0OUXEvIuPU3j2DLEtaUZtwxeYb49HF4S1Y5bPjrh//37/OAs6IYH33uckG2GRhzidloBO2sFDmmGXsjlj0hpko2pvJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789811730; c=relaxed/simple;
	bh=r8CSeQaS8639wzQAlEK18yri1+jPrDdp6NvgWAn5mRY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hHNdRcXl1HEKnTrxRwGOycAvAmL5SUnjPkm2wRY/a45nLmhJO4fP+vyZg/gPmvmmKHHGo1pQxpwfn1wPV+A24FID991000DL5Z5mQUJWj55jb8Drv8TzdAcf7DrHRsHu8DZFSx9VDFMPub8uOcFMIhq1XGxteF+ony76AdV89bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=HDzAaxXn; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="HDzAaxXn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=bV
	P6QM0ulyN94OMV46BEmxLAiT/+F1gDD647DjWHW6Q=; b=HDzAaxXnwMHMVJgE+Q
	x3Jwee7id/W30P/Ys737ikra9qjhgZIp9Z1bAL0qKmea41lfimeXqURSlmdofv7G
	K3sST55f81okTbVkb56D5kCXVxrCOrVNsQw9lkKeABA36irniyk/Lj/M+YQ4t4UP
	y6LrVWawwLHGrrARrauLKe6GU=
Received: from localhost.localdomain (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgDnD4r7W65qhGnwAA--.46194S2;
	Sat, 19 Sep 2026 17:55:08 +0800 (CST)
From: Slark Xiao <slark_xiao@163.com>
To: mani@kernel.org,
	jeff.hugo@oss.qualcomm.com
Cc: mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Slark Xiao <slark_xiao@163.com>
Subject: [PATCH] bus: mhi: host: pci_generic: Add autosuspend_delay customized support
Date: Sat, 19 Sep 2026 17:55:06 +0800
Message-Id: <20260919095506.9570-1-slark_xiao@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:QCgvCgDnD4r7W65qhGnwAA--.46194S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAFW3uFWxurWUGFy5tFW7twb_yoW5KFyUpF
	WF9F43trW0gry2k34qyws5XF1fGryag3yYkrZrC3y0k3sxKFyFqry8tFy5t3WI9FZ3uF13
	Ar1jq3yUursrtaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRWa0gUUUUU=
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/xtbC6B1cwGquW-1KRAAA3F

For some WWAN device, it may get a SYS ERROR issue when resuming
from suspend state frequently. Refer to the Qualcomm Windows
driver, the default value of autosuspend_delay_ms is set as 5000
ms. But in Linux side, all WWAN device were set as 2000ms. We
tried to set this value to 5000ms and we can get a positive test
result.

So we add a support to allow vendor to set a difference value for
specific WWAN device.

BTW, based on the principle of structure alignment, I moved the
location of 'trigger_edl'.

Signed-off-by: Slark Xiao <slark_xiao@163.com>
---
 drivers/bus/mhi/host/pci_generic.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index b636e2c23b4d..3339b9b2d16d 100644
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
@@ -1369,6 +1373,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	struct mhi_pci_device *mhi_pdev;
 	struct mhi_controller *mhi_cntrl;
 	unsigned int dma_data_width;
+	unsigned int autosuspend_delay;
 	int err;
 
 	dev_info(&pdev->dev, "MHI PCI device found: %s\n", info->name);
@@ -1394,6 +1399,9 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	dma_data_width = (pdev->is_virtfn && info->vf_dma_data_width) ?
 			  info->vf_dma_data_width : info->dma_data_width;
 
+	autosuspend_delay = info->autosuspend_delay ? info->autosuspend_delay :
+			  AUTOSUSPEND_DELAY_MS;
+
 	mhi_cntrl->cntrl_dev = &pdev->dev;
 	mhi_cntrl->iova_start = 0;
 	mhi_cntrl->iova_stop = (dma_addr_t)DMA_BIT_MASK(dma_data_width);
@@ -1463,7 +1471,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	/* Allow runtime suspend only if both PME from D3Hot and M3 are supported */
 	if (pci_pme_capable(pdev, PCI_D3hot) && !(info->no_m3)) {
-		pm_runtime_set_autosuspend_delay(&pdev->dev, 2000);
+		pm_runtime_set_autosuspend_delay(&pdev->dev, autosuspend_delay);
 		pm_runtime_use_autosuspend(&pdev->dev);
 		pm_runtime_mark_last_busy(&pdev->dev);
 		pm_runtime_put_noidle(&pdev->dev);
-- 
2.25.1

