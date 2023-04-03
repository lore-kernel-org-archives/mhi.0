Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DA2364
	for <mhi@lists.linux.dev>; Mon,  3 Apr 2023 05:20:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 522DFC433D2;
	Mon,  3 Apr 2023 05:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680499228;
	bh=VO7ZTBlvGEHOHPdtxg5W/qEhh/9v1Pznmzk39ZuXRGk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IVRcmUTIxQhvE2DUpbbYkBUAoZwXtnehxq79P9rZ3iKWkAHBxVzCVwbNCobVdlaeR
	 2IUElUNED9T8ir/7WtgA18zAaQMX53sBbXjKWo6B0efYBzkIDe8yTjwxxyg3cFTqSL
	 6YBLTxUVFTLp5V9tI4byuOinRw3epNMzW69+CBhoQLbaYtV1Z+tjbPZabMjDa3RSKz
	 p6cUvt9QWbsPszvcI8y0v+cI8ddKoHyaz2n0PsG6d8xjiGt/p8h6mSmJRu2xP+AI/0
	 VLnCXk+DsCUJV7hWFLwSgZXeSpx2CjsOBgJCzXEb3CHLkb5mCkrtS27VtIot0XbIAr
	 KtlOMJ54h3pog==
Date: Mon, 3 Apr 2023 10:50:24 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Slark Xiao <slark_xiao@163.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: pci_generic: Add Foxconn T99W510
Message-ID: <20230403052024.GE4627@thinkpad>
References: <20230329072239.93632-1-slark_xiao@163.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230329072239.93632-1-slark_xiao@163.com>

On Wed, Mar 29, 2023 at 03:22:39PM +0800, Slark Xiao wrote:
> The Foxconn T99W510 device is designed based on Qualcomm
> SDX24. Add 3 variants for different potential customer.
> 
> Signed-off-by: Slark Xiao <slark_xiao@163.com>

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

> ---
>  drivers/bus/mhi/host/pci_generic.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 91d02f84ba21..db0a0b062d8e 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -363,6 +363,15 @@ static const struct mhi_controller_config modem_foxconn_sdx55_config = {
>  	.event_cfg = mhi_foxconn_sdx55_events,
>  };
>  
> +static const struct mhi_pci_dev_info mhi_foxconn_sdx24_info = {
> +	.name = "foxconn-sdx24",
> +	.config = &modem_foxconn_sdx55_config,
> +	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> +	.dma_data_width = 32,
> +	.mru_default = 32768,
> +	.sideband_wake = false,
> +};
> +
>  static const struct mhi_pci_dev_info mhi_foxconn_sdx55_info = {
>  	.name = "foxconn-sdx55",
>  	.fw = "qcom/sdx55m/sbl1.mbn",
> @@ -587,6 +596,15 @@ static const struct pci_device_id mhi_pci_id_table[] = {
>  	/* T99W373 (sdx62) */
>  	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0d9),
>  		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx65_info },
> +	/* T99W510 (sdx24), variant 1 */
> +	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0f0),
> +		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx24_info },
> +	/* T99W510 (sdx24), variant 2 */
> +	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0f1),
> +		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx24_info },
> +	/* T99W510 (sdx24), variant 3 */
> +	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0f2),
> +		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx24_info },
>  	/* MV31-W (Cinterion) */
>  	{ PCI_DEVICE(PCI_VENDOR_ID_THALES, 0x00b3),
>  		.driver_data = (kernel_ulong_t) &mhi_mv31_info },
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்
