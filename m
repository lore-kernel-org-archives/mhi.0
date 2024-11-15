Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E8B175D5D
	for <mhi@lists.linux.dev>; Fri, 15 Nov 2024 06:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731650860; cv=none; b=HZxkKaWweRlj6sug9sFN97R3S1I55NOML9d69mW7uDxUW41nW/fJqguL8534T8iIAbYs16UJa1kSPOGeXe8HI8Ac8lCVqkggVC8374XWw37rVWLjw3hhIjXrHi6gohtyPoL8tVKkZ6cjHrz+Y2kIKYAHVLm4JVnzsdpH1AHcgcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731650860; c=relaxed/simple;
	bh=fH3ZtRPVn3Kbkew7RanxmH7dVJaPr442hqNLjoGorZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XVQeFOL7B2Rmunx6UEH3vJj7Rb9iQrkxALIOioqRPEg6/YGGiJq3n1FzBlScK1tXC4UDPoBKwYmYWdDh89S8zjNN+gOe2iOs/6htIHsSJXQt8/POiuIpyTWPV0ijX/J6770ARgmUSyuwuGZKLsoqx8UQJLvZTHgGd/HUX/jNEiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yM287YFn; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yM287YFn"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3e5fcf464ecso821618b6e.0
        for <mhi@lists.linux.dev>; Thu, 14 Nov 2024 22:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731650857; x=1732255657; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=So54qbrgSAVoomcFHWWM9if0MekC+bKwIj6DJ1OKqGk=;
        b=yM287YFnq6abzmh5vZ6f7khihHHHAwHtwXKfLoih/6ExPGKNUP4UgTDK6Lj9u/2wP3
         NJhABZ3YjGyGrob/k7ZmNi9ybsCW2E/VINrwwwZa4ELGv2eeD+qEviXEHUJ20qaAjFyi
         J+G85MCNNop9dFWVlzGD242SrTVybRqTxxAx3YFYU9sdPAkiqmmUe+x48lgAa8TlQPdi
         c6WFgWbkaSR/2KoYC78FHHgBelm+RtWTlfyLAif0o9C15vcgjz5I8dQKe120EiEkzl47
         wIa9aOI4K0VyR31SiePZ4+2tXzTizNXiiXfYcaUK8uGjEfds/X74CT81dbCbB/CSjG0a
         2cvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731650857; x=1732255657;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=So54qbrgSAVoomcFHWWM9if0MekC+bKwIj6DJ1OKqGk=;
        b=Tvum1ji/WqzqhQrF4Vk5vt7YseV7QzdGNYO8Eh2SAgRsTAufXT48A2C1yjO1+0AnLl
         iAkrwhZFFSobJhNthLMG8ZodVYEUDzIO6oKN+JPI1M2369sSxcdWF85haGGGUXAldSKU
         0dHaV3+7QxqQswWb93TEZ1k9ErBYikUgMdWENJoHVBVn9Ibq5VayyD818dXnBDONi3Pk
         YUKi+/Ms0nIhXK+0Zydf45NM2DVVeH1fmzaGv7PqYdfe6L5VbxD7AyT3mQ7fMw6TzH2Q
         6A5ZKCQt0rF0QBDgNz3+CUV+W7wqmwog67fkhQgF2S2fJ811TpNxgiF07dMlG+2ahugk
         6nnQ==
X-Gm-Message-State: AOJu0YwDgvIVrw90fbdIP0NmSto2hQA8AYlg/HHKx2VfQczHOfNmAX3P
	LitouIlqaabYL6pO4hVFRDPKe7nE3kcSXkYvm42QzxZvUmAm/HX5kh9NE7rbvg==
X-Google-Smtp-Source: AGHT+IEY7/bxXGzU/MjOHA4C1CQe4QcOcyhYXEIsUZBCGugTGycfUNtjiaXy8AIwgP846Dmr7DaPkA==
X-Received: by 2002:a05:6808:1408:b0:3e6:206:e3d9 with SMTP id 5614622812f47-3e7bc86df53mr1794369b6e.40.1731650857276;
        Thu, 14 Nov 2024 22:07:37 -0800 (PST)
Received: from thinkpad ([117.193.208.47])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f8c1dada4bsm462310a12.56.2024.11.14.22.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 22:07:36 -0800 (PST)
Date: Fri, 15 Nov 2024 11:37:31 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Youssef Samir <quic_yabdulra@quicinc.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH] bus: mhi: host: Free mhi_buf vector inside
 mhi_alloc_bhie_table()
Message-ID: <20241115060731.345c2nx53bpluxjx@thinkpad>
References: <20241024214715.1208940-1-quic_yabdulra@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241024214715.1208940-1-quic_yabdulra@quicinc.com>

On Thu, Oct 24, 2024 at 11:47:15PM +0200, Youssef Samir wrote:
> mhi_alloc_bhie_table() starts by allocating a vector of struct mhi_buf
> then it allocates a DMA buffer for each element. If allocation fails,
> it will free the allocated DMA buffers, but it neglects freeing the
> mhi_buf vector.
> 
> Avoid memory leaks by freeing the mhi_buf vector on error.
> 
> Fixes: 3000f85b8f47 ("bus: mhi: core: Add support for basic PM operations")
> Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>

Applied to mhi-next!

- Mani

> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> ---
>  drivers/bus/mhi/host/boot.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
> index 21bf042db9be..2e9ef55a566a 100644
> --- a/drivers/bus/mhi/host/boot.c
> +++ b/drivers/bus/mhi/host/boot.c
> @@ -415,6 +415,7 @@ int mhi_alloc_bhie_table(struct mhi_controller *mhi_cntrl,
>  	for (--i, --mhi_buf; i >= 0; i--, mhi_buf--)
>  		dma_free_coherent(mhi_cntrl->cntrl_dev, mhi_buf->len,
>  				  mhi_buf->buf, mhi_buf->dma_addr);
> +	kfree(img_info->mhi_buf);
>  
>  error_alloc_mhi_buf:
>  	kfree(img_info);
> -- 
> 2.25.1
> 

-- 
மணிவண்ணன் சதாசிவம்
