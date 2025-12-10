Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71C61F419F;
	Wed, 10 Dec 2025 07:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765351671; cv=none; b=HsNiHU2jJToJr8HaYo5gMz3+EbIP0JzOD3hSruSx4EUZqajuKPVtFKmQcJrTwbLA2cVPPhVA9UZsFwupjwUXr2G1GHBW0wtJHeKmwpnpdi3X5/SWrgtx86PgZaKUC4mLY7m2xXdJaxGWfAhUA5aRZUBwk+ElVMivqtsYWbTF1js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765351671; c=relaxed/simple;
	bh=zFEU+3FR4brERVhgr9f+IoOvP5MEH0UIRWL5Ng4sPeE=;
	h=Subject:To:Cc:From:Date:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=pO1gYloUs2xtLzmuSQlFcWtL6Mo/M1a6YRVSSUSBF+8oYOkmZfXs59sxrL0IbSc+XjavPh3mvK65OP44tBRi4X/0MSwZLWC5JfL8zWAGR5hUEXpsRuai/xVjAF5BNZH6dLAxDC1uGook4z9N+MIXlnZkuI/wfH54y7TMI2GbdrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=CuzMNVTU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="CuzMNVTU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 215B1C4CEF1;
	Wed, 10 Dec 2025 07:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1765351670;
	bh=zFEU+3FR4brERVhgr9f+IoOvP5MEH0UIRWL5Ng4sPeE=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=CuzMNVTUfhUAsBMrQOCKBqe5JBBml0FyfhOuNgPet+7OVbSJH8aYj8eImqbHQdbL2
	 jsLET7sNbE9zdcZD8qxxV5rhMIINjd8Xz2BAT1OpR/qOp/KqxGLIgYkfLCwUT1AXF+
	 5eLuUQ8KSMvM3kGfUSX7ZwNClfiZZbpOE93tQaB4=
Subject: Patch "bus: mhi: host: pci_generic: Add Telit FN990B40 modem support" has been added to the 6.12-stable tree
To: dnlplm@gmail.com,fabio.porcedda@gmail.com,gregkh@linuxfoundation.org,mani@kernel.org,mhi@lists.linux.dev
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Wed, 10 Dec 2025 16:27:37 +0900
In-Reply-To: <5091bf715f9ecf449b270af23352be15e4560df7.1764769310.git.fabio.porcedda@gmail.com>
Message-ID: <2025121037-remindful-hydrated-f6bf@gregkh>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore


This is a note to let you know that I've just added the patch titled

    bus: mhi: host: pci_generic: Add Telit FN990B40 modem support

to the 6.12-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     bus-mhi-host-pci_generic-add-telit-fn990b40-modem-support.patch
and it can be found in the queue-6.12 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-198225-greg=kroah.com@vger.kernel.org Wed Dec  3 22:54:14 2025
From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed,  3 Dec 2025 14:53:53 +0100
Subject: bus: mhi: host: pci_generic: Add Telit FN990B40 modem support
To: stable@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev, Daniele Palmas <dnlplm@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, Fabio Porcedda <fabio.porcedda@gmail.com>
Message-ID: <5091bf715f9ecf449b270af23352be15e4560df7.1764769310.git.fabio.porcedda@gmail.com>

From: Daniele Palmas <dnlplm@gmail.com>

commit 00559ba3ae740e7544b48fb509b2b97f56615892 upstream.

Add SDX72 based modem Telit FN990B40, reusing FN920C04 configuration.

01:00.0 Unassigned class [ff00]: Qualcomm Device 0309
        Subsystem: Device 1c5d:201a

Signed-off-by: Daniele Palmas <dnlplm@gmail.com>
[mani: added sdx72 in the comment to identify the chipset]
Signed-off-by: Manivannan Sadhasivam <mani@kernel.org>
Link: https://patch.msgid.link/20250716091836.999364-1-dnlplm@gmail.com
Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/bus/mhi/host/pci_generic.c |   13 +++++++++++++
 1 file changed, 13 insertions(+)

--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -734,6 +734,16 @@ static const struct mhi_pci_dev_info mhi
 	.edl_trigger = true,
 };
 
+static const struct mhi_pci_dev_info mhi_telit_fn990b40_info = {
+	.name = "telit-fn990b40",
+	.config = &modem_telit_fn920c04_config,
+	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
+	.dma_data_width = 32,
+	.sideband_wake = false,
+	.mru_default = 32768,
+	.edl_trigger = true,
+};
+
 static const struct mhi_pci_dev_info mhi_netprisma_lcur57_info = {
 	.name = "netprisma-lcur57",
 	.edl = "qcom/prog_firehose_sdx24.mbn",
@@ -779,6 +789,9 @@ static const struct pci_device_id mhi_pc
 		.driver_data = (kernel_ulong_t) &mhi_telit_fe990a_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0308),
 		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx65_info },
+	/* Telit FN990B40 (sdx72) */
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0309, 0x1c5d, 0x201a),
+		.driver_data = (kernel_ulong_t) &mhi_telit_fn990b40_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0309),
 		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx75_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QUECTEL, 0x1001), /* EM120R-GL (sdx24) */


Patches currently in stable-queue which might be from fabio.porcedda@gmail.com are

queue-6.12/bus-mhi-host-pci_generic-add-telit-fn920c04-modem-support.patch
queue-6.12/usb-serial-option-add-telit-cinterion-fe910c04-new-compositions.patch
queue-6.12/bus-mhi-host-pci_generic-add-telit-fn990b40-modem-support.patch
queue-6.12/usb-serial-option-move-telit-0x10c7-composition-in-the-right-place.patch
