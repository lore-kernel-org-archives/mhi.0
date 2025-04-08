Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597F5217F5D
	for <mhi@lists.linux.dev>; Tue,  8 Apr 2025 07:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744095694; cv=none; b=KhVbUYP3clh1WoIbY7M1BEe98d9TW814+3/AgXB5OYA9+Pgw9BsPyZO6bXTGlKuc3ZFu3MZD3j1Juru8jH4OJdzvwNX2XlARqiueUvggyAugsqeb9u/WU69eaGxC5Yzsefi5RfHXOxuJC6lQy9K3APDfGDcRk3rb5mXhmPyyV8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744095694; c=relaxed/simple;
	bh=nPoYtZy7KUFsWmjv+MsgSGiqHF3BXzTIHzDdr8PqkRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vGP8YW5MA4Gv0geSkO2WFTd0LcWpZHtXfNRWiP7tPn5jlxGuERrqErlgHT1c1aNAwiaobu8x0ZnrKqe/kELnVaZx95DHEwLPFgMPwG9m4WpoE3HSnDtz9aJQKCED9VzQLjKDnzcISjeudDLXYGeY5Dk2NvYcMLyto2oNsHVVPUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aBFKQCW3; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aBFKQCW3"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7370a2d1981so4347893b3a.2
        for <mhi@lists.linux.dev>; Tue, 08 Apr 2025 00:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744095692; x=1744700492; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Sk6fM8RXeZDF444eeBwp9+VL+kRgjV92ftku8RxORXo=;
        b=aBFKQCW3cTfJqQANopdU2XROzvv4qQtQ7fUustwr82NLCCCZ0zPFVo09e2QyprQelu
         cJeqVtrPaxa07H37DMLEp0hYCbnvjpTmQ8dHAl+nczRbLOIgm9bg5MHd7VQcHkFCZgh2
         dYZwrngfxjYd9JHFvWbov+H9Md3cRl4agr4YTJ5VL49NYqHgMn5B3QyMLgzNAHfDNF2Z
         T9d1CBoe+2KjyQgUOlur4HPOsSr5KapWqOgI6iGrUI2mbw52c9dxw3nsAgYejLXmhGZz
         8nuRdPAFQQja/9Cy+Z9gWATiC2i6D+BHb+C/bFFaWIzFMAWuc0YmyFxdE0DpYlgqRQSO
         8wMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744095692; x=1744700492;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sk6fM8RXeZDF444eeBwp9+VL+kRgjV92ftku8RxORXo=;
        b=eSyoNAm4sYnO3ZFpRDiAU8okZe9nV4r0Skf6REnq7dCKucKzkI2JFIpMM0+ADn9hJk
         ssmmOqZgB/X7SCqc08hTyU7uLfc7kySVt8B/WmGTPVx+ZJT7Be1G2JDL+ZnQRX2VLuqK
         LImaC9xRqr8a/URHONm/uJRyNF50EALF8V0KLODz0+Xr56fuFE1eByMVqBkVD7yZT6ql
         1PA21Y7MBSr/2BIMbzyQ2mZxUiQJ7pEXEcuY9QDabhGn7GcTnB04bKEclAXD9ZHL4Mtw
         ZFZqo4Wp2+x8onz0M6uV25viIlLWS+UHBuHZzmLQ02RlJADnLQcv57DQ0slMyADtwGZW
         PXXQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8kh37J9zkiTJBR0yny0+WP66zfwtMcIrKCfr10i/RgERFa+KckzDxflWuOsfTCuaeEKc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxAsu4/aW3wenBosvCcnYGVm8lykvmvudaUpprN0fAJWWtY8lAV
	JdCsL8gw6W152Vweu1dmUIpFu0S3P7ccH+qDlYavxacs5qabk5O+KD9yX+hiBQ==
X-Gm-Gg: ASbGncu98S93iTJag/Vzmw1pxx/ZYxt2aEAo8vh9mouxkl/VifyeysTC2dUxiHH6V+3
	lWMjfU1UMtIUGmISjI5Z+IHaQlWfVBzXqv4Yav+VIbJMxLcwNm6qr8KL8NtABhyaV0phDj4hxTo
	uPghVbWoQnr+8qGa9kZOcUCrgiv0D+/VyveAag8SLv2LMY+nKIZhNt/7S1CKk/zjucdLa00ZN3e
	lp6HpyaLt3SWQWVYs7oxxschtFVdSqC8R2ESdmhvRbk5IL5zHq2/gj70l9x3nzCntvqF5vYxmtl
	k23kEKTdS59joY0Lp0X8BuMFeZu5BO3a0Y2G59hHWqkVGybsrzm6jpw6kynZ7NFkylE=
X-Google-Smtp-Source: AGHT+IEb4ZMUwD/qZOKPwHHbmJhudJyZ4zNQvD6Atyq5HyLXWWSig7IGpn8rhWxjicEiA9KL3IwKcw==
X-Received: by 2002:a05:6a00:98f:b0:732:2484:e0ce with SMTP id d2e1a72fcca58-739e4b44d68mr16443121b3a.17.1744095692564;
        Tue, 08 Apr 2025 00:01:32 -0700 (PDT)
Received: from thinkpad ([120.60.134.231])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d97d17f8sm10070318b3a.10.2025.04.08.00.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:01:31 -0700 (PDT)
Date: Tue, 8 Apr 2025 12:31:27 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: quic_carlv@quicinc.com, quic_thanson@quicinc.com, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
Subject: Re: [PATCH] bus: mhi: host: Allocate entire MHI control config once
Message-ID: <pgr6u3onrlf4mvldqn7cxlqkh3krduv542jqgjcy5c535ys6hm@dujbvax4b56s>
References: <20250328165913.3380933-1-jeff.hugo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250328165913.3380933-1-jeff.hugo@oss.qualcomm.com>

On Fri, Mar 28, 2025 at 10:59:13AM -0600, Jeff Hugo wrote:
> From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> 
> MHI control configurations such as channel context, event context, command
> context and rings, are currently allocated individually. During MHI
> initialization MHI bus driver needs to configure the address space in
> which this control configuration resides. Since different component of the
> config is being allocated separately, only logical solution is to give the
> entire RAM address space, as they could be anywhere.
> 

This is fine...

> As per MHI specification the MHI control configuration address space should
> not be more them 4GB.
> 

Where exactly this limitation is specified in the spec? The spec supports full
64 bit address space for the MHI control/data structures. But due to the device
DMA limitations, MHI controller drivers often use 32 bit address space. But
that's not a spec limitation.

> Since the current implementation is in violation of MHI specification.

How?

> Allocate a single giant DMA buffer for MHI control configurations and
> limit the configuration address space to that buffer.
> 

I don't think this could work for all devices. For instance, some ath11k devices
use a fixed reserved region in host address space for MHICTRL/BASE.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
