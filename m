Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC29A4AEE0
	for <mhi@lists.linux.dev>; Wed, 15 May 2024 07:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715759000; cv=none; b=rH63TWLG7TP0t9NXX5hSS76PiLR1yu4OR95PjIo7LrOqIxaKMGszulN0Y351vMPl6s4regUgR9/GoNx78A3ZjNov7E3T0F9vYUuvRNnV2CCBr6J2a87YPWcD24MDa2dOHS0b42hKNXYMXllgpferBKrXWvjDLNoy+L7UFCZ/LAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715759000; c=relaxed/simple;
	bh=E0IGluC5+XgNT11xJ+RtB5dreOvQpxGunKXJku9jkWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fEFGQoXhF4R/K/cE8dtTxMUST7QKqNqDWg9m38BhM9/FJUPntkZpdE3Lrv0ZAy0jmpaH7YRtFQtD7/AjffyGauMtt0e3S6g088nVVYPWnLOQh6eTHRnxfFha3RIKGzEf7QA0GSad8e9QraKFulIsJdC2b/M0JMihgy4qRJ2db8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cdDihHRY; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cdDihHRY"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2e09138a2b1so92901501fa.3
        for <mhi@lists.linux.dev>; Wed, 15 May 2024 00:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715758997; x=1716363797; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YjDBypUekJr0+IQ4Z+KTG8+Tk3A3MRsLN1U8VmTHyxE=;
        b=cdDihHRYlBcr73Brutk16zxohiM9opB9O8AbrsGfz0hbCh9GlPvTANZMMjlacxye4e
         l67gkL4XpElWHLAHmdlvrQxJEHL//57W55mXVIE+JyY70IEKPeUfr7TLexSEQIjDucex
         5uIxCezIPo/GY79fMpE9mYawEXtqYfWDYhuzo15UpRgKnDZClfqZIUorTsmGuZnkuvf/
         yp16DqSitjJcl0GWYoasyHq3yHhtTUzKeyk4N+jbt/oUUTpGWW0XNDv4JtBjTOwVdHGc
         P/9H5dFhlzmTubwDU/ccn11LdwYPiHxD66hGzzopSVDYXViT8yCpj+gQqgpQUzqESfpi
         kjPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715758997; x=1716363797;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YjDBypUekJr0+IQ4Z+KTG8+Tk3A3MRsLN1U8VmTHyxE=;
        b=PYKbuzJWMk5uPXRfnQbrRKOwBsrLJVAa/z255rbMqBbU2NZ8RnpCRcKYco1bP6lNMH
         agbojA27BIHPtUqYOlanWYQqSY2CCiEB3TzwZfwnCbv5od+ptFRoUysqWNjCQfD0kqje
         84N+H6fNDVA/wLOBd1fA0BphSZTTsb8N83MJ+NsMG4xgDujXF5u18Ee80UEJY57/yYS1
         610SS6NP97ZrrKORzBQefi6Keh4vpiiV8wL9+k49nogZtzCVMuW5sC/z4027GCxlMYj8
         4Lepq3lzS0Uh/2Kwaz8xIh7yRBz6URsm6pVnLhq+IcYJXcnKyweM4wTyEJ0JHAw1m45X
         +Bog==
X-Forwarded-Encrypted: i=1; AJvYcCXYFPRhXFxmkYlk+Eo00huA+1EOcWBrf/42i2Pf3PGinneHOKDgD177BhU4ySKOdc5Qa49UDwV1cnqM5oR1RiDq+xiL
X-Gm-Message-State: AOJu0YzewCDbSsjQTZmPpab+IQmpOIRLMpAZCDBNhGh8dgTY5id66m4f
	hR9zB1N9gcxporQ8o60zxWZBMkx20uZ3iT5hmEdA+6HPESkHc5LMpVuUZyz7Ag==
X-Google-Smtp-Source: AGHT+IGNYhZGnS7whMi8D6i33kdHngdHjgTrOicH2QUT098ZecRQ2W92yX+Fz+KdJPd9cb5m4ij6hA==
X-Received: by 2002:a2e:8806:0:b0:2e1:afe7:4cd2 with SMTP id 38308e7fff4ca-2e51fe5273cmr87212431fa.11.1715758996952;
        Wed, 15 May 2024 00:43:16 -0700 (PDT)
Received: from thinkpad ([149.14.240.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccce73f5sm223704565e9.21.2024.05.15.00.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 00:43:16 -0700 (PDT)
Date: Wed, 15 May 2024 09:43:15 +0200
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Slark Xiao <slark_xiao@163.com>
Cc: loic.poulain@linaro.org, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: Re:Re: [PATCH] bus: mhi: host: Add Foxconn SDX72 related support
Message-ID: <20240515074315.GB2445@thinkpad>
References: <20240510032657.789629-1-slark_xiao@163.com>
 <20240514143741.GA2306@thinkpad>
 <541de8e4.1600.18f79de44f3.Coremail.slark_xiao@163.com>
 <fc42977.1ac5.18f79eb945a.Coremail.slark_xiao@163.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fc42977.1ac5.18f79eb945a.Coremail.slark_xiao@163.com>

On Wed, May 15, 2024 at 09:43:53AM +0800, Slark Xiao wrote:
> 
> Send again with text mode.
> At 2024-05-15 09:29:20, "Slark Xiao" <slark_xiao@163.com> wrote:
> >At 2024-05-14 22:37:41, "Manivannan Sadhasivam" <manivannan.sadhasivam@linaro.org> wrote:
> >>On Fri, May 10, 2024 at 11:26:57AM +0800, Slark Xiao wrote:
> >>> Align with Qcom SDX72, add ready timeout item for Foxconn SDX72.
> >>> And also, add firehose support since SDX72.
> >>> 
> >>> Signed-off-by: Slark Xiao <slark_xiao@163.com>
> >>> ---
> >>>  drivers/bus/mhi/host/pci_generic.c | 31 ++++++++++++++++++++++++++++++
> >>>  1 file changed, 31 insertions(+)
> >>> 
> >>> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> >>> index 08844ee79654..0fd94c193fc6 100644
> >>> --- a/drivers/bus/mhi/host/pci_generic.c
> >>> +++ b/drivers/bus/mhi/host/pci_generic.c
> >>> @@ -399,6 +399,8 @@ static const struct mhi_channel_config mhi_foxconn_sdx55_channels[] = {
> >>>  	MHI_CHANNEL_CONFIG_DL(13, "MBIM", 32, 0),
> >>>  	MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
> >>>  	MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
> >>> +	MHI_CHANNEL_CONFIG_UL_FP(34, "FIREHOSE", 32, 0),
> >>> +	MHI_CHANNEL_CONFIG_DL_FP(35, "FIREHOSE", 32, 0),
> >>
> >>This means SDX55 is also supporting FIREHOSE channels, which is not true I
> >>believe.
> >Actually, I just verified it with my sdx55 and the answer is Yes. These channels
> >are common settings for Qcom device which support PCIe mode. BTW, the
> >default settings of Qcom and Quectel support firehose for their sdx55 products.
> >>
> >>>  	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0_MBIM", 128, 2),
> >>>  	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0_MBIM", 128, 3),
> >>>  };
> >>> @@ -419,6 +421,16 @@ static const struct mhi_controller_config modem_foxconn_sdx55_config = {
> >>>  	.event_cfg = mhi_foxconn_sdx55_events,
> >>>  };
> >>>  
> >>> +static const struct mhi_controller_config modem_foxconn_sdx72_config = {
> >>> +	.max_channels = 128,
> >>> +	.timeout_ms = 20000,
> >>> +	.ready_timeout_ms = 50000,
> >>> +	.num_channels = ARRAY_SIZE(mhi_foxconn_sdx55_channels),
> >>> +	.ch_cfg = mhi_foxconn_sdx55_channels,
> >>> +	.num_events = ARRAY_SIZE(mhi_foxconn_sdx55_events),
> >>> +	.event_cfg = mhi_foxconn_sdx55_events,
> >>> +};
> >>> +
> >>>  static const struct mhi_pci_dev_info mhi_foxconn_sdx24_info = {
> >>>  	.name = "foxconn-sdx24",
> >>>  	.config = &modem_foxconn_sdx55_config,
> >>> @@ -448,6 +460,16 @@ static const struct mhi_pci_dev_info mhi_foxconn_sdx65_info = {
> >>>  	.sideband_wake = false,
> >>>  };
> >>>  
> >>> +static const struct mhi_pci_dev_info mhi_foxconn_sdx72_info = {
> >>> +	.name = "foxconn-sdx72",
> >>> +	.edl = "qcom/sdx72m/xbl_s_devprg_ns.melf",
> >>
> >>What is '.melf'? Is the firmware available somewhere? Did you plan to upstream
> >>it to linux-firmware?
> >>
> >This file similar with "edl.mbn". In SDX72 product, the default "edl" file name is
> >"xbl_s_devprg_ns.melf". Currently we don't plan to upstream it to linux-firmware
> >since 2 reasons: 1: we share the same fold name sdx72m with qcom or other vendors
> >2: this file may be changed since sdx72 product still under developing in our side. we
> >may change the base line according to QCOM release.
> >>- Mani
> >>
> And I want to say, the os or driver can't recover device with this "edl" file only. This file
> only used when device needs to be changed to firehose mode. After that, we need
> a tool and a complete firmware package to do the firehose download. Unfortunately,
> there is no open source tool to support this download. Even Qcom PCAT tool only
> supports their own VID/PID with their own driver. So the function of mhi driver is:
> Put device into firehose mode and enumerate the wwan0firehose0 port. The rest
> shall be done by enduser themselves. 

Can't you use QDL tool? https://github.com/linux-msm/qdl

- Mani

-- 
மணிவண்ணன் சதாசிவம்
