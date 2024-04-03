Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C6914900F
	for <mhi@lists.linux.dev>; Wed,  3 Apr 2024 14:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712154420; cv=none; b=d5urm1wqluaSTtJhqIaPvYKjbwXhA40Lrcvc+bx1lHJBEBeQcWwzlpYH6qX46ZCuM2jopn3VM14JHC038WoyD7G6EICZCce6kFvSy6ouO3tjAESXxlypFjA4soXPmyuh/rYKCmou0bVTcK/BQquE+FHDtsbmRM2V1C6ULhTAQ9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712154420; c=relaxed/simple;
	bh=A0OBSuVgDt/J2xUutO6+JvqHERv/I/K2G5EsyXT9MgA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VXGwLS7kvrhnEL5wJgwzrrJiJczlhrLdK0x90HSrUbvI+QCQKM2oVikvhKzVx30M8PA2M+LC6Ja6xtbP0ZgIXmwC/Z/sklPtsxCkIcUJ0glXz6pfI3SDS/nJkV4zrC3r+ZdlTb70rt1q7Car5QJHY2Ex8AF/54Z4FYekaMFUxpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Rc1DU6+3; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rc1DU6+3"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1def3340682so55803385ad.1
        for <mhi@lists.linux.dev>; Wed, 03 Apr 2024 07:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712154417; x=1712759217; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=itlOmnEuPReodbeFIXg0Q+nLMyOtH/Tv3WRy/9hE3rM=;
        b=Rc1DU6+30vVGEYBsrA5z33ilMPi5ngjBS6nKymrmHXKahzLwqEC8Rz8clJdq9sZ6r5
         PvrW0mDYrBsGUhc6pI41+PBItjflg5b/+PLD+2jZFqS8v0CJuZ+iFWBuGQufdIklnmxT
         FbqDUyX6qEZ/doQje6rcK5C9IlYdlE3ndL2VR1xq7SiAKCdh/XiNWnCs5at2E6zW7OIv
         y1UG13Hsxfhk/Ov7V7y8MxldU3+3tfPTu+7zxSsPAl+wyG0FEwewilWP7m8abFBLvwyQ
         ikehdviK1XvOBcBNvFFgoSj4W6Mk8R2lhigPxC2ejWzPBrEk+odn/LfGBDupPsFhYhTf
         ZZsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712154417; x=1712759217;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=itlOmnEuPReodbeFIXg0Q+nLMyOtH/Tv3WRy/9hE3rM=;
        b=Z9Ld5gAPuiMVe9qM2SRsqn8awSjGkdpELu3TNfMpnLKu0DEyyFgse+KbRv4CemDLHz
         tD2nwBOv6SqPzaS6VugITRSIB/vXDt+6VBAGlO8G4CPoGAcFK1wwYU6/sGuFFXzCP+lR
         MbI2cqqgylzuM55B21ZrWHVyVWf8CqM8M/3ryE9rZnfgYGTd5gp/9ygdBDmMurhnCRqB
         tdopGChRn9uQXGKEi2v0KkH3eIV1LvK7Gb5hXyjE46Q93qEB08XvTZpAGnYDl80+G6Vv
         uGBVb9yta1SIcnxB7yGirymh+gON2IuePhRgtiUaczbf/oBvD/YZ9mM6BEUU8UJm5QEF
         VmjA==
X-Forwarded-Encrypted: i=1; AJvYcCXEnmeFauiO8XCjKhBdxwnegf8+3soRmQdi16pXqHrJ/3D/Jl2nuzN+cN9NdmY+FUu1P6K1sSg9Ipwo+1ZR5FlmZZh8
X-Gm-Message-State: AOJu0YyVVGFGCBJHvmibQOY8m6we63X3vVUAyhvg+rLAJcMGLN9l10c+
	aYP6SwvBeBwfrkoLtQ6edpfBFgfs4IoIdlrKE4+M9nmeQV5zgq1jaA6h86V1yg==
X-Google-Smtp-Source: AGHT+IEha+Q/6vakGDqGjU0ND2M37sfFKFFSdBt5vgbo+vLYkuo7MuB+eCFLaHlH3A+uF1Yf4hVGOA==
X-Received: by 2002:a17:903:210c:b0:1e2:a414:fe94 with SMTP id o12-20020a170903210c00b001e2a414fe94mr52411ple.15.1712154416796;
        Wed, 03 Apr 2024 07:26:56 -0700 (PDT)
Received: from thinkpad ([103.28.246.48])
        by smtp.gmail.com with ESMTPSA id j10-20020a170902f24a00b001e2a0d33fbbsm376458plc.219.2024.04.03.07.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 07:26:56 -0700 (PDT)
Date: Wed, 3 Apr 2024 19:56:50 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Damien Le Moal <dlemoal@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jingoo Han <jingoohan1@gmail.com>, linux-pci@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	mhi@lists.linux.dev, linux-tegra@vger.kernel.org,
	Niklas Cassel <cassel@kernel.org>
Subject: Re: [PATCH v2 02/10] PCI: endpoint: Decouple EPC and PCIe bus
 specific events
Message-ID: <20240403142650.GA72531@thinkpad>
References: <20240401-pci-epf-rework-v2-0-970dbe90b99d@linaro.org>
 <20240401-pci-epf-rework-v2-2-970dbe90b99d@linaro.org>
 <45b2db99-2d03-469b-aa37-bc6c63cef141@kernel.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <45b2db99-2d03-469b-aa37-bc6c63cef141@kernel.org>

On Tue, Apr 02, 2024 at 09:14:20AM +0900, Damien Le Moal wrote:
> On 4/2/24 00:50, Manivannan Sadhasivam wrote:
> > Currently, 'struct pci_epc_event_ops' has a bunch of events that are sent
> > from the EPC driver to EPF driver. But those events are a mix of EPC
> > specific events like core_init and PCIe bus specific events like LINK_UP,
> > LINK_DOWN, BME etc...
> > 
> > Let's decouple them to respective structs (pci_epc_event_ops,
> > pci_epc_bus_event_ops) to make the separation clear.
> 
> I fail to see the benefits here. The event operation names are quite clear and,
> in my opinion, it is clear if an event op applies to the controller or to the
> bus/link. If anything, "core_init" could a little more clear, so renaming that
> "ep_controller_init" or something like that (clearly spelling out what is being
> initialized) seems enough to me. Similarly, the "bme" op name is very criptic.
> Renaming that to "bus_master_enable" would go a long way clarifying the code.
> For link events, "link_up", "link_down" are clear. So I think there is no need
> to split the event op struct like this. Renaming the ops is better.
> 
> Note that I am not opposed to this patch, but I think it is just code churn
> that does not really bring any fundamental improvement. Regardless, renaming
> "core_init" and "bme" ops is I think desired.
> 

Niklas shared the same view during v1, but I hate to see the events being mixed
in a single ops. Especially that it will confuse the developers who are not
familiar with the EP subsystem.

But since the argument is coming twice, I've decided to drop this for now and
just rename the 'core_init' callback to 'epc_init' and name the deinit callback
as 'epc_deinit'.

Let's see how long the callback list goes...

- Mani

> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  drivers/pci/endpoint/functions/pci-epf-mhi.c  |  8 ++++++--
> >  drivers/pci/endpoint/functions/pci-epf-test.c |  8 ++++++--
> >  drivers/pci/endpoint/pci-epc-core.c           | 20 ++++++++++----------
> >  include/linux/pci-epf.h                       | 23 ++++++++++++++++-------
> >  4 files changed, 38 insertions(+), 21 deletions(-)
> > 
> > diff --git a/drivers/pci/endpoint/functions/pci-epf-mhi.c b/drivers/pci/endpoint/functions/pci-epf-mhi.c
> > index 2c54d80107cf..280863c0eeb9 100644
> > --- a/drivers/pci/endpoint/functions/pci-epf-mhi.c
> > +++ b/drivers/pci/endpoint/functions/pci-epf-mhi.c
> > @@ -896,8 +896,11 @@ static void pci_epf_mhi_unbind(struct pci_epf *epf)
> >  	pci_epc_clear_bar(epc, epf->func_no, epf->vfunc_no, epf_bar);
> >  }
> >  
> > -static const struct pci_epc_event_ops pci_epf_mhi_event_ops = {
> > +static const struct pci_epc_event_ops pci_epf_mhi_epc_event_ops = {
> >  	.core_init = pci_epf_mhi_core_init,
> > +};
> > +
> > +static const struct pci_epc_bus_event_ops pci_epf_mhi_bus_event_ops = {
> >  	.link_up = pci_epf_mhi_link_up,
> >  	.link_down = pci_epf_mhi_link_down,
> >  	.bme = pci_epf_mhi_bme,
> > @@ -919,7 +922,8 @@ static int pci_epf_mhi_probe(struct pci_epf *epf,
> >  	epf_mhi->info = info;
> >  	epf_mhi->epf = epf;
> >  
> > -	epf->event_ops = &pci_epf_mhi_event_ops;
> > +	epf->epc_event_ops = &pci_epf_mhi_epc_event_ops;
> > +	epf->bus_event_ops = &pci_epf_mhi_bus_event_ops;
> >  
> >  	mutex_init(&epf_mhi->lock);
> >  
> > diff --git a/drivers/pci/endpoint/functions/pci-epf-test.c b/drivers/pci/endpoint/functions/pci-epf-test.c
> > index 977fb79c1567..973db0b1bde2 100644
> > --- a/drivers/pci/endpoint/functions/pci-epf-test.c
> > +++ b/drivers/pci/endpoint/functions/pci-epf-test.c
> > @@ -798,8 +798,11 @@ static int pci_epf_test_link_up(struct pci_epf *epf)
> >  	return 0;
> >  }
> >  
> > -static const struct pci_epc_event_ops pci_epf_test_event_ops = {
> > +static const struct pci_epc_event_ops pci_epf_test_epc_event_ops = {
> >  	.core_init = pci_epf_test_core_init,
> > +};
> > +
> > +static const struct pci_epc_bus_event_ops pci_epf_test_bus_event_ops = {
> >  	.link_up = pci_epf_test_link_up,
> >  };
> >  
> > @@ -916,7 +919,8 @@ static int pci_epf_test_probe(struct pci_epf *epf,
> >  
> >  	INIT_DELAYED_WORK(&epf_test->cmd_handler, pci_epf_test_cmd_handler);
> >  
> > -	epf->event_ops = &pci_epf_test_event_ops;
> > +	epf->epc_event_ops = &pci_epf_test_epc_event_ops;
> > +	epf->bus_event_ops = &pci_epf_test_bus_event_ops;
> >  
> >  	epf_set_drvdata(epf, epf_test);
> >  	return 0;
> > diff --git a/drivers/pci/endpoint/pci-epc-core.c b/drivers/pci/endpoint/pci-epc-core.c
> > index 47d27ec7439d..f202ae07ffa9 100644
> > --- a/drivers/pci/endpoint/pci-epc-core.c
> > +++ b/drivers/pci/endpoint/pci-epc-core.c
> > @@ -692,8 +692,8 @@ void pci_epc_linkup(struct pci_epc *epc)
> >  	mutex_lock(&epc->list_lock);
> >  	list_for_each_entry(epf, &epc->pci_epf, list) {
> >  		mutex_lock(&epf->lock);
> > -		if (epf->event_ops && epf->event_ops->link_up)
> > -			epf->event_ops->link_up(epf);
> > +		if (epf->bus_event_ops && epf->bus_event_ops->link_up)
> > +			epf->bus_event_ops->link_up(epf);
> >  		mutex_unlock(&epf->lock);
> >  	}
> >  	mutex_unlock(&epc->list_lock);
> > @@ -718,8 +718,8 @@ void pci_epc_linkdown(struct pci_epc *epc)
> >  	mutex_lock(&epc->list_lock);
> >  	list_for_each_entry(epf, &epc->pci_epf, list) {
> >  		mutex_lock(&epf->lock);
> > -		if (epf->event_ops && epf->event_ops->link_down)
> > -			epf->event_ops->link_down(epf);
> > +		if (epf->bus_event_ops && epf->bus_event_ops->link_down)
> > +			epf->bus_event_ops->link_down(epf);
> >  		mutex_unlock(&epf->lock);
> >  	}
> >  	mutex_unlock(&epc->list_lock);
> > @@ -744,8 +744,8 @@ void pci_epc_init_notify(struct pci_epc *epc)
> >  	mutex_lock(&epc->list_lock);
> >  	list_for_each_entry(epf, &epc->pci_epf, list) {
> >  		mutex_lock(&epf->lock);
> > -		if (epf->event_ops && epf->event_ops->core_init)
> > -			epf->event_ops->core_init(epf);
> > +		if (epf->epc_event_ops && epf->epc_event_ops->core_init)
> > +			epf->epc_event_ops->core_init(epf);
> >  		mutex_unlock(&epf->lock);
> >  	}
> >  	epc->init_complete = true;
> > @@ -767,8 +767,8 @@ void pci_epc_notify_pending_init(struct pci_epc *epc, struct pci_epf *epf)
> >  {
> >  	if (epc->init_complete) {
> >  		mutex_lock(&epf->lock);
> > -		if (epf->event_ops && epf->event_ops->core_init)
> > -			epf->event_ops->core_init(epf);
> > +		if (epf->epc_event_ops && epf->epc_event_ops->core_init)
> > +			epf->epc_event_ops->core_init(epf);
> >  		mutex_unlock(&epf->lock);
> >  	}
> >  }
> > @@ -792,8 +792,8 @@ void pci_epc_bme_notify(struct pci_epc *epc)
> >  	mutex_lock(&epc->list_lock);
> >  	list_for_each_entry(epf, &epc->pci_epf, list) {
> >  		mutex_lock(&epf->lock);
> > -		if (epf->event_ops && epf->event_ops->bme)
> > -			epf->event_ops->bme(epf);
> > +		if (epf->bus_event_ops && epf->bus_event_ops->bme)
> > +			epf->bus_event_ops->bme(epf);
> >  		mutex_unlock(&epf->lock);
> >  	}
> >  	mutex_unlock(&epc->list_lock);
> > diff --git a/include/linux/pci-epf.h b/include/linux/pci-epf.h
> > index adee6a1b35db..77399fecaeb5 100644
> > --- a/include/linux/pci-epf.h
> > +++ b/include/linux/pci-epf.h
> > @@ -69,14 +69,21 @@ struct pci_epf_ops {
> >  };
> >  
> >  /**
> > - * struct pci_epc_event_ops - Callbacks for capturing the EPC events
> > - * @core_init: Callback for the EPC initialization complete event
> > - * @link_up: Callback for the EPC link up event
> > - * @link_down: Callback for the EPC link down event
> > - * @bme: Callback for the EPC BME (Bus Master Enable) event
> > + * struct pci_epc_event_ops - Callbacks for capturing the EPC specific events
> > + * @core_init: Callback for the EPC initialization event
> >   */
> >  struct pci_epc_event_ops {
> >  	int (*core_init)(struct pci_epf *epf);
> > +};
> > +
> > +/**
> > + * struct pci_epc_bus_event_ops - Callbacks for capturing the PCIe bus specific
> > + *                               events
> > + * @link_up: Callback for the PCIe bus link up event
> > + * @link_down: Callback for the PCIe bus link down event
> > + * @bme: Callback for the PCIe bus BME (Bus Master Enable) event
> > + */
> > +struct pci_epc_bus_event_ops {
> >  	int (*link_up)(struct pci_epf *epf);
> >  	int (*link_down)(struct pci_epf *epf);
> >  	int (*bme)(struct pci_epf *epf);
> > @@ -150,7 +157,8 @@ struct pci_epf_bar {
> >   * @is_vf: true - virtual function, false - physical function
> >   * @vfunction_num_map: bitmap to manage virtual function number
> >   * @pci_vepf: list of virtual endpoint functions associated with this function
> > - * @event_ops: Callbacks for capturing the EPC events
> > + * @epc_event_ops: Callbacks for capturing the EPC events
> > + * @bus_event_ops: Callbacks for capturing the PCIe bus events
> >   */
> >  struct pci_epf {
> >  	struct device		dev;
> > @@ -180,7 +188,8 @@ struct pci_epf {
> >  	unsigned int		is_vf;
> >  	unsigned long		vfunction_num_map;
> >  	struct list_head	pci_vepf;
> > -	const struct pci_epc_event_ops *event_ops;
> > +	const struct pci_epc_event_ops *epc_event_ops;
> > +	const struct pci_epc_bus_event_ops *bus_event_ops;
> >  };
> >  
> >  /**
> > 
> 
> -- 
> Damien Le Moal
> Western Digital Research
> 

-- 
மணிவண்ணன் சதாசிவம்
