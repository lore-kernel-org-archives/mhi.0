Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFAC522612
	for <mhi@lists.linux.dev>; Fri, 26 Jul 2024 05:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721970058; cv=none; b=fIKdr8UF1ahXGqgKTBjeN5Augq/fDMqUqK7EVd9CoiNldakijv0h37kFwBJHtV2rN30pWV7f/b/GRgyzAnq63/t/XkAxKyzxmRTjlUEppFNC5Uq+1yxC/wJucFsqosw85/7V9YH9SkWt/MWiuMmwtyHRFwUVNJu/X+BVNT0hCxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721970058; c=relaxed/simple;
	bh=7cQE4DreW0nnWzVtbhS5eHBCqO/8IcvYzVFaSAUa610=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aVL8e9pPdABk7V6XbQjyfpmH9pYIVuACx8ojptixnZr3z7KUv+76VbK779VYOQu6suY5ooXJtA8mfz1EtjuWnj88RdTz1t001OLhGrAXItEM20F3GsUFhSk4OAErhQ5ahL5P3VZT+5idQ5nAShtTVZEF6SrL+SYI50ZKHSgJlCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZSKBXRbe; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZSKBXRbe"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1fdd6d81812so2359375ad.1
        for <mhi@lists.linux.dev>; Thu, 25 Jul 2024 22:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721970056; x=1722574856; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XkyPiJ1VWNXyBLLv2Zv2CGX8+twZbAnSoyqpJBWj7kY=;
        b=ZSKBXRbeDSKZOqM6IYjXP7KDgveq3fpOgiheaJawPlfWZz2OP6zFYQKPaYkx6gx5z3
         gI7OOd2L6ilw0ZNbkcOTdXQdsCup7lf/s4sMslkXH6gUFXTWa//RpmAxCTY9+yHz5aJe
         jzE6wK8i2LRGgM7NhQHp9fkKxQxRsCGx/qPLHNUdRAoygRc6a3aHuC9fKaO7cxKnMRke
         FjaiUX2AUuUkRKoEGOLzWa6Irw913/tlY9zQCdrQmqzFOSvGxsXDTnEVvvkTNhxliElK
         7C5FoDvsK9vaVFXaCc4RWSIrb8awvjnJEDtPUEVHbdOwX2PaGNz5JTaVwWrRQOWpPfm6
         yxGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721970056; x=1722574856;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XkyPiJ1VWNXyBLLv2Zv2CGX8+twZbAnSoyqpJBWj7kY=;
        b=OrIPCy15vwu0NX6Whf2xLfhOZoVm9+x49jLqTSTCqKv2/Z/JqkA/Mp2DBolqJrMWSn
         6z3zr97mgWCIUH4NJ++Tp1V0+qMZ7HwKvQGwY19VOgGO4x2ELED+dzAVb0dCLAQKZbLM
         D48mbWAjVRRYRqLzz2u16seqcqaXBEns1D3ubsPWyyWE920GFJ72sVKV36bS1pOVO4/D
         /RDUPaSnPlqkFKMn4GoBE8OLXNsXjcxkzyVNgdkuZmX2Zz3Ne9F9LK6rzTUFm0lcNai8
         cQ32yezSc3a2APuB58IPQ44RrM4nEbLyDCVTLXm4YSVFW/OInRujbD7OzC71gBCpYewC
         uZdw==
X-Gm-Message-State: AOJu0YzIiSt5+ea44NSc04biIUhwu+OhxZlyHS2Z3ZwQpXU1Fz2W6nnW
	TsGSnN9qsN46L+/raw4Z2Z3ODOC5XnX+7MY9sytRmDRpgAlJaQqSGRJnK14Qlg==
X-Google-Smtp-Source: AGHT+IG685Oi881SsTsCjzskaH51WF/ar3f/zBxEFzMJDo1tV0AHf75SMqNnY4nFujlMkdUbHJ5b5g==
X-Received: by 2002:a17:902:cf07:b0:1fa:ab25:f625 with SMTP id d9443c01a7336-1fed92a577cmr51446315ad.38.1721970055988;
        Thu, 25 Jul 2024 22:00:55 -0700 (PDT)
Received: from thinkpad ([220.158.156.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7fcc493sm22682985ad.282.2024.07.25.22.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 22:00:55 -0700 (PDT)
Date: Fri, 26 Jul 2024 10:30:51 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Slark Xiao <slark_xiao@163.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH v2 1/2] bus: mhi: host: pci_generic: Update the file
 path for Foxconn SDX55/SDX72
Message-ID: <20240726050051.GA2628@thinkpad>
References: <20240725022941.65948-1-slark_xiao@163.com>
 <20240725035954.GA2317@thinkpad>
 <6dd00891.8235.190e91ac139.Coremail.slark_xiao@163.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6dd00891.8235.190e91ac139.Coremail.slark_xiao@163.com>

On Thu, Jul 25, 2024 at 04:56:03PM +0800, Slark Xiao wrote:
> 
> At 2024-07-25 11:59:54, "Manivannan Sadhasivam" <manivannan.sadhasivam@linaro.org> wrote:
> >On Thu, Jul 25, 2024 at 10:29:40AM +0800, Slark Xiao wrote:
> >> To separate the images of Foxconn from other vendors, adding a
> >> new foxconn subfolder under qcom/<platform> for edl image path.
> >> And delete the fw patch since it's useless for Foxconn devices.
> >> 
> >> Fixes: bf30a75e6e00 ("bus: mhi: host: Add support for Foxconn SDX72 modems")
> >> Signed-off-by: Slark Xiao <slark_xiao@163.com>
> >> ---
> >> v2: change the folder path architecture
> >> ---
> >>  drivers/bus/mhi/host/pci_generic.c | 13 +++++--------
> >>  1 file changed, 5 insertions(+), 8 deletions(-)
> >> 
> >> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> >> index 14a11880bcea..f159a9dd53e7 100644
> >> --- a/drivers/bus/mhi/host/pci_generic.c
> >> +++ b/drivers/bus/mhi/host/pci_generic.c
> >> @@ -433,8 +433,7 @@ static const struct mhi_controller_config modem_foxconn_sdx72_config = {
> >>  
> >>  static const struct mhi_pci_dev_info mhi_foxconn_sdx55_info = {
> >>  	.name = "foxconn-sdx55",
> >> -	.fw = "qcom/sdx55m/sbl1.mbn",
> >> -	.edl = "qcom/sdx55m/edl.mbn",
> >> +	.edl = "qcom/sdx55m/foxconn/prog_firehose_sdx55.mbn",
> >
> >I think you misunderstood what I suggested in earlier revision. You should add
> >the Foxconn specific fw only if it is different from the qcom one. Is it really
> >different for all these modems? Otherwise, what is the point of adding them?
> >
> >- Mani
> 
> >
> Hi Mani,
> Yes, all programer files are different with default. We add a sign step for each image
> file. That means other vendor's edl image(including Qualcomm) can't be applied for
> Foxconn devices. 
> 

Gotcha. Please include this info in the commit message as people may wonder what
the difference between yours and qcom.

Unrelated question to this patch: Once the EDL is programmed, what are the
images that the user has to flash using Firehose protocol? Is that the full SDK
or just SBL/APPS image?

If so, what is the size of the images?

- Mani

> >>  	.config = &modem_foxconn_sdx55_config,
> >>  	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> >>  	.dma_data_width = 32,
> >> @@ -444,8 +443,7 @@ static const struct mhi_pci_dev_info mhi_foxconn_sdx55_info = {
> >>  
> >>  static const struct mhi_pci_dev_info mhi_foxconn_t99w175_info = {
> >>  	.name = "foxconn-t99w175",
> >> -	.fw = "qcom/sdx55m/sbl1.mbn",
> >> -	.edl = "qcom/sdx55m/edl.mbn",
> >> +	.edl = "qcom/sdx55m/foxconn/prog_firehose_sdx55.mbn",
> >>  	.config = &modem_foxconn_sdx55_config,
> >>  	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> >>  	.dma_data_width = 32,
> >> @@ -455,8 +453,7 @@ static const struct mhi_pci_dev_info mhi_foxconn_t99w175_info = {
> >>  
> >>  static const struct mhi_pci_dev_info mhi_foxconn_dw5930e_info = {
> >>  	.name = "foxconn-dw5930e",
> >> -	.fw = "qcom/sdx55m/sbl1.mbn",
> >> -	.edl = "qcom/sdx55m/edl.mbn",
> >> +	.edl = "qcom/sdx55m/foxconn/prog_firehose_sdx55.mbn",
> >>  	.config = &modem_foxconn_sdx55_config,
> >>  	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> >>  	.dma_data_width = 32,
> >> @@ -502,7 +499,7 @@ static const struct mhi_pci_dev_info mhi_foxconn_dw5932e_info = {
> >>  
> >>  static const struct mhi_pci_dev_info mhi_foxconn_t99w515_info = {
> >>  	.name = "foxconn-t99w515",
> >> -	.edl = "fox/sdx72m/edl.mbn",
> >> +	.edl = "qcom/sdx72m/foxconn/edl.mbn",
> >>  	.edl_trigger = true,
> >>  	.config = &modem_foxconn_sdx72_config,
> >>  	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> >> @@ -513,7 +510,7 @@ static const struct mhi_pci_dev_info mhi_foxconn_t99w515_info = {
> >>  
> >>  static const struct mhi_pci_dev_info mhi_foxconn_dw5934e_info = {
> >>  	.name = "foxconn-dw5934e",
> >> -	.edl = "fox/sdx72m/edl.mbn",
> >> +	.edl = "qcom/sdx72m/foxconn/edl.mbn",
> >>  	.edl_trigger = true,
> >>  	.config = &modem_foxconn_sdx72_config,
> >>  	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> >> -- 
> >> 2.25.1
> >> 
> >
> >-- 
> >மணிவண்ணன் சதாசிவம்

-- 
மணிவண்ணன் சதாசிவம்
