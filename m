Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4E5250E5
	for <mhi@lists.linux.dev>; Thu, 14 Dec 2023 10:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N5BFut+P"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6ceba6c4b8dso6768614b3a.1
        for <mhi@lists.linux.dev>; Thu, 14 Dec 2023 02:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702548583; x=1703153383; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WWNR+uChpD2XCXHiRI7apkxqBy405ej3EqIXUwuAYoY=;
        b=N5BFut+PqzT9KUMHSmWUMwRqvm4ND8vqQX1k9AcAqKvZkjDoq5N79/G0tUKGiNT5Pn
         enkj5xnrbdnmsEDWtMOHDUDx03t+Fep9A3M070zQqdJv1bp/0nrU3bXQ9IZ07VN0WoAP
         NSOoenkx5gydoMoe/r5PHfFPG78YsllZexng0c7WbydBQWnuQYLH9O8YnsG+/lLkmNeA
         Cf+mmHvIH+UK9AgNHL/DsJ1Gwc1WDaftw1F6gvLl0QfmFgHeSRxdA3yLJxbrgtqdgYG5
         fxDvjw+9La/h2pq9Dn7lggYNOT2yLOLY1FKg1cVL4LraD5vgBWEK/hKNUYGufdua2mlS
         sA/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702548583; x=1703153383;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WWNR+uChpD2XCXHiRI7apkxqBy405ej3EqIXUwuAYoY=;
        b=JjO3az0pCF84gTJXdb+RqWhVGdQ+mmALKXvRl5fDBjUy2tDVxh8iukfDjn0f0xfTNv
         3kUMf/omquEc7SyEIx6sn6xdrfpQOhOQPCorEGX/6H0KMkN9NP0AfgYUXV+5dNRAmeUg
         mUZ4qlxvL9cZNI+knWqvMXMEIRZX/i6ABd+6Cdz7fnjxgS5WeNi5n9xrTHzNwMeQO+xx
         ee+OoKgSjcMP1L4T8+TGfT7vuykYVJIDWiXGffjyzc6cXrOgKsAgfNilShmNvSr/5TSl
         OD4/ieUJa5rtdeXfyNgTLiXJOxqFrhk2gVNKKhUd9cztkM9m6lsinOObA7NM5hCqFgiy
         y1Wg==
X-Gm-Message-State: AOJu0Yx4yquYoY5/FXtrg/QjfglTi1WIMRGUhupfAz6W7XHLGoBu7/6e
	eMyPXfMXGUSC6a0DZ5q4BPaN
X-Google-Smtp-Source: AGHT+IFoBTL8upshvJpDsA2gdrqL9OnkLrHFDhbqOefDhz6lfrJvqtCI/Af60s/auvjujU8gBjKneQ==
X-Received: by 2002:a05:6a00:2195:b0:6ce:6518:702f with SMTP id h21-20020a056a00219500b006ce6518702fmr11386629pfi.28.1702548583327;
        Thu, 14 Dec 2023 02:09:43 -0800 (PST)
Received: from thinkpad ([117.216.120.87])
        by smtp.gmail.com with ESMTPSA id ca40-20020a056a0206a800b005897bfc2ed3sm9703702pgb.93.2023.12.14.02.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 02:09:42 -0800 (PST)
Date: Thu, 14 Dec 2023 15:39:36 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krishna Chaitanya Chundru <quic_krichai@quicinc.com>
Cc: lpieralisi@kernel.org, kw@linux.com, kishon@kernel.org,
	bhelgaas@google.com, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/9] PCI: epf-mhi: Enable MHI async read/write support
Message-ID: <20231214100936.GI2938@thinkpad>
References: <20231127124529.78203-1-manivannan.sadhasivam@linaro.org>
 <20231127124529.78203-7-manivannan.sadhasivam@linaro.org>
 <feb4ed1b-ed74-aebe-0ab8-dec123fe0a31@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <feb4ed1b-ed74-aebe-0ab8-dec123fe0a31@quicinc.com>

On Thu, Dec 14, 2023 at 03:10:01PM +0530, Krishna Chaitanya Chundru wrote:
> 
> On 11/27/2023 6:15 PM, Manivannan Sadhasivam wrote:
> > Now that both eDMA and iATU are prepared to support async transfer, let's
> > enable MHI async read/write by supplying the relevant callbacks.
> > 
> > In the absence of eDMA, iATU will be used for both sync and async
> > operations.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >   drivers/pci/endpoint/functions/pci-epf-mhi.c | 7 ++++---
> >   1 file changed, 4 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/pci/endpoint/functions/pci-epf-mhi.c b/drivers/pci/endpoint/functions/pci-epf-mhi.c
> > index 3d09a37e5f7c..d3d6a1054036 100644
> > --- a/drivers/pci/endpoint/functions/pci-epf-mhi.c
> > +++ b/drivers/pci/endpoint/functions/pci-epf-mhi.c
> > @@ -766,12 +766,13 @@ static int pci_epf_mhi_link_up(struct pci_epf *epf)
> >   	mhi_cntrl->raise_irq = pci_epf_mhi_raise_irq;
> >   	mhi_cntrl->alloc_map = pci_epf_mhi_alloc_map;
> >   	mhi_cntrl->unmap_free = pci_epf_mhi_unmap_free;
> > +	mhi_cntrl->read_sync = mhi_cntrl->read_async = pci_epf_mhi_iatu_read;
> > +	mhi_cntrl->write_sync = mhi_cntrl->write_async = pci_epf_mhi_iatu_write;
> >   	if (info->flags & MHI_EPF_USE_DMA) {
> >   		mhi_cntrl->read_sync = pci_epf_mhi_edma_read;
> >   		mhi_cntrl->write_sync = pci_epf_mhi_edma_write;
> > -	} else {
> > -		mhi_cntrl->read_sync = pci_epf_mhi_iatu_read;
> > -		mhi_cntrl->write_sync = pci_epf_mhi_iatu_write;
> > +		mhi_cntrl->read_async = pci_epf_mhi_edma_read_async;
> > +		mhi_cntrl->write_async = pci_epf_mhi_edma_write_async;
> 
> I think the read_async & write async should be updated inside the if
> condition where MHI_EPF_USE_DMA flag is set.
> 

That's what being done here. Am I missing anything?

- Mani

> - Krishna Chaitanya.
> 
> >   	}
> >   	/* Register the MHI EP controller */

-- 
மணிவண்ணன் சதாசிவம்
