Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F4B66B2B
	for <mhi@lists.linux.dev>; Tue, 30 Jan 2024 11:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706613843; cv=none; b=sM0nTbyIUQmmEmMZvf8DYOJ0RBAZ6bbEAE+1OOf5E4tNFK3SD7QCViAgQT/kmWMa1VG0EXEP5dI6GFD0rZDU8bSHJjv6SUWwd3D4afq05jW0BIAb3kTX3MkD+PQZRDoHul0wc21uLNHH1DCBJ5aqK2tASj6QT4Ck13StXdwTgS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706613843; c=relaxed/simple;
	bh=lv43hevcTa+64J0GxwrbWW7IYyzTy2+TvNR2spRRFog=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ebtDJS8jV27dOIA/2vovL51eoeRloJE9Xyj2W+e3BvK95mYIM7Hcdz//yKsQjLDW/OA26AdW7r0tsC0FFiQnCyhWS9lz0K6u8M4wY9sunlCi0GhearA98HscxuMLBMvb5t98LCdeVn2kJ1+UjX41cwJdQYV7kQXKy1EtP3/Lt8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pBi3HVff; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pBi3HVff"
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3637b935e80so5146945ab.3
        for <mhi@lists.linux.dev>; Tue, 30 Jan 2024 03:24:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706613840; x=1707218640; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1F5K1w5ptPpWVbrzL69kxVWikdQT589qSufOOrLNvyk=;
        b=pBi3HVffUcmu/Tp8jRnFkuBNaogWyKstASEoLekR4XalMSd0GunX+6auD1NpslS/C/
         EJx1CIq1G4c7ozG8Wl73lDrL642FcyRu6kjx2SZHWixh777LDFyhHHpu7KPXxlg1srpb
         xS7TCfsmPvrTe46JMPKgcS5hqkvmllv7R+ZoPD2QGYMNHzIjjY00wzIOQJXhLZjLxgC1
         dyBxzrutvy8wh7IRDw/3WEnZixsVkw5KDnkiG9w5DWZQU5KAaW60EV6XOK2cF8YLDmYZ
         9CsmjPK3w1cEzz5HC5vkRoZm2kPmLCz2HutcwTIC7y9PNHpEUexD/EXLinz0aKM1ThEa
         b7oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706613840; x=1707218640;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1F5K1w5ptPpWVbrzL69kxVWikdQT589qSufOOrLNvyk=;
        b=iDxodzWRVXFbY+ggY9VXKwxt+O+KDzfysO4m9y7Ydd9jfiVRUP/T0Act6qZg5B/a03
         aMFG/+VRxckc4cKlItvYl5B8hHyrNb3AFpUnE9RF1jR3nlPBKUYRHeA5FL1cI2grhfvx
         y9npCwFUv2/ZvcWo2MCjQ0ZKAIVcWWzN8VV8SZQ8UgIWl4IQWY5yP50GYaPngiByTDKB
         2LwZV8bSa58fo94oktzDXNCmLS8ByfiiZj3ZcIm0e4wqFdgHuZRQhyhzwlkvawi27/l8
         AvYNmEaQOE5ott5it6l52EwGtLEmjKQlxKNEnZ6qcv+LZmTa0mZS0ITbFRYdX3MkMggI
         IJww==
X-Gm-Message-State: AOJu0YzhLKdN7d4iIyaqx1JzPS7dXEHdcV5vM7RJovsHaz9CgnlQxPnM
	8UstFhx4p7T3nBLaUdBnAlGNvicg3eTAU6GKPGFTMHgSWg96OkvSwbwZMlgcNPc=
X-Google-Smtp-Source: AGHT+IHKdQCanZI5XXVDCMtb7vhvgINd+abU2YHqtb5E0Q9PMHdFUkLdkHUE23F69+B0bNtzNBk0pg==
X-Received: by 2002:a92:c14b:0:b0:363:8559:edf with SMTP id b11-20020a92c14b000000b0036385590edfmr3200068ilh.1.1706613840424;
        Tue, 30 Jan 2024 03:24:00 -0800 (PST)
Received: from [172.22.22.28] (c-98-61-227-136.hsd1.mn.comcast.net. [98.61.227.136])
        by smtp.gmail.com with ESMTPSA id e16-20020a92d750000000b00362902d6818sm2787085ilq.62.2024.01.30.03.23.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jan 2024 03:23:59 -0800 (PST)
Message-ID: <b5ae6fd2-1dee-47e4-b7e4-ebd8a2aea472@linaro.org>
Date: Tue, 30 Jan 2024 05:23:58 -0600
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] bus: mhi: ep: Use kcalloc() instead of kzalloc()
To: Erick Archer <erick.archer@gmx.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Dan Carpenter <error27@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20240128112722.4334-1-erick.archer@gmx.com>
Content-Language: en-US
From: Alex Elder <elder@linaro.org>
In-Reply-To: <20240128112722.4334-1-erick.archer@gmx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/28/24 5:27 AM, Erick Archer wrote:
> This is an effort to get rid of all multiplications from allocation
> functions in order to prevent integer overflows [1].
> 
> Here the multiplication is obviously safe because the "event_rings"
> member never can have a value greater than 255 (8 bits). This member
> is set twice using always FIELD_GET:
> 
> mhi_cntrl->event_rings = FIELD_GET(MHICFG_NER_MASK, regval);
> mhi_cntrl->event_rings = FIELD_GET(MHICFG_NER_MASK, regval);
> 
> And the MHICFG_NER_MASK macro defines the 8 bits mask that guarantees
> a maximum value of 255.
> 
> However, using kcalloc() is more appropriate [1] and improves
> readability. This patch has no effect on runtime behavior.
> 
> Link: https://github.com/KSPP/linux/issues/162 [1]
> Link: https://www.kernel.org/doc/html/next/process/deprecated.html#open-coded-arithmetic-in-allocator-arguments [1]
> Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> Signed-off-by: Erick Archer <erick.archer@gmx.com>
> ---
> Changes in v2:
> - Add more info in the commit message to better explain the change.
>    (Dan Carpenter)
> - Add the "Reviewed-by:" tag.

Looks good.

Reviewed-by: Alex Elder <elder@linaro.org>

> 
> Previous versions:
> v1 - https://lore.kernel.org/linux-hardening/20240120152518.13006-1-erick.archer@gmx.com/
> ---
>   drivers/bus/mhi/ep/main.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
> index 65fc1d738bec..8d7a4102bdb7 100644
> --- a/drivers/bus/mhi/ep/main.c
> +++ b/drivers/bus/mhi/ep/main.c
> @@ -1149,8 +1149,9 @@ int mhi_ep_power_up(struct mhi_ep_cntrl *mhi_cntrl)
>   	mhi_ep_mmio_mask_interrupts(mhi_cntrl);
>   	mhi_ep_mmio_init(mhi_cntrl);
> 
> -	mhi_cntrl->mhi_event = kzalloc(mhi_cntrl->event_rings * (sizeof(*mhi_cntrl->mhi_event)),
> -					GFP_KERNEL);
> +	mhi_cntrl->mhi_event = kcalloc(mhi_cntrl->event_rings,
> +				       sizeof(*mhi_cntrl->mhi_event),
> +				       GFP_KERNEL);
>   	if (!mhi_cntrl->mhi_event)
>   		return -ENOMEM;
> 
> --
> 2.25.1
> 

