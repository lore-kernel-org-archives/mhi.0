Received: from mail-m972.mail.163.com (mail-m972.mail.163.com [123.126.97.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE7A97E
	for <mhi@lists.linux.dev>; Wed,  2 Nov 2022 03:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=hKxe7n9CGxb+jXW6mT
	IrCP7AS5ofdViaMasdKQhrBfI=; b=jzh9l9DPAgdUMyshApYODmpJrl+X8+FiZ6
	RH3H2/vPHFgB+Y8wJ/jUJyPR3uhva/pFau3UnYvSda5fEWsGXWTpW26nUHYwYqyf
	HmfkuKl8tHnLw9SoasQEzYoB4TIJa5ontxr35wsAfqJWNaYiHbU5HSekjLXlBTpk
	Fyn54nOgU=
Received: from localhost.localdomain (unknown [43.134.191.38])
	by smtp2 (Coremail) with SMTP id GtxpCgC3Utag2WFjidLwqA--.28382S2;
	Wed, 02 Nov 2022 10:44:50 +0800 (CST)
From: Slark Xiao <slark_xiao@163.com>
To: mani@kernel.org,
	gregkh@linuxfoundation.org,
	loic.poulain@linaro.org
Cc: dnlplm@gmail.com,
	yonglin.tan@outlook.com,
	fabio.porcedda@gmail.com,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Slark Xiao <slark_xiao@163.com>
Subject: [PATCH] bus: mhi: host: pci_generic: Add macro for some vids
Date: Wed,  2 Nov 2022 10:44:37 +0800
Message-Id: <20221102024437.15248-1-slark_xiao@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID:GtxpCgC3Utag2WFjidLwqA--.28382S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxur1kGry8Zw1DWr17Xr1kKrg_yoW5XFyfpF
	4Y9rWvvF4Dtr4UKw1vyayDZF95Aa17Cry3K3Wxtw4F9F4qkF4Fgr92vrySyFyaqa4kXrWa
	qF1DZFWUKa1qyr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziWrW7UUUUU=
X-Originating-IP: [43.134.191.38]
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/xtbBDQKtZFaELmhrRwAAs+
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>

To make code neat and for convenience purpose, using macro for
some vids. Refer to previous patch in pci_ids.h side, they are
not allowed to add new entries of single driver needed. So we
add it in our local file.

Signed-off-by: Slark Xiao <slark_xiao@163.com>
---
 drivers/bus/mhi/host/pci_generic.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index c4259cb2d289..5abc778a5290 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -24,6 +24,10 @@
 
 #define HEALTH_CHECK_PERIOD (HZ * 2)
 
+#define PCI_VENDOR_ID_THALES	0x1269
+
+#define PCI_VENDOR_ID_QUECTEL	0x1eac
+
 /**
  * struct mhi_pci_dev_info - MHI PCI device specific information
  * @config: MHI controller configuration
@@ -557,11 +561,11 @@ static const struct pci_device_id mhi_pci_id_table[] = {
 		.driver_data = (kernel_ulong_t) &mhi_telit_fn990_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0308),
 		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx65_info },
-	{ PCI_DEVICE(0x1eac, 0x1001), /* EM120R-GL (sdx24) */
+	{ PCI_DEVICE(PCI_VENDOR_ID_QUECTEL, 0x1001), /* EM120R-GL (sdx24) */
 		.driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
-	{ PCI_DEVICE(0x1eac, 0x1002), /* EM160R-GL (sdx24) */
+	{ PCI_DEVICE(PCI_VENDOR_ID_QUECTEL, 0x1002), /* EM160R-GL (sdx24) */
 		.driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
-	{ PCI_DEVICE(0x1eac, 0x2001), /* EM120R-GL for FCCL (sdx24) */
+	{ PCI_DEVICE(PCI_VENDOR_ID_QUECTEL, 0x2001), /* EM120R-GL for FCCL (sdx24) */
 		.driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
 	/* T99W175 (sdx55), Both for eSIM and Non-eSIM */
 	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0ab),
@@ -585,16 +589,16 @@ static const struct pci_device_id mhi_pci_id_table[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0d9),
 		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx65_info },
 	/* MV31-W (Cinterion) */
-	{ PCI_DEVICE(0x1269, 0x00b3),
+	{ PCI_DEVICE(PCI_VENDOR_ID_THALES, 0x00b3),
 		.driver_data = (kernel_ulong_t) &mhi_mv31_info },
 	/* MV31-W (Cinterion), based on new baseline */
-	{ PCI_DEVICE(0x1269, 0x00b4),
+	{ PCI_DEVICE(PCI_VENDOR_ID_THALES, 0x00b4),
 		.driver_data = (kernel_ulong_t) &mhi_mv31_info },
 	/* MV32-WA (Cinterion) */
-	{ PCI_DEVICE(0x1269, 0x00ba),
+	{ PCI_DEVICE(PCI_VENDOR_ID_THALES, 0x00ba),
 		.driver_data = (kernel_ulong_t) &mhi_mv32_info },
 	/* MV32-WB (Cinterion) */
-	{ PCI_DEVICE(0x1269, 0x00bb),
+	{ PCI_DEVICE(PCI_VENDOR_ID_THALES, 0x00bb),
 		.driver_data = (kernel_ulong_t) &mhi_mv32_info },
 	{  }
 };
-- 
2.17.1

