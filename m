Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBF73F2111
	for <mhi@lists.linux.dev>; Thu,  2 Apr 2026 16:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775147875; cv=none; b=UKGy1iAXtQHhGNWycvpiz3j8eE1DSgzMDXfPlA7T/44ZFsuTBc3i+2LqvyvMCKsipugn1ZQ3lZKhWGygYOcj9MRpvdd+mzP+9AyHIVdswPrOPc0tC8yy88uHR4epoCrOp/BGRj1Tt/L+nxrux6GJytw5rlZt4GzlkIc7hKAPx+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775147875; c=relaxed/simple;
	bh=7Ivohn7B5lYd9xBIQLfVwi3eFRab+2666+E7fU55Hq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HHeYBKb4CRRJitXPfdHHBvWDbuCP4jIG2uAtz80gE7akw75H2QCOYCv5ALEaOuPzpcjl7Q2FqLDCTZRvSLaRgFwil2/eBm6zA37iR+KxE+qkTNIg3GhpGw9CEaoyxl0+1Xpt8EbrwdihTZt21gjlAkYeLgNe8/Y6iKI4/DVX/8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aI/Exqy1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aI/Exqy1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99BD5C116C6;
	Thu,  2 Apr 2026 16:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775147874;
	bh=7Ivohn7B5lYd9xBIQLfVwi3eFRab+2666+E7fU55Hq4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aI/Exqy1vhlbvRQ2ep+OTwt40zPo4YjBT2ZUh5NHyS2Y8FIwtntv2d7n+4t7irkpv
	 Gow/xxA3ZpHC1CmAJZ7GE1Es56E3712YVIgk/5zH/PIQwjdlrPIl1e3BzSUHfG2pu4
	 DG9YuGkpcFXd3i/SkV0EXv6EBLNGbZGGEXr3qspUqqd3esPyqdMIsn8XHkHCP02cxg
	 gyTUlgoUF1j3NfoRPDnHnzOGehQt1RrCYqn0ScgK3+KYLMyC+1DiOvJWzFGCtTZC3i
	 nVtmkskNYSKbSAo2QqJMw0Ai6xwtq+kavt8CSZhuS6Xw43sAr7ek8Ez0Wrdx2dG22I
	 MapbqK8ol2YDA==
Date: Thu, 2 Apr 2026 22:07:48 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Javier Achirica <jachirica@gmail.com>
Cc: mhi@lists.linux.dev
Subject: Re: bus: mhi: host: pci_generic: round up nr_irqs to a power of two
Message-ID: <w2vvxje5kadmjoh4qxu77jarevqcue2d73lvje75yve7djnxu4@3v4lhwjep4rk>
References: <CACixm21PgogxqCRSWHOaj2J5VmSphCULi5Lz2nMbGp6zb32beg@mail.gmail.com>
 <CACixm21E8g-k73HpPMQm2AjEu=PDONe5t0XhAHu3kqUMkYkrLA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACixm21E8g-k73HpPMQm2AjEu=PDONe5t0XhAHu3kqUMkYkrLA@mail.gmail.com>

On Thu, Apr 02, 2026 at 04:44:21PM +0200, Javier Achirica wrote:
> Hello,
> 
> I have an issue with a SDX55 modem in a TCL HH500V router, when trying
> to make it work under kernel 6.12.x (OpenWrt).
> 
> It looks like when an MHI device uses standard MSI, the PCI core
> requires the allocated number of vectors to be a strict power of two.
> 
> In this case, nr_irqs is 5, so the generated mask is wrong and it
> won't properly work.

Can you please explain what do you mean by 'won't properly work'?

> It can be fixed by explicitly rounding up the
> requested IRQ count using `roundup_pow_of_two()` before passing it to
> `pci_alloc_irq_vectors()`.
> 
> This patch, in 6.12.x tree, will fix it, but I'm not sure of the
> impact of it on newer kernels and if it's the right way of fixing it.
> Any tips on how to properly fix this issue?
> 

This change is correct on its own. You just need to apply it to v7.0-rc1 and
send it as proper patch to mhi@lists.linux.dev. TBH this version itself is fine.

But I'm more curious about the issue you are facing as we never saw it, though
it is fundamentally wrong to request non-power-of-2 MSIs.

- Mani

> Thanks!
> Javier
> 
> Signed-off-by: Javier Achirica <jachirica@gmail.com>
> ---
> diff --git a/drivers/bus/mhi/host/pci_generic.c
> b/drivers/bus/mhi/host/pci_generic.c
> --- a/drivers/bus/mhi/host/pci_generic.c        2026-02-19
> 16:29:56.000000000 +0100
> +++ b/drivers/bus/mhi/host/pci_generic.c        2026-03-29
> 13:14:17.053879617 +0200
> @@ -1014,7 +1014,7 @@
>          */
>         mhi_cntrl->nr_irqs = 1 + mhi_cntrl_config->num_events;
> 
> -       nr_vectors = pci_alloc_irq_vectors(pdev, 1,
> mhi_cntrl->nr_irqs, PCI_IRQ_MSI);
> +       nr_vectors = pci_alloc_irq_vectors(pdev, 1,
> roundup_pow_of_two(mhi_cntrl->nr_irqs), PCI_IRQ_MSI);
>         if (nr_vectors < 0) {
>                 dev_err(&pdev->dev, "Error allocating MSI vectors %d\n",
>                         nr_vectors);
> 

-- 
மணிவண்ணன் சதாசிவம்
