Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB762E339D
	for <mhi@lists.linux.dev>; Fri, 14 Mar 2025 05:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741930161; cv=none; b=LxMZ7eMc3xsk4xzEETpC4CKdCeIyYpQI1PQiQdtB8vW3mX4WywDMbhEQe8HWDjYxkdAExcklxHx0jbp/TsthoxokMZubOWT0zVbRaCbBvvAJ3UQcRRM68PruwB5Vyd8z5nAkj+raKkv6/dqq87LGeYrYQvgq1Tj7rR0q2p/xZqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741930161; c=relaxed/simple;
	bh=lvjF/vf/1FBTD6ODcwiNR8r2K6BYFh4q0H9Wc+Rrg+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N3M7P+gO34z3Rcw/XUn2YAE1GyqYAkthX5A5qFyzPyM8iY3E88NK6JDvJKvM7Jlm4Y+JaxjXej7aUReq5/+w/3B1fFFVTbP9uPFAZ8IxAbc2/DXek8wj2OrLHYdA9EF8a3kPRc28uNEg6gNJwMizrQaQJdra10D/0o9xlp2dxLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nxn3+fZo; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nxn3+fZo"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-224341bbc1dso35282915ad.3
        for <mhi@lists.linux.dev>; Thu, 13 Mar 2025 22:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741930159; x=1742534959; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wudfzgqNI4CJt3CbrvIHvc2N1xk0CBifbAoX/xv8R04=;
        b=Nxn3+fZoQ2MfwxiuifX1p9n9RTYRv8rZNR4xJsqsahynyPUWGcRR5QCEXECVCbiuc4
         usseH1wWgQKUX4gXtfZTqwby8d6ukAyOZd17FeaVi2ky5kpRmIZeqAgFadkKG+nVXJz4
         9qRX+Y/mFX+yFB9eoZ4d8RlDrrSNXNer/YqZWqEQblReaPPkDnt2jUqjtr5KUQEjzf93
         Ba4gvPSIEPY3f5sFh7rajrnA+V4rwOckjm8ljGvUKkZIz7ZV3iatMsecB0oGr4rsUjdr
         BW6We8DhWYNNJOlr1VWhqOSZ0zzGpzLAYpSCfLVqcwYrZWwUn/1otltpRVQJ71O8TDMJ
         5BuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741930159; x=1742534959;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wudfzgqNI4CJt3CbrvIHvc2N1xk0CBifbAoX/xv8R04=;
        b=aOxe4u1ZGBPjMY8yZ3mzI0xF8qEDl0+y8aecsC7HeRWTTbH73l8p2F1gPuevxtaCb2
         KxKQYIUCNuEHN80aw+Mxu7Ykhc0RYqaOwzfM9VoZ/Vs9uF/322tktq35BwMei6iJLc6U
         Sa7zOwpBxb0dapQGMTQOo35F4jJXEO3j7YBiRIN5dZHlawl30EByRPSNEenQpzfz3e76
         r8jB+X6G+kqFPCAubRN/OmjRwFMFvBoZMdts6YOVRYpqiJDs+7SA4s26diBkqUeKRZ4N
         AH1c2FMN2sXW5cbXTkri4bk8Y3RYfKczPTRM6AApzcPkPAHqKWsz4E0uJrQKHrKTAdmJ
         zbKA==
X-Forwarded-Encrypted: i=1; AJvYcCXNbLoiuM2GtkSQ/fDO+BxRZYdQr6BUUFlhg62edwpczuutEyg/pKOBE8LPVD0Gj/CC/4k=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0pa0Wuz5urnrD9sccWw/lh4XWXm1Mt+HUz6lnyRdD3MPsc+cw
	Nw0CCmvKSXf0IzrA7qWsiYY1Ti+XXLdzdiOjWSk+XyxuE+7PlLnyeQkSP0UoUA==
X-Gm-Gg: ASbGncsRi9pft6rLXZgSiD77MEMUsWBEUPwNWVhmMNWc/rTuX7bgFzLKVOm1e0AhDOX
	bXDmng/5vVRMpqeefYNc6Obq6EYmHp4DYj7XABVHDiIq2znmVC529T1CC/8YKXGMlNrrQfFaQyX
	a5hgsMbf/olswwkZAknxKueLJjOLqVsD/t8MO33/6gtKvMDJzoiy16p0LOCgOHVAIqN7zZPWzCE
	qmhC61S7v6Qd5E6PzRlLRVTrGRWxYV8fv2Q7vaFYNPuSOg+hDO+Hi9hm82iWkrWokXjBMhfXJMA
	d/k0YZzkgVuOP458FRMHB/zpMtQAZJXrb6pFvtM5YNqGIwlmf5R42Uvm
X-Google-Smtp-Source: AGHT+IF2bF7u4qDFET7S0Tsn8pwPaHXxvjGNkAhrRsneRWS2Axy2BzcWWUnNDpSPcUtooKe5diBoig==
X-Received: by 2002:a17:903:22c1:b0:224:2524:3047 with SMTP id d9443c01a7336-225e0a6b2damr19184565ad.26.1741930159071;
        Thu, 13 Mar 2025 22:29:19 -0700 (PDT)
Received: from thinkpad ([120.56.195.144])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6ba70d2sm22561515ad.136.2025.03.13.22.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 22:29:18 -0700 (PDT)
Date: Fri, 14 Mar 2025 10:59:14 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: quic_carlv@quicinc.com, quic_thanson@quicinc.com, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH] bus: mhi: host: Fix race between unprepare and queue_buf
Message-ID: <20250314052914.azbfimrtaes24n2n@thinkpad>
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

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

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
