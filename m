Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79BDD29E
	for <mhi@lists.linux.dev>; Tue, 19 Mar 2024 16:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710866151; cv=none; b=K23xYaIqTNiVYe1bsknffPOd6JpdqawNipzD694MzEqiuOmcDIWMeatFmAllndMvL4EorgKMqKz6s3ABl4oT5vIa59OFFFkPQP3rpW+kP0CTRm51lu1VLqq87ISZlwDosryfruqrMZcm5l0Ep/P2dEZKbnifrFcI9KnAkP44tpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710866151; c=relaxed/simple;
	bh=q9uBXXkF/Mg0O6HtdHWp+kni+gGwOkJTVLcjuy2q/UA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b4G2IPBhj9Ono6C29Q3yhA5n8etK7zdRCW993Wzw6OCIcRlhKHCyjK8ipa28tCweiUU5Qj7Fe6ENEL/r21S/LYkp8zRScLa7s/OU+hNDxf9k88Ozhuo+3CQnp2ZkbiJbRfz0BmgtXf+/sE+G1cOgUrOOMwKa482u/pcvbeEm2X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uG9qFyY+; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uG9qFyY+"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6e6082eab17so5050095b3a.1
        for <mhi@lists.linux.dev>; Tue, 19 Mar 2024 09:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710866148; x=1711470948; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w96SEqzYAbTpf966liJXQFnSoV9Z+YW1Z6ZiFx4qEQs=;
        b=uG9qFyY+WbRbMVJSOHGNs1Dgs6+q7lMnmigVce9I2rIvlDKIbohVvlmOWt/WBIXX2c
         dGLSurMryg1XID+EgKauXUTW+IH2mhB46yM1occsEuyzycth8x9PPfhdjucjOcpkdrrI
         LAXdcqb8J5U3h/y9jWsvSLS0DvxDJPTLiOhuynGuVYy4aWiEWulJnPZA7d2vP2WeJ/OD
         M1uuAgEgCCF+hTgTyIrpaYRfoa6ZHbC81y4jCkRLdB/u70ODMuVQsr3GtF40yJZSPU6x
         OFEvSaeSQFvV1+O8zcof7pzIqzOsERyowWbKBnzk83KY74/9IQBI1IDWcBOsPUbbqbmB
         lh2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710866148; x=1711470948;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w96SEqzYAbTpf966liJXQFnSoV9Z+YW1Z6ZiFx4qEQs=;
        b=QQsVVzDnaEbobdKoiRoc7TpbRDDu3tnNp6i39FFn65880Qh4K3GWEi6ifhM1pjmQaA
         wWs/hcKTbplhVIoSTb3DGQUmGDKiGek3VX//UYt22ylULYdd5H2zKTgJ9knXlxPogNL4
         oXwwxv2ikFldZFuuJ+QXqttVpdyUftK7jU6ZkpJptQgEIANWtjziXip2dX2o6RNuFyHu
         +lGwZC4OoAv8dIceYPeVGzd5Zi2jN0AaSbZxjuQ1kbU5x1PZLNTppl1WQcSegphcXWrh
         Lbl+9zLYKgFOTRNvcPO326431t/3jjnRl/3Xizsn57CCH0cVCiA5RJjm7Sy/YnV6OI8Z
         zHiQ==
X-Gm-Message-State: AOJu0YxtVbuxa9cFuDCEb+LFDyiep/5b7DWepH+knooX9vvMp7HQGlrG
	gW65A1qUwsc0C/nO5QIHx0JHTApVZCDW0YCMpuPNjqkgCUii6zC9Ux9FiJNKx/dXZZJdDLAZsNs
	=
X-Google-Smtp-Source: AGHT+IHUQM6pzUf/IP4HxZ2Ij8eYMGp3z1k0Y4oBtNyrAeqJ6GDq1SULh4emJAASSYdl6qKHg7E2/w==
X-Received: by 2002:a05:6a21:3406:b0:1a3:6940:82ea with SMTP id yn6-20020a056a21340600b001a3694082eamr5204737pzb.31.1710866147866;
        Tue, 19 Mar 2024 09:35:47 -0700 (PDT)
Received: from thinkpad ([120.56.201.52])
        by smtp.gmail.com with ESMTPSA id y31-20020a056a00181f00b006e61b0a4b17sm9923587pfa.185.2024.03.19.09.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 09:35:47 -0700 (PDT)
Date: Tue, 19 Mar 2024 22:05:44 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Kunwu Chan <chentao@kylinos.cn>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] bus: mhi: ep: Simplify the allocation of slab caches
 in mhi_ep_register_controller
Message-ID: <20240319163544.GE3297@thinkpad>
References: <20240228030056.509994-1-chentao@kylinos.cn>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240228030056.509994-1-chentao@kylinos.cn>

On Wed, Feb 28, 2024 at 11:00:56AM +0800, Kunwu Chan wrote:
> Use the new KMEM_CACHE() macro instead of direct kmem_cache_create
> to simplify the creation of SLAB caches.
> 

There are 3 kmem caches in this driver. Please change all of them.

- Mani

> Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
> ---
> v2:
>     - Simplify the allocations of mhi_ring_element slab caches
> ---
>  drivers/bus/mhi/ep/main.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
> index 65fc1d738bec..795611482f16 100644
> --- a/drivers/bus/mhi/ep/main.c
> +++ b/drivers/bus/mhi/ep/main.c
> @@ -1478,9 +1478,7 @@ int mhi_ep_register_controller(struct mhi_ep_cntrl *mhi_cntrl,
>  		goto err_free_ch;
>  	}
>  
> -	mhi_cntrl->ev_ring_el_cache = kmem_cache_create("mhi_ep_event_ring_el",
> -							sizeof(struct mhi_ring_element), 0,
> -							SLAB_CACHE_DMA, NULL);
> +	mhi_cntrl->ev_ring_el_cache = KMEM_CACHE(mhi_ring_element, SLAB_CACHE_DMA);
>  	if (!mhi_cntrl->ev_ring_el_cache) {
>  		ret = -ENOMEM;
>  		goto err_free_cmd;
> @@ -1493,9 +1491,7 @@ int mhi_ep_register_controller(struct mhi_ep_cntrl *mhi_cntrl,
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

-- 
மணிவண்ணன் சதாசிவம்
