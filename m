Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4481826B2A5
	for <mhi@lists.linux.dev>; Fri, 18 Apr 2025 08:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744965390; cv=none; b=kvddfKHyK14VRp6PypeJHVmIuK96fBzVIHz3x7LvphNjmcX7kPE0YOBJJ7ucgtPrNdt3aewlJZxyDRJYOEnnZTZuZJ+573LnGT2XufUg7I3a2il7Dp64JlAdtjqI7J2AJhUdD+gh2JiJkxA1hOE3xk2PRgm1UWAYWY9lRcsHxHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744965390; c=relaxed/simple;
	bh=LUkyc/BgQX9YR/2tc5k3KKNPguD1blkucYPDKasBHFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a7olgDaVstkhSXVYkgHfYCH882cRYtm9Y2pA8c1lXw2VS2y8rkBAzkyl5s/MaA2DZI/wacglM4GBfsEjoCJf1zrZcFxs/bXaRk3NxcmcK2N5wMayAvfze0ezy/SMvNnDTDjQrCFbyhJw9z5wzE892MpoFbmiHuUaH1JNMqFHEk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f1rjJJKZ; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f1rjJJKZ"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22622ddcc35so25688645ad.2
        for <mhi@lists.linux.dev>; Fri, 18 Apr 2025 01:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744965388; x=1745570188; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tsPJ7r05GCU8U5IpYvKGSTH/BPi5kWm5knrn6+oWvqM=;
        b=f1rjJJKZttYcFq1/088F6LH+27iOznwurEYz8ftUsB47Bf/JDPZAzj9JpAQZQ6502L
         McwE8j7/WzLZ5O433Ulkih/ZpxH9XR+0UKQounoucKc85Uv779ntgnW8YHqjU79XkAfM
         TOfNmbLTsK0BW+D6GCjZLEZ3y3k4Bz1/96TpWw0iC1z8S+EY73nSaaUjk55vunKxCZhg
         bnqsx+GalxARvc7KaUB4JUpsdtHPirvchFJc7eRS2LMPDdEgmaWyJMz2cJ9F4A4MJC56
         RIwiZ+dsAzXT+wkhRfR6FP1a3yIcEoo41y22atJog8PWSiRsN/Ud36iM1Vw1cEFdttVc
         wZ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744965388; x=1745570188;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tsPJ7r05GCU8U5IpYvKGSTH/BPi5kWm5knrn6+oWvqM=;
        b=i39jyJm56tKPp/zF+lss90R9ySwVh3DblvDYHaiQs1+qrtD2efBvqm5AW/H+YfsZq5
         RPc1aNlaWO1Zk+5n2qf73BF49731LoFStumbCab7tLKl4rYvGNSW1e1napAFDz6ga0QN
         VnjKFzc5Ul0KlaTYfO6+n5IQfz2Rh2+LFmCOImZ1S7NbTA9C1RZZEf1zmlNXY2L7HjXB
         3tKXZ8Z8Ay0gBNoIkuNQXFPZropgN0bpf7vRMNuHrs32EfyceydSxCjqfqcaq31/vf7v
         uVoZUB883g7Um8nAU6mE6ofWl9m8XqEj3sWhQu00OTIrj236Z1uGWYcqoWdLcmAPgIuL
         CKLA==
X-Forwarded-Encrypted: i=1; AJvYcCWOeLjUzbHWazewn1x85Luolm1ObwvbwUT+FWRbQ+288mGRK+w0wsyNlYSRVB+kTpaBa28=@lists.linux.dev
X-Gm-Message-State: AOJu0YwMRJMdEs/hn+9IGNdX+/xR7ZeuybF03pORoa6tLdDWFKIUnNVc
	FibQM+rYPAMbCNISrnFWDNOvM/u8dz/HUSgr1xEXF4oWGxnmzICzkfhrHXsKoQ==
X-Gm-Gg: ASbGncthRfVPPkQdS2eGO9nhVDvkeSdbxC4raKOTmbKxFVXehmKH8fCuY/KbKsz95V3
	0qHzvYwN/+PhfaD8EpTdCw6ggYUZ1D2RLkuNZFcur8i9paQ4n+ErM4QwZ2/MTZZe0T270aYCbZH
	xl69OT5zsWpTN/yGaoQcY5r/+9Mz7QbxKfL8PiRTZi3X68YoXGEnkcbnqZ9fkIHajo0HcK7ZEeL
	1jmF27kQsH2FocEAettsa0ef9fE9KsXhGITCZ9p8/RAMPjOPzxN2UKPsjcnGtp2T6OuDY+ELm3c
	kI9XzvKN5Q2/Mk3oJXxDL4unHLLtyqgPvbl/awquRz2g9/OlhQ==
X-Google-Smtp-Source: AGHT+IFLyewdVLNunGSr5XLsO/KxZg8Iz7L/FhZpjjgmaKyjexZSMUlGGQgBTl9NsTgGtdYk/Ywm+Q==
X-Received: by 2002:a17:903:24c:b0:224:1074:63a0 with SMTP id d9443c01a7336-22c53619da7mr24538145ad.34.1744965388315;
        Fri, 18 Apr 2025 01:36:28 -0700 (PDT)
Received: from thinkpad ([36.255.17.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb4622sm12135005ad.108.2025.04.18.01.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 01:36:27 -0700 (PDT)
Date: Fri, 18 Apr 2025 14:06:23 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Vivek Pernamitta <quic_vpernami@quicinc.com>
Cc: Veerabhadrarao Badiganti <quic_vbadigan@quicinc.com>, 
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: host: pci: Disable runtime PM for QDU100
Message-ID: <qrb4ozkj3zxfpo733mf6xf35tetfyekytkty6sq7civhycbahm@c6s3wfvmdycs>
References: <20250414-vdev_next-20250411_pm_disable-v1-1-e963677636ca@quicinc.com>
 <ec99379e-fd54-42b0-a383-8ed212072396@quicinc.com>
 <o7rv3xgg3btaoqjlzfenbfkrp3fuw54cx6zqojclcfslfg3ha4@c3sqaqqdjdjv>
 <c8699f79-54cc-4adb-8047-b37a69e69d96@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c8699f79-54cc-4adb-8047-b37a69e69d96@quicinc.com>

On Fri, Apr 18, 2025 at 11:55:24AM +0530, Vivek Pernamitta wrote:
> 
> 
> On 4/17/2025 11:37 AM, Manivannan Sadhasivam wrote:
> > On Thu, Apr 17, 2025 at 10:00:38AM +0530, Veerabhadrarao Badiganti wrote:
> > > 
> > > On 4/14/2025 1:17 PM, Vivek Pernamitta wrote:
> > > > The QDU100 device does not support the MHI M3 state, necessitating the
> > > > disabling of runtime PM for this device. Since the PCIe core framework
> > > > enables runtime PM by default for all clients, it is essential to disable
> > > > runtime PM if the device does not support Low Power Mode (LPM).
> > > > 

Not true... See below.

> > > > Signed-off-by: Vivek Pernamitta<quic_vpernami@quicinc.com>
> > > > ---
> > > >    drivers/bus/mhi/host/pci_generic.c | 10 ++++++++++
> > > >    1 file changed, 10 insertions(+)
> > > > 
> > > > diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> > > > index 03aa887952098661a488650053a357f883d1559b..a011fd2d48c57cf9d1aec74040153267a206d797 100644
> > > > --- a/drivers/bus/mhi/host/pci_generic.c
> > > > +++ b/drivers/bus/mhi/host/pci_generic.c
> > > > @@ -43,6 +43,7 @@
> > > >     * @mru_default: default MRU size for MBIM network packets
> > > >     * @sideband_wake: Devices using dedicated sideband GPIO for wakeup instead
> > > >     *		   of inband wake support (such as sdx24)
> > > > + * @pm_disable: disables runtime PM (optional)
> > > >     */
> > > >    struct mhi_pci_dev_info {
> > > >    	const struct mhi_controller_config *config;
> > > > @@ -54,6 +55,7 @@ struct mhi_pci_dev_info {
> > > >    	unsigned int dma_data_width;
> > > >    	unsigned int mru_default;
> > > >    	bool sideband_wake;
> > > > +	bool pm_disable;
> > > >    };
> > > >    #define MHI_CHANNEL_CONFIG_UL(ch_num, ch_name, el_count, ev_ring) \
> > > > @@ -295,6 +297,7 @@ static const struct mhi_pci_dev_info mhi_qcom_qdu100_info = {
> > > >    	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> > > >    	.dma_data_width = 32,
> > > >    	.sideband_wake = false,
> > > > +	.pm_disable = true,
> > > 
> > > |no_m3|orno_|m3_support|would be more suitable than|pm_disable|
> > 
> > Yes!
> > 
> > But does the device not supporting M3 only or D3Hot also? If the former, then we
> > should prevent MHI host to enter/exit M3 state in mhi_pm_suspend/ mhi_pm_resume.
> > There is an incentive in allowing D3Hot if the device supports it.
> > 
> > Also, is there a way we could probe M3 support in the device so that we can
> > check it during runtime?
> > 
> > - Mani
> > 
> In QDU100 device does not support M3 state, D3_hot will be supported. As
> QDU100 is an accelerator card which needs high-throughout, LPM needs to
> disabled here. So we are trying to disable runtime PM here, without M3 ,
> D3_hot will not have effect in QDU100.
> Also in MHI we don't have provision to check device M3 capability, so we are
> trying to disable runtime PM here.
> 

Even though PCI core is enabling runtime PM for devices, it also prevents the
devices from getting suspended unless the drivers explicitly asks for it. So
this driver is using autosuspend feature to allow the devices to be suspended
if PME is supported from D3Hot.

If you want to prevent the device from getting runtime suspended, you should
just skip autosuspend.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
