Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE40101E8
	for <mhi@lists.linux.dev>; Sat,  3 Feb 2024 04:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706936222; cv=none; b=UnTiU1KWd73ZfltP7Jxu7Jnaee/mebO9P61Qk5JHGZu2y+/Dxr8yE87xnVC9L1tA/mddZL5P8nHbJCNCwiQRBSkfiGOs4eHSUuU+bO9rNQ7+goWH3PYHQpxzGQ1rBoumn9G2tcQhBbHHXS1cSY1w5RNGIAFRxRjELY61Y1pGnhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706936222; c=relaxed/simple;
	bh=wKy8pJGaRQ54CuzSdhu8+xkT6SOYTsPwXkeIF/nYQD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hQ5xXDM3BSsG493bj6PiFgf/tmVOkc1OwjQ7lmnKag5IwNBhR4KTlmh6vvJjY7aq6jbCa1FltjBCt6PRM7WU7kbdeDvqZ3t/noJjBMZYvB8INWIQZD7PlqcGUIv1Mb88DF5f9v14puGY7sxohtaxkS2CasSCu3EsS3sZAdM2q44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LiUXo8NM; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LiUXo8NM"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-59a910a1265so1498162eaf.1
        for <mhi@lists.linux.dev>; Fri, 02 Feb 2024 20:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706936220; x=1707541020; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Js2QfXs3Kv3aTrQZDgjZoyjW7ifVdIqfUU+Z5Gf8Jr0=;
        b=LiUXo8NMQMYbyJTa//3otI9NSt/wKFX5mEqirXas0oDV92w9Da5gAoO2SyXYbiMVI2
         rpGyPMTPrjN8XSrCMYf3alnIgh+qDdAjw1KSTLWGD4MTDI8eh1oneA9tWdpN6TKpat6r
         sQjpFNErcExEgiUoSZyk1TLzBQAqsKVrzTrMn0UZ9KTy5iLzxiWZa2BfkraaUnKfKPB4
         gkGs20Mj/CSgFdpJ14lMy+o+7RyzGdKAVn8sXTE2L6XatSkuLBfB/mInVmpVvE1Q88jb
         qgR17FQPt26HP6ppywqEmVSicdSb2jky8EcrYVO2ZZmUcNsPbWl2W5Z0OXDWhQVw9A/L
         /wwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706936220; x=1707541020;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Js2QfXs3Kv3aTrQZDgjZoyjW7ifVdIqfUU+Z5Gf8Jr0=;
        b=qhxS0db1wuUr5+GDmhqAN57soJrc1f5cfu2zLUbCyRaVqJyro2Rng28iHLwFbYFJxb
         jq4hiWmnEdCXbItdgNfKOUa2UtEIi0G80C9CxSaGE3lIj1dghrCTT8gNAk6vjywudbWW
         apdGwgB6zSJU4e4iyZQuyUu2jqPfhx3pengY7xpt+ERu1DyyriS+9/3nE9v/EOhPfHK/
         jCi0wDqjA31KKulEdRhQBMQ0CAM/Bg2fQWud1CiZB6MijpuGpqi/L7GGk+FIgTde2RUL
         RiU26Hf5Ai4T+lAZ5Esdj4HDb8nv1yo5puiQtUnUsCjCuZTfCcQ0yBJ0+qKnStWfApnk
         2YyA==
X-Gm-Message-State: AOJu0YzHnAXyuS+8aCdRM9nUTJBIgQ6l4B6GOxIkI1qXzdOaJuIX4je7
	wm/wmM3h6PtaBk2gUG3g51dnX36KS/nnP4G2bItweymk3LusliZ+AVLOOynK9Q==
X-Google-Smtp-Source: AGHT+IGOgmxZ3CB6VB34fKCm/ENjp6io0zJyn4+7PxlwjeLGiYmNeh5ehDZqnV1Yxl+sjPgzEbquAg==
X-Received: by 2002:a05:6358:3a0e:b0:176:916e:5d97 with SMTP id g14-20020a0563583a0e00b00176916e5d97mr9279249rwe.32.1706936219967;
        Fri, 02 Feb 2024 20:56:59 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVF4BmuxQQtX2Z3E/9s1868PC597dydjDbX0qy52eMb3OihcGrpzTKaXf1yyTwQ/q76pQGBRr7jxWpToOrYMr2VjBUQ6ldXWVD2baTsTMwQCjZjCU6CaU0I4KHpQvJcEBTwbR2OSV34Mv1uu1iWHDLWP6PaYWuA4KcBnGRTrdeTCQyTcLCGVGaGp6CjMXZLm0HlJGqxkVPrVTtEQbrQ01muOk/u3++uVfJpMT2wWz8EDAjgNGXx7j79L9B2Y3H0CTsZaN2WcLbFb4TnXBABbatQk4+v5w0cUS0RIoRzHJMban3bI004Sy2Y8Kp1w0domqj4cBTzMMA6+KQtngWNEMDyH7tV6p1+eCw0EQSM
Received: from thinkpad ([117.202.187.138])
        by smtp.gmail.com with ESMTPSA id j31-20020a63595f000000b005cfbe445a85sm2631019pgm.70.2024.02.02.20.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 20:56:59 -0800 (PST)
Date: Sat, 3 Feb 2024 10:26:53 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Erick Archer <erick.archer@gmx.com>
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Dan Carpenter <error27@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alex Elder <elder@linaro.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2] bus: mhi: ep: Use kcalloc() instead of kzalloc()
Message-ID: <20240203045653.GB3038@thinkpad>
References: <20240128112722.4334-1-erick.archer@gmx.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240128112722.4334-1-erick.archer@gmx.com>

On Sun, Jan 28, 2024 at 12:27:22PM +0100, Erick Archer wrote:
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

Applied to mhi-next!

- Mani

> ---
> Changes in v2:
> - Add more info in the commit message to better explain the change.
>   (Dan Carpenter)
> - Add the "Reviewed-by:" tag.
> 
> Previous versions:
> v1 - https://lore.kernel.org/linux-hardening/20240120152518.13006-1-erick.archer@gmx.com/
> ---
>  drivers/bus/mhi/ep/main.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
> index 65fc1d738bec..8d7a4102bdb7 100644
> --- a/drivers/bus/mhi/ep/main.c
> +++ b/drivers/bus/mhi/ep/main.c
> @@ -1149,8 +1149,9 @@ int mhi_ep_power_up(struct mhi_ep_cntrl *mhi_cntrl)
>  	mhi_ep_mmio_mask_interrupts(mhi_cntrl);
>  	mhi_ep_mmio_init(mhi_cntrl);
> 
> -	mhi_cntrl->mhi_event = kzalloc(mhi_cntrl->event_rings * (sizeof(*mhi_cntrl->mhi_event)),
> -					GFP_KERNEL);
> +	mhi_cntrl->mhi_event = kcalloc(mhi_cntrl->event_rings,
> +				       sizeof(*mhi_cntrl->mhi_event),
> +				       GFP_KERNEL);
>  	if (!mhi_cntrl->mhi_event)
>  		return -ENOMEM;
> 
> --
> 2.25.1
> 

-- 
மணிவண்ணன் சதாசிவம்
