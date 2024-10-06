Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7A5189BA9
	for <mhi@lists.linux.dev>; Sun,  6 Oct 2024 18:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728238428; cv=none; b=hFYbKh1l2B20n/SD40Wyu8PxVTrSQ8V4rdVXqLx/iYkeJXb3lUHlM3QMkBnuxEPMMe8fVNjf4Jkxh6YVW561ZVx37STFo3fn2cNAY2IAq8VM8a7R5HAeBV/Lr9R04d0oGwNGDQRTrYfoR1dPY3PIQSG0MmgnmIaEFij1+AaZ/Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728238428; c=relaxed/simple;
	bh=Ua9EPz2F0ax/VTNXjs0OZ+SzQLhTYERlSHK26OI8qU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qQJXupDO99KI7tDbgRm1Dp8KXc0d57OoD2T5fqM/uo/pTbME9cx7aHyvbz/j2vbJQTLlQ8YpAcOuQF5oLMbPLpfSSeGfItgJKywIA8M9SO9UPq/eXR5cgVfRD2BMNzhdpmgj9zUqxHrN171UhjkZUsdZmf63Xbr1JvlNAdI0DYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MLhb3zmi; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MLhb3zmi"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-20b0b5cdb57so34683205ad.1
        for <mhi@lists.linux.dev>; Sun, 06 Oct 2024 11:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728238426; x=1728843226; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2/0dUjW4cyzgF6yaoe7/JlUubqxNdOah7f3VO0ZqngU=;
        b=MLhb3zmiBI8xAgW60AFvxDlb8LiBfCxiIIxH38ZiLgx3Dik39c1QvBzL9m0LoAA4pH
         iJ6j+SXkv9t6/3w8wLgsn2xQoG5HBeY0mXIhNk4YHn4Wx0/JwPR9rQ1Ftzgl+hIhLgGd
         S9FYRaBsNd/vb7g8J4oKdmZ7Si4FvGVHRBYdGSjzJwyAR9tUCNokoMIlsIxyDynlhoD/
         PQQ9SmGy84KuUkOUAE2Tcu8PNXe3omBckaBGA131lbliOTjLHxiMMdCsvHljR6SpG2nN
         giaf0UUJnzLXHJJPJgCN+u02apbTmZovqH0+tYwiWwscLLFAoLmYws3wssW69Ozsd2PK
         L0og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728238426; x=1728843226;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2/0dUjW4cyzgF6yaoe7/JlUubqxNdOah7f3VO0ZqngU=;
        b=moMOR1NUwRZh/zsRrvVk1kun0BKZpx8WYToT5MnM6+iosdss2br3vru3K/BJq3GDw7
         sR/ZeT22bp11pY6Z8XvgmCOzisHIDj+9zy+VzNzrxWCSeq27YaegWeQYIghhbjzpahIg
         T2tqCgl7yz5Ort2Kzw05sKYZOCnZB4d4uf2smkyVhFIKLSEwNwy/aJU6R5cgA7PjYdAE
         qUxmgj4e7QcbauSTyeSoQD+mBRsZV4J0c+YQvNRAukTEQ7GOB36eLW6hSXwquVuxkT/k
         QPlWdD4aBqm3ySLYQXl2j5K26yBeIN7Vfojq2YR+AY9jjWKHkte1av+Dm+vAC8Fxnrf8
         J7ow==
X-Gm-Message-State: AOJu0Yy3UoFvUzUjeFZkkvTezYO1wO8KGPYLgU/xIzuOENwNOpm7HaGG
	oPt6G2jx2TfwAGDZl65IpVQh3p+MyOynISHiDQcsPfVt0RzpakfVIIQ7aIgac4v6d16d1M6spys
	=
X-Google-Smtp-Source: AGHT+IGR+azJ48oun8zo9Wf54stSUamrDzyOck3wVNecSl83OrIq+R2fL++Y4u9uqPUWdAaT8lZzWQ==
X-Received: by 2002:a17:90b:4a46:b0:2da:8edf:ddc with SMTP id 98e67ed59e1d1-2e1e5dbc080mr13800947a91.19.1728238426412;
        Sun, 06 Oct 2024 11:13:46 -0700 (PDT)
Received: from thinkpad ([220.158.156.57])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e20b0fb8c1sm3673804a91.43.2024.10.06.11.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 11:13:45 -0700 (PDT)
Date: Sun, 6 Oct 2024 23:43:43 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: mhi@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Loic Poulain <loic.poulain@linaro.org>
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Use pcim_iomap_region() to
 request and map MHI BAR
Message-ID: <20241006181343.bng5gkwvmofefomv@thinkpad>
References: <20241004023351.6946-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241004023351.6946-1-manivannan.sadhasivam@linaro.org>

On Fri, Oct 04, 2024 at 08:03:51AM +0530, Manivannan Sadhasivam wrote:
> Use of both pcim_iomap_regions() and pcim_iomap_table() APIs are
> deprecated. Hence, switch to pcim_iomap_region() API which handles both the
> request and map of the MHI BAR region.
> 
> Cc: Loic Poulain <loic.poulain@linaro.org>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Applied to mhi-next!

- Mani

> ---
> 
> Compile tested only.
> 
>  drivers/bus/mhi/host/pci_generic.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 9938bb034c1c..07645ce2119a 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -917,12 +917,12 @@ static int mhi_pci_claim(struct mhi_controller *mhi_cntrl,
>  		return err;
>  	}
>  
> -	err = pcim_iomap_regions(pdev, 1 << bar_num, pci_name(pdev));
> -	if (err) {
> +	mhi_cntrl->regs = pcim_iomap_region(pdev, 1 << bar_num, pci_name(pdev));
> +	if (IS_ERR(mhi_cntrl->regs)) {
> +		err = PTR_ERR(mhi_cntrl->regs);
>  		dev_err(&pdev->dev, "failed to map pci region: %d\n", err);
>  		return err;
>  	}
> -	mhi_cntrl->regs = pcim_iomap_table(pdev)[bar_num];
>  	mhi_cntrl->reg_len = pci_resource_len(pdev, bar_num);
>  
>  	err = dma_set_mask_and_coherent(&pdev->dev, dma_mask);
> -- 
> 2.25.1
> 

-- 
மணிவண்ணன் சதாசிவம்
