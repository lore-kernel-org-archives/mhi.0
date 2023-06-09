Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E0517757
	for <mhi@lists.linux.dev>; Fri,  9 Jun 2023 15:54:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C736EC433D2;
	Fri,  9 Jun 2023 15:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686326093;
	bh=1KbUY9Vhu1+io8eQ+reBgIq79Aw5VJ2eBzvHDIF9phA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C/j8+h4oq5sEEG/ginRUITJm1K7uHXN6Pr7N97iBaWJc3ORNykAdwuJ47DFoBSsQU
	 8elMTo/vLp4UxXehHJdeBRpA4h68R16zlE8FDztbfZT97+lSKcH6UuXwAgCkmrixEM
	 WLEZV1fIJ4u9x9WcaZ8bUsYrHzcjSq4zkthPwYMTgl6vGtu2NjbcMQkrtLfRaeSxjn
	 8gfc6+fKEKjNEKCe7FBoKfz/4mc69O8ObJp8sDBhIVsjXAfFiGmtMIB8hSVB2EDC8G
	 vPzS6eZJx+JViWlsLxfLp9MXDI3AooLQ7XI6yCaP1DN2oTIlaHIqnZKXa04/kdpX7M
	 c1SxXWPK537qA==
Date: Fri, 9 Jun 2023 21:24:44 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Damien Le Moal <dlemoal@kernel.org>, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 2/2] PCI: endpoint: Fix an IS_ERR() vs NULL bug
Message-ID: <20230609155444.GE6847@thinkpad>
References: <258e8de1-abff-4024-89e0-1c8df761d790@moroto.mountain>
 <ca14e566-d9b7-471d-b738-56dd697b1417@moroto.mountain>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ca14e566-d9b7-471d-b738-56dd697b1417@moroto.mountain>

On Fri, Jun 09, 2023 at 01:50:09PM +0300, Dan Carpenter wrote:
> The ioremap() function does not return error pointers, it returns NULL
> on error.
> 
> Fixes: 7db424a84d96 ("PCI: endpoint: Add PCI Endpoint function driver for MHI bus")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

> ---
>  drivers/pci/endpoint/functions/pci-epf-mhi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/endpoint/functions/pci-epf-mhi.c b/drivers/pci/endpoint/functions/pci-epf-mhi.c
> index e7d64b9d12ff..b45db923306b 100644
> --- a/drivers/pci/endpoint/functions/pci-epf-mhi.c
> +++ b/drivers/pci/endpoint/functions/pci-epf-mhi.c
> @@ -354,8 +354,8 @@ static int pci_epf_mhi_bind(struct pci_epf *epf)
>  	epf_mhi->mmio_size = resource_size(res);
>  
>  	epf_mhi->mmio = ioremap(epf_mhi->mmio_phys, epf_mhi->mmio_size);
> -	if (IS_ERR(epf_mhi->mmio))
> -		return PTR_ERR(epf_mhi->mmio);
> +	if (!epf_mhi->mmio)
> +		return -ENOMEM;
>  
>  	ret = platform_get_irq_byname(pdev, "doorbell");
>  	if (ret < 0) {
> -- 
> 2.39.2
> 

-- 
மணிவண்ணன் சதாசிவம்
