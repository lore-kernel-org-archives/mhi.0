Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21415170A11
	for <mhi@lists.linux.dev>; Fri, 25 Apr 2025 15:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745595979; cv=none; b=pnYkJxGPKLE7OCU8/R3Md7J8LQe58NhhBiEusGhoUwWqodesQJkqY86xNeozpz+AN1aUnmCBPoIYFTAq982XFPIhPuj+FjmBGBoSI1HDE3zwGDHs2fvoKa62KZFI6m14WasOrGWWH+bFCR11utUBTL4vtY4vNqbNTgWlQijDBAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745595979; c=relaxed/simple;
	bh=OEN/M7xAkfDtjvNwKlr/jucG4cQOWcjtHRGd69J9SGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cDi7KLQMjP1P63JMbU+UaqFskm1b1lIuEkkkiAyJOdbD+ZnL24tW6kofYkZeHI59GSSlgagdpAS2u0GGYQQ45q6SShNEOHFBgvvQfDfIb1tGfwfxq3PbDn1Mi2klDI+Dse+1Gu5ANW5EVcP/ZYaFnOgDhoVhOnXOE8ckvdX9peQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AGoPTd70; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AGoPTd70"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-736c277331eso3494140b3a.1
        for <mhi@lists.linux.dev>; Fri, 25 Apr 2025 08:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745595976; x=1746200776; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b0yjiKObWEJiwO02DaOrPmXbmFq+eaftYKKT34xnJk0=;
        b=AGoPTd70ngaGxupEI9UbL+FnsdGgYb5jiizIhrLFOD5/x/+nriIKKMBppwiE0Jr3UQ
         L0hpkxLPF0XaLPZa6qB3SVaS8Z2B8th/RLZKxqlrAvY4TG0l4UTrGZiQd/FB5uw6w9HY
         RBVKyNArbmbptngRkQynGtJofeIlOs3WVEMdK72EZ1qQHGdMVMJYQT8JC9Uxoqft9Deb
         2Ly6prfkFp5AzvigKH0mdh6rQIRpCRpe5mc35sDB9G2Xu8DHnPWKxX96b/SIyF7+RMWk
         0lbUnZYjtFRcm7Q5Bb06lism1EsDEOb1Xk8ryeguPZ9ol9vdErQJgF9Z2LI/wIfamdyr
         V5EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745595976; x=1746200776;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b0yjiKObWEJiwO02DaOrPmXbmFq+eaftYKKT34xnJk0=;
        b=jAuZVFknh6E6//AYlsf4o0k0NmHrIoCSXmIKmPj69fT0X+on2AsSDqwtA8OhFAwJaJ
         qcpuJ0szKmt19VI8l4hU5s2NuyCF77mkS2PfK5ncwesJUnfi45oFE8C1qBbh5GLkf1Iz
         K/vkNI3dnG3mc/1bdA26SCUhcqB2xFx9r6EkV/XXWmFQ8s8TCaZueZhjphBzcjUWZtym
         mFARj166xzTR/tslkn9Lg6NKUZKithIVQebcQz6/QmO1J7anhIo2tfkXpWQ71sWXyZ2o
         1Kzltior2ZqGtiXuLxGQU2KY6xMb2IRjiZ5YYFP9Pk6ECkky9TZdkOpQFvKOQOIf6EMh
         6tRA==
X-Forwarded-Encrypted: i=1; AJvYcCVh301gl0bf/tUTIruNfqbTxLYk8M94agOp4p6zGFQnlqfxOqtQSH4NcCyCHOYTzIdm61I=@lists.linux.dev
X-Gm-Message-State: AOJu0YylY4gKr50B3ErMuXASOarVMza7igWYztNkI+zKcGKjnvPTCdE9
	9k5AOMHfPE3TWThAlUnEeesBRlfMJQSNm68r9dM7LnkNJPbs4LKoGmZIvJ+1ZA==
X-Gm-Gg: ASbGncvTdXtwrCZLjIUEt/8DyykcWBa7c9mJ52FlT02x5lWS3EAgiAj6DwW8u/xB+Ny
	vBlgJeigzG40RGtLEgLXp+U1H+20907UV9ps7JOuZY5Z7ZG/bOPbJCPMtFcBW817II0MdPQn+S+
	3/Uwyzu1uhdCL2VvIFB05cplqKdxGOxx6NELHJz23W9q6UJjTYSt9N2RiN4rgaTe+MatRSXvfpR
	hdoDV6Wpgo8HgQiIl4/p8d3/XxvxpFwI0oJCGRrPhPWx+1bKx5KlZHgzMzZhDuQDJavV2l5Vasi
	teBp81013wP6QDB2hid9XLHm55AJXXOrlShEVvUvUDPmSTDnVbji
X-Google-Smtp-Source: AGHT+IGs6qXZbOiWmzBGdrbn2GeizUSvYWBYF7LQu+E/gHowSvXPMU/F/cIhQAuYikQ05w1s5IHkLg==
X-Received: by 2002:a05:6a00:e1b:b0:736:b3cb:5db with SMTP id d2e1a72fcca58-73e268ee7b6mr11186888b3a.11.1745595976351;
        Fri, 25 Apr 2025 08:46:16 -0700 (PDT)
Received: from thinkpad ([120.56.201.179])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25967608sm3316408b3a.81.2025.04.25.08.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 08:46:15 -0700 (PDT)
Date: Fri, 25 Apr 2025 21:16:09 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Jingoo Han <jingoohan1@gmail.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Rob Herring <robh@kernel.org>, 
	Johannes Berg <johannes@sipsolutions.net>, Jeff Johnson <jjohnson@kernel.org>, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev, 
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, quic_pyarlaga@quicinc.com, 
	quic_vbadigan@quicinc.com, quic_vpernami@quicinc.com, quic_mrana@quicinc.com, 
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 01/10] PCI: update current bus speed as part of
 pci_bus_add_devices()
Message-ID: <azxdhgvf6vo6eilmdmxa2ryir33h5uqwuru2a7jrgjuunyncrb@q3fdjhcaskjm>
References: <20250313-mhi_bw_up-v2-1-869ca32170bf@oss.qualcomm.com>
 <20250313170001.GA738398@bhelgaas>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250313170001.GA738398@bhelgaas>

On Thu, Mar 13, 2025 at 12:00:01PM -0500, Bjorn Helgaas wrote:
> [+cc Bartosz since this is related to pwrctrl]
> 
> On Thu, Mar 13, 2025 at 05:10:08PM +0530, Krishna Chaitanya Chundru wrote:
> > If the link is not up till the pwrctl drivers enable power to endpoints
> > then cur_bus_speed will not be updated with correct speed.
> > 
> > As part of rescan, pci_bus_add_devices() will be called and as part of
> > it update the link bus speed.
> > 
> > Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> > ---
> >  drivers/pci/bus.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/pci/bus.c b/drivers/pci/bus.c
> > index 98910bc0fcc4..994879071d4c 100644
> > --- a/drivers/pci/bus.c
> > +++ b/drivers/pci/bus.c
> > @@ -432,6 +432,9 @@ void pci_bus_add_devices(const struct pci_bus *bus)
> >  	struct pci_dev *dev;
> >  	struct pci_bus *child;
> >  
> > +	if (bus->self)
> > +		pcie_update_link_speed((struct pci_bus *)bus);
> 
> Why the cast?  I guess to discard "const"?  I would prefer to avoid
> that if we can.
> 
> The only existing callers of pcie_update_link_speed() are from bwctrl,
> where it obviously makes sense because bwctrl manages link speed, and
> from pci_set_bus_speed() in the pci_alloc_child_bus() path.
> 
> If we call pcie_update_link_speed() here, do we still need the
> pci_set_bus_speed() in pci_alloc_child_bus()?
> 
> Bartosz, so you have any suggestions?  Is there a point in pwrctrl
> where it would make sense to do this, similar to what bwctrl does?
> 

I'm not Bartosz, but I could speak for pwrctrl.

This should really be part of pci_pwrctrl_notify() in pwrctrl driver. Pwrctrl
driver is already getting notified with device additions and removals. So the
update can be performed once the device addition happens.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
