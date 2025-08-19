Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54310286D77
	for <mhi@lists.linux.dev>; Tue, 19 Aug 2025 02:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755568831; cv=none; b=SS0A0pQdA2EHk5XkRXC2RtYWfXM0qEM4LJUAX+gWcWtOPzuZ1NziLJnbZlrGAMI4LJ/ARonqoZpGz0HBZLCN8r5WcoQMKdB6mT6cK6Zzo4Dd7eNHtDFZ7n6PJkgE2ozBY2JyBpLHgv5npcUlFo2mBOBqu52N7YPdHpXDc+L6psU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755568831; c=relaxed/simple;
	bh=wxEfqCK6003W0GDgqJ6vYz2LNyzJsLJxp49Ny4AZLy4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Wu90t3xgE0JYj9fGgX0Y7SxzC9M+CDCDXggS1XVio0aqO9vlCIdRhsQ5X3YiTldr37qrhe4DCWD1KKbF/JQPCPpDC0PKLeolnOpVGLNYNng+B+WH+Caxxzsz2JM2x6cMvzliyVT/NNABHqc8lny2IIhI3YLdJbD3JHN5hISP/Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=hXnZhzfS; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="hXnZhzfS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Jb
	yOurLfVxwvAelppevDM1mpgbiZJFb5iSCgPWWWFfQ=; b=hXnZhzfS1KmYjXA6bH
	uswJiMQ5KSt9FYfVLGZnCJDgpUzyJY63fwz4knzNr/57KvltgVhYZzBDChS80FRO
	DuMo9ntGUK2E0xhXNM3T+Wh0JRdJFXv/9taBK/C9XZg/Ob+C9xWvVz3qrBrl6FbY
	Cr53joQHVrZWPhNjXlt501nWU=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wBHrZCx2qNo1JvJCw--.46296S2;
	Tue, 19 Aug 2025 10:00:18 +0800 (CST)
From: Slark Xiao <slark_xiao@163.com>
To: mani@kernel.org
Cc: mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Slark Xiao <slark_xiao@163.com>
Subject: [PATCH] bus: mhi: host: pci_generic: Use subsystem device ID PCI_ANY_ID for Foxconn T99W696 variants
Date: Tue, 19 Aug 2025 10:00:13 +0800
Message-Id: <20250819020013.122162-1-slark_xiao@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBHrZCx2qNo1JvJCw--.46296S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJryDJFy7ZrW7try5ZF1UZFb_yoW8uFWkpF
	Wa93yUtrWDJrW5Kw4vvrykJFykua13Ary7Kr17t34FgF13KFy5XrZ7XryUZa4aga98JF4a
	vFWkua4UW3ZrJF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRhNVhUUUUU=
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/1tbiRwuuZGijzfm2oQABsv

Since there are too many variants for Foxconn T99W696 SKU, and
they share same settings. So we use PCI_ANY_ID as the subsystem
device ID to match each possible settings.

Fixes: 0d63055e1406 ("bus: mhi: host: pci_generic: Add Foxconn T99W696 modem")
Signed-off-by: Slark Xiao <slark_xiao@163.com>
---
 drivers/bus/mhi/host/pci_generic.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 4edb5bb476ba..4564e2528775 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -917,20 +917,8 @@ static const struct pci_device_id mhi_pci_id_table[] = {
 	/* Telit FE990A */
 	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, 0x1c5d, 0x2015),
 		.driver_data = (kernel_ulong_t) &mhi_telit_fe990a_info },
-	/* Foxconn T99W696.01, Lenovo Generic SKU */
-	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, PCI_VENDOR_ID_FOXCONN, 0xe142),
-		.driver_data = (kernel_ulong_t) &mhi_foxconn_t99w696_info },
-	/* Foxconn T99W696.02, Lenovo X1 Carbon SKU */
-	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, PCI_VENDOR_ID_FOXCONN, 0xe143),
-		.driver_data = (kernel_ulong_t) &mhi_foxconn_t99w696_info },
-	/* Foxconn T99W696.03, Lenovo X1 2in1 SKU */
-	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, PCI_VENDOR_ID_FOXCONN, 0xe144),
-		.driver_data = (kernel_ulong_t) &mhi_foxconn_t99w696_info },
-	/* Foxconn T99W696.04, Lenovo PRC SKU */
-	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, PCI_VENDOR_ID_FOXCONN, 0xe145),
-		.driver_data = (kernel_ulong_t) &mhi_foxconn_t99w696_info },
-	/* Foxconn T99W696.00, Foxconn SKU */
-	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, PCI_VENDOR_ID_FOXCONN, 0xe146),
+	/* Foxconn T99W696, all variants */
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, PCI_VENDOR_ID_FOXCONN, PCI_ANY_ID),
 		.driver_data = (kernel_ulong_t) &mhi_foxconn_t99w696_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0308),
 		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx65_info },
-- 
2.25.1

