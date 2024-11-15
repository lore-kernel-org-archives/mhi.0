Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40864183CC1
	for <mhi@lists.linux.dev>; Fri, 15 Nov 2024 06:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731650819; cv=none; b=uGzObAoj3MVx2Zcovt6dtdZwbwFOP3bIgy4T95MMmAmqLBLLruN1EHTJqHe43Ep/sCeYVX+o3GSa/XW9YssnVgXmlCPp8Fdr0LYQhSODTGdoYIx2VarqU0pXlrZr/ihzqBhCRMdFOTboid5RzLhT32VvVzurdFI2QH72UDcJ1aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731650819; c=relaxed/simple;
	bh=sHx9FcgFBFeFm5RF/16v2qKPOEc+Ckhi1jLZrfQnz84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M2a3fYw5iKilAU6Q8LB0WfY1KyYdbMFQ7pGWndVpXwYf8j9D9NyfswbvT3F5huFqQyn/ic4swbnvQdaJZRDeTB/AfHVe1IViv6Q2IQ68cQNB55rf4MefnF26kplgRHzxkhW/noRFSN77VUmZ/2QspvHR1+fLZHGSswj82cyMAAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xeABen+T; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xeABen+T"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7205b6f51f3so992550b3a.1
        for <mhi@lists.linux.dev>; Thu, 14 Nov 2024 22:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731650817; x=1732255617; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VYRfI6/zPnp4YjFXrlyTeKAyNIK9PnE2g8C5wjcAM0s=;
        b=xeABen+TGPrbiMowazIMF16+AfTrMkDDMhC4c5UvjPsnM5aRMGlLJCOyUWCFbTq97e
         p7+6tYatuA4Y1N56M7vRuehuAP9pkrBulbvUnF7mvWrGScQWY/8O9bHbAgRGHob87JAK
         8aIyb0EPMwFoCpRcApySVe7Bp7hWmKPoDtmZS3aFSoi2yia4nlD0spMUfrFOTiw5+C2s
         EyLcgpPkFRrl67q64jEtWFjppGTivgjrE0IUq+RiONGBHspK23q5IjuA/pv09frTzwfB
         VpThDsdHDZ6Q5wr/qKDKW/VdWoti58dOFIVo1YsSK5ss1u30lGJ34PfPvDXcEzws8+FJ
         uChQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731650817; x=1732255617;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VYRfI6/zPnp4YjFXrlyTeKAyNIK9PnE2g8C5wjcAM0s=;
        b=AqdgcH9lO7ZUlFn/JVKep89D8d/9fUyadyjS106JOJOM7lHNqw1RtXV9TsojFgSMff
         lqAwjAHJ7e+z7seDz+KyHLPoJOMEkOqG2NBD0xmzlBbZvY54O42BwRQQj7GW0WNFiIvA
         Vy2Nk7l0qgSb8FMSkgYVH72Tv5k0HmfOEV/bj+6oaJkA/UVKFZtV5lDV3OwHMnP0P3s+
         wlCg7uoxZLhh1XEpzviyfwWiiYk5PVGFhJH6X9Iy1STz1POn7AfZ8hPqrwsY2ByecGPj
         9b44GPx3jGNuvE5v6gNoo83iq43kIkRaqG7A0invlCajjmQVmKQGiXo8Wa6/tWYUHLxL
         k6gQ==
X-Gm-Message-State: AOJu0YweDQ+2cJZz3R8SB7fHecFrpB7VObQ0Ng+PU4qhHSKbd5HZiTkO
	FeWIPsUonU/W9qBIplh7+o5us8LCRyRmGjfTladkPUHRoW9zD8yBcunCxez46w==
X-Google-Smtp-Source: AGHT+IG8rujYSVN3685QyH0Y1bCgHtYCiTi6hk0BHecaEZS2xSCeMCTTyXIdpJNCe1Mfx3Jljvb5bQ==
X-Received: by 2002:a05:6a00:140b:b0:714:1d96:e6bd with SMTP id d2e1a72fcca58-72476bbaa67mr2506190b3a.13.1731650817465;
        Thu, 14 Nov 2024 22:06:57 -0800 (PST)
Received: from thinkpad ([117.193.208.47])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724770ee810sm606748b3a.6.2024.11.14.22.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 22:06:56 -0800 (PST)
Date: Fri, 15 Nov 2024 11:36:51 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Youssef Samir <quic_yabdulra@quicinc.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH] bus: mhi: host: Free mhi_buf vector inside
 mhi_alloc_bhie_table()
Message-ID: <20241115060651.bhwulbfk4ewhgrav@thinkpad>
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

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

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
