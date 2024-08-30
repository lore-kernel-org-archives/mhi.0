Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E881917C8
	for <mhi@lists.linux.dev>; Fri, 30 Aug 2024 11:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725018930; cv=none; b=m0MrMTyIQx01D+IxJmDAY6bD3qzqLuH9SduxKetMfJnMU+xqz9dwKqXNHZNc56+cCFJhN2b/P6HzFYgR4JADjdv5MIrCdAQGi5W3cOPhbfEarQ5UlJfNMRCXD6lonyOc/yCdSD8M9gRWz6hDhbibaW9Dkxqqe2/b+NZgUW/KOKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725018930; c=relaxed/simple;
	bh=rGJabSH1WjGrwPyUZvO8SIhkBqF284ClrE8qaXkEwU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sg6KgafLAR7ZBcK+eQ149Cb0i880lGGik3csN12WYhzxlyKF6r8lecmPW5GG6wn/sf1tt8t6lGrSSmMQrfar0TBZqL/8qt/x243v3qT03neIxbIWDe4++AuA22tpGkCdGXXvL0OEcz4hhpk5EYcMPMpmN16A84/vBexXMwR2OLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eqIkM0lO; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eqIkM0lO"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-5dfad5a9c21so350988eaf.0
        for <mhi@lists.linux.dev>; Fri, 30 Aug 2024 04:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725018926; x=1725623726; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2kXXjyoQkOSIGIfDRWOMPNe7ntaakkXVTK3kq6Qxk2A=;
        b=eqIkM0lOP9Quzq41RHzwkDY9Ch9wU4HeOI7dM4Bclo6IDg3xMoC7UgXwDfzIKiRHFd
         cCPC3428W9rFv6BQaCQx9cEGSG/b580mm64L8ICjML4mkjTagaaEDOiUjfuzjzitPLyA
         1SUAc4ZmM4ptCIZFKk7PQ4LKvNa+rRXNERfovI/FlOlE7fdousGOnf3xUXTchGeN75dT
         FYJ2uBIWirqY/J1A6zT7g9Z12u8dufFVJwU9c7xBnriTER8+npfR7h9z/8ipD8ZfLTS1
         89VWU7ntnYGEb8FHo7INWHHlE85sC8KJ9RfGIUXDFxXW8kQ/sbIGu7zCWrqme6Xr4wAW
         6pCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725018926; x=1725623726;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2kXXjyoQkOSIGIfDRWOMPNe7ntaakkXVTK3kq6Qxk2A=;
        b=W4CF80NdUGVXWdyDzAYkMFdL89kiwcp36ndjmMnEZ/Auu4ozICJyXsiIfydGRQ94ds
         8qC6AzzXGdOIyfYtU48R3eQeJQEEceU6dl8G22xMc5w7CBlcz5+e2BcJXjygK4Z8Jmx+
         93qxndQMAoc4QEJ6JwVyl2wTrCohGop0sm3SzK6/2wCMpBxUXiXt09A0YIaoFuoPh2je
         dMwWf4eOa86g8ZfTvhK2D86d/KA+qQQplAsOFbbUy2vnK6lFGVOVpQu81/WyF7DuNpmg
         T8+Hoj+DKcZAYs3c2xQ/KD4dkQcH04infaUFu4i24T2B1cWuZ5RPkXTLuvX297gQFVsv
         lO8A==
X-Gm-Message-State: AOJu0YyoSI4ssKUqYp2g88M0C4UdZxG+3vt24jn3Y+ihRj0iLKfmg9MH
	KGfASftq1WQBSJwdLuyzKGBz0FrHh4Z2bh99HLJrSnvFbScALpC2EFCWegHPIQ==
X-Google-Smtp-Source: AGHT+IH/BxJwIxRjq4Ftk2utGPO5gE372yrfaYPPrKkvTKKraSTvq03DzON9Ri0ykoGoYqRcozC2MA==
X-Received: by 2002:a05:6871:e25d:b0:25e:129c:2223 with SMTP id 586e51a60fabf-277900f62cfmr5786865fac.19.1725018926065;
        Fri, 30 Aug 2024 04:55:26 -0700 (PDT)
Received: from thinkpad ([117.193.213.95])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e5773733sm2584959b3a.217.2024.08.30.04.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 04:55:25 -0700 (PDT)
Date: Fri, 30 Aug 2024 17:25:19 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Slark Xiao <slark_xiao@163.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] bus: mhi: host: pci_generic: Update the file path
 for Foxconn SDX55/SDX72
Message-ID: <20240830115519.nun52bselrkc77qy@thinkpad>
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

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

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
