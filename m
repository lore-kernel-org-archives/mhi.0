Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C08425565
	for <mhi@lists.linux.dev>; Wed, 13 Dec 2023 18:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1d06d42a58aso68014845ad.0
        for <mhi@lists.linux.dev>; Wed, 13 Dec 2023 10:48:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702493311; x=1703098111;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mgP80Yyu6IvFK797HjxiOfl5XynuTDj7ZNa6KXUx8cI=;
        b=RoDxukc8B8lbZPi7R6kNnQRPCzCyd3vCDXNSIc5f5wAFK78UVW1O1Xnsfnm3gqE3PM
         WVET8F54RXdKYk6spNGctLx/eB3DLGWHEZ7pi2uGExSu2E8+4+yA5r7A4FqkNEwRH1MN
         5K26jdLkYioJeqjFS7ktigMvoiQTQ3eEbCJ1FeyFSZgXpdqfNGfcdCo5/WAv9jMsJX/t
         9wVe0noAK4Cw/8iK/5sPhUSzATs/GkFybkF+zuCN8+3AS3ywrv33O6GS7ITZCfrsKdbM
         UA4lmKUpPvVRUm4M4QofiZaC2uMuU/G/XEXch9jgH20Hpnf/4jwai5YhcjfqWRE34JRx
         GwDQ==
X-Gm-Message-State: AOJu0Yyp6b7dWg1S/ozEHx2guCnbr79RPYO1N0bEmcuBWtx+4jBpTdq5
	4Mh85SOepdAexlms25eyB2c=
X-Google-Smtp-Source: AGHT+IEzlIEd9Q6eLCCZLjW8OK193jqfOJ0Gqr0iKW0nJNMRppuRTXGR720gnDCd+2nqnislHC1Peg==
X-Received: by 2002:a17:902:ec8a:b0:1d0:d18c:bc5a with SMTP id x10-20020a170902ec8a00b001d0d18cbc5amr10203494plg.121.1702493311471;
        Wed, 13 Dec 2023 10:48:31 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id t14-20020a1709027fce00b001cf8c062610sm11107415plb.127.2023.12.13.10.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 10:48:30 -0800 (PST)
Date: Thu, 14 Dec 2023 03:48:29 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: lpieralisi@kernel.org, kishon@kernel.org, bhelgaas@google.com,
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/9] PCI: epf-mhi: Enable MHI async read/write support
Message-ID: <20231213184829.GA924726@rocinante>
References: <20231127124529.78203-1-manivannan.sadhasivam@linaro.org>
 <20231127124529.78203-7-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231127124529.78203-7-manivannan.sadhasivam@linaro.org>

Hello,

Manivannan, you will be taking this through the MHI tree, correct?

> Now that both eDMA and iATU are prepared to support async transfer, let's
> enable MHI async read/write by supplying the relevant callbacks.
> 
> In the absence of eDMA, iATU will be used for both sync and async
> operations.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  drivers/pci/endpoint/functions/pci-epf-mhi.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pci/endpoint/functions/pci-epf-mhi.c b/drivers/pci/endpoint/functions/pci-epf-mhi.c
> index 3d09a37e5f7c..d3d6a1054036 100644
> --- a/drivers/pci/endpoint/functions/pci-epf-mhi.c
> +++ b/drivers/pci/endpoint/functions/pci-epf-mhi.c
> @@ -766,12 +766,13 @@ static int pci_epf_mhi_link_up(struct pci_epf *epf)
>  	mhi_cntrl->raise_irq = pci_epf_mhi_raise_irq;
>  	mhi_cntrl->alloc_map = pci_epf_mhi_alloc_map;
>  	mhi_cntrl->unmap_free = pci_epf_mhi_unmap_free;
> +	mhi_cntrl->read_sync = mhi_cntrl->read_async = pci_epf_mhi_iatu_read;
> +	mhi_cntrl->write_sync = mhi_cntrl->write_async = pci_epf_mhi_iatu_write;
>  	if (info->flags & MHI_EPF_USE_DMA) {
>  		mhi_cntrl->read_sync = pci_epf_mhi_edma_read;
>  		mhi_cntrl->write_sync = pci_epf_mhi_edma_write;
> -	} else {
> -		mhi_cntrl->read_sync = pci_epf_mhi_iatu_read;
> -		mhi_cntrl->write_sync = pci_epf_mhi_iatu_write;
> +		mhi_cntrl->read_async = pci_epf_mhi_edma_read_async;
> +		mhi_cntrl->write_async = pci_epf_mhi_edma_write_async;
>  	}

Looks good!

Reviewed-by: Krzysztof Wilczyński <kw@linux.com>

	Krzysztof
