Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE4A7E761
	for <mhi@lists.linux.dev>; Tue, 27 Feb 2024 08:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709023337; cv=none; b=Qpb91ybQA5nC0drnuEv1s6r7U6sYWOexyEo5+ExZOLy/pbFdTBN49Gh99JecviHjvjw5rV1/MI6prDm9elBSzyYsswheKHfOvLM4T7ioyqCiU48I/MgXRkWzGcVCEqI+K0DTdKSSh/u4CYEP++JG5gD03TvydwV77KCoFjlGWrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709023337; c=relaxed/simple;
	bh=eviFAxTmvFwlj37aSBuJSsrrDTcrHP7vSfHXT8AnIMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RP+rTyNuzgtvkIoKOhPoA01UiMEGOT+thPAKDhwef58Zw3ft8UeS+u8/oyF57PhvXnwR8kPI9eEVMzIqJBPNyg+EuUCkrUit6FmoBnE/KrfTQMqqSLFl6QyYqHUGe3hPZh6AEcz8lxjL84y6oifNB5gr7OZTwQg2ZQxdST++IOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mVr8zEvT; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mVr8zEvT"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3c1adc90830so243355b6e.0
        for <mhi@lists.linux.dev>; Tue, 27 Feb 2024 00:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709023334; x=1709628134; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/cM19NrlUQE5f0uY2kEvyT2gAXXaqjXwTAFjxjKcMvc=;
        b=mVr8zEvTXnIWGjF4ZwtfHzk734BhKdvPWEZeq+oTINF7YNvtnUrDnTQvGz+Cxn64Ms
         N0+iMaxR2hT9Qr3Q2MxdYjdeJ18Mdrg/85wGWHeGvml13bIqWKhIpq8I7WMILo3F1USa
         PQpCzXxekas8wVxQSi6soa8Z32vzBlBc4+kJudlsmUHbTP9bH3esJtg/PZcsf4yu2Kq4
         w2Czj2M3hav1TOXcI/I6VvsoEflr7oGzVQtEtMSveZTizdgDInSoibzv0K36u++fzyZX
         bkNMt7IjY97vfBGjBZTq0cs0kpjuGOIZShD0AG+BUg6sFrLQPA/EMkJs8CRgThzsn06a
         VcCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709023334; x=1709628134;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/cM19NrlUQE5f0uY2kEvyT2gAXXaqjXwTAFjxjKcMvc=;
        b=o9E4hbmowDsQ12qhNIM+oqyE/hEpSeS1b+yLjiQrvGgD7eX6LVJsJFlg3MBqPr9KqZ
         r4OaS894bZnuj0go8A/VDgVp6JI9IBd0fE/N97bXohx5fKMrnmRMijj5I1kvZX8oFWen
         Yzf10ySmZCh3sOFDZPjgN9srPO+HNshoOq8Sn8QYjpf9IhZ6JBpZvH/n2WrIcOKuuC4r
         MMh34ZQvLdqXfDSawN5QTI9UU289OLuejkGh19ri4atnb60ZQG2jNPfYIHex9pa+81z+
         aSsGljdOZZWyyjPKo58xa7rJ3e42kut4MYpiuQeMzuBv6+3rA/i5rOfm1i9k+IZWqCp0
         gwpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWCtCKmCUCDL7WzUm/SbqY7H0Du+Ue48c9MHehmjkllYANdxUsllK1jmHEndGjJQEb1WMEJ63myl8ds07iTKMPmAPF
X-Gm-Message-State: AOJu0YyaTG7XHpqyZdnHSHCsHZBgLyOo32j4pVQFn5h6p4chnrGWGTb4
	7YqWh92YvT3CkVGbw3sL9h5HKxph/GjA7HIPpbpBYSD0BNAhVxdCVv5cMTvflw==
X-Google-Smtp-Source: AGHT+IHQ/416nfXXHvEHWnn79YnL2bV5h+6AxvQFvjmUWbUWtUrZWs6Wc0+h1xF3XxTWGAkfnuf60Q==
X-Received: by 2002:a05:6870:b021:b0:21e:7c86:665e with SMTP id y33-20020a056870b02100b0021e7c86665emr11563960oae.16.1709023334040;
        Tue, 27 Feb 2024 00:42:14 -0800 (PST)
Received: from thinkpad ([117.213.97.177])
        by smtp.gmail.com with ESMTPSA id g8-20020a62f948000000b006e500cbb529sm4554957pfm.50.2024.02.27.00.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 00:42:13 -0800 (PST)
Date: Tue, 27 Feb 2024 14:12:04 +0530
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
Message-ID: <20240227084204.GI2587@thinkpad>
References: <20240226-dw-hdma-v3-0-cfcb8171fc24@linaro.org>
 <20240226-dw-hdma-v3-2-cfcb8171fc24@linaro.org>
 <5gzkxdpx6u3jhw5twbncjhtozgekmlzxrpj3m6is3ijadm2svb@f6ng4owyakup>
 <20240226153014.GG8422@thinkpad>
 <4p4z5eyhpdhxzi36drhrmz6z7krupszddudg6c2baypkbnnj7t@nqcmk2wdntts>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4p4z5eyhpdhxzi36drhrmz6z7krupszddudg6c2baypkbnnj7t@nqcmk2wdntts>

On Tue, Feb 27, 2024 at 12:32:44AM +0300, Serge Semin wrote:
> On Mon, Feb 26, 2024 at 09:00:14PM +0530, Manivannan Sadhasivam wrote:
> > On Mon, Feb 26, 2024 at 03:53:20PM +0300, Serge Semin wrote:
> > > On Mon, Feb 26, 2024 at 05:07:27PM +0530, Manivannan Sadhasivam wrote:
> > > > In the case of Hyper DMA (HDMA) present in DWC controllers, there is no way
> > > > the drivers can auto detect the number of read/write channels as like its
> > > > predecessor embedded DMA (eDMA). So the glue drivers making use of HDMA
> > > > have to pass the channels count during probe.
> > > > 
> > > > To accommodate that, let's skip finding the channels if the channels count
> > > > were already passed by glue drivers. If the channels count passed were
> > > > wrong in any form, then the existing sanity check will catch it.
> > > > 
> > > > Suggested-by: Serge Semin <fancer.lancer@gmail.com>
> > > > Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> > > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > > ---
> > > >  drivers/pci/controller/dwc/pcie-designware.c | 16 +++++++++-------
> > > >  1 file changed, 9 insertions(+), 7 deletions(-)
> > > > 
> > > > diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
> > > > index 193fcd86cf93..ce273c3c5421 100644
> > > > --- a/drivers/pci/controller/dwc/pcie-designware.c
> > > > +++ b/drivers/pci/controller/dwc/pcie-designware.c
> > > > @@ -927,13 +927,15 @@ static int dw_pcie_edma_find_channels(struct dw_pcie *pci)
> > > >  {
> > > >  	u32 val;
> > > >  
> > > > -	if (pci->edma.mf == EDMA_MF_EDMA_LEGACY)
> > > > -		val = dw_pcie_readl_dbi(pci, PCIE_DMA_VIEWPORT_BASE + PCIE_DMA_CTRL);
> > > > -	else
> > > > -		val = dw_pcie_readl_dma(pci, PCIE_DMA_CTRL);
> > > > -
> > > > -	pci->edma.ll_wr_cnt = FIELD_GET(PCIE_DMA_NUM_WR_CHAN, val);
> > > > -	pci->edma.ll_rd_cnt = FIELD_GET(PCIE_DMA_NUM_RD_CHAN, val);
> > > 
> > > > +	if (!pci->edma.ll_wr_cnt || !pci->edma.ll_rd_cnt) {
> > > 
> > > Are you sure that the partly initialized case should be considered as
> > > a request for the auto-detection? IMO &&-ing here and letting the
> > > sanity check to fail further would be more correct since thus the
> > > developer would know about improper initialized data.
> > > 
> > 
> > We already have the check below. So the partly initialized case will fail
> > anyway.
> 
> Not really. If the partly initialized case activates the
> auto-detection procedure it will override both non-initialized and
> _initialized_ number of channels with the values retrieved from the
> hardware, which the glue driver has been willing not to use. This
> prone to undefined behavior depending on the reasons of skipping the
> auto-detection procedure. For instance, assume the DMA_CTRL register
> reports an invalid number of read channels. A glue driver by mistake
> or willingly overwrites the pci->edma.ll_rd_cnt field only. This won't
> solve the problem since the auto-detection will be proceeded due to
> the pci->edma.ll_wr_cnt field being left uninitialized.
> 
> So to speak it would be better to implement a strictly determined case
> for activating the auto-detection procedure: both number of channels
> aren't initialized; if only one field is initialized then report an
> error.
> 
> Alternatively we can have the auto-detection executed on the
> per-channel basis:
> 
> +	if (pci->edma.mf != EDMA_MF_HDMA_NATIVE) {
> +		val = dw_pcie_readl_dma(pci, PCIE_DMA_CTRL);
> +
> +		if (!pci->edma.ll_wr_cnt)
> +			pci->edma.ll_wr_cnt = FIELD_GET(PCIE_DMA_NUM_WR_CHAN, val);
> +
> +		if (!pci->edma.ll_rd_cnt)
> +			pci->edma.ll_rd_cnt = FIELD_GET(PCIE_DMA_NUM_RD_CHAN, val);
> +	}
> 

Hmm, in this case there is no need to check for uninitialized channels count:

	/*
	 * Autodetect the read/write channels count only for non-HDMA platforms.
	 * HDMA platforms doesn't support autodetect, so the glue drivers should've
	 * passed the valid count already. If not, the below sanity check will
	 * catch it.
	 */
	if (pci->edma.mf != EDMA_MF_HDMA_NATIVE) {
		val = dw_pcie_readl_dma(pci, PCIE_DMA_CTRL);

		pci->edma.ll_wr_cnt = FIELD_GET(PCIE_DMA_NUM_WR_CHAN, val);
		pci->edma.ll_rd_cnt = FIELD_GET(PCIE_DMA_NUM_RD_CHAN, val);
	}

	/* Sanity check */

- Mani

-- 
மணிவண்ணன் சதாசிவம்
