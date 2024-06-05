Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE14421C17B
	for <mhi@lists.linux.dev>; Wed,  5 Jun 2024 05:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717566905; cv=none; b=fCM+lmf7h8Sx1xOCO6LhL5GnKwi1fQcLZ9CuZ7PKIl/cub5a+hn7DzWKGHWyrerbzJU+bB1GFsCVg42ppH3NM/i6mni78D/m+kIvI2a9rvxOXBF1wCKBzIVammhUtpyiX759Bi7Wt3MQw+/gWmP+tAULPG377GAgiS/DY0cnaD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717566905; c=relaxed/simple;
	bh=pT0vlRe1rncAiEJWLGJWVVrADwh3b6o5yFLYE0LLUGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hDmQa7IzxrQKQSABxwOua8kOnKL79pe5aqc+W0KMCFXcABpo2gRyr315PTiCsDfSSXJpDcvCe+d3qGhelB/QrnqoLFuF1qmGFQyEvmO4d25etwERWxI/fAZ1f48lYFzG3yKvR6VgCpUJ/anKoSUY2sejmN2/uv7EOrAhAVy+Gug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qrfzEigw; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qrfzEigw"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1f6ab88dfaeso722685ad.2
        for <mhi@lists.linux.dev>; Tue, 04 Jun 2024 22:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717566902; x=1718171702; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JBxfUq6WQmeXfNg09rhVdjOvmMp9FrtYAbzQqMG7sgI=;
        b=qrfzEigwXxSo/Qs6xlyjrHudH33KvYIvqM4Ki6Td0bz6wWTmOsJxdEKClX5NbSposw
         EkHQ7wrIwL9BxAlKgdHTajXdIE2CX7TzUdv5bqi9sFmxb/ZwyGtbs7n2WoWFM/J0cABv
         rlPaFaHDolXFC4y/LSxv03/pb8pp4U16oRqIuzKv+MxyRkD1wP+tpPM8Q78XV4c/hGOK
         TWkSoIvjrwreTzA1xpzg4xjmWxU7VT1cf+XinwDtit+r5bX/ojsnX5hGqtDVG4wieyT4
         bZJKtEiR3OPu9z+6oVGaAvSdfBkVggjlJ3Wz3X9xNW9rU3Twk+8MIVtrJ9VyrBkGMvFP
         h1nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717566902; x=1718171702;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JBxfUq6WQmeXfNg09rhVdjOvmMp9FrtYAbzQqMG7sgI=;
        b=J1gmMlhWDal9J5kZ48sj2TiBq0Adiqz813GlNz+s4xr2d9KhxzRI3kNqkAZhxPNyjl
         +yAWFy5WZ2A9abYA6K6UTrkSx2qChHdTU1JtSkyiFB8yQvKaynRSGd3RVprxQvJpFgnF
         A1Ouo7AkQT1+S0N/ihKAt1/tXAX6D/W6syrVSvkJ5PegREOMkCL3Z/6croJQjQlazSIF
         8+GZwnUBn0hOhzTIIc8Wy3THHCn82osPql0DPsRKnsG9Sohduso9zd14J3KSpfynpzj7
         /5B30iFmdHYrIwSkklZ7HkTZ9/CDpJeYduTdMot5LYAxc5+ZAEGHDPOnhr/jNvR4Gco9
         Kiqg==
X-Forwarded-Encrypted: i=1; AJvYcCXpH9hqJBMRn4E80bP76KyUhGfTEL48FiT+vhd3RgNVKFc1q5OWVQtxqEhYYcRv6UaK7zY5XN5EuUMpGe/DmWd64SMd
X-Gm-Message-State: AOJu0YxyV8j3saGE5+OHXe4bwN4NRMdzJ+LXfYOb9pik0C5YFxmixHeA
	MwCr2tcNK2gveQx0GUBeA3DPK3F2vXY8iXofgG9BBepMy0P1sKt7TlHcveZatN5wInJwUi/qZgk
	=
X-Google-Smtp-Source: AGHT+IHScUtk14Z1Yr2g0W5IQ/gHXNWp09PycuN+tvMzWowATHARRRe4GJC2SYoiN+/nkoD9jS6KRg==
X-Received: by 2002:a17:903:a0c:b0:1f6:87c:6f with SMTP id d9443c01a7336-1f6a5a84956mr15315165ad.62.1717566902118;
        Tue, 04 Jun 2024 22:55:02 -0700 (PDT)
Received: from thinkpad ([120.60.137.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f632339066sm96044795ad.22.2024.06.04.22.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 22:55:01 -0700 (PDT)
Date: Wed, 5 Jun 2024 11:24:58 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Slark Xiao <slark_xiao@163.com>
Cc: loic.poulain@linaro.org, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] bus: mhi: host: Add Foxconn SDX72 related support
Message-ID: <20240605055458.GD2417@thinkpad>
References: <20240520070633.308913-1-slark_xiao@163.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240520070633.308913-1-slark_xiao@163.com>

On Mon, May 20, 2024 at 03:06:33PM +0800, Slark Xiao wrote:
> Align with Qcom SDX72, add ready timeout item for Foxconn SDX72.
> And also, add firehose support since SDX72.
> 
> Signed-off-by: Slark Xiao <slark_xiao@163.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
> v2: (1). Update the edl file path and name (2). Set SDX72 support
> trigger edl mode by default
> ---
>  drivers/bus/mhi/host/pci_generic.c | 32 ++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 08844ee79654..0b483c7c76a1 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -399,6 +399,8 @@ static const struct mhi_channel_config mhi_foxconn_sdx55_channels[] = {
>  	MHI_CHANNEL_CONFIG_DL(13, "MBIM", 32, 0),
>  	MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
>  	MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
> +	MHI_CHANNEL_CONFIG_UL_FP(34, "FIREHOSE", 32, 0),
> +	MHI_CHANNEL_CONFIG_DL_FP(35, "FIREHOSE", 32, 0),
>  	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0_MBIM", 128, 2),
>  	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0_MBIM", 128, 3),
>  };
> @@ -419,6 +421,16 @@ static const struct mhi_controller_config modem_foxconn_sdx55_config = {
>  	.event_cfg = mhi_foxconn_sdx55_events,
>  };
>  
> +static const struct mhi_controller_config modem_foxconn_sdx72_config = {
> +	.max_channels = 128,
> +	.timeout_ms = 20000,
> +	.ready_timeout_ms = 50000,
> +	.num_channels = ARRAY_SIZE(mhi_foxconn_sdx55_channels),
> +	.ch_cfg = mhi_foxconn_sdx55_channels,
> +	.num_events = ARRAY_SIZE(mhi_foxconn_sdx55_events),
> +	.event_cfg = mhi_foxconn_sdx55_events,
> +};
> +
>  static const struct mhi_pci_dev_info mhi_foxconn_sdx24_info = {
>  	.name = "foxconn-sdx24",
>  	.config = &modem_foxconn_sdx55_config,
> @@ -448,6 +460,17 @@ static const struct mhi_pci_dev_info mhi_foxconn_sdx65_info = {
>  	.sideband_wake = false,
>  };
>  
> +static const struct mhi_pci_dev_info mhi_foxconn_sdx72_info = {
> +	.name = "foxconn-sdx72",
> +	.edl = "fox/sdx72m/edl.mbn",
> +	.edl_trigger = true,
> +	.config = &modem_foxconn_sdx72_config,
> +	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> +	.dma_data_width = 32,
> +	.mru_default = 32768,
> +	.sideband_wake = false,
> +};
> +
>  static const struct mhi_channel_config mhi_mv3x_channels[] = {
>  	MHI_CHANNEL_CONFIG_UL(0, "LOOPBACK", 64, 0),
>  	MHI_CHANNEL_CONFIG_DL(1, "LOOPBACK", 64, 0),
> @@ -680,6 +703,15 @@ static const struct pci_device_id mhi_pci_id_table[] = {
>  	/* DW5932e (sdx62), Non-eSIM */
>  	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0f9),
>  		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx65_info },
> +	/* T99W515 (sdx72) */
> +	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe118),
> +		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx72_info },
> +	/* DW5934e(sdx72), With eSIM */
> +	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe11d),
> +		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx72_info },
> +	/* DW5934e(sdx72), Non-eSIM */
> +	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe11e),
> +		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx72_info },
>  	/* MV31-W (Cinterion) */
>  	{ PCI_DEVICE(PCI_VENDOR_ID_THALES, 0x00b3),
>  		.driver_data = (kernel_ulong_t) &mhi_mv31_info },
> -- 
> 2.25.1
> 

-- 
மணிவண்ணன் சதாசிவம்
