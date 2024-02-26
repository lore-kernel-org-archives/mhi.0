Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F240B12BE82
	for <mhi@lists.linux.dev>; Mon, 26 Feb 2024 15:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708961424; cv=none; b=hgU2A4ciNlUvcc1zgx4WCSg/UAop0o4W/SlJLZP4G3BhqGmn7ZE2SGJCbUuLjnG4drlfVwl1caf95GPt9r6D2YsoGKKqectr7IXiB02hpVRmj+IzbjJf7IWLkw0Xi+fRk4uLZUlISSP7UlVkLRq4HSBmK3KqTHmJ9K0tUAQn96g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708961424; c=relaxed/simple;
	bh=oFEMIGef+CE6PLlxuRtHfu5D8EheQ9NXKbB1G1jvTgw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h1HJI5jG+BVu9DVH6dcJ3WdRA7/4slkihLvMzlnN6obLZ9c/W/ox1nhYNSMR6Jq1hCNRaatHhQuFjhUtu8Rl+wp/vab5z8tpwkMapmgc8VyTPw158YMqZI/Ls7c5p7qPy0jop9PwVd6DyUcjFHh7D2/Kg7Syxrh1ZVuDhYyc4k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zJ6cd/vb; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zJ6cd/vb"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-5dcc4076c13so2477386a12.0
        for <mhi@lists.linux.dev>; Mon, 26 Feb 2024 07:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708961421; x=1709566221; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nloYymieV56TsCLMArqRtZpx2dEpi1P4zJgPvO3bsZI=;
        b=zJ6cd/vbXjEoFwngwu9oy3kRxF8vC6vw/X8WfJ/KUaZwOswBdkmnkScZi+cEsVizFU
         xsTNQNI88ALD9RTzycoh27uylAxxIHjjoeFS4ZdvPv9XSOxC4htEZvLRmJ2OoIzANNAQ
         uYbA88U8Y5O0xxsAVecAR5OlPed92/ERCuLtN1M+dYkjxRgcZXzTlGJqXr1PdCKNr1eF
         aVvIu5zih810P6bK9ow4x55wzcBnaMcyu7Pfvb6I1tSDlL5a4r6dzhDZcEIWYQ7WVDh9
         wY9553ecVxHnPjvvEZvPe9UkxN8UWQXgVOAaNtFqpS0XwqiVhMBiC81Y5gaoLTfiIa22
         7zrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708961421; x=1709566221;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nloYymieV56TsCLMArqRtZpx2dEpi1P4zJgPvO3bsZI=;
        b=F6oT9nqz5vY2AOe0Fm2YDCUkU6vwqNgwEVOin0/nYdaptN21UAeqa44P5UgdqkjClg
         eM7LD82K+fpv69oPjQVEilfx/931rSK3IlVqi9KExfrZWzgpLDuAYKnq9l0ymw5Sqqyk
         xuvTzG4UoPKZ8+P7uTabg5b+LOMli4yhccle2bU+5WlR0kfmxf1EYqtMPgj56WXoL3cV
         +H8d7OQBITu3MZD1o7zEKwO68MKxV/KCocBG5rNW4EA2YXXwRf9kHER3VASPwqh8laam
         phIqM7PKvo4jAOhKNCvQ9SJjgXqFH3L6lq05d/CA8U9vlkSORlYarNwlco1jSGoHjgxM
         8tvw==
X-Forwarded-Encrypted: i=1; AJvYcCXe3Scvpfj8SpOSIjgcDZROCs55mJIKB3jjVJjgMcOc1cURscPDtzpwSokTrYG9dr2u9kwAVT6BJ4F0kOTQ/h5Kyl+b
X-Gm-Message-State: AOJu0YxBWIkny5P/qXy/Ck6FSlzwM280DqYkavSePVYYGLJEToj5T44g
	sUBTOeEB3+f0MV7MH50s/Z3t9HqR4JoojbChS4wNkNhBrF/ptDos+8nLEkxZVg==
X-Google-Smtp-Source: AGHT+IHBP2KQq2wlwcOVJTgkmJGQFKU/wQBEoc9dJwWSd4e5dH5JjnwXusBfF71v01BaIbPLTD8j5Q==
X-Received: by 2002:a17:902:ea0b:b0:1dc:7101:58c0 with SMTP id s11-20020a170902ea0b00b001dc710158c0mr10543808plg.22.1708961421157;
        Mon, 26 Feb 2024 07:30:21 -0800 (PST)
Received: from thinkpad ([117.202.184.81])
        by smtp.gmail.com with ESMTPSA id km6-20020a17090327c600b001dbae7b85b1sm4087272plb.237.2024.02.26.07.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 07:30:20 -0800 (PST)
Date: Mon, 26 Feb 2024 21:00:14 +0530
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
	mhi@lists.linux.dev, Siddharth Vadapalli <s-vadapalli@ti.com>
Subject: Re: [PATCH v3 2/5] PCI: dwc: Skip finding eDMA channels count if
 glue drivers have passed them
Message-ID: <20240226153014.GG8422@thinkpad>
References: <20240226-dw-hdma-v3-0-cfcb8171fc24@linaro.org>
 <20240226-dw-hdma-v3-2-cfcb8171fc24@linaro.org>
 <5gzkxdpx6u3jhw5twbncjhtozgekmlzxrpj3m6is3ijadm2svb@f6ng4owyakup>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5gzkxdpx6u3jhw5twbncjhtozgekmlzxrpj3m6is3ijadm2svb@f6ng4owyakup>

On Mon, Feb 26, 2024 at 03:53:20PM +0300, Serge Semin wrote:
> On Mon, Feb 26, 2024 at 05:07:27PM +0530, Manivannan Sadhasivam wrote:
> > In the case of Hyper DMA (HDMA) present in DWC controllers, there is no way
> > the drivers can auto detect the number of read/write channels as like its
> > predecessor embedded DMA (eDMA). So the glue drivers making use of HDMA
> > have to pass the channels count during probe.
> > 
> > To accommodate that, let's skip finding the channels if the channels count
> > were already passed by glue drivers. If the channels count passed were
> > wrong in any form, then the existing sanity check will catch it.
> > 
> > Suggested-by: Serge Semin <fancer.lancer@gmail.com>
> > Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  drivers/pci/controller/dwc/pcie-designware.c | 16 +++++++++-------
> >  1 file changed, 9 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
> > index 193fcd86cf93..ce273c3c5421 100644
> > --- a/drivers/pci/controller/dwc/pcie-designware.c
> > +++ b/drivers/pci/controller/dwc/pcie-designware.c
> > @@ -927,13 +927,15 @@ static int dw_pcie_edma_find_channels(struct dw_pcie *pci)
> >  {
> >  	u32 val;
> >  
> > -	if (pci->edma.mf == EDMA_MF_EDMA_LEGACY)
> > -		val = dw_pcie_readl_dbi(pci, PCIE_DMA_VIEWPORT_BASE + PCIE_DMA_CTRL);
> > -	else
> > -		val = dw_pcie_readl_dma(pci, PCIE_DMA_CTRL);
> > -
> > -	pci->edma.ll_wr_cnt = FIELD_GET(PCIE_DMA_NUM_WR_CHAN, val);
> > -	pci->edma.ll_rd_cnt = FIELD_GET(PCIE_DMA_NUM_RD_CHAN, val);
> 
> > +	if (!pci->edma.ll_wr_cnt || !pci->edma.ll_rd_cnt) {
> 
> Are you sure that the partly initialized case should be considered as
> a request for the auto-detection? IMO &&-ing here and letting the
> sanity check to fail further would be more correct since thus the
> developer would know about improper initialized data.
> 

We already have the check below. So the partly initialized case will fail
anyway.

- Mani

> -Serge(y)
> 
> > +		if (pci->edma.mf == EDMA_MF_EDMA_LEGACY)
> > +			val = dw_pcie_readl_dbi(pci, PCIE_DMA_VIEWPORT_BASE + PCIE_DMA_CTRL);
> > +		else
> > +			val = dw_pcie_readl_dma(pci, PCIE_DMA_CTRL);
> > +
> > +		pci->edma.ll_wr_cnt = FIELD_GET(PCIE_DMA_NUM_WR_CHAN, val);
> > +		pci->edma.ll_rd_cnt = FIELD_GET(PCIE_DMA_NUM_RD_CHAN, val);
> > +	}
> >  
> >  	/* Sanity check the channels count if the mapping was incorrect */
> >  	if (!pci->edma.ll_wr_cnt || pci->edma.ll_wr_cnt > EDMA_MAX_WR_CH ||
> > 
> > -- 
> > 2.25.1
> > 

-- 
மணிவண்ணன் சதாசிவம்
