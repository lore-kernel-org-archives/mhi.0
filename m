Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978CF43ABD
	for <mhi@lists.linux.dev>; Mon, 26 Aug 2024 08:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724659655; cv=none; b=smnypt779JA/O6j6mX+7i7Bkw3aTTAvLPPeJT5bv+bG5Y3huzru/FvghQe48oe8aCGcVyUoxjqankg2hv4IZauI2xuwuX/Vk3cUt/rluMHCM5gUsITVsWsAX+TegCpOrL+L7XWdMInyDsIrLlT6oVXtak6Nn16FHEkFaZac0/N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724659655; c=relaxed/simple;
	bh=hV7TuaBbJxdh8PMDEbM6FyaOUO1HfxZZRMdSrK8OE5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RRg208+J1aUVy7y/swzTU9uTVEZXUnRRu8ep1N2RwhD/4UqM5oPzzNpQFzglZM2joZ1IodoWepEmBbViYhbU5rB07HsiYPY3F49LiCTPi+zKIiZKjv0jOXcBJnice0ERf+xYTx802vVtvL/g+N1fCntxjtn247+4jo4PxWRjivk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Sk6LU4UB; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Sk6LU4UB"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2d3c05ec278so2846974a91.0
        for <mhi@lists.linux.dev>; Mon, 26 Aug 2024 01:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724659653; x=1725264453; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yvPqTM9lOHuvyIm7/RZh/RxFxg0X7bP4l3quDfoGQkE=;
        b=Sk6LU4UBjnaGANi8Lxv34zu1EMpeLaSy8jcNgaHGn3p9CujAmu4Kva9VMJGLslz1WJ
         GmrE8GZDzFju/8ZThNBfmIfktMh3pyBA9jT1fK48jWaIMZF1gLMJ6XGF4ypuqXMKJ23n
         RYqR0nLeErpplBgHXr84jzF8g1t5K3xsrD0+tn1bitlWu/LY1JglY1/N+tq8sGSFF+3J
         i/oTbW/OXy+E1Qx7RcR/LGYYKAqb9vfLdhYCjO1TeNQFdDuAzRc0byMNLgYP625fOACA
         wYGmzx5CPgC4D365wdIBM9jcuJqFyoFcjzRxIRb8cCbyR05TF6ehWlv8o/bIsBldZj23
         hh+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724659653; x=1725264453;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yvPqTM9lOHuvyIm7/RZh/RxFxg0X7bP4l3quDfoGQkE=;
        b=hTd8ULiTk1fIo9Hoo9j289pGvgyvICpSFJfHSP2MFpTROW+x9Yb093nR1OG5gKXTT9
         MHG8diMcKyQdxANGyq7RNUkzNEr7Y9giZXT3fX6GLKgBVA8XOBv+WDeTK+7yk9ngwqjw
         ts0O8eKqRkehmHKbZIkzJi9C7Xl+3YZYOb1757NS8PeqT71JJCedIrwAdAGiV/TVZe5n
         aPpp0cWbcR1aLPk9gi54r0XvqD3NTJg7eml8G33Eptqzzz8/K6n55JwdfAoDHPWMWcml
         16NqZkFcRO6KTry7I94YD2izdUWlL/cJbtQtVX9IB0kkmiUI2+U5IAxN6KpCPCzEYV7p
         kdFg==
X-Forwarded-Encrypted: i=1; AJvYcCVrT4pd7etdxuxcwPKVqcPXtgJ3QrJ61ylje1UQNIbk5mCSVyuDRi/yjSBGoqPs3r75u+Q=@lists.linux.dev
X-Gm-Message-State: AOJu0YywozqyQ/Bsi1cHnfbdJrshkpPbxOzhLt4VrkN3VaB+p965xOqx
	FNZpRP+tNxPAg+x8ZkqmCQcZAr0vuyQmWvglfL8bmY3YX2ye18wRhP0NPn9wSLKcbJeCUNQUJOc
	=
X-Google-Smtp-Source: AGHT+IFX23Te10Zeki5eDRR2JQF2WuxBqrUSKbBm0Dtnccf1x4S1ehHPRhh557+EAHWGUsykWovd3Q==
X-Received: by 2002:a17:90b:4f83:b0:2c9:80fd:a111 with SMTP id 98e67ed59e1d1-2d646bf2bd3mr8610579a91.18.1724659652847;
        Mon, 26 Aug 2024 01:07:32 -0700 (PDT)
Received: from thinkpad ([220.158.156.53])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d613b1cc67sm9071887a91.51.2024.08.26.01.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 01:07:32 -0700 (PDT)
Date: Mon, 26 Aug 2024 13:37:28 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Fabio Porcedda <fabio.porcedda@gmail.com>
Cc: Daniele Palmas <dnlplm@gmail.com>, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Fix the name for the Telit
 FE990A
Message-ID: <20240826080728.myy5whs5kmghnvvo@thinkpad>
References: <20240820080439.837666-1-fabio.porcedda@gmail.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240820080439.837666-1-fabio.porcedda@gmail.com>

On Tue, Aug 20, 2024 at 10:04:39AM +0200, Fabio Porcedda wrote:
> Add a mhi_pci_dev_info struct specific for the Telit FE990A modem in
> order to use the correct product name.
> 
> Cc: stable@vger.kernel.org # 6.1+
> Fixes: 0724869ede9c ("bus: mhi: host: pci_generic: add support for Telit FE990 modem")
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/bus/mhi/host/pci_generic.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 14a11880bcea..fb701c67f763 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -680,6 +680,15 @@ static const struct mhi_pci_dev_info mhi_telit_fn990_info = {
>  	.mru_default = 32768,
>  };
>  
> +static const struct mhi_pci_dev_info mhi_telit_fe990a_info = {
> +	.name = "telit-fe990a",
> +	.config = &modem_telit_fn990_config,
> +	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> +	.dma_data_width = 32,
> +	.sideband_wake = false,
> +	.mru_default = 32768,
> +};
> +
>  /* Keep the list sorted based on the PID. New VID should be added as the last entry */
>  static const struct pci_device_id mhi_pci_id_table[] = {
>  	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0304),
> @@ -697,9 +706,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
>  	/* Telit FN990 */
>  	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, 0x1c5d, 0x2010),
>  		.driver_data = (kernel_ulong_t) &mhi_telit_fn990_info },
> -	/* Telit FE990 */
> +	/* Telit FE990A */
>  	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, 0x1c5d, 0x2015),
> -		.driver_data = (kernel_ulong_t) &mhi_telit_fn990_info },
> +		.driver_data = (kernel_ulong_t) &mhi_telit_fe990a_info },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0308),
>  		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx65_info },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0309),
> -- 
> 2.46.0
> 

-- 
மணிவண்ணன் சதாசிவம்
