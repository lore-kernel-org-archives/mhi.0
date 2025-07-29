Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A84B92586E0
	for <mhi@lists.linux.dev>; Tue, 29 Jul 2025 08:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753779484; cv=none; b=nqQQuzewELfGJ5YEg3T+HvUBOjXB1S1eHwmZH4C6BsupOiKGnzXZzhHlt/QKXPO3dLqtmyH+tNgfUJX4/Ivx6gkod7MjUlZuXwVTFeCbPT0qgNdKGZ6FLEVjxNMXZ1hFCHJwVfNUxkfD5yn+JcbqSoMcOkAiViw25gNZNwp7IOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753779484; c=relaxed/simple;
	bh=ievyL3g5Q46qxKZLnTmv/cYFeSgsBclXR9pVlWgcUos=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rP5fmhkrEp60UTQF4ZUXyw8ozt6NQAHw4d2gw7M2YO+XiLBLT9YTQYVXGny7N+X3uljLbuvcC4ejT1ddEnLKjT5RRRkc8NIJK5El1zswsWwiQnWwj9NPeg1YtaUTkN5HtTUU/xygdddkdnjPc7ITj3Ik85nRcdf+DSOxcfSZzZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=MqUGmcR4; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="MqUGmcR4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=AY
	UxPqccz5cc9qwkjV/MuJfbqx0ykQG6VuIw9i/MVRs=; b=MqUGmcR4X+V3QuPOKK
	/qQRCmn3WuyaoLrtyZSi9GYS6R7ArBXAZR+ICJMVFFPm7cBhHytgqC+3UPwP5AaY
	hPjEkzSpgEgstvu9ToHy5hL13eAEHKbW37qna7I2MYeRT1+zc96GYlHftnFSsZ+w
	yAf9oXyC6Z44wg+b4nfji1ihI=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgDnr7wCjYho7e6SCQ--.26154S2;
	Tue, 29 Jul 2025 16:57:39 +0800 (CST)
From: Slark Xiao <slark_xiao@163.com>
To: mani@kernel.org
Cc: mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Slark Xiao <slark_xiao@163.com>
Subject: [PATCH] bus: mhi: host: pci_generic: Add more Foxconn T99W696 modem
Date: Tue, 29 Jul 2025 16:57:26 +0800
Message-Id: <20250729085726.106807-1-slark_xiao@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgDnr7wCjYho7e6SCQ--.26154S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tw4xurW7ur4xXFyUJF45Awb_yoW8uFWkpF
	4furWjqrWDJrW8tw4vvr4kZF95ua1fXry7Kr1xtw1FgrnakFy5Xrs7XryUZF13ta98Jr4a
	vFykuF1UWanFyFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRgdjiUUUUU=
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/1tbiMBGZZGiIgnP2lQAAsu

There are more platforms need support Foxconn T99W696 modem.
This requirement comes from Lenovo side since they want 1 platform
to correspond to 1 modem SKU.

Signed-off-by: Slark Xiao <slark_xiao@163.com>
---
 drivers/bus/mhi/host/pci_generic.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 4edb5bb476ba..1fc43f1b86be 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -932,6 +932,24 @@ static const struct pci_device_id mhi_pci_id_table[] = {
 	/* Foxconn T99W696.00, Foxconn SKU */
 	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, PCI_VENDOR_ID_FOXCONN, 0xe146),
 		.driver_data = (kernel_ulong_t) &mhi_foxconn_t99w696_info },
+	/* Foxconn T99W696.05, Lenovo T14 */
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, PCI_VENDOR_ID_FOXCONN, 0xe150),
+		.driver_data = (kernel_ulong_t) &mhi_foxconn_t99w696_info },
+	/* Foxconn T99W696.06, Lenovo T15 */
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, PCI_VENDOR_ID_FOXCONN, 0xe151),
+		.driver_data = (kernel_ulong_t) &mhi_foxconn_t99w696_info },
+	/* Foxconn T99W696.07, Lenovo T16 */
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, PCI_VENDOR_ID_FOXCONN, 0xe152),
+		.driver_data = (kernel_ulong_t) &mhi_foxconn_t99w696_info },
+	/* Foxconn T99W696.08, Lenovo P14s */
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, PCI_VENDOR_ID_FOXCONN, 0xe153),
+		.driver_data = (kernel_ulong_t) &mhi_foxconn_t99w696_info },
+	/* Foxconn T99W696.09, Lenovo P16s */
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, PCI_VENDOR_ID_FOXCONN, 0xe154),
+		.driver_data = (kernel_ulong_t) &mhi_foxconn_t99w696_info },
+	/* Foxconn T99W696.10, Lenovo P1 */
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, PCI_VENDOR_ID_FOXCONN, 0xe155),
+		.driver_data = (kernel_ulong_t) &mhi_foxconn_t99w696_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0308),
 		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx65_info },
 	/* Telit FN990B40 (sdx72) */
-- 
2.25.1

