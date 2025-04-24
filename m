Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68BD546B8
	for <mhi@lists.linux.dev>; Thu, 24 Apr 2025 05:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745471289; cv=none; b=L7amMSlkyHohSiw8x+Q43/3vFOSOr4BFMus4kbJ9YVAnhP+Th7peX36df6Ww9qtKxEbZk7ff44yX19BhhYLmWQBziy788dzfSltdu52lSP6ExrC0cnWf4X/vjcjbOnQtCnqOusUKs5cxN48PzKfxHF8H2mSBFLgAriYd1PpXWbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745471289; c=relaxed/simple;
	bh=F6uOsjghVkNbX3/0dSdkmIOYm376mVnitly79L1kdAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dy2YWEoi3z56uQn3004AOV53A9Tgmdk0+1vM0zPMAGgeItWsIrZrXzupqC3zmsYkyc6wWkjfM65BRnoX+tHcaxOZLsyqkZds53v3rnom12/yw7mjIF84T2Yxrsd3pmqmNLW+wH7m2yHs27WSNn1LBBmHFi8Ai7fLNIQFTDgMSP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mCtJLhAz; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mCtJLhAz"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-736c1cf75e4so451811b3a.2
        for <mhi@lists.linux.dev>; Wed, 23 Apr 2025 22:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745471287; x=1746076087; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HCRkAMDBEcZOvUbHZMZAot/OwWs2AVrCZxyXey4UAAU=;
        b=mCtJLhAzrtOgyY6eRrAaufYQIqhRyZNRYbE8lAx2rIniGOwHhxxTJy5qQY0nB9L4l8
         vFHynnXJ1L+bFxGgPRO85E4U12TX2VgkBSmDSHmgNDLutPOs5+RJ28ZnCNI14w9hgevH
         ro3SVTbfo4yjW28MQ8u+fo8F1AynhBgucKeZIG1qSEjvFqSXU37wcO+T29M1eDrM9q5P
         pwQTyexZkGuRAU88zq+BWcGmydJ64RhvGgpNfnAqrq0s0Rj81VPQn2ekv026rcvJvqtw
         LYi90SA6+surMjL9TdO3XVsAuS2s99qZECza3loBsG/1FPHnAaw2LIENVQ8O8B/v6Bwm
         0hpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745471287; x=1746076087;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HCRkAMDBEcZOvUbHZMZAot/OwWs2AVrCZxyXey4UAAU=;
        b=OU5W3p/uuoALwLlOOl2sE0a43jcYpntNv8TSLKgl8s+0fhb1IUbxgenzubazQJRHmF
         rknBlywdLXDRaDog4SU349B+nK3bDca0trmLOaXE19ZgAxKUS8H58J9OjKln5cg9xA8C
         4olmdVi4CzkTv23bYbP9Lcvnq6wqxLQvDiMpMsSyFc5PsymyZOazPZOuvdP69OSrJNfp
         z9wA9233IhgQCrdOysujNosIyHEg1wh8MUCRAv4w+7ZlTRKGKf1jchTrUq/j8FGJce5e
         861+wjVw0UDYLQk8EFViR/ctTtLNv24RCfuNX+3txWDUTejtc9xKLJ3CTSNb/xEaOurp
         fr6g==
X-Gm-Message-State: AOJu0Yzvq7EymXpKE0yvwRzZKJilJ8wSm72ajHdnXoCzMEUCOE6JRn+b
	wZpqmwpVZ4298fPj7Dd33ikDSdgA80p7Pgz28SeN7aC4TL2aJ+xIfbODx5UYEQ==
X-Gm-Gg: ASbGncvGsMWoeEdAgHChGhW8QmvEWKg86zW0f/Urcy40krInvNnQ7wL+0iIGNnTXTsj
	cuRgHpQ9/f2qx/0pxFwz1rTWpGGU3TJbz5eTLEE3JEu8TSu1TiPvVWeXeVVb0oHeQgDBNUJwspo
	BwhiDcOKJFzwMgO6d3/lSsitUwApJBnX4vmKbPzVNEBNT3H9B3jWcHGQbJlz0w/LNGP+j/1I2jF
	eNIY0/ccKRDU7EZ9xWt6mH9+HHdg9LMfRcr9tg5qf8M5KbsWpp5z3FMdWrJ10DYIrZkJYmg91ks
	cv9cv4f6HEhjq4mdTweioATTcoVF2JhFla2veqlhi7GDHPvOCdY=
X-Google-Smtp-Source: AGHT+IHKk0j4Ltd7MUfpRKyZV9i9ybMMdwfMuPy+Of0VruZIuaYQ9y0Zu4YDFK6qnZd7N1n/vaXojA==
X-Received: by 2002:a05:6a00:448a:b0:736:ab49:d56 with SMTP id d2e1a72fcca58-73e244bab2amr1856960b3a.1.1745471286543;
        Wed, 23 Apr 2025 22:08:06 -0700 (PDT)
Received: from thinkpad ([120.60.139.78])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25aca621sm486790b3a.163.2025.04.23.22.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 22:08:06 -0700 (PDT)
Date: Thu, 24 Apr 2025 10:37:59 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Subramanian Ananthanarayanan <quic_skananth@quicinc.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Remove assign resource usage
Message-ID: <pslapnhzptjtognzwaiqmlhgfrlbhk245pem6gbxbjwkk3nhx4@uux4cjcsqtst>
References: <20250416-remove_assin_resource-v1-1-e92dd361fa0a@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250416-remove_assin_resource-v1-1-e92dd361fa0a@quicinc.com>

On Wed, Apr 16, 2025 at 10:49:51AM +0530, Subramanian Ananthanarayanan wrote:
> Avoid redundant usage of pci_assign_resource for BAR allocation.
> This is already taken care by PCIe framework. Invocation of this
> API leads to unnecessary relocation of BAR space to a new memory
> address.
> 
> Signed-off-by: Subramanian Ananthanarayanan <quic_skananth@quicinc.com>

Applied to mhi-next!

- Mani

> ---
>  drivers/bus/mhi/host/pci_generic.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 03aa88795209..7501abc835c7 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -996,10 +996,6 @@ static int mhi_pci_claim(struct mhi_controller *mhi_cntrl,
>  	struct pci_dev *pdev = to_pci_dev(mhi_cntrl->cntrl_dev);
>  	int err;
>  
> -	err = pci_assign_resource(pdev, bar_num);
> -	if (err)
> -		return err;
> -
>  	err = pcim_enable_device(pdev);
>  	if (err) {
>  		dev_err(&pdev->dev, "failed to enable pci device: %d\n", err);
> 
> ---
> base-commit: 5b37f7bfff3b1582c34be8fb23968b226db71ebd
> change-id: 20250416-remove_assin_resource-aa0db88d02eb
> 
> Best regards,
> -- 
> Subramanian Ananthanarayanan <quic_skananth@quicinc.com>
> 

-- 
மணிவண்ணன் சதாசிவம்
