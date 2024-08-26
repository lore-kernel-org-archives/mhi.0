Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24850136E01
	for <mhi@lists.linux.dev>; Mon, 26 Aug 2024 08:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724659734; cv=none; b=QsZhEeq0q2Qv5QhHUG68hu26ck3nQORShnkP1p3eABU8OMZhvJznvPAkc3+tp+iCNZkXtVEwWpj+HBKk8Di/wIm58427rXXPxnLZhaP3xR/NpkNwonHhtySEtl7Mmx7n2Xi5bqR4lTtRC13HVnfKGrGc1BlyYmVODE+lo/JntHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724659734; c=relaxed/simple;
	bh=tn40YMUaCAQ/DJXVR3dqBFaS1otGQJ2t9f0pbYl/a40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mUaJFJqrbzB7GQ3GNoa5lUNbJ1l/avy4fJYrlqaHd+pF6eSMeHiWn39FGnuZkiUp0fnDhbvA23363UxNaYvMxj7M1gEx+ZSPb84k2zufqThyUT1hTP/2pJ4F1y2C6nSAL6bZtr+SCppN+X0bvk/FZGibcdqGU9hZSPBax5JvWjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QGmLrSZs; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QGmLrSZs"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-7cd830e0711so3004743a12.0
        for <mhi@lists.linux.dev>; Mon, 26 Aug 2024 01:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724659732; x=1725264532; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fRo/wbfsDbFv4vokRUxbdhRpSy0+71+5/8aUqsQl01E=;
        b=QGmLrSZsw3zEcvPvbJfIZh1WNZluiL29CAFdxVUzqY0F6g+G6lyc9/I3R6OURR/uQN
         IJHmOFZPM0P/A2TXvU+PT7ZXHJrcbgn/Ep63NzdObiA9KaZIDLc2Y+V5VMgyix7gvukx
         FOaQopFDUPFzBBUUSSlJfY8peYIFNwPcMEwt/EZJJPu+BusjbV2PpyxexsvZ7egQfgZa
         fl20w2ROXPoKAu4KyYqE0OYgOqXOSCU/qB3K6j9uLLSzCQwEALK7I+Z87oGSJM0R1F4A
         ysERj3tgnWsCeRP1yQ3iyDDPSmiSxqpWzcLmfMg7+jgZBchSQ9IHyNQVeNW9OaIWYllZ
         NVBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724659732; x=1725264532;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fRo/wbfsDbFv4vokRUxbdhRpSy0+71+5/8aUqsQl01E=;
        b=Bh0cxAAmPS01TIevjx7W4H01ew4NtcXfly5WeZsKwgjFtcfexYVb2PcvAtnoltAWy5
         KjtpIGPxDcrl9HVU/gQyF3Gzo9ILoK1/dv3bmv3ZgaJhwN17RuSjMoDEkGBpn/jucier
         opLuaemymyg2tWVc4Idz0EVTEkHy+a7dQyjt65dCqbkyERPY46QTbuc9MkeYfNU/bqrO
         XD+VB1BqRq7fMwtootYHUcQ0kTNaKqOnSN/gYNv1RWVZDjgoCY/jo+YK7zfAweOyT3DM
         YVDE3JkajgmRJu5zFlKfZWJXmwxA9WCGf1wlY0E6LODr5z5tH3KAGG/gbJrN6WkZBFLG
         p4xw==
X-Forwarded-Encrypted: i=1; AJvYcCWU4/rjZE0A064oXY2qT/XBrw8IRxWr1/7KRxOxrHqr9GFLCtx7mgG1nLQSCHKhB3BlKAQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwhfpsLkk+GNdJSKrPltrFNXqmG+rCNB7rYZaGXC04x3XZVIuSA
	FZSF9KFYTlkUXsFbeZftjSrwyffCxiN1hhKxkYB1Z1+ylcOIZ61RMNDo/otqTQ==
X-Google-Smtp-Source: AGHT+IF2FFGTkmSkhB3/aVaJKTxyAcidVgGCFapnxd1Gkrhhq7h1CAVaWdUOnm3UG/ERQdcmfDBKVA==
X-Received: by 2002:a17:90a:eb11:b0:2d3:ad41:4d7a with SMTP id 98e67ed59e1d1-2d644777e33mr15743472a91.4.1724659732042;
        Mon, 26 Aug 2024 01:08:52 -0700 (PDT)
Received: from thinkpad ([220.158.156.53])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d6136fef1bsm9115774a91.4.2024.08.26.01.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 01:08:51 -0700 (PDT)
Date: Mon, 26 Aug 2024 13:38:48 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Kunwu Chan <kunwu.chan@linux.dev>
Cc: gregkh@linuxfoundation.org, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Kunwu Chan <chentao@kylinos.cn>
Subject: Re: [PATCH] bus: mhi: host: make mhi_bus_type const
Message-ID: <20240826080848.vcj7yjdoovnnpvvd@thinkpad>
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

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

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
