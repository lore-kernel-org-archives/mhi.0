Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17471F9EAC
	for <mhi@lists.linux.dev>; Mon,  2 Dec 2024 09:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733132125; cv=none; b=NfE9I8Ne6S7IaoLZgcKjhWeZImX+HUDbxfjIVXW7y0kpTg11jW/ILSZu38lCXxcAXUxVaZp3xzPa3qzoTOawT5QQusjYzJI8nCrA30KfoK7RLBidA/XHPZ3ZcdRfM0RpR8A8dxINRM9UKId5AKouqDd/pSLLJ7JaiMCF23Ss58c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733132125; c=relaxed/simple;
	bh=4Ls56rRdnVJ9EpHYJal+FjHAigp26UK24vfmyXe9/Ww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CebiBlsqzGM8tQlqn8fALmy/Wbl4Nn4lhTeY+rOFP0mUyhaE4QCAXgIc2OkFzsAg96LstHmZ94MGL/f9vlDZEgCWeYOE3qM0MtjjzGtfwAm9YYq/JUMy35o48y20eTnYbyB3lsaYVPp57tcgy+dowSomkpLeKPE0zBrhyAHJAu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q6UvOdA/; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q6UvOdA/"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21288ce11d7so34580705ad.2
        for <mhi@lists.linux.dev>; Mon, 02 Dec 2024 01:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733132123; x=1733736923; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=D0/jNAjkVdudPnX4cpNWF1d7Eupiz108pESERY6Okt4=;
        b=Q6UvOdA/HBoJEI4d7+e91X0FyrN6XIJoen6xvBZyiliCCcflE2DzZ6Sd5Ti7W6HlX/
         zBZ2llPcP2436Qu0jsRdh9DiUyXbSs0C0UjoQ+GBLeEDPuTlHQdoUl2FB8+bhBZtfucz
         gqLUmW0Wdc2VneX0PhfJYpdPeVNlwXScJgS11kO1Ufd/k5B3bQGLYaW6Try+OqlfXMBG
         QJL3mI67AB2kfZkMecFYFgYFJDdi/SKvKc7nKdaxTGIJ40/klARI+TLJXEmkQSTgku6L
         8NA+JvP53g5TFnlG/rboLZDM4ph69iQCQSY1proYVdv0puy2OTNvHlYEcUH6WHVA730+
         7w5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733132123; x=1733736923;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D0/jNAjkVdudPnX4cpNWF1d7Eupiz108pESERY6Okt4=;
        b=Sa0/vkpKcLw44ocwePY0NfMMAFQVcHwWpnUq7/dZL7VYD7NGPjKEkCsVuNKwokta2/
         2kgupNQHnNOqBA10johe9FLpTDM1h3f/2E0gzljAfpVYmYVKg5mxlCpe9zuOuDh3na9o
         4rlYMSr8AJaLZBDwJLvxnoyy4H7joEaqev6riZLdQ9Zvr/z6KlfC5uJ4Fa89Ovhpfx7y
         gje5j5pnQoDgZWheTwQARYY+5Ukyv7nA/7N9mj6MXRZq57HCwBz7VK9OLp7IfxY8xczp
         uj5PHN2ByiPvpqjTmBnbgDgDi7deuzptrShZVc52v0qVjP7AiOsMxRGDUu/1amqzO245
         za5w==
X-Gm-Message-State: AOJu0Ywv6N2KkvipPa4KGXZAy2cwsk+hQ32I16+sSmFtBBASlSY80KDB
	63lHVzllDEIrTDMhtmGIF1qpLX0BfLkhOvJotl5cTk8F90extG4Vz0kpWZW/Ug==
X-Gm-Gg: ASbGncvRJf+R0sgZxt5YN0JGfUFn1bHGieumoCLKiBmIsRM8u0Dhn6uAIstlbmueCAU
	mUNT7hW+D+nDRG8pF+VtxMqoP+uPcgrcel3vD2TESFuEf15ZSj3azS5eq/Rd2zvU+oOJYgAbUbk
	oCkQZtwb3+Vw8B2hWIBK4ieTOv/YZ3SCc4AY8bHJ9lJ77QF2oEG5woIVvYJcFF1r8nKkB7XjEjV
	sW4RHKyTCM9DCUcztSD/jOWM5ieiAwlwwOhD0450C1Ym2ktsZ9VKqtid0wC3g==
X-Google-Smtp-Source: AGHT+IH6WqX5McwcnER4/bmD3nrKzgQKw8S99c/9pxMGg83RDoUGvFiPAnv49QNfV8BiBVRyQvzg2g==
X-Received: by 2002:a17:902:ec87:b0:215:9642:4d6d with SMTP id d9443c01a7336-21596424f7fmr34824995ad.17.1733132122840;
        Mon, 02 Dec 2024 01:35:22 -0800 (PST)
Received: from thinkpad ([120.60.140.110])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215218f479asm72459645ad.41.2024.12.02.01.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 01:35:22 -0800 (PST)
Date: Mon, 2 Dec 2024 15:05:17 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Mayank Rana <quic_mrana@quicinc.com>
Subject: Re: [PATCH] bus: mhi: host: pci_generic: fix MHI BAR mapping
Message-ID: <20241202093517.qhiy7larutekuk2l@thinkpad>
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

That's silly on me. Thanks for the fix!

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

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

> ---
> 
> The offending patch was marked as "Compile tested only", but that just
> makes you wonder *why* the patch was never tested...
> 

Because I didn't had a modem platform to test my change and since it was a
simple API conversion, I merged it after some time.

- Mani

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
