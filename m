Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC0C17A5AD
	for <mhi@lists.linux.dev>; Fri, 26 Jul 2024 11:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721995147; cv=none; b=m9uxc3J7FvFUF3H7ahE0ZLZ0X4DTuyftVvGAbuxHvAnrPQeRToF+G65PyUhvmswKCQfrXGUSHtOlsSiNoQjV3yxVGknQx7ehVdxETBuUliuj3B0OYJ6fI0EQfcWGOXrsOqYDnWaNZtCI8onnnpf1tz+j1JOomvXw05mWn7UQXYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721995147; c=relaxed/simple;
	bh=d9Uvfpm1+olbEQnf22j9NxwOQ6AOvTmVMoe3g2uQjkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CvNJ8jf4zaFm8kGoxgc2JYJdlR0qyKFKxu0mXs/KX8g6Exb1SqHwI1X8blecvSu9suTSwmogxjb0WzkbD/yPyLi5z7ha0VXxJzM8DOnwVtTs50L2OcJRZpogdBiVCspibf3NL2SBCcHseUeOxWpmkFLshx767Df528/tMpyzSUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Rx5EcYtR; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rx5EcYtR"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-70d333d57cdso713467b3a.3
        for <mhi@lists.linux.dev>; Fri, 26 Jul 2024 04:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721995145; x=1722599945; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nCqhXkOq08VRhr8kdRSoPvARZCdTjzCOkLN6nvvCPow=;
        b=Rx5EcYtRyogQTCXuWTzaS8Y0yw8H4ABBsLz+a+n7qpnM2GOImLSedAISx8VGwS4y83
         tjmYKO6AiL9pkuoFdMMd8uTPbNXTeiMqSZS9H9bQVApZGUd/ZgklCBgKfGRqwzp39yjU
         bnRnfgXpbjRxLMDEWWGA82p7kcZBbjV0z6onlBtUiMzZcm9cB46OhcDj+8k3MCszLg3g
         G1OrirkZeFEVQAZcp9EivE1xUJbCOEkf/8ef6KszW10BCIGryTpf9MEbQE++gIqL1nV1
         cMLkurqJqjulwpx7qSyk7qHbmwAhzLJIoApuSDHqaij5cxEBbf5noX+I/UYcFMj2nuxN
         7wMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721995145; x=1722599945;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nCqhXkOq08VRhr8kdRSoPvARZCdTjzCOkLN6nvvCPow=;
        b=Y2cS8fjiHzjxBYg7TIi1ZfKw8Db77d5gcNgKrks5tVDyIHDbeLPky8p0+OwVlaKmQ4
         f1VIR3IBBFi7sE62CgxdcIPzEorNid0LqGPFy33e4dQAsKckapq7e0fq7bR16/DeFG6l
         0YirFS0mjsEpky1TPsIhcWvdlz2PnCSIaxMJ/b9qoOcXwW+DsMYoZCoJCHyxXu511hQv
         P8es6UTo4l+5TNMQVFwUwmpfNi2L7S1IeudGWjj43x1Ii5Qp2AKKbgR9zVX4qdYEPyGi
         LQwQCNRrkbRE5dar5++s1bM4GqhJ8HblzrqEa1oFJmLPYsON2bubOMoM1IrY+v8sGLE0
         FWrw==
X-Gm-Message-State: AOJu0YzfIh3fAaB/jHywugytIqTmzjGNnEqa1kICk7HaTOW9AzAaup13
	9Gj+FTU7n4P0jr3nuE5idch1dRhyqRWNrx/RQY9skCL7wfEYz+LUKoY4d4IMSQ==
X-Google-Smtp-Source: AGHT+IGV4a+dkH6mJm2DjgT8P9LA6fVlC4dy3yiqcdZY6+sD4wOqGT0QDMtCozMzcmIzowYPndTbAA==
X-Received: by 2002:a05:6a20:72ac:b0:1c2:8d16:c684 with SMTP id adf61e73a8af0-1c47b18fa49mr5776244637.21.1721995144742;
        Fri, 26 Jul 2024 04:59:04 -0700 (PDT)
Received: from thinkpad ([2409:40f4:201d:928a:9e8:14a5:7572:42b6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7a9f836ace5sm2658394a12.34.2024.07.26.04.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 04:59:04 -0700 (PDT)
Date: Fri, 26 Jul 2024 17:28:58 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Slark Xiao <slark_xiao@163.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: Re: Re: [PATCH v2 1/2] bus: mhi: host: pci_generic: Update the
 file path for Foxconn SDX55/SDX72
Message-ID: <20240726115858.GG2628@thinkpad>
References: <20240725022941.65948-1-slark_xiao@163.com>
 <20240725035954.GA2317@thinkpad>
 <6dd00891.8235.190e91ac139.Coremail.slark_xiao@163.com>
 <20240726050051.GA2628@thinkpad>
 <5aa442e3.4d45.190ed9bf7c0.Coremail.slark_xiao@163.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5aa442e3.4d45.190ed9bf7c0.Coremail.slark_xiao@163.com>

On Fri, Jul 26, 2024 at 01:55:40PM +0800, Slark Xiao wrote:
> 
> At 2024-07-26 13:00:51, "Manivannan Sadhasivam" <manivannan.sadhasivam@linaro.org> wrote:
> >On Thu, Jul 25, 2024 at 04:56:03PM +0800, Slark Xiao wrote:
> >> 
> >> At 2024-07-25 11:59:54, "Manivannan Sadhasivam" <manivannan.sadhasivam@linaro.org> wrote:
> >> >On Thu, Jul 25, 2024 at 10:29:40AM +0800, Slark Xiao wrote:
> >> >> To separate the images of Foxconn from other vendors, adding a
> >> >> new foxconn subfolder under qcom/<platform> for edl image path.
> >> >> And delete the fw patch since it's useless for Foxconn devices.
> >> >> 
> >> >> Fixes: bf30a75e6e00 ("bus: mhi: host: Add support for Foxconn SDX72 modems")
> >> >> Signed-off-by: Slark Xiao <slark_xiao@163.com>
> >> >> ---
> >> >> v2: change the folder path architecture
> >> >> ---
> >> >>  drivers/bus/mhi/host/pci_generic.c | 13 +++++--------
> >> >>  1 file changed, 5 insertions(+), 8 deletions(-)
> >> >> 
> >> >> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> >> >> index 14a11880bcea..f159a9dd53e7 100644
> >> >> --- a/drivers/bus/mhi/host/pci_generic.c
> >> >> +++ b/drivers/bus/mhi/host/pci_generic.c
> >> >> @@ -433,8 +433,7 @@ static const struct mhi_controller_config modem_foxconn_sdx72_config = {
> >> >>  
> >> >>  static const struct mhi_pci_dev_info mhi_foxconn_sdx55_info = {
> >> >>  	.name = "foxconn-sdx55",
> >> >> -	.fw = "qcom/sdx55m/sbl1.mbn",
> >> >> -	.edl = "qcom/sdx55m/edl.mbn",
> >> >> +	.edl = "qcom/sdx55m/foxconn/prog_firehose_sdx55.mbn",
> >> >
> >> >I think you misunderstood what I suggested in earlier revision. You should add
> >> >the Foxconn specific fw only if it is different from the qcom one. Is it really
> >> >different for all these modems? Otherwise, what is the point of adding them?
> >> >
> >> >- Mani
> >> 
> >> >
> >> Hi Mani,
> >> Yes, all programer files are different with default. We add a sign step for each image
> >> file. That means other vendor's edl image(including Qualcomm) can't be applied for
> >> Foxconn devices. 
> >> 
> >
> >Gotcha. Please include this info in the commit message as people may wonder what
> >the difference between yours and qcom.
> 
> >
> If possible, pelase help me add it into my commit message.
> 

Ok. I can add this while applying.

> 
> >Unrelated question to this patch: Once the EDL is programmed, what are the
> >images that the user has to flash using Firehose protocol? Is that the full SDK
> >or just SBL/APPS image?
> >
> 
> >If so, what is the size of the images?
> 
> 
> This depends on a raw file, let's take SDX65 as an example. The file 
> rawprogram_nand_p4K_b256K.xml contains below items:
> .....
> <erase PAGES_PER_BLOCK="64" SECTOR_SIZE_IN_BYTES="4096" num_partition_sectors="640" start_sector="0"/>
> <program PAGES_PER_BLOCK="64" SECTOR_SIZE_IN_BYTES="4096" filename="xbl.elf.enc" label="sbl" last_sector="639" num_partition_sectors="640" physical_partition_number="0" start_sector="0"/>
> .....
> <erase PAGES_PER_BLOCK="64" SECTOR_SIZE_IN_BYTES="4096" num_partition_sectors="27456" start_sector="16512"/>
>   <program PAGES_PER_BLOCK="64" SECTOR_SIZE_IN_BYTES="4096" filename="NON-HLOS.ubi.enc" label="modem" last_sector="43967" num_partition_sectors="27456" physical_partition_number="0" start_sector="16512"/>
> ...
> 
> 
> This file contains 2 part, "erase" and "program".
> erase will tell the tool to erase the partition from sector x to y.
> And "program" will tell the tool to flash the file into that partion which start from sector m to n.
> 
> 
> So the logical is, full SDK or just one or some partitions are flashed depends on this raw file.
> Normally, full SDK is the main scenario. And the size is about 150MB to 200MB.
> Thanks. 
> 

Okay, thanks. I just wanted to understand what images are getting flashed.

- Mani

> >
> >- Mani
> >
> >> >>  	.config = &modem_foxconn_sdx55_config,
> >> >>  	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> >> >>  	.dma_data_width = 32,
> >> >> @@ -444,8 +443,7 @@ static const struct mhi_pci_dev_info mhi_foxconn_sdx55_info = {
> >> >>  
> >> >>  static const struct mhi_pci_dev_info mhi_foxconn_t99w175_info = {
> >> >>  	.name = "foxconn-t99w175",
> >> >> -	.fw = "qcom/sdx55m/sbl1.mbn",
> >> >> -	.edl = "qcom/sdx55m/edl.mbn",
> >> >> +	.edl = "qcom/sdx55m/foxconn/prog_firehose_sdx55.mbn",
> >> >>  	.config = &modem_foxconn_sdx55_config,
> >> >>  	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> >> >>  	.dma_data_width = 32,
> >> >> @@ -455,8 +453,7 @@ static const struct mhi_pci_dev_info mhi_foxconn_t99w175_info = {
> >> >>  
> >> >>  static const struct mhi_pci_dev_info mhi_foxconn_dw5930e_info = {
> >> >>  	.name = "foxconn-dw5930e",
> >> >> -	.fw = "qcom/sdx55m/sbl1.mbn",
> >> >> -	.edl = "qcom/sdx55m/edl.mbn",
> >> >> +	.edl = "qcom/sdx55m/foxconn/prog_firehose_sdx55.mbn",
> >> >>  	.config = &modem_foxconn_sdx55_config,
> >> >>  	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> >> >>  	.dma_data_width = 32,
> >> >> @@ -502,7 +499,7 @@ static const struct mhi_pci_dev_info mhi_foxconn_dw5932e_info = {
> >> >>  
> >> >>  static const struct mhi_pci_dev_info mhi_foxconn_t99w515_info = {
> >> >>  	.name = "foxconn-t99w515",
> >> >> -	.edl = "fox/sdx72m/edl.mbn",
> >> >> +	.edl = "qcom/sdx72m/foxconn/edl.mbn",
> >> >>  	.edl_trigger = true,
> >> >>  	.config = &modem_foxconn_sdx72_config,
> >> >>  	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> >> >> @@ -513,7 +510,7 @@ static const struct mhi_pci_dev_info mhi_foxconn_t99w515_info = {
> >> >>  
> >> >>  static const struct mhi_pci_dev_info mhi_foxconn_dw5934e_info = {
> >> >>  	.name = "foxconn-dw5934e",
> >> >> -	.edl = "fox/sdx72m/edl.mbn",
> >> >> +	.edl = "qcom/sdx72m/foxconn/edl.mbn",
> >> >>  	.edl_trigger = true,
> >> >>  	.config = &modem_foxconn_sdx72_config,
> >> >>  	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> >> >> -- 
> >> >> 2.25.1
> >> >> 
> >> >
> >> >-- 
> >> >மணிவண்ணன் சதாசிவம்
> >
> >-- 
> >மணிவண்ணன் சதாசிவம்

-- 
மணிவண்ணன் சதாசிவம்
