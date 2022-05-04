Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1DFE2101
	for <mhi@lists.linux.dev>; Wed,  4 May 2022 07:26:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD2C0C385A5;
	Wed,  4 May 2022 07:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651649188;
	bh=JaSmcTVmdx/P8IUjgolCGvOpH/ML1P6nWDaNz2FPl+g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NgJk+TnwDnXmS1EOHnW7KYPW9dX/+zak8wF7ICbPfGKUfcL5xv2hU5XeYXxO8+mJp
	 xi4ii/KuxQP69wFGxcPuENp+iSv0M6MXGCDGqPVMwM5M7Kynbc2NfzT4dRYQrNLVqL
	 xwD34B3sYl/cGN9cfeXynL4gPckapzCbazouUGCDVce3ygCkz8ALeDhrW0Ml+68q9i
	 /BZMCvn28Cij/LVao89YWqPLT1hvswUqUd2XRV88dXntz3/961H9uLh9JaROuXcLH0
	 Fn7xa7Iqp1+GkzXkqflmNP3ZEDef1YvOAHIgIZvmpN8rjXj1vMJ/i2I48botd/RiWb
	 +1U0PThH+eZvQ==
Date: Wed, 4 May 2022 12:56:20 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Slark Xiao <slark_xiao@163.com>
Cc: quic_hemantk@quicinc.com, gregkh@linuxfoundation.org,
	loic.poulain@linaro.org, bbhatt@codeaurora.org,
	christophe.jaillet@wanadoo.fr, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] bus: mhi: host: Add support for Foxconn T99W373 and
 T99W368
Message-ID: <20220504072620.GA5446@thinkpad>
References: <20220503024349.4486-1-slark_xiao@163.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220503024349.4486-1-slark_xiao@163.com>

On Tue, May 03, 2022 at 10:43:49AM +0800, Slark Xiao wrote:
> Product's enumeration align with previous Foxconn
> SDX55, so T99W373(SDX62)/T99W368(SDX65) would use
>  the same config as Foxconn SDX55.
> Remove fw and edl for this new commit.
> 
> Signed-off-by: Slark Xiao <slark_xiao@163.com>
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

Applied to mhi-next!

Thanks,
Mani

> ---
>  drivers/bus/mhi/host/pci_generic.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 24c94c23d78b..6fbc5915ea36 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -371,6 +371,15 @@ static const struct mhi_pci_dev_info mhi_foxconn_sdx55_info = {
>  	.sideband_wake = false,
>  };
>  
> +static const struct mhi_pci_dev_info mhi_foxconn_sdx65_info = {
> +	.name = "foxconn-sdx65",
> +	.config = &modem_foxconn_sdx55_config,
> +	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> +	.dma_data_width = 32,
> +	.mru_default = 32768,
> +	.sideband_wake = false,
> +};
> +
>  static const struct mhi_channel_config mhi_mv3x_channels[] = {
>  	MHI_CHANNEL_CONFIG_UL(0, "LOOPBACK", 64, 0),
>  	MHI_CHANNEL_CONFIG_DL(1, "LOOPBACK", 64, 0),
> @@ -560,6 +569,12 @@ static const struct pci_device_id mhi_pci_id_table[] = {
>  	/* T99W175 (sdx55), Based on Qualcomm new baseline */
>  	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0bf),
>  		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
> +	/* T99W368 (sdx65) */
> +	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0d8),
> +		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx65_info },
> +	/* T99W373 (sdx62) */
> +	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0d9),
> +		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx65_info },
>  	/* MV31-W (Cinterion) */
>  	{ PCI_DEVICE(0x1269, 0x00b3),
>  		.driver_data = (kernel_ulong_t) &mhi_mv31_info },
> -- 
> 2.25.1
> 
