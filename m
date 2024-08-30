Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56739199953
	for <mhi@lists.linux.dev>; Fri, 30 Aug 2024 12:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725020321; cv=none; b=exlAw6RWwpaijd7M4nIiwuek+PJe41LY3Gm4Tohs01BYxp2bvfQmXK8t7OrTIc3ZncjIcd9PeLu7husRDp7Dvf8FbdUUyCkJCrYzYI4QZPDvLQYf+GTZ2SwAsddlSLuEcAZwyVv6ZDVtS5+PNUMzxUgTICtnzKBTc+ydzzdhXxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725020321; c=relaxed/simple;
	bh=as9bZ18482ds0DVCSos5+kV1IKZSHcbXBC2Asfcgf6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lDDS4YTXWvxL0CT61FeIu4tgg1j55anxAh6dcB23B24pqOu/wblNpvBECJTSChmubEAvPLci/oIBuxP1RRuA1VrBLrgEfaVW917tzOGZjI3i1mtvnPsxhkYo/CpjuLwISfmRYEv4qt9Ono+eCj5Cq0trTH4HcPuBHi+rjXJXzQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=btXKBlZx; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="btXKBlZx"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7142e4dddbfso1397539b3a.0
        for <mhi@lists.linux.dev>; Fri, 30 Aug 2024 05:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725020319; x=1725625119; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eJplX0nrFE2YsBh7KtLRDZWDD5YD99Qk9xo9Crw/Jk0=;
        b=btXKBlZxxlov1iwF9Rv0ul3INFD1tPyTjQF+zYFXEWaqAp4XnmEsZM87N7Kqj1wh2r
         nml5oxhAbBm7VrxaMKBhLDZEbIvsCxgQ8tRsC+ip8+gB9Pb8GZ4zptXvtc2BsIh2mFqN
         zvvg+dMpaaP0IEWy1a0JSef9QZyq8jW5asa2UHysWRcfcen0SXwVvp9QfR92w8Xrj/6z
         K2tWF1ALaTuJH1ogyt5cGinc6Y3BCa/Gred6vWAjZ6J6DI0X5omK9HzHu4VMMKaGotQb
         27V2jrA/ZS7mW+yf4/T2nwRkvjKD9oh03uNYnbrR3nEnAN5XNQQWUGGdZX46ZS2Tn8mz
         305Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725020319; x=1725625119;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eJplX0nrFE2YsBh7KtLRDZWDD5YD99Qk9xo9Crw/Jk0=;
        b=rfGfntdpP82F2DQODnMwtBeJnn2NP5oFn2PvFSYHDbTHfT1ELwSdGNDEz27sxp/but
         AqmVdRYhbjGDcYKGtXw5cmT3fv7tvuC3kWIuZpr2Dta8ppD8lSohiQEdxxxkrju8/mfR
         LflLzWmn+Z26XxlvMaORyBfHc4LhSey8t+Rs6hCiv2miJzsJJurT5zOrq3hifHADbPig
         cuRgp9im+MRm9bMwgRn+bADOjy0dh28cHKHJ5DYpt5/yhXqPpndBvN0yT2EpJDhQkSvH
         wC/OV9cvcFwPa/NAqN23KsvTD32pO0odL6Q6DI9LpVixRnz6SGMswYn+LNXjZL4lcqOx
         JF1A==
X-Gm-Message-State: AOJu0YwYMU/TYJJKkt5EpwDZZduLnVMnh3mwmoz3oBNVRwAK3iIROHdN
	qg588kOwTu85pGNOehb4wAOnv2D1oA4OOwcAvh2uF3Ba3tkzSdphv3+3HHd9FQ==
X-Google-Smtp-Source: AGHT+IF8bmE5S2LuE60AnWdDtjWDZkmqQ9ygryaZA4rPxnm/Svh7hutBAGdVKk3XDfWvFmcWIRODRw==
X-Received: by 2002:a05:6a20:e196:b0:1c6:cb01:db61 with SMTP id adf61e73a8af0-1cce101a84dmr6071301637.28.1725020319526;
        Fri, 30 Aug 2024 05:18:39 -0700 (PDT)
Received: from thinkpad ([117.193.213.95])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d22e9be991sm2847738a12.75.2024.08.30.05.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 05:18:39 -0700 (PDT)
Date: Fri, 30 Aug 2024 17:48:34 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Slark Xiao <slark_xiao@163.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] bus: mhi: host: pci_generic: Enable trigger_edl
 for Foxconn SDX55/SDX65/SDX24 products
Message-ID: <20240830121834.e6zhtqj6pwgbxpsr@thinkpad>
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

Applied to mhi-next!

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
