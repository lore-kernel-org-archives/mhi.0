Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3661B4223
	for <mhi@lists.linux.dev>; Fri,  3 Apr 2026 13:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775222051; cv=none; b=ht008LOqi6l0H9ZNCI185zRELo+IW4flhK97bsQ0A/NzKEFHgg29XgD2Nk9hPjIdfOE6bf6fwqn31HmAR3GJugseEvJOmwLt/wJA0mRWhS53OW/y2o7E4T8Ds8GrMzqf/MLRWc8kxDxW1C/L/xGPO6BxfiVTlHFKGE4YS2BrI+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775222051; c=relaxed/simple;
	bh=B3bdgX94szhtzQpdBV/DVMIQHTCXLMm3RxJ6k4uIzXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LzNCsHBtze9ozjryTBHjfIV48jGZyZzcvQQpqjuNg0J8sqiN2zd680OTlvcyiCl1uzkWgkZX0El7i7TJYQyHlxD/n6iBCiGMWczpku7mZbeJJ+1aoC1hxhtH3rCHlhadum3rFckTdVWFOd/Nth+LJD6NaIpjrI5btZu4KkrPReg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tU5PiOQl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tU5PiOQl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFE28C4CEF7;
	Fri,  3 Apr 2026 13:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775222051;
	bh=B3bdgX94szhtzQpdBV/DVMIQHTCXLMm3RxJ6k4uIzXs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tU5PiOQl7khMuo0G7PVYYco/+TT8NwRtJwjeQ2vs4vsX3tZtNAsrWKquvsKuSdmgi
	 Hb7D2LHF2S/U/sJVWUCKq2xfRc3mLoHjGnDOPQYyClEMBxO70AlbkrTBZ1emmgUtEQ
	 HcGuzUskHD8o6B6Fr5xUoan9k4ZnimtLEGOQyXpP1Gi2kJ8matytb6HXpvJ29hifiP
	 ZZdIuCmLO27XJG/MzHvu9LO8sKCMua9LAKfcHolw2MYQXzgk2xxjfDStnlZzwedCuu
	 HS0y3dBseWg1X/5zpYYr2lUlpi1bT17ORJcECafFju1+mv3WuAXs/A7qUh8M2POdHv
	 dD5AOvze4qmjQ==
Date: Fri, 3 Apr 2026 18:43:58 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Javier Achirica <jachirica@gmail.com>
Cc: mhi@lists.linux.dev
Subject: Re: bus: mhi: host: pci_generic: round up nr_irqs to a power of two
Message-ID: <yj2bgorh5m3ibxnk7p6o6mzlzka4xjlwjoefzliu4vdowoxd2m@tia3lbmqjeub>
References: <CACixm21PgogxqCRSWHOaj2J5VmSphCULi5Lz2nMbGp6zb32beg@mail.gmail.com>
 <CACixm21E8g-k73HpPMQm2AjEu=PDONe5t0XhAHu3kqUMkYkrLA@mail.gmail.com>
 <w2vvxje5kadmjoh4qxu77jarevqcue2d73lvje75yve7djnxu4@3v4lhwjep4rk>
 <CACixm23MW85ForXdy0k6D+iCZsW+MN9xTWs=xZ2ONkmQRvfqbA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACixm23MW85ForXdy0k6D+iCZsW+MN9xTWs=xZ2ONkmQRvfqbA@mail.gmail.com>

On Thu, Apr 02, 2026 at 07:22:32PM +0200, Javier Achirica wrote:
> On Thu, Apr 2, 2026 at 6:37 PM Manivannan Sadhasivam <mani@kernel.org> wrote:
> >
> > On Thu, Apr 02, 2026 at 04:44:21PM +0200, Javier Achirica wrote:
> > > Hello,
> > >
> > > I have an issue with a SDX55 modem in a TCL HH500V router, when trying
> > > to make it work under kernel 6.12.x (OpenWrt).
> > >
> > > It looks like when an MHI device uses standard MSI, the PCI core
> > > requires the allocated number of vectors to be a strict power of two.
> > >
> > > In this case, nr_irqs is 5, so the generated mask is wrong and it
> > > won't properly work.
> >
> > Can you please explain what do you mean by 'won't properly work'?
> 
> Since 6.12.58, gicv2m_irq_domain_alloc in
> drivers/irqchip/irq-gic-v2m.c looks like this:
> 
> ....
>         unsigned long align_mask = nr_irqs - 1;
> 
>         spin_lock(&v2m_lock);
>         list_for_each_entry(tmp, &v2m_nodes, entry) {
>                 unsigned long align_off = tmp->spi_start -
> (tmp->spi_start & ~align_mask);
> ....
> 
> If nr_irqs isn't a power of 2, align_mask won't be a proper mask (as
> ending in 0's), so align_off won't be the expected alignment offset
> and the interrupts won't be delivered properly.
> 
> In the specific case of nr_irqs = 5, align_mask will be 4 so
> ~align_mask will be 0xfffb instead of the expected 0xfff8.
> 

Ok, this driver is not doing roundup_pow_of_two() of nr_irqs as like gic-v3-its.

> > > It can be fixed by explicitly rounding up the
> > > requested IRQ count using `roundup_pow_of_two()` before passing it to
> > > `pci_alloc_irq_vectors()`.
> > >
> > > This patch, in 6.12.x tree, will fix it, but I'm not sure of the
> > > impact of it on newer kernels and if it's the right way of fixing it.
> > > Any tips on how to properly fix this issue?
> > >
> >
> > This change is correct on its own. You just need to apply it to v7.0-rc1 and
> > send it as proper patch to mhi@lists.linux.dev. TBH this version itself is fine.
> >
> > But I'm more curious about the issue you are facing as we never saw it, though
> > it is fundamentally wrong to request non-power-of-2 MSIs.
> 
> In the MHI PCI driver most of the devices request a non-power-of-2
> irqs (they request one per event plus an additional one), so this
> patch will fix that for all of them.
> 

Sure. In mainline, we also request PCI_IRQ_MSIX. But this power-of-2 limitation
only applies to MSI. So we will end up wasting a few extra vectors if MSI-X is
used. I guess that's fine for now. If we get a report that it leads to
exhaustion, then we will conditionally request power-of-2 just for MSIs.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
