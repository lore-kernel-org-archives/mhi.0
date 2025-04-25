Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A19D134A8
	for <mhi@lists.linux.dev>; Fri, 25 Apr 2025 07:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745565719; cv=none; b=cTUwaOot6W8Lnh3IZu9jQSfENFjxGEbr5JoCEQruEv8A45kVYOORrsBvQlismmA0kipHJRfkB98LOIPmNFJNEgBsqKqYMq+M1ssX1m+fHvRbq+QMDtm7UmVS2XWLpNBNJfvApzuudPnVDq5Ml0JlhUP+BGP9AVTztzLLsfWYlOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745565719; c=relaxed/simple;
	bh=OVYLMqdeN9JePfZ+3tRyCwBv8IW+C3j3nRU2YOal6To=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=khsHYk97fLY5KZ9zLGyAxo/0HJBaDmg9XospP2C9N9ujtjq1A1vDPihDEfFBhGFfSyOL0s1PvvVJpWo9sboi2hQDc0z0qAyfZuW/sarG4i0vrRRaz7crDuMSlsDOdWaMLMTRu5fbgS6Fi9xwpDlCIOufHlAymInxRzG0Eqq+xUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=claREKkF; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="claREKkF"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-736c277331eso2968168b3a.1
        for <mhi@lists.linux.dev>; Fri, 25 Apr 2025 00:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745565717; x=1746170517; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SWmw/e+yp+buQszRg7iMmind/4WdatLNhW4iVUDUoLA=;
        b=claREKkF4dFTxoUidrSQdu8lWxG9NGpXQCb+BV9x9C5ZqlsiVpdPvyJwpAs4eAc0BF
         JtW7V2Fz2j1CVQezmKGPzAhwtpgH4ND7dYON4BaPb8G6ap3m6r3WgdkzukXPDSu2dQjQ
         o2fbYaPLv1e7HXVHLwL7EMuNAOyQbiYFDHgZfiV8nQgYIplavifH1471bsOjaxOaXcQO
         a3CqCT0HwAkKbcCG3E7Y/ZKTMgZX7GYMAOzSk8gFkdwJbWkVYbU2+tttAm1BqEcg1aqP
         8k2ARb5/KJKAy4PWKJzM5IFkGpoSPK4hSh1LJdYJXh89t7glYgrsg4Z2owHAj46C/ggU
         /YrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745565717; x=1746170517;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SWmw/e+yp+buQszRg7iMmind/4WdatLNhW4iVUDUoLA=;
        b=NNm7GSE4Zbg/Q+vxT9cYy5qXvU4KU27oosEHSqWN5elNhwl+8c44OKbgqaLplPnPqP
         4YH9jRZ2AoUjoytKejTnMv0T4/jY+Kp0sjeyeIHGASlF3J1Jx26lTU3GTdjowRmSDZ7T
         FpOsugLfBibqrRpIArImvll0aFtH0NjPpc1Kpsb+geJSQWTVZ+/PlddGXcm39X6O0fwL
         9oLeLtxDTr8G8dE7TXGNnEMdhhYP5DmDytKvBUsvNo3+RJGdG1eSybG74hFgjCEMgBlW
         pyg+HsK+ajaNZuII6J6dIGNIqTkn/O7zjz3SCtVv7R5EgIc8/K+UH+pY4/cxGkLJu5xd
         AjDg==
X-Gm-Message-State: AOJu0Yz9NAV/d6J3sOJEFfLStZ5YquZzADt6bMXjDtXiQ/zNmpgf2eaw
	U/gkv1PbbE9QVz03iA7lZ5XTLDYU/jTscefMAxWqVREPh5cCoOvNiHk1fuiQjQ==
X-Gm-Gg: ASbGncv6rjxO4k6Ya+/yoRmVMmaiOzvZEBdT7YDbXVEFgkxbn3bfIUWhOVfWL69PcVz
	Tn0YTMCXbzG/3jsDcsX+SVmZpfXyjwb8gNVw/GH5VxNResD7xykW69X02EBzSmCR2+MC53rB714
	D6xS7r7VlyuTAYOuZft6goARWEQqBWZChc71RgRYyqF61RkceL1fx3nyk4UO0pCAixhdiAZUh3C
	CiRAlj4f51KsfTOg7aQjAmN2k3T6XT2BcCQ0lC+H06jdVcgurFltmiRUFZHngY/y3nxyve69rct
	zBp0bERVno3briRmOI0ehNqiwpPaKqE7JMz+RE9gKuJvZwFBIaM=
X-Google-Smtp-Source: AGHT+IGCzDfSM+rX6rCv0LKlVKN7HheXt0gu+Ub5Tjp8NB3SBL++anF8IgmYvWuP5Dts2OoziFEWdQ==
X-Received: by 2002:a05:6a20:7f9a:b0:1f3:1ebc:ea4a with SMTP id adf61e73a8af0-2045b5f604dmr1773723637.20.1745565717217;
        Fri, 25 Apr 2025 00:21:57 -0700 (PDT)
Received: from thinkpad ([120.60.77.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a6a17csm2523876b3a.111.2025.04.25.00.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 00:21:56 -0700 (PDT)
Date: Fri, 25 Apr 2025 12:51:54 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Daniele Palmas <dnlplm@gmail.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/1] bus: mhi: host: pci_generic: Add Telit FN920C04
 modem support
Message-ID: <zuyh7fso5f5cmbdez3gt2s3vlmwtzo2wtojirdzq6br7mbaecu@qu7dtmc4xmip>
References: <20250401093458.2953872-1-dnlplm@gmail.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250401093458.2953872-1-dnlplm@gmail.com>

On Tue, Apr 01, 2025 at 11:34:58AM +0200, Daniele Palmas wrote:
> Add SDX35 based modem Telit FN920C04.
> 
> $ lspci -vv
> 01:00.0 Unassigned class [ff00]: Qualcomm Device 011a
>         Subsystem: Device 1c5d:2020
> 
> Signed-off-by: Daniele Palmas <dnlplm@gmail.com>

Applied to mhi-next!

- Mani

> ---
>  drivers/bus/mhi/host/pci_generic.c | 39 ++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index efe43592e170..57e2360c397b 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -782,6 +782,42 @@ static const struct mhi_pci_dev_info mhi_telit_fe990a_info = {
>  	.mru_default = 32768,
>  };
>  
> +static const struct mhi_channel_config mhi_telit_fn920c04_channels[] = {
> +	MHI_CHANNEL_CONFIG_UL_SBL(2, "SAHARA", 32, 0),
> +	MHI_CHANNEL_CONFIG_DL_SBL(3, "SAHARA", 32, 0),
> +	MHI_CHANNEL_CONFIG_UL(4, "DIAG", 64, 1),
> +	MHI_CHANNEL_CONFIG_DL(5, "DIAG", 64, 1),
> +	MHI_CHANNEL_CONFIG_UL(14, "QMI", 32, 0),
> +	MHI_CHANNEL_CONFIG_DL(15, "QMI", 32, 0),
> +	MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
> +	MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
> +	MHI_CHANNEL_CONFIG_UL_FP(34, "FIREHOSE", 32, 0),
> +	MHI_CHANNEL_CONFIG_DL_FP(35, "FIREHOSE", 32, 0),
> +	MHI_CHANNEL_CONFIG_UL(92, "DUN2", 32, 1),
> +	MHI_CHANNEL_CONFIG_DL(93, "DUN2", 32, 1),
> +	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0", 128, 2),
> +	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0", 128, 3),
> +};
> +
> +static const struct mhi_controller_config modem_telit_fn920c04_config = {
> +	.max_channels = 128,
> +	.timeout_ms = 50000,
> +	.num_channels = ARRAY_SIZE(mhi_telit_fn920c04_channels),
> +	.ch_cfg = mhi_telit_fn920c04_channels,
> +	.num_events = ARRAY_SIZE(mhi_telit_fn990_events),
> +	.event_cfg = mhi_telit_fn990_events,
> +};
> +
> +static const struct mhi_pci_dev_info mhi_telit_fn920c04_info = {
> +	.name = "telit-fn920c04",
> +	.config = &modem_telit_fn920c04_config,
> +	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> +	.dma_data_width = 32,
> +	.sideband_wake = false,
> +	.mru_default = 32768,
> +	.edl_trigger = true,
> +};
> +
>  static const struct mhi_pci_dev_info mhi_netprisma_lcur57_info = {
>  	.name = "netprisma-lcur57",
>  	.edl = "qcom/prog_firehose_sdx24.mbn",
> @@ -806,6 +842,9 @@ static const struct mhi_pci_dev_info mhi_netprisma_fcun69_info = {
>  static const struct pci_device_id mhi_pci_id_table[] = {
>  	{PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0116),
>  		.driver_data = (kernel_ulong_t) &mhi_qcom_sa8775p_info },
> +	/* Telit FN920C04 (sdx35) */
> +	{PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x011a, 0x1c5d, 0x2020),
> +		.driver_data = (kernel_ulong_t) &mhi_telit_fn920c04_info },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0304),
>  		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx24_info },
>  	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0306, PCI_VENDOR_ID_QCOM, 0x010c),
> -- 
> 2.37.1
> 

-- 
மணிவண்ணன் சதாசிவம்
