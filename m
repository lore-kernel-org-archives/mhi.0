Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E2F1DFE3
	for <mhi@lists.linux.dev>; Fri, 12 Jul 2024 16:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720800791; cv=none; b=vFGqTxupyu7D8/0PFFPb+KOufWgeCK1EVsIV2UB9a6j8oK63WFmdnNolv25BKCgJUOzQzorafN+emq/iYnXNXyU805itJhFet4j0DfAjE4SL0wdsUK9BetYLSmXbABt8e8Ra8xG372PrVnhWV3g63jXqYseDTXufd+PpUAWxhy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720800791; c=relaxed/simple;
	bh=SSvsZBFr3wrD+kQkFKRyA5WflHNhVGi36lxxuV85Yoc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gw0qbZljU5eJTe+eGEijaSizqc8nA7eF1+VsnNR4pfXYixv8KHnBuG6uYTIjkZkd3mCcV0t07FCij0leHi5CJGLIov9R1whJSAuDPh9Hcr7fUWQX7vnvLrMWBKlsHfhZyQpWUnYGawzaWTEFsdOFk7SEIUjk+VAzwqvnGWxK4/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YFgvsJsa; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YFgvsJsa"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1fbcf71d543so16893305ad.1
        for <mhi@lists.linux.dev>; Fri, 12 Jul 2024 09:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720800789; x=1721405589; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zooc7J7NRTIvCJXjNMAR9B14cavow1jTD0QfA89+kv4=;
        b=YFgvsJsaZJ/+mMOMueBAbTWqc6nCj4q1eGGAhJYxN6KOv+EcwP8xAQVDPap0hRVdUe
         o83rYyGNc/n58j2EUK8iJeeQVUWtJChbRn8A9TABggTc2hfOCSfYp02KQH5RE9cwFf8g
         8Y+fPrlKmu1eHGRFAA5sLTX7+3NBQQ/GDPYbeEheYI1C4UZytsrGAuopq0xEOE/UpJ5b
         Lik6phRT3ibt5+btbIGgAOjt1XaqDzTMSnnM8G7fmOfB9OwHCq7t0YL/mixv4+v995sP
         yqhg2c7yJZYtoF2G9ny/c9QP30GTVv2Nyv/5WsaZElVCTThS2qUCrQ4O6XSTggWaq8rx
         M3oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720800789; x=1721405589;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zooc7J7NRTIvCJXjNMAR9B14cavow1jTD0QfA89+kv4=;
        b=AEWTRBwn0fK3FsxRBDQZE4yeTrCfHedulB0bG8ovr6y4eGvDWCq/nosNv71vjuToq2
         tGFThw15O/DRDhC2kYGbrJucQGhsCtwc4hZyyS0VYqeDEbae59Yx36U5lsPKtziEoRXM
         rN+OLsH2lon96iqIGtgIpT1r/p3vELBh7b0xcxvqbwyZQU9Pa9CRY9lSgNPI2/orhSWY
         EDSrdFAllt9DAAfUMsQW7moNJjd0Dc7FCsmHlAkRi+dB+ZWVEnJ16SA6LBv9EgwNCkAF
         acARKILDCrFcPZ5nz2LDSjBeKwyc2Mjetan4tHxOnQTNEvC+Bg+RXgh4LoAcvzWFlBA6
         Bjfw==
X-Forwarded-Encrypted: i=1; AJvYcCXudSs9q3AGv/3yrsZvVAmz5y3wdSc997nH9RgSLigWiFJ4yuKKP1aUeFXrB4Nx7kkK5vvsI0z8rpcm2wbSQkEsra3Q
X-Gm-Message-State: AOJu0Yzv23hlTfjbxqm9LL/9XNJBH931eAh+5mO2Xsg10cLf4RQDqMSL
	uJMqz1ZIM7Tn7ru0gVKs8LPoz4091wR5qdRin3WdfqDXtG7t0feY9+0l0gVKyw==
X-Google-Smtp-Source: AGHT+IFw6iqJQWM11vAxk7G/GbsgRjpd4X+i4Uwdrh8XYSrd5YdWRx+dr+KpYn3IqV9aZHmkr7oVXg==
X-Received: by 2002:a17:903:2349:b0:1fa:8f64:8afd with SMTP id d9443c01a7336-1fbb6ce525cmr92245145ad.11.1720800788634;
        Fri, 12 Jul 2024 09:13:08 -0700 (PDT)
Received: from thinkpad ([120.60.61.81])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fbb6a12ccfsm69264185ad.47.2024.07.12.09.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 09:13:08 -0700 (PDT)
Date: Fri, 12 Jul 2024 21:43:03 +0530
From: "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>
To: Johannes Fischer <johannes.fischer@verificationpartners.com>
Cc: Steven Edwards <steven.edwards@verificationpartners.com>,
	mhi@lists.linux.dev, slark_xiao@163.com
Subject: Re: Linux Kernel  6.6.36 and upstream mhi repo latest: Interface
 definition of sierra_em919x
Message-ID: <20240712161303.GC3571@thinkpad>
References: <AS2PR03MB90043BBFBCA2E14D2EB62E84E5A62@AS2PR03MB9004.eurprd03.prod.outlook.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AS2PR03MB90043BBFBCA2E14D2EB62E84E5A62@AS2PR03MB9004.eurprd03.prod.outlook.com>

+ Slark (Foxconn PoC), MHI list

Hi Johannes,

On Fri, Jul 12, 2024 at 02:57:57PM +0000, Johannes Fischer wrote:
> Hi Mani,
> found you for a maintainer for the MHI package at kernel.org .
> 
> We are building up a BananaPi-R4  openwrt (snapshot) box where we ant to have a SierraWireless EM9191 modem in the M.2 slot being connected via PCIe. First, we had some trouble detecting the SIM, that is solved by isolating the SIM_DET pin on the module, the BPI-R4 has wrong logic on SIM detection contact (in opposite to statement in schematic). The EM9191 runs on almost latest firmware.
> The BPI-R4 has the specialty that FULL_CARD_POWER_OFF# and RESET# are not controlled by GPIO. PCIe Interface PERST is controlled as expected
> After solving this, adding right kernel modules and powering up the box we saw module coming up exposing a "wwan0" network interface and devices for AT, mbim(ctrl) and qxdm.
> We were able to set up traffic using mbim-network and mbim-set-ip script, very manual, no modemmanager or similar.
> After a reboot (or a pci device remove / pci bus rescan in sysfs) the modules showed up differently. We got a network interface named "mhi_hwip0", devices were AT, mbim(ctrl), qmi, qxdm.
> AT/qxdm was accessible, the mbim and qmi channels as well, however we were not able to start traffic by configuring the interface as before.
> 
> Looking at dmesg revealed the lines given below. The module looks to enumerate differently, reason is not known to us.
> 
> <power on>
> root@ROOter:~# dmesg | grep "MHI PCI device found"
> [   12.039259] mhi-pci-generic 0003:01:00.0: MHI PCI device found: foxconn-sdx55
> root@ROOter:~# echo 1 > /sys/bus/pci/devices/0003:01:00.0/remove
> root@ROOter:~# echo 1 > /sys/bus/pci/rescan
> root@ROOter:~# dmesg | grep "MHI PCI device found"
> [   12.039259] mhi-pci-generic 0003:01:00.0: MHI PCI device found: foxconn-sdx55
> [  144.317656] mhi-pci-generic 0003:01:00.0: MHI PCI device found: sierra-em919x
> root@ROOter:~##
> 

I believe the reason for 2 different enumeration behavior is due to the firmware
not detecting the reboot properly. So if your host SoC is not toggling the
PERST# as expected, you will end up seeing these kind of behaviors.

@Slark: Correct me if I'm wrong. Also please share the reboot steps expected by
the firmware.

During PCI remove/rescan, if the driver is unloaded then we just power down the
MHI stack, but don't reset the device. And when the driver is loaded again, it
again powers up the MHI stack. And this means, only the MHI state machine will
be reset. So this should not change the firmware flow. But I don't exactly know
how the firmware behaves. Maybe the firmware gets reset?

@Slark: Again, please share what is the expected behavior of the firmware during
host driver unload/reload.

> With this information I went into pci-generic.c and this showed for the two types of devices
> static const struct mhi_channel_config mhi_foxconn_sdx55_channels[] = {
>                 MHI_CHANNEL_CONFIG_UL(0, "LOOPBACK", 32, 0),
>                 MHI_CHANNEL_CONFIG_DL(1, "LOOPBACK", 32, 0),
>                 MHI_CHANNEL_CONFIG_UL(4, "DIAG", 32, 1),
>                 MHI_CHANNEL_CONFIG_DL(5, "DIAG", 32, 1),
>                 MHI_CHANNEL_CONFIG_UL(12, "MBIM", 32, 0),
>                 MHI_CHANNEL_CONFIG_DL(13, "MBIM", 32, 0),
>                 MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
>                 MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
>                 MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0_MBIM", 128, 2),
>                 MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0_MBIM", 128, 3),
> };
> 
> And
> 
> static const struct mhi_channel_config mhi_sierra_em919x_channels[] = {
>                 MHI_CHANNEL_CONFIG_UL_SBL(2, "SAHARA", 32, 0),
>                 MHI_CHANNEL_CONFIG_DL_SBL(3, "SAHARA", 256, 0),
>                 MHI_CHANNEL_CONFIG_UL(4, "DIAG", 32, 0),
>                 MHI_CHANNEL_CONFIG_DL(5, "DIAG", 32, 0),
>                 MHI_CHANNEL_CONFIG_UL(12, "MBIM", 128, 0),
>                 MHI_CHANNEL_CONFIG_DL(13, "MBIM", 128, 0),
>                 MHI_CHANNEL_CONFIG_UL(14, "QMI", 32, 0),
>                 MHI_CHANNEL_CONFIG_DL(15, "QMI", 32, 0),
>                 MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
>                 MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
>                 MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0", 512, 1),
>                 MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0", 512, 2),
> };
> 
> Here you can see, that the IP channels are configured differently.
> 
> I gave it a try and configure the IP channels for EM919x for MBIM as well.
> This solved the issue, EM9191 enumerates now for "wwan0" as well after restart of the PCIe link by rescan and reboot.
> 
> Th EM9191 is a 5GNR Sub6 module and follow the QC strategy only to expose MBIM for IP connectivity, RMNET and RNDIS are not supported as per documentation.
> 
> My question here would be why this got not reported before, I see a lot of activities ongoing for Foxconn-SDX55 but low for the restart issues. It may be the the missing GPIOs for RESET#/FULL_CARD_POWER_OFF# are special for the BPI-R4 board. We saw for Techship MC201 that these can be directed to GPIO by setting a jumper. Maybe Lenovo laptops etc always invoke RESET# if such modules have to recover.
> 
> Anyway, I think we can live with the change, proposal would be to add this to upstream.  Question is still open, why it enumerates differently.
> 

No, we cannot change the modem config due errantic firmware behavior. This will
affect other modems depending on this config.

Let's hear from Slark first.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
