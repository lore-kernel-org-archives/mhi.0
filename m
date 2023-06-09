Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5CF19907
	for <mhi@lists.linux.dev>; Fri,  9 Jun 2023 15:50:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BFA9C4339C;
	Fri,  9 Jun 2023 15:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686325821;
	bh=5w5b1lGyt+7thZ9+8s+QnKfndAO2UNpN5cwTTuTu32Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EjK7sByqsGckkLQFc7E/3JROzrZQiLaTvcNflvXp6OVgMV8jCoubAaSupY83Ro+/r
	 5OECz/IWXRVlJ+AhWqJRoHIzlf1VH3Fz79rYtmqO0ECU0JB2JmK34JKgaS5HgDz62a
	 KSDcWOv1MV4lPBFzv5L7+JieO7HkPJo7gwG1qg/7oGntHL936Xvdu7MDTaxfiQ0Gj9
	 s1T+rkj5iT5B9il0b28NXaZCUnZIU28FBqJGKJfuAmkpmciNQBHh591JIoDtzquq0/
	 vJksFdS+pkfuCj3P/rBemODykSzsJQ2MTzNuuoyPoWe8uK5Mcarl5DXIMWpeB7jJ2W
	 i4Vpp8HSaUeXg==
Date: Fri, 9 Jun 2023 21:20:13 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Damien Le Moal <dlemoal@kernel.org>, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 1/2] PCI: endpoint: Check correct variable in
 __pci_epf_mhi_alloc_map()
Message-ID: <20230609155013.GD6847@thinkpad>
References: <258e8de1-abff-4024-89e0-1c8df761d790@moroto.mountain>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <258e8de1-abff-4024-89e0-1c8df761d790@moroto.mountain>

On Fri, Jun 09, 2023 at 01:49:33PM +0300, Dan Carpenter wrote:
> This was intended to check "*vaddr" instead of "vaddr" (without an
> asterisk).
> 
> Fixes: 7db424a84d96 ("PCI: endpoint: Add PCI Endpoint function driver for MHI bus")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

> ---
>  drivers/pci/endpoint/functions/pci-epf-mhi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/endpoint/functions/pci-epf-mhi.c b/drivers/pci/endpoint/functions/pci-epf-mhi.c
> index 1227f059ea12..e7d64b9d12ff 100644
> --- a/drivers/pci/endpoint/functions/pci-epf-mhi.c
> +++ b/drivers/pci/endpoint/functions/pci-epf-mhi.c
> @@ -112,7 +112,7 @@ static int __pci_epf_mhi_alloc_map(struct mhi_ep_cntrl *mhi_cntrl, u64 pci_addr,
>  	int ret;
>  
>  	*vaddr = pci_epc_mem_alloc_addr(epc, paddr, size + offset);
> -	if (!vaddr)
> +	if (!*vaddr)
>  		return -ENOMEM;
>  
>  	ret = pci_epc_map_addr(epc, epf->func_no, epf->vfunc_no, *paddr,
> -- 
> 2.39.2
> 

-- 
மணிவண்ணன் சதாசிவம்
