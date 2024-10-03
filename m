Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A19F3AC2B
	for <mhi@lists.linux.dev>; Thu,  3 Oct 2024 05:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727932702; cv=none; b=BZNiW/TX7QgSj7G1hAbBrlpIZLMZmpfBBAkFvgBw86Qb0h17gTYpr57M+AV5nhvXrYM9/XlNIx7tWSFt971eT+vzU7e68YZa4GUMUZ+Jv0abyz9Ji64dTUTj3yoBZfnobl+VDy1cxizKKjM40hRcq8B2sIpDwxh/j5Yji90q0UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727932702; c=relaxed/simple;
	bh=p9cTNf+ce+MkFrpLZLlHEwPklnOHGHnSpCKPYrEmLd8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P0uf3bMbz5aljFlxa/QZsjqQJpFhxZBCDHMYondTbZGJiizdz+zRHBpft/biiWKPjVYwQqCcT9Q3TnU7CBTtf5E+TOYK5V6I1iqVXH8fIyBQuw1NmxdJ61F+J87HGQ8FhOOp1pjZm5Ivj0jqHuEg9WRE1ANkcY4VbIP+U2XIkQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hc2kYxDT; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hc2kYxDT"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-71dd2b6cbe6so488619b3a.1
        for <mhi@lists.linux.dev>; Wed, 02 Oct 2024 22:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727932700; x=1728537500; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=La8UkmMy64RUqJRJKCrBaEEk9eBf956ZjgLNFqjYKFk=;
        b=hc2kYxDTMLEaqOzxC5Yo1NeEsnIScl6/6p6UpoC6Ejp//h0EBRC6I8gzI8flzf7hMZ
         qEuuy5aQh6TQTlOdCKTUkdmjijk4Ry2zveGgHaFzeGcLN7ce0G9XVnZc4IcRlgwyWKYV
         cbjFdo7Je73dDj9whBFaJjXGro+Y+9eNcMzB3WkzJnrdMyViHa19oildC4q8e70DF5I2
         aRSpTC/bpVqjY9CCMrShHJfOgmqJGp+L2lpAw8YAGEQNUYIzuv9srbYFMtsOPMWVfOve
         OjOmqsdTq9SOcZvtDdqtw0Q4p9g04NQeRPHAsLk4lDrx2VEkUab9h9C00f+1mlq45jXP
         QZvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727932700; x=1728537500;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=La8UkmMy64RUqJRJKCrBaEEk9eBf956ZjgLNFqjYKFk=;
        b=qHM4wYcFKxwLW4Xg8CYAV7g47wyDXnjsScu/r6igJAMowEzsd3h5QwQ6JuGHd+yG43
         vhReutCMnTgopH8Vi+S99QDaR2K51lRv1BpRAIISzzuuWL9/++J5RmM5nMyUqyROjbHy
         1ZGbRcnghZgRMNz4yJzecpUcDNMdWfGXcRMf52dwXZSgntkDrFN5lAzDCoeUCbwvwSnD
         oy0TqfMOxe32OJQyJvbuQTyC+kvF+yH0D6AQDsTdGqs2QCa7dlhuJN2tEPObOCbE7OsU
         D1kkFfRSQSJxi3WO4wSY3btrBPu3ccvQhIiQw51YK+Fg1No4txp6VR4GnjFjog2fcjzD
         QUCg==
X-Gm-Message-State: AOJu0YznORC98oIsxsa5oSPewlinGw/f3QYhyO9TQpU2XEjTQV4UaUgt
	5GyRc8ExQGvFVryq8s5WBNC44jPfxa1yrFXOgFQD+Z3jAmlh0q5aR2B85zKiMg==
X-Google-Smtp-Source: AGHT+IFZIWorr/HQ8QCSrVUvOBlny0PGSXcekwxov0MUHcurUi3xP8jMoZMLLkGa/k/YVOcbFt4CIA==
X-Received: by 2002:a05:6a00:181c:b0:70d:2892:402b with SMTP id d2e1a72fcca58-71dc5c66d09mr9998786b3a.7.1727932699794;
        Wed, 02 Oct 2024 22:18:19 -0700 (PDT)
Received: from thinkpad ([36.255.17.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71dd9d8c2b9sm444447b3a.79.2024.10.02.22.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 22:18:19 -0700 (PDT)
Date: Thu, 3 Oct 2024 10:48:16 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Yan Zhen <yanzhen@vivo.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, opensource.kernel@vivo.com
Subject: Re: [PATCH v1] bus: mhi: host: Fix typos in the comments
Message-ID: <20241003051816.lnx6qo5fm43ljygt@thinkpad>
References: <20240929090334.524543-1-yanzhen@vivo.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240929090334.524543-1-yanzhen@vivo.com>

On Sun, Sep 29, 2024 at 05:03:34PM +0800, Yan Zhen wrote:
> Correctly spelled comments make it easier for the reader to understand
> the code.
> 
> Fix typos:
> 'Normaly' ==> 'Normally',
> 'gurantee' ==> 'guarantee',
> 'guranteed' ==> 'guaranteed'.
> 
> Signed-off-by: Yan Zhen <yanzhen@vivo.com>

Applied to mhi-next!

- Mani

> ---
>  drivers/bus/mhi/host/boot.c     | 4 ++--
>  drivers/bus/mhi/host/internal.h | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
> index dedd29ca8db3..e8c92972f9df 100644
> --- a/drivers/bus/mhi/host/boot.c
> +++ b/drivers/bus/mhi/host/boot.c
> @@ -82,9 +82,9 @@ static int __mhi_download_rddm_in_panic(struct mhi_controller *mhi_cntrl)
>  	 * other cores to shutdown while we're collecting RDDM buffer. After
>  	 * returning from this function, we expect the device to reset.
>  	 *
> -	 * Normaly, we read/write pm_state only after grabbing the
> +	 * Normally, we read/write pm_state only after grabbing the
>  	 * pm_lock, since we're in a panic, skipping it. Also there is no
> -	 * gurantee that this state change would take effect since
> +	 * guarantee that this state change would take effect since
>  	 * we're setting it w/o grabbing pm_lock
>  	 */
>  	mhi_cntrl->pm_state = MHI_PM_LD_ERR_FATAL_DETECT;
> diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
> index d057e877932e..3134f111be35 100644
> --- a/drivers/bus/mhi/host/internal.h
> +++ b/drivers/bus/mhi/host/internal.h
> @@ -255,7 +255,7 @@ struct mhi_chan {
>  	/*
>  	 * Important: When consuming, increment tre_ring first and when
>  	 * releasing, decrement buf_ring first. If tre_ring has space, buf_ring
> -	 * is guranteed to have space so we do not need to check both rings.
> +	 * is guaranteed to have space so we do not need to check both rings.
>  	 */
>  	struct mhi_ring buf_ring;
>  	struct mhi_ring tre_ring;
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்
