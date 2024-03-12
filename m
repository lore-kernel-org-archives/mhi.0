Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC8E7CF1C
	for <mhi@lists.linux.dev>; Tue, 12 Mar 2024 09:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710235075; cv=none; b=GsQ9sZVY4zoPgjI4/4/IxPId6iXz8Sl21A84VCLONJIPcevEge02kD4aF9ekGz2chtv5QSVCdLfsD7LDKAUeQsDu1em2f0ZMKJMq7lElePrE37PuzK8gUMVQ+tio5TfEa5YD6y4v++hPZcYpw5LsZnimlBcH9wAnh2boTdWUDPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710235075; c=relaxed/simple;
	bh=n/xyd4RSK51AZo83JsP+jj0gL9V4BBAgGqAGe8AEkg4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c3Vg+G/L84oIgZx8kkZqLo9Z7eo+5vDUKSazUeoH3Rj2kck7s0mNJFR+lKhE2/bfujmqztjKsP4pceWPykacF8X7wbxjyskT29zKhlwO1c2SS0oaosILeEguaMsZnVkYqC7R4ReLEikpiHtA0cPDVR/Zd8ouQ4pRAOSCGd1I4d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bzAvjg50; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bzAvjg50"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2d26227d508so80150311fa.2
        for <mhi@lists.linux.dev>; Tue, 12 Mar 2024 02:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710235072; x=1710839872; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BZ6n3LCBgXbzRZ+jOk9gBUl7KDl6UUW0N9+kmdRSwFk=;
        b=bzAvjg50NCXObu6oDYftGmMDTKqHWemXTT4xoEV8Me3WX7ovHHR8WVD5CSTMMXmuNE
         qRwF1EemMZlp12hQJNGVD0XXzi73r1M57xE2fUpFKYtg1oE5/8yaPLNuuvc8H29X/2jJ
         jNDw6GrZgZ91e/1895UkUP0UvevXxbs+WiQqZYbYJe+1Dq04z2uDMmNhsoJZtumsKGft
         /jfMhSrsygi0DFEZ3wCATajDAPoC0MO2nDvVelmaeyywk5nnbfudE+Ysb0FPkCTN3btH
         VtJNN2VuwpWVRNbXqgPQSsFh6OBR0jYiq9x99HlvTTpOuKHnSHRD4cJJvJs5shUH58yz
         SmIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710235072; x=1710839872;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BZ6n3LCBgXbzRZ+jOk9gBUl7KDl6UUW0N9+kmdRSwFk=;
        b=YGHPaFxY9jIBKLB6ANbliVhl6WbSGGU9/jbBaxWXTYF1ODOMwB/wwSWQ0Toa2Ze3i2
         9Or4h2KhsqTWxb8gLRbmf4hTaJDCwwaMv0lw0YzepiF3pHkDJgs7FQ+KAwBD8eOlPl0p
         1Z7o3x+T1Adp4srKiIrQu6XNuwcyU1zimL20kMZk0swhsyy7RKxJtdj7YzPcw1Sm07oh
         niV+JVmSPjGlJn35tCtrArpjRFv4hqVArG8Roy55+qrWuLSkgxuH12YNEQsOLWQ1Zwfq
         REJrnIYsjNL1UQVustVIgQqJKhrvpCZhVYsQ1Ckp/R7X8I/HN2YRJJSZSetOEwdenPSk
         RzPw==
X-Forwarded-Encrypted: i=1; AJvYcCXQwaTwXeCtRr1gbsl82Xr8IIzi2EWogV2DiCRGV5Lw8Q3kAmbZoc2FPFa9obL4BxK3oC6yC/E+nTPtQ6eaYWnSSZrY
X-Gm-Message-State: AOJu0Yx6RN7o8F57wdLKc1iJU3GU6s8Waxcr/wlPiUGCjtd2QreKU88y
	oxFXuglK8Ft5AafRaq7LcUWki6rD10dmsE5f/7sVUjCgLADyikkYTVAh5T/O
X-Google-Smtp-Source: AGHT+IFm7+AOiUOnzjOZiIaCXRd9rxISYVnr31Yubo08D3ay+vXSLHfTEBCY79LtjUa86DxxV5qF6A==
X-Received: by 2002:a2e:be8d:0:b0:2d4:59bd:bc87 with SMTP id a13-20020a2ebe8d000000b002d459bdbc87mr790603ljr.4.1710235071652;
        Tue, 12 Mar 2024 02:17:51 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id f9-20020a05651c02c900b002d2a710f864sm1521827ljo.24.2024.03.12.02.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 02:17:51 -0700 (PDT)
Date: Tue, 12 Mar 2024 12:17:48 +0300
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
Subject: Re: [PATCH v4 2/5] PCI: dwc: Skip finding eDMA channels count for
 HDMA platforms
Message-ID: <kqztfm6ri54pkxcmsmngldmlf22mt2vn5cgxxfhjqxujx3qkq2@us6rc2sof7gk>
References: <20240306-dw-hdma-v4-0-9fed506e95be@linaro.org>
 <20240306-dw-hdma-v4-2-9fed506e95be@linaro.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240306-dw-hdma-v4-2-9fed506e95be@linaro.org>

On Wed, Mar 06, 2024 at 03:51:58PM +0530, Manivannan Sadhasivam wrote:
> In the case of Hyper DMA (HDMA) present in DWC controllers, there is no way
> the drivers can auto detect the number of read/write channels as like its
> predecessor embedded DMA (eDMA). So the glue drivers making use of HDMA
> have to pass the channels count during probe.
> 
> To accommodate that, let's skip the existing auto detection of channels
> count procedure for HDMA based platforms. If the channels count passed by
> the glue drivers were wrong in any form, then the existing sanity check
> will catch it.
> 
> Suggested-by: Serge Semin <fancer.lancer@gmail.com>
> Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

Please find a tiny nitpick further below.

> ---
>  drivers/pci/controller/dwc/pcie-designware.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
> index 3a26dfc5368f..599991b7ffb2 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.c
> +++ b/drivers/pci/controller/dwc/pcie-designware.c
> @@ -927,13 +927,18 @@ static int dw_pcie_edma_find_channels(struct dw_pcie *pci)
>  {
>  	u32 val;
>  
> -	if (pci->edma.mf == EDMA_MF_EDMA_LEGACY)
> -		val = dw_pcie_readl_dbi(pci, PCIE_DMA_VIEWPORT_BASE + PCIE_DMA_CTRL);
> -	else

> +	/*
> +	 * Autodetect the read/write channels count only for non-HDMA platforms.
> +	 * HDMA platforms doesn't support autodetect, so the glue drivers should've
> +	 * passed the valid count already. If not, the below sanity check will
> +	 * catch it.
> +	 */

This is correct for the _native_ HDMA CSRs mapping. I suggest to emphasize
that in the note above.

-Serge(y)

> +	if (pci->edma.mf != EDMA_MF_HDMA_NATIVE) {
>  		val = dw_pcie_readl_dma(pci, PCIE_DMA_CTRL);
>  
> -	pci->edma.ll_wr_cnt = FIELD_GET(PCIE_DMA_NUM_WR_CHAN, val);
> -	pci->edma.ll_rd_cnt = FIELD_GET(PCIE_DMA_NUM_RD_CHAN, val);
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
