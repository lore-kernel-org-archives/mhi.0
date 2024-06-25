Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6E41482F3
	for <mhi@lists.linux.dev>; Tue, 25 Jun 2024 07:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719301500; cv=none; b=PbDb1XynJ7kvPDdqeN3Kre+0am/5srDZ1NzgvzMj/DsoXrMeGbODZTJVISEoxp7x4dz4HAn2V7jXoCC8qr4Vu7u8eIO3WdKJQrz1Oxl5aiwgCMXDodL/SMnHOWK5IKbCCmib3nl1x9vjFbdpt2e6sr3cJsK3LodfZuKdibfPhqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719301500; c=relaxed/simple;
	bh=BrE/avNcFCb2c2ZQ1R91zUzHnGcGEXFHrlren9ImfBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LMaKS1QTSZSoO07o0XqaoghXAyfy5PBCbQ9EHfBQFL3Tiw3mV5mY/4IGK+KFcuIpVPVHaJs/52STzbLCLsqGu8DN742ZQYqO3rD/j3NUjxlVDVhLFccdIpffZSgioD2qkPAIcvM/DGXQELcs7hcM50p07629ut/jFm37uqKDFPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OEO8jyUv; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OEO8jyUv"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1f9ffd24262so24477275ad.0
        for <mhi@lists.linux.dev>; Tue, 25 Jun 2024 00:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719301497; x=1719906297; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=At0Xj8xgcIEkjWgNW//ghCMG7rYUOwOX+xhLiCV7+BQ=;
        b=OEO8jyUvHynE5PH//hr40gLf48NSSKEplEHoaMMBAmKQcfEQ74rXfGXI6iYOWjyqns
         ZYafcEindOAFbSmEnZ6f+/AkyDwy4tn+XYVWD8ij6emyCqx3jEQMg1h/MyMwX2+yaSiI
         w9z5U0ThZwDUOum9NGCmO/qNAuIssQkQWOkHjLTskP2R1ZgDGXRFtSToFPb0fFyUATPW
         3qqsXuCL809KuMef2a8l31IDDsX/fUUwZOtYr5ARn70TJqJdnCqYLnK+SayN0eCAMKtl
         NKNPcQo75LUu0Y4P2JlzWoVLiy812ptl9FdpSLbhq23BS7dEHS9f/FDuQOjxle+SeQDI
         t7rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719301497; x=1719906297;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=At0Xj8xgcIEkjWgNW//ghCMG7rYUOwOX+xhLiCV7+BQ=;
        b=LSwiGaDoFpshM1m813y9NWC4BiVsjAepviiN8GfyMkxymXleFFTt/psjhIYYP6pEQ9
         dEP9aCfViqNV/oVb3zsaWRhdl3J+XD4ihZyH0z+F6KzBV10ltfahuBpTN7fBu5fblIAw
         n4FmRd5nK+qAJqBwqIdEj6BVwQDiyy0d5i0+EF7o794n5wo5rOP3r/LcLMxZuFKo+rm/
         ap7HiS632LpXNTkyNKK/cB3e9VXxmTRlmwHhpSqvCAXmNAZIfilqItGmBOQjax2ZpboT
         Ev4jgJjmVKf+lIMjNHhACwt5/gFVkUUXHlGW43bX74U+A3DCzg1TCYVaNgFjqeOvQs9N
         rq5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWzaPWDH8AxBS7ClR1fu9/GZOVplHGdVOBb3IgvQz6Cc1FS0HxYmCXg1AKrn4hzBzXC4qpWQrJmmRjA5J2hjSkrofas
X-Gm-Message-State: AOJu0YwAzsagqc3bpj5I73AKWC+Ew5ER2GjxMmdKGtySL0MORmoQKqx/
	S+0+RIlRnktHUkaunjLiIat5e5zQxXpyM993XNhxwq54zTEEM4qgsqY4ruVAQA==
X-Google-Smtp-Source: AGHT+IFY7szsQuaT9s//WTBj2OWQzMRGSJ0i3bT9pBac299YWlDXDVeWQlC+gbq6bn7v8RBl0LeVWA==
X-Received: by 2002:a17:902:d501:b0:1f9:c6e8:2797 with SMTP id d9443c01a7336-1fa2401bdf6mr62806515ad.37.1719301497113;
        Tue, 25 Jun 2024 00:44:57 -0700 (PDT)
Received: from thinkpad ([117.193.213.113])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9ebbb2909sm74615435ad.257.2024.06.25.00.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 00:44:56 -0700 (PDT)
Date: Tue, 25 Jun 2024 13:14:49 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Slark Xiao <slark_xiao@163.com>
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Loic Poulain <loic.poulain@linaro.org>, ryazanov.s.a@gmail.com,
	johannes@sipsolutions.net, netdev@vger.kernel.org,
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: Re: Re: [PATCH v2 1/2] bus: mhi: host: Import mux_id item
Message-ID: <20240625074449.GB2642@thinkpad>
References: <20240612093842.359805-1-slark_xiao@163.com>
 <20240612094609.GA58302@thinkpad>
 <87aecf24-cdbb-70d2-a3d1-8d1cacf18401@quicinc.com>
 <20240612145147.GB58302@thinkpad>
 <CAMZdPi-6GPWkj-wu4_mRucRBWXR03eYXu4vgbjtcns6mr0Yk9A@mail.gmail.com>
 <c275ee49-ac59-058c-7482-c8a92338e7a2@quicinc.com>
 <5055db15.37d8.19038cc602c.Coremail.slark_xiao@163.com>
 <20240623134430.GD58184@thinkpad>
 <6365d9b8.265a.1904d287cfa.Coremail.slark_xiao@163.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6365d9b8.265a.1904d287cfa.Coremail.slark_xiao@163.com>

On Tue, Jun 25, 2024 at 10:10:17AM +0800, Slark Xiao wrote:
> At 2024-06-23 21:44:30, "Manivannan Sadhasivam" <manivannan.sadhasivam@linaro.org> wrote:
> >On Fri, Jun 21, 2024 at 11:17:16AM +0800, Slark Xiao wrote:
> >> 
> >> At 2024-06-14 22:31:03, "Jeffrey Hugo" <quic_jhugo@quicinc.com> wrote:
> >> >On 6/14/2024 4:17 AM, Loic Poulain wrote:
> >> >> On Wed, 12 Jun 2024 at 16:51, Manivannan Sadhasivam
> >> >> <manivannan.sadhasivam@linaro.org> wrote:
> >> >>>
> >> >>> On Wed, Jun 12, 2024 at 08:19:13AM -0600, Jeffrey Hugo wrote:
> >> >>>> On 6/12/2024 3:46 AM, Manivannan Sadhasivam wrote:
> >> >>>>> On Wed, Jun 12, 2024 at 05:38:42PM +0800, Slark Xiao wrote:
> >> >>>>>
> >> >>>>> Subject could be improved:
> >> >>>>>
> >> >>>>> bus: mhi: host: Add configurable mux_id for MBIM mode
> >> >>>>>
> >> >>>>>> For SDX72 MBIM mode, it starts data mux id from 112 instead of 0.
> >> >>>>>> This would lead to device can't ping outside successfully.
> >> >>>>>> Also MBIM side would report "bad packet session (112)".
> >> >>>>>> So we add a default mux_id value for SDX72. And this value
> >> >>>>>> would be transferred to wwan mbim side.
> >> >>>>>>
> >> >>>>>> Signed-off-by: Slark Xiao <slark_xiao@163.com>
> >> >>>>>> ---
> >> >>>>>>    drivers/bus/mhi/host/pci_generic.c | 3 +++
> >> >>>>>>    include/linux/mhi.h                | 2 ++
> >> >>>>>>    2 files changed, 5 insertions(+)
> >> >>>>>>
> >> >>>>>> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> >> >>>>>> index 0b483c7c76a1..9e9adf8320d2 100644
> >> >>>>>> --- a/drivers/bus/mhi/host/pci_generic.c
> >> >>>>>> +++ b/drivers/bus/mhi/host/pci_generic.c
> >> >>>>>> @@ -53,6 +53,7 @@ struct mhi_pci_dev_info {
> >> >>>>>>            unsigned int dma_data_width;
> >> >>>>>>            unsigned int mru_default;
> >> >>>>>>            bool sideband_wake;
> >> >>>>>> + unsigned int mux_id;
> >> >>>>>>    };
> >> >>>>>>    #define MHI_CHANNEL_CONFIG_UL(ch_num, ch_name, el_count, ev_ring) \
> >> >>>>>> @@ -469,6 +470,7 @@ static const struct mhi_pci_dev_info mhi_foxconn_sdx72_info = {
> >> >>>>>>            .dma_data_width = 32,
> >> >>>>>>            .mru_default = 32768,
> >> >>>>>>            .sideband_wake = false,
> >> >>>>>> + .mux_id = 112,
> >> >>>>>>    };
> >> >>>>>>    static const struct mhi_channel_config mhi_mv3x_channels[] = {
> >> >>>>>> @@ -1035,6 +1037,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> >> >>>>>>            mhi_cntrl->runtime_get = mhi_pci_runtime_get;
> >> >>>>>>            mhi_cntrl->runtime_put = mhi_pci_runtime_put;
> >> >>>>>>            mhi_cntrl->mru = info->mru_default;
> >> >>>>>> + mhi_cntrl->link_id = info->mux_id;
> >> >>>>>
> >> >>>>> Again, 'link_id' is just a WWAN term. Use 'mux_id' here also.
> >> >>>>
> >> >>>> Does this really belong in MHI?  If this was DT, I don't think we would put
> >> >>>> this value in DT, but rather have the driver (MBIM) detect the device and
> >> >>>> code in the required value.
> >> >>>>
> >> >>>
> >> >>> I believe this is a modem value rather than MHI. But I was OK with keeping it in
> >> >>> MHI driver since we kind of keep modem specific config.
> >> >>>
> >> >>> But if WWAN can detect the device and apply the config, I'm all over it.
> >> >> 
> >> >> That would require at least some information from the MHI bus for the
> >> >> MBIM driver
> >> >> to make a decision, such as a generic device ID, or quirk flags...
> >> >
> >> >I don't see why.
> >> >
> >> >The "simple" way to do it would be to have the controller define a 
> >> >different channel name, and then have the MBIM driver probe on that. 
> >> >The MBIM driver could attach driver data saying that it needs to have a 
> >> >specific mux_id.
> >> >
> >> >Or, with zero MHI/Controller changes, the MBIM driver could parse the 
> >> >mhi_device struct, get to the struct device, for the underlying device, 
> >> >and extract the PCIe Device ID and match that to a white list of known 
> >> >devices that need this property.
> >> >
> >> >I guess if the controller could attach a private void * to the 
> >> >mhi_device that is opaque to MHI, but allows MBIM to make a decision, 
> >> >that would be ok.  Such a mechanism would be generic, and extensible to 
> >> >other usecases of the same "class".
> >> >
> >> >-Jeff
> >> 
> >> Hi guys,
> >> This patch mainly refer to the feature of mru setting between mhi and wwan side.
> >> We ransfer this value to wwan side if we define it in mhi side, otherwise a default
> >> value would be used in wwan side. Why don't we just align with that?
> >> 
> >
> >Well, the problem is that MRU has nothing to do with MHI. I initially thought
> >that it could fit inside the controller config, but thinking more I agree with
> >Jeff that this doesn't belong to MHI at all.
> >
> >At the same time, I also do not want to extract the PCI info from the client
> >drivers since the underlying transport could change with MHI. So the best
> >solution I can think of is exposing the modem name in 'mhi_controller_config' so
> >that the client drivers can do a match.
> >
> >Please try to implement that.
> >
> >- Mani
> >
> >-- 
> >மணிவண்ணன் சதாசிவம்
> Hi Mani,
> Currently there are many products share a same mhi_controller_config
> settings. For example, all foxconn device use modem_foxconn_sdx55_config.
> But my device may be a SDX24, or SDX72, or even SDX65.  Any other idea?
> 

Hmm, sadly we shouldn't have used the same controller config for all these
devices across different product families. I didn't really paid attention to the
device name which is supposed to be unique (that's my bad).

For instance, because of the controller config reuse, your SDX62 modem would
print:

"MHI PCI device found: foxconn-sdx65"

which clearly is misleading the users...

I've submitted a patch that uses unique product name across the product families
[1]. Please take a look. After this patch, you can use the modem name to
differentiate in client drivers.

- Mani

[1] https://lore.kernel.org/mhi/20240625074148.7412-1-manivannan.sadhasivam@linaro.org/

-- 
மணிவண்ணன் சதாசிவம்
