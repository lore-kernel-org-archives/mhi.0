Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4003A60860
	for <mhi@lists.linux.dev>; Mon, 26 Feb 2024 12:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708952271; cv=none; b=XLN7HhKXyfgtxMFmQl06sVrYl5c1SWQlZEne0LZrBuaFtPlDKiDhwVxgG7J2iUAjB5P++QEUZikLIKdaVpei7X07mXNJ9l31tjt78xRebZustn0lljXeZYgcOLzqBUeWawqMMX8sNz4lEI7x+NjuGcJGRVK87jPQHlNjdHI0JTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708952271; c=relaxed/simple;
	bh=Mu6QlX+1l3Wib4QH76J5+NqbSv2MEuWWAtN2RdipG2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BMa6Smut3ZhSTB9LdktZ7kcMPusbHpjbQzM+w51FuKUoiRPVv/QSDanScKrlgEqG4yKtceMFucotYV3lVGQ00Hdyja7I79XUtF8mwyuY2QA27L1EX6LE29XO+Sy2jjN1krdwt1qZdxwbJrNB2A5o/gQgdba4HsDdWbmmCiehZUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lfYepV+h; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lfYepV+h"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2d180d6bd32so44585161fa.1
        for <mhi@lists.linux.dev>; Mon, 26 Feb 2024 04:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708952267; x=1709557067; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+sQQr+peYYEnOXswFiNkUeMsy99OfbYwShKLJaoetgw=;
        b=lfYepV+hJhj+JEgMXyurglKpKPawFFvCPhZ3LTEp/gQzudpksQp8Rkt7skKy0+k+5R
         pP4zl+zmdGYzX0R+2J/0gtz37g54e50DXurtTp5sViHt3MK4lhAgaUFIARNUO26M8caM
         z9ewkA6MZ4blInNmziqRyzqUvA6EuxNwN3kcm8Ijt6GVyZFXbQqeSY1xDBtvzcka8NeV
         AMFXjoJK1rLEtsAADbgwkrXsoSXmcXCy/QT+m5oiMrkCTXH4Jnd1RYXcw+FkNgfMufmd
         71UpDSbyLITqi3wwp4vQSW93ePxjD46PCmIKbG6rIRjVF2DNKPCrt5A0MjzFD0ca1dnW
         aSPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708952267; x=1709557067;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+sQQr+peYYEnOXswFiNkUeMsy99OfbYwShKLJaoetgw=;
        b=Y1zCzDIK3GnqOSl5TewflmnNsiI2/907kdSdJFc8LrlkX90DsauG9gRpmpXoshYAXC
         TpRj2pjxY9dweuyR2qWGCuyvuHTeg+lEjeOxR0KzhlxYiNZ/FDFcJ6GpUpDXIbxV4Doi
         v6bEgQ7VrJC59kX+H3OeB3wc70XJSPF8wEJxH3BuqA98w/sySD39Aad7s6H4naQTpHRk
         9ovVoHwDzNyq/Vjcb1yyLZRWnu7Dt7yPjEl3FOtToM1w+hTkNHO6fOX0YuYWu/5jhpQb
         eB0FCeC1WZe+0zHZb9p+8AltMuYEqXDsx3gzgYRLY8TOnIs8LspuwUrQ8tacE2HdvDdG
         kM1A==
X-Forwarded-Encrypted: i=1; AJvYcCVawrfMvTDCAI9BUwqMFrp18Rs4Is6yp1GkVhobDcf9fMw1EJA2rrZodLFszuYMIwbYSOz0RW5n1j/r6K+HWZ6QsBI8
X-Gm-Message-State: AOJu0YwXP8W/aJTzMN1XKNsqNNrT+CK5Gmv27nWpfKIUMpN1zQftBx3w
	OFnv4QxIvMscCmoYHOB+nMZYmIfoRkn3LzYlZrwB/hz6LKaf5jmN
X-Google-Smtp-Source: AGHT+IH01bL695F37LIi7aQmCdL0tH9LRnqeeFYoHunaSGK3uSfH+IXnTQI4amdnDxmU2/HEs8XT+A==
X-Received: by 2002:a2e:9b94:0:b0:2d2:4465:113e with SMTP id z20-20020a2e9b94000000b002d24465113emr4137164lji.20.1708952267164;
        Mon, 26 Feb 2024 04:57:47 -0800 (PST)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id e21-20020a2e9855000000b002d0b33c1571sm870921ljj.26.2024.02.26.04.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 04:57:46 -0800 (PST)
Date: Mon, 26 Feb 2024 15:57:44 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>, 
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev, Siddharth Vadapalli <s-vadapalli@ti.com>
Subject: Re: [PATCH v3 3/5] PCI: dwc: Pass the eDMA mapping format flag
 directly from glue drivers
Message-ID: <p5zdbyfkmea4fev4myvwrjd7zr7vfaeymwsg5rhodu2hqkwhra@cts5cgmvetza>
References: <20240226-dw-hdma-v3-0-cfcb8171fc24@linaro.org>
 <20240226-dw-hdma-v3-3-cfcb8171fc24@linaro.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240226-dw-hdma-v3-3-cfcb8171fc24@linaro.org>

On Mon, Feb 26, 2024 at 05:07:28PM +0530, Manivannan Sadhasivam wrote:
> Instead of maintaining a separate capability for glue drivers that cannot
> support auto detection of the eDMA mapping format, let's pass the mapping
> format directly from them.
> 
> This will simplify the code and also allow adding HDMA support that also
> doesn't support auto detection of mapping format.
> 
> Suggested-by: Serge Semin <fancer.lancer@gmail.com>
> Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

-Serge(y)

> ---
>  drivers/pci/controller/dwc/pcie-designware.c | 16 +++++++++-------
>  drivers/pci/controller/dwc/pcie-designware.h |  5 ++---
>  drivers/pci/controller/dwc/pcie-rcar-gen4.c  |  2 +-
>  3 files changed, 12 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
> index ce273c3c5421..3e90b9947a13 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.c
> +++ b/drivers/pci/controller/dwc/pcie-designware.c
> @@ -894,18 +894,20 @@ static int dw_pcie_edma_find_mf(struct dw_pcie *pci)
>  {
>  	u32 val;
>  
> +	/*
> +	 * Bail out finding the mapping format if it is already set by the glue
> +	 * driver. Also ensure that the edma.reg_base is pointing to a valid
> +	 * memory region.
> +	 */
> +	if (pci->edma.mf != EDMA_MF_EDMA_LEGACY)
> +		return pci->edma.reg_base ? 0 : -ENODEV;
> +
>  	/*
>  	 * Indirect eDMA CSRs access has been completely removed since v5.40a
>  	 * thus no space is now reserved for the eDMA channels viewport and
>  	 * former DMA CTRL register is no longer fixed to FFs.
> -	 *
> -	 * Note that Renesas R-Car S4-8's PCIe controllers for unknown reason
> -	 * have zeros in the eDMA CTRL register even though the HW-manual
> -	 * explicitly states there must FFs if the unrolled mapping is enabled.
> -	 * For such cases the low-level drivers are supposed to manually
> -	 * activate the unrolled mapping to bypass the auto-detection procedure.
>  	 */
> -	if (dw_pcie_ver_is_ge(pci, 540A) || dw_pcie_cap_is(pci, EDMA_UNROLL))
> +	if (dw_pcie_ver_is_ge(pci, 540A))
>  		val = 0xFFFFFFFF;
>  	else
>  		val = dw_pcie_readl_dbi(pci, PCIE_DMA_VIEWPORT_BASE + PCIE_DMA_CTRL);
> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> index 26dae4837462..995805279021 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -51,9 +51,8 @@
>  
>  /* DWC PCIe controller capabilities */
>  #define DW_PCIE_CAP_REQ_RES		0
> -#define DW_PCIE_CAP_EDMA_UNROLL		1
> -#define DW_PCIE_CAP_IATU_UNROLL		2
> -#define DW_PCIE_CAP_CDM_CHECK		3
> +#define DW_PCIE_CAP_IATU_UNROLL		1
> +#define DW_PCIE_CAP_CDM_CHECK		2
>  
>  #define dw_pcie_cap_is(_pci, _cap) \
>  	test_bit(DW_PCIE_CAP_ ## _cap, &(_pci)->caps)
> diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> index e9166619b1f9..3c535ef5ea91 100644
> --- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> @@ -255,7 +255,7 @@ static struct rcar_gen4_pcie *rcar_gen4_pcie_alloc(struct platform_device *pdev)
>  	rcar->dw.ops = &dw_pcie_ops;
>  	rcar->dw.dev = dev;
>  	rcar->pdev = pdev;
> -	dw_pcie_cap_set(&rcar->dw, EDMA_UNROLL);
> +	rcar->dw.edma.mf = EDMA_MF_EDMA_UNROLL;
>  	dw_pcie_cap_set(&rcar->dw, REQ_RES);
>  	platform_set_drvdata(pdev, rcar);
>  
> 
> -- 
> 2.25.1
> 
