Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE4217D3
	for <mhi@lists.linux.dev>; Mon,  2 May 2022 11:13:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 928EDC385A4;
	Mon,  2 May 2022 11:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651489984;
	bh=LVvc84nVlY9n07NgSWctxdt6j6sFrE2jX7nSZjHeHqE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H5CJaEF5maF4knABWlF8dRuyfHlT+7ymEkuamWK9hkLYww11+uA9dMIeybhVMElgL
	 AbqtwxnVUGdG6aBpOytFdoKJzJWtX+tYuRVz+D1+Mnp5JDdsmPmz4ca8WyPpc05S7o
	 VP1oMWLhveQnXQ3R65u2BhrFmLuisrUoYabSAmZkk36w9txrD0F7NCyNAeeVj75jQ+
	 T4HFmBCheVDnHZUZBstO+kqnyXYONE3j3RKqQ2sxYogNhO1OMpx1flbEWu7V+YcIxX
	 bIBx8Kf7kLgwNsAi83uHwkll19CXM++UcJPjfqJIyy5zOqVsr5Bz9KkE4yj/NhWALI
	 wSHeprtRZWYHw==
Date: Mon, 2 May 2022 16:42:57 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Slark Xiao <slark_xiao@163.com>
Cc: hemantk@codeaurora.org, bbhatt@codeaurora.org,
	gregkh@linuxfoundation.org, loic.poulain@linaro.org,
	christophe.jaillet@wanadoo.fr, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, weiyongjun1@huawei.com
Subject: Re: [PATCH] bus: mhi: host: Add support for Foxconn T99W373 and
 T99W368
Message-ID: <20220502111257.GA98313@thinkpad>
References: <20220429104241.4074-1-slark_xiao@163.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220429104241.4074-1-slark_xiao@163.com>

On Fri, Apr 29, 2022 at 06:42:41PM +0800, Slark Xiao wrote:
> Product's enumeration align with previous Foxconn
> SDX55, so T99W373(SDX62)/T99W368(SDX65) would use
>  the same config as Foxconn SDX55.
> Remove fw and edl for this new commit.
> 
> Signed-off-by: Slark Xiao <slark_xiao@163.com>

This patch is not applying cleanly on top of mhi-next [1]. Please rebase and post
v2 with my Reviewed-by tag.

Thanks,
Mani

[1] https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git/log/?h=mhi-next

> ---
>  drivers/bus/mhi/host/pci_generic.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 9527b7d63840..efc57cd75cec 100644
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
>  static const struct mhi_channel_config mhi_mv31_channels[] = {
>  	MHI_CHANNEL_CONFIG_UL(0, "LOOPBACK", 64, 0),
>  	MHI_CHANNEL_CONFIG_DL(1, "LOOPBACK", 64, 0),
> @@ -472,6 +481,12 @@ static const struct pci_device_id mhi_pci_id_table[] = {
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
