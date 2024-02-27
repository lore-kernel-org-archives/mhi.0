Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D49F4EB
	for <mhi@lists.linux.dev>; Tue, 27 Feb 2024 05:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709010764; cv=none; b=aq9L6OzwTcyxbbImMrgGt+higXDKWNiazP2cYf84IOuqjFM1gTbsw0k3gBvWu63c2FT+Fx9wUdUIV5u5J7aqWrfNqbDFKTGr+6swTs3+XqK9n+74RNNApw1Zgw3GXSdPqQGW/7GKT53Yq4UY1UgwkSg4QwHe8Fsbk6nbY7BiXlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709010764; c=relaxed/simple;
	bh=hD+1erHDD0d+qn8eQRrLe1jV8E3tcFZSQN29WUyNEwI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MW2qb/bm+UOqm5fCj//lTGf9/FGcjaQAl2QAc93zDXtPaWq30isfH4/1GB/M0y4iNw0b9QrlOGrkxNT2t3fqazaua8P+pWg67Jg7Raml6qUFkn6O6mYEOUTD/4UsMWPK0HktzXPghz+N2ureapI3yq3chJaswYyAPqnOEhqGq+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EUC3xbIV; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EUC3xbIV"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6e53f76898fso653503b3a.0
        for <mhi@lists.linux.dev>; Mon, 26 Feb 2024 21:12:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709010762; x=1709615562; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=om7VjZgz57k46padP27CCq6xGxWmJL9MnSyfraSemmA=;
        b=EUC3xbIVgI96pXvsg82h+TKQOqKYmRZL8w1AHc6O8ME2PAP+eZh8I69AUE2YzCs2+w
         tbNMDdHaRCLgguAXdTUuU6uofeomef8gOkTXhNef0jU6Ke72q+e1Pe4XXe5PdNpmynKn
         uKi8PvSNjVXGfFJ7oRpHPwoaHEBurHb+t2ut+/S5G0QJ9psbipKfJeFMI/rqW6uWXED9
         SqG60Peu9uppusWUCSukh0jLkt5GiF/9Xr1GJwtiLqE1SS1QAYDeOh4DjcYsMbFADokU
         NXPyflQ59wdkNU0NxQCGTsKDW/q/JN88bO/6H3pBNdOCtjuAZaW8d2K8qPMcBVYmaFRz
         uXrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709010762; x=1709615562;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=om7VjZgz57k46padP27CCq6xGxWmJL9MnSyfraSemmA=;
        b=cnA79Q9LDf194nfLCSRwswOBON7ewPHQRWzDJcw026IwWLB2pv6yCjN46i8t+/KtMr
         eUTHwgbLe0mCpMe6UGl9gO4POZ+f3jUfWBD0ILwqan5Mx4vTPh914Ttj3iPXjPHptKiw
         it5I3LRU+o5Aa6ewVQLeBsbZBaAZnVN551GEBuAsa1QPwaI0jDzVZy3iuW8Pd788CVVi
         f0mHxTCF1wh45mGljENEsPJI+CEZsS2B0nyhsCagbzoL9V8dMZ3ivVnQSdJNIbH0uEhs
         4wmq7s5J5ptT8KvP+viNsAo5Atvhzr7pJHwJgj6KZ6S7uiqnz/R2s8Jr+Nj5GApsqsVU
         xAIQ==
X-Gm-Message-State: AOJu0YwtfHr7JDDqL1FWVthMEYvBYGIVm9Wxr5AMxuUMqzCbV+IEZduu
	jLr/MBGKNkzS5cvVM0PUdoymKNUfUJNTr2HyWQSmzGbb9QptDuYIWj3v57XjJFRxmKJ98KczuFA
	=
X-Google-Smtp-Source: AGHT+IF9E+Pe6ObLGEz1Rd/QEiuM5drfmC7FqhljGuWpXIu+Zcn2nXK7XarpiosRDl2ku9C55mgLEw==
X-Received: by 2002:aa7:868d:0:b0:6de:1b57:ca8c with SMTP id d13-20020aa7868d000000b006de1b57ca8cmr8804747pfo.23.1709010761738;
        Mon, 26 Feb 2024 21:12:41 -0800 (PST)
Received: from thinkpad ([117.202.184.81])
        by smtp.gmail.com with ESMTPSA id u5-20020aa78485000000b006e4de94c112sm4951846pfn.66.2024.02.26.21.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 21:12:41 -0800 (PST)
Date: Tue, 27 Feb 2024 10:42:36 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Kunwu Chan <chentao@kylinos.cn>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: ep: Simplify the allocation of slab caches in
 mhi_ep_register_controller
Message-ID: <20240227051236.GA2587@thinkpad>
References: <20240221085937.167200-1-chentao@kylinos.cn>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240221085937.167200-1-chentao@kylinos.cn>

On Wed, Feb 21, 2024 at 04:59:37PM +0800, Kunwu Chan wrote:
> Use the new KMEM_CACHE() macro instead of direct kmem_cache_create
> to simplify the creation of SLAB caches.
> 

There are multiple instances of kmem_cache_create() in this driver. Could you
change them also?

- Mani

> Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
> ---
>  drivers/bus/mhi/ep/main.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
> index 65fc1d738bec..7b61d384b2b6 100644
> --- a/drivers/bus/mhi/ep/main.c
> +++ b/drivers/bus/mhi/ep/main.c
> @@ -1493,9 +1493,7 @@ int mhi_ep_register_controller(struct mhi_ep_cntrl *mhi_cntrl,
>  		goto err_destroy_ev_ring_el_cache;
>  	}
>  
> -	mhi_cntrl->ring_item_cache = kmem_cache_create("mhi_ep_ring_item",
> -							sizeof(struct mhi_ep_ring_item), 0,
> -							0, NULL);
> +	mhi_cntrl->ring_item_cache = KMEM_CACHE(mhi_ep_ring_item, 0);
>  	if (!mhi_cntrl->ev_ring_el_cache) {
>  		ret = -ENOMEM;
>  		goto err_destroy_tre_buf_cache;
> -- 
> 2.39.2
> 
> 

-- 
மணிவண்ணன் சதாசிவம்
