Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B4F1BC077
	for <mhi@lists.linux.dev>; Sat,  1 Feb 2025 16:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738426048; cv=none; b=oEou1CC3059pqHvXuPPwnRoHyWK0Umwco7l322kyQyH/chFDGrhRv9/gBY2BwxwGXlubzXlEnp3hOoMAFwSIREOKZVTR8ONZIS/EiLxmsbBfrejo0zjZNSMKpn/l7K4t3qCzrn7xyNrcoZhMQHrRSjoSOygYNqtMx22ED52V3P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738426048; c=relaxed/simple;
	bh=g06AyooziM75vKiwG8D4NAwEKMYO1gOo6PVjYKxBdaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ioDqOsu3CxjprzVFGyTJ8uhCPKqlgXkaoppIE/vZZthXQUS0Df1FO7fndsveyv0fSYxKi7qyPrq28eYZm4XjEuT3EqYVhTZEgZyBPFyOSkSbhqYy6Lx/5Avdy1eMk2J8g/4PPvNX1ECauS6boOP/KeXwt92K/hLSI2A6xnk6JYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ENVVreTz; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ENVVreTz"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2164b1f05caso50378195ad.3
        for <mhi@lists.linux.dev>; Sat, 01 Feb 2025 08:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738426046; x=1739030846; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eZ3t1aj2mFgpfj7pEzNxUv1YuWtm6+xQW/tflVh/XyA=;
        b=ENVVreTzMJsSJle/N7tXzD6YOh+l9+9Ti7bGY63PYk90NQMDQwrJj1LhfJAqncvRPI
         5WpHzO404hiLYBe2FkoNxC53whwXgv674gwjclLsRTsKOQEA4DCxydfw/jrT5xKaCT63
         TP1faCRiyvUzAUJ7n1TKEnrlstiZI71WnH365THlK/8ztkffiqg9dltE9TFYfh95v0xq
         bjcYKR6rWkgH32wTscYwUJmzgq1DY0PZPXicZs/qpVX/lcWb2KV+tg4pU3OW3SAJmDtD
         QRUWXHIx0D3GttrKtjYpFEWiJyNNL8/hgJ3p6anENlHuJdeqgc13XRMqZwycC9OGgxmN
         Yx9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738426046; x=1739030846;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eZ3t1aj2mFgpfj7pEzNxUv1YuWtm6+xQW/tflVh/XyA=;
        b=Je1Lycy2eLNTnWHFanPHAwYEghhf2ScexFvEo46k14Pl2T1dene0z614ITZ9B58SGH
         VqQ2gtdNVX6JMjsQQZxsYOGyy00d0YTcpH4S0BYjjdnhzMN2Ygh/Y/G5Z+hckoA65L+5
         lLrtKmIjWFRFY/kx2uHfkon/pUDVklP7ULORkNfVUUjaPpAMHedUFJaxx+PifQbW6omo
         7jhvFFobJRP4+uFFN908Gy8iNkriVit/Y8zzfbaCLs83RF02LfIOj+8wtJrX1WyNqxI1
         Z62BEhCkjj8RVbkGIOss8Estni1WC1IM5R+LTRYPntnUDEaJP0eRW+nNqojBDevt24aa
         P7ZA==
X-Gm-Message-State: AOJu0Yw7+tHP+OyVYYTZqRbPYwvwNcLXfoDh6YWLNwofyLJPZqc7Gcew
	M3gCWB8bhLyxpkivZZx+gJRpuw3T5vEdJ6DaKcK/UhqSIkyzEKEXGnH0nFsCoA==
X-Gm-Gg: ASbGncsCr72jz8O6OG5pB1S8UhBrmXcsD/YOlhR6pulQaxXTY7gsRywZDp3jHxCzFnI
	93o5pKFdot9rbYRyxhHCPYQCbt7u1VTLUfzt9SwCRyQq8nYnNdE0/mZmmua3AYJv0jWpT/ECxNt
	mM03LF8lontIKJxaV0/kVY7znssg1gBfP/87j30e18mInVQdclmf9AWxCvelZRpYU4t5ZZk+bsV
	THYko7SB7OrUd8ZHaMadpoPlIrujk6dm19UQPO6i2Gofg0v4HzAhLibcr/OH+U5w5Ze7u779biL
	uZWvLl1Q98djIuUPaxhd5jSvrLw=
X-Google-Smtp-Source: AGHT+IGKVXS8baXhCPTBe6sl/h9UfWPlgRpWJrmewAX1ZXLow3mZ1mzo+rt7H8F7HI7Zdq7gTkCKAg==
X-Received: by 2002:a05:6a20:72a0:b0:1e5:a0d8:5a33 with SMTP id adf61e73a8af0-1ed7a62498amr27455365637.18.1738426045945;
        Sat, 01 Feb 2025 08:07:25 -0800 (PST)
Received: from thinkpad ([120.56.202.249])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69cd80esm5193344b3a.121.2025.02.01.08.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 08:07:25 -0800 (PST)
Date: Sat, 1 Feb 2025 21:37:21 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: linux@treblig.org
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: Remove unused functions
Message-ID: <20250201160721.bgfyi3cwilvibl74@thinkpad>
References: <20250127215859.261105-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250127215859.261105-1-linux@treblig.org>

On Mon, Jan 27, 2025 at 09:58:59PM +0000, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 

Subject prefix should be:

'bus: mhi: host:"

> mhi_device_get() and mhi_queue_dma() haven't been used since 2020's
> commit 189ff97cca53 ("bus: mhi: core: Add support for data transfer")
> added them.
> 
> Remove them.
> 
> Note that mhi_queue_dma_sync() is used and has been left.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/bus/mhi/host/main.c | 19 -------------------
>  drivers/bus/mhi/host/pm.c   | 14 --------------
>  include/linux/mhi.h         | 18 ------------------
>  3 files changed, 51 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
> index 4de75674f193..4c91ffd6ed0e 100644
> --- a/drivers/bus/mhi/host/main.c
> +++ b/drivers/bus/mhi/host/main.c
> @@ -1181,25 +1181,6 @@ int mhi_queue_skb(struct mhi_device *mhi_dev, enum dma_data_direction dir,
>  }
>  EXPORT_SYMBOL_GPL(mhi_queue_skb);
>  
> -int mhi_queue_dma(struct mhi_device *mhi_dev, enum dma_data_direction dir,
> -		  struct mhi_buf *mhi_buf, size_t len, enum mhi_flags mflags)
> -{
> -	struct mhi_chan *mhi_chan = (dir == DMA_TO_DEVICE) ? mhi_dev->ul_chan :
> -							     mhi_dev->dl_chan;
> -	struct mhi_buf_info buf_info = { };
> -
> -	buf_info.p_addr = mhi_buf->dma_addr;
> -	buf_info.cb_buf = mhi_buf;
> -	buf_info.pre_mapped = true;
> -	buf_info.len = len;
> -
> -	if (unlikely(mhi_chan->pre_alloc))
> -		return -EINVAL;
> -
> -	return mhi_queue(mhi_dev, &buf_info, dir, mflags);
> -}
> -EXPORT_SYMBOL_GPL(mhi_queue_dma);
> -
>  int mhi_gen_tre(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
>  			struct mhi_buf_info *info, enum mhi_flags flags)
>  {
> diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
> index 11c0e751f223..2fb27e6f8f88 100644
> --- a/drivers/bus/mhi/host/pm.c
> +++ b/drivers/bus/mhi/host/pm.c
> @@ -1296,20 +1296,6 @@ int mhi_force_rddm_mode(struct mhi_controller *mhi_cntrl)
>  }
>  EXPORT_SYMBOL_GPL(mhi_force_rddm_mode);
>  
> -void mhi_device_get(struct mhi_device *mhi_dev)
> -{
> -	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
> -
> -	mhi_dev->dev_wake++;
> -	read_lock_bh(&mhi_cntrl->pm_lock);
> -	if (MHI_PM_IN_SUSPEND_STATE(mhi_cntrl->pm_state))
> -		mhi_trigger_resume(mhi_cntrl);
> -
> -	mhi_cntrl->wake_get(mhi_cntrl, true);
> -	read_unlock_bh(&mhi_cntrl->pm_lock);
> -}
> -EXPORT_SYMBOL_GPL(mhi_device_get);
> -
>  int mhi_device_get_sync(struct mhi_device *mhi_dev)
>  {
>  	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index 059dc94d20bb..dd372b0123a6 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -720,12 +720,6 @@ enum mhi_state mhi_get_mhi_state(struct mhi_controller *mhi_cntrl);
>   */
>  void mhi_soc_reset(struct mhi_controller *mhi_cntrl);
>  
> -/**
> - * mhi_device_get - Disable device low power mode
> - * @mhi_dev: Device associated with the channel
> - */
> -void mhi_device_get(struct mhi_device *mhi_dev);
> -
>  /**
>   * mhi_device_get_sync - Disable device low power mode. Synchronously
>   *                       take the controller out of suspended state
> @@ -776,18 +770,6 @@ int mhi_prepare_for_transfer_autoqueue(struct mhi_device *mhi_dev);
>   */
>  void mhi_unprepare_from_transfer(struct mhi_device *mhi_dev);
>  
> -/**
> - * mhi_queue_dma - Send or receive DMA mapped buffers from client device
> - *                 over MHI channel
> - * @mhi_dev: Device associated with the channels
> - * @dir: DMA direction for the channel
> - * @mhi_buf: Buffer for holding the DMA mapped data
> - * @len: Buffer length
> - * @mflags: MHI transfer flags used for the transfer
> - */
> -int mhi_queue_dma(struct mhi_device *mhi_dev, enum dma_data_direction dir,
> -		  struct mhi_buf *mhi_buf, size_t len, enum mhi_flags mflags);
> -
>  /**
>   * mhi_queue_buf - Send or receive raw buffers from client device over MHI
>   *                 channel
> -- 
> 2.48.1
> 

-- 
மணிவண்ணன் சதாசிவம்
