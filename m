Received: from mail.mifritscher.de (mifritscher.de [188.40.170.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F08C26A1B8
	for <mhi@lists.linux.dev>; Tue, 29 Jul 2025 11:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.170.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753789077; cv=none; b=ejjB1wLDXsuXN36UMmLANo78dFhWXbPzb9znRlhFWKBjE3rCR5HPeGYWF3l1iNAI9ETPrqf0kEYL5VxfDmPoEA+TvFl5BSmrDPbjD4k8CYUM7oHE0UrX3aBJL6C2TjQ6F7A0jCU8MaBFy0TUJ81bDsrZ2zLIYMiWuLMj6Ewbwk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753789077; c=relaxed/simple;
	bh=2DUyleINyY08kAK5LexsCuMRMN4kuOxIaaYE2HdWLiE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Q1rvetEndk+Mrobznc/k+IxeabQPo8sU/gakHWSg27UJBW/sdQGXb88OpbqGmZ21j3wGBIVo7BKzZ8Bxpc4EP4+AcONodNVvGc/MWV4bFZoTsemvt8EymbZXacRREeUgVmf8nR93y5xUYvHJscE/af2dRb6ViIzAxp0ruB5JZdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fritscher.net; spf=pass smtp.mailfrom=fritscher.net; arc=none smtp.client-ip=188.40.170.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fritscher.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fritscher.net
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.mifritscher.de (Postfix) with ESMTP id 4BAD23B1E61;
	Tue, 29 Jul 2025 13:37:52 +0200 (CEST)
X-Virus-Scanned: Debian amavis at mifritscher.vserverkompetenz.de
Received: from mail.mifritscher.de ([127.0.0.1])
 by localhost (mail.mifritscher.vserverkompetenz.de [127.0.0.1]) (amavis, port 10024)
 with ESMTP id F3-12V5rI6IY; Tue, 29 Jul 2025 13:37:51 +0200 (CEST)
Received: from sonst.vserverkompetenz.de (sonst.mifritscher.de [188.40.170.101])
	by mail.mifritscher.de (Postfix) with ESMTPSA id D005C3AED53;
	Tue, 29 Jul 2025 13:37:51 +0200 (CEST)
From: Michael Fritscher <michael@fritscher.net>
Date: Tue, 29 Jul 2025 13:37:51 +0200
Subject: [PATCH] bus: mhi: host: pci_generic: Add Quectel RM520N-GLAP to
 pci id table
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250729-add-rm520n-glap-support-v1-1-736ee6bbb385@fritscher.net>
X-B4-Tracking: v=1; b=H4sIAI6yiGgC/x2OywqDMBBFf0Wy7mASatX+Sukimmky0DyYpEUQ/
 72xy8O5B+4uCjJhEfduF4xfKpRiA3XpxOpNdAhkGwst9SBHPYOxFjgMWkZwb5OhfHJOXGFqYla
 36zRqJVq9mIKwsImrP3vGkCqWPjE5in3wBBG3ei4z44u2/4fH8zh+kBxZkpMAAAA=
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Michael Fritscher <michael@fritscher.net>
X-Mailer: b4 0.12.0

Quectel RM520N-GLAP is a variant of Quectel RM520N-GLAA with fused out USB.
Add its PCI vendor and product id to the list to use the right dev info.

Signed-off-by: Michael Fritscher <michael@fritscher.net>
---
This series add support for the Quectel RM520N-GLAP, which uses a
Qualcomm PCI Vendor ID. Origin is linked at the end. After this it is
found as

MHI PCI device found: quectel-rm5xx

and works.

Link: https://forum.gl-inet.com/t/how-to-installing-vanilla-openwrt-on-gl-x3000/45404/15
---
 drivers/bus/mhi/host/pci_generic.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 589cb6722316..3f3212dda5bb 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -857,6 +857,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
 		.driver_data = (kernel_ulong_t) &mhi_telit_fn980_hw_v1_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0306),
 		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx55_info },
+	/* RM520N-GL variant with Qualcomm vendor and subvendor ID */
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, PCI_VENDOR_ID_QCOM, 0x5201),
+		.driver_data = (kernel_ulong_t) &mhi_quectel_rm5xx_info },
 	/* Telit FN990 */
 	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, 0x1c5d, 0x2010),
 		.driver_data = (kernel_ulong_t) &mhi_telit_fn990_info },

---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250729-add-rm520n-glap-support-8add91648721

Best regards,
-- 
Michael Fritscher <michael@fritscher.net>

