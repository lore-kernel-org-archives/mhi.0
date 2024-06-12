Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFAF824B4A
	for <mhi@lists.linux.dev>; Wed, 12 Jun 2024 04:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718166989; cv=none; b=cHodIHDMpEgfNyJhLD1NLlJJiGn5EEYe+f3O2jcJCEMuE5fsgrsakCkRmWlG3CY9GcKM6xk5o3mf2Kqr9zT3iKsiiLO1w+SUcc9OOVuKGlaV7geg9HC4gUkW2Gu3YMAUoWw321mEVzTpdacgxr0PUtrTNTWNCtmRonyRM3fb+vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718166989; c=relaxed/simple;
	bh=EO0aImAqYw7a/OBDl+S8gijoba1Ra+Y0nG8ZUi4cOaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BNpCMXu+lIxfklmQnvXQ8derFWuZpWUVmQeRIqAa09f1C1httJWoL6Hkow/feKYyzopf0WZj+TpWO218NLRJzQDnzB+Iah1oJPzfgucKECjQvZOKQ/oFnQ5b+4t6K3ZzT5zjkpAdAiWUpSoPSHUhNp+NusMoYA1SWtt/FFLSV8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xT9pBdy8; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xT9pBdy8"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-254c22faf4cso1299025fac.2
        for <mhi@lists.linux.dev>; Tue, 11 Jun 2024 21:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718166987; x=1718771787; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vH+4iQ0Kxj/vMdKXd1GL4axukTJSkL87xzz/uOsZjd0=;
        b=xT9pBdy8OdUohzyxLQWLJPoovawYIAn/IZFjDBPEiD3Yeym6HjamkDgQM4ghnWb7gN
         eyWkRiA4Sj9iGYuh6IcZe1bpjXVOpc+xesBmjl0WD9EfhWoH7FylKdWldJOyAAdtf1Yd
         0hOJjqDCJW0/6GryL0YJQYFHg2AY7Ot60qRQiL5YdwInKl5yvP5nWWYtlCaHNm/VJ4uq
         LWpKBRk4kWzDcpM2Z1ZQ/YPx4UJJsaWNpCtvEclXvkbM7/IP0Wwr5H57KJ54LxV6NGgk
         npjtU79fPshaIL/rXMzac+gUx86/qk9j3ECozS3KSChvpaoyAWxgR0xleUDTJxhvCQDb
         1hZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718166987; x=1718771787;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vH+4iQ0Kxj/vMdKXd1GL4axukTJSkL87xzz/uOsZjd0=;
        b=HenA6tm1wORSva1/yIz3vadZ9JTDTG+dJXmIk9yV55Me39gdKoSYhA+fGE/2FI4c6W
         IWuBNY9lrgnOHwhG2krSq0kUkplKU3Y7kNe1GxztsQ2pfOGDuQIcjwP0U+kUvTbx3GBi
         qP0hgfhjrseBHBUVesgKMHdfa8kUYCvNjoGNHMy+M4Lh4AX9f6/NknN39zeHzZO75IdV
         ddcHgro5NPacf19559TAwPHlmNOnlpMYkTBx75cmEcBy41POWFmrDJ5yz21o1b6zTbHq
         C20yL9Tu+nXEPvbINaUyAiwRi9MpzQkXp7KqwJd5oDSpJE6vDXL6zPOOiKtInwk/tSXy
         4ZZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIO9RYTpX5XET4mlvN8pFZQcU7YyRyv/dHyajnXbIlAIt0OrrmtNB3qFzFPZvi1U/oFVJmbhhRR58Q2qf5lPkfQeWe
X-Gm-Message-State: AOJu0YwSymFFl+Tkqmqbit9BNJmAB6wk0jO2XSe7iJl+39WgWiQeQvd8
	5mpHQSjezD/0Gi2zrSRs45ytdKtwHtxaD+cojHYaJFfLT3+5gkg+/4JcHIEYXg==
X-Google-Smtp-Source: AGHT+IF/i1Z4g1iXpug+xajahacKVwnIvfnsiSOznBlRwgjL1WHJ0xairr9brTYDWvv7YNpLZYuzDg==
X-Received: by 2002:a05:6870:d186:b0:251:46d:d32a with SMTP id 586e51a60fabf-25514b4e021mr927373fac.8.1718166986969;
        Tue, 11 Jun 2024 21:36:26 -0700 (PDT)
Received: from thinkpad ([120.60.129.29])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6e9a52a3012sm5409033a12.30.2024.06.11.21.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 21:36:26 -0700 (PDT)
Date: Wed, 12 Jun 2024 10:06:12 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Minghuan Lian <minghuan.Lian@nxp.com>,
	Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Srikanth Thokala <srikanth.thokala@intel.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-omap@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@axis.com, linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
	mhi@lists.linux.dev, Niklas Cassel <cassel@kernel.org>
Subject: Re: [PATCH 2/5] PCI: endpoint: Introduce 'epc_deinit' event and
 notify the EPF drivers
Message-ID: <20240612043612.GC2645@thinkpad>
References: <20240606-pci-deinit-v1-2-4395534520dc@linaro.org>
 <20240611220640.GA1001976@bhelgaas>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240611220640.GA1001976@bhelgaas>

On Tue, Jun 11, 2024 at 05:06:40PM -0500, Bjorn Helgaas wrote:
> On Thu, Jun 06, 2024 at 12:56:35PM +0530, Manivannan Sadhasivam wrote:
> > As like the 'epc_init' event, that is used to signal the EPF drivers about
> > the EPC initialization, let's introduce 'epc_deinit' event that is used to
> > signal EPC deinitialization.
> > 
> > The EPC deinitialization applies only when any sort of fundamental reset
> > is supported by the endpoint controller as per the PCIe spec.
> > 
> > Reference: PCIe Base spec v5.0, sections 4.2.4.9.1 and 6.6.1.
> 
> PCIe r6.0, sec 4.2.5.9.1 and 6.6.1.
> 
> (Not 4.2.4.9.1, which no longer exists in r6.x)
> 

Ammended the commit in pci/endpoint, thanks!

- Mani

> > Currently, some EPC drivers like pcie-qcom-ep and pcie-tegra194 support
> > PERST# as the fundamental reset. So the 'deinit' event will be notified to
> > the EPF drivers when PERST# assert happens in the above mentioned EPC
> > drivers.
> > 
> > The EPF drivers, on receiving the event through the epc_deinit() callback
> > should reset the EPF state machine and also cleanup any configuration that
> > got affected by the fundamental reset like BAR, DMA etc...
> > 
> > This change also warrants skipping the cleanups in unbind() if already done
> > in epc_deinit().
> > 
> > Reviewed-by: Niklas Cassel <cassel@kernel.org>
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

-- 
மணிவண்ணன் சதாசிவம்
