Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2675178266
	for <mhi@lists.linux.dev>; Tue, 12 Mar 2024 09:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710234264; cv=none; b=pIg0yyNpYwYSoxB1iPZpHE3ofW8ETtye6y32N6jidGrVGpdeO7rnVXhfuvPAxTyD+FSCthzwZBnx5tmpWUW1tpZKivHCAQQt7jGu9lv3MRoM3EnZt8tgTyzhCcJjbFu1WF7N6PZ0jPbYsS0Ciy90wlWdeUywBS8UY443S68DPWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710234264; c=relaxed/simple;
	bh=qdhaJZYzAfGiNZcY1AyLkSazWvntkfiFETQEFvh2LUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K9HXPNg9ws3DdXZSk+T3Mh3tdsyjysJCm8I99+XtZsDqwjy64i1cQUcHQYBChsCQaveW1Iagce8424DaTwUKgLT/z0H8e5MullVpmGNiWYk5bVsNSwpC9s2/44DHVqTFo82JsTcPAPtT+SFeDl5PSpR/xC0bEUiJhEZzAq1rAZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q1Yi8mUl; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q1Yi8mUl"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2d27184197cso68346801fa.1
        for <mhi@lists.linux.dev>; Tue, 12 Mar 2024 02:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710234261; x=1710839061; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h7rk9dzFLtOBBhT0DXPNQ6GEvnLtRWY6goiKR1vrVJs=;
        b=Q1Yi8mUleAX23WqrXYJraLYwLOLfdeFS81UBuM7hTbt9jx84zttK4Se6aRBo5hWMDX
         ytQ1Unw6OAm9e+sHLDyVMIMyq73JZszxcm0R1XiGlvljaUnCe/MKWxcf7gBSz1IgZCpX
         q4XzFragFSUr+X5byRK7Ct7vAjP7Q/fCi3FTr8XmWg3msoSoRGhy4IIKNoJ2yXM6QV7g
         maqWOL62yohh9/tj/KgXfQu3xNA7p9pKMFkYKa8AhUunKH4lOwICrVbPBYJ+8YBR14ZJ
         Xo7HaMIkvUgQH0RemhUYZ+eLpBNp7652bWcvNVV8kPef/hAgxby7W4V9YdV1wZcYXzOb
         qTZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710234261; x=1710839061;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h7rk9dzFLtOBBhT0DXPNQ6GEvnLtRWY6goiKR1vrVJs=;
        b=F3rejgY/lZSZ8uwgNh2Tpba16zIqXgISCNmQjl7QezY+/S+dA7It7S7yRGwtQ7LTFj
         XltpOTBVCq/MSxC4HjmnbYm7oSR5BfKTUeH3dAvIAf0+ZpJ7/0sTuZ10tIdhk/gtp3Wq
         oG4WnZMrOpWJ98H47q7xehtSXQmSapIS5t9LtFtCElosG9wJZ4XBluhxGSToiX2rAXg3
         ziY6rsYgj7UhxnMUye3nAxxoAa3BTw+KixWTSajzI0cUHvdjAT4SAgYWVaiyM5dj0thc
         Ad2cundjKLkMLjBKf2cMaImLyJ5nYyZgnFHOrYNx2Micl1s6zD8X+bPxSOYuYQAb6PE9
         yovg==
X-Forwarded-Encrypted: i=1; AJvYcCU1nfMhb4/0gY/ebaI09KGLEUQDfTs5Nbd9puvsREVVaqrscsZuzq0fpFvbY5q+q9HiKQVOjv622qv3ejizZG25t+Af
X-Gm-Message-State: AOJu0YxXkqbSUxbMvpNC9nV5IBs2qz3lFCzBZRuXBBD0mgPgvndIdBBp
	0a97sOEqw73laLzRnCIx93rzJjuZ6isfick2ssQ63B8zHP9Y9fJo
X-Google-Smtp-Source: AGHT+IHq5fMBsDl048RBn+pRrCOIdHvh26Fn3Ebv41AXt4kex74sIY36NhN7e05VM3Pbi21f/tWJ7Q==
X-Received: by 2002:a05:651c:141e:b0:2d3:3e83:8309 with SMTP id u30-20020a05651c141e00b002d33e838309mr4968298lje.19.1710234261019;
        Tue, 12 Mar 2024 02:04:21 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id q17-20020a2eb4b1000000b002d43dfc5d5csm804351ljm.7.2024.03.12.02.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 02:04:20 -0700 (PDT)
Date: Tue, 12 Mar 2024 12:04:17 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>, 
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev, Siddharth Vadapalli <s-vadapalli@ti.com>, 
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v4 1/5] PCI: dwc: Refactor dw_pcie_edma_find_chip() API
Message-ID: <flwmqlr3irjuwfqpjn227qnrkyyayym57d5v3ksr4xqmfxshaj@ibdi3dyetkou>
References: <20240306-dw-hdma-v4-0-9fed506e95be@linaro.org>
 <20240306-dw-hdma-v4-1-9fed506e95be@linaro.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240306-dw-hdma-v4-1-9fed506e95be@linaro.org>

Hi Mani

On Wed, Mar 06, 2024 at 03:51:57PM +0530, Manivannan Sadhasivam wrote:
> In order to add support for Hyper DMA (HDMA), let's refactor the existing
> dw_pcie_edma_find_chip() API by moving the common code to separate
> functions.
> 
> No functional change.
> 
> Suggested-by: Serge Semin <fancer.lancer@gmail.com>
> Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  drivers/pci/controller/dwc/pcie-designware.c | 40 +++++++++++++++++++++++-----
>  1 file changed, 33 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
> index 250cf7f40b85..3a26dfc5368f 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.c
> +++ b/drivers/pci/controller/dwc/pcie-designware.c
> @@ -880,7 +880,17 @@ static struct dw_edma_plat_ops dw_pcie_edma_ops = {
>  	.irq_vector = dw_pcie_edma_irq_vector,
>  };
>  
> -static int dw_pcie_edma_find_chip(struct dw_pcie *pci)
> +static void dw_pcie_edma_init_data(struct dw_pcie *pci)
> +{
> +	pci->edma.dev = pci->dev;
> +
> +	if (!pci->edma.ops)
> +		pci->edma.ops = &dw_pcie_edma_ops;
> +
> +	pci->edma.flags |= DW_EDMA_CHIP_LOCAL;
> +}
> +
> +static int dw_pcie_edma_find_mf(struct dw_pcie *pci)
>  {
>  	u32 val;
>  
> @@ -902,8 +912,6 @@ static int dw_pcie_edma_find_chip(struct dw_pcie *pci)
>  
>  	if (val == 0xFFFFFFFF && pci->edma.reg_base) {
>  		pci->edma.mf = EDMA_MF_EDMA_UNROLL;
> -
> -		val = dw_pcie_readl_dma(pci, PCIE_DMA_CTRL);
>  	} else if (val != 0xFFFFFFFF) {
>  		pci->edma.mf = EDMA_MF_EDMA_LEGACY;
>  
> @@ -912,12 +920,17 @@ static int dw_pcie_edma_find_chip(struct dw_pcie *pci)
>  		return -ENODEV;
>  	}
>  
> -	pci->edma.dev = pci->dev;
> +	return 0;
> +}
>  
> -	if (!pci->edma.ops)
> -		pci->edma.ops = &dw_pcie_edma_ops;
> +static int dw_pcie_edma_find_channels(struct dw_pcie *pci)
> +{
> +	u32 val;
>  

> -	pci->edma.flags |= DW_EDMA_CHIP_LOCAL;
> +	if (pci->edma.mf == EDMA_MF_EDMA_LEGACY)
> +		val = dw_pcie_readl_dbi(pci, PCIE_DMA_VIEWPORT_BASE + PCIE_DMA_CTRL);
> +	else
> +		val = dw_pcie_readl_dma(pci, PCIE_DMA_CTRL);

Once again:

On Tue, Feb 27, 2024 at 01:04:55PM +0530, Manivannan Sadhasivam wrote:
> On Tue, Feb 27, 2024 at 12:00:41AM +0300, Serge Semin wrote:
> > The entire
> > 
> > +	if (pci->edma.mf == EDMA_MF_EDMA_LEGACY)
> > +		val = dw_pcie_readl_dbi(pci, PCIE_DMA_VIEWPORT_BASE + PCIE_DMA_CTRL);
> > +	else
> > +		val = dw_pcie_readl_dma(pci, PCIE_DMA_CTRL);
> > 
> > can be replaced with a single line
> > 
> > +	val = dw_pcie_readl_dma(pci, PCIE_DMA_CTRL);
> > 
> > since in the legacy case (reg_base = PCIE_DMA_VIEWPORT_BASE) the
> > pci->edma.reg_base has been initialized by now.
> > 
> 
> Ah okay, got it!

-Serge(y)

>  
>  	pci->edma.ll_wr_cnt = FIELD_GET(PCIE_DMA_NUM_WR_CHAN, val);
>  	pci->edma.ll_rd_cnt = FIELD_GET(PCIE_DMA_NUM_RD_CHAN, val);
> @@ -930,6 +943,19 @@ static int dw_pcie_edma_find_chip(struct dw_pcie *pci)
>  	return 0;
>  }
>  
> +static int dw_pcie_edma_find_chip(struct dw_pcie *pci)
> +{
> +	int ret;
> +
> +	dw_pcie_edma_init_data(pci);
> +
> +	ret = dw_pcie_edma_find_mf(pci);
> +	if (ret)
> +		return ret;
> +
> +	return dw_pcie_edma_find_channels(pci);
> +}
> +
>  static int dw_pcie_edma_irq_verify(struct dw_pcie *pci)
>  {
>  	struct platform_device *pdev = to_platform_device(pci->dev);
> 
> -- 
> 2.25.1
> 
