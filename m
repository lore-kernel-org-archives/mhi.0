Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613AF2F3D
	for <mhi@lists.linux.dev>; Mon,  6 Nov 2023 05:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QnM/5iJp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82A41C433C7;
	Mon,  6 Nov 2023 05:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699249962;
	bh=bl1xXo3C8POmSGtm+2MyE1x6MgOvRgRefsalPDO1lUA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QnM/5iJpCXjxP/HZLt1GvHSy8mxyeNZkdrSWkDIHYQldtSvcZDbCFu2sWcxUnxjlz
	 u7dOj9C3WSY7k2qxQP2cKYzKMKzYnsl3BdM7g54Mq/aNDQbGjC0c5VMGSK1+vXdPqr
	 RhlyPwhHV2fPHD01ppT7O/Sq+iffxkfOajjer/DXN6jktiexQcOmHg43geIzggvWNS
	 M3asAjf8YoS9DYjS9ItPTMQJdnCZ7iFeOqebnmjg3DqUMcs9YjSk9ZQ0ovBGvIXfzY
	 RfwvKKPbvbkfpi+2W/t21m4c4DM1KibmPESDvgdn2Pm5teFJJA0QSO0jIxQfwkbFNQ
	 qNIOF1GloA6Kw==
Date: Mon, 6 Nov 2023 11:22:38 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: "Tyler J. Stachecki" <stachecki.tyler@gmail.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Add support for Sierra
 Wireless EM9291
Message-ID: <20231106055238.GE2474@thinkpad>
References: <20231105150510.96136-1-stachecki.tyler@gmail.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231105150510.96136-1-stachecki.tyler@gmail.com>

On Sun, Nov 05, 2023 at 10:05:10AM -0500, Tyler J. Stachecki wrote:
> Add support for the Sierra Wireless EM9291 modem.
> Empirically, it seems to use the same configuration as
> EM9191.
> 
> $ lspci -vv
> 03:00.0 Unassigned class [ff00]: Qualcomm Device 0308
>         Subsystem: Device 18d7:0301
> 
> Signed-off-by: Tyler J. Stachecki <stachecki.tyler@gmail.com>
> ---
>  drivers/bus/mhi/host/pci_generic.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 08f3f039dbdd..a9ac49a94832 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -503,6 +503,14 @@ static const struct mhi_pci_dev_info mhi_sierra_em919x_info = {
>  	.sideband_wake = false,
>  };
>  
> +static const struct mhi_pci_dev_info mhi_sierra_em929x_info = {
> +	.name = "sierra-em929x",
> +	.config = &modem_sierra_em919x_config,
> +	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> +	.dma_data_width = 32,
> +	.sideband_wake = false,
> +};
> +
>  static const struct mhi_channel_config mhi_telit_fn980_hw_v1_channels[] = {
>  	MHI_CHANNEL_CONFIG_UL(14, "QMI", 32, 0),
>  	MHI_CHANNEL_CONFIG_DL(15, "QMI", 32, 0),
> @@ -587,6 +595,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
>  	/* EM919x (sdx55), use the same vid:pid as qcom-sdx55m */
>  	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0306, 0x18d7, 0x0200),
>  		.driver_data = (kernel_ulong_t) &mhi_sierra_em919x_info },
> +	/* EM929x (sdx62), use the same vid:pid as qcom-sdx65m */

I'm confused about "sdx62" since the modem is using PID of SDX65. Typo?

> +	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, 0x18d7, 0x0301),
> +		.driver_data = (kernel_ulong_t) &mhi_sierra_em929x_info },

Please sort the entry as per the note above mhi_pci_id_table[].

- Mani

>  	/* Telit FN980 hardware revision v1 */
>  	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0306, 0x1C5D, 0x2000),
>  		.driver_data = (kernel_ulong_t) &mhi_telit_fn980_hw_v1_info },
> -- 
> 2.30.2
> 
> 

-- 
மணிவண்ணன் சதாசிவம்
