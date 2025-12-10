Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E715D22A1D4;
	Wed, 10 Dec 2025 07:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765351664; cv=none; b=qFXsoz2Oa8+ZX+RcPODzTPIqVv2FD25uM10kMTDkHyjB+SugWP0GGmS7yqYLjoolTa8bepQefB6MwMLhNhE+qqZnGc6b2HcJ5iQu2i7cZnqrp7hXZtkkhUi4jCe014ddNngJXHcCbVfcTDPgHUfEjO+5SlBHyKROSiRvDpGBrHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765351664; c=relaxed/simple;
	bh=uOMP36cS5ywpA7T3ppbrxfPZAd9OqQYmb2LTH5Wtsn8=;
	h=Subject:To:Cc:From:Date:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=T2Cf21THdKUrm5g/D8Nze8Gd79w7nh6TsX/MBB5tx+v5fPXtf5dGk8vOhDic6/gsJETWvw7oHrGT8G7KghTO6bRt7M45U8iOM4lloik4IlGXH7f0YzoLd+wsYt31GKc9BBPKnmuL1MzVOEk4s5XvGaaC+61j1h7LP5Z0oLxh+lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=pO6S9O/K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="pO6S9O/K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11CA5C4CEF1;
	Wed, 10 Dec 2025 07:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1765351663;
	bh=uOMP36cS5ywpA7T3ppbrxfPZAd9OqQYmb2LTH5Wtsn8=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=pO6S9O/KgtmBBE1QBStLSnZzzTifJTMm8h+dQ0PD/H4Tj+rnUvDf4fjVMLGFuJfb6
	 8O5xHe2g/ebHPB9gtv3R2EGboNWPZwDcKySc2wuU2sLbaAmBycwryNHwjiSZLaRpup
	 i9EraIhO4bMvRKGwQvEFruPLdnVJXJQEh8jffx3g=
Subject: Patch "bus: mhi: host: pci_generic: Add Telit FN920C04 modem support" has been added to the 6.12-stable tree
To: dnlplm@gmail.com,fabio.porcedda@gmail.com,gregkh@linuxfoundation.org,manivannan.sadhasivam@linaro.org,mhi@lists.linux.dev
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Wed, 10 Dec 2025 16:27:37 +0900
In-Reply-To: <d2b91b3097c693f784393a28801a3885778615df.1764769310.git.fabio.porcedda@gmail.com>
Message-ID: <2025121037-degrading-headgear-b153@gregkh>
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

    bus: mhi: host: pci_generic: Add Telit FN920C04 modem support

to the 6.12-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     bus-mhi-host-pci_generic-add-telit-fn920c04-modem-support.patch
and it can be found in the queue-6.12 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-198224-greg=kroah.com@vger.kernel.org Wed Dec  3 22:54:10 2025
From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed,  3 Dec 2025 14:53:52 +0100
Subject: bus: mhi: host: pci_generic: Add Telit FN920C04 modem support
To: stable@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev, Daniele Palmas <dnlplm@gmail.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Fabio Porcedda <fabio.porcedda@gmail.com>
Message-ID: <d2b91b3097c693f784393a28801a3885778615df.1764769310.git.fabio.porcedda@gmail.com>

From: Daniele Palmas <dnlplm@gmail.com>

commit 6348f62ef7ecc5855b710a7d4ea682425c38bb80 upstream.

Add SDX35 based modem Telit FN920C04.

$ lspci -vv
01:00.0 Unassigned class [ff00]: Qualcomm Device 011a
        Subsystem: Device 1c5d:2020

Signed-off-by: Daniele Palmas <dnlplm@gmail.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Link: https://patch.msgid.link/20250401093458.2953872-1-dnlplm@gmail.com
Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/bus/mhi/host/pci_generic.c |   39 +++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -698,6 +698,42 @@ static const struct mhi_pci_dev_info mhi
 	.mru_default = 32768,
 };
 
+static const struct mhi_channel_config mhi_telit_fn920c04_channels[] = {
+	MHI_CHANNEL_CONFIG_UL_SBL(2, "SAHARA", 32, 0),
+	MHI_CHANNEL_CONFIG_DL_SBL(3, "SAHARA", 32, 0),
+	MHI_CHANNEL_CONFIG_UL(4, "DIAG", 64, 1),
+	MHI_CHANNEL_CONFIG_DL(5, "DIAG", 64, 1),
+	MHI_CHANNEL_CONFIG_UL(14, "QMI", 32, 0),
+	MHI_CHANNEL_CONFIG_DL(15, "QMI", 32, 0),
+	MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
+	MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
+	MHI_CHANNEL_CONFIG_UL_FP(34, "FIREHOSE", 32, 0),
+	MHI_CHANNEL_CONFIG_DL_FP(35, "FIREHOSE", 32, 0),
+	MHI_CHANNEL_CONFIG_UL(92, "DUN2", 32, 1),
+	MHI_CHANNEL_CONFIG_DL(93, "DUN2", 32, 1),
+	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0", 128, 2),
+	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0", 128, 3),
+};
+
+static const struct mhi_controller_config modem_telit_fn920c04_config = {
+	.max_channels = 128,
+	.timeout_ms = 50000,
+	.num_channels = ARRAY_SIZE(mhi_telit_fn920c04_channels),
+	.ch_cfg = mhi_telit_fn920c04_channels,
+	.num_events = ARRAY_SIZE(mhi_telit_fn990_events),
+	.event_cfg = mhi_telit_fn990_events,
+};
+
+static const struct mhi_pci_dev_info mhi_telit_fn920c04_info = {
+	.name = "telit-fn920c04",
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
@@ -720,6 +756,9 @@ static const struct mhi_pci_dev_info mhi
 
 /* Keep the list sorted based on the PID. New VID should be added as the last entry */
 static const struct pci_device_id mhi_pci_id_table[] = {
+	/* Telit FN920C04 (sdx35) */
+	{PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x011a, 0x1c5d, 0x2020),
+		.driver_data = (kernel_ulong_t) &mhi_telit_fn920c04_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0304),
 		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx24_info },
 	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0306, PCI_VENDOR_ID_QCOM, 0x010c),


Patches currently in stable-queue which might be from fabio.porcedda@gmail.com are

queue-6.12/bus-mhi-host-pci_generic-add-telit-fn920c04-modem-support.patch
queue-6.12/usb-serial-option-add-telit-cinterion-fe910c04-new-compositions.patch
queue-6.12/bus-mhi-host-pci_generic-add-telit-fn990b40-modem-support.patch
queue-6.12/usb-serial-option-move-telit-0x10c7-composition-in-the-right-place.patch
