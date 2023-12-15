Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3B9250E2
	for <mhi@lists.linux.dev>; Fri, 15 Dec 2023 11:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SGA1G9vs"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6cebbf51742so343539b3a.1
        for <mhi@lists.linux.dev>; Fri, 15 Dec 2023 03:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702638019; x=1703242819; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hqlj4/QUlWtIrDLHx0gmo3NTEhgLbAEJdvoypSzSkV4=;
        b=SGA1G9vsYXvA7Nk+yULTphuwG4WdG7NW0UrkE4SwPBt5Idv2sKZjIRiEZ/3dkjta6e
         0XKRVxfEPtdrJSBPuMWZSFkAdbTKJXtkL10Jsk8lllFaERpP6Uq9+VuE+0IQQpOL4XAP
         i9LauFGNFSK9OY4Y14YhGuttbHfJgAIaSpsLpiZCxZrb9s6vS1fML3jHEV0k/a2A/MGS
         Pg9u2WoCFEq6hH7CSsbIK4vhp4AJ3IDLvQmn1UiE75m+4avpOpfP90Oa+KvwA+ti/NR0
         hIvhP+/AHrkfaYiIWNmSNQEyN2lFpEfPuVpRqtSQO0H0mdKoxSk/1ajE1sTe0gZsCQA/
         0C9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702638019; x=1703242819;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hqlj4/QUlWtIrDLHx0gmo3NTEhgLbAEJdvoypSzSkV4=;
        b=HAdYrXR5J1yYA4z2x1f5ug0R+46sV5IMbLSE9/v9nJ4b4RgCAQJXhEwdah6aApUBwl
         pNZCXL5hRCtpz/XMk6jJRMcZmG78dcothY4tNSDnM0fX49/qlTrZnPTfNPbO95BaaxVE
         beXoBCgAKnH/4nMgBDudlkr57+spSkuUAjT2crRvnHUdJoVGJ8eR2slF1rB97v0gzbrY
         fG3dgwJ1QWC02t3zhQFvCvNlSCvjyKXUKRnyQ6xckrz0OG27Y10eoDFcuelxAfdY+xFm
         t9TKiJPq2GKPuBG4cCLTFPn059jPwiM830mNJt4ALpO1R6IVprVrMPKGZCemNIvw6g6R
         xJxg==
X-Gm-Message-State: AOJu0YwA1dTvDFm5gF70IQmMDpBWxYKUhSzDHucAhK9SUhnoznnpCyVd
	/sJqE3UzBo44HJewfsVk4oTe
X-Google-Smtp-Source: AGHT+IFBP0BhD4lTrTKdOfab7a3x09nSVDozE87qcYpsEL0j06A1OVhRm9jH+v/Q2SbpZhn9G0wpGw==
X-Received: by 2002:a05:6a00:2301:b0:6c3:4bf2:7486 with SMTP id h1-20020a056a00230100b006c34bf27486mr15018314pfh.7.1702638019633;
        Fri, 15 Dec 2023 03:00:19 -0800 (PST)
Received: from thinkpad ([117.207.30.136])
        by smtp.gmail.com with ESMTPSA id c12-20020aa7880c000000b006ce7ff254b9sm13249835pfo.68.2023.12.15.03.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 03:00:19 -0800 (PST)
Date: Fri, 15 Dec 2023 16:30:12 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
Cc: lpieralisi@kernel.org, bhelgaas@google.com, kishon@kernel.org,
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: epf-mhi: Fix the DMA data direction of
 dma_unmap_single()
Message-ID: <20231215110012.GA13113@thinkpad>
References: <20231214063328.40657-1-manivannan.sadhasivam@linaro.org>
 <20231214193521.GA2147106@rocinante>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231214193521.GA2147106@rocinante>

On Fri, Dec 15, 2023 at 04:35:21AM +0900, Krzysztof Wilczyński wrote:
> Hello,
> 
> > In the error path of pci_epf_mhi_edma_write() function, the DMA data
> > direction passed (DMA_FROM_DEVICE) doesn't match the actual direction used
> > for the data transfer. Fix it by passing the correct one (DMA_TO_DEVICE).
> 
> Nice catch!
> 
> > Fixes: 7b99aaaddabb ("PCI: epf-mhi: Add eDMA support")
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> > 
> > Bjorn, Krzysztof, I'd like to apply this patch to MHI tree on top of eDMA
> > async patches due to dependency:
> > https://lore.kernel.org/linux-pci/20231127124529.78203-1-manivannan.sadhasivam@linaro.org/
> 
> Sounds good to me!  We still have a little time, so let me know if you
> change your mind about who should take this patch and the other series. :)
> 

No change in plan :)

> >  drivers/pci/endpoint/functions/pci-epf-mhi.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/pci/endpoint/functions/pci-epf-mhi.c b/drivers/pci/endpoint/functions/pci-epf-mhi.c
> > index 472bc489b754..d3d6a1054036 100644
> > --- a/drivers/pci/endpoint/functions/pci-epf-mhi.c
> > +++ b/drivers/pci/endpoint/functions/pci-epf-mhi.c
> > @@ -424,7 +424,7 @@ static int pci_epf_mhi_edma_write(struct mhi_ep_cntrl *mhi_cntrl,
> >  	}
> >  
> >  err_unmap:
> > -	dma_unmap_single(dma_dev, src_addr, buf_info->size, DMA_FROM_DEVICE);
> > +	dma_unmap_single(dma_dev, src_addr, buf_info->size, DMA_TO_DEVICE);
> >  err_unlock:
> >  	mutex_unlock(&epf_mhi->lock);
> 
> Looks good!
> 
> Reviewed-by: Krzysztof Wilczyński <kw@linux.com>
> 

Thanks! Applied to mhi-next.

- Mani

> 	Krzysztof

-- 
மணிவண்ணன் சதாசிவம்
