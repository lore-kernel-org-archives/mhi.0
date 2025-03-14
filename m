Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B59A1E86E
	for <mhi@lists.linux.dev>; Fri, 14 Mar 2025 05:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741931278; cv=none; b=or1Hh5Ty6FbQjgTXtCfiSNlbXLMQbjcaN1vWPf13Edw6sRVtiIPi+lfdAkw5wKu8fR7YGeEJB4YbYQBZKaKYSo+R0/jnJ8mWoiz7PsqV0n8UiaSI47TSdbncF1JwWqCErnLPivxK9FmyUUttzMKj32jnejgHZSm2YDQMQfrpATo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741931278; c=relaxed/simple;
	bh=u8lYD5H9d5isZnVAaM3Qu3eN2TFbwn4AGXdXIiugNhM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o07YZeT6T5IRh/NaweISD8f/B/HxnUnJRZHLYRkeXVjxoz8uBf9wSK1eHeY9rjW2UvC8tSau5L8rf1Y7dPuwNP57oJPWR2WpmCjBaKk1B0M83x2NDzOdXxYWRUGtTsicDen9I6Oj48vqSCq+hVB/KuIf+ILqU2pyUWZtDq/UG0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LMsIjCca; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LMsIjCca"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-225a28a511eso31712665ad.1
        for <mhi@lists.linux.dev>; Thu, 13 Mar 2025 22:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741931276; x=1742536076; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+KKkjYdOavJCVAUTBcZd3373rylcFMljAJYfk7ew03Y=;
        b=LMsIjCcaLwviibDFx9XFM72a9xrks8XtzsOWXBnMNlPt8e11juQEGXkiIEi16YyMfA
         PIFgYwgMgbZO9v9UYwuvLYJUYQua5ub41OdHNnbmUZPGa+HMuI32Ij+v8ybS28Mghi6T
         NY9ncM8FOSNPyOQAP5+RT0lUe/yEDpbBmfU+JvwoD4VMI62KuyB6DQ/j7FrIfX9bmcKN
         +P0q4a63i4Vv0TE+8vwcRMAiD4MrV+4m1SBmto/4PTjnO71gz6Lx6vOESOpNIlMmf8gX
         QdRfrEoY9A05ySnNDOqnBghb8ywJafA928qXsbn+rdopsi8igC6ad7VKjJIJYJQLAOsj
         P76w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741931276; x=1742536076;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+KKkjYdOavJCVAUTBcZd3373rylcFMljAJYfk7ew03Y=;
        b=NIh3qs356UfP4FGu9IdQqSBfpBN2OCTBamtj8CY6iaCvXQae0uyEYQyR/d/J1Sm7tT
         rtPiQsLSu6KjN0mJuZ9INwLlF834knvPWbJkrDNFAWWcKEa4tlayEL63aWY7ajArto31
         hZjDVdrnaTDIkSnXnhLImq9ZY85Fj17wYSLVVIIBtIn2QaYWanWfpISaXnUri+UxaPDJ
         yIEeeqU6o9YRtI9iUPeCQP/wEN8fwa143n6FGPcq0E5/ftB5eH6ZmmQo1vc8r/64+2de
         2eXG7DM7vmsbmtpweFLs6XVhik3ayaxzOkb6lup3TyU0ibJC2qqmImF7f+aa1KXGQxru
         dl6A==
X-Forwarded-Encrypted: i=1; AJvYcCXoRGOFaZ2ZbotRu7uV3ejvoBLh+O3I2iXifo3agCFgdHUf7mdqdgrrW9bXWSrK91P7q5Q=@lists.linux.dev
X-Gm-Message-State: AOJu0YygzQ7nI+Ho5zsncixCN0RU6/TasC3cK77Q9XMzmJMq1c4mQ+ch
	pWydOpSD5vVNxlA8h+KsOFjGYkurjrZBMimnR9o8TVvP5AkQkd8hWEspmEjzEA==
X-Gm-Gg: ASbGncul2kULOACo36rLfnv/uJ+hG42m5JV+XtazldaeC/n327aXCV0D5/0+AlI8JvA
	vQKc2SYKqi3j4H7G0zBeT1W6U+8WvsM8hF7a6YV1qHDG+lf84ZndVE6EQdGdlA7zxinyYdFQUJ8
	Qy3LqXNcqDBg1pYdeTsSnwlWwIDliAORiyQIuvR4+galAH/Xd41POuT27QSWmUNLzAWOITbw/L9
	lbJqE1S+Obb3I58aYu0GfEGp4N49iDqTDDuddxkGkacyE+5+A73XpHkosHIvkUCVLVpiYvtVmoI
	pqgDA8L1ycB2bIcNh8W3W08Rexi2xxs8QwF5OvN6+2xqSm4Uy+7Ii77+
X-Google-Smtp-Source: AGHT+IECCfLOu1My34R7fTuExIaDoalHOxnqqRfKPP6N6jUSZ/988WfVgHpEOHN0Und+te0PXpgdLQ==
X-Received: by 2002:a17:902:da90:b0:21f:2ded:76ea with SMTP id d9443c01a7336-225e0afa014mr15076495ad.36.1741931276314;
        Thu, 13 Mar 2025 22:47:56 -0700 (PDT)
Received: from thinkpad ([120.56.195.144])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68a448fsm22801795ad.72.2025.03.13.22.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 22:47:55 -0700 (PDT)
Date: Fri, 14 Mar 2025 11:17:51 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: quic_carlv@quicinc.com, quic_thanson@quicinc.com, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH] bus: mhi: host: Fix race between unprepare and queue_buf
Message-ID: <20250314054751.mgooeiput4yhsfm5@thinkpad>
References: <20250306172913.856982-1-jeff.hugo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250306172913.856982-1-jeff.hugo@oss.qualcomm.com>

On Thu, Mar 06, 2025 at 10:29:13AM -0700, Jeff Hugo wrote:
> From: Jeffrey Hugo <quic_jhugo@quicinc.com>
> 
> A client driver may use mhi_unprepare_from_transfer() to quiesce
> incoming data during the client driver's tear down. The client driver
> might also be processing data at the same time, resulting in a call to
> mhi_queue_buf() which will invoke mhi_gen_tre(). If mhi_gen_tre() runs
> after mhi_unprepare_from_transfer() has torn down the channel, a panic
> will occur due to an invalid dereference leading to a page fault.
> 
> This occurs because mhi_gen_tre() does not verify the channel state
> after locking it. Fix this by having mhi_gen_tre() confirm the channel
> state is valid, or return error to avoid accessing deinitialized data.
> 
> Fixes: b89b6a863dd5 ("bus: mhi: host: Add spinlock to protect WP access when queueing TREs")
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

Applied to mhi-next!

- Mani

> ---
>  drivers/bus/mhi/host/main.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
> index 4de75674f193..aa8a0ef697c7 100644
> --- a/drivers/bus/mhi/host/main.c
> +++ b/drivers/bus/mhi/host/main.c
> @@ -1207,11 +1207,16 @@ int mhi_gen_tre(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
>  	struct mhi_ring_element *mhi_tre;
>  	struct mhi_buf_info *buf_info;
>  	int eot, eob, chain, bei;
> -	int ret;
> +	int ret = 0;
>  
>  	/* Protect accesses for reading and incrementing WP */
>  	write_lock_bh(&mhi_chan->lock);
>  
> +	if (mhi_chan->ch_state != MHI_CH_STATE_ENABLED) {
> +		ret = -ENODEV;
> +		goto out;
> +	}
> +
>  	buf_ring = &mhi_chan->buf_ring;
>  	tre_ring = &mhi_chan->tre_ring;
>  
> @@ -1229,10 +1234,8 @@ int mhi_gen_tre(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
>  
>  	if (!info->pre_mapped) {
>  		ret = mhi_cntrl->map_single(mhi_cntrl, buf_info);
> -		if (ret) {
> -			write_unlock_bh(&mhi_chan->lock);
> -			return ret;
> -		}
> +		if (ret)
> +			goto out;
>  	}
>  
>  	eob = !!(flags & MHI_EOB);
> @@ -1250,9 +1253,10 @@ int mhi_gen_tre(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
>  	mhi_add_ring_element(mhi_cntrl, tre_ring);
>  	mhi_add_ring_element(mhi_cntrl, buf_ring);
>  
> +out:
>  	write_unlock_bh(&mhi_chan->lock);
>  
> -	return 0;
> +	return ret;
>  }
>  
>  int mhi_queue_buf(struct mhi_device *mhi_dev, enum dma_data_direction dir,
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்
