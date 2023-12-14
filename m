Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DAC06108
	for <mhi@lists.linux.dev>; Thu, 14 Dec 2023 05:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pOejqgew"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3ba00fe4e94so3753865b6e.1
        for <mhi@lists.linux.dev>; Wed, 13 Dec 2023 21:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702531167; x=1703135967; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ebgC6Es1TWLTrA7P861m7mbGtvNZNIYlwsAipKfKxek=;
        b=pOejqgew4jdDslRig3sQlT+ARguTpQ35fNOnc/os0qrzH3Fy04/MGI63vuy98lTvYJ
         RLe4yaAdYtVYnrJPMR7ix2O4xAjnmtSbMDfY/IYgD0MY+bGyHg5APQrJFYwblLavNEsi
         zhYqDnIYgah10J6una/ekW1AAZ3q9q9UvZNQisTh1TbthZRir+0XLhLrS8jyeHhyDiLa
         3PCEL3ehu8qQBkvIQ+5JG+HZB5HE1fHohdAapxMJ/H6WoQysvs0kNDG5RInk8bEEcAZR
         G8pADSC7WxnfAmeJbd+GLVauPBmkajt15dNzdxFVso3ez6CoLrMvPB1GGfO0tNbc7SSC
         ExDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702531167; x=1703135967;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ebgC6Es1TWLTrA7P861m7mbGtvNZNIYlwsAipKfKxek=;
        b=q7ivgTwxKdASqiBIoD/6y9pZykhi11rcqQvyzJq47RwuH4SDbeFTh8wSbLJbq6JWIb
         Eh3LJdQbRWo0K0QqvKrtUPBCdQ59BFEtlcgxN4oRfAk6TIjd8oaSQX6H41WUoc4XP/Xk
         hIcPxYfRcij5Z0Ncr7/A/kpsVkvwZ5LvJ/vEasGuNW72RBuAVz4fze/mM1KSclvuypco
         QsDs23EWQ0u8910NxJFpcwy04qiHeXbGu8vvOpmKnxawZrRQuCfiGpR4y+BjIyzxAO0h
         w6jfS9OgUVzK5PtGSk8lIagtY2UaUaPR/OkoMxK7WqbAYEaIqDRad0bmFqpOp4JdsSW5
         UR1A==
X-Gm-Message-State: AOJu0Yxcv1zj3sDJu/G1214iAdbv/ynpbh0IBXhCpXjrL+4Tr4d3IWBC
	v7nEO9emdkXowOBp3wjM5sYG
X-Google-Smtp-Source: AGHT+IGW3pZ0FDvERci6/aHUcc+KUUP8SedVgnuilbHTJ7cbeMfPq5P/+/TASqLl0smV5t/gXrvQNA==
X-Received: by 2002:a05:6808:1686:b0:3b2:c242:aaee with SMTP id bb6-20020a056808168600b003b2c242aaeemr11190614oib.42.1702531167246;
        Wed, 13 Dec 2023 21:19:27 -0800 (PST)
Received: from thinkpad ([117.213.102.12])
        by smtp.gmail.com with ESMTPSA id sm5-20020a17090b2e4500b002867f87d103sm12049902pjb.50.2023.12.13.21.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 21:19:26 -0800 (PST)
Date: Thu, 14 Dec 2023 10:49:19 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
Cc: lpieralisi@kernel.org, kishon@kernel.org, bhelgaas@google.com,
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/9] PCI: epf-mhi: Enable MHI async read/write support
Message-ID: <20231214051919.GE2938@thinkpad>
References: <20231127124529.78203-1-manivannan.sadhasivam@linaro.org>
 <20231127124529.78203-7-manivannan.sadhasivam@linaro.org>
 <20231213184829.GA924726@rocinante>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231213184829.GA924726@rocinante>

On Thu, Dec 14, 2023 at 03:48:29AM +0900, Krzysztof Wilczyński wrote:
> Hello,
> 
> Manivannan, you will be taking this through the MHI tree, correct?
> 

Yes, to avoid conflict with other MHI patches, I'm taking this series through
MHI tree.

> > Now that both eDMA and iATU are prepared to support async transfer, let's
> > enable MHI async read/write by supplying the relevant callbacks.
> > 
> > In the absence of eDMA, iATU will be used for both sync and async
> > operations.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  drivers/pci/endpoint/functions/pci-epf-mhi.c | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/pci/endpoint/functions/pci-epf-mhi.c b/drivers/pci/endpoint/functions/pci-epf-mhi.c
> > index 3d09a37e5f7c..d3d6a1054036 100644
> > --- a/drivers/pci/endpoint/functions/pci-epf-mhi.c
> > +++ b/drivers/pci/endpoint/functions/pci-epf-mhi.c
> > @@ -766,12 +766,13 @@ static int pci_epf_mhi_link_up(struct pci_epf *epf)
> >  	mhi_cntrl->raise_irq = pci_epf_mhi_raise_irq;
> >  	mhi_cntrl->alloc_map = pci_epf_mhi_alloc_map;
> >  	mhi_cntrl->unmap_free = pci_epf_mhi_unmap_free;
> > +	mhi_cntrl->read_sync = mhi_cntrl->read_async = pci_epf_mhi_iatu_read;
> > +	mhi_cntrl->write_sync = mhi_cntrl->write_async = pci_epf_mhi_iatu_write;
> >  	if (info->flags & MHI_EPF_USE_DMA) {
> >  		mhi_cntrl->read_sync = pci_epf_mhi_edma_read;
> >  		mhi_cntrl->write_sync = pci_epf_mhi_edma_write;
> > -	} else {
> > -		mhi_cntrl->read_sync = pci_epf_mhi_iatu_read;
> > -		mhi_cntrl->write_sync = pci_epf_mhi_iatu_write;
> > +		mhi_cntrl->read_async = pci_epf_mhi_edma_read_async;
> > +		mhi_cntrl->write_async = pci_epf_mhi_edma_write_async;
> >  	}
> 
> Looks good!
> 
> Reviewed-by: Krzysztof Wilczyński <kw@linux.com>
> 

Thanks!

- Mani

> 	Krzysztof

-- 
மணிவண்ணன் சதாசிவம்
