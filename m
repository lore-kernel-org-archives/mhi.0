Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71EFF364
	for <mhi@lists.linux.dev>; Mon,  3 Apr 2023 05:29:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F1ADC433EF;
	Mon,  3 Apr 2023 05:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680499762;
	bh=JDA0OtH0qHJu4hViqr5F50A+bkk+3qHS9Ly288MpcSQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VefkHkJY0f9vLiHpbsnBY7SIYn2j8CmZx4ROSWOzHK4KVJbqrfbrGEEkODINBHI7I
	 lGhSOr1VekjW3OMriIogDhUXIY8aViggv7VvT20t+K1sJqS+Zq9AjMvSJSnOsDtVP4
	 CZ+VkXzEoWM18BSqoAYwGHixD5fEoT6/bGWHTI69BaxJfXHAbYWYTjHIuJAQNjO6IP
	 LdgOXxtWF9dDxPl1C+IIZUbIhT8ennzptB7fZCZ1Djqa/m8nc1xF35Lf7oyD58hFma
	 SfquzAs0JOmyh2T2KkJPt/pU+QD49uE5hYghcLhulvTYyVIc3qp2xjuBf+bLa7prj6
	 4PyRjhK37x66g==
Date: Mon, 3 Apr 2023 10:59:15 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Duke =?utf-8?B?WGluKOi+m+WuieaWhyk=?= <duke_xinanwen@163.com>
Cc: slark_xiao@163.com, loic.poulain@linaro.org, gregkh@linuxfoundation.org,
	dnlplm@gmail.com, yonglin.tan@outlook.com, fabio.porcedda@gmail.com,
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	inux-kernel@vger.kernel.org, jerry.meng@quectel.com,
	duke.xin@quectel.com
Subject: Re: [PATCH v3] bus: mhi: host: pci_generic: Add support for Quectel
 RM520N-GL modem
Message-ID: <20230403052915.GG4627@thinkpad>
References: <20230128024754.2562-1-duke_xinanwen@163.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230128024754.2562-1-duke_xinanwen@163.com>

On Fri, Jan 27, 2023 at 06:47:54PM -0800, Duke Xin(辛安文) wrote:
> The project is based on Qualcomm's sdx6x chips for laptop,so the mhi interface definition and
> enumeration align with previous Quectel sdx24 configuration
> 

The term "project" doesn't make sense here. It should be a "product", right?

Also, the length of the commit message should not exceed 75 characters as per
kernel coding style. Please run checkpatch script on the commit as below before
sending:

scripts/checkpatch.pl --git HEAD

> Signed-off-by: Duke Xin(辛安文) <duke_xinanwen@163.com>
> ---

This patch is of version 3 but you don't include any changelog here to let us
know what has changed since v1.

>  drivers/bus/mhi/host/pci_generic.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index f39657f71483..416dabe2c282 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -335,6 +335,16 @@ static const struct mhi_pci_dev_info mhi_quectel_em1xx_info = {
>  	.sideband_wake = true,
>  };
>  
> +static const struct mhi_pci_dev_info mhi_quectel_rm5xx_info = {
> +	.name = "quectel-rm5xx",
> +	.edl = "qcom/prog_firehose_sdx6x.elf",
> +	.config = &modem_quectel_em1xx_config,
> +	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> +	.dma_data_width = 32,
> +	.mru_default = 32768,
> +	.sideband_wake = true,
> +};
> +
>  static const struct mhi_channel_config mhi_foxconn_sdx55_channels[] = {
>  	MHI_CHANNEL_CONFIG_UL(0, "LOOPBACK", 32, 0),
>  	MHI_CHANNEL_CONFIG_DL(1, "LOOPBACK", 32, 0),
> @@ -569,6 +579,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
>  		.driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_QUECTEL, 0x2001), /* EM120R-GL for FCCL (sdx24) */
>  		.driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
> +	/* RM520N-GL (sdx6x), eSIM Project */
> +	{ PCI_DEVICE(PCI_VENDOR_ID_QUECTEL, 0x1004),

During previous version, I asked you to sort this entry as per the ascending
order of PCI IDs i.e., before 0x2001 but you still have it here :/

- Mani

> +		.driver_data = (kernel_ulong_t) &mhi_quectel_rm5xx_info },
>  	/* T99W175 (sdx55), Both for eSIM and Non-eSIM */
>  	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0ab),
>  		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
> -- 
> 2.25.1
> 

-- 
மணிவண்ணன் சதாசிவம்
