Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1821078B
	for <mhi@lists.linux.dev>; Tue, 26 Mar 2024 08:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711442028; cv=none; b=FercpePUMK/sMdkpxOinX3ADLUi3+Pp2Ye2Iz9Nj5gUifepM0dgmlSAtJWLlt5Br4o+VIIILmzYffQYmLTwpTNVv9fyHP9lk6+2mRTYg470igZzg+9g0aigTHYSXuusklbLcbOQ9deYu1rHztIUIkLIAJAsfGqY9r8fsswjM//g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711442028; c=relaxed/simple;
	bh=ekSZJD9CdDsC7N70aoX3Mzm0bRUXxt7Zdo8CRQJXlHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JQeTJ2v74J15kfwoErpDyMsaj3eoLysB+Xbq8lwRyrGILLzwcQyOoqCUa2Nsv675/qDO8yZYlDtrDQwftV5Ab5GYIkMuB9+EdSstE6ViTgXh6IpmUMJ+C/VHk00gcuPM9B/62Kk+ennbOp4TvbkWiWyuzmMDeT/hvGJBDIekRxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Np7ihzYq; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Np7ihzYq"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1dfff641d10so35727125ad.2
        for <mhi@lists.linux.dev>; Tue, 26 Mar 2024 01:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711442026; x=1712046826; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nQOtfcbnYc24Mh+gXI1bFDgfC9HlUS+Sxyvob3hinF4=;
        b=Np7ihzYq3A5HtLMSPxgP95lNJc1gDHXX4NQOoqQU1DpRILtG7/j9B7Zkn+z6AxY4jT
         /Um8Uq+W5/CJvD7ZdoImWLCyMgdOSE3d7YgY0Wi5GIOHSGEj37GIZvNoVgdYDs/23WoM
         EKoL0TP9eoay7hLfnA54nhjkzP+MO7XbDLoYBBeIN+16l25th/VuAEBpdbu5UPQDbpoW
         wzidDJTHM1+3FcVodDHCFWIErtrUqJwQcjvwwIX3NL0aZiyb7avLjfQMbtbpMShsA6gX
         Kz7yg3PSZm0TiogVCsmrYFzJ8er3R2lp2D/QVOb7RfLQiWi53TDHfF89gfmZHWxQgkh0
         oerg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711442026; x=1712046826;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nQOtfcbnYc24Mh+gXI1bFDgfC9HlUS+Sxyvob3hinF4=;
        b=gl/BEQE6E6sNt9yyk6fXwxUfq3xtazMeYlNuxUqzWYagaSVvHsHXNHBc3jTKeJsNrc
         DVBlUcqbNZNR2wic8IC1n8kGSP5UPXaiOsO993cZ+m++TKbBwOTZT0jGpycV5zwK7gjR
         MWEN5A0L6mTYKre7ayzfWRrP9/omPdjCzFKd1uJhDWbeqoLYT4MgCWC5Ga1JI3WwfDRP
         mTXBp+g/+J4uLYx2SskVD4MUkSnOZCZc46H3IUFC7Y5xPC12KPTz+4TIKdpGORhpbZGw
         7LKteJZPt8AvDURENzrb1jkNeYQ0flrKyTXUVF0oH5B53JfoeUhxz9JI/2AXq1Iq4iMM
         KiFA==
X-Forwarded-Encrypted: i=1; AJvYcCUFq3MhY8GW7oXsv6OGNuVkInSThRN/mGRVsNIgNyOfvJnQNmQwNrodIweNKe1l4f8qrwcdb4lwUiwQflm76On/qP7Z
X-Gm-Message-State: AOJu0YyjNzEdL1X++rNOlLyJtUrtxESKNUy2r1rhjIvrat9npU/4HsVn
	/Q/8Xx52me5Kf1esW0IEH6ONUTxSrcrraPcf94+xNjGEqHeCZY5rEyo50FmINF7h/BFB28RVj7U
	=
X-Google-Smtp-Source: AGHT+IHM8PyfEgYVUSNeb8rAEehN4cswciWPXaugw1p1Nss4iAw4Hcpv2ciDq/JtT+SO2hYFDn/fhA==
X-Received: by 2002:a17:902:c952:b0:1df:f681:3cd8 with SMTP id i18-20020a170902c95200b001dff6813cd8mr2343690pla.12.1711442025839;
        Tue, 26 Mar 2024 01:33:45 -0700 (PDT)
Received: from thinkpad ([117.207.28.168])
        by smtp.gmail.com with ESMTPSA id w16-20020a170902e89000b001ddb505d50asm535867plg.244.2024.03.26.01.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 01:33:45 -0700 (PDT)
Date: Tue, 26 Mar 2024 14:03:38 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH 10/11] PCI: qcom-ep: Rework {start/stop}_link() callbacks
 implementation
Message-ID: <20240326083338.GI9565@thinkpad>
References: <20240314-pci-epf-rework-v1-0-6134e6c1d491@linaro.org>
 <20240314-pci-epf-rework-v1-10-6134e6c1d491@linaro.org>
 <Zf2tjht4TR7Irewd@ryzen>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zf2tjht4TR7Irewd@ryzen>

On Fri, Mar 22, 2024 at 05:10:54PM +0100, Niklas Cassel wrote:
> On Thu, Mar 14, 2024 at 08:53:49PM +0530, Manivannan Sadhasivam wrote:
> > DWC specific start_link() and stop_link() callbacks are supposed to start
> > and stop the link training of the PCIe bus. But the current implementation
> > of this driver enables/disables the PERST# IRQ.
> > 
> > Even though this is not causing any issues, this creates inconsistency
> > among the controller drivers. So for the sake of consistency, let's just
> > start/stop the link training in these callbacks.
> > 
> > Also, PERST# IRQ is now enabled from the start itself, thus allowing the
> > controller driver to initialize the registers when PERST# gets deasserted
> > without waiting for the user intervention though configfs.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> 
> Nice change:
> Reviewed-by: Niklas Cassel <cassel@kernel.org>
> 
> If you dump LTSSM after a PERST assert + deassert,
> using e.g. dw_pcie_readl_dbi(pci, PCIE_PORT_DEBUG1);
> to dump the debug registers (see dw_pcie_link_up())
> do you see that PCIE_PORT_DEBUG1_LINK_IN_TRAINING is set?
> 
> I was thinking that perhaps there was a thought behind
> this original design, that you had to explicitly set
> LTSSM_EN after a fundamental core reset, because it
> would get cleared?
> 

Well, you are right. I was hoping to get an answer from Kishon/Vidya, but you
throwed the light. I will drop these 2 patches.

Thanks!

- Mani

> (It it is implemented like signals and not registers,
> then this change should be fine.)
> 
> 
> Kind regards,
> Niklas
> 
> 
> >  drivers/pci/controller/dwc/pcie-qcom-ep.c | 21 +++++++++++++--------
> >  1 file changed, 13 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> > index 811f250e967a..653e4ace0a07 100644
> > --- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
> > +++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> > @@ -122,6 +122,9 @@
> >  /* PARF_CFG_BITS register fields */
> >  #define PARF_CFG_BITS_REQ_EXIT_L1SS_MSI_LTR_EN	BIT(1)
> >  
> > +/* PARF_LTSSM register fields */
> > +#define LTSSM_EN				BIT(8)
> > +
> >  /* ELBI registers */
> >  #define ELBI_SYS_STTS				0x08
> >  #define ELBI_CS2_ENABLE				0xa4
> > @@ -250,8 +253,12 @@ static int qcom_pcie_dw_link_up(struct dw_pcie *pci)
> >  static int qcom_pcie_dw_start_link(struct dw_pcie *pci)
> >  {
> >  	struct qcom_pcie_ep *pcie_ep = to_pcie_ep(pci);
> > +	u32 val;
> >  
> > -	enable_irq(pcie_ep->perst_irq);
> > +	/* Enable LTSSM */
> > +	val = readl_relaxed(pcie_ep->parf + PARF_LTSSM);
> > +	val |= LTSSM_EN;
> > +	writel_relaxed(val, pcie_ep->parf + PARF_LTSSM);
> >  
> >  	return 0;
> >  }
> > @@ -259,8 +266,12 @@ static int qcom_pcie_dw_start_link(struct dw_pcie *pci)
> >  static void qcom_pcie_dw_stop_link(struct dw_pcie *pci)
> >  {
> >  	struct qcom_pcie_ep *pcie_ep = to_pcie_ep(pci);
> > +	u32 val;
> >  
> > -	disable_irq(pcie_ep->perst_irq);
> > +	/* Disable LTSSM */
> > +	val = readl_relaxed(pcie_ep->parf + PARF_LTSSM);
> > +	val &= ~LTSSM_EN;
> > +	writel_relaxed(val, pcie_ep->parf + PARF_LTSSM);
> >  }
> >  
> >  static void qcom_pcie_dw_write_dbi2(struct dw_pcie *pci, void __iomem *base,
> > @@ -484,11 +495,6 @@ static int qcom_pcie_perst_deassert(struct dw_pcie *pci)
> >  
> >  	dw_pcie_ep_init_notify(&pcie_ep->pci.ep);
> >  
> > -	/* Enable LTSSM */
> > -	val = readl_relaxed(pcie_ep->parf + PARF_LTSSM);
> > -	val |= BIT(8);
> > -	writel_relaxed(val, pcie_ep->parf + PARF_LTSSM);
> > -
> >  	return 0;
> >  
> >  err_disable_resources:
> > @@ -707,7 +713,6 @@ static int qcom_pcie_ep_enable_irq_resources(struct platform_device *pdev,
> >  	}
> >  
> >  	pcie_ep->perst_irq = gpiod_to_irq(pcie_ep->reset);
> > -	irq_set_status_flags(pcie_ep->perst_irq, IRQ_NOAUTOEN);
> >  	ret = devm_request_threaded_irq(&pdev->dev, pcie_ep->perst_irq, NULL,
> >  					qcom_pcie_ep_perst_irq_thread,
> >  					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
> > 
> > -- 
> > 2.25.1
> > 
> 

-- 
மணிவண்ணன் சதாசிவம்
