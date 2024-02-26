Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02345131E44
	for <mhi@lists.linux.dev>; Mon, 26 Feb 2024 21:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708983170; cv=none; b=QN869MoE3f6UfL+e+phpAUiEyI2nlVP+/PW9g8B9i2IIwr8pjIBqOZFG0OCr7ChjzJi7zlbqLtEX4CYetEOlaoPmBoqe68r38hGdbxjS4iY+1Km72odS8r+Dh2JvMZy6QQOcbeog0lSmWGIO/mAPLoUK7/6EXRlaW6ZnLcp2yBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708983170; c=relaxed/simple;
	bh=6jYoQspdkHGJLK0YUMFQ1JcVi1hhQ8mEQbVyui8iIj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uuBGmZFFQ4m2tv2ybp4zpGt8FPYBAeStjgov52RByFit3JwbbM1mqGPYiQg6gYhUGdzzP3ZSzAzAjDBTdA5B8cqj7Wn06imQMsqphli/xmPYYXNlmmsuw1HFz1kebwOf7HzfrWESGYEgKyWic4/N2TTRw8BL2TO7Y1YB9r4TUCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=abXDHyb6; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="abXDHyb6"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2d180d6bd32so51824951fa.1
        for <mhi@lists.linux.dev>; Mon, 26 Feb 2024 13:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708983167; x=1709587967; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=i8xzxpmRfOYpMJXfjSv2//ub/SLcVqWsue/aaIwJmAc=;
        b=abXDHyb6OTbDxa2MKAyn/jbTuTiu5YXdTNdVg/bTO1U91lH2Yi+9EMMw8LxfDfpk/Y
         alGpXrevs9T8YVzKE2qlT8EU0dvfIz41utZ4iZRoNjDLgDj/heU6aZeAmr9paToEhABD
         zNMZZUhv+gl9nfp2AGp6TAZNCPXRB40jVhO9rVeZqT24l7yzNbgtZlJsdNr6EXcPZDYp
         DGmuFx+79hlwyLGySeflv9SQgtKsL/UzBcJKVrRjPYSv2ldY7c8Z3gAzNDMDAXsbNEeA
         0l+di/p6rdO8kOenum7YwWPEC8fvUadLs8UuTKbINuYnEZgoCPMoGMeQaO0zAU8HGkKU
         E5qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708983167; x=1709587967;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i8xzxpmRfOYpMJXfjSv2//ub/SLcVqWsue/aaIwJmAc=;
        b=doDS347eWW9JyHi8bRHc24/L5Tbp4YbbwS7sMks97g9Xw5FNG/ClKy07pH7WTrPWgN
         Kjm5CmpUEvBlkKn7EOC1mevYmOhzliFDOAS5coTvZCZlsEh4bAP6BD50YWgfQyQjdt6a
         o8uj3ZeatWdI1kDCCYmDgyxchvjHeJUWCapIwfdr+F/SVg+dfgs7T5xnOuWzla1ELinr
         inuHOTAIG9TxMiu69ONzCpX/H0K4kpmWlrVsdlegcOcOTTMcenwS4jQ6EmQmqKBrL8xK
         Sy4/neZKg1rRXlWqvMLucSl5zSrKIHFXbQ4rlqa/Lrn5wF8CiGt7F7xPnOr5gHrAgrTh
         eOKw==
X-Forwarded-Encrypted: i=1; AJvYcCVesikEIf30VFaL7TVkodEO2a1EkdLodVta2QeT99/oRy9Htr9mp38EhaMl+uFM1TZYgYbkrEJj7t5CTWAkTvdqB8EK
X-Gm-Message-State: AOJu0YyzleKLuynzrTNmKzK/ueXkzbcjmc3rK3m1wTY3Se5wKA8m/Pcp
	NM8/ysHustlSoHKz9qvfMsqT4BBd1JHwnDzFKjFPVkyke3bcPCd2
X-Google-Smtp-Source: AGHT+IFD8fVCLCZRuvlw4QUdTpUUxsb2xINlJ/9nipMrhgrXDqGF7m/mE8vmyJkgieG2WQnmTGcxxQ==
X-Received: by 2002:a2e:a495:0:b0:2d2:7d73:7b3b with SMTP id h21-20020a2ea495000000b002d27d737b3bmr4157845lji.3.1708983166865;
        Mon, 26 Feb 2024 13:32:46 -0800 (PST)
Received: from mobilestation ([95.79.226.168])
        by smtp.gmail.com with ESMTPSA id y5-20020a2e7d05000000b002d2474fdecesm997285ljc.35.2024.02.26.13.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 13:32:46 -0800 (PST)
Date: Tue, 27 Feb 2024 00:32:44 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>, 
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev, Siddharth Vadapalli <s-vadapalli@ti.com>
Subject: Re: [PATCH v3 2/5] PCI: dwc: Skip finding eDMA channels count if
 glue drivers have passed them
Message-ID: <4p4z5eyhpdhxzi36drhrmz6z7krupszddudg6c2baypkbnnj7t@nqcmk2wdntts>
References: <20240226-dw-hdma-v3-0-cfcb8171fc24@linaro.org>
 <20240226-dw-hdma-v3-2-cfcb8171fc24@linaro.org>
 <5gzkxdpx6u3jhw5twbncjhtozgekmlzxrpj3m6is3ijadm2svb@f6ng4owyakup>
 <20240226153014.GG8422@thinkpad>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240226153014.GG8422@thinkpad>

On Mon, Feb 26, 2024 at 09:00:14PM +0530, Manivannan Sadhasivam wrote:
> On Mon, Feb 26, 2024 at 03:53:20PM +0300, Serge Semin wrote:
> > On Mon, Feb 26, 2024 at 05:07:27PM +0530, Manivannan Sadhasivam wrote:
> > > In the case of Hyper DMA (HDMA) present in DWC controllers, there is no way
> > > the drivers can auto detect the number of read/write channels as like its
> > > predecessor embedded DMA (eDMA). So the glue drivers making use of HDMA
> > > have to pass the channels count during probe.
> > > 
> > > To accommodate that, let's skip finding the channels if the channels count
> > > were already passed by glue drivers. If the channels count passed were
> > > wrong in any form, then the existing sanity check will catch it.
> > > 
> > > Suggested-by: Serge Semin <fancer.lancer@gmail.com>
> > > Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > ---
> > >  drivers/pci/controller/dwc/pcie-designware.c | 16 +++++++++-------
> > >  1 file changed, 9 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
> > > index 193fcd86cf93..ce273c3c5421 100644
> > > --- a/drivers/pci/controller/dwc/pcie-designware.c
> > > +++ b/drivers/pci/controller/dwc/pcie-designware.c
> > > @@ -927,13 +927,15 @@ static int dw_pcie_edma_find_channels(struct dw_pcie *pci)
> > >  {
> > >  	u32 val;
> > >  
> > > -	if (pci->edma.mf == EDMA_MF_EDMA_LEGACY)
> > > -		val = dw_pcie_readl_dbi(pci, PCIE_DMA_VIEWPORT_BASE + PCIE_DMA_CTRL);
> > > -	else
> > > -		val = dw_pcie_readl_dma(pci, PCIE_DMA_CTRL);
> > > -
> > > -	pci->edma.ll_wr_cnt = FIELD_GET(PCIE_DMA_NUM_WR_CHAN, val);
> > > -	pci->edma.ll_rd_cnt = FIELD_GET(PCIE_DMA_NUM_RD_CHAN, val);
> > 
> > > +	if (!pci->edma.ll_wr_cnt || !pci->edma.ll_rd_cnt) {
> > 
> > Are you sure that the partly initialized case should be considered as
> > a request for the auto-detection? IMO &&-ing here and letting the
> > sanity check to fail further would be more correct since thus the
> > developer would know about improper initialized data.
> > 
> 
> We already have the check below. So the partly initialized case will fail
> anyway.

Not really. If the partly initialized case activates the
auto-detection procedure it will override both non-initialized and
_initialized_ number of channels with the values retrieved from the
hardware, which the glue driver has been willing not to use. This
prone to undefined behavior depending on the reasons of skipping the
auto-detection procedure. For instance, assume the DMA_CTRL register
reports an invalid number of read channels. A glue driver by mistake
or willingly overwrites the pci->edma.ll_rd_cnt field only. This won't
solve the problem since the auto-detection will be proceeded due to
the pci->edma.ll_wr_cnt field being left uninitialized.

So to speak it would be better to implement a strictly determined case
for activating the auto-detection procedure: both number of channels
aren't initialized; if only one field is initialized then report an
error.

Alternatively we can have the auto-detection executed on the
per-channel basis:

+	if (pci->edma.mf != EDMA_MF_HDMA_NATIVE) {
+		val = dw_pcie_readl_dma(pci, PCIE_DMA_CTRL);
+
+		if (!pci->edma.ll_wr_cnt)
+			pci->edma.ll_wr_cnt = FIELD_GET(PCIE_DMA_NUM_WR_CHAN, val);
+
+		if (!pci->edma.ll_rd_cnt)
+			pci->edma.ll_rd_cnt = FIELD_GET(PCIE_DMA_NUM_RD_CHAN, val);
+	}

-Serge(y)

> 
> - Mani
> 
> > -Serge(y)
> > 
> > > +		if (pci->edma.mf == EDMA_MF_EDMA_LEGACY)
> > > +			val = dw_pcie_readl_dbi(pci, PCIE_DMA_VIEWPORT_BASE + PCIE_DMA_CTRL);
> > > +		else
> > > +			val = dw_pcie_readl_dma(pci, PCIE_DMA_CTRL);
> > > +
> > > +		pci->edma.ll_wr_cnt = FIELD_GET(PCIE_DMA_NUM_WR_CHAN, val);
> > > +		pci->edma.ll_rd_cnt = FIELD_GET(PCIE_DMA_NUM_RD_CHAN, val);
> > > +	}
> > >  
> > >  	/* Sanity check the channels count if the mapping was incorrect */
> > >  	if (!pci->edma.ll_wr_cnt || pci->edma.ll_wr_cnt > EDMA_MAX_WR_CH ||
> > > 
> > > -- 
> > > 2.25.1
> > > 
> 
> -- 
> மணிவண்ணன் சதாசிவம்
