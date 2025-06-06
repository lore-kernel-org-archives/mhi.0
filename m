Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 488B113B2A4
	for <mhi@lists.linux.dev>; Fri,  6 Jun 2025 09:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749203473; cv=none; b=i1bVkyjho4CBVJsFnIdK87CPVeWl8MBDemmLnzXKfmb1aGK8QVO+gyyKM6C1b2jXWd9XCH/0vSpqlQS+9hE3yNh5AiHgpj7cOEkim7pTG6OHnGUZtrqI04TUSgXC/bSGXAxbqzFfkB0/yJ1U3Xneu5LGCkHYM9bcLQIlpvFbyaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749203473; c=relaxed/simple;
	bh=Liqzz+y3Xpct0YUxn1hcdqAN16lyEo7U507Jr8n4RDA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Z/T+dg/gNELSmLDZqLkt75kwDHXxurFq0P+gp2U/HG10Th/O40FK0h6Ii70jdtEEOA1MQlsroi1+2MWO2DBQXv8y9k8lwA17o7XxqoEsTnpVqUyweZ70TSzeXPIHJhdlaZW8gLFBlGw6FVQvMZCKWSS8XBaLLFeuv0KxrSb2iZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=nReW8NZX; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="nReW8NZX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=gV
	Q67dkOWrUUbsyOUp1tkuG+EhYQ5alDpGFSmm71tg0=; b=nReW8NZX2u/A3csB07
	Ts+bguMylNdkNqrnf2D7GisAbTZQPVObt7IMiGHnmC3FjnIYaPNxMCeqYdoEIzXV
	g0/PK6f8LG4kREf6iUK8GT/fdCm3UepINupCu7ENZFeBc3rCmnhZI1fVV2YlPaeQ
	fDMQ39Hj0tOJv0Rx48mth5tS4=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wDnS1LduUJoDSSKGQ--.2037S2;
	Fri, 06 Jun 2025 17:50:23 +0800 (CST)
From: Slark Xiao <slark_xiao@163.com>
To: manivannan.sadhasivam@linaro.org,
	johan+linaro@kernel.org,
	mhi@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Slark Xiao <slark_xiao@163.com>
Subject: [PATCH] bus: mhi: host: pci_generic: Change T99W515 to T99W640
Date: Fri,  6 Jun 2025 17:50:19 +0800
Message-Id: <20250606095019.383992-1-slark_xiao@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnS1LduUJoDSSKGQ--.2037S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7AFy7GFWfArW8Zr18Wr1UAwb_yoW8WF48pF
	4fur1UtaykXr45Ka1kAryDuas8GrsxCryxK3WxG34Igr1qyrWYgFZ7Gr1a9w1Yqa93tF1S
	vFWUuFyUX3WDKF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRhNVhUUUUU=
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/1tbibgZkZGhCsRPxxQAAsU

T99W515 is a LGA device but not a M.2 modem device.
So correct this name in case a name mismatch issue.

Fixes: bf30a75e6e00("bus: mhi: host: Add support for Foxconn SDX72 modems")
Signed-off-by: Slark Xiao<slark_xiao@163.com>
---
 drivers/bus/mhi/host/pci_generic.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index a4a62429c784..9c2d10327ce5 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -593,8 +593,8 @@ static const struct mhi_pci_dev_info mhi_foxconn_dw5932e_info = {
 	.sideband_wake = false,
 };
 
-static const struct mhi_pci_dev_info mhi_foxconn_t99w515_info = {
-	.name = "foxconn-t99w515",
+static const struct mhi_pci_dev_info mhi_foxconn_t99w640_info = {
+	.name = "foxconn-t99w640",
 	.edl = "qcom/sdx72m/foxconn/edl.mbn",
 	.edl_trigger = true,
 	.config = &modem_foxconn_sdx72_config,
@@ -920,9 +920,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
 	/* DW5932e (sdx62), Non-eSIM */
 	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0f9),
 		.driver_data = (kernel_ulong_t) &mhi_foxconn_dw5932e_info },
-	/* T99W515 (sdx72) */
+	/* T99W640 (sdx72) */
 	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe118),
-		.driver_data = (kernel_ulong_t) &mhi_foxconn_t99w515_info },
+		.driver_data = (kernel_ulong_t) &mhi_foxconn_t99w640_info },
 	/* DW5934e(sdx72), With eSIM */
 	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe11d),
 		.driver_data = (kernel_ulong_t) &mhi_foxconn_dw5934e_info },
-- 
2.25.1

