Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01AB31A29A
	for <mhi@lists.linux.dev>; Fri, 25 Apr 2025 06:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745561361; cv=none; b=JHvnMtE4iXXudf4uwnD2Abv0Yvu9iPzRoqdIr75Di8XZinPNSYLm5Wlpy326gpLtATpzDmK1aE38HBvOhU4GbqfNsq/9fV1tY0siV71uZuo32sg0Vx9chXKHDKghggg/UFm9DpWF1+s7xMLSZlh99zU3IlDnEEu1ptTgRi2OeFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745561361; c=relaxed/simple;
	bh=OijAOo9Q5CJsBUJ8l9gzK744snPLgwe98agm+GWJyO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pv1eJiIyJXzesQf1GMMHXFMlIgWJ7GXi4eC3f0InL9MBCqQZaGiyNTr+EfyMBvQIlhIvBK6K2ZgVxrCZneF9uwoMN1FP4wgeksYlwf0DmwEYHyo4hFrLiILxgh9mfRk4/vCxAPE007wwsoVO1MCcUFg7gvY+5BGu17xVJDUkXs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jRBMwqF1; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jRBMwqF1"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2254e0b4b79so28995875ad.2
        for <mhi@lists.linux.dev>; Thu, 24 Apr 2025 23:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745561359; x=1746166159; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CTBxtNYwG4FufIxSDN1ja9ubj625jFlLyTaq+7EIDtE=;
        b=jRBMwqF1Vkgr1viVchskEbyCYR9DTEyhY2Hv1/fEYDZ0WRSVR51i0/2hY32fz8tB8L
         SpPq9Fk7r8wGrRlfVTKv6wbBhM8jS0H4u50yvJ6mUFvgeH0yojjraFODo4gIix7L3i99
         gYuAdNnQuPk+KQoUEAxavOvfDPK3D5HwsjpWk9O3k9mzKaKxccEfBLkQZ6Z4Hjr/GAIP
         11B9PqYlIR6NK7LNsmkrHx4aNaFMDoR420ERbN/lyeVyRuKDKVvfVAM77k8oO74BRQWU
         Z69UsQHQROd1qn2iIO7GLavrQhipVRrFY8v5Wfobpb6z9pcU3UVQOmV6DSx/2mqSpsUt
         Jkow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745561359; x=1746166159;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CTBxtNYwG4FufIxSDN1ja9ubj625jFlLyTaq+7EIDtE=;
        b=ZUyks7zX7pyKMte5uCCgcBiESnmZmo+esww7SW9O9kTM5BsZz0x2BZj2pdmkN6htf0
         9mNqLKriYAROt6axaSRAMBcVqUtm2EF93eJPSLfgroUdim2CFEYvc654FV4G8a77dhhz
         CX/OFrCgOPhPy/g6Vq1LUxjfLwgAeNJXqSWiw+oTfmFSH4gQ+VRSHRrvORAVVZ3FpUmc
         XcP55QI92MCLpwxan6pIpNcOwBGLw3FXHKsR3+DdBWDYWtYHsx7cL6HQYGXMelp44lKZ
         93zoej+1UayruK19jZ6sNqLg5lrUsY7/jBRSofTuReEL8G0uMqF9FK+IZKTRf2C5bivz
         a9rQ==
X-Gm-Message-State: AOJu0Yzub2Soz/E+Ce9f/p6+nD1HTA+juvKN4DFDO/43h+TXTmMyHQ8j
	lMoSEL/rzNVzBoQaJku8xDXLspUmCTT0POz8oYOtYdLper9pPvGEglVRupLsOQ==
X-Gm-Gg: ASbGnctVXslKhDrCs0PbC1lnhPnDQtk0yeNUmMRzG8VrTaPel6sfUQVLZFTys/6YAwR
	TPzyCLK6EVmjOxlkQKmmnrnBuSipgVL/JgdsDUj84ag7e9GHm/3lN2SOnjwFmw4J367/W8I08gH
	P9EBucvJ29shgB1EG49IZ6DIMMFesxCvb+ut7+JrgikMl3VeAB6I91IA7mKZeAyn7lCK+seUik2
	khyGiuXIYGivslAcHvbRXUQSCWuPWOF2ZNzay/d6SHEA4NFBnTKGOKVTPuxlN2rbxfvV8DAEC0O
	HagX4OYgtgCp2mchMIN0j/+hCp8p/2aBIXB7ZB1CdvupSNClVlc=
X-Google-Smtp-Source: AGHT+IHffJRpHrzYw6qTUhDsUvj23Dzj/PW817a/XxkH9ftqO0o9GllGUMK+/8NzRcptopS8Jpx3YQ==
X-Received: by 2002:a17:902:f745:b0:223:536d:f67b with SMTP id d9443c01a7336-22dbf63a0dbmr22078275ad.38.1745561359213;
        Thu, 24 Apr 2025 23:09:19 -0700 (PDT)
Received: from thinkpad ([120.60.77.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db50e7543sm24228545ad.133.2025.04.24.23.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 23:09:18 -0700 (PDT)
Date: Fri, 25 Apr 2025 11:39:14 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: mhi@lists.linux.dev, lenb@kernel.org, quic_qianyu@quicinc.com
Subject: Re: [bugzilla-daemon@kernel.org: [Bug 220020] mhi kills hibernate:
 Lenovo ThinkPad T16 Gen 3]
Message-ID: <qgdnpqgbwdtdtehyf6m5is7z7g77ci2cvhb5kier7fetn46cce@ts5ogq2gy4ep>
References: <7y4zwx6cuco5mwkx6zqaz5cox5ken2xjhcxmv4zcftkjcekwak@qijscxptonne>
 <96c98cb6-b9df-9b44-3151-98ef4ea7134f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <96c98cb6-b9df-9b44-3151-98ef4ea7134f@oss.qualcomm.com>

On Thu, Apr 24, 2025 at 09:11:55AM +0530, Krishna Chaitanya Chundru wrote:
> 
> 
> On 4/23/2025 6:50 PM, Manivannan Sadhasivam wrote:
> > Hi,
> > 
> > Forwarding the report to MHI list and Qcom folks for visibility.
> > 
> > dmesg log reveals that the WWAN PCIe power is toggled during the 'freeze'
> > process even before mhi_pci_freeze():
> > 
> > [   57.550960] ACPI Debug:  "WWAN _PS3"
> > [   57.551273] ACPI Debug:  "_DSW PCIe"
> > [   57.551413] ACPI Debug:  0x0000000000000007
> > [   57.551559] ACPI Debug:  "PCIE Sx DisWak"
> > [   57.563142] ACPI Debug:  "_PS3 PCIe RP0x7"
> > [   57.563398] ACPI Debug:  "WWAN _OFF WWMT Mutex:Acquired Try Done"
> > [   57.563553] ACPI Debug:  "WWAN _OFF WWMT Mutex:Acquired Done"
> > [   57.563699] ACPI Debug:  "PCIe RP LTSSM at DL23 Start -0x66"
> > [   57.580049] ACPI Debug:  "POF RP 0x7"
> > [   57.580237] ACPI Debug:  "PCIe RP LTSSM at DL23 End -0x48"
> > [   57.580391] ACPI Debug:  "POFF RP 0x7"
> > [   57.580551] ACPI Debug:  "PINH GPIO=0x14040B"
> > [   57.581314] ACPI Debug:  "Calling SPCO method to configure PCIe ClkReq Override"
> > [   57.618093] ACPI Debug:  "PINH GPIO=0x140096"
> > [   57.629350] ACPI Debug:  "TB2F 10"
> > [   57.629515] ACPI Debug:  "WWAN PWR OFF"
> > 
> > <...>
> > 
> > [   57.894452] mhi-pci-generic 0000:08:00.0: PM: calling pci_pm_freeze @ 4473, parent: 0000:00:1c.6
> > 
> > <...>
> > 
> > [   57.894526] ACPI Debug:  "WWAN _ON WWMT Mutex:Acquired Try Done"
> > [   57.894618] ACPI Debug:  "WWAN _ON WWMT Mutex:Acquired Done"
> > 
> > <...>
> > 
> > [   58.000702] ACPI Debug:  "Calling SPCO method to configure PCIe ClkReq Override"
> > [   58.001323] ACPI Debug:  "PINL GPIO=0x141082"
> > [   58.002417] ACPI Debug:  "PCIe RP LTSSM at L23D Start  -0x1"
> > [   58.130941] ACPI Debug:  "WWAN PWR ON"
> > 
> > <...>
> > 
> > [   58.286837] ACPI Debug:  "PINL GPIO=0x14040B"
> > [   58.288245] ACPI Debug:  "PCIe RP LTSSM at L23D Start  -0x48"
> > [   58.338206] ACPI Debug:  "PCIe RP LTSSM at L23D End -0x33"
> > [   58.440299] ACPI Debug:  "SLP TR2P 100"
> > [   58.440784] ACPI Debug:  "WWAN _ON WWMT Mutex:Release Done"
> > [   58.441222] ACPI Debug:  "_PS0 PCIe RP0x7"
> > [   58.454172] ACPI Debug:  "_DSW PCIe"
> > [   58.454463] ACPI Debug:  0x0000000000000007
> > [   58.454737] ACPI Debug:  "PCIE D0 DisWak"
> > [   58.579404] ACPI Debug:  "WWAN _PS0"
> > [   58.579725] ACPI Debug:  "_PS0 LASX Delay Time 0"
> > [   58.580222] mhi mhi0: Resuming from non M3 state (RESET)
> > [   58.580228] mhi-pci-generic 0000:08:00.0: failed to resume device: -22
> > [   58.580262] mhi-pci-generic 0000:08:00.0: device recovery started
> > [   58.580519] wwan wwan0: port wwan0qcdm0 disconnected
> > [   58.581008] wwan wwan0: port wwan0mbim0 disconnected
> > [   58.581356] wwan wwan0: port wwan0at0 disconnected
> > 
> > <...>
> > 
> > [   87.123353] mhi mhi0: Device failed to clear MHI Reset
> > [   87.123753] mhi-pci-generic 0000:08:00.0: PM: pci_pm_freeze returned 0 after 29229292 usecs
> > 
> > And with 'test_resume' I don't see the power getting toggled. There were only
> > 'WWAN _ON' logs. So this might be why 'test_resume' worked.
> > 
> > @Qiang/Krishna: Have you guys seen this issue on any ACPI platform?
> > 
> > - Mani
> > 
> Hi Mani,
> 
> we haven't worked on ACPI platform yet, but as you mentioned
> toggling the wwan power before pci_pm_freeze is causing the
> issue here. As part of pci_pm_freeze the device will be
> runtime resumed and mhi failing in the runtime resume.
> 

It doesn't look like a runtime resume failure to me as there are no logs from
mhi_pm_runtime_resume(). I'm puzzled by the power on logs though:

[   58.595551] mhi mhi0: Requested to power ON
[   58.595564] mhi mhi0: Power on setup success
[   61.443230] mhi mhi0: Wait for device to enter SBL or Mission mode
[   61.523465] mhi mhi0_NMEA: PM: parent mhi0 should not be sleeping --> this is
also a red flag

pci_generic driver tries to power on the device only during probe(), recovery
and reset_done. But there are no evidences of them happening before the power on
logs. Maybe the hibernation is carried out soon after the pci_generic started to
probe()?

@Len: Could you please share the full dmesg log of the failure case? Not just
starting from hibernation. Also can you confirm that you performed hibernation
after the modem comes up?

- Mani

-- 
மணிவண்ணன் சதாசிவம்
