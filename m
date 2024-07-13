Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D043C33CD1
	for <mhi@lists.linux.dev>; Sat, 13 Jul 2024 15:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720883393; cv=none; b=f0Y2FQaf3eXH3WyxX2XW/EnSHCMVJuu7nODULE8BIgydi9pzgGmnNuKL2jJMZ+SFg3Xx9PrgSqY2nJZQnj4q/1TWeS7dmnSCDccftvU7iV6Y9N9ARqvfDyvEqcPP6lSu0EdWbDp9yBreS0tGhrcuUDSVxRSCdbaKT0+JLCCLhoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720883393; c=relaxed/simple;
	bh=qVBV1SGYCV3VpJhga8WAVhCZSl/Hloy7KmZf/y1uAnM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jkJWBTIyHIwg+BT19DT883baXnvAJQQQYHqdAj5x3Woc/MGkWqSFaU5aJb6DdX97kVsWsE1KHGj2q8YLcNRmuMuEgtV5b/eGy8mmBE/yuW76YKBV2umYaDZZMHW0EHCo+O0LtRWDqQHlCf7CoA6hNrBOc6guTfTLTgD/l9W1oIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hIumeINz; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hIumeINz"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52ea2f58448so4059913e87.1
        for <mhi@lists.linux.dev>; Sat, 13 Jul 2024 08:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720883390; x=1721488190; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DnPbtTAkZ7djqLH8dVYwhAmRisUoaziL3oeQP7ZMuXM=;
        b=hIumeINzYYqmbhXoa6/rHPVg/Q/EopiMdkbMlELT/grIaoLoqAQdHMfrVm3hxSRUcq
         iRZTx7KoOPv0xUEJRtoPX6iWHo/Wz62c7bpni95DMyTLi8Ye8jA6Vpif/mNW69rUTIch
         dHaPto3+CZodx+QAVBW0hQwSrm3JPjOujEiWQLvfK10ziyz6UgwU9QfJOqKXFFCcafJ8
         v1rBFjh4PyYBVH6qAjwaLjnOZ0s2e+KMGL5CH59sRPiSXwqQE9B9jtigX3i3aked1y72
         jor1FqV3AFk9inIEZ3sRhjgyQksZADnGtIDZZ3PALm9ns3eNxHGg0ATtPVu/RJA2L4R9
         cM5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720883390; x=1721488190;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DnPbtTAkZ7djqLH8dVYwhAmRisUoaziL3oeQP7ZMuXM=;
        b=bL+00F44W/Q3xGWpxRv/ruH0YRs9jKEECmjUuOwu/2XLAl1RfDLePFSj/RlH7TkEeK
         zhxIwF0bZRfT2RCqz4/0JZyRTzbPDwx4XQBcIWZWKbe6OxsUkU9FlrNJ8nS+C/Stezzd
         yFBUKE8K3ryOtLy5Z7h+eiFStAI80KwR7dadmy/0lG6KuV1/XK5HY0keawNsEjwnrFSr
         wbtQ6Bbb4kWEwYXWd6Ut12SR3B/imPj31gEGN43e6n7uqIm8xZW5siGjM5X/NqpimsZ9
         zIQrp6NdRJGpayW6EuayEq534ZOTMcdMOpnQhmME63eA4XcFagKubgLB/9CB4N5+HdeC
         g5hA==
X-Forwarded-Encrypted: i=1; AJvYcCUJEjWP5m6UCfJZ/efKBb8f+QBjEo2l2AzD6v4hKhfIeNn1MCiROVaZ1IMxmM4IP3oEPHoVvae7t//UUoWzNX1LN4Z1
X-Gm-Message-State: AOJu0YzJbqkMcM0Iz8KSNrQjoXZHrH4geIWEYSSThFl4YNi3kA5SLFa+
	PLVpglOmfMNyHKD7FXkKltOf/0U+eOWw33c0uOcuZA/AwE3oFuTNv6Cvlre/h6o=
X-Google-Smtp-Source: AGHT+IG8f/S6xS3NpK6n/5A6ZgtrNG6rhyc83wV5h+9vg7eHn7uf4I18w28czjlqvaEye2vJRAjSNQ==
X-Received: by 2002:a05:6512:3d02:b0:52e:767a:ada3 with SMTP id 2adb3069b0e04-52eb99cb00dmr10568585e87.47.1720883389805;
        Sat, 13 Jul 2024 08:09:49 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ed25391d4sm216199e87.274.2024.07.13.08.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jul 2024 08:09:49 -0700 (PDT)
Date: Sat, 13 Jul 2024 18:09:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Slark Xiao <slark_xiao@163.com>
Cc: manivannan.sadhasivam@linaro.org, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: host: Add firehose support for Foxconn
 SDX24/SDX55/SDX65
Message-ID: <dduv77mdqe633m7amyljhqas7nomrtjrrimvmyqidymy3qjvfa@biepierrz5p3>
References: <20240709015818.110384-1-slark_xiao@163.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240709015818.110384-1-slark_xiao@163.com>

On Tue, Jul 09, 2024 at 09:58:18AM GMT, Slark Xiao wrote:
> Since we implement the FIREHOSE channel support in foxconn mhi
> channels, that means each product which use this channel config
> would support FIREHOSE. But according to the trigger_edl feature,
> we need to enable it by adding '.edl_trigger = true' in device
> info struct.
> Also, we update all edl image path from 'qcom' to 'fox' in case of
> conflicting with other vendors.

Separate patches please. Also don't use "we", just an imerative style:
do this and that.

> 
> Signed-off-by: Slark Xiao <slark_xiao@163.com>
> ---
>  drivers/bus/mhi/host/pci_generic.c | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 14a11880bcea..440609b81e57 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -433,8 +433,8 @@ static const struct mhi_controller_config modem_foxconn_sdx72_config = {
>  
>  static const struct mhi_pci_dev_info mhi_foxconn_sdx55_info = {
>  	.name = "foxconn-sdx55",
> -	.fw = "qcom/sdx55m/sbl1.mbn",
> -	.edl = "qcom/sdx55m/edl.mbn",
> +	.edl = "fox/sdx55m/prog_firehose_sdx55.mbn",

qcom/sdx55m/foxconn/prog_firehose_sdx55.mbn

> +	.edl_trigger = true,
>  	.config = &modem_foxconn_sdx55_config,
>  	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
>  	.dma_data_width = 32,
> @@ -444,8 +444,8 @@ static const struct mhi_pci_dev_info mhi_foxconn_sdx55_info = {
>  
>  static const struct mhi_pci_dev_info mhi_foxconn_t99w175_info = {
>  	.name = "foxconn-t99w175",
> -	.fw = "qcom/sdx55m/sbl1.mbn",
> -	.edl = "qcom/sdx55m/edl.mbn",
> +	.edl = "fox/sdx55m/prog_firehose_sdx55.mbn",

Is it the same file as the one mentioned in the previous chunk or is it
different?

If they are different, then, please,

qcom/sdx55m/foxconn/t99w175/prog_firehose_sdx55.mbn


> +	.edl_trigger = true,
>  	.config = &modem_foxconn_sdx55_config,
>  	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
>  	.dma_data_width = 32,
> @@ -455,8 +455,8 @@ static const struct mhi_pci_dev_info mhi_foxconn_t99w175_info = {
>  
>  static const struct mhi_pci_dev_info mhi_foxconn_dw5930e_info = {
>  	.name = "foxconn-dw5930e",
> -	.fw = "qcom/sdx55m/sbl1.mbn",
> -	.edl = "qcom/sdx55m/edl.mbn",
> +	.edl = "fox/sdx55m/prog_firehose_sdx55.mbn",
> +	.edl_trigger = true,
>  	.config = &modem_foxconn_sdx55_config,
>  	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
>  	.dma_data_width = 32,
> @@ -466,6 +466,8 @@ static const struct mhi_pci_dev_info mhi_foxconn_dw5930e_info = {
>  
>  static const struct mhi_pci_dev_info mhi_foxconn_t99w368_info = {
>  	.name = "foxconn-t99w368",
> +	.edl = "fox/sdx65m/prog_firehose_lite.elf",
> +	.edl_trigger = true,
>  	.config = &modem_foxconn_sdx55_config,
>  	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
>  	.dma_data_width = 32,
> @@ -475,6 +477,8 @@ static const struct mhi_pci_dev_info mhi_foxconn_t99w368_info = {
>  
>  static const struct mhi_pci_dev_info mhi_foxconn_t99w373_info = {
>  	.name = "foxconn-t99w373",
> +	.edl = "fox/sdx65m/prog_firehose_lite.elf",
> +	.edl_trigger = true,
>  	.config = &modem_foxconn_sdx55_config,
>  	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
>  	.dma_data_width = 32,
> @@ -484,6 +488,8 @@ static const struct mhi_pci_dev_info mhi_foxconn_t99w373_info = {
>  
>  static const struct mhi_pci_dev_info mhi_foxconn_t99w510_info = {
>  	.name = "foxconn-t99w510",
> +	.edl = "fox/sdx24m/prog_firehose_sdx24.mbn",
> +	.edl_trigger = true,
>  	.config = &modem_foxconn_sdx55_config,
>  	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
>  	.dma_data_width = 32,
> @@ -493,6 +499,8 @@ static const struct mhi_pci_dev_info mhi_foxconn_t99w510_info = {
>  
>  static const struct mhi_pci_dev_info mhi_foxconn_dw5932e_info = {
>  	.name = "foxconn-dw5932e",
> +	.edl = "fox/sdx65m/prog_firehose_lite.elf",
> +	.edl_trigger = true,
>  	.config = &modem_foxconn_sdx55_config,
>  	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
>  	.dma_data_width = 32,
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry
