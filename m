Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621CB200C7
	for <mhi@lists.linux.dev>; Mon, 18 Mar 2024 05:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710739751; cv=none; b=R5NJIMswUgN5S/gtcpwhZKHuWtXQuNzGA1jk14Vz0PSWpth70k17tYPc74hExb13KCF/6TbriYlA+W9nYzXcVwhG6ymH62ZSymyOKolBdGQXYNo5UJ3Egg+xZxI7OP2fUO4vd0zVALdfAY4S8WBtGXDCzwlG1NkQMb16qy3v7Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710739751; c=relaxed/simple;
	bh=mUtQaRoB5w1JR5t4g2/fqWtSD3Yp9K7/afA+Kz/dF9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=op/b24uUWCBMB3ihTvw3n72TNghmM7jwN0zG5l7St1Ukzhe5RMOJ0mnmsv4L//kZXHwp2Gd+k4ZWSqj36jHikQHV3QBrXrjk3agPpSNbhtRcW5OQiexVCkXxIqmsKXaJg7+QB2+JHge86wChLsLusmtYMnv3clQ7R875dkPGfzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZVOE2kTS; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZVOE2kTS"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3c38b719ab5so49156b6e.2
        for <mhi@lists.linux.dev>; Sun, 17 Mar 2024 22:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710739748; x=1711344548; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XwgA0qRybu1Pipes5bSoqBwD+flXuGSyS+IfuKrdceQ=;
        b=ZVOE2kTSa1hb9R9CZOo9eF9+Ued5yP7UmyHw1ZMacE1YX4Oz48qIRGeM0DLuZGgXIL
         HVt6I739GQcRCe3QRF2mHkumMKPF3RLv5zsDUVcPgM8UtXedmjOSttN//SqkDK9atJIU
         3f/MWfAlhc+ek7cKp5ACj5Wz0Ed5t/XaLjmhNrtpzwXvsOFo7MY7gZMcPHj8l+yYGPVK
         QjfoUwXRsqEu7v0BBIQKJidBAiE2s+JL0QDEC/TzBsVcIGkcso8UzoR9I/X8r6QKbEjY
         Rtp63Eofj7VmkQqCV/ZkgHdQ4L6YWmj7t9wE2dgCpz2U7arhTkBLKdgBGjtGUPFc+ySI
         YxbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710739748; x=1711344548;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XwgA0qRybu1Pipes5bSoqBwD+flXuGSyS+IfuKrdceQ=;
        b=LTH2xy+NCs263Jx+DCiLcEPxyG2DHosGwC2dyZVmldhlPCB7tC7Xvm24AjefnTmHv4
         00UsFnOJ+NSSJW8ZN8d0EhMrDfkWxszH/QyRZp6Hc6ifUSOvCqUmqX1Tew5XYJD0Z9bO
         Y8AX4eX6L92/ZcBh3ImzlZf8Jl/KSoU2P+r2e9SGXG8t/jhEKT3j2HmEJICO3M5Zf/uA
         saD8fOB86BLq/pC4BSo/fuBlY/cMqg0Jv/el32R0kcNNQ8JjC9d3emi9p22y3f7UTWc8
         phTWmYqf7njs+DEm5x9/MX7hWpVfwgRsruCTB8uG9NsG/OHRHRjxcukKap/8bLuB++PQ
         wD0A==
X-Forwarded-Encrypted: i=1; AJvYcCUfG3Sw6f7s4K+w5VZD1/kaRVUN2LBJ/yiTVeTzVHjXQz1dLWZXj/Oo35VP2qqjWi7j75JR8K51VgoTvJlqjdmNpb0j
X-Gm-Message-State: AOJu0YwqW5Gdpqa+5RRO3MHoLcWIZH0/O5zNkTnotk4vDkJebkXo5azR
	OppF02CPrFzOWZdB2tRonh9iu0C+DNKPLsOpwO8cMZE5bhD23yf9YG94FvTmWg==
X-Google-Smtp-Source: AGHT+IFXBqlwSWe79lImxbdZTCooxa6XPg74HV6RDustVdZBTvf62IKKJQGcctaUNpUMj4DgIr/wPw==
X-Received: by 2002:a05:6808:228b:b0:3c3:814a:fc6f with SMTP id bo11-20020a056808228b00b003c3814afc6fmr5300500oib.38.1710739748303;
        Sun, 17 Mar 2024 22:29:08 -0700 (PDT)
Received: from thinkpad ([103.246.195.160])
        by smtp.gmail.com with ESMTPSA id fe11-20020a056a002f0b00b006e537f3c487sm7019018pfb.127.2024.03.17.22.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Mar 2024 22:29:07 -0700 (PDT)
Date: Mon, 18 Mar 2024 10:59:02 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Serge Semin <fancer.lancer@gmail.com>
Cc: Jingoo Han <jingoohan1@gmail.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	mhi@lists.linux.dev, Siddharth Vadapalli <s-vadapalli@ti.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v4 1/5] PCI: dwc: Refactor dw_pcie_edma_find_chip() API
Message-ID: <20240318052902.GD2748@thinkpad>
References: <20240306-dw-hdma-v4-0-9fed506e95be@linaro.org>
 <20240306-dw-hdma-v4-1-9fed506e95be@linaro.org>
 <flwmqlr3irjuwfqpjn227qnrkyyayym57d5v3ksr4xqmfxshaj@ibdi3dyetkou>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <flwmqlr3irjuwfqpjn227qnrkyyayym57d5v3ksr4xqmfxshaj@ibdi3dyetkou>

On Tue, Mar 12, 2024 at 12:04:17PM +0300, Serge Semin wrote:
> Hi Mani
> 
> On Wed, Mar 06, 2024 at 03:51:57PM +0530, Manivannan Sadhasivam wrote:
> > In order to add support for Hyper DMA (HDMA), let's refactor the existing
> > dw_pcie_edma_find_chip() API by moving the common code to separate
> > functions.
> > 
> > No functional change.
> > 
> > Suggested-by: Serge Semin <fancer.lancer@gmail.com>
> > Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  drivers/pci/controller/dwc/pcie-designware.c | 40 +++++++++++++++++++++++-----
> >  1 file changed, 33 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
> > index 250cf7f40b85..3a26dfc5368f 100644
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
> > @@ -902,8 +912,6 @@ static int dw_pcie_edma_find_chip(struct dw_pcie *pci)
> >  
> >  	if (val == 0xFFFFFFFF && pci->edma.reg_base) {
> >  		pci->edma.mf = EDMA_MF_EDMA_UNROLL;
> > -
> > -		val = dw_pcie_readl_dma(pci, PCIE_DMA_CTRL);
> >  	} else if (val != 0xFFFFFFFF) {
> >  		pci->edma.mf = EDMA_MF_EDMA_LEGACY;
> >  
> > @@ -912,12 +920,17 @@ static int dw_pcie_edma_find_chip(struct dw_pcie *pci)
> >  		return -ENODEV;
> >  	}
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
> 
> > -	pci->edma.flags |= DW_EDMA_CHIP_LOCAL;
> > +	if (pci->edma.mf == EDMA_MF_EDMA_LEGACY)
> > +		val = dw_pcie_readl_dbi(pci, PCIE_DMA_VIEWPORT_BASE + PCIE_DMA_CTRL);
> > +	else
> > +		val = dw_pcie_readl_dma(pci, PCIE_DMA_CTRL);
> 
> Once again:
> 
> On Tue, Feb 27, 2024 at 01:04:55PM +0530, Manivannan Sadhasivam wrote:
> > On Tue, Feb 27, 2024 at 12:00:41AM +0300, Serge Semin wrote:
> > > The entire
> > > 
> > > +	if (pci->edma.mf == EDMA_MF_EDMA_LEGACY)
> > > +		val = dw_pcie_readl_dbi(pci, PCIE_DMA_VIEWPORT_BASE + PCIE_DMA_CTRL);
> > > +	else
> > > +		val = dw_pcie_readl_dma(pci, PCIE_DMA_CTRL);
> > > 
> > > can be replaced with a single line
> > > 
> > > +	val = dw_pcie_readl_dma(pci, PCIE_DMA_CTRL);
> > > 
> > > since in the legacy case (reg_base = PCIE_DMA_VIEWPORT_BASE) the
> > > pci->edma.reg_base has been initialized by now.
> > > 
> > 
> > Ah okay, got it!
> 

Sorry, I had this change but looks like it got lost during rebase somehow. Will
bring it back.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
