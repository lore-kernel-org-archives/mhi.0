Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE33039AF1
	for <mhi@lists.linux.dev>; Wed, 21 Feb 2024 05:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708493709; cv=none; b=cVto35iB5nRYkE7oo1RPzxfDNZ45pCZGPSTnpq/YIdVqIfXdEPfR/hyqEBvitUVq15Xxt/SqL9577BtR/FzxKRd1ZxAL/eWRfzmO5MrrX0JDN4CIHDcbNgENoq4Z6LXwHo8rL1vxMEp7LjBELWjmmUyyHpO40C5Zdwpt7MpGLEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708493709; c=relaxed/simple;
	bh=r6zgvcn+F+40CdvzpyLEB2jfR6JRjSoUZ4GE4rAhELg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aqkSGtgFJU0AhwSh/X70vb3LhcePDDKIq3gU4/Pe2Byx3DFlapNMg/G8IIDnUIaloGUxpue9OhHBrOQOY9SbNfLABEzN3DEvwKidyDHocy1A8NTTckb59xET2Mw2mAK/temm6L0x8XIbWwwUqLLuG+pUx7h6KYlUNCZjppyLwKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y5ZD4wTR; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y5ZD4wTR"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3bbbc6b4ed1so4660524b6e.2
        for <mhi@lists.linux.dev>; Tue, 20 Feb 2024 21:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708493706; x=1709098506; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1hhr4ArsjVqdB0DiyfSSELvRr7XQBdiTPeH39+KVLxE=;
        b=Y5ZD4wTRlblSNcuKnGPGMp3jaWc1BvFdzAHcNhjQkeBDrqjLfdTjABlBzQq31mE9oq
         3LfzcTkIwBW2DAZ/abfaBGtyXRT7qR27AS8CxpJCHAJ3zHlsp1WAVwHPgunHbtuDjUH6
         Hamufuq3FART6d6u26HQPw/LQOt0Hp1LWL6z4rmS8188NvaSlriuI+SAukl9vO4fyzbx
         GB1qJ8n26sD14Sw5lEhKTWST9+x9wQTKuHtynwJ3x3Bv355bR/D7YQ1mTrQRE64VtO5M
         a2H9MYHgR1Y2Ay5xqKgwoh+2NYCZGVZ8IK80otobIPEFWfVRRLLFPGuAs59HUGoFsvJt
         5BBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708493706; x=1709098506;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1hhr4ArsjVqdB0DiyfSSELvRr7XQBdiTPeH39+KVLxE=;
        b=aJfwU67+e6/4Vlo1IbPkcgk1sW4KIV+IaX7GbWeUyksf9dHPg6jxRd4SmbupxDtBGo
         6Imq8K0YtxLX2OlVgSo3mNFwHcziyi+I4yK22tbOH8zsuy+C0FA06STkJRR9g0+3IDcM
         JMktLeLtjae6gND6NyWP9zfBK+8MEHADujBZra3N7LYq8uWzi/ynTFxssKVXNDBEvpuB
         cvR/O7QtzZruEOMAEoOIBgI3o+8vlbgWl33rlDZ9DBD0CJUIYb1I3O3RtfeRp3LZ0TJx
         0AQh+ntWbpz/pPlAC4rpu+VX/qnNCqRNrnHroUTjNBVfdpc6wD1fzAHGqZDijr8H01Tj
         nIoA==
X-Forwarded-Encrypted: i=1; AJvYcCUK65UW5o9lXisW8CZDR8Hmf5/LYfvkh7n1x3SO11pG7Zicvo/HX2+NwNFyyTQXdfJVC/AQi9dBLTIfqWFR/gatQdqu
X-Gm-Message-State: AOJu0Yzu2Iu9fLd30NK/0BEcKqcUcFGrn1LEsQVZ7f1TLxphykha/DIh
	iAqkx7wLU5Gi8lq/sAlb8sbD6S1KFw1s2DsGWrJXXXNORf+A+CBxdIQ8hDfCrA==
X-Google-Smtp-Source: AGHT+IHfq+3NGWy3J5i374ZZPFpMwfNrL45PZq0YLZf5MA0T+86521iKgf5TclQFlYXI+9s2KYHMWQ==
X-Received: by 2002:a05:6808:190e:b0:3c0:3ae7:48fa with SMTP id bf14-20020a056808190e00b003c03ae748famr22256951oib.38.1708493706001;
        Tue, 20 Feb 2024 21:35:06 -0800 (PST)
Received: from thinkpad ([117.207.28.224])
        by smtp.gmail.com with ESMTPSA id fn16-20020a056a002fd000b006e3dfb2ef4esm6481314pfb.95.2024.02.20.21.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 21:35:05 -0800 (PST)
Date: Wed, 21 Feb 2024 11:04:57 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: Jingoo Han <jingoohan1@gmail.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Serge Semin <fancer.lancer@gmail.com>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev
Subject: Re: [PATCH v2 1/5] PCI: dwc: Refactor dw_pcie_edma_find_chip() API
Message-ID: <20240221053457.GC11693@thinkpad>
References: <20240216-dw-hdma-v2-0-b42329003f43@linaro.org>
 <20240216-dw-hdma-v2-1-b42329003f43@linaro.org>
 <70a2f29f-301d-40c6-bc37-abab35286caa@ti.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <70a2f29f-301d-40c6-bc37-abab35286caa@ti.com>

On Tue, Feb 20, 2024 at 05:41:41PM +0530, Siddharth Vadapalli wrote:
> On 24/02/16 11:04PM, Manivannan Sadhasivam wrote:
> > In order to add support for Hyper DMA (HDMA), let's refactor the existing
> > dw_pcie_edma_find_chip() API by moving the common code to separate
> > functions.
> > 
> > No functional change.
> > 
> > Suggested-by: Serge Semin <fancer.lancer@gmail.com>
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
> 
> Minor suggestion:
> 
> The above section prior to this patch was:
> 	if (val == 0xFFFFFFFF && pci->edma.reg_base) {
> 		pci->edma.mf = EDMA_MF_EDMA_UNROLL;
> 
> 		val = dw_pcie_readl_dma(pci, PCIE_DMA_CTRL);
> 	} else if (val != 0xFFFFFFFF) {
> 		pci->edma.mf = EDMA_MF_EDMA_LEGACY;
> 
> 		pci->edma.reg_base = pci->dbi_base + PCIE_DMA_VIEWPORT_BASE;
> 	} else {
> 		return -ENODEV;
> 	}
> 
> And this patch is removing the call to dw_pcie_readl_dma() in the "if"
> condition above. So the curly braces after this patch will only be
> present because of the "else if" statement. So is the following change a
> good idea?
> 

Yes indeed. Actually, EDMA_MF_EDMA_LEGACY is the default mapping format (because
its value is 0x0), but setting it explicitly would also make sense.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
