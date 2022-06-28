Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333A2367
	for <mhi@lists.linux.dev>; Tue, 28 Jun 2022 06:28:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCD2FC3411D;
	Tue, 28 Jun 2022 06:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656397718;
	bh=Vy0GziIPpq894+tq94uKIFEgfuZdympsxpYcHvbf2g0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dM3rWCMgqh8lBMYBzMUbuCxkpq03n+8sEhax4f8bTC/XeT1Fvz5ZC4cvMdjv3uSoT
	 Fnuh30WhgwF0PZY6rmhxheLnzXqPEPar7jzrkR2GrbCfSZx53c7wxqoqbHNSHNxIP7
	 Mmz5WqNskMGUM07KprfUB0Yr+GnI8MeL2YMdy2yiw/Scob4A0UVYkw58gCq31+YdiP
	 SqWRhVfTYxNdYkrKrwRPgqealHIWaa7UivoNDGOe+bQIv8y7GuUBRt1KOfgCRWUYwH
	 VkimCDDBJs6c/+iMEhKEmE/gZUxp63uqbig26Ejf+CS464VyKipC4pVNz95rhqXT/0
	 nFImOWjM3N1mw==
Date: Tue, 28 Jun 2022 11:58:32 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Hemant Kumar <quic_hemantk@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Loic Poulain <loic.poulain@linaro.org>, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Add another Foxconn T99W175
Message-ID: <20220628062832.GA23601@thinkpad>
References: <20220627170717.2252335-1-bjorn.andersson@linaro.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220627170717.2252335-1-bjorn.andersson@linaro.org>

On Mon, Jun 27, 2022 at 10:07:17AM -0700, Bjorn Andersson wrote:
> The Foxconn e0c3 device identifies itself as a T99W175 X55, add support
> for this to the pci_generic driver.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/host/pci_generic.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 57d5f611a979..bf82d90f9ca9 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -571,6 +571,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
>  	/* T99W175 (sdx55), Based on Qualcomm new baseline */
>  	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0bf),
>  		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
> +	/* T99W175 (sdx55) */
> +	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0c3),
> +		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
>  	/* T99W368 (sdx65) */
>  	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0d8),
>  		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx65_info },
> -- 
> 2.35.1
> 

-- 
மணிவண்ணன் சதாசிவம்
