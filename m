Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C360135A63
	for <mhi@lists.linux.dev>; Mon,  6 Jan 2025 14:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736175125; cv=none; b=sANMu2Z6G8oJf+AzLRp5+tojVwRtP5AH1gyEQ2QaHIArmnzq7+//iPkQizR0tRfQHgp2S8RT57L0BrWe06Lli8/4LEwuN+V0m443rYdJkjyp15bR57wd0IDyBRYVUnek5TwHgwPZgvTRL2+JcP1kgQFuXqEwq3aUx5XNT/LyGqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736175125; c=relaxed/simple;
	bh=P2Yoy2vCOV6x77FyFR28353Mr6QAvH/ioPjEKxMfKSg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i/harjZej7qvyU2jl0gLuU6V8EvDmuFWT7sSDZnDf9BZq6SLwoiJj9gB9wrlLpR3XZWLr4631k3V+MsJfQRm0CgOU+95KJmtwv6iUFeSdFBb0fSRSgINULcrlMQtW0IPrVe1MGM2J+2xYXtDkAGpPgIqPX9Z+hwP0CHw8Dowg68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Pd5JHMTB; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Pd5JHMTB"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21628b3fe7dso202175835ad.3
        for <mhi@lists.linux.dev>; Mon, 06 Jan 2025 06:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736175123; x=1736779923; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RPzQv9JmUmJLzMLrGpE7zH6s1/r5xLoODlrZlCZTRjc=;
        b=Pd5JHMTBjAqGlT8rVChbAVjcBMg8lGPHdfYXIilhxoHoSxUY/EI24pB/FPiN4lIhcW
         pL6w+MRJoIi09MzOZbtOBbpO4JijWmEjP/K/Ctcs5kKWJ54BIX6ZmJQySYtiAc0TAR62
         WSLgqWU2pILycL3BIG5/qhzbvBMU49GZMfbbZkSrYniiUyX9xTdGiApO1cSu8qjf3js2
         XtJe8uZcpddF/sdxdjywfLINFemigUTOwE5iuBtndxhDE7wNjp0yB7/+9iVpMsgwAf1n
         AHzj0gp3zOhGXWEPmpMcQ8vdkQ1nkhKbW9ohrHCn+7ho0RPX9VaZXgMShCRBCF8C9yMU
         ZP2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736175123; x=1736779923;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RPzQv9JmUmJLzMLrGpE7zH6s1/r5xLoODlrZlCZTRjc=;
        b=fDFTBWPxwimg9/8oCXJM3uPvnkQxOH2QjAFUEPAsDetZBqixgsqGmKQA5y+Olek0HN
         VYDQ/wAr4xxQPBzIQJ8VPY2zwRJtgSt69U9Br5jQr5Fj5Vh+9JUHdqj/OOMw/qOajPmz
         WovI4cKIfi21xpbv27QfsquGg6XgYYI7YaQbQ0Yek1r9NED6Me0n2pL32AjkjL46Ismq
         fQkFIhidC1UYtqTc9JO1W7yytgoBlNLjpVuZBmV5HdQpSRYLwOtJRucLFz0Kcm/lO98s
         E8XHSXf0VzBnyn59TC/4TysEJr+kaaRQ1L+m1NTL2VAp1KnL4g/XZSI5jVWe0DFEhyjf
         QBOA==
X-Gm-Message-State: AOJu0Yy49HgYgs4h1OEVZr/PGhs+WYQ9AJqYuNeTytEF+75thnLyN3Mz
	HmEWNJZVz44KupfAELpJMLynFB4qE+Hc6yT+RiT6f6fnTFlRFmM0tIlqnEwPxg==
X-Gm-Gg: ASbGnctinR8TeCE476ltGXfw+pUDzrVP+HeiibY1mzqGVllpZRqICeCD2tqjH3tldmn
	78l1KzHtoMH01AaPklr7HKHlaiSCZRGQ2tr3SdjTM8puRyAxyxwN8dvxpBdKHP50q5dt0zD9b8P
	KPJfeOaMuACZLL2yyEoDqe4lGub0NisWUl4dDUq28bOx82VhqRcR0XIw8DH1eiU+8KtmX0MfQ94
	1wUHevLJmd+xwfWNE9mDhXLKE4sawuUZESvPrSsRyFaSimF3cgVL76j5Aevp7cNQZ0=
X-Google-Smtp-Source: AGHT+IE4mpVT+GjLv3+7pfnCFcTYcja+19fvRAPtd/vCZh5myuA6s94pcYZbmYqV21GyNYKnPHbFfQ==
X-Received: by 2002:a17:902:d510:b0:216:48f4:4f1a with SMTP id d9443c01a7336-219e6e9df37mr718707665ad.16.1736175123345;
        Mon, 06 Jan 2025 06:52:03 -0800 (PST)
Received: from thinkpad ([120.60.61.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc96e85csm293333705ad.61.2025.01.06.06.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 06:52:02 -0800 (PST)
Date: Mon, 6 Jan 2025 20:21:59 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Vivek Pernamitta <quic_vpernami@quicinc.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: host: Enable MSIx if the endpoint supports
Message-ID: <20250106145159.oqseq7ysedmrmyey@thinkpad>
References: <20250106-msix-v1-1-91d7b7143118@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250106-msix-v1-1-91d7b7143118@quicinc.com>

On Mon, Jan 06, 2025 at 10:17:33AM +0530, Vivek Pernamitta wrote:
> Enable MSIx if the end point supports.
> 

s/MSIx/MSI-X

s/end point/endpoint

> Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
> ---
> Enable MSIx if the endpoint supports.

No need of the comment here.

Change LGTM!

- Mani

> ---
>  drivers/bus/mhi/host/pci_generic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 56ba4192c89c16b4882d2e7c95f0dc689fd1e267..af1380220904a7e6232ff1b374da0a4ea49cb470 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -949,7 +949,7 @@ static int mhi_pci_get_irqs(struct mhi_controller *mhi_cntrl,
>  	 */
>  	mhi_cntrl->nr_irqs = 1 + mhi_cntrl_config->num_events;
>  
> -	nr_vectors = pci_alloc_irq_vectors(pdev, 1, mhi_cntrl->nr_irqs, PCI_IRQ_MSI);
> +	nr_vectors = pci_alloc_irq_vectors(pdev, 1, mhi_cntrl->nr_irqs, PCI_IRQ_MSIX | PCI_IRQ_MSI);
>  	if (nr_vectors < 0) {
>  		dev_err(&pdev->dev, "Error allocating MSI vectors %d\n",
>  			nr_vectors);
> 
> ---
> base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
> change-id: 20250106-msix-a4c5488ecafe
> 
> Best regards,
> -- 
> Vivek Pernamitta <quic_vpernami@quicinc.com>
> 

-- 
மணிவண்ணன் சதாசிவம்
