Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0893412BEA7
	for <mhi@lists.linux.dev>; Mon, 26 Feb 2024 15:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708961285; cv=none; b=rh5bKqwsS4X2AOuaYIysNopAUSHfLd0aYBk9n/NnhVQ+zJx58tXUm+VnKlGKDeuLkuKSgW9ppP83u67u8k21FgKUSveeFPl2vjAKaaw4nqm0w7yOGGvhjr/W/l7relHBGg6ciPXzJ2oPy6yAhGyasrq8I0jj0jGLf1OB5Z65bMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708961285; c=relaxed/simple;
	bh=/zIqNEIiZgqgESqdwwv84VSZjlqukKlOFeK313xRY+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PP7H49sG8EhtUlBfWiMh5GsNakyaVxdXjKQqahaj+pxi1gtM0IsMgNqGd468+XO1fDHXRQiFxSTn5hOHwSMDvCSF82QzgNtBd03jPzkcog5aP4cO1UEXfZ0mLptBJIHtgpBUXs0EmT8r4xvfDupCX43xOeLWDON+iavaNkBp2DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AJdxxg0I; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AJdxxg0I"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-5d8b887bb0cso2438002a12.2
        for <mhi@lists.linux.dev>; Mon, 26 Feb 2024 07:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708961283; x=1709566083; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zUk/ORfZNSqc9ZCObPtK2ZClf11ZenkgiuTQii/H4vM=;
        b=AJdxxg0InDVjH34/hvj8kKNzwuVOTwwWumjt36UlbQepWcwxsyth346sQcagHyy5bn
         bd7ZHDT7I3+4SZGA61Yyg2Ajx8hyGyxRp3YxbF6fLxArJawuXUDfxmGS6cqNN6KjWv1n
         dGaFL3xm2bwSYGhCVb1/H9+hTDkChMN8xdD+a7EOTBzkz3ZJhit2lGL9HaWKXTBnQ4nN
         HrzgqFYxckZxeu7qXwtaMsABEjx57Yu79+idJpFWQUW94eH1BfHEp7tu25Wp2AuH34nP
         XUr30fvQsYmt95d4tZUKUGIY2pfa71IEvKv//1W6pCFEorARRN76m/Ab64l5pVFzbczt
         1Ssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708961283; x=1709566083;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zUk/ORfZNSqc9ZCObPtK2ZClf11ZenkgiuTQii/H4vM=;
        b=gMCq0HK90TBDWwKhbqZXJviEiWLXeiP/zOx1RZS+SNuQl+HB9gQQ4xMRQAKZ3uUK7p
         9zzw9/DFAvCq+kFZMnB4Wo5JDk410PGCWb8AWu9uLsJICLW8A7yDz5avMReWJw3SQA+H
         GMk3LxufR9XkoulLDLVQuCF+zKv+VBQehLypvebNf+7B5Y32qfezOYCUavToQJcAZpql
         tn/AiH1Jxaj4hcqKY7agTeFJ66HafwXmRk590KzKbSAwbWoBMCNKinuVQFHBZrhCnulj
         OEhNXsgDzKfY3cfn7pg8two+2+cZKEzfjD1ZbvLgocrCwUZwZ34hwmKtDioeH/t9EoYb
         bkkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNq1SUa08Qa7XIqYmSHiCoEMoJ3wj3+zJJJbnzqjsmCkX0BYF3MFjMXaNnQa30thf9S1Tvz7ItlpubAIuNl0q7XW2N
X-Gm-Message-State: AOJu0YxcgJ9QSH9xtUgBzNpgBViw5mOPMKFWzPPkXowkWu2Zbn0Hv6cR
	lHu6pP7zFEcw8Dv67y27ApGMKiTrkyOG/PrTQd4bgLi2Wm29Np0ZCPNwh8qFDw==
X-Google-Smtp-Source: AGHT+IFASf7wo/ZepyNEJ40sBxrik6uh3CI0+HCHyKlm+3jmHjdxgtw9uL5jNgpl+vxlzT6sDHAIBw==
X-Received: by 2002:a17:90a:fe0d:b0:29a:7f4f:c55a with SMTP id ck13-20020a17090afe0d00b0029a7f4fc55amr5377972pjb.7.1708961283129;
        Mon, 26 Feb 2024 07:28:03 -0800 (PST)
Received: from thinkpad ([117.202.184.81])
        by smtp.gmail.com with ESMTPSA id c13-20020a63da0d000000b005dcaa45d87esm4110876pgh.42.2024.02.26.07.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 07:28:02 -0800 (PST)
Date: Mon, 26 Feb 2024 20:57:57 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Serge Semin <fancer.lancer@gmail.com>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	mhi@lists.linux.dev
Subject: Re: [PATCH v3 1/5] PCI: dwc: Refactor dw_pcie_edma_find_chip() API
Message-ID: <20240226152757.GF8422@thinkpad>
References: <20240226-dw-hdma-v3-0-cfcb8171fc24@linaro.org>
 <20240226-dw-hdma-v3-1-cfcb8171fc24@linaro.org>
 <fielxplkgrvz5qmqrrq5ahmah5yqx7anjylrlcqyev2z2cl2wo@3ltyl242vkba>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fielxplkgrvz5qmqrrq5ahmah5yqx7anjylrlcqyev2z2cl2wo@3ltyl242vkba>

On Mon, Feb 26, 2024 at 03:45:16PM +0300, Serge Semin wrote:
> Hi Manivannan
> 
> On Mon, Feb 26, 2024 at 05:07:26PM +0530, Manivannan Sadhasivam wrote:
> > In order to add support for Hyper DMA (HDMA), let's refactor the existing
> > dw_pcie_edma_find_chip() API by moving the common code to separate
> > functions.
> > 
> > No functional change.
> > 
> > Suggested-by: Serge Semin <fancer.lancer@gmail.com>
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  drivers/pci/controller/dwc/pcie-designware.c | 52 +++++++++++++++++++++-------
> >  1 file changed, 39 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
> > index 250cf7f40b85..193fcd86cf93 100644
> > --- a/drivers/pci/controller/dwc/pcie-designware.c
> > +++ b/drivers/pci/controller/dwc/pcie-designware.c
> > @@ -880,7 +880,17 @@ static struct dw_edma_plat_ops dw_pcie_edma_ops = {
> >  	.irq_vector = dw_pcie_edma_irq_vector,
> >  };
> >  
> > -static int dw_pcie_edma_find_chip(struct dw_pcie *pci)
> > +static void dw_pcie_edma_init_data(struct dw_pcie *pci)
> > +{
> > +	pci->edma.dev = pci->dev;
> > +
> > +	if (!pci->edma.ops)
> > +		pci->edma.ops = &dw_pcie_edma_ops;
> > +
> > +	pci->edma.flags |= DW_EDMA_CHIP_LOCAL;
> > +}
> > +
> > +static int dw_pcie_edma_find_mf(struct dw_pcie *pci)
> >  {
> >  	u32 val;
> >  
> > @@ -900,24 +910,27 @@ static int dw_pcie_edma_find_chip(struct dw_pcie *pci)
> >  	else
> >  		val = dw_pcie_readl_dbi(pci, PCIE_DMA_VIEWPORT_BASE + PCIE_DMA_CTRL);
> > 
> 
> > -	if (val == 0xFFFFFFFF && pci->edma.reg_base) {
> > -		pci->edma.mf = EDMA_MF_EDMA_UNROLL;
> > -
> > -		val = dw_pcie_readl_dma(pci, PCIE_DMA_CTRL);
> > -	} else if (val != 0xFFFFFFFF) {
> > -		pci->edma.mf = EDMA_MF_EDMA_LEGACY;
> > +	/* Set default mapping format here and update it below if needed */
> > +	pci->edma.mf = EDMA_MF_EDMA_LEGACY;
> >  
> > +	if (val == 0xFFFFFFFF && pci->edma.reg_base)
> > +		pci->edma.mf = EDMA_MF_EDMA_UNROLL;
> > +	else if (val != 0xFFFFFFFF)
> >  		pci->edma.reg_base = pci->dbi_base + PCIE_DMA_VIEWPORT_BASE;
> > -	} else {
> > +	else
> >  		return -ENODEV;
> > -	}
> 
> Sorry for not posting my opinion about this earlier, but IMO v2 code
> was more correct than this one. This version makes the code being not
> linear as it was in v2, thus harder to comprehend:
> 
> 1. Setting up a default value and then overriding it or not makes the
> reader to keep in mind the initialized value which is harder than to
> just read what is done in the respective branch.
> 

No, I disagree. Whether we set the default value or not, EDMA_MF_EDMA_LEGACY is
indeed the default mapping format (this is one of the reasons why the enums
should start from 1 instead of 0). So initializing it to legacy is not changing
anything, rather making it explicit.

> 2. Splitting up the case clause with respective inits and the mapping
> format setting up also makes it harder to comprehend what's going on.
> In the legacy case the reg-base address and the mapping format init are
> split up while they should have been done simultaneously only if (val
> != 0xFFFFFFFF).
> 

Well again, this doesn't matter since the default mapping format is legacy. But
somewhat agree that the two clauses are setting different fields, but even if
the legacy mapping format is set inside the second clause, it still differs from
the first one since we are not setting reg_base.

> 3. The most of the current devices has the unrolled mapping (available
> since v4.9 IP-core), thus having the mf field pre-initialized produces
> a redundant store operation for the most of the modern devices.
> 

Ok, this one I agree. We could avoid the extra assignment.

> 4. Getting rid from the curly braces isn't something what should be
> avoided at any cost and doesn't give any optimization really. It
> doesn't cause having less C-lines of the source code and doesn't
> improve the code readability.
> 

Yeah, there is no benefit other than a simple view of the code. But for point
(3), I agree to roll back to v2 version.

> So to speak, I'd suggest to get back the v2 implementation here.
> 
> >  
> > -	pci->edma.dev = pci->dev;
> > +	return 0;
> > +}
> >  
> > -	if (!pci->edma.ops)
> > -		pci->edma.ops = &dw_pcie_edma_ops;
> > +static int dw_pcie_edma_find_channels(struct dw_pcie *pci)
> > +{
> > +	u32 val;
> >  
> > -	pci->edma.flags |= DW_EDMA_CHIP_LOCAL;
> 
> > +	if (pci->edma.mf == EDMA_MF_EDMA_LEGACY)
> > +		val = dw_pcie_readl_dbi(pci, PCIE_DMA_VIEWPORT_BASE + PCIE_DMA_CTRL);
> > +	else
> > +		val = dw_pcie_readl_dma(pci, PCIE_DMA_CTRL);
> 
> Just dw_pcie_readl_dma(pci, PCIE_DMA_CTRL)
> 

'val' is uninitialized. Why should the assignment be skipped?

- Mani

> -Serge(y)
> 
> >  
> >  	pci->edma.ll_wr_cnt = FIELD_GET(PCIE_DMA_NUM_WR_CHAN, val);
> >  	pci->edma.ll_rd_cnt = FIELD_GET(PCIE_DMA_NUM_RD_CHAN, val);
> > @@ -930,6 +943,19 @@ static int dw_pcie_edma_find_chip(struct dw_pcie *pci)
> >  	return 0;
> >  }
> >  
> > +static int dw_pcie_edma_find_chip(struct dw_pcie *pci)
> > +{
> > +	int ret;
> > +
> > +	dw_pcie_edma_init_data(pci);
> > +
> > +	ret = dw_pcie_edma_find_mf(pci);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return dw_pcie_edma_find_channels(pci);
> > +}
> > +
> >  static int dw_pcie_edma_irq_verify(struct dw_pcie *pci)
> >  {
> >  	struct platform_device *pdev = to_platform_device(pci->dev);
> > 
> > -- 
> > 2.25.1
> > 

-- 
மணிவண்ணன் சதாசிவம்
