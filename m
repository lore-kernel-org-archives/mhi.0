Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27BF51CD13
	for <mhi@lists.linux.dev>; Tue, 19 Mar 2024 11:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710848538; cv=none; b=eh1CdiHCLXjukXbWTp/PfcOCXGBnJgbPRO9Gg9pbyssrCsJ36QCcm6N7Lq1izDEsYOCTIo9nXgJSccaGyDAYRLKaAKeLDAE1o7wnPRmWNGFJ5DyRt9ODWGWpyOL1udqObM0mEwJR3+TM756rANqmv28bn+hgdHLVattvNbKeGq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710848538; c=relaxed/simple;
	bh=9mj4fImnckfhMvuhi27/rW5wPV2VrOkxeaCKbPhYXm4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X1m7J4WI6OXU7UkR0axb+RtNGyKNZX2xr92KZjol+HlZnM6PupDhWXqVYluWj9lQIpJgHKrOzTaxJjkn3lmEESVg/KUGZDg63i3LbLfUqjANHs4o6AQXilRSynDGI3ePY5JbVr4IPTZQYK3yY95byFd3eGVpIWZhvbUJRWon3co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aNg3aqc/; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aNg3aqc/"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2d475b6609eso69754281fa.2
        for <mhi@lists.linux.dev>; Tue, 19 Mar 2024 04:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710848535; x=1711453335; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=elC/J+DQMSiEL3syNo73tLIm3C8p69Tr5sKldmaLKFo=;
        b=aNg3aqc/t83/1n9xg1HolQL9Vn7naJC5DbSW8dOZYEtEytvj5pMfVTrd+YPGnf1cfM
         7xn1g5+DwFYq7msRy9/5nq894zX8qOCPbiUOQ+RSMkraMnTAkdD+hp2bS/Z51w4jaDY+
         yLyJKXheFjyFxDHiJ6DqPuqoOavqbmEAvUUbHMUVQJeUvvUiLZCTapB9M7BH4WucAZ6p
         T7fwxIcYeJOrcGeUvQVREOZdW67tbrzqgn2Ahhale3SqirNBRrRraZ8dFX7Mcs9+UpsT
         BUD3qkXMKSNZxbbRvYh1x8SR8UieE/vgufTtaulsZQSrEKUpBi57jogCwXmHt0qU3ClP
         CQyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710848535; x=1711453335;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=elC/J+DQMSiEL3syNo73tLIm3C8p69Tr5sKldmaLKFo=;
        b=RdJxymM9ftpwJz6AckStG1u62HG7Wtp50zpKsOlP/v1cyissJMzsGpXReyF5c8rxn8
         MecM2s6S/R04ClqLoOeLfQXoIbRjYMiCf9Py9lPePbw+8BOAEBwJdBpK02jjZ4Ai+lfF
         dn97sEoZ/xvK/d4BBGNskL0I2yTEw0VBEzDLS9ME7wVpXWJ9pkVWvVhOseoU45D1p1KS
         TtlaCMaUkQwcrYHxnOHml9+n4yFIsZRxTOIbH4vKsCLOV2kqGGkfA3HkC2p56db+3L+O
         eI9sgDAgqQR+SOSHLX3IQeDASD6arI/iHTj2/Abg+870YpQHQT8qQn7+HJ/drJ4jXVaX
         mPcA==
X-Forwarded-Encrypted: i=1; AJvYcCUa9lr3ncxVvfQJllg9yexN1kK5xwKPOQsKGfx4Pit7HcQv94nBoiLWh+Vv8/btM9N5C4O5laCzGcqwnzI687x6kt5b
X-Gm-Message-State: AOJu0YyzGhwwK5gyCRU2ie3Hnn73Xa+MmLvKtwdUF4w/5RUkTFsgV9gg
	Ye+w8rLVN22/cihnc/fZGTkb6rfXBzd9dh+zbZ7SLMJnxHSBnmCu
X-Google-Smtp-Source: AGHT+IEbPtInSnoxABuprHRsFDYGfrjvEEgi/PvCR0A0PjriWs8/Fs7e5VgS8xyyf1KxtbICUZUEPw==
X-Received: by 2002:a2e:b8c2:0:b0:2d5:9bd4:4496 with SMTP id s2-20020a2eb8c2000000b002d59bd44496mr2105191ljp.50.1710848535069;
        Tue, 19 Mar 2024 04:42:15 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id b4-20020a2e8944000000b002d449d1d509sm1851199ljk.70.2024.03.19.04.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 04:42:14 -0700 (PDT)
Date: Tue, 19 Mar 2024 14:42:11 +0300
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
Subject: Re: [PATCH v5 1/5] PCI: dwc: Refactor dw_pcie_edma_find_chip() API
Message-ID: <kxcd3n4hb6c2bhksqvxql3gj6zr2my5moxx5mighk33dggspw5@wvt565ch6gm2>
References: <20240318-dw-hdma-v5-0-f04c5cdde760@linaro.org>
 <20240318-dw-hdma-v5-1-f04c5cdde760@linaro.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240318-dw-hdma-v5-1-f04c5cdde760@linaro.org>

On Mon, Mar 18, 2024 at 11:34:25AM +0530, Manivannan Sadhasivam wrote:
> In order to add support for Hyper DMA (HDMA), let's refactor the existing
> dw_pcie_edma_find_chip() API by moving the common code to separate
> functions.
> 
> No functional change.

No more notes from my side. Thanks!
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

-Serge(y)

> 
> Suggested-by: Serge Semin <fancer.lancer@gmail.com>
> Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  drivers/pci/controller/dwc/pcie-designware.c | 37 ++++++++++++++++++++++------
>  1 file changed, 30 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
> index 250cf7f40b85..e591c1cd1efb 100644
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
> @@ -912,12 +920,14 @@ static int dw_pcie_edma_find_chip(struct dw_pcie *pci)
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
> +	val = dw_pcie_readl_dma(pci, PCIE_DMA_CTRL);
>  
>  	pci->edma.ll_wr_cnt = FIELD_GET(PCIE_DMA_NUM_WR_CHAN, val);
>  	pci->edma.ll_rd_cnt = FIELD_GET(PCIE_DMA_NUM_RD_CHAN, val);
> @@ -930,6 +940,19 @@ static int dw_pcie_edma_find_chip(struct dw_pcie *pci)
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
