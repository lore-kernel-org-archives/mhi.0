Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF1A129E93
	for <mhi@lists.linux.dev>; Wed, 12 Jun 2024 21:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718229214; cv=none; b=oxTTz+Ltng6uWYWJbufnILfuZ0CCCaPWc6NuiAOIXyaTdgJmG7F9N1nMo4rhZnzce3flthbIsPJ09V5MsaWcDvhSR7XFIaPuPSSQiMZTJbz+G5UyW0JLAlFmtJSSFkhPhC3M+ag1hk/hWXqXeRbrsWNGikexqEUhyQuKcwupJr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718229214; c=relaxed/simple;
	bh=mcJjYHjV++hIvIdWkHyHOgdpiusnN+4IJjaQnk6MVdI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rqo8dT6umUtHdq82tXLVqovt4zqvtPo6Shy7D1tDMgEjwxLMegiUwo3SyT191IpxhGY7LX0B6nZSY0J5LzOvhCVKmhb6sA7gCSYT4OA+tx4si6cSf1glI3Tgd1BvPEwjqbGHMxlFfsOU7Kf3qe1H4fNT/TiFZYupEKDdRYnlG9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IW318krX; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IW318krX"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4217990f8baso3934635e9.2
        for <mhi@lists.linux.dev>; Wed, 12 Jun 2024 14:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718229210; x=1718834010; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9pxDQ2xml58KGU++S3MziyUsd0pYxlkTij9Nt+5fCkQ=;
        b=IW318krXCnPtrLqYWHUjYJz48BiQl+bLBb0+FfwiDnwY4rmiMC0neqg6RkMNp7kQyf
         qVyBj6jwUhPWthVYDIDmg+XuvwkOenuYl5efZ2eFYHQoFLYBCEIG6veJYIzTkA000TE6
         8N9MLkt6oOOBJ2wb7kTM2eVLllVIcd6G1quCq/0FaLiUAzGHd4aW4jpmskvND4jyOYat
         NMH7cR4qJZBKyc5d/om/Q8RWVgS/eZoKFa5383TJQuJfTeUx7MSjrDXkBB4HFwh0I5bO
         IvYgMsVOm/SS3zzkvnKwbmyH43GWHUhG0TREU5HT7RpUB0P8hq5qbKMQ85U3rpHPco0Q
         cHFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718229210; x=1718834010;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9pxDQ2xml58KGU++S3MziyUsd0pYxlkTij9Nt+5fCkQ=;
        b=Am8W2J0ltHGAJuNsC1MOplGWluT6wOiGRnJtJ9MLzds6uB2S/N/RjqShXxKzDhl/V1
         6kAQEB0mntEGFK+hTqHUkW0+iVA16TGC2pw7DborIkq/woZOk12ni/TWqQO6Jbs7YNVo
         bZRKlyMHyBtPdkjiuMqH0waik82Iyf0PoW9X00z4PPiGCA0f4f7na93+4clQLG8lKC3T
         rLU4RMQUJFRJ2WZTBbZEoKiqQY3reKsEOEAFq8zKdu1XfU+if5EL8BPZYhcs3rjBUzQs
         MCsz5yE78CfxZqJQB6WGE4RxStzyU9LCRQDWSxDGF6RxqsahkpcvSdX0XikiGRmV2UfR
         HPhA==
X-Forwarded-Encrypted: i=1; AJvYcCWk8L6BxpeDGIijcJRXkq6SxIBvRvDZYOa1MFlHjU+g5uJTr1ptcndfeKgPhlEF4yyW4vMmNcjMGgAPAFzs56lJUj3y
X-Gm-Message-State: AOJu0YwCPkkmme5ayGca5EHsDP/mi8D4Hj+ixqIqr303iFAKKRcSW6SO
	j05wsmG18f7F5N/H0pMsoayuP2rCbrY760l0lXNQKOHjX0YLnk3C
X-Google-Smtp-Source: AGHT+IFqIoOKC1lqkvIoSrutwet1tzBSEOu4Q+/c77rzZJZWz+OjyJm4fZX/gA7it5X1tJrM35WvNQ==
X-Received: by 2002:a05:600c:358b:b0:422:6765:2726 with SMTP id 5b1f17b1804b1-422865ad68fmr27777105e9.30.1718229209883;
        Wed, 12 Jun 2024 14:53:29 -0700 (PDT)
Received: from [192.168.0.5] ([69.6.8.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35ef5d2e73dsm17831029f8f.16.2024.06.12.14.53.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jun 2024 14:53:29 -0700 (PDT)
Message-ID: <0b24c10f-1c20-4bd1-958b-dbf89cb28792@gmail.com>
Date: Thu, 13 Jun 2024 00:54:03 +0300
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] net: wwan: mhi: make default data link id
 configurable
To: Slark Xiao <slark_xiao@163.com>, manivannan.sadhasivam@linaro.org
Cc: loic.poulain@linaro.org, johannes@sipsolutions.net,
 quic_jhugo@quicinc.com, netdev@vger.kernel.org, mhi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240612093941.359904-1-slark_xiao@163.com>
Content-Language: en-US
From: Sergey Ryazanov <ryazanov.s.a@gmail.com>
In-Reply-To: <20240612093941.359904-1-slark_xiao@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Slark, Manivannan,

On 12.06.2024 12:39, Slark Xiao wrote:
> For SDX72 MBIM device, it starts data mux id from 112 instead of 0.
> This would lead to device can't ping outside successfully.
> Also MBIM side would report "bad packet session (112)".
> So we add a link id default value for these SDX72 products which
> works in MBIM mode.

The patch itself looks good to me except a tiny nitpick (see below). 
Meanwhile, I can not understand when we should merge it. During the V1 
discussion, It was mentioned that we need this change specifically for 
Foxconn SDX72 modem. Without any actual users the configurable default 
data link id is a dead code.

According to the ARM MSM patchwork [1], the main Foxconn SDX72 
introducing patch is (a) not yet merged, (b) no more applicable. So, as 
far as I understand, it should be resend. In this context, a best way to 
merge the modem support is to prepend the modem introduction patch with 
these changes forming a series:
1/3: bus: mhi: host: Import mux_id item
2/3: net: wwan: mhi: make default data link id configurable
3/3: bus: mhi: host: Add Foxconn SDX72 related support

And merge the series as whole, when everything will be ready. This will 
help us to avoid partially merged work and will keep the modem support 
introduction clear.

Manivannan, could you share the main [1] Foxconn SDX72 introduction 
patch status, and your thoughts regarding the merging process?


1. 
https://patchwork.kernel.org/project/linux-arm-msm/patch/20240520070633.308913-1-slark_xiao@163.com/

> Signed-off-by: Slark Xiao <slark_xiao@163.com>
> ---
>   drivers/net/wwan/mhi_wwan_mbim.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wwan/mhi_wwan_mbim.c b/drivers/net/wwan/mhi_wwan_mbim.c
> index 3f72ae943b29..c731fe20814f 100644
> --- a/drivers/net/wwan/mhi_wwan_mbim.c
> +++ b/drivers/net/wwan/mhi_wwan_mbim.c
> @@ -618,7 +618,8 @@ static int mhi_mbim_probe(struct mhi_device *mhi_dev, const struct mhi_device_id
>   	mbim->rx_queue_sz = mhi_get_free_desc_count(mhi_dev, DMA_FROM_DEVICE);
>   
>   	/* Register wwan link ops with MHI controller representing WWAN instance */
> -	return wwan_register_ops(&cntrl->mhi_dev->dev, &mhi_mbim_wwan_ops, mbim, 0);
> +	return wwan_register_ops(&cntrl->mhi_dev->dev, &mhi_mbim_wwan_ops, mbim,
> +		mhi_dev->mhi_cntrl->link_id);

Just a nitpick. The second line had better be aligned with the opening 
bracket:

return wwan_register_ops(&cntrl->...
                          mhi_dev->...

>   }
>   
>   static void mhi_mbim_remove(struct mhi_device *mhi_dev)

--
Sergey
