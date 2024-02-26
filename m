Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406FFEC7
	for <mhi@lists.linux.dev>; Mon, 26 Feb 2024 12:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708952007; cv=none; b=KNgNGSCFSsdA7JihyQF/6avL7PFz90DYwAx0rxCFuaHaoRsSCSfxq/u/ORbKTHKx86mqOwdXibQmY1tkeCoNhAMrw27vJVompjCo3v5ex/WuUVG+byLTh2ws+JqobSjseaRBttlqI9QU8tYfJrAt8xrj8UraPEa/+uE9AIxh/Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708952007; c=relaxed/simple;
	bh=+9bFTdaZN0sNxaXlHrqrWk5lnAZUUQT7AZ/mmZL7Fvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rx7Ke1loZomMfAXInZ6rVxsBC3bxMe/afqPX7UOnBhoR/tru5bqr+iQW03Hu1YagMjYlrf25GoTBT0AZbOS0bXlKf0Uj5Elt0HP+4hDq/20vNrqZ5hZG8YdqoUPV9mFLwSNtL4HdBD2IjP2IPJolbaNS5DyNoqJW16wyr3IkdX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GKV57ahb; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GKV57ahb"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-51197ca63f5so4570581e87.1
        for <mhi@lists.linux.dev>; Mon, 26 Feb 2024 04:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708952003; x=1709556803; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=96ZM0BBE+jJXYNw871lXR/5rqt8HxgCfbVdQRkOIEUw=;
        b=GKV57ahbVRiWvMtHHNjXcBfSVVkKQHV/9fPkHpifS3PnngQ2gWmm4vorkEt3CtBBft
         v8w43rDvO3AJ8jRJSrOeQaOwRqgefjdG4mfJnOu9LfLovGx+0PrTi2bqwMH4i9HV8bdA
         gLogetrtpJR/Y5BVo/mYQS5MzCs6e0he08UB8RDuKTLh09FHN4XROmJJfmJRZRgfGMWM
         +Oo6iQlOKJyIatyMrQU4wt3cDapuoAtWM0wO/0kQ749ZX2UvauM3M5Fe8l+Y+cDT1Ype
         vt9Kr0vN6Adw9rXvYv21W8JVtoFFJLshDO1nkg3zXkpwqKpm24OhMT8cczDT7Mdm0e+T
         4Kkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708952003; x=1709556803;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=96ZM0BBE+jJXYNw871lXR/5rqt8HxgCfbVdQRkOIEUw=;
        b=IyZdfn7Ve8N5HFM+dmujfXQmye+5SGdBeTVtglI89/qIi1Xs08K253yXcGQFmrDWIn
         cHfCtGvp3H0YlHW0ednc9i9vobokPTOh9DNahs15J5VpmAp16Mv6h+rVRd9Yd/1F3tcu
         Fi6TllK8qyz2sfEVPqpHNdvJbj41SRJsAG5fU2rsyXfZOsDfMCBa3xm9vQ2CEx1PYBp/
         uC7p8jaCc0SB8qU1DWSZ4giU++qI41QaVl0AijOePrMxbN2CLgP85rRWLn96/S8exgsS
         cFPgGJWkbF6kYDgmYjWUroF9h6T1/ee6lH8cl2RgKLrrNBlKJOCgh/5blwZ6ISv5LIWd
         KASA==
X-Forwarded-Encrypted: i=1; AJvYcCWK7XGXTqALKLio4TMyaXPzIyBVbhh8SAa/MLzKbin7bS53asSNQH3rarH2ub4WI56HC+SMr+QJNitb9001Ar3R/uC+
X-Gm-Message-State: AOJu0YycTcilwAwauiYrNv6qJpKPMdS0cxh7cy7Js9bawCPHH2uheFtP
	MHMgfjNFJ+qYgJjwENX0yAEhrst1UDKkMzo/0ILKAaaxAUqiM6zY
X-Google-Smtp-Source: AGHT+IHUsdLyYMK/hor/+DIL9NkSQYxUsgFEj+2JqEvtgKE+O4rfAVV95OSAVAFGN0KoyPIWi302lw==
X-Received: by 2002:a05:6512:224b:b0:512:f7e3:2ca0 with SMTP id i11-20020a056512224b00b00512f7e32ca0mr3369529lfu.61.1708952003264;
        Mon, 26 Feb 2024 04:53:23 -0800 (PST)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id e21-20020a196915000000b00512ffb9bae9sm222505lfc.143.2024.02.26.04.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 04:53:22 -0800 (PST)
Date: Mon, 26 Feb 2024 15:53:20 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>, 
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev, Siddharth Vadapalli <s-vadapalli@ti.com>
Subject: Re: [PATCH v3 2/5] PCI: dwc: Skip finding eDMA channels count if
 glue drivers have passed them
Message-ID: <5gzkxdpx6u3jhw5twbncjhtozgekmlzxrpj3m6is3ijadm2svb@f6ng4owyakup>
References: <20240226-dw-hdma-v3-0-cfcb8171fc24@linaro.org>
 <20240226-dw-hdma-v3-2-cfcb8171fc24@linaro.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240226-dw-hdma-v3-2-cfcb8171fc24@linaro.org>

On Mon, Feb 26, 2024 at 05:07:27PM +0530, Manivannan Sadhasivam wrote:
> In the case of Hyper DMA (HDMA) present in DWC controllers, there is no way
> the drivers can auto detect the number of read/write channels as like its
> predecessor embedded DMA (eDMA). So the glue drivers making use of HDMA
> have to pass the channels count during probe.
> 
> To accommodate that, let's skip finding the channels if the channels count
> were already passed by glue drivers. If the channels count passed were
> wrong in any form, then the existing sanity check will catch it.
> 
> Suggested-by: Serge Semin <fancer.lancer@gmail.com>
> Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  drivers/pci/controller/dwc/pcie-designware.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
> index 193fcd86cf93..ce273c3c5421 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.c
> +++ b/drivers/pci/controller/dwc/pcie-designware.c
> @@ -927,13 +927,15 @@ static int dw_pcie_edma_find_channels(struct dw_pcie *pci)
>  {
>  	u32 val;
>  
> -	if (pci->edma.mf == EDMA_MF_EDMA_LEGACY)
> -		val = dw_pcie_readl_dbi(pci, PCIE_DMA_VIEWPORT_BASE + PCIE_DMA_CTRL);
> -	else
> -		val = dw_pcie_readl_dma(pci, PCIE_DMA_CTRL);
> -
> -	pci->edma.ll_wr_cnt = FIELD_GET(PCIE_DMA_NUM_WR_CHAN, val);
> -	pci->edma.ll_rd_cnt = FIELD_GET(PCIE_DMA_NUM_RD_CHAN, val);

> +	if (!pci->edma.ll_wr_cnt || !pci->edma.ll_rd_cnt) {

Are you sure that the partly initialized case should be considered as
a request for the auto-detection? IMO &&-ing here and letting the
sanity check to fail further would be more correct since thus the
developer would know about improper initialized data.

-Serge(y)

> +		if (pci->edma.mf == EDMA_MF_EDMA_LEGACY)
> +			val = dw_pcie_readl_dbi(pci, PCIE_DMA_VIEWPORT_BASE + PCIE_DMA_CTRL);
> +		else
> +			val = dw_pcie_readl_dma(pci, PCIE_DMA_CTRL);
> +
> +		pci->edma.ll_wr_cnt = FIELD_GET(PCIE_DMA_NUM_WR_CHAN, val);
> +		pci->edma.ll_rd_cnt = FIELD_GET(PCIE_DMA_NUM_RD_CHAN, val);
> +	}
>  
>  	/* Sanity check the channels count if the mapping was incorrect */
>  	if (!pci->edma.ll_wr_cnt || pci->edma.ll_wr_cnt > EDMA_MAX_WR_CH ||
> 
> -- 
> 2.25.1
> 
