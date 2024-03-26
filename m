Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3715C130AFA
	for <mhi@lists.linux.dev>; Tue, 26 Mar 2024 07:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711439080; cv=none; b=gIYc7VNEtovzNHSOOO+mfV7U1ugP1OadcMWabfZovy4O1vOx4stiTv7LADYDUUa/5RsznTmXwOxzsN0HYFUo+VhN9UrNCgoatkmHtVLHa3CRhE10DLA1bVRE8D1Sw/ig5VthHgl4YPx7WgCEyqK5UgEFp8my/mI06eC1f9484Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711439080; c=relaxed/simple;
	bh=MsrkW69p8rySCRtLMEt7t+ExHfkgy2bgx4K2VLJtRIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sjtloLMi/UAyT+tawBIHypwmSVtgOuv1yNPVzR3bakS6pkhxZ+GtK655q7tjiVh6FvJ68tsfYD0cjn4t1wvszlKNZWbYPVzr6Yx2oXMQUQpVQaC9m0a7CGBr5jSD9MJHDW0WmrvF9dcwqbMdO4Oe7Q2kNr5+k3owKI9VYoySg5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MZ0Y5ONn; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MZ0Y5ONn"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-5c66b093b86so4484648a12.0
        for <mhi@lists.linux.dev>; Tue, 26 Mar 2024 00:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711439077; x=1712043877; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ltBMUKgzn3zhp60fMyljAq7QO/sGMekj2XSf0AJieWY=;
        b=MZ0Y5ONnkWT8S8geOKbiGMzy+L/gr6OQYoGhukATrw53JhqRFcLK+mhXssv32Ky9rB
         xuBd8sBV/1ntgiGTZIPotQp8z3gFh9SMuze5lhE/6103/YWrf3STdJPr7xJFpl6XUvdG
         Oajv4XZyRPJlljvI6SLGOsBp5cW8I03d4ttwx/iWKCjDFsPiyn/Ya15qADbBUTEb1edq
         lxmI4kaFq8cxin5ISV75jVwybTspwSykkp19Li8Zj9Egjxkt4byuvhuCpry6YvRHhAcM
         Ggka6GLwW4U9sPBHOrCc8xKwRlOYCXfO5YkQaHQtk4GGem8C5X0C4fOFfxErrKfYtTZj
         XF/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711439077; x=1712043877;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ltBMUKgzn3zhp60fMyljAq7QO/sGMekj2XSf0AJieWY=;
        b=mY29iPfV//K3C6dgr2bsCo4TtMT6zhiCEDz/f72MEi/MtBB2Qu8HpRWVar3L8ryOSi
         zFk4PvpzRWmA86UpT+iyzqDMEhj9w2ZuHno2dNpGkeuaJsT8G4vQ35jaC6GfOUpuh3/t
         EE5hGuGiOg+4afpaim7KChHjOQcQc8zcakUIJqcRN/LMs1miUt0erRADPv6AQbZpjvfB
         yvAaMW+ggR0NjihZWU09QsyiVfw8BN1kvq8tXgd8erH47PFvTbByjCW42tSPHutIxVKS
         NeMU85ea4UrSVGuCrYhRt9APLQWdI+bHKLKrgJrbBt0et8DCam/RkI0ERILAHqBSyGVy
         Zmcg==
X-Forwarded-Encrypted: i=1; AJvYcCV3gTyoifc1XkGZEnyOTQ4MbU7XJnFF3oHiOhN0/4HqKrHOo9P9uSJObYqBwEfd7NWhO+hQMRIs1LsAJffaw82P0Prf
X-Gm-Message-State: AOJu0YyVlzItFucU6aBJBIS8bzkty78B57o2Wu8mcfLKADVnX9EVWUx3
	RzTLun13tfuHvC/fUlA3E7Ui81uQY/Gw2ByYdNcOaL4sqV7ld6d9cIPul9pAGQ==
X-Google-Smtp-Source: AGHT+IFpNW25eFjP8EzgblCKW0udVOJeCu+1W8FIYLgYCGlpAIzgTkcJLGCCZzYcvI56FkcxZcDtgA==
X-Received: by 2002:a17:90a:ec0d:b0:2a0:61ca:8d8a with SMTP id l13-20020a17090aec0d00b002a061ca8d8amr1054642pjy.6.1711439077214;
        Tue, 26 Mar 2024 00:44:37 -0700 (PDT)
Received: from thinkpad ([117.207.28.168])
        by smtp.gmail.com with ESMTPSA id q67-20020a17090a17c900b0029c5ee381dfsm8460725pja.26.2024.03.26.00.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 00:44:36 -0700 (PDT)
Date: Tue, 26 Mar 2024 13:14:29 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH 01/11] PCI: qcom-ep: Disable resources unconditionally
 during PERST# assert
Message-ID: <20240326074429.GC9565@thinkpad>
References: <20240314-pci-epf-rework-v1-0-6134e6c1d491@linaro.org>
 <20240314-pci-epf-rework-v1-1-6134e6c1d491@linaro.org>
 <Zf2s9kTMlZncldWx@ryzen>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zf2s9kTMlZncldWx@ryzen>

On Fri, Mar 22, 2024 at 05:08:22PM +0100, Niklas Cassel wrote:
> On Thu, Mar 14, 2024 at 08:53:40PM +0530, Manivannan Sadhasivam wrote:
> > All EP specific resources are enabled during PERST# deassert. As a counter
> > operation, all resources should be disabled during PERST# assert. There is
> > no point in skipping that if the link was not enabled.
> > 
> > This will also result in enablement of the resources twice if PERST# got
> > deasserted again. So remove the check from qcom_pcie_perst_assert() and
> > disable all the resources unconditionally.
> > 
> > Fixes: f55fee56a631 ("PCI: qcom-ep: Add Qualcomm PCIe Endpoint controller driver")
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  drivers/pci/controller/dwc/pcie-qcom-ep.c | 6 ------
> >  1 file changed, 6 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> > index 2fb8c15e7a91..50b1635e3cbb 100644
> > --- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
> > +++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> > @@ -500,12 +500,6 @@ static int qcom_pcie_perst_deassert(struct dw_pcie *pci)
> >  static void qcom_pcie_perst_assert(struct dw_pcie *pci)
> >  {
> >  	struct qcom_pcie_ep *pcie_ep = to_pcie_ep(pci);
> > -	struct device *dev = pci->dev;
> > -
> > -	if (pcie_ep->link_status == QCOM_PCIE_EP_LINK_DISABLED) {
> > -		dev_dbg(dev, "Link is already disabled\n");
> > -		return;
> > -	}
> >  
> >  	dw_pcie_ep_cleanup(&pci->ep);
> >  	qcom_pcie_disable_resources(pcie_ep);
> 
> Are you really sure that this is safe?
> 
> I think I remember seeing some splat in dmesg if some clks, or maybe it
> was regulators, got disabled while already being disabled.
> 
> Perhaps you could test it by simply calling:
> qcom_pcie_disable_resources();
> twice here, and see if you see and splat in dmesg.
> 

Calling the disable_resources() function twice will definitely result in the
splat. But here PERST# is level triggered, so I don't see how the EP can see
assert twice.

Am I missing something?

- Mani

-- 
மணிவண்ணன் சதாசிவம்
