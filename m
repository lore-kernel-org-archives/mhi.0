Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B204365
	for <mhi@lists.linux.dev>; Tue,  1 Nov 2022 04:45:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0281BC433C1;
	Tue,  1 Nov 2022 04:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1667277929;
	bh=7Tgw9cmj0X/gJHgDspc1Fx8Gx0C3tPIo/87cHLCWo0I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UVoFYYNvXUbe5hm+tNZ6oB3cxE/1fBZskqLiojb4VhHAcb6JOYCsxxlwlx9Rl1X2d
	 Ha+BUh1uEyf9loYaV6j9UOfzWs8uwrQOaJ+NFl+azuDcyijbhyhPRZATg17rCNe0kQ
	 IiVKsAM/J8hp8dCmMOcDobeizx2TF3erI+zGhHDE=
Date: Tue, 1 Nov 2022 05:46:19 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Slark Xiao <slark_xiao@163.com>
Cc: mani@kernel.org, quic_hemantk@quicinc.com, bhelgaas@google.com,
	loic.poulain@linaro.org, dnlplm@gmail.com, yonglin.tan@outlook.com,
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH v3] PCI: Add vendor ID for QUECTEL
Message-ID: <Y2Ckm79PgcTcVVne@kroah.com>
References: <20221101021052.7532-1-slark_xiao@163.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221101021052.7532-1-slark_xiao@163.com>

On Tue, Nov 01, 2022 at 10:10:52AM +0800, Slark Xiao wrote:
> n MHI driver, there are some companies' product still do not have their
> own PCI vendor macro. So we add it here to make the code neat. Ref ID
> could be found in link https://pcisig.com/membership/member-companies.
> 
> Signed-off-by: Slark Xiao <slark_xiao@163.com>
> ---
> v3: Separate different vendors into different patch.
> 
> v2: Update vendor ID to the right location sorted by numeric value.
> ---
>  drivers/bus/mhi/host/pci_generic.c | 6 +++---
>  include/linux/pci_ids.h            | 2 ++
>  2 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index caa4ce28cf9e..81ae9c49ce2a 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -555,11 +555,11 @@ static const struct pci_device_id mhi_pci_id_table[] = {
>  		.driver_data = (kernel_ulong_t) &mhi_telit_fn990_info },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0308),
>  		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx65_info },
> -	{ PCI_DEVICE(0x1eac, 0x1001), /* EM120R-GL (sdx24) */
> +	{ PCI_DEVICE(PCI_VENDOR_ID_QUECTEL, 0x1001), /* EM120R-GL (sdx24) */
>  		.driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
> -	{ PCI_DEVICE(0x1eac, 0x1002), /* EM160R-GL (sdx24) */
> +	{ PCI_DEVICE(PCI_VENDOR_ID_QUECTEL, 0x1002), /* EM160R-GL (sdx24) */
>  		.driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
> -	{ PCI_DEVICE(0x1eac, 0x2001), /* EM120R-GL for FCCL (sdx24) */
> +	{ PCI_DEVICE(PCI_VENDOR_ID_QUECTEL, 0x2001), /* EM120R-GL for FCCL (sdx24) */
>  		.driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
>  	/* T99W175 (sdx55), Both for eSIM and Non-eSIM */
>  	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0ab),
> diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
> index b362d90eb9b0..3c91461bcfe4 100644
> --- a/include/linux/pci_ids.h
> +++ b/include/linux/pci_ids.h
> @@ -2585,6 +2585,8 @@
>  #define PCI_VENDOR_ID_TEKRAM		0x1de1
>  #define PCI_DEVICE_ID_TEKRAM_DC290	0xdc29
>  
> +#define PCI_VENDOR_ID_QUECTEL		0x1eac

Why did you ignore the comment at the top of this file saying that new
entries are not needed to be added, especially for just one user?

thanks,

greg k-h
