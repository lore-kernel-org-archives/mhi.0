Received: from cdw.me.uk (cdw.me.uk [91.203.57.136])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F5A53BB47
	for <mhi@lists.linux.dev>; Sun,  4 Aug 2024 18:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.203.57.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722795247; cv=none; b=Bioi/H5LURXZIdbWmXTvbCcQa9mE0wE+MEDK8QdHsRboHYfdSs7Qv1PJ7CYh7UtHJz/0ftUufGWhAH7ViS8DAsslLmYnsACBQnTFTvoR9L0ZOME+sQ6xgLWIqdMYpHlj7QxXvGzHguxr/H3QN3KZHm3RcUzJUTv21SfUHQjyYFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722795247; c=relaxed/simple;
	bh=aUF+wav77eL7MmaC8fjymn6TlgNicuTZbqoEGuS/YQQ=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b7+Xc/tiOUfmZBM+1lHj/jeQbT8h6YEfgHF23ATnLWn7mU1qNC4EObTxL6noORTcEX+DTdaqGIiqHRBZ7aK/NSg1mjKKTpkCqVuhpgUoL7UnUi63eZhHCNn8WvZ/T08G2AzkTFZVan47zBLSm0OSY5UrL0CPyDwre9Hcfw5Qkn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=arachsys.com; spf=pass smtp.mailfrom=arachsys.com; arc=none smtp.client-ip=91.203.57.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=arachsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arachsys.com
Received: from chris by delta.arachsys.com with local (Exim 4.80)
	(envelope-from <chris@arachsys.com>)
	id 1safjg-0006rk-Cy
	for mhi@lists.linux.dev; Sun, 04 Aug 2024 19:13:40 +0100
Date: Sun, 4 Aug 2024 19:13:40 +0100
From: Chris Webb <chris@arachsys.com>
To: mhi@lists.linux.dev
Subject: Re: PCIe MBIM modem not creating a wwan netdev
Message-ID: <Zq/E1C0uJ0O55JZw@arachsys.com>
References: <ZqllDCWfiKravZAo@arachsys.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZqllDCWfiKravZAo@arachsys.com>

Chris Webb <chris@arachsys.com> writes:

> Is this a bug (with my modem?) or there something more than the above
> I need to enable for the network device to be created as well as the
> character devices, as in the USB case?

This turns out to be a missing PCI ID for the variant of the RM520M-GL
modem I have. Doing the following got the channels labelled correctly
so the mhi_wwan_mbim driver bound to IP_HW0_MBIM:

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 08844ee7..7043d366 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -620,6 +620,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
 		.driver_data = (kernel_ulong_t) &mhi_telit_fn980_hw_v1_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0306),
 		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx55_info },
+	/* RM520N-GL variant with Qualcomm vendor and subvendor ID */
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, PCI_VENDOR_ID_QCOM, 0x5201),
+		.driver_data = (kernel_ulong_t) &mhi_quectel_rm5xx_info },
 	/* Telit FN990 */
 	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, 0x1c5d, 0x2010),
 		.driver_data = (kernel_ulong_t) &mhi_telit_fn990_info },


I wonder if there's an exhaustive list somewhere of the PCI ids used on
these Quectel cards, that might enable me to submit a sensible patch
rather than just an ad hoc fix-up for one combination I've found in
the wild...

I do note quite a bit of 

[  388.122202] sequence number glitch prev=94 curr=0
[  402.513709] sequence number glitch prev=12 curr=0
[  408.708148] sequence number glitch prev=3 curr=0
[  416.915221] sequence number glitch prev=11 curr=0
[  423.032992] sequence number glitch prev=5 curr=0
[  442.724830] sequence number glitch prev=4 curr=0
[  455.594228] sequence number glitch prev=9 curr=0
[  463.810701] sequence number glitch prev=3 curr=0
[  468.970895] sequence number glitch prev=6 curr=0

but assume this is likely to be some kind of modem bug? Interestingly,
the equivalent warning in drivers/net/usb/cdc_ncm.c never fires when
the modem is in USB mode.

Best wishes,

Chris.
