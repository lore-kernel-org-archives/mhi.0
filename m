Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EAA7147C6C
	for <mhi@lists.linux.dev>; Wed,  3 Apr 2024 13:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712151968; cv=none; b=EgEXs6QtfrfqPZz6+PwvM/5qMrVgZgTV8BsJIg44jyXLWfCoSj+dJk6TkcakiqNgh6r9TnYvTk/UOGai3YeK8GM5Bj40CMSdZLz8RLjk0pLb+4xRWuhiZuGGMVj+o7K/HzauwPXtl0mni0M4q9J+w3KZiySG7W+l2L79AAN9ung=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712151968; c=relaxed/simple;
	bh=oNVe7SUbSSVH8Hwzoz+0n5x3tQwhvVYI/rKOgk9P1Ko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tIyHz1h7tuwYH4qxdXQD8I8n/ZRne4nfP9X+fSrCcz+WCcf97NOpLVUthfxRYe7sUAFQZ2Bh8DQiTGk3UaX76Bef+uDz98RGV+iAdNgz5I9ezrwwHYIWARhlFOGhRi+69YzUF4zCTSDrzI0mn60ezSlPcDb/BE1SlE02VuPSFhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qRX3/Qa8; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qRX3/Qa8"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1def89f0cfdso7483215ad.0
        for <mhi@lists.linux.dev>; Wed, 03 Apr 2024 06:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712151966; x=1712756766; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=902P16CJPnj1xKchC1BfN1x8nt3eQDIalgicu+1Lvwk=;
        b=qRX3/Qa8he50GaMEKTTQkuceBdfgwl5+4ANclk8EimCiTNeVkxfusD4xZQeEa++nze
         bEb5alDAs8pq1QT8Ayp11U3FBhOGPDDaSjyNQ1Ju8tDa23gxM5AmQo/P9+4LFQB7PnA5
         /kABuWeSagUvCqlkA1BCFKgIAIGAhNKHN2MhV9jB/b7tNcsHdIvWL2IMrMHH8jRTpoTr
         nSaIqPfTEugHRiPcUcet1F0aTSlgx98RPlO6fQjyoK+m1iLoQ6uExlCbmt9CdT9aZ23n
         yzZAUqwjnxDxoJ7pCl7MRG5Fs6N9i8VK406YY+c0hQ9ptc0ALoaMxPmtIOEH1F3T1CKb
         7YcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712151966; x=1712756766;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=902P16CJPnj1xKchC1BfN1x8nt3eQDIalgicu+1Lvwk=;
        b=PYXz0ve4+ZZsxKb2zs5e/k9ETrxaoXZ6Z/iV5+nyetwOsZ91TnunFR7hwmovwE/QrQ
         aR09Bz5Or5h7JwR1OCMz6a2S0L/LT8XzAqGly2IKHLWoXWZXgqIwAD7JXKJhwSprm80O
         lmUmKdZDeS6EZWd1hSiVd4zVpaF/7pgIYKx/2h4DC+wq0A+uqb4mqoD6jW4VY/Icvdeu
         1qJmMX+EFbRwLl/3DmdH7icjlwqoZ/hYuMlZj63jreNO8CnONTXl0kRB/Ti/SV8dinII
         drcKGbENXjzRzusUrOWZF2AHDbbYMWLfbx/2jC/A7Nr7bLelSUFGvTrkbefyc2iZAGhl
         G/8g==
X-Forwarded-Encrypted: i=1; AJvYcCUARjSUL4l/ipstV0X6oGuO5C25uFtv8+25cCEvpVrfbWMx+X/Rtzo7BAjMq1hDjiaESL6OuYN1BZWgKdRxEc46vyJK
X-Gm-Message-State: AOJu0YxdPBsJu3JI0BhB2TRSh/eEDD8UJXoLc9b5Rf7QjY0SVHp7pBdB
	6VCzWDA/txcptsQtI0+cSt8FV2sIWFyPYAzh3DEbJF8gMZmMzKo6SHgn2VLbhA==
X-Google-Smtp-Source: AGHT+IHatIDalzVcNZetMx8G4eOcZq4CA3SOosvubbiLoS5X3FwlL5WkyiDNnVYB6kUtPKfF3k+0Ug==
X-Received: by 2002:a17:903:2282:b0:1e2:45f3:2d57 with SMTP id b2-20020a170903228200b001e245f32d57mr3249524plh.6.1712151965699;
        Wed, 03 Apr 2024 06:46:05 -0700 (PDT)
Received: from thinkpad ([103.28.246.48])
        by smtp.gmail.com with ESMTPSA id d5-20020a170902654500b001e290812d49sm1720356pln.226.2024.04.03.06.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 06:46:05 -0700 (PDT)
Date: Wed, 3 Apr 2024 19:16:00 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jingoo Han <jingoohan1@gmail.com>, linux-pci@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	mhi@lists.linux.dev, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 03/10] PCI: endpoint: Rename core_init() callback in
 'struct pci_epc_event_ops' to init()
Message-ID: <20240403134600.GL25309@thinkpad>
References: <20240401-pci-epf-rework-v2-0-970dbe90b99d@linaro.org>
 <20240401-pci-epf-rework-v2-3-970dbe90b99d@linaro.org>
 <ZgvjWtC0f1CY6DJs@ryzen>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZgvjWtC0f1CY6DJs@ryzen>

On Tue, Apr 02, 2024 at 12:52:10PM +0200, Niklas Cassel wrote:
> On Mon, Apr 01, 2024 at 09:20:29PM +0530, Manivannan Sadhasivam wrote:
> > core_init() callback is used to notify the EPC initialization event to the
> > EPF drivers. The 'core' prefix was used indicate that the controller IP
> > core has completed initialization. But it serves no purpose as the EPF
> > driver will only care about the EPC initialization as a whole and there is
> > no real benefit to distinguish the IP core part.
> > 
> > So let's rename the core_init() callback in 'struct pci_epc_event_ops' to
> > just init() to make it more clear.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  drivers/pci/endpoint/functions/pci-epf-mhi.c  |  4 ++--
> >  drivers/pci/endpoint/functions/pci-epf-test.c |  4 ++--
> >  drivers/pci/endpoint/pci-epc-core.c           | 16 ++++++++--------
> >  include/linux/pci-epf.h                       |  4 ++--
> >  4 files changed, 14 insertions(+), 14 deletions(-)
> > 
> > diff --git a/drivers/pci/endpoint/functions/pci-epf-mhi.c b/drivers/pci/endpoint/functions/pci-epf-mhi.c
> > index 280863c0eeb9..b3c26ffd29a5 100644
> > --- a/drivers/pci/endpoint/functions/pci-epf-mhi.c
> > +++ b/drivers/pci/endpoint/functions/pci-epf-mhi.c
> > @@ -716,7 +716,7 @@ static void pci_epf_mhi_dma_deinit(struct pci_epf_mhi *epf_mhi)
> >  	epf_mhi->dma_chan_rx = NULL;
> >  }
> >  
> > -static int pci_epf_mhi_core_init(struct pci_epf *epf)
> > +static int pci_epf_mhi_epc_init(struct pci_epf *epf)
> >  {
> >  	struct pci_epf_mhi *epf_mhi = epf_get_drvdata(epf);
> >  	const struct pci_epf_mhi_ep_info *info = epf_mhi->info;
> > @@ -897,7 +897,7 @@ static void pci_epf_mhi_unbind(struct pci_epf *epf)
> >  }
> >  
> >  static const struct pci_epc_event_ops pci_epf_mhi_epc_event_ops = {
> > -	.core_init = pci_epf_mhi_core_init,
> > +	.init = pci_epf_mhi_epc_init,
> >  };
> >  
> >  static const struct pci_epc_bus_event_ops pci_epf_mhi_bus_event_ops = {
> > diff --git a/drivers/pci/endpoint/functions/pci-epf-test.c b/drivers/pci/endpoint/functions/pci-epf-test.c
> > index 973db0b1bde2..abcb6ca61c4e 100644
> > --- a/drivers/pci/endpoint/functions/pci-epf-test.c
> > +++ b/drivers/pci/endpoint/functions/pci-epf-test.c
> > @@ -731,7 +731,7 @@ static int pci_epf_test_set_bar(struct pci_epf *epf)
> >  	return 0;
> >  }
> >  
> > -static int pci_epf_test_core_init(struct pci_epf *epf)
> > +static int pci_epf_test_epc_init(struct pci_epf *epf)
> 
> On V1 you agreed that it is better to remove 'epc' from the naming.
> (For both pci-epf-test and pci-epf-mhi).
> You seem to have forgotten to address this for V2.
> 

Oh yeah, sorry about that. I tried to address comments for both series and
apparently this one got missed.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
