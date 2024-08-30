Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F75618F2D5
	for <mhi@lists.linux.dev>; Fri, 30 Aug 2024 11:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725018946; cv=none; b=mLeARserTYKjZlL8d+iGoMuG8xt1BEHo1CkxIyrFMklW/JucQws0Jl6xvUe6JAiQr8vlOWl++S+xZ1+tFsiPc0u9GJ+jNW8ksC+l3qA1SWsNGKfoj/6qsZp7g8xI1jTUTnpU9t1mwGJ1dBE993Kff08P11UVy6PYS60yGfRVNWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725018946; c=relaxed/simple;
	bh=uRPx9Gzpb7WsqBteaCH5lSTBTmLKdmt2JEQyfg5CEtU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WXDP5wlXbwXBQrHOrbQ/c24vUC2AnQiSEkP2dBXJwYu+/Ga163ubGKzEfmEJpNMRIxURh3/WgJbr6EzL79dBp78k3CB5Ne7iwZLmtbZfey/HNzhCdyTcMUywLF3COW4kLYFaSaxJ1yRtJ32YJ3KOrp0C5VabO1nEq1yDwJKRego=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gkv0ivwR; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gkv0ivwR"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-714114be925so1401522b3a.2
        for <mhi@lists.linux.dev>; Fri, 30 Aug 2024 04:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725018944; x=1725623744; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vj5tQXBLna4Jks1OEg0AoadJI6GOwdLoSVDTmyvlHAc=;
        b=gkv0ivwRXNtlPi7WlHJ7rvcwW9Kj8nthSrBfzjcJHBPlqFx4NJW4S+Roc6cYEWy1j8
         r56+IcIs5B96Bj/mJYkZzyH2i/ussmmAeGzGeZohUcPDjWzsSh37Us8HCfGWvDhCP6jQ
         ZfYLo5IW023Vm9zIn1JX8Eh++SpRWIqNxn4pm/aO5sY1JKTlNkG7Bkj4IIcB94Zocve9
         sKFlpEfS7IZvE4iSlqMPgGstKtEYR/GEYebp/Fhp/2Cy+X6llOlWrfOr+7B0nFAhu+N2
         QyMO1x4S0nWwKmLOGpC3fAz9/OuVeY5Lqup5TlGxbcIv3cGEzRQGHcJFySGz0yqU+i30
         8h0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725018944; x=1725623744;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vj5tQXBLna4Jks1OEg0AoadJI6GOwdLoSVDTmyvlHAc=;
        b=nKE5emVFHf/ShTM0Aw9wsVET0Uvev0/fcuxQgaGIpuVGJCtBZj3URF97inRMvZihxN
         SJeLmpJd86Z9EijQh1ZMZpd6tkVyedmPSTLvDf7PKP5+wGJVMOkiVr5L8GLqV6NncXku
         vKdSlQc9wMF6kK/S4odM1G8iVeuzFA2vYNlQCsZd8bOBhRaew7hzROkRMUrG6rs8IFo1
         xrknnmYn5V9Jzuj0+fsyaOpY8d8GPslEvmuTw/7OM14+3zYDbhTf5SoAA3XSedGK7LMX
         WNoRMD3P69xUuHRuSy1iyHeVqB5JZEecsk0YStrnZ3hef7mUXXBgDJT0f9erljwcPt/S
         m1Tw==
X-Gm-Message-State: AOJu0YwKZymVmEDsS58LJ69Qe0rVJroU82QAj2VMSvnLetKmkfFFZiJR
	vbK/MHwxD6ZCaFTDNUZOyYkOaawGFDc0EfhVD9i7xr4wDAIy7/L2Amb7GZgOHw==
X-Google-Smtp-Source: AGHT+IGcO33pwmd8RvHVGGRlKReAeYEqRHa/Rp7NaaBDLLXjQPmmU1g/ailYEl5oUc6IJBrtKBeShg==
X-Received: by 2002:a05:6a00:3e10:b0:70d:22b5:5420 with SMTP id d2e1a72fcca58-715dfb988bamr7197551b3a.15.1725018944332;
        Fri, 30 Aug 2024 04:55:44 -0700 (PDT)
Received: from thinkpad ([117.193.213.95])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e56d751asm2597787b3a.169.2024.08.30.04.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 04:55:43 -0700 (PDT)
Date: Fri, 30 Aug 2024 17:25:37 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Slark Xiao <slark_xiao@163.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] bus: mhi: host: pci_generic: Enable trigger_edl
 for Foxconn SDX55/SDX65/SDX24 products
Message-ID: <20240830115537.mtbkfmocab3h5262@thinkpad>
References: <20240725022941.65948-1-slark_xiao@163.com>
 <20240725022941.65948-2-slark_xiao@163.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240725022941.65948-2-slark_xiao@163.com>

On Thu, Jul 25, 2024 at 10:29:41AM +0800, Slark Xiao wrote:
> Since generic trigger_edl mechanism has been imported, all
> products support firehose download shall enable 'edl_trigger'.
> 
> Signed-off-by: Slark Xiao <slark_xiao@163.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/bus/mhi/host/pci_generic.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index f159a9dd53e7..565b280c539e 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -434,6 +434,7 @@ static const struct mhi_controller_config modem_foxconn_sdx72_config = {
>  static const struct mhi_pci_dev_info mhi_foxconn_sdx55_info = {
>  	.name = "foxconn-sdx55",
>  	.edl = "qcom/sdx55m/foxconn/prog_firehose_sdx55.mbn",
> +	.edl_trigger = true,
>  	.config = &modem_foxconn_sdx55_config,
>  	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
>  	.dma_data_width = 32,
> @@ -444,6 +445,7 @@ static const struct mhi_pci_dev_info mhi_foxconn_sdx55_info = {
>  static const struct mhi_pci_dev_info mhi_foxconn_t99w175_info = {
>  	.name = "foxconn-t99w175",
>  	.edl = "qcom/sdx55m/foxconn/prog_firehose_sdx55.mbn",
> +	.edl_trigger = true,
>  	.config = &modem_foxconn_sdx55_config,
>  	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
>  	.dma_data_width = 32,
> @@ -454,6 +456,7 @@ static const struct mhi_pci_dev_info mhi_foxconn_t99w175_info = {
>  static const struct mhi_pci_dev_info mhi_foxconn_dw5930e_info = {
>  	.name = "foxconn-dw5930e",
>  	.edl = "qcom/sdx55m/foxconn/prog_firehose_sdx55.mbn",
> +	.edl_trigger = true,
>  	.config = &modem_foxconn_sdx55_config,
>  	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
>  	.dma_data_width = 32,
> @@ -463,6 +466,8 @@ static const struct mhi_pci_dev_info mhi_foxconn_dw5930e_info = {
>  
>  static const struct mhi_pci_dev_info mhi_foxconn_t99w368_info = {
>  	.name = "foxconn-t99w368",
> +	.edl = "qcom/sdx65m/foxconn/prog_firehose_lite.elf",
> +	.edl_trigger = true,
>  	.config = &modem_foxconn_sdx55_config,
>  	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
>  	.dma_data_width = 32,
> @@ -472,6 +477,8 @@ static const struct mhi_pci_dev_info mhi_foxconn_t99w368_info = {
>  
>  static const struct mhi_pci_dev_info mhi_foxconn_t99w373_info = {
>  	.name = "foxconn-t99w373",
> +	.edl = "qcom/sdx65m/foxconn/prog_firehose_lite.elf",
> +	.edl_trigger = true,
>  	.config = &modem_foxconn_sdx55_config,
>  	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
>  	.dma_data_width = 32,
> @@ -481,6 +488,8 @@ static const struct mhi_pci_dev_info mhi_foxconn_t99w373_info = {
>  
>  static const struct mhi_pci_dev_info mhi_foxconn_t99w510_info = {
>  	.name = "foxconn-t99w510",
> +	.edl = "qcom/sdx24m/foxconn/prog_firehose_sdx24.mbn,
> +	.edl_trigger = true,
>  	.config = &modem_foxconn_sdx55_config,
>  	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
>  	.dma_data_width = 32,
> @@ -490,6 +499,8 @@ static const struct mhi_pci_dev_info mhi_foxconn_t99w510_info = {
>  
>  static const struct mhi_pci_dev_info mhi_foxconn_dw5932e_info = {
>  	.name = "foxconn-dw5932e",
> +	.edl = "qcom/sdx65m/foxconn/prog_firehose_lite.elf",
> +	.edl_trigger = true,
>  	.config = &modem_foxconn_sdx55_config,
>  	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
>  	.dma_data_width = 32,
> -- 
> 2.25.1
> 

-- 
மணிவண்ணன் சதாசிவம்
