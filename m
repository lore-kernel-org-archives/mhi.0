Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6E83209
	for <mhi@lists.linux.dev>; Mon,  7 Nov 2022 12:40:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4F3DC433D6;
	Mon,  7 Nov 2022 12:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667824823;
	bh=li6ufvK2z+u69bwVRpYDKW747L83IGEGIo1VDx2JqQM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PVkg+rADMjhspvlF1Qrk8A2n//gEshiVm+T+u5GTESSPQu448XtsEHXTOU5IQTyiA
	 Ow2Nb/eSSrZBvkx278n3M5KjQ7UL6HxaY4/p1fAn+TEadHuU6UCXpsLEcN5RZj9eTx
	 JL/PgtiX3S0C8wCyW1hciMvk4mRjcPZStJ8/BYPHzfKvLsmdmEhV8qyjkhbyls9IWZ
	 1VrT214f9NycGQciRl4hBm0aMsgDjJbu3WpkOvvW720bVbjymHZ2D0B4QPmyyLd2Go
	 Q4uZFSiMtbGcznvqmnD9NByzG6P3znP86NdQU6XJjaqw6MHLviCIG8CSEJ/plnnHJA
	 7qYRN3tuSoClg==
Date: Mon, 7 Nov 2022 18:10:14 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Song Fuchang <song.fc@gmail.com>
Cc: mhi@lists.linux.dev
Subject: Re: [PATCH v2 RESEND] bus: mhi: host: pci_generic: Add HP variant of
 T99W175
Message-ID: <20221107124014.GF2220@thinkpad>
References: <27f52e68-1e0f-6ee3-d0e5-c2f6bb3a4f39@gmail.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <27f52e68-1e0f-6ee3-d0e5-c2f6bb3a4f39@gmail.com>

On Mon, Nov 07, 2022 at 08:22:29PM +0800, Song Fuchang wrote:
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

My Reviewed-by tag is missing.

I cannot still apply this patch to mhi-next. Please rebase on top of mhi-next
and resend:
https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git/log/?h=mhi-next

Thanks,
Mani

> ---
> 
> Changes in v2:
>  - Add more detailed commit message.
> 
> 
>  drivers/bus/mhi/host/pci_generic.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 9e545f2a5a26..650e8b9c26ad 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -592,6 +592,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
>      /* MV32-WB (Cinterion) */
>      { PCI_DEVICE(0x1269, 0x00bb),
>          .driver_data = (kernel_ulong_t) &mhi_mv32_info },
> +    /* T99W175 (sdx55), HP variant */
> +    { PCI_DEVICE(0x03f0, 0x0a6c),
> +        .driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
>      {  }
>  };
>  MODULE_DEVICE_TABLE(pci, mhi_pci_id_table);
> -- 
> 2.37.3
> 
> 
> 

-- 
மணிவண்ணன் சதாசிவம்
