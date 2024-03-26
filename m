Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7388E125C9
	for <mhi@lists.linux.dev>; Tue, 26 Mar 2024 13:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711461325; cv=none; b=X//8c5VHOzm1RoYKW62C63e8CeL2wvyXxQ7PRLAf/nJH8fY8vwzh0/dLkpck8EQFsPW8wa8ZfGe5fTIkZFEMJv/hJjP9Qf6hEU7WPakD9pD2kZT8vpuv5PklSYS2JErbNHuZV0XyUCOgFtSg+vIYWEb4I5otKtYV0A+M9hs3tBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711461325; c=relaxed/simple;
	bh=g5rSC54oRDFG3++0xhSBEsvKtp7+DPDEaeW7Lwz7adU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NrCP/Pi+2qnkfb8CiTyadKI+hZmxvgCZSmH1LRxCxn95SOdhplcPkeLpw+Solzqr0INKsAf7THWV709EPTZRocrEVOgTqDMbzkMBuBZl0cWAwJ3UeYtBSJqGiPGzUUj7+9nQQhy8Jj7NdqOvrdESkdL5Xn9cdO7Xnhwo2nhhfn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v4Y8oXgc; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v4Y8oXgc"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1e0fa980d55so3618015ad.3
        for <mhi@lists.linux.dev>; Tue, 26 Mar 2024 06:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711461322; x=1712066122; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b1M0Y1XkDNHVcLc0TZz7shYAMA8ewv5L9mN1HcUgUKI=;
        b=v4Y8oXgctZO1y55cxDzRUnjhsvBoGWubmUi/VFDhMXn3yKKEGTECIXeHzlPtFT1ynD
         kr2QQ24YCEIKMEfijN6NxWoo0ttu+MhHs9ACr3Fv875v6Dav6wHMIhPLzRjXKwKJuiUk
         O79U6D4Mq4KUKV0B6o54+vJB+UVitMQEc5ShcHqO4+bJSrgT4r0qlPT5gkbyJZyjHiYn
         XrUzFE8fdICKR/KE2O67EFLsu4lAM6U0l5YJvuK7c+Uiw0xtW1hTj3Wa23hLVHFjdWmb
         o2KFV3YTVVbIMr9HCuyxguBscBv2SiJeQEDNb8iD9ADIJ7L+9yXt8BFxY9xyTqJgJyYC
         2Afg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711461322; x=1712066122;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b1M0Y1XkDNHVcLc0TZz7shYAMA8ewv5L9mN1HcUgUKI=;
        b=EN3KkJgxtA5xpkgBL0Apf1jSXnuunEZzbeyhiGuUEQ5ALbg+VZwNG3pqPH/J5HiHUt
         6QtapKs1e8ARiJampLlP7r+lS6JnpIHko0kAxRjgQvTIBcpyD9fAbZh1P2C7oVgM+jtV
         uWR+Or/6v9ztkJ5HzNOkmTmanuEVSphGa3edsztmOOLXMmZDKnubIhpbr9lcDOt+bWwS
         t09uFKyqaBbzf9rJG37NfwGvzTUNZqDivt626uKjyeTcMXgmnOJ6QDw18OW1C0A69CB6
         UHbQrwbKso7DWvsD4bAq/+Iz6iSdlCK9fOT1wG7/OpFMQIg0OxV8oMt2uzyggOHNS/nC
         68YQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4O5t6HMtKN04Yxbfgy8t+sve0nI1Bv60DvVvzRt9N5UxV9hk4wGfZpj+1g+iUDu/8PGNXvvoNJdRhOu4YW/2xRNq8
X-Gm-Message-State: AOJu0Yy6HVa76Qzqo+poRp+ntWFk1gBNZHsxJ2KcnF/30rQdvom0Mbjq
	f5HvVcDGeL3D/Hw27kbvbtcyWbjGAwsHiqBZzkeZzxcuRZP0aGn4wgTlw1Nvhw==
X-Google-Smtp-Source: AGHT+IHNOqXq6qL+ejk+jw9dkVs1U9l/d19WyMAcSDikAR4pgbYIYUs/kI+YvP7/ptELAWipSgmUOA==
X-Received: by 2002:a17:902:f68a:b0:1e0:a678:5b55 with SMTP id l10-20020a170902f68a00b001e0a6785b55mr1175640plg.11.1711461321584;
        Tue, 26 Mar 2024 06:55:21 -0700 (PDT)
Received: from thinkpad ([117.207.28.168])
        by smtp.gmail.com with ESMTPSA id n1-20020a170902d2c100b001e0c91d448fsm3213867plc.112.2024.03.26.06.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 06:55:21 -0700 (PDT)
Date: Tue, 26 Mar 2024 19:25:14 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH 01/11] PCI: qcom-ep: Disable resources unconditionally
 during PERST# assert
Message-ID: <20240326135514.GB13849@thinkpad>
References: <20240314-pci-epf-rework-v1-0-6134e6c1d491@linaro.org>
 <20240314-pci-epf-rework-v1-1-6134e6c1d491@linaro.org>
 <Zf2s9kTMlZncldWx@ryzen>
 <20240326074429.GC9565@thinkpad>
 <ZgKiUogkgrMwV1uD@x1-carbon>
 <20240326111021.GA13849@thinkpad>
 <ZgLR8jWfBcZB8laa@ryzen>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZgLR8jWfBcZB8laa@ryzen>

On Tue, Mar 26, 2024 at 02:47:30PM +0100, Niklas Cassel wrote:
> On Tue, Mar 26, 2024 at 04:40:21PM +0530, Manivannan Sadhasivam wrote:
> > 
> > I was planning to drop enable_resources() from Qcom driver once the DBI rework
> > series gets merged. Because, the resource enablement during probe is currently
> > done to avoid the crash that is bound to happen if registers are accessed during
> > probe.
> > 
> > But what your observation reveals is that it is possible to get PERST# assert
> > during the EP boot up itself which I was not accounting for. I always assumed
> > that the EP will receive PERST# deassert first. If that is not the case, then
> > this patch needs to be dropped.
> 
> From what I saw when having debug prints from my old email to you:
> https://lore.kernel.org/linux-pci/Zalu%2F%2FdNi5BhZlBU@x1-carbon/
> 
> 
> ## RC side:
> # reboot
> 
> ## EP side
> [  845.606810] pci: PERST asserted by host!
> [  852.483985] pci: PERST de-asserted by host!
> [  852.503041] pci: PERST asserted by host!
> [  852.522375] pci: link up! (LTSSM_STATUS: 0x230011)
> [  852.610318] pci: PERST de-asserted by host!
> 
> 
> 
> So in my case, I assume that the RC asserts PERST during a SoC reset.
> 
> This is obviously from the RC driver asserting PERST + sleep 100 ms +
> PERST deassert:
> [  852.503041] pci: PERST asserted by host!
> [  852.610318] pci: PERST de-asserted by host!
> 
> The two before that:
> [  852.483985] pci: PERST de-asserted by host!
> [  852.503041] pci: PERST asserted by host!
> 
> appears to be because the RC I am using, incorrectly sets the PERST gpio as
> ACTIVE HIGH:
> https://github.com/torvalds/linux/blob/v6.9-rc1/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts#L300
> 
> Well, at least they are bug compatible and sets the output to:
> https://github.com/torvalds/linux/blob/v6.9-rc1/drivers/pci/controller/dwc/pcie-dw-rockchip.c#L170-L184
> 
> 0 and the 1, which, since the DT binding is incorrect, will actually
> do the right thing and assert and the deassert PERST.
> 
> The problem seems to be that the initial flags:
> https://github.com/torvalds/linux/blob/v6.9-rc1/drivers/pci/controller/dwc/pcie-dw-rockchip.c#L242-L243
> is: GPIOD_OUT_HIGH
> 
> which explains why I get the extra:
> [  852.483985] pci: PERST de-asserted by host!
> before
> [  852.503041] pci: PERST asserted by host!
> 
> with basically no time between them..
> 
> 
> I guess I should send a patch to set the initial value to
> GPIOD_OUT_LOW, so that the RC driver does not trigger a
> "spurious" PERST deassertion when requesting the IRQ.
> 
> 
> So I think this patch should be fine if the RC is not buggy,
> but as we can see, in reality there are at least one platform
> in mainline that does manage to get this wrong.
> 

I've validated with x86 and Qcom RCs so far and didn't see this behavior. So I
guess I'll just keep the patch for now.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
