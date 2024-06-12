Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4843017F360
	for <mhi@lists.linux.dev>; Wed, 12 Jun 2024 14:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718203921; cv=none; b=KXRphoAcU77pVENXG1PhyRfxqOHsLbqcSlNOjIDH+gSg4FtP/uIb37v22J/J9fnSW3lf6CiHE8hFLlUqcnf4C9ypFcn5c6EIh5mdvxStLyUlGEEc4zpmMN+f5wogxBkttDYT51GVWQXcW6w90zdHuEfdL3PBIUKsaxeXOUpNlDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718203921; c=relaxed/simple;
	bh=AeqMoyy136EGDb0dzZP8XtwJcrC4ZlwbNxyV6GvQdiE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IT+LtJV3vht19hUBSftIUd978t7qTx23U/olLCOVDy4oGKUr2k4+A4V/RzBwOzfkJ24lYwA/G5gGOSTbOk1LLUJeP/aE8UMunCOKwM+IT8JtfgUTX7jRxUpnN54e6veFOTjp5ZH1GVjRmMM5BdrjlwPimRridC+4IC5Ce7fjivo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Bgl86Ykc; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bgl86Ykc"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7046e87e9afso1983236b3a.0
        for <mhi@lists.linux.dev>; Wed, 12 Jun 2024 07:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718203918; x=1718808718; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pdm0MxlnE9mvGLW6dM72J7+DWmReIl//Ic2Mk/zy3V0=;
        b=Bgl86Ykc+cc3ICr6R2YFZ2toP8xnDqYNKY+RTztckMg2cQVXzqWsbO8Z30SxO3Vz4/
         ipYHAFfXs4PBjCBYgsNQ3T432gXsSwiEPYeYMTPWG+VHqRPjaqEohLttNesApUWqO9+3
         rr/ki+jX2Bk2RHSawzSUbZMCuGjyr1pR0vsd8t2+c7++ollHUOhQeQ9910hQQOXq6CZQ
         86i0GoTppWCRBpy2z8GzoO/Ec5Qa/Qsg5O52+SkECzu/926cD5+K5eROoRZtebshA6SL
         lHn8/mpi2kca28aes5EFF/LqCAT3lv/l7rujwAzhdrk1HjpEdepTamApxaUyDAJgZpjx
         kkOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718203918; x=1718808718;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pdm0MxlnE9mvGLW6dM72J7+DWmReIl//Ic2Mk/zy3V0=;
        b=f2yvCAh1Oog6tpS56Fe3xo2Gsga7BV9yQRE+rq1MFRcIot9DXtHzTK/hrlEtzu2c1L
         Nws80ButgvScN4tidu53JUka8V89f2vBIa7aQy5nIVeAuzNgwzkKoFVmsgxRYOl5KRI0
         yWTbZlRv5w9iZS1+koBiOFb86WKWWtSFTk3Xvziyi32bSqxHhwEFqb9uXmMid14Yoyg2
         ImUj2FMkHOm7hvsTAfasUlkNakkO6olmJIsqmcB+PlBV8oUGm4t1O+MpPyinTR6zGfTS
         reBR5b4KBPCbufgaGqXpqqPOvM+O7KZitb/BioALlagvnxDXOUyD3ba00oPIW2fUhiX1
         dcjA==
X-Forwarded-Encrypted: i=1; AJvYcCUdn/p0MmwmjdKQMH1bYGdyi8aFD8AqlhEFhEuJVkNhvOjxhilFFgvkkGrsf3QBlJZwHHAbMFTTQZv6Kw6kQDnBZYot
X-Gm-Message-State: AOJu0YxeMcdIPxELC8hKLc9f0cdo+6dOqvNzokkWpZ4bBhztzY+MZkpI
	svNXCtP8AXUPE8jqW+jtq3BB2X1bb3mE5LvlhgNxBDndWkd+f5IDNkBf26xDnw==
X-Google-Smtp-Source: AGHT+IEEszIpfWjt+j2J+ofzaMw29P0ZLiOqhilxxHJLGEkXkLRKQGtaaf54uh3t5ga5appr/f9iEw==
X-Received: by 2002:a05:6a20:430f:b0:1b7:d050:93e5 with SMTP id adf61e73a8af0-1b8a9b4de5bmr2487914637.15.1718203918415;
        Wed, 12 Jun 2024 07:51:58 -0700 (PDT)
Received: from thinkpad ([120.60.129.29])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c4a76ab1c8sm1863792a91.52.2024.06.12.07.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 07:51:58 -0700 (PDT)
Date: Wed, 12 Jun 2024 20:21:47 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: Slark Xiao <slark_xiao@163.com>, loic.poulain@linaro.org,
	ryazanov.s.a@gmail.com, johannes@sipsolutions.net,
	netdev@vger.kernel.org, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] bus: mhi: host: Import mux_id item
Message-ID: <20240612145147.GB58302@thinkpad>
References: <20240612093842.359805-1-slark_xiao@163.com>
 <20240612094609.GA58302@thinkpad>
 <87aecf24-cdbb-70d2-a3d1-8d1cacf18401@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87aecf24-cdbb-70d2-a3d1-8d1cacf18401@quicinc.com>

On Wed, Jun 12, 2024 at 08:19:13AM -0600, Jeffrey Hugo wrote:
> On 6/12/2024 3:46 AM, Manivannan Sadhasivam wrote:
> > On Wed, Jun 12, 2024 at 05:38:42PM +0800, Slark Xiao wrote:
> > 
> > Subject could be improved:
> > 
> > bus: mhi: host: Add configurable mux_id for MBIM mode
> > 
> > > For SDX72 MBIM mode, it starts data mux id from 112 instead of 0.
> > > This would lead to device can't ping outside successfully.
> > > Also MBIM side would report "bad packet session (112)".
> > > So we add a default mux_id value for SDX72. And this value
> > > would be transferred to wwan mbim side.
> > > 
> > > Signed-off-by: Slark Xiao <slark_xiao@163.com>
> > > ---
> > >   drivers/bus/mhi/host/pci_generic.c | 3 +++
> > >   include/linux/mhi.h                | 2 ++
> > >   2 files changed, 5 insertions(+)
> > > 
> > > diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> > > index 0b483c7c76a1..9e9adf8320d2 100644
> > > --- a/drivers/bus/mhi/host/pci_generic.c
> > > +++ b/drivers/bus/mhi/host/pci_generic.c
> > > @@ -53,6 +53,7 @@ struct mhi_pci_dev_info {
> > >   	unsigned int dma_data_width;
> > >   	unsigned int mru_default;
> > >   	bool sideband_wake;
> > > +	unsigned int mux_id;
> > >   };
> > >   #define MHI_CHANNEL_CONFIG_UL(ch_num, ch_name, el_count, ev_ring) \
> > > @@ -469,6 +470,7 @@ static const struct mhi_pci_dev_info mhi_foxconn_sdx72_info = {
> > >   	.dma_data_width = 32,
> > >   	.mru_default = 32768,
> > >   	.sideband_wake = false,
> > > +	.mux_id = 112,
> > >   };
> > >   static const struct mhi_channel_config mhi_mv3x_channels[] = {
> > > @@ -1035,6 +1037,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> > >   	mhi_cntrl->runtime_get = mhi_pci_runtime_get;
> > >   	mhi_cntrl->runtime_put = mhi_pci_runtime_put;
> > >   	mhi_cntrl->mru = info->mru_default;
> > > +	mhi_cntrl->link_id = info->mux_id;
> > 
> > Again, 'link_id' is just a WWAN term. Use 'mux_id' here also.
> 
> Does this really belong in MHI?  If this was DT, I don't think we would put
> this value in DT, but rather have the driver (MBIM) detect the device and
> code in the required value.
> 

I believe this is a modem value rather than MHI. But I was OK with keeping it in
MHI driver since we kind of keep modem specific config.

But if WWAN can detect the device and apply the config, I'm all over it.

- Mani

> Furthermore, if this is included in MHI, it seems to be a property of the
> channel, and not the controller.
> 
> -Jeff

-- 
மணிவண்ணன் சதாசிவம்
