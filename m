Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6302D6FC3
	for <mhi@lists.linux.dev>; Thu,  3 Nov 2022 12:44:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C03DC433D6;
	Thu,  3 Nov 2022 12:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667479470;
	bh=oSmFexXYOdpULE/dmPKWUm8KrXy1fgFhkrLL8EKLOow=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q7GUIkWaLYGFgAsQ7QsapaIKjnqjvs4E4GMDIobM9jIxPUh7XWp4Ldc9cPIRVn3Js
	 ZJDahR9RMI6bQJ7KSZMpx8fWF1RA7/pCRktiOdZCELKso+ctU8s1dr1Ad8PC4KSUDL
	 QVyS1LcpGu2gNnBE0A/oEJDINNzccTlLG7Hm/zwfq7++NroIPbaUqLxWenR/wlOTVh
	 V90iWwBNRNHuz4UG1Kb7vnfj73eSKtk6wcg9ACF/F2i4y2NER3b5TU8jrSxGvQq76p
	 D971lO41GfcUc2wTBBCPC3AP3n14332hwCQRAvc3AVAHciyi87lQwiiyKlNEXyTxMP
	 zJ+xJSX9be0Pw==
Date: Thu, 3 Nov 2022 18:14:23 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Song Fuchang <song.fc@gmail.com>
Cc: mhi@lists.linux.dev, quic_hemantk@quicinc.com
Subject: Re: [PATCH v2] bus: mhi: host: pci_generic: Add HP variant of T99W175
Message-ID: <20221103124423.GG8434@thinkpad>
References: <c990bc1c-1acd-20d2-d6a8-6d202745ec8c@gmail.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c990bc1c-1acd-20d2-d6a8-6d202745ec8c@gmail.com>

On Tue, Nov 01, 2022 at 08:59:29PM +0800, Song Fuchang wrote:
> The Foxconn T99W175 modem has an HP variant, which has
> the following output from lspci:
> 
>   01:00.0 Wireless controller [0d40]: Device 03f0:0a6c
> 
> It also has some HP-specific serial numbers on the
> metal case. It works well with this driver, so add
> support for this to the pci_generic driver.
> 
> Signed-off-by: Song Fuchang <song.fc@gmail.com>

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

Thanks,
Mani

> ---
> 
> Changes in v2:
> 
>   - Add more detailed commit message.
> 
> 
>  drivers/bus/mhi/host/pci_generic.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c
> b/drivers/bus/mhi/host/pci_generic.c
> index 9e545f2a5a26..650e8b9c26ad 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -592,6 +592,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
>         /* MV32-WB (Cinterion) */
>         { PCI_DEVICE(0x1269, 0x00bb),
>                 .driver_data = (kernel_ulong_t) &mhi_mv32_info },
> +       /* T99W175 (sdx55), HP variant */
> +       { PCI_DEVICE(0x03f0, 0x0a6c),
> +               .driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
>         {  }
>  };
>  MODULE_DEVICE_TABLE(pci, mhi_pci_id_table);
> -- 
> 2.37.3
> 
> 

-- 
மணிவண்ணன் சதாசிவம்
