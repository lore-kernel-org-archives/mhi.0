Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA0A44C88
	for <mhi@lists.linux.dev>; Wed, 15 May 2024 07:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715758884; cv=none; b=DPckRtE+wAJS0o029JxxArLun1U4xN9ICUEsaTigqZvNd9pOKzXKqhAArlhERX2xm0uE6DluILBXsbCf3HUJYhZm4vmwNEpTLrvjkWlUELLTVd2mOI/jk1kSVli2JkPO/NZIowNkZ0kBYKSxikRHcUoOcJJj9hvq0desHIOqdxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715758884; c=relaxed/simple;
	bh=RFW3BR0Fx+ilvq56Z5emz/Ta0NJMDiHFx1b3U+5kH5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FHZKX0BBqKrR9qSo1LqgRQj9WYU3NUUZd72ysLLFVdZbyD4ymrkSzylMlXjBz/sIc/xR6on2tVJTZ5VRDtxupsaortxZoGBBrVI77T2/GGw8RNHOEe/EqfbzwlUaFZitlGAd4AWlWIHA//VZ/qrfDcuZGKpwjSAuI7j9EOw2iiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hTvKpiYo; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hTvKpiYo"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-34de61b7ca4so4532076f8f.2
        for <mhi@lists.linux.dev>; Wed, 15 May 2024 00:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715758881; x=1716363681; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3JHt5mzBMB3tfzCLNPXhZ+TCuVkqxJvVqoFszdx1YnQ=;
        b=hTvKpiYotxQvP8Fd4OxUg2kAfxx+vLI2/AnvHeqsMRVcVBBuCtdt+u5UWcud12btxF
         M2xQVUVg6cMXA5X4tMyT/9l0utfqqv5iHWQ4TSTBBFOqx/BS6Oppt0wAhxGykyVq7+sW
         H4R9jzk3ZAL7TMxdNco/pYSsZso7xaj0hAPbWDHyaYdi1CqGpVN+1JIrSC/9Y3YvZKrW
         G5aEUKDr1/olzuTgQhZsfLhmGqjFwVuPbuejpazhLVci/YzC0qXK/7aU+W0mh1YGQKJJ
         X35liJvAVLTk5Mce4SzF7T2RMQZ0oI1iQcVjKC3rGQo3cl3U4jH3exMe376t6bStjTiR
         XWOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715758881; x=1716363681;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3JHt5mzBMB3tfzCLNPXhZ+TCuVkqxJvVqoFszdx1YnQ=;
        b=daa+upGEnxOVaHlP5uNq7bBq+YBBCpSFfJTedLYdxIZfA10l4TGvnFG+lYm5Td3WCN
         IwSWqiDcUhwEiWw6EDrVyEIn0OgurVsIy6Mree4L4HiK/xGKFF9Dnt1aiMLHMwWGCILg
         QcnHtaKVSLCC7fghYr6mpN63rjfcco8+2mncu6pY28Gi9hJ4w1HgefYxRvSzlPIGK4DG
         r5fvQU+7DpxdRdCe4Ng6C7jcFhB7gsH5c2hWptBa/pqLSKXmVIykLthTyAwhHwR9jQyD
         90mwZ8DYELZSaaWmmomIuymUmpek0LRkR7hhb96e9DzFmjNJeulWwH6UvvJtqnQIMnd/
         cpZQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3mtHUuGsaJ9GVMtHoMOhi9v4/ngt6L13dOZiwqChFfcYOrqCDwyVyxbgJF/yrImSXdnz4KxwaK6PW+E2eegEkX27G
X-Gm-Message-State: AOJu0Yz8yKg1XlehoCm3HjpPiDHxJ0Yi11HSOifoSpgWweTnUwQaJLX+
	m2iqwSG6+BxgcOCEpEJvuW/t4q6DNOvb5T17XqIwS8yZ+CkUrUc3kKUZQhhT1A==
X-Google-Smtp-Source: AGHT+IGBVDu0Law5aI1G/S0fHUin98INzJfLX8XCfcsUILHBusKucgtQy7yBdtXwtqjuuDPb4IhRpQ==
X-Received: by 2002:adf:eb49:0:b0:345:816c:6e16 with SMTP id ffacd0b85a97d-3504a632b68mr13926271f8f.25.1715758880897;
        Wed, 15 May 2024 00:41:20 -0700 (PDT)
Received: from thinkpad ([149.14.240.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502b8a78cdsm15608272f8f.58.2024.05.15.00.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 00:41:20 -0700 (PDT)
Date: Wed, 15 May 2024 09:41:19 +0200
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Slark Xiao <slark_xiao@163.com>
Cc: loic.poulain@linaro.org, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_qianyu@quicinc.com
Subject: Re: Re: [PATCH] bus: mhi: host: Add Foxconn SDX72 related support
Message-ID: <20240515074119.GA2445@thinkpad>
References: <20240510032657.789629-1-slark_xiao@163.com>
 <20240514143741.GA2306@thinkpad>
 <541de8e4.1600.18f79de44f3.Coremail.slark_xiao@163.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <541de8e4.1600.18f79de44f3.Coremail.slark_xiao@163.com>

+ Qiang

On Wed, May 15, 2024 at 09:29:20AM +0800, Slark Xiao wrote:
> At 2024-05-14 22:37:41, "Manivannan Sadhasivam" <manivannan.sadhasivam@linaro.org> wrote:
> >On Fri, May 10, 2024 at 11:26:57AM +0800, Slark Xiao wrote:
> >> Align with Qcom SDX72, add ready timeout item for Foxconn SDX72.
> >> And also, add firehose support since SDX72.
> >> 
> >> Signed-off-by: Slark Xiao <slark_xiao@163.com>
> >> ---
> >>  drivers/bus/mhi/host/pci_generic.c | 31 ++++++++++++++++++++++++++++++
> >>  1 file changed, 31 insertions(+)
> >> 
> >> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> >> index 08844ee79654..0fd94c193fc6 100644
> >> --- a/drivers/bus/mhi/host/pci_generic.c
> >> +++ b/drivers/bus/mhi/host/pci_generic.c
> >> @@ -399,6 +399,8 @@ static const struct mhi_channel_config mhi_foxconn_sdx55_channels[] = {
> >>  	MHI_CHANNEL_CONFIG_DL(13, "MBIM", 32, 0),
> >>  	MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
> >>  	MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
> >> +	MHI_CHANNEL_CONFIG_UL_FP(34, "FIREHOSE", 32, 0),
> >> +	MHI_CHANNEL_CONFIG_DL_FP(35, "FIREHOSE", 32, 0),
> >
> >This means SDX55 is also supporting FIREHOSE channels, which is not true I
> >believe.
> Actually, I just verified it with my sdx55 and the answer is Yes. These channels
> are common settings for Qcom device which support PCIe mode. BTW, the
> default settings of Qcom and Quectel support firehose for their sdx55 products.

Qiang, can you please confirm that SDX55 supports FIREHOSE channels?

> >
> >>  	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0_MBIM", 128, 2),
> >>  	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0_MBIM", 128, 3),
> >>  };
> >> @@ -419,6 +421,16 @@ static const struct mhi_controller_config modem_foxconn_sdx55_config = {
> >>  	.event_cfg = mhi_foxconn_sdx55_events,
> >>  };
> >>  
> >> +static const struct mhi_controller_config modem_foxconn_sdx72_config = {
> >> +	.max_channels = 128,
> >> +	.timeout_ms = 20000,
> >> +	.ready_timeout_ms = 50000,
> >> +	.num_channels = ARRAY_SIZE(mhi_foxconn_sdx55_channels),
> >> +	.ch_cfg = mhi_foxconn_sdx55_channels,
> >> +	.num_events = ARRAY_SIZE(mhi_foxconn_sdx55_events),
> >> +	.event_cfg = mhi_foxconn_sdx55_events,
> >> +};
> >> +
> >>  static const struct mhi_pci_dev_info mhi_foxconn_sdx24_info = {
> >>  	.name = "foxconn-sdx24",
> >>  	.config = &modem_foxconn_sdx55_config,
> >> @@ -448,6 +460,16 @@ static const struct mhi_pci_dev_info mhi_foxconn_sdx65_info = {
> >>  	.sideband_wake = false,
> >>  };
> >>  
> >> +static const struct mhi_pci_dev_info mhi_foxconn_sdx72_info = {
> >> +	.name = "foxconn-sdx72",
> >> +	.edl = "qcom/sdx72m/xbl_s_devprg_ns.melf",
> >
> >What is '.melf'? Is the firmware available somewhere? Did you plan to upstream
> >it to linux-firmware?
> >
> This file similar with "edl.mbn". In SDX72 product, the default "edl" file name is
> "xbl_s_devprg_ns.melf". Currently we don't plan to upstream it to linux-firmware
> since 2 reasons: 1: we share the same fold name sdx72m with qcom or other vendors
> 2: this file may be changed since sdx72 product still under developing in our side. we
> may change the base line according to QCOM release.

Then I would ask you to add support when you have a stable firmware. I do not
want to change the firmware name after some time as it will confuse users.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
