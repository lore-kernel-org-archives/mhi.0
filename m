Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06977E
	for <mhi@lists.linux.dev>; Wed,  7 Sep 2022 08:06:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95CC3C433C1;
	Wed,  7 Sep 2022 08:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662537972;
	bh=sImJo0JiqLlOd41UYhSUOcQbzx4NPhs/auVbPIbzJAA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NklUppfh0XsQ7t54pYgu19OnZVwBGaAwwI8zic+yqern0NJ6y8py/p14B1JZHMap/
	 JI2ttqGAZHz1ccaAXajDcHF7Q4th23WDSB8cl8McRItzblMFiadRxOKqxhN+vGLjw1
	 YMO/cA4CAoR2N1jPQ7ctE7XqlPcSySbcLNA8Ud0q68TkfJRNJUr8np+r7cgLh6kRzW
	 HfXICBwNVFnf3HnF63rqREm9mF+uXHg+LSc/F1lkaHsQAZISnIPUHHQVlXbBz/fHXB
	 f21MZM1gtOIAWU89pvQRhsUqPx3o7LE7Y/jumH1e1DR16xVOflpneIEMNL+h57xNoH
	 q7Jw6A1JZ+lXw==
Date: Wed, 7 Sep 2022 13:36:03 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Koen Vandeputte <koen.vandeputte@citymesh.com>
Cc: mhi@lists.linux.dev
Subject: Re: [PATCH v2] bus: mhi: host: always print detected modem name
Message-ID: <20220907080603.GB22505@workstation>
References: <20220831100349.1488762-1-koen.vandeputte@citymesh.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220831100349.1488762-1-koen.vandeputte@citymesh.com>
User-Agent: Mutt/1.9.4 (2018-02-28)

On Wed, Aug 31, 2022 at 12:03:49PM +0200, Koen Vandeputte wrote:
> This harmless print provides a very easy way of knowing
> if the modem is detected properly during probing.
> 
> Promote it to an informational print so no hassle is required
> enabling kernel debugging info to obtain it.
> 
> The rationale here is that:
> On a lot of low-storage embedded devices, extensive kernel
> debugging info is not always present as this would
> increase it's size to much causing partition size issues.
> 
> Signed-off-by: Koen Vandeputte <koen.vandeputte@citymesh.com>

You have missed adding reviews of myself and Loic. I have added them while
applying but please preserve the tags from next time onwards.

Applied to mhi-next!

Thanks,
Mani

> ---
> 
> v2 -> sync SoB email with From
>  drivers/bus/mhi/host/pci_generic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 9e545f2a5a26..51e2b901bae0 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -841,7 +841,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  	struct mhi_controller *mhi_cntrl;
>  	int err;
>  
> -	dev_dbg(&pdev->dev, "MHI PCI device found: %s\n", info->name);
> +	dev_info(&pdev->dev, "MHI PCI device found: %s\n", info->name);
>  
>  	/* mhi_pdev.mhi_cntrl must be zero-initialized */
>  	mhi_pdev = devm_kzalloc(&pdev->dev, sizeof(*mhi_pdev), GFP_KERNEL);
> -- 
> 2.34.1
> 
> 
