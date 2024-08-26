Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7B313C9C8
	for <mhi@lists.linux.dev>; Mon, 26 Aug 2024 08:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724660966; cv=none; b=jJ9G8qHg8SgPZhgDrZ4ameyhy/IWCaNxJeDRnqPlsUyOTHl0zhZoVY7bMzb4aa/onqtdlhx3wOJ2rXRHsvzAcv9nd9wzuI0XHyjZ8Q6XbEFfmCpdbNL0g4BhAxvsneN0UMiLk8Juw21Kd7rHMEC95l+jJivLYzwBFd6MNeuZb9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724660966; c=relaxed/simple;
	bh=bDIgEfAUyhm/xLM9fRUYtKIzhj29vuxnUt+xTY13rhU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SI6yVmgB9dD/vy32uR6rTkxluA7nO8YtwsUVF2Jmdir+GFNr6FaoYnGY4woXLT8Bwk+XmQFqnYFzwrO0g1BuFyIsUVlGN/i8AwC9ybdE5dfKeUQuM1NcnBLs8DxRYxgbaq4XOyzDdy0Jzjk5M4ncSPT1CLJoBukhtDIfctsO3q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rROdBsm0; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rROdBsm0"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-5d5f9d68805so2974900eaf.3
        for <mhi@lists.linux.dev>; Mon, 26 Aug 2024 01:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724660963; x=1725265763; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FpK+LqnMiQxXocEL/iu9e4s+c/+RcNGhhFEbJWYlCI8=;
        b=rROdBsm08Gv2i5mDOUAshItdEE96nQSokQm1U9HqYm9zmuu7ItQQQFe6xgb+LRkoBu
         fhrZ8dhcv0Kyo12kcMUg5xiNcsV37N6No7n6Ew6hB/U1qAi314KzpnXF3AkGQDR8ZTzu
         lxqbGzEKxBfBYOrTIXJHGmZeGZx5DOb068qf8rYgMuZSXJhO5uCrNXHliph3gMdIpO89
         uM0OmU4ZXtgO9miVZ6uskcpAap8CneafqzgKPZV0F18oWIBCOqOQpYNzN06E3LMmmJwZ
         6gebXOuVEcum+1rPWY3ZPvm4qVKo8SyFn0eEaNi4v1kx6RlToM0jLu30kfN67/alrN7c
         iBbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724660963; x=1725265763;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FpK+LqnMiQxXocEL/iu9e4s+c/+RcNGhhFEbJWYlCI8=;
        b=KWAN/9aLyVNbLsURQ5z7/Jm83bD80zp5fxKpAcabnOhByn7nAYevlo4XcZW3wLPSFz
         vLSte+1Cf97AFwxTnBpBSK2P3fVvf7sghbxJcun4YMHzbIs60eWKuYuDssgPKbGT/Hgf
         fDiIe+8Codvr/lXb5ciqZUqkaWHtHYG4Bfxqip3uGmvMvcadHtcHaubbAFNL0j44g+Re
         QU6LmvCsMu1aqfOaCQM4i2XfRxozOdce3umG1rB+SAsWIIbqdonUGbQRSa9J1LkzsSQo
         e/hGUaSbddebeGP72AdRV0mQFnW+mzg4r25+BseebHKyPU1l/EodZKPJOPUK9DTLwQDa
         1zzg==
X-Forwarded-Encrypted: i=1; AJvYcCXOs+dKxz6NuSy2dVAsqlaH1qtss9nywbPFL7H5EIHZXAvc2QNrWK9D4NspQo9KM1QZOAk=@lists.linux.dev
X-Gm-Message-State: AOJu0YyEujeEVyWuPii/+/ycthLmje+nfr7fRO0YbZ0nRDBhlXQAuYlc
	ZvMpUr7KSTAwJydw/a9MNBjbNHSrlseu/K9vQbLmk0m+dbZgEXFgJHTIx7VsEsaAlyHLZEeNvW8
	=
X-Google-Smtp-Source: AGHT+IHa05pyR1/biT4DWNfV5Ah2XihLBGIqbFSdAq19mKgtaB+tYgagS2IxBtdEtRGiuKRf7P4I5Q==
X-Received: by 2002:a05:6820:81f:b0:5dc:9f42:d5ea with SMTP id 006d021491bc7-5dcc6221da7mr11016787eaf.3.1724660963541;
        Mon, 26 Aug 2024 01:29:23 -0700 (PDT)
Received: from thinkpad ([220.158.156.53])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7cd9ad7d5ddsm7175457a12.89.2024.08.26.01.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 01:29:23 -0700 (PDT)
Date: Mon, 26 Aug 2024 13:59:18 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Kunwu Chan <kunwu.chan@linux.dev>
Cc: gregkh@linuxfoundation.org, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Kunwu Chan <chentao@kylinos.cn>
Subject: Re: [PATCH] bus: mhi: host: make mhi_bus_type const
Message-ID: <20240826082918.al7mt3v7rpfgazsv@thinkpad>
References: <20240823031129.49010-1-kunwu.chan@linux.dev>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240823031129.49010-1-kunwu.chan@linux.dev>

On Fri, Aug 23, 2024 at 11:11:28AM +0800, Kunwu Chan wrote:
> From: Kunwu Chan <chentao@kylinos.cn>
> 
> Now that the driver core can properly handle constant struct bus_type,
> move the mhi_bus_type variable to be a constant structure as well,
> placing it into read-only memory which can not be modified at runtime.
> 
> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Kunwu Chan <chentao@kylinos.cn>

Applied to mhi-next!

- Mani

> ---
>  drivers/bus/mhi/host/init.c     | 2 +-
>  drivers/bus/mhi/host/internal.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
> index ce7d2e62c2f1..a9b1f8beee7b 100644
> --- a/drivers/bus/mhi/host/init.c
> +++ b/drivers/bus/mhi/host/init.c
> @@ -1464,7 +1464,7 @@ static int mhi_match(struct device *dev, const struct device_driver *drv)
>  	return 0;
>  };
>  
> -struct bus_type mhi_bus_type = {
> +const struct bus_type mhi_bus_type = {
>  	.name = "mhi",
>  	.dev_name = "mhi",
>  	.match = mhi_match,
> diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
> index aaad40a07f69..d057e877932e 100644
> --- a/drivers/bus/mhi/host/internal.h
> +++ b/drivers/bus/mhi/host/internal.h
> @@ -9,7 +9,7 @@
>  
>  #include "../common.h"
>  
> -extern struct bus_type mhi_bus_type;
> +extern const struct bus_type mhi_bus_type;
>  
>  /* Host request register */
>  #define MHI_SOC_RESET_REQ_OFFSET			0xb0
> -- 
> 2.41.0
> 

-- 
மணிவண்ணன் சதாசிவம்
