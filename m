Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5438B54F82
	for <mhi@lists.linux.dev>; Tue, 27 Feb 2024 07:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709019944; cv=none; b=gVBd8sVRVcZoEKhzwYeTRKhD9x5xBhH/n6hz1rIeqgzZn034l2KDlfUC1oGNaqTFHTvxIDXtVe5jyrqBKaxTw2697WsO4s+rYb0NNkQEA1ifPjerqOpUglJcxT2/71xDwFSfiKFDFvfRSiraEtkEgWRNOt30r6MbM3nOLryoxcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709019944; c=relaxed/simple;
	bh=LHY1soh3TSDneqtCq2eVyxDXi8p5oUsCqKFJ1MDn28Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qpLdd4jOr+oTIMNUNcEG7gm+3KN8CTan4crBg+lFGnwogyw08QqS/IuLEBoK06GN4joDBtTHbWZAzyIB9yRwyqbcGJMs1CPKKF8YelOy+QZ8bRMU3FGSMgam+/FNtCjHkcapYHlAk9brRJPgokLAtKcWjgk+3udikBfrMciOomc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N0u6pfmO; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N0u6pfmO"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1dc09556599so34369485ad.1
        for <mhi@lists.linux.dev>; Mon, 26 Feb 2024 23:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709019942; x=1709624742; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vz+b24keEy8SKVGT/zsCqIzqYg8F8QonmdaHU6M1RMQ=;
        b=N0u6pfmODtvrOzWNmGrmdtxBAkS4hVm6We6i0WRzO3Mlm0icuLz7Yui7QrmaS08IoJ
         1J6eRWEhQZiEfiEseoJ+vOtrl7jETphUovXyLCqqYVgcIzdtheWkOE0vv2ML2VbZ6N37
         yoX2PVdW/zI/dmnrpkeXBkg5dgldbjzU00j/47l2u+qyhv0pcv+OcE+cPtgmSWNTQzrM
         FA6bzFYda1Zc5gDXYtgVg+qivXbqzybGJ8QLlJnE5jdKZNDd6+jfSzohdgsDE87qRCvy
         xkgRnnGxIVhenj0488g3Fn9L+U7LhqkubRMY4HdH5pPlN/GGtM0cgmoTgIusy1sbT3Gs
         Eogg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709019942; x=1709624742;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vz+b24keEy8SKVGT/zsCqIzqYg8F8QonmdaHU6M1RMQ=;
        b=DJEGG0GzuJt6HXnKHD+0xww1C+CX75xJsWsQZw9oW8vRUCZkJ98BOHV6ZWmtL59iMT
         2uKPMx6k5LVrx4sYa3J4dPNGSOn164dB64LdxLd2BcN8kmwqK4EYmM6LLRkgtniX+Eo6
         lYyUEqVW+oV+shlEKBnqUfqdjxQjf+A4BRwybZSs7c3ItVxP6uSQ+6eFjnd0OIUIeKYv
         eVYjLhIR+LXZ8pdTAlAqgqKwYdp95ZD/mrKWFrtOUyTzAp8zpf62KZXDomPOGXU9+P+t
         e9Bnto4VRfU2Ii3NHfNrQuNXrNlltiMdKdUaNDyk2TmNIvuqi5D8gSG+58fPL6CeVC+P
         hwtw==
X-Forwarded-Encrypted: i=1; AJvYcCWXkJSYd4khkyWvvyIc2qXFMaW7aMYKc4hI581qxz3VG+zj+Zatee5FwPMYPq2FqyogoCN5R7SYQnAh86LY/taCwVV6
X-Gm-Message-State: AOJu0YyHTG8C3Dg2lgJmIRLeK3+XtvEb1TNaxIXFC61qqOvZZIN1gyVs
	i9HUg9g+B6uj2B1Hi1ixv2s8QwGQrf0X0ly8EOxtgCb9dXv+TXsrLEpa8wUcZQ==
X-Google-Smtp-Source: AGHT+IGoPWkNE6JIjVJz1XqdnjAP9lGvBAm0VujbexvNFkLOg4OzNepoOaOycaMqUlL+eVesMoK8lA==
X-Received: by 2002:a17:902:db0e:b0:1dc:b77e:1973 with SMTP id m14-20020a170902db0e00b001dcb77e1973mr1593245plx.53.1709019941652;
        Mon, 26 Feb 2024 23:45:41 -0800 (PST)
Received: from thinkpad ([117.213.97.177])
        by smtp.gmail.com with ESMTPSA id l20-20020a170902e2d400b001d71729ec9csm884589plc.188.2024.02.26.23.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 23:45:41 -0800 (PST)
Date: Tue, 27 Feb 2024 13:15:33 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.li@nxp.com>
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
	linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
	Siddharth Vadapalli <s-vadapalli@ti.com>
Subject: Re: [PATCH v3 3/5] PCI: dwc: Pass the eDMA mapping format flag
 directly from glue drivers
Message-ID: <20240227074533.GH2587@thinkpad>
References: <20240226-dw-hdma-v3-0-cfcb8171fc24@linaro.org>
 <20240226-dw-hdma-v3-3-cfcb8171fc24@linaro.org>
 <Zdy8lVU6r+JO6OSJ@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zdy8lVU6r+JO6OSJ@lizhi-Precision-Tower-5810>

On Mon, Feb 26, 2024 at 11:30:13AM -0500, Frank Li wrote:
> On Mon, Feb 26, 2024 at 05:07:28PM +0530, Manivannan Sadhasivam wrote:
> > Instead of maintaining a separate capability for glue drivers that cannot
> > support auto detection of the eDMA mapping format, let's pass the mapping
> > format directly from them.
> 
> Sorry, what's mapping? is it register address layout?
> 

Memory map containing the register layout for iATU, DMA etc...

- Mani

> Frank
> 
> > 
> > This will simplify the code and also allow adding HDMA support that also
> > doesn't support auto detection of mapping format.
> > 
> > Suggested-by: Serge Semin <fancer.lancer@gmail.com>
> > Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  drivers/pci/controller/dwc/pcie-designware.c | 16 +++++++++-------
> >  drivers/pci/controller/dwc/pcie-designware.h |  5 ++---
> >  drivers/pci/controller/dwc/pcie-rcar-gen4.c  |  2 +-
> >  3 files changed, 12 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
> > index ce273c3c5421..3e90b9947a13 100644
> > --- a/drivers/pci/controller/dwc/pcie-designware.c
> > +++ b/drivers/pci/controller/dwc/pcie-designware.c
> > @@ -894,18 +894,20 @@ static int dw_pcie_edma_find_mf(struct dw_pcie *pci)
> >  {
> >  	u32 val;
> >  
> > +	/*
> > +	 * Bail out finding the mapping format if it is already set by the glue
> > +	 * driver. Also ensure that the edma.reg_base is pointing to a valid
> > +	 * memory region.
> > +	 */
> > +	if (pci->edma.mf != EDMA_MF_EDMA_LEGACY)
> > +		return pci->edma.reg_base ? 0 : -ENODEV;
> > +
> >  	/*
> >  	 * Indirect eDMA CSRs access has been completely removed since v5.40a
> >  	 * thus no space is now reserved for the eDMA channels viewport and
> >  	 * former DMA CTRL register is no longer fixed to FFs.
> > -	 *
> > -	 * Note that Renesas R-Car S4-8's PCIe controllers for unknown reason
> > -	 * have zeros in the eDMA CTRL register even though the HW-manual
> > -	 * explicitly states there must FFs if the unrolled mapping is enabled.
> > -	 * For such cases the low-level drivers are supposed to manually
> > -	 * activate the unrolled mapping to bypass the auto-detection procedure.
> >  	 */
> > -	if (dw_pcie_ver_is_ge(pci, 540A) || dw_pcie_cap_is(pci, EDMA_UNROLL))
> > +	if (dw_pcie_ver_is_ge(pci, 540A))
> >  		val = 0xFFFFFFFF;
> >  	else
> >  		val = dw_pcie_readl_dbi(pci, PCIE_DMA_VIEWPORT_BASE + PCIE_DMA_CTRL);
> > diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> > index 26dae4837462..995805279021 100644
> > --- a/drivers/pci/controller/dwc/pcie-designware.h
> > +++ b/drivers/pci/controller/dwc/pcie-designware.h
> > @@ -51,9 +51,8 @@
> >  
> >  /* DWC PCIe controller capabilities */
> >  #define DW_PCIE_CAP_REQ_RES		0
> > -#define DW_PCIE_CAP_EDMA_UNROLL		1
> > -#define DW_PCIE_CAP_IATU_UNROLL		2
> > -#define DW_PCIE_CAP_CDM_CHECK		3
> > +#define DW_PCIE_CAP_IATU_UNROLL		1
> > +#define DW_PCIE_CAP_CDM_CHECK		2
> >  
> >  #define dw_pcie_cap_is(_pci, _cap) \
> >  	test_bit(DW_PCIE_CAP_ ## _cap, &(_pci)->caps)
> > diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> > index e9166619b1f9..3c535ef5ea91 100644
> > --- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> > +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> > @@ -255,7 +255,7 @@ static struct rcar_gen4_pcie *rcar_gen4_pcie_alloc(struct platform_device *pdev)
> >  	rcar->dw.ops = &dw_pcie_ops;
> >  	rcar->dw.dev = dev;
> >  	rcar->pdev = pdev;
> > -	dw_pcie_cap_set(&rcar->dw, EDMA_UNROLL);
> > +	rcar->dw.edma.mf = EDMA_MF_EDMA_UNROLL;
> >  	dw_pcie_cap_set(&rcar->dw, REQ_RES);
> >  	platform_set_drvdata(pdev, rcar);
> >  
> > 
> > -- 
> > 2.25.1
> > 

-- 
மணிவண்ணன் சதாசிவம்
