Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002C62908
	for <mhi@lists.linux.dev>; Mon,  2 May 2022 14:48:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8DF5C385AC;
	Mon,  2 May 2022 14:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651502937;
	bh=9X9z5TvQoUjbxi6rKPmowVKgzDu6PM48zx9rvEJBf6Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nPsV/cQQBj0VbmXxqJWFWqyIVN0/CqEta8vfdFUaNFQA6ApmeUVimOePm/Op4eBuk
	 iM7Pwr2kMwbSSNURic4F5CnD7ojiRrosu2rP11Wv6CNK5eelIxa60cKLmTI8RnqOkC
	 ABDSAqiT/wUJmU3gqD07I9MKi9i0gQ+2lmyzxq/VwRHbdUcLPN087X+fzjtHnXS353
	 Eb/0Pnhe0NfHePCCOPWJHmmGcDbkm9Yds3fgWsMxzxK3GXiZeFll1LKWBl8Z+raqms
	 1NTxi6VZnah8f1jo3jZxIRHlvx6F4PQa6nqRRbNmzlqid7hz7q35iWAwXlrlP/yf19
	 +2bbv1+rJGEjw==
Date: Mon, 2 May 2022 20:18:51 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Daniele Palmas <dnlplm@gmail.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/1] bus: mhi: pci_generic: add Telit FN990
Message-ID: <20220502144851.GC98313@thinkpad>
References: <20220502112036.443618-1-dnlplm@gmail.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220502112036.443618-1-dnlplm@gmail.com>

On Mon, May 02, 2022 at 01:20:36PM +0200, Daniele Palmas wrote:
> Add Telit FN990:
> 
> 01:00.0 Unassigned class [ff00]: Qualcomm Device 0308
>         Subsystem: Device 1c5d:2010
> 
> Signed-off-by: Daniele Palmas <dnlplm@gmail.com>

Applied to mhi-next!

Thanks,
Mani

> ---
>  drivers/bus/mhi/host/pci_generic.c | 41 ++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index d0a7b5d3c01e..24c94c23d78b 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -489,6 +489,44 @@ static const struct mhi_pci_dev_info mhi_telit_fn980_hw_v1_info = {
>  	.sideband_wake = false,
>  };
>  
> +static const struct mhi_channel_config mhi_telit_fn990_channels[] = {
> +	MHI_CHANNEL_CONFIG_UL_SBL(2, "SAHARA", 32, 0),
> +	MHI_CHANNEL_CONFIG_DL_SBL(3, "SAHARA", 32, 0),
> +	MHI_CHANNEL_CONFIG_UL(4, "DIAG", 64, 1),
> +	MHI_CHANNEL_CONFIG_DL(5, "DIAG", 64, 1),
> +	MHI_CHANNEL_CONFIG_UL(12, "MBIM", 32, 0),
> +	MHI_CHANNEL_CONFIG_DL(13, "MBIM", 32, 0),
> +	MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
> +	MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
> +	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0_MBIM", 128, 2),
> +	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0_MBIM", 128, 3),
> +};
> +
> +static struct mhi_event_config mhi_telit_fn990_events[] = {
> +	MHI_EVENT_CONFIG_CTRL(0, 128),
> +	MHI_EVENT_CONFIG_DATA(1, 128),
> +	MHI_EVENT_CONFIG_HW_DATA(2, 1024, 100),
> +	MHI_EVENT_CONFIG_HW_DATA(3, 2048, 101)
> +};
> +
> +static const struct mhi_controller_config modem_telit_fn990_config = {
> +	.max_channels = 128,
> +	.timeout_ms = 20000,
> +	.num_channels = ARRAY_SIZE(mhi_telit_fn990_channels),
> +	.ch_cfg = mhi_telit_fn990_channels,
> +	.num_events = ARRAY_SIZE(mhi_telit_fn990_events),
> +	.event_cfg = mhi_telit_fn990_events,
> +};
> +
> +static const struct mhi_pci_dev_info mhi_telit_fn990_info = {
> +	.name = "telit-fn990",
> +	.config = &modem_telit_fn990_config,
> +	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> +	.dma_data_width = 32,
> +	.sideband_wake = false,
> +	.mru_default = 32768,
> +};
> +
>  /* Keep the list sorted based on the PID. New VID should be added as the last entry */
>  static const struct pci_device_id mhi_pci_id_table[] = {
>  	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0304),
> @@ -501,6 +539,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
>  		.driver_data = (kernel_ulong_t) &mhi_telit_fn980_hw_v1_info },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0306),
>  		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx55_info },
> +	/* Telit FN990 */
> +	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, 0x1c5d, 0x2010),
> +		.driver_data = (kernel_ulong_t) &mhi_telit_fn990_info },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0308),
>  		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx65_info },
>  	{ PCI_DEVICE(0x1eac, 0x1001), /* EM120R-GL (sdx24) */
> -- 
> 2.32.0
> 
