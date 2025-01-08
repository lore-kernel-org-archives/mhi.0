Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ABA3201264
	for <mhi@lists.linux.dev>; Wed,  8 Jan 2025 16:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736354605; cv=none; b=W1M+yI04YInkHaqyPOw0SbMA2lRt8hp5DKvdmlZZKFlfPwzg1BRjnTeQXTZjVjgSR5n2IPmoOWpqP9S5cOY2wSBxIs+lsgCdxKWLllZEIwNKvo8nbVDJoxYbA9iUOchzFqQbWToVpt3TG1OkNgZ9kgkZlugdIGTDVAUXxD1yqxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736354605; c=relaxed/simple;
	bh=0478WuDY931iD281gVufADAtkeNwWNFOd6enKgB1W2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o5JnCD5JEimq/pQhm5DpbCA48PigqZe8q0x92TYsHV6ahWjSNvK2kYEI1AD1sf0oBnMQSmg8IHQrbUiRzdpgMdRRXDeXuRrcNyYvWN7rtU/5xXp99ny4Ib2BjqY9SYHhxkodp70GwdfHYDWCV8N/K8Px7afCsOpmSTGrtAEaXgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V+LaA0l6; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V+LaA0l6"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2164b1f05caso249773945ad.3
        for <mhi@lists.linux.dev>; Wed, 08 Jan 2025 08:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736354603; x=1736959403; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ielvvOsJJuv+B+zm9cCFALy5/4YtBfaSGBUjPImt/oA=;
        b=V+LaA0l6VO5XB0U/yZGKPWVmtl0CVdhmHjP7Wm3F4rXv79DUbWdEQ+A3du7EzEieoy
         938/HorwMzhC2IbCD4aCk8GMjoxrSZAM3Ix13rELSTPjrgZp1/TZcofgrChp9tKm1i2m
         wO+vUb7XDaTdrr3Hw0/f+03R6lJdEeWreA6ESwtQVszBi9j5HwNLyXTJ9TtdHk0LQtX4
         1l0v3svSg6wF7uD69/PRcQN43NAjqEovuoF79vGUZ+MbpoKyW/0ozDj97LlvwF6ed+st
         CdPSs5DWlqS/2rjpJ7ptpjKiARVS8kk4DiRi9ig6pKFvooK+WAVWz8INGIzjyvkSWa0F
         xrzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736354603; x=1736959403;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ielvvOsJJuv+B+zm9cCFALy5/4YtBfaSGBUjPImt/oA=;
        b=wB9pgAipKXnHw3ZPifI/KseX0lPa1RjnrCD0TTqCSxncrNdlKSRSvNDzrIW+NIr/k8
         vZ2J8w/5RYs8hxkT4Fmek5DYqUfNM2JPS5fgS9H8RVhBcuTsQETIgYMkNqMRrtdob9n2
         1LUTRSCSBj2dPCJdzHMNnNThwypMn1Jr5eDRo9C6DB3VqERD5uXFSobexuOrbvsvbSDA
         +Bf/mFYlIcb49Xb5Ej/fb2lkPoin+eGC6kkcE8XGsEzOsZh+FKugiWe7Vqwm3dUVXN0D
         kpizrKMlawkACathOwXMkfwf0kufcNc0yWYONbQ5VtInSX8akikQPg+CvFPsxUD2uWGJ
         JNzg==
X-Gm-Message-State: AOJu0Yxzbw//sLkG8JBCK8Il9LJjJUmgyDcJMOnoJt/ZHodpaiFTalfN
	DCJw0UtRgFu6Z6VTUZcNiQVTV0LJMqL5D2e/4KObPf6heF8JeuZ9WyAT68gQmYjZS1CRUkqFQk0
	=
X-Gm-Gg: ASbGncv8RGG/syKrhkAoPGDC8Gpi62+D5NPdOVdyNnzEk+JIVOuUk4MqE5Y0ZNPF9tD
	fYCVmSxNCEYRy2ybFwGtjE7JBw27cQQmKyJXRhQuwyEdghXa7N+F6mUkGkIPodCOTg4TawB7qEU
	nzQUCUIe6ODG2VVGkDhxaS33QaYMalYQL65qnLwRxfcPIKYc3mc4Kv0A9JzFTnf979z0bIKKsml
	HdoC2Va8kUlz6DDJBPcIigoOB06LMCet/eaaTm0tB333pzoubedOr6TfrKj60PhOBUv
X-Google-Smtp-Source: AGHT+IHUlJVV0ETi6YHAJf67U1NYr5OaJs5QKqwANyBQBecRQuA+OvrWnA8jU8UJnYeS9b0488q21A==
X-Received: by 2002:a05:6a21:329d:b0:1e3:cf57:5f5f with SMTP id adf61e73a8af0-1e88d043d3amr5050798637.27.1736354603479;
        Wed, 08 Jan 2025 08:43:23 -0800 (PST)
Received: from thinkpad ([117.213.97.234])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad83616asm35476897b3a.76.2025.01.08.08.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 08:43:23 -0800 (PST)
Date: Wed, 8 Jan 2025 22:13:17 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Vivek Pernamitta <quic_vpernami@quicinc.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] bus: mhi: host: Enable MSI-X if the endpoint supports
Message-ID: <20250108164317.3oz3gaesdryfygnk@thinkpad>
References: <20250108-msix-v2-1-dc4466922350@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250108-msix-v2-1-dc4466922350@quicinc.com>

On Wed, Jan 08, 2025 at 09:52:07PM +0530, Vivek Pernamitta wrote:

Subject should have 'pci_generic'. I'll add it while applying.

> Enable MSI-X if the endpoint supports.
> 
> Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
> Changes in v2:
> - Updated commit text.
> - Link to v1: https://lore.kernel.org/r/20250106-msix-v1-1-91d7b7143118@quicinc.com
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
