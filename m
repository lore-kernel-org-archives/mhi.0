Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFBF148830
	for <mhi@lists.linux.dev>; Fri, 25 Apr 2025 16:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745596937; cv=none; b=V0rxDjPTOn7UCyPykgacEnXT6zvKP9CFANgCN5uEudmFxwZFeIU/yAm7PSsprvzpYXklFC+ZeCRpWzYdpldGjb2gVTczZYBS+OxLxIo2Pb7EJtGp9AJfoiwKjT/EyQFzcQx0KBAMY1yjzmCFY+o1BQKH8xmnOePkF5Czc9GCroo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745596937; c=relaxed/simple;
	bh=DgZXHclJOkx6g9lcO5qu3kZxuqYewO9zEwjAgW0mWLE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L6vJgWczkD9k+VBfScCzCY2AhD0FjZR+8/yqybEaED1CI6J1IWugcS8konZAtbdt+ZzczkVvg1OtGWMkEi+P2RTcus2QeApfqxDNFplJHALx9rhsTXGMerNq0wrOTrsjAkauIQquLxNwxaHLlUWnjeCMRXX9DTbrLf3Cg5qn1Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C8LSOt9p; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C8LSOt9p"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2ff784dc055so2394575a91.1
        for <mhi@lists.linux.dev>; Fri, 25 Apr 2025 09:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745596935; x=1746201735; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Od8v9uuxXAfd7uGKx+1reVesYOTCW7WP8EaaxY94+tg=;
        b=C8LSOt9pMKOj2bl6qeZjA662ipC33rUAVa8Bjp7G6t+DTw2W8eT/BU0cv3/JwnKDO7
         hzKz1ynhwWci7rmnD8XbmG1CIKOfpIIX7Oj1yz+MoFat1T3SM6nz17auVgOys/wF1BPF
         sxw0GFZeJcnsK1sCTaG2tAzAVZfUr0fIXp7YEfTget/ckF8M9T48PmNkCdd7frtNkI9h
         aWpWQQKSgvZWxV+R4uwsatADSxqkaM07LKUyfFaK5tVbCrsKzZJwEwSK3dSFiomYL8xX
         h7rjGCCxXZciuF5k+JucFHa9aNHlqY0mvfgkq3PX+w109qDS22PI9njePX9fcXpbhCcx
         XQrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745596935; x=1746201735;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Od8v9uuxXAfd7uGKx+1reVesYOTCW7WP8EaaxY94+tg=;
        b=CpGwpIuOJuGelcT+xz8o9Mbf7lOXh48HbW42iCj3qDsLIcszm/SlEygLhJg9PkC4rq
         X63O1Xhot0GkhxoR3l47MLSFHoH+q1O1s0iGAUjn7OXoHPI7CAMEwEx0KilNUxQksNw2
         +X3ckENsnYQkh1JH7qKvF+7ByzbgxUD+DSHZDy25HR5o7c16Y5NZwh/IGZkMyTcGU4Qx
         ptZEqrTrYIAZz2K5VTt6RtpLgMCxZu+aCc2sRdaTXRIGM/qNpHMqhtPZX4qoBxk50pd3
         J6yv1rO1PAiYbaoW+Q4qy74dPqDQcSOT0WDOE9Z/TcIykf2DnypTjSoZvZ9R8qb8PbWU
         Q7Qw==
X-Forwarded-Encrypted: i=1; AJvYcCWgP4uYTIxXzjOjzBmmwBdN00yNK2kP/to/kKWacJL7rA+ZiDy/qL20taSjDOk1TyjYJ7k=@lists.linux.dev
X-Gm-Message-State: AOJu0YyCjDIa9VWYCCJIY5RA21o6vrYzpzcQyT2YSoAH6aZUlOuordei
	o2W6GWtL2UO9i4gdfQn79e+rDdTRtA/VdppNsHlpNkMkaw+XkN/Fj/lk1P6sEg==
X-Gm-Gg: ASbGncuqrP9d6yUi9WoaXUoJSznRJgt6xFRqVKZ37z01dyDPC5iBwR5fpkAZKTGtcyd
	/0N2e0FJJm6tGC4e6YPZNKgy3iQ3sRNmiTXUmlhVD+rymnoRxsbZAs9MrB9BElMdK4eZAV17L01
	8vb+KK1Wjfz0Yhmu7fbnEKQ7Glwt6kUKA2o0KgibwpXjfazBX/o53iH6FgXSjl1TRvSU+0KjiU8
	ZY5UKMX2jPdCcOrb6f3Z6YGugw9ud4rvP7KQ50Vwc5o62g/U7APzyoF14dqy08nwNGlo4LB9vCL
	1F5/TjBoB6vNC2P7ugUvqeZ5GbTRdtNHd7RoIf67w4r6rZBWZegG
X-Google-Smtp-Source: AGHT+IHdQ4Ba18bl0q2QrVTsaExU1b+SHdhITO9CRQcmytTANa1AqTjF3k17LH9+AYX+x/7+IPAHdg==
X-Received: by 2002:a17:90b:264b:b0:2ff:58e1:2bc9 with SMTP id 98e67ed59e1d1-309f7e679aamr4543956a91.25.1745596934960;
        Fri, 25 Apr 2025 09:02:14 -0700 (PDT)
Received: from thinkpad ([120.56.201.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f784ac3fsm1806254a91.45.2025.04.25.09.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 09:02:14 -0700 (PDT)
Date: Fri, 25 Apr 2025 21:32:04 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Jingoo Han <jingoohan1@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Johannes Berg <johannes@sipsolutions.net>, 
	Jeff Johnson <jjohnson@kernel.org>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev, linux-wireless@vger.kernel.org, 
	ath11k@lists.infradead.org, quic_pyarlaga@quicinc.com, quic_vbadigan@quicinc.com, 
	quic_vpernami@quicinc.com, quic_mrana@quicinc.com, 
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: Re: [PATCH v2 03/10] PCI: dwc: Implement .pre_scale_bus_bw() &
 .post_scale_bus_bw hook
Message-ID: <6zuyux2emotjxouvo36ijojz4xel7x7aozyem55pmd3xvpbgjs@6abrkkzj3bib>
References: <20250313-mhi_bw_up-v2-0-869ca32170bf@oss.qualcomm.com>
 <20250313-mhi_bw_up-v2-3-869ca32170bf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250313-mhi_bw_up-v2-3-869ca32170bf@oss.qualcomm.com>

On Thu, Mar 13, 2025 at 05:10:10PM +0530, Krishna Chaitanya Chundru wrote:
> Add support for pre_scale_bus_bw() & post_scale_bus_bw() function op's.
> Add support for DWC glue drivers to register for these ops.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/pci/controller/dwc/pcie-designware-host.c | 21 +++++++++++++++++++++
>  drivers/pci/controller/dwc/pcie-designware.h      |  2 ++
>  2 files changed, 23 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> index ffaded8f2df7..4da4df62c3f8 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -697,10 +697,31 @@ void __iomem *dw_pcie_own_conf_map_bus(struct pci_bus *bus, unsigned int devfn,
>  }
>  EXPORT_SYMBOL_GPL(dw_pcie_own_conf_map_bus);
>  
> +static int dw_pcie_pre_scale_bus_bw(struct pci_bus *bus, int target_speed)
> +{
> +	struct dw_pcie_rp *pp = bus->sysdata;
> +	int ret = 0;
> +
> +	if (pp->ops->pre_scale_bus_bw)
> +		ret = pp->ops->pre_scale_bus_bw(pp, target_speed);
> +
> +	return ret;
> +}
> +
> +static void dw_pcie_post_scale_bus_bw(struct pci_bus *bus, int current_speed)
> +{
> +	struct dw_pcie_rp *pp = bus->sysdata;
> +
> +	if (pp->ops->pre_scale_bus_bw)
> +		pp->ops->post_scale_bus_bw(pp, current_speed);
> +}
> +
>  static struct pci_ops dw_pcie_ops = {
>  	.map_bus = dw_pcie_own_conf_map_bus,
>  	.read = pci_generic_config_read,
>  	.write = pci_generic_config_write,
> +	.pre_scale_bus_bw = dw_pcie_pre_scale_bus_bw,
> +	.post_scale_bus_bw = dw_pcie_post_scale_bus_bw,

Please do not add these multi level ops without necessity. Just populate the
callbacks in qcom_pcie_host_init(). DWC has nothing to do with these callbacks.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
