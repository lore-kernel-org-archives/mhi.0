Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016581F959
	for <mhi@lists.linux.dev>; Wed, 12 Jul 2023 12:24:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FEA4C433C8;
	Wed, 12 Jul 2023 12:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689164658;
	bh=Ynv5x4ojvzkObVOILzKFcJKueesdl+1bBjCEB2g6diM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q0klKloQ3jhBWuWa+wKdRaKF1rhi+jq/0yCpb7UiFIwTgVUEKpBfz6zyEBUPKY8eO
	 oHWrwEmHDmUauQK/UXrS4zBxS23+MWKlFQWOJMnqjFSFEi/8ke1UkovkGDm0x9M064
	 4IYoHuj9ccwVG8UjebNIbZe8fSQTIJgohnSQySDia546H188kbc4zOCGGphZ52Rplz
	 uZhMsOV4wRanMyCadzws2Vnf3G+3kgUdAdGMCzwYsqMPI3+1j/qIPwTlCzMm5mIidC
	 4nGONbtP0BlOCbbXXSzXSBJcFeysmy7eH1doH1fLMQu7RoupagA2QvJlGaL8ph7Wti
	 zbEqPkCvyLzhA==
Date: Wed, 12 Jul 2023 17:54:07 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Slark Xiao <slark_xiao@163.com>
Cc: loic.poulain@linaro.org, fabio.porcedda@gmail.com, bhelgaas@google.com,
	song.fc@gmail.com, duke_xinanwen@163.com, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Add support for Dell DW5932e
Message-ID: <20230712122407.GC102757@thinkpad>
References: <20230712083741.7615-1-slark_xiao@163.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230712083741.7615-1-slark_xiao@163.com>

On Wed, Jul 12, 2023 at 04:37:41PM +0800, Slark Xiao wrote:
> The DW5932e has 2 variants: eSIM(DW5932e-eSIM) and non-eSIM(DW5932e).
> Both of them are designed based on Qualcomm SDX62 and it will
> align with the Foxconn sdx65 settings.
> 
> Signed-off-by: Slark Xiao <slark_xiao@163.com>

One nit below but I will fix that while applying.

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

> ---
>  drivers/bus/mhi/host/pci_generic.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 9ca0dc3a3bfe..07172789b197 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -625,6 +625,12 @@ static const struct pci_device_id mhi_pci_id_table[] = {
>  	/* T99W510 (sdx24), variant 3 */
>  	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0f2),
>  		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx24_info },
> +	/* DW5932e-eSIM (sdx62), With eSIM */
> +	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0f5),
> +		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx65_info },
> +	/* DW5932e (sdx62), Non-eSIM*/

Space required before */

- Mani

> +	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0f9),
> +		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx65_info },
>  	/* MV31-W (Cinterion) */
>  	{ PCI_DEVICE(PCI_VENDOR_ID_THALES, 0x00b3),
>  		.driver_data = (kernel_ulong_t) &mhi_mv31_info },
> -- 
> 2.25.1
> 

-- 
மணிவண்ணன் சதாசிவம்
