Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC33913341E
	for <mhi@lists.linux.dev>; Tue, 26 Mar 2024 07:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711439792; cv=none; b=FO1/GtmfIw2KHYycLE2feVNKT+unwd8FLNvZC54gl9e9IwBCL41tbemPrxf8pFLSuP3sKJW4j4nSHTVr85p7eyGQXylIZuX26iw++QnbuOFoLUvQf+L4E6KJJA1iWzqeYCNmM/RXoRYj6h47DXIEAjHFrQ4CnP2k+XqmeQLmjP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711439792; c=relaxed/simple;
	bh=63vX4jpafQjPqEVR/t5tqsl4TA+CR/G2jQNsq7L6wBk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IefTtGS/lpqM2XfOhJmuexX8p+nusfuIqwlyyVcDZde5hCwG/u0lHV4OvLGjqNNHA+JJ1KKF9nbIz2sq++T2lmVKyRnFJx0EnbfTzyuxL5gft9xV7VCWqSJiQsyyTzlwgTN4tCAAp8IgXyD368BRV1zi8YtaaToXchyKqWKR2Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LZPDSWCI; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LZPDSWCI"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-5ce07cf1e5dso2906437a12.2
        for <mhi@lists.linux.dev>; Tue, 26 Mar 2024 00:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711439790; x=1712044590; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jKhopOw7fOrbkL/7HBWWGU431gOPI8AulqVWyi8Mf+A=;
        b=LZPDSWCIVWc8Fe0Qjyn0L7CCyLejInMdpZ51LTz3sPJo+COdj49XnlA11POpY5W5cT
         ZG0YrFJTIWUQ6Y50F/UCLp7MZVpvj32IbIE55OFc2uLG2Db9tApt9IHmyEUA+j8j2/ir
         /VAxagNW1c7L+vhWMLApDeXbh1kiV/SKAjeMZ3zQ+Rk68JxSjTYGZRWcjyfkwW45Yl3F
         uRRmSFGMJrGRsTjBU0ThZQCGfx9LBAkFeJcSkLySIp0+jsUsL6BzTiCEpVNLiEzbjvND
         u0odkOL1Os5w5dt4rCrS071ikLbxDyXzk2O/WLzaA8a+QRl+R0IGuMA6bjDIuZ2soP6u
         8Xng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711439790; x=1712044590;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jKhopOw7fOrbkL/7HBWWGU431gOPI8AulqVWyi8Mf+A=;
        b=oSLw9Q94avZYaJroMNIMQhGPhH84SGBLcMGw1mKQkwYINX8aAuXN5cssFYeV31qTVv
         vkhkFx6pK8Oyud1+bLLFy+WAS1gS4tzDHQcY14Nph41Ovw+n62hT570qXypZJ6oZCqkS
         RLQlm/DsXd7+ek/LI+GXncSnvJBeiaHQCdUteWTHwQnyBOAcFcU2lOh7YnHQUdqIn5zc
         zuroGXdLruY5oIzjaj8KIQF92h+R2U9nlFs+3Ec3AU2lWC+6fQvQzMfMFvZ8vQF18UlE
         38UBkF49eaUy9wAzRATMbgGnhq4qwCH/55xIe0sd3j9sFmixuKEneSJ75mPv9xunvjIC
         FDfg==
X-Forwarded-Encrypted: i=1; AJvYcCUbaqRvXGmwKKlqupiQ3HXbmjsS+hfXtZdq4cgsWrayHEHcFLF1iVMMrqnKU9jp4c/gosiO2odmyullrGbKOvgwUxxU
X-Gm-Message-State: AOJu0Yw1EZ0XYSfOUXp4ZjBDoigoOgjO4aAYi7ngX5dSH7By8Ve/YMWk
	49UhVX6rK6cnaKtBEIeFYU23sMo+KXE2Tsh6cD8l05qpo0zqt+HLUvkEt2nZeA==
X-Google-Smtp-Source: AGHT+IGQ7WhZEVFO29WnqrklLDrhQum07Jd12D1I7yMg/ubf+zTylUXcP0KkwS2QJv/QTuUJTf14qg==
X-Received: by 2002:a17:902:c115:b0:1df:16b:9cb8 with SMTP id 21-20020a170902c11500b001df016b9cb8mr8516819pli.2.1711439789975;
        Tue, 26 Mar 2024 00:56:29 -0700 (PDT)
Received: from thinkpad ([117.207.28.168])
        by smtp.gmail.com with ESMTPSA id y16-20020a17090264d000b001db5bdd5e3asm6242831pli.84.2024.03.26.00.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 00:56:29 -0700 (PDT)
Date: Tue, 26 Mar 2024 13:26:22 +0530
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
Subject: Re: [PATCH 03/11] PCI: endpoint: Rename core_init() callback in
 'struct pci_epc_event_ops' to init()
Message-ID: <20240326075622.GE9565@thinkpad>
References: <20240314-pci-epf-rework-v1-0-6134e6c1d491@linaro.org>
 <20240314-pci-epf-rework-v1-3-6134e6c1d491@linaro.org>
 <Zf2tEM1ueugQyJfK@ryzen>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zf2tEM1ueugQyJfK@ryzen>

On Fri, Mar 22, 2024 at 05:08:48PM +0100, Niklas Cassel wrote:
> On Thu, Mar 14, 2024 at 08:53:42PM +0530, Manivannan Sadhasivam wrote:
> > core_init() callback is used to notify the EPC initialization event to the
> > EPF drivers. The 'core' prefix was used indicate that the controller IP
> > core has completed initialization. But it serves no purpose as the EPF
> > driver will only care about the EPC initialization as a whole and there is
> > no real benefit to distinguish the IP core part.
> > 
> > So let's rename the core_init() callback in 'struct pci_epc_event_ops' to
> > just init() to make it more clear.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  drivers/pci/endpoint/functions/pci-epf-mhi.c  |  4 ++--
> >  drivers/pci/endpoint/functions/pci-epf-test.c |  4 ++--
> >  drivers/pci/endpoint/pci-epc-core.c           | 16 ++++++++--------
> >  include/linux/pci-epf.h                       |  4 ++--
> >  4 files changed, 14 insertions(+), 14 deletions(-)
> > 
> > diff --git a/drivers/pci/endpoint/functions/pci-epf-mhi.c b/drivers/pci/endpoint/functions/pci-epf-mhi.c
> > index e5d67aec7574..da894a9a447e 100644
> > --- a/drivers/pci/endpoint/functions/pci-epf-mhi.c
> > +++ b/drivers/pci/endpoint/functions/pci-epf-mhi.c
> > @@ -700,7 +700,7 @@ static void pci_epf_mhi_dma_deinit(struct pci_epf_mhi *epf_mhi)
> >  	epf_mhi->dma_chan_rx = NULL;
> >  }
> >  
> > -static int pci_epf_mhi_core_init(struct pci_epf *epf)
> > +static int pci_epf_mhi_epc_init(struct pci_epf *epf)
> >  {
> >  	struct pci_epf_mhi *epf_mhi = epf_get_drvdata(epf);
> >  	const struct pci_epf_mhi_ep_info *info = epf_mhi->info;
> > @@ -881,7 +881,7 @@ static void pci_epf_mhi_unbind(struct pci_epf *epf)
> >  }
> >  
> >  static const struct pci_epc_event_ops pci_epf_mhi_epc_event_ops = {
> > -	.core_init = pci_epf_mhi_core_init,
> > +	.init = pci_epf_mhi_epc_init,
> >  };
> >  
> >  static const struct pci_epc_bus_event_ops pci_epf_mhi_bus_event_ops = {
> > diff --git a/drivers/pci/endpoint/functions/pci-epf-test.c b/drivers/pci/endpoint/functions/pci-epf-test.c
> > index 751dab5799d5..1dae0fce8fc4 100644
> > --- a/drivers/pci/endpoint/functions/pci-epf-test.c
> > +++ b/drivers/pci/endpoint/functions/pci-epf-test.c
> > @@ -746,7 +746,7 @@ static int pci_epf_test_set_bar(struct pci_epf *epf)
> >  	return 0;
> >  }
> >  
> > -static int pci_epf_test_core_init(struct pci_epf *epf)
> > +static int pci_epf_test_epc_init(struct pci_epf *epf)
> 
> Why have _epc_ init in the name at all?
> 
> Isn't
> static int pci_epf_test_init(struct pci_epf *epf)
> 
> Enough?
> 
> From my perspective, it is the EPF that is initializing
> (by configuring the BARS according to it's liking),
> not the EPC initializing.
> 

Hmm, you are right. It makes sense to remove 'epc' from the naming.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
