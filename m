Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB4218E378
	for <mhi@lists.linux.dev>; Fri, 30 Aug 2024 12:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725020294; cv=none; b=TcKzby/uItNKWIAXtyA7QLLu9q6twHaOBQO3S5fspBCx7t4wegkLBVEpXdVpSdSUG2ll8+49JcBpQCXa97y7ZV5KH/z4ooXqoscJlJ4NgH0czE2WGwkMsY1M4KV309/o5yEeniL0t7XtBfsqjqwbNeOO41ZZFDx3YQOasiVSGkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725020294; c=relaxed/simple;
	bh=lgfx6GwDKoZM/4nC7D3oRCk62Tejbqlai0EzUVs5XgI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fNzP2SlAlF+1u9ltbJZ8IYaiskN2rziMSVfNjCETxz5EmgkC8Epl5urbg6QepRHwvhZZIjKwsoGq6MuXTGzvyMLLGwZsJSvvdWiRe+uhEL0h3tp1UOaRN51CvY7FPxZIhlzc/5DxEoPBqD/axidjQU+PH+xbt4nWt2mmgrTJ1tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ehq4/Tvx; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ehq4/Tvx"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-7cd8d2731d1so1180124a12.3
        for <mhi@lists.linux.dev>; Fri, 30 Aug 2024 05:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725020292; x=1725625092; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Id4w7NNA8moHIg99Nv0TMFKrSz/R2qoiMO7qyLMBeaY=;
        b=ehq4/TvxoXlsxLfm8HvNY97heP5pCGL7B5Y/qJOvNrRN1fdaAIWXaXw+r+g6IJOTXO
         ZxX3rLCTWwolyRLy848abY2nCP4y2Bl5KYYk+BsQGagX0sE+WwMdTh9TPwhFlICRUQBc
         JOmAmGSlOK1YZuNR81IyzOQAZV0iHp1C6UKW5bUed3BFrOxWTVa/FwWWqqPj9Fmv+YlI
         szGPYjRVRDtDXKiEqbRcwk7xUMV8yORP2eemKAolE7vTo1xBP5EdMQ181qgyV6QOhJfy
         9pv0zVfbxFygLoyD53Ud3OrFVvBuVwzVj4DWlIv+ddsLmdTjQznlWNExB2zBnSsvvyDr
         /+7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725020292; x=1725625092;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Id4w7NNA8moHIg99Nv0TMFKrSz/R2qoiMO7qyLMBeaY=;
        b=tmecJseIalpIuakRdssyJrqjtBdWThUQQRIvdYkfVbobLI3NpUbnjo3i6gvx9Ksbk9
         XBiVH6xEa+p9pY/WH4Sfrmg7oxzPFi/Mh806nJLaZiAYCzLBdL/Xhd8wWxvgCzZFSIJn
         sYe+O6dPoeYwg0mbqxMdjZox88qUPG+33/gGBJPtiHC444vlkjVEt+kqwFhevfDDr3S4
         riJvV3CT76ku8YN7U7RyZLlrFb+UyHXJfcqAj1poNuhOKk37+mvE4C7OJeWcX3olTVUu
         FxImgVRyfVjv7M4Rh88kpdsmZb4026nakTT76Zr/s8Y+lgx2DD+9/cFaEHf1jYjJi9T4
         Jwnw==
X-Gm-Message-State: AOJu0YwzLyySX+OxGZzDA06TLCQ/VSwJ8/sZTBAS2sTQuAimSOREk5Of
	dpmPZ3BUYcze9zyo3mOAVjuEiFOjMGxAgBDCVcPqSsUb4vUsALC7wR/nOsGynA==
X-Google-Smtp-Source: AGHT+IG5/ZWFAjSG6uNdUFmC0sk12wJugx6UZ9BZD71Ucu4X4w99uOTL+UHPQZ4ynSm0cGmDA4y3cA==
X-Received: by 2002:a17:90b:3e84:b0:2c1:9892:8fb with SMTP id 98e67ed59e1d1-2d85618881dmr6007999a91.5.1725020292391;
        Fri, 30 Aug 2024 05:18:12 -0700 (PDT)
Received: from thinkpad ([117.193.213.95])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d85b0ffce5sm3663374a91.3.2024.08.30.05.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 05:18:12 -0700 (PDT)
Date: Fri, 30 Aug 2024 17:48:07 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Slark Xiao <slark_xiao@163.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] bus: mhi: host: pci_generic: Update the file path
 for Foxconn SDX55/SDX72
Message-ID: <20240830121807.noxfo6fy2nsd4ohi@thinkpad>
References: <20240725022941.65948-1-slark_xiao@163.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240725022941.65948-1-slark_xiao@163.com>

On Thu, Jul 25, 2024 at 10:29:40AM +0800, Slark Xiao wrote:
> To separate the images of Foxconn from other vendors, adding a
> new foxconn subfolder under qcom/<platform> for edl image path.
> And delete the fw patch since it's useless for Foxconn devices.
> 
> Fixes: bf30a75e6e00 ("bus: mhi: host: Add support for Foxconn SDX72 modems")
> Signed-off-by: Slark Xiao <slark_xiao@163.com>

Applied to mhi-next!

- Mani

> ---
> v2: change the folder path architecture
> ---
>  drivers/bus/mhi/host/pci_generic.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 14a11880bcea..f159a9dd53e7 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -433,8 +433,7 @@ static const struct mhi_controller_config modem_foxconn_sdx72_config = {
>  
>  static const struct mhi_pci_dev_info mhi_foxconn_sdx55_info = {
>  	.name = "foxconn-sdx55",
> -	.fw = "qcom/sdx55m/sbl1.mbn",
> -	.edl = "qcom/sdx55m/edl.mbn",
> +	.edl = "qcom/sdx55m/foxconn/prog_firehose_sdx55.mbn",
>  	.config = &modem_foxconn_sdx55_config,
>  	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
>  	.dma_data_width = 32,
> @@ -444,8 +443,7 @@ static const struct mhi_pci_dev_info mhi_foxconn_sdx55_info = {
>  
>  static const struct mhi_pci_dev_info mhi_foxconn_t99w175_info = {
>  	.name = "foxconn-t99w175",
> -	.fw = "qcom/sdx55m/sbl1.mbn",
> -	.edl = "qcom/sdx55m/edl.mbn",
> +	.edl = "qcom/sdx55m/foxconn/prog_firehose_sdx55.mbn",
>  	.config = &modem_foxconn_sdx55_config,
>  	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
>  	.dma_data_width = 32,
> @@ -455,8 +453,7 @@ static const struct mhi_pci_dev_info mhi_foxconn_t99w175_info = {
>  
>  static const struct mhi_pci_dev_info mhi_foxconn_dw5930e_info = {
>  	.name = "foxconn-dw5930e",
> -	.fw = "qcom/sdx55m/sbl1.mbn",
> -	.edl = "qcom/sdx55m/edl.mbn",
> +	.edl = "qcom/sdx55m/foxconn/prog_firehose_sdx55.mbn",
>  	.config = &modem_foxconn_sdx55_config,
>  	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
>  	.dma_data_width = 32,
> @@ -502,7 +499,7 @@ static const struct mhi_pci_dev_info mhi_foxconn_dw5932e_info = {
>  
>  static const struct mhi_pci_dev_info mhi_foxconn_t99w515_info = {
>  	.name = "foxconn-t99w515",
> -	.edl = "fox/sdx72m/edl.mbn",
> +	.edl = "qcom/sdx72m/foxconn/edl.mbn",
>  	.edl_trigger = true,
>  	.config = &modem_foxconn_sdx72_config,
>  	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> @@ -513,7 +510,7 @@ static const struct mhi_pci_dev_info mhi_foxconn_t99w515_info = {
>  
>  static const struct mhi_pci_dev_info mhi_foxconn_dw5934e_info = {
>  	.name = "foxconn-dw5934e",
> -	.edl = "fox/sdx72m/edl.mbn",
> +	.edl = "qcom/sdx72m/foxconn/edl.mbn",
>  	.edl_trigger = true,
>  	.config = &modem_foxconn_sdx72_config,
>  	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> -- 
> 2.25.1
> 

-- 
மணிவண்ணன் சதாசிவம்
