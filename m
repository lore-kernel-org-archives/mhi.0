Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236E61FA249
	for <mhi@lists.linux.dev>; Mon,  2 Dec 2024 09:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733133119; cv=none; b=sKRVwJiNK9ePTI9eEYWflOSnuSwx5uRjN3SNqOqHBqLUJrzlDlwGc0fLuuS6IG4sl/mBBlbA3yqPb22paYNyo8ObqLxioi9WYndnKmZ27QtveZYdZj7bBnbUp3kWpLqycMRsC0iTxGcFlSAFWMMPmmK/kTZIYfGZdavCJls3X9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733133119; c=relaxed/simple;
	bh=rrHT5ISu4ntl7jHH5qk6ptP2W7I5hEkSFLbxbRC4wt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X+J7qxRKuJl5RUYPjDxuipWKeNSG1TAwVZPv+p4rEgWLlykFH3xaKl2bQHqOT3CQQYX1zuO+egBXJC++rzrutr0lCCLVfZvLoS4Q1vblqG8Ahuee+rt5C0fpU5YwkGIz7GG4GG5fQY6WMqa9DKSBmllSlwzSVE5QM6qPfZTg+dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CCa5qwps; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CCa5qwps"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7fc41dab8e3so2501894a12.3
        for <mhi@lists.linux.dev>; Mon, 02 Dec 2024 01:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733133117; x=1733737917; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=us2DAUmz8SSO9Fkdpm3cqKbhkQy4ljHHURt29NsDe3M=;
        b=CCa5qwpsAbUqk0ZR0NqsHg4GZcyt/vZNYxSTAVspqVDgCA6khMf3PTTBC7H58Cn3U4
         Ae69diEa+TNlUzzGeaQVQm5AOc6rlELvjUCWbWZuraPtiKstFBv1eXvxqeZgcxeA8wue
         SiCXokISgm/0E9p3llqHwOE5GrcUpN+CmJJIdUGsLz/22muSKOvzs9hYpwmuXYdZMFnK
         tMf7CUeYmN5pWWgP/lhaXSGZ0wnX5lTq9kXGVXoxsddVjBT45MBPE3YFsS4BXNZfTKXN
         YTDg0bbYkiRV0g5DRM9Dgi0ZVyWy4ZtwAXHYPLf1g6QFAjpTdFlKNfSk9Q2gJy2078Gm
         lZ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733133117; x=1733737917;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=us2DAUmz8SSO9Fkdpm3cqKbhkQy4ljHHURt29NsDe3M=;
        b=VSHOM9wwXhb4hvTGmcEPlNy2TZ3Z4UpqhTFVbWKMjIQFD1RFwNPQOOoh3SlxL2nsiy
         KK9V17Sk+xZXDxJQzCWeN8/oRUbDHPChA0fTPABTyg4eoMG4TPL8U0vdXe2swDrDi7dQ
         ViLCPFlrfpQp1F21RC6mVvR5Yy7d6ofD/YMa6t4cEc7kyUWKOuIjU/UMBRxJzxAetBqF
         pTiSoV8C7/hxNgjbqRayNTGD+T/C3lumN/q0mzYzx/iGyTiCV6A2tAWa9VUiEmuxFkJJ
         76JzyEng0JETCWR6gm0lsqjBrSY3t/5BvFj8DsOsnG0+T6Hsx2NSnQ5CdfrSmr46Sgja
         KAhQ==
X-Gm-Message-State: AOJu0YxdpET9SRTnTmhUBddX/HZQPepKfX0qUjdZOSJDe4p1FsQ5vpH+
	aXU1NNVWcC2gjh1+INirVr3LZU8FN+X/82jfb/p7WZwr4Nd4MOQ+qmG6GmOYBg==
X-Gm-Gg: ASbGncuSAgGPll/+gKerMOEpFbeO5kptyyZeICBNwfY9o7jhxTVY0RYBAJxcgHmJVx9
	MjaMSs+BFYIgUzlZ6pF1ooeVs6SunCtOjuUU5TpvpyO86HrSjiLM27FC1zMwKOesWO5gBY2JuHl
	wuA1h4nnqOH98w3EyJxzuz0J+LKM1Cr/F1pgeon6L5Tk/RQ3JMNW8zfzcWlg8kIZLSn+MXGDhJB
	ytIK8Z2PoI4WyMhOrV9ewcqfUHPKN9rUaS6sVCRlPNg2dInf9qPnCJLv+ipTg==
X-Google-Smtp-Source: AGHT+IHG5Cu0Pp0i4nhGKaYi5qQQMFoWyzPs6PVgf5vKt8vckryTy7wgHXKr6o20H/OIRqQE8YLxDQ==
X-Received: by 2002:a05:6a21:2d87:b0:1e0:c954:ea7c with SMTP id adf61e73a8af0-1e0e0b16a5emr32819128637.27.1733133117491;
        Mon, 02 Dec 2024 01:51:57 -0800 (PST)
Received: from thinkpad ([120.60.140.110])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72541848259sm8044152b3a.174.2024.12.02.01.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 01:51:57 -0800 (PST)
Date: Mon, 2 Dec 2024 15:21:52 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Mayank Rana <quic_mrana@quicinc.com>
Subject: Re: [PATCH] bus: mhi: host: pci_generic: fix MHI BAR mapping
Message-ID: <20241202095152.ghhi2opa6nfhjvbm@thinkpad>
References: <20241201171120.31616-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241201171120.31616-1-johan+linaro@kernel.org>

On Sun, Dec 01, 2024 at 06:11:20PM +0100, Johan Hovold wrote:
> A recent change converting the MHI pci_generic driver to use
> pcim_iomap_region() failed to update the BAR parameter which is an index
> rather than a mask.
> 
> This specifically broke the modem on machines like the Lenovo ThinkPad
> X13s and x1e80100 CRD:
> 
> 	mhi-pci-generic 0004:01:00.0: failed to map pci region: -22
> 	mhi-pci-generic 0004:01:00.0: probe with driver mhi-pci-generic failed with error -22
> 
> Fixes: bd23e836423e ("bus: mhi: host: pci_generic: Use pcim_iomap_region() to request and map MHI BAR")
> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Cc: Mayank Rana <quic_mrana@quicinc.com>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Applied to mhi-fixes!

- Mani

> ---
> 
> The offending patch was marked as "Compile tested only", but that just
> makes you wonder *why* the patch was never tested...
> 
> 	https://lore.kernel.org/all/20241004023351.6946-1-manivannan.sadhasivam@linaro.org/
> 
> Johan
> 
> 
> #regzbot introduced: bd23e836423e
> 
> 
>  drivers/bus/mhi/host/pci_generic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 07645ce2119a..56ba4192c89c 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -917,7 +917,7 @@ static int mhi_pci_claim(struct mhi_controller *mhi_cntrl,
>  		return err;
>  	}
>  
> -	mhi_cntrl->regs = pcim_iomap_region(pdev, 1 << bar_num, pci_name(pdev));
> +	mhi_cntrl->regs = pcim_iomap_region(pdev, bar_num, pci_name(pdev));
>  	if (IS_ERR(mhi_cntrl->regs)) {
>  		err = PTR_ERR(mhi_cntrl->regs);
>  		dev_err(&pdev->dev, "failed to map pci region: %d\n", err);
> -- 
> 2.45.2
> 

-- 
மணிவண்ணன் சதாசிவம்
