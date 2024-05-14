Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6364C3EA66
	for <mhi@lists.linux.dev>; Tue, 14 May 2024 14:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715697466; cv=none; b=o8VNRENuOG3+BySAqEZXEc+KYCCeEo2b7u7TT45R2lvDkUxdm/sU51J/hHIQdWnz5TEnLOoLf9LQZXex5PXfTtKRk1pdzak1AyC2+hJV14sq/kOx6EsNzEL2kHxCWoTMaH0Ai1VGS5WaxTF2V9MksnRaxj1kq3dNjVQS61/jOsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715697466; c=relaxed/simple;
	bh=cCN6oAFPt/mZTrQVhHoM8Poynt/Vme2RK/JjKPD/hGw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PQ5aC5HHUppGiisDv1kEAGrFTGnkjFeuGMpUW0jEZPlfyYEa+h2iA/NsFyy6Nezresk74IoNOlNTMHwXEU6AJpD1TpGS9KLgE6x4NPCZTp8MQdXAp8PCXIfPL2Rm4sbFI33Z7/yNB7UiS/oz3C5C0dhPvqyLvRPBXHuNyEiVLgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vXA00y/y; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vXA00y/y"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-420180b58c5so14645115e9.3
        for <mhi@lists.linux.dev>; Tue, 14 May 2024 07:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715697463; x=1716302263; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TAc7NjihDXzocbPFDcPShOeBfL8pHSiZ3S9lbKbtkK4=;
        b=vXA00y/y2epI5hGVYKSx/gGQd6iV3TWlTL1Pch7Tn8mbrKGPU3sp9VqsaI4R4rCI0F
         NIICpj+yId7basMRuqTKPyKkrKGMMm/EJ3MwtTMWL4VEUWikWasxjTowqBXiOs+TTOK9
         DPyWUPn4awbd9BZFJUKdL8UFbQtWSyatPG3wde3uHOqbLbmfwLuzuUDEu1Tasna40T/o
         rG6mkwBjvwS2wTl49rsyjtgX9qTP9RKyvQnzxIrODs8XFK9UpxB4R8aI1jrZ2pWiQapv
         7XQDIm7C6mCdaIzmTsV9EbhwWAj/2BQpEsCiUQgoYV5AeCGoj9KFgZmj2We7bt0CuL7N
         gNgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715697463; x=1716302263;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TAc7NjihDXzocbPFDcPShOeBfL8pHSiZ3S9lbKbtkK4=;
        b=xT2iuVS86lhMowP5R1seCG5r4bVcn7V2CEPzYCTDxKMgb48x/HZqFShQF+xI5f4gbG
         bDh7XrP2L+33rjKwNlNB4BA4h+FolLlz4h5O5aXZ874axpMg71YVGP+NIGAYPGIMLjJ3
         lIkK/JraS5c8hShwky1aMHuSehAHulEUTr8Cp8nuTD72WVHwNGtWeRzFVI/zRIUAr3tO
         F7AlsA+a+rzwlIc+sTSiVq8U9RrZdAr5281/h2dEJ3k2zVUZWYU0pwjgS0nJLPTW+W9b
         t95utavZMM3hySiys+uWKQqpOOJLHfvoQlykWdF2czeUSosyFRKCRb3cLP3m0lFcpgpi
         U7tw==
X-Forwarded-Encrypted: i=1; AJvYcCWFPimlvnWi+tdQhoHQJb9Ya/f7ItkSlkypFCd6Q1s1/HqHmbpg0Dfs4BHlK4qSU1DeFQmhhSBED08hwmCa+XRSgjPi
X-Gm-Message-State: AOJu0YwP6fwO7vU2LgP2FEBZyTbSeTB+dFQH5KbAlg865LvE+ioZZyX9
	1NeCWjzogYcyA/OF8qTEpLw4ZQxT0DriYjfFBPsBvtcZu518PMbVrJptnPCA+A==
X-Google-Smtp-Source: AGHT+IGPyRX8qtOMt+JESevQaTVma23gUecjuwUc1IYuJbTTmpZ+UJ3tSQ0+ECufdM0ZY1qj8EQ5xg==
X-Received: by 2002:a05:600c:1c9f:b0:41c:35c:2da7 with SMTP id 5b1f17b1804b1-41feac551a0mr100665255e9.30.1715697462515;
        Tue, 14 May 2024 07:37:42 -0700 (PDT)
Received: from thinkpad ([149.14.240.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35045583669sm12283626f8f.106.2024.05.14.07.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 07:37:42 -0700 (PDT)
Date: Tue, 14 May 2024 16:37:41 +0200
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Slark Xiao <slark_xiao@163.com>
Cc: loic.poulain@linaro.org, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: host: Add Foxconn SDX72 related support
Message-ID: <20240514143741.GA2306@thinkpad>
References: <20240510032657.789629-1-slark_xiao@163.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240510032657.789629-1-slark_xiao@163.com>

On Fri, May 10, 2024 at 11:26:57AM +0800, Slark Xiao wrote:
> Align with Qcom SDX72, add ready timeout item for Foxconn SDX72.
> And also, add firehose support since SDX72.
> 
> Signed-off-by: Slark Xiao <slark_xiao@163.com>
> ---
>  drivers/bus/mhi/host/pci_generic.c | 31 ++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 08844ee79654..0fd94c193fc6 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -399,6 +399,8 @@ static const struct mhi_channel_config mhi_foxconn_sdx55_channels[] = {
>  	MHI_CHANNEL_CONFIG_DL(13, "MBIM", 32, 0),
>  	MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
>  	MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
> +	MHI_CHANNEL_CONFIG_UL_FP(34, "FIREHOSE", 32, 0),
> +	MHI_CHANNEL_CONFIG_DL_FP(35, "FIREHOSE", 32, 0),

This means SDX55 is also supporting FIREHOSE channels, which is not true I
believe.

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
>  static const struct mhi_pci_dev_info mhi_foxconn_sdx24_info = {
>  	.name = "foxconn-sdx24",
>  	.config = &modem_foxconn_sdx55_config,
> @@ -448,6 +460,16 @@ static const struct mhi_pci_dev_info mhi_foxconn_sdx65_info = {
>  	.sideband_wake = false,
>  };
>  
> +static const struct mhi_pci_dev_info mhi_foxconn_sdx72_info = {
> +	.name = "foxconn-sdx72",
> +	.edl = "qcom/sdx72m/xbl_s_devprg_ns.melf",

What is '.melf'? Is the firmware available somewhere? Did you plan to upstream
it to linux-firmware?

- Mani

-- 
மணிவண்ணன் சதாசிவம்
