Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA53B179675
	for <mhi@lists.linux.dev>; Wed,  3 Jul 2024 13:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720014278; cv=none; b=tA2XQmccXqtQ+Wjx9w+qjjLgEx+m3C8GR6ylps+czO8zXOhWIuRufWAAIe0bh0TSoFF1WYmICmuY9/bANDIoWyv9gE2pDgtw+GEi6CjQDkM2aVsXB5NJh4mxzH8h6nC5RGEYCY4FVREvTxPDncRNHCNXf4BlN2jSeU2buRNMCGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720014278; c=relaxed/simple;
	bh=nhPgTJmso4P9z5HaQ17nlgFYzce76vz/kE6INpmWF48=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rNx3olu8KevIc8wmb0KA7G+8TYsIir1sIpSV1fqVbqZUA/8AgIYorB/rUbacHgXAGiQhyEObZoTukuAhIWqfDp/h5Xvft3FRoEw0P/mFQYSOuC6CyBKVB7aZfmm3hZzExH4TaGaXApXjoZKSEWhDPG6mnkYO7GKejuGWwGW2iSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ad5NlJD/; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ad5NlJD/"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1f70c457823so24933795ad.3
        for <mhi@lists.linux.dev>; Wed, 03 Jul 2024 06:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720014276; x=1720619076; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aw4OBzovSG3PPvJmkq+sEwfmyTaxbxw9mSwITjQ8wFU=;
        b=ad5NlJD/45GlcJNIdqyt0iF1ylRGv4bngVsHSnAxNmT2kOlRqF6sMXnVxTEttEGfYN
         kYe30u7EDL5tjKEvmu34aieqNM79KAu/P8vv2SvIHKVykJOz8jt8CsNmqpEbzorq577m
         LXPL+pr+LppanVPN4kX7zIXrGpvq2e0Br3z1eJAZ4KIInYrD3/tWk3ow0b5I0K+tcb+0
         CzYoXkumvIVAgrbKdJ6EPfzuM1ZWiPzBdkpicQasVsfQjI1d/sPWo2zxwbiDFJfUSLMP
         +SyfGJOTcGORMVOttviGR+KSf5InK4vCis3Xeqy15CN7XWeoI9iOYx3V/V3ToBvwVz4T
         aWVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720014276; x=1720619076;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aw4OBzovSG3PPvJmkq+sEwfmyTaxbxw9mSwITjQ8wFU=;
        b=PMI7vOt4G+wqBBhqpPRy6jd4DJZB5L7CeW4Ob2HWJIj85egMtr5UvehCqxqMLWLvX9
         J9X9hO4ac5ouRRRqKN2TDl2zy3/KQc50rwGZAnabD/grEW9No9lAh+NStj9eKY+laeQq
         kfCt6gnbOijoQ8+wqETj/wXpJRvaq6GB28OCdz7vACDrluTaBRtKlkICxyVZbBKdaaX8
         m5NvrvRWc4uMcCxCBFnjtpApXf1C0ZWttsTCoqCUvLUyaCOLunV9kKP2vG+RGgCZx79v
         V3/WiYhgmagvekT/6OmrXlUB4/qK0XAUukp3OkdgFw7TgSKjFZT/LhP4VdCqUktThNz8
         +POg==
X-Forwarded-Encrypted: i=1; AJvYcCUsrOm2gcKX60+CAOheHrieODFnldUb1X99yOB/9c3JNEI6aM55aGxXINL2+7lHhpPK2lH7ZQJKGEcLrZUEWMadLDcO
X-Gm-Message-State: AOJu0YwjkLrynGejoqWHvtaS9KOeiEsCWD0/XW12CY3dMd7P6NFjFY05
	5HcsSQNwNiq7rYfAX1rDWMGJjAN0VPVJ7OjW34XqjIoL2GfVsP5k0n2T5Fql2w==
X-Google-Smtp-Source: AGHT+IHqEnHI7Rj1hL7gUGi81gJe1aYQUJCuyxycj4mUXdiddpUKauXt0eXIlBtc37Zl8NAwCjn/2w==
X-Received: by 2002:a17:90b:1fcf:b0:2c8:b576:2b7e with SMTP id 98e67ed59e1d1-2c93d771fa4mr6663084a91.46.1720014275964;
        Wed, 03 Jul 2024 06:44:35 -0700 (PDT)
Received: from thinkpad ([220.158.156.98])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c91ce72abdsm10650855a91.32.2024.07.03.06.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 06:44:35 -0700 (PDT)
Date: Wed, 3 Jul 2024 19:14:30 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Slark Xiao <slark_xiao@163.com>
Cc: loic.poulain@linaro.org, ryazanov.s.a@gmail.com,
	johannes@sipsolutions.net, quic_jhugo@quicinc.com,
	netdev@vger.kernel.org, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] bus: mhi: host: Add Foxconn SDX72 related support
Message-ID: <20240703134430.GB4342@thinkpad>
References: <20240701021216.17734-1-slark_xiao@163.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240701021216.17734-1-slark_xiao@163.com>

On Mon, Jul 01, 2024 at 10:12:14AM +0800, Slark Xiao wrote:
> Align with Qcom SDX72, add ready timeout item for Foxconn SDX72.
> And also, add firehose support since SDX72.
> 
> Signed-off-by: Slark Xiao <slark_xiao@163.com>

Applied to mhi-next with fixup to commit subject and description!

- Mani

> ---
> v2: (1). Update the edl file path and name (2). Set SDX72 support
> trigger edl mode by default
> v3: Divide into 2 parts for Foxconn sdx72 platform
> ---
>  drivers/bus/mhi/host/pci_generic.c | 43 ++++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 35ae7cd0711f..1fb1c2f2fe12 100644
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
>  static const struct mhi_pci_dev_info mhi_foxconn_sdx55_info = {
>  	.name = "foxconn-sdx55",
>  	.fw = "qcom/sdx55m/sbl1.mbn",
> @@ -488,6 +500,28 @@ static const struct mhi_pci_dev_info mhi_foxconn_dw5932e_info = {
>  	.sideband_wake = false,
>  };
>  
> +static const struct mhi_pci_dev_info mhi_foxconn_t99w515_info = {
> +	.name = "foxconn-t99w515",
> +	.edl = "fox/sdx72m/edl.mbn",
> +	.edl_trigger = true,
> +	.config = &modem_foxconn_sdx72_config,
> +	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> +	.dma_data_width = 32,
> +	.mru_default = 32768,
> +	.sideband_wake = false,
> +};
> +
> +static const struct mhi_pci_dev_info mhi_foxconn_dw5934e_info = {
> +	.name = "foxconn-dw5934e",
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
> @@ -720,6 +754,15 @@ static const struct pci_device_id mhi_pci_id_table[] = {
>  	/* DW5932e (sdx62), Non-eSIM */
>  	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0f9),
>  		.driver_data = (kernel_ulong_t) &mhi_foxconn_dw5932e_info },
> +	/* T99W515 (sdx72) */
> +	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe118),
> +		.driver_data = (kernel_ulong_t) &mhi_foxconn_t99w515_info },
> +	/* DW5934e(sdx72), With eSIM */
> +	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe11d),
> +		.driver_data = (kernel_ulong_t) &mhi_foxconn_dw5934e_info },
> +	/* DW5934e(sdx72), Non-eSIM */
> +	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe11e),
> +		.driver_data = (kernel_ulong_t) &mhi_foxconn_dw5934e_info },
>  	/* MV31-W (Cinterion) */
>  	{ PCI_DEVICE(PCI_VENDOR_ID_THALES, 0x00b3),
>  		.driver_data = (kernel_ulong_t) &mhi_mv31_info },
> -- 
> 2.25.1
> 

-- 
மணிவண்ணன் சதாசிவம்
