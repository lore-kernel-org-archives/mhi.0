Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E081487E2
	for <mhi@lists.linux.dev>; Wed,  3 Apr 2024 13:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712152112; cv=none; b=bK/aWpGVwmuWzQns+Wop7qR16dP1ENjhMPnb1FwXKnpO0spc4s3vTUcQjFHNNFFBjOzz1pBwhTbPTNdygSG0Nt934rQSjvAUfLQ3SaJTr+vNquxnx9gWFz03KrYHHtciKWCBEAsbZAdHwczZpctIXuknDZBU7fL1SCJ0GBlazCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712152112; c=relaxed/simple;
	bh=fvKLwKU3KWCORD/8PD/VwUpCx2RAkGiPOHgcgK0dHSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ifhe4lG+8zAC2ShjxNAHDwdPD5fJj6kwVRpEiIEbevuFJrEnSAum3Dy/6/bDawHq0/30r6riGsdh947P14pZtqihXRK5s3JDwAmuZh4qQ+b6ilUWbsfdAlshp+355b/8LZBLmbjX+LmsKKIoofjJwoJdqmGlUXZ6wjd+XLODa80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TFqoo8Bc; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TFqoo8Bc"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1e27fadbbe1so13352485ad.1
        for <mhi@lists.linux.dev>; Wed, 03 Apr 2024 06:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712152110; x=1712756910; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7b50vJkoLiWoH+ssMmq08Gs/zjVCDhawPZcPztNxgJk=;
        b=TFqoo8BcJzTiYKmh9UrER1qYJNkwYdohJqx36HXfsLOr1rmvHjhzNcSJ7b0go1W5go
         EsxesUhwKBKPitfQvaImXyyn7XsU1VMX3VVxXJ9I4K3yp5fk+NoCb3n7EqWV1UixX+fw
         OQcZxn70Tv+MlbB1cL4IYrZWLxSe3z+LZW3RBNhTklhcmRzjPSKoJoyl6D93Fb4f2Axz
         wN9nGKHhd84oXUCjVxjU0ox54qbxNX5HEyVPJsr7u5Tc0rb2BhEquebW0/al9Jt6rFlo
         Rr1KNqj52MyFKEtBYjVlykfsQVCioGGYkmtesiyKoCCAAPmftjQ2clay9TyYin8eUkPT
         qwRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712152110; x=1712756910;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7b50vJkoLiWoH+ssMmq08Gs/zjVCDhawPZcPztNxgJk=;
        b=J3loQz28FQ3XM1VUQ0Q+RRg8EIFVWLkJ2/vkmJoK3tuYN7ay9A9i7rjiLzVpoQKIGu
         O4e92gH/qQdbOIzkmAM0K4vXUbtDad8T6JEvp1A44DGoBJkiQMQa5if8qrrfWtrOD8cM
         Ps8ORP+pDcCcgvJtJOFU+IrE2F02kk7P17SFmG6MaMJ+hLobXLc9ZscW0Og3zZO/RZef
         J4Y84dSYTCVXCben8zBbE0OSO5h4cYivDHA1vpFCmYa5lkxrpQsWMgPpsSo/S6hSFU/d
         YagrS1TDDiW8GXKX+wAKCbtDBQab9RM6796RgpeJPdYhUaFMdg/XN+UhiwSlbjKlyzxd
         pjvA==
X-Forwarded-Encrypted: i=1; AJvYcCXNYHTTaCk1E6+Pf38IcYaCIpf8DuejdPA5qWyAGtaz6uOwlFXgT+Hc24mVhdkIzz0sB7nVWS4yl0hpWw8GAXbnw8Ft
X-Gm-Message-State: AOJu0Yy2UmfR6duEK4wAAtypowt4bhgMNVafmlqe1kv3sRb7lOOi33ww
	GSutmvIyzsxr7OcRHq35jd20LeF2MSCdE2X0McY7vCyveLKTczb86heAiT+6PA==
X-Google-Smtp-Source: AGHT+IGXV+jQUuyUhwPLCje+0fj8XIZ3KQtQiZTK53j+7cd8QBLHXxtfW6qNqfI4owlQNalec+sXsg==
X-Received: by 2002:a17:902:e84c:b0:1e0:9ee1:d4cf with SMTP id t12-20020a170902e84c00b001e09ee1d4cfmr15834926plg.41.1712152110147;
        Wed, 03 Apr 2024 06:48:30 -0700 (PDT)
Received: from thinkpad ([103.28.246.48])
        by smtp.gmail.com with ESMTPSA id d5-20020a170902c18500b001dddce2291esm13281068pld.31.2024.04.03.06.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 06:48:29 -0700 (PDT)
Date: Wed, 3 Apr 2024 19:18:25 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jingoo Han <jingoohan1@gmail.com>, linux-pci@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	mhi@lists.linux.dev, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 00/10] PCI: endpoint: Make host reboot handling more
 robust
Message-ID: <20240403134825.GM25309@thinkpad>
References: <20240401-pci-epf-rework-v2-0-970dbe90b99d@linaro.org>
 <ZgvSrLpvChG4jqQl@ryzen>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZgvSrLpvChG4jqQl@ryzen>

On Tue, Apr 02, 2024 at 11:41:00AM +0200, Niklas Cassel wrote:
> On Mon, Apr 01, 2024 at 09:20:26PM +0530, Manivannan Sadhasivam wrote:
> > Hello,
> > 
> > This is the follow up series of [1], to improve the handling of host reboot in
> > the endpoint subsystem. This involves refining the PERST# and Link Down event
> > handling in both the controller and function drivers.
> > 
> > Testing
> > =======
> > 
> > This series is tested on Qcom SM8450 based development board with both MHI_EPF
> > and EPF_TEST function drivers.
> > 
> > Dependency
> > ==========
> > 
> > This series depends on [1] and [2].
> > 
> > - Mani
> 
> Hello Mani,
> 
> > [1] https://lore.kernel.org/linux-pci/20240314-pci-dbi-rework-v10-0-14a45c5a938e@linaro.org/
> > [2] https://lore.kernel.org/linux-pci/20240320113157.322695-1-cassel@kernel.org/
> 
> AFAICT both these series [1] (DBI rework v12, not v10) and [2] are fully
> reviewed and seem to be ready to go.
> 
> Considering that we have patches depending on [1] and [2],
> namely the series in $subject, but also:
> https://lore.kernel.org/linux-pci/20240330041928.1555578-1-dlemoal@kernel.org/T/#t
> 
> I think it would be a good idea if you could apply [1] and [2] to the
> pci/endpoint branch.
> 

Unfortunately, I cannot merge the patches outside 'pci/endpoint' even though
these are related to the PCI Endpoint subsystem. But I have delegated these 2
series to Krzysztof, so hopefully he'll apply it soon.

- Mani

> (It is not easy for people to know that they will need to rebase their work on
> these (fully reviewed) series, when they have not been applied.)
> 
> 
> Kind regards,
> Niklas
> 
> 
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> > Changes in v2:
> > - Dropped the {start/stop}_link rework patches
> > - Incorporated comments from Niklas
> > - Collected review tags
> > - Rebased on top of v6.9-rc1 and https://lore.kernel.org/linux-pci/20240320113157.322695-1-cassel@kernel.org/
> > - Link to v1: https://lore.kernel.org/r/20240314-pci-epf-rework-v1-0-6134e6c1d491@linaro.org
> > 
> > ---
> > Manivannan Sadhasivam (10):
> >       PCI: qcom-ep: Disable resources unconditionally during PERST# assert
> >       PCI: endpoint: Decouple EPC and PCIe bus specific events
> >       PCI: endpoint: Rename core_init() callback in 'struct pci_epc_event_ops' to init()
> >       PCI: epf-test: Refactor pci_epf_test_unbind() function
> >       PCI: epf-{mhi/test}: Move DMA initialization to EPC init callback
> >       PCI: endpoint: Introduce EPC 'deinit' event and notify the EPF drivers
> >       PCI: dwc: ep: Add a generic dw_pcie_ep_linkdown() API to handle Link Down event
> >       PCI: qcom-ep: Use the generic dw_pcie_ep_linkdown() API to handle Link Down event
> >       PCI: epf-test: Handle Link Down event
> >       PCI: qcom: Implement shutdown() callback to properly reset the endpoint devices
> > 
> >  drivers/pci/controller/dwc/pcie-designware-ep.c |  99 ++++++++++++++---------
> >  drivers/pci/controller/dwc/pcie-designware.h    |   5 ++
> >  drivers/pci/controller/dwc/pcie-qcom-ep.c       |   9 +--
> >  drivers/pci/controller/dwc/pcie-qcom.c          |   8 ++
> >  drivers/pci/controller/dwc/pcie-tegra194.c      |   1 +
> >  drivers/pci/endpoint/functions/pci-epf-mhi.c    |  47 ++++++++---
> >  drivers/pci/endpoint/functions/pci-epf-test.c   | 103 +++++++++++++++++-------
> >  drivers/pci/endpoint/pci-epc-core.c             |  53 ++++++++----
> >  include/linux/pci-epc.h                         |   1 +
> >  include/linux/pci-epf.h                         |  27 +++++--
> >  10 files changed, 248 insertions(+), 105 deletions(-)
> > ---
> > base-commit: e6377605ca734126533a0f8e4de2b4bac881f076
> > change-id: 20240314-pci-epf-rework-a6e65b103a79
> > 
> > Best regards,
> > -- 
> > Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > 

-- 
மணிவண்ணன் சதாசிவம்
