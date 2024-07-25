Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F18C8DF
	for <mhi@lists.linux.dev>; Thu, 25 Jul 2024 03:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721880000; cv=none; b=lhG6sl+0qL8wPzMzIvZ06KXbN0PtKPyE3o0JonZbJhSZwz2C+taAlvY5+4EovDMRCQcPM+ljwJ+IKCcDFIzTUYPkCERUPSpKxcRmMKiiHlhKisz+k98DPhO+5M7niMRlQLu0InH8vens1ZnlGNjN29nBDgf/dfRFKq+RtN5WJ4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721880000; c=relaxed/simple;
	bh=rk66/rqzhkPoV2QLLxcJFZD6M7EVmlzgLKOeZcNT5T8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jl5hkwoX0FHCYOV/Tzm1dP4vHZ6zJWo3o+tcRAFK9gZpPhuWGn8LysJoQ0nx4vj49Qn21gBK3u7peGpFcsV61C6bfqnKKuXqzDte91/8PuSybesdiGYeDmyKnDw1pN/2/toOsyAGLthQfdmJagTp55UrwbOjF1i61DlKKzGm4Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L39UbtVD; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L39UbtVD"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1fd9e6189d5so3935455ad.3
        for <mhi@lists.linux.dev>; Wed, 24 Jul 2024 20:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721879998; x=1722484798; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rHcZx2GC/cLELT7bHwkzIBGxphqrx5awAaW2kc+oR08=;
        b=L39UbtVDreONC2Hrov8AbH/jakN8n1LUSXH9V+9znWHYw5vQtZggMdQDE6dJLoowZe
         xO1rZ+skZuBW7U++ULplfK5k8Ozw06+x+NJcjmT70AAEuCTh4g3W5c/FwkBzLiIt/2sC
         hcicmQF5OxbmpjKsPB4A81vcGdS1ZcsZubVgmnS3EMVH7aTpRNH3dmbQEJD0+Av62vLH
         RZ7AG4qi3Qz0wZhoO4BkSzvxgxhEwS26L6QuXF07TKdwfau9KqQj24UL2R89TLT2eXhf
         9MKPmI3OILQGpQM0eWTcP+F2zpQ3JBmquUmff/X+MecqTXQB+75sTnred2qKda5uNPuw
         OyLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721879998; x=1722484798;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rHcZx2GC/cLELT7bHwkzIBGxphqrx5awAaW2kc+oR08=;
        b=wsM7NaGr+JwvJXOc05ZcqsVRH6FUPh/Jz8zbdR7beY0GGjIhs6ibCLJEfL2RVy+iAl
         /4jI4++ldl3YcMu66/kfzGgU/rmCAbpLqyzlVZdaS/cTFLY3wfmLE8NbUVNn+6K8HRFv
         ZfzYPXGpuMQFsUuRmWOOYzH38hz5sK5ukQS8hJ85FMyXlLqeElK4V8jbmcT2ga7SR00N
         rCH3e9E9gj+c9AUQA7P/Ovfq6nBhJzpA/M5YrueN1K4ZN+fALeGLm0Hjwhmyusuh+oK4
         53vOhHz7g4OobXeY3Ja5GpXH0uwYuY/eoBOm/91Gkx9gCsGiaxiTGPUxdEVvQ5VoLLGB
         uH1g==
X-Gm-Message-State: AOJu0YxhX15VpdvXKN0tOC1KP7PqN0vPuHCDC3WOg22H1JrVqvczNCu5
	BgbdN6pZiEpiQWVGwRJ+f9zvzU9vPSl//FgfBQdF3NF7YSD1vS7/VpVsglEpxg==
X-Google-Smtp-Source: AGHT+IEaDi+BtDwssOplBvIcSv4l24dycsadnULUO1j1JwRC3JvSxlkzIS6ar2Yofkamxzyr+Xu2pA==
X-Received: by 2002:a17:902:ec91:b0:1fd:8904:ecf6 with SMTP id d9443c01a7336-1fed9259301mr6241935ad.21.1721879998304;
        Wed, 24 Jul 2024 20:59:58 -0700 (PDT)
Received: from thinkpad ([103.244.168.26])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7c8cd90sm3694515ad.44.2024.07.24.20.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 20:59:57 -0700 (PDT)
Date: Thu, 25 Jul 2024 09:29:54 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Slark Xiao <slark_xiao@163.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] bus: mhi: host: pci_generic: Update the file path
 for Foxconn SDX55/SDX72
Message-ID: <20240725035954.GA2317@thinkpad>
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

I think you misunderstood what I suggested in earlier revision. You should add
the Foxconn specific fw only if it is different from the qcom one. Is it really
different for all these modems? Otherwise, what is the point of adding them?

- Mani

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
