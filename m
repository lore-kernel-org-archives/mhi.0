Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE65D7FBA4
	for <mhi@lists.linux.dev>; Tue, 16 Apr 2024 09:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713258951; cv=none; b=Mzf3pfOFdgA7vA31TqhQVEYr8mG0VC0ez6q3GJ9DpsxviayywY3ySGMOa/B6+1S7iLgiFY1bHoUkDIkaiA6VolOigEWDWOZWrsSxvT5v/0ksOF680GgRsH96IjQZKCuqaEBJAEwA6Mv2J6BR1gZfggnX9cv9VaVL7ld8q5A+C0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713258951; c=relaxed/simple;
	bh=opn339ttoq96FjiCnT2o+VV6JFJcSp80Zl/+xFr3kTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZMFTdMjyvP3R0BmO3S+5U0FSLzr04B1aCo5HrHap5ZDOImeWbXL512NY+4vsByZpMth13UCSf8s/3klZgBtB4nI+N1dvlqUwTTz/L5herwncBGhu0riYYxUSoAl7vtccwyh3fciSABfQiG7ZJXUoiHb8NMt9ZKfOXkzzbleVF0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PsNG4mne; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PsNG4mne"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1e5715a9ebdso33230085ad.2
        for <mhi@lists.linux.dev>; Tue, 16 Apr 2024 02:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713258949; x=1713863749; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rk1WQ+3QpO/6QliySx3KZ6AYelQe+QF9yeCh3moO8CY=;
        b=PsNG4mneuxvXhf+1pDXdJ6uLymMp9n2gsjayhiAiNfAWsdyqRRGiFP0lQOxI2f5V/6
         Wr9UU4Oz1yKzQd6BqDKb+kCxFpcLZrKPHRZqWQIStAOIDDIJ89POqlft4ovvFvuGR4Ta
         aB9PniPnU63d2JI25I6EkOIFm5MxDBvNdvjI9a6aL1pQ3YPogjJSkjZoF7subysceU55
         sWjqgnRSBp0FP6gm6OIBVEUYtUIIHTCVFBAV9Jf7efVZSh025XeUaI6z5zxMalKRkD4h
         eOkgfDvfxghybimUYkQBQ12zgS+0KLMd5xj7T8V+9HlBcZhpZwZq+NUedaO44Td3Nda8
         bWng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713258949; x=1713863749;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rk1WQ+3QpO/6QliySx3KZ6AYelQe+QF9yeCh3moO8CY=;
        b=N0wRZiIDsYXX1E/RnqT404awSAbe/MQ2YRAKGhAUEtRz+fm7M3rIQA4XeJe+3A1Po2
         uyL8q8SrD8yv+nAi6WwF7oMVeZD8cqc/+4gzR2Sw6xC3Dsc4y79EXG5pHrbkFfc6Dzd7
         9TEOQpFQQN5mTey7TzbOPDQSpT6wUr7DZxFJKKS2pcUjEeIWWOu1DQQ1jP0rLIYU/HGc
         0dxeI9s19FSUHskLFWyUH9Ldg9j5U49Fs0zdJkp6vg+bFl4sUEzd7XnjaAXOpcOupwEJ
         1J2gozO8y6u/yy4zz85YVGAtKEyE7FN2pAvMgMQ9zdDXUC1hF0CR1cQM03jNS1jFnefH
         gCQg==
X-Forwarded-Encrypted: i=1; AJvYcCXi4O4ms3w1TsgS0xs6p5Hzb+K4xNpdxA5f3FucceF+00XxnLiGvKFcNICR1XT81Kxn53s9HKxwveAvGT+PG2zsWKf1
X-Gm-Message-State: AOJu0Ywy9Hkw0kvNSXrqYSygf0FLhsipf+J/UvhDmmFNx9bYN2Ep8xt/
	Et8PXWqGptK05QZkZaE/qOLp4IJczFYmuYrPjLw3Nhg+g6pR5Ocl9DUm4HAvWw==
X-Google-Smtp-Source: AGHT+IGJRCNlmDxyYYpADaPdST7LOgSRNL4oGeHhdQUfIc//HnzuAijx9v/ViY50hJoABvTNWua86A==
X-Received: by 2002:a17:903:41c9:b0:1e4:8870:7758 with SMTP id u9-20020a17090341c900b001e488707758mr12202867ple.39.1713258948828;
        Tue, 16 Apr 2024 02:15:48 -0700 (PDT)
Received: from thinkpad ([120.56.207.234])
        by smtp.gmail.com with ESMTPSA id u11-20020a170902e5cb00b001e20587b552sm9323787plf.163.2024.04.16.02.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 02:15:48 -0700 (PDT)
Date: Tue, 16 Apr 2024 14:45:42 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Brian Norris <briannorris@chromium.org>, linux-pci@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	mhi@lists.linux.dev, stable@vger.kernel.org,
	Slark Xiao <slark_xiao@163.com>
Subject: Re: [PATCH] PCI: rockchip: Use GPIOD_OUT_LOW flag while requesting
 ep_gpio
Message-ID: <20240416091542.GA2454@thinkpad>
References: <20240416-pci-rockchip-perst-fix-v1-1-4800b1d4d954@linaro.org>
 <Zh4fkbQTh0Z1GNGK@ryzen>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zh4fkbQTh0Z1GNGK@ryzen>

On Tue, Apr 16, 2024 at 08:49:53AM +0200, Niklas Cassel wrote:
> On Tue, Apr 16, 2024 at 11:12:35AM +0530, Manivannan Sadhasivam wrote:
> > Rockchip platforms use 'GPIO_ACTIVE_HIGH' flag in the devicetree definition
> > for ep_gpio. This means, whatever the logical value set by the driver for
> > the ep_gpio, physical line will output the same logic level.
> > 
> > For instance,
> > 
> > 	gpiod_set_value_cansleep(rockchip->ep_gpio, 0); --> Level low
> > 	gpiod_set_value_cansleep(rockchip->ep_gpio, 1); --> Level high
> > 
> > But while requesting the ep_gpio, GPIOD_OUT_HIGH flag is currently used.
> > Now, this also causes the physical line to output 'high' creating trouble
> > for endpoint devices during host reboot.
> > 
> > When host reboot happens, the ep_gpio will initially output 'low' due to
> > the GPIO getting reset to its POR value. Then during host controller probe,
> > it will output 'high' due to GPIOD_OUT_HIGH flag. Then during
> > rockchip_pcie_host_init_port(), it will first output 'low' and then 'high'
> > indicating the completion of controller initialization.
> > 
> > On the endpoint side, each output 'low' of ep_gpio is accounted for PERST#
> > assert and 'high' for PERST# deassert. With the above mentioned flow during
> > host reboot, endpoint will witness below state changes for PERST#:
> > 
> > 	(1) PERST# assert - GPIO POR state
> > 	(2) PERST# deassert - GPIOD_OUT_HIGH while requesting GPIO
> > 	(3) PERST# assert - rockchip_pcie_host_init_port()
> > 	(4) PERST# deassert - rockchip_pcie_host_init_port()
> > 
> > Now the time interval between (2) and (3) is very short as both happen
> > during the driver probe(), and this results in a race in the endpoint.
> > Because, before completing the PERST# deassertion in (2), endpoint got
> > another PERST# assert in (3).
> > 
> > A proper way to fix this issue is to change the GPIOD_OUT_HIGH flag in (2)
> > to GPIOD_OUT_LOW. Because the usual convention is to request the GPIO with
> > a state corresponding to its 'initial/default' value and let the driver
> > change the state of the GPIO when required.
> > 
> > As per that, the ep_gpio should be requested with GPIOD_OUT_LOW as it
> > corresponds to the POR value of '0' (PERST# assert in the endpoint). Then
> > the driver can change the state of the ep_gpio later in
> > rockchip_pcie_host_init_port() as per the initialization sequence.
> > 
> > This fixes the firmware crash issue in Qcom based modems connected to
> > Rockpro64 based board.
> > 
> > Cc:  <stable@vger.kernel.org> # 4.9
> > Reported-by: Slark Xiao <slark_xiao@163.com>
> > Closes: https://lore.kernel.org/mhi/20240402045647.GG2933@thinkpad/
> > Fixes: e77f847df54c ("PCI: rockchip: Add Rockchip PCIe controller support")
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> 
> Reviewed-by: Niklas Cassel <cassel@kernel.org>
> 
> 
> I sent a similar fix for the DWC-based rockchip driver a few weeks ago:
> https://lore.kernel.org/linux-pci/20240327152531.814392-1-cassel@kernel.org/
> 

What a coincidence :)

> If your fix is picked up, it would be nice if mine got picked up as well,
> such that both drivers get fixed.
> 

I can see the same issue in drivers/pci/controller/dwc/pcie-histb.c but the
severity is high in that. The driver assumes that the PERST# polarity is
ACTIVE_LOW while poplar devicetree defines ACTIVE_HIGH [1]. And there is no
external polarity inversion in the PCB.

I don't know if anyone ever validated PCIe on that board. I will check
internally.

But this situation is not ideal IMO. The drivers and DTs are not consistent
w.r.t PERST# and WAKE# handling.

- Mani

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dts#n182

-- 
மணிவண்ணன் சதாசிவம்
