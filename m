Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E86140E5F
	for <mhi@lists.linux.dev>; Fri, 25 Apr 2025 05:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745557254; cv=none; b=rMnSmf7LNxTmdlpwhciIL67uJVDdWV/h3lVVrqb30FjwTZkwgjiYA1CAMdLdgFvGBSEs4KRwPDB889URcToVvcbqhK/6FNkEWcanxfzvCVRzuqUVXRD6BLxUGUw9Kzs3PabUI0pEWEgZ2zZPofrATfdGE/9H8pINhqm+2bdTzaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745557254; c=relaxed/simple;
	bh=jsRsBQqqYuTiofqMBPr9zN2f/zxOJI3wwSvBcHgiFh8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mgtNFDaE2H3zEBrNeNyQ6pZ9rnSC3Z17nNJuvSQeb3rMuc29vok0H9U/XivUKNnmVnPwu7ltslB04oJJwqI+iCdly3EBft3J72Enzfd9vTcpAwOwY8GgasrUiPJt8CU9SDQeUKcecm7kiQq8Vwh2xtse2JH1p8PZDLNwrEuCZ4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Et3LWXbl; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Et3LWXbl"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-736ad42dfd6so1605696b3a.3
        for <mhi@lists.linux.dev>; Thu, 24 Apr 2025 22:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745557252; x=1746162052; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bWUQw7BF6qOFvrmK64yOAiyAfdhX/yyNlejjZhluoEE=;
        b=Et3LWXblYZdu5pwQM93gBbqGchra8rS5kagm5/LQqdjm/aLLncf50eOOiwe7eFxyAf
         0j35mOBimZWKpH6tGZ5RXv0dUMQrKzJNcozCVlcMo7JKfvDdI+tIGkrrY0Nf5XD8SOvc
         6hmpcX8TK87Mit9c9am88bf0pCPOBBGM9ODSbhFAKttpE9R5NM9mh2l6mWwqEUhCYIhM
         DXlgpvYNa9jtQLQQdQ752GXsBqj9KnkBrvJSauXJzzwkQT5eTzv2fIO+AmEd8ot06eu5
         AArYwrm+WWs9ZWR3hqLHdph5w/BTsY27w6ENqdcd+R9kD2ohHJEsbbVJ5jCYg4E3up8X
         sI5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745557252; x=1746162052;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bWUQw7BF6qOFvrmK64yOAiyAfdhX/yyNlejjZhluoEE=;
        b=YtmoH/eEp0gMBJcP0VgrJEAM1bQiN1OC/4WOKsM/UQyN0gtQWFstubnRjI2q4q+vrA
         fhuXorcY/m2bSyHOL/Mjf7pFI2JnK/DYT29LPlES+lgfDG+/8rAEtqEwfBvkOBEa16iT
         4I1J/BuhMwEf+YMoUN83ATVTkBbIRa26FbANSLmChm/hj+UtNPF0l6AJx3SChl3ZJvYD
         PTOTVMvnSRPRQTbt8EKQKPLEMIwhNlLucSa9Q+42uIGgeZ/bvUGyxuT1EjIEHGKKNov3
         y+7zpP/kNrw2Z5Rb4+rb4oqaIRNvi4LPlJ+HsxD7lXXUYfuhTlVYGiDaHfKOWo8VPMBZ
         JoWw==
X-Gm-Message-State: AOJu0YwfqwU48x4iTjFkItm5bicmPJgJ5QpiDhVgteo4YqSlWW78kjtk
	BsVqJ7HpmA9OnKWP510vtemfdLp9fEELpA5qVgSuajM+oUYZGJb2w6QFhQyKXg==
X-Gm-Gg: ASbGncv8igJBayID/TC2l1mtDftG7n19v2uaS4WGKtC0r8zy4Ry/ox8o/BmLRgoriGF
	1EbWtmHzL6hGz3qMurff5EmbXkX85TpF668jxtrelDkkVoAy9CZ5T1BhPwgAxKRueHs4YNjukbE
	qVc9MI1QHIBfTYSb8ezsI4QTvDkf8EExI7nbh9UGCpGf/vup2ssQEWJiUV+sOBmY1e8e8EafJyL
	sceLqUuXKQrt5uUrL+76u26Zas0Svk952rV046CUt1xkTT4YcY88v7LQ2UxDUdbwpXeR39zK3yj
	QmUcF70Au5sEKiev9NJGZFbyrv9a7xObHFY/qaxQ0ZzWxBgyGsU=
X-Google-Smtp-Source: AGHT+IF+93Ze77YPoxfYOKdLnId7W7NxopgQ2nyluNktxUyk1Ns9mSAmPljJWg3qdOqk/ApQDZATqQ==
X-Received: by 2002:a05:6a20:d04a:b0:1f5:80a3:afe8 with SMTP id adf61e73a8af0-2045b9fa8a0mr1169419637.39.1745557251625;
        Thu, 24 Apr 2025 22:00:51 -0700 (PDT)
Received: from thinkpad ([120.60.77.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e259412a0sm2292743b3a.49.2025.04.24.22.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 22:00:51 -0700 (PDT)
Date: Fri, 25 Apr 2025 10:30:46 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Daniele Palmas <dnlplm@gmail.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/1] bus: mhi: host: pci_generic: Add Telit FN920C04
 modem support
Message-ID: <6amoyqyaxbvcfzgqmsjeo2isao3ijrle4krda66ellfrd6ondq@upwnk43vlnpr>
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

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

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
