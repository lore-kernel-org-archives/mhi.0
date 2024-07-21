Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455CF256E
	for <mhi@lists.linux.dev>; Sun, 21 Jul 2024 08:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721550784; cv=none; b=WZFg7dqWqGfi2LwWOj7ta8aPWw7DTuG6xaakHh8GDDiBq0uAhUp8a+LGXaTjgJAJIQPBoTbuzuI8d2kR0kBCgpRdrgg1CFt4ZfAUvwA85GYS7ahGBbPn6VaLnrptiHqw45HKLS4OT5m44Mq8gqAa193ed9EZcb57wbKlGt+Ldsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721550784; c=relaxed/simple;
	bh=9uewXnrXpY7pxuB7aklIpnLB2g6VNVg5/kJU1CLHZOM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RWU+Pl5Zd47tWRfAuzCyhTufZq+bjwWOWav0fe7U6860kBIKgslXPH2zCR+ZYf0gXWawzVK8JFDEHdvj2smQxsgl0uHtmlGDX3EP47x49mN5jJ+3lQkTqt3H2QDIZirXxHw7BgRFx/EjG8LG0cvGnP0UiA881V4PNIc+LMnBGTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=flRPwznn; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="flRPwznn"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7037c464792so1857572a34.2
        for <mhi@lists.linux.dev>; Sun, 21 Jul 2024 01:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721550782; x=1722155582; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fM94wxNeJLxXgW83bTJOIrEpy/0FAr9lX8gnpMEd+JE=;
        b=flRPwznn1YZvazbkt8QYfQik7Ve8BwOcvjJx2KmdU8MQRqIwkf8MSyevby4aXaE4Tm
         sCkP41q/2kLHpepHd94Jf8/tO05M7WQxohk6qi/apvGM70H8w2T4BzD6vqkVvTtd2D2/
         sTwqAVz9SBQMOuaxzULJHQzd9FxDVoXWsQz+iIpVm/OUWaGgjYXmH4vxZpRza/9LBT0c
         aNTV1a/e7sQCiWbwKfxYXkcm3QmHgP4jHRTBhvdA83hsnvqAxrC2PlMHjdV3H+VPElSV
         odpaUzsgVqVY+TlFENuGzYnbabGICXLharnoyXL+6DzA5MPtCUM60VJodSygY4lFf7fv
         EMkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721550782; x=1722155582;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fM94wxNeJLxXgW83bTJOIrEpy/0FAr9lX8gnpMEd+JE=;
        b=D9WIrjeJ/6iffzNH61nVdUoywnrTWFgxkYPFgMEKqiuhvrDij08nLUcuocJk5unmno
         sTILWu4UqLMW2rHnNkK7Ah9HGH0IiWrywMZoSSMZGGgRTd+Nen3vFFN8zT0hY0pZkVN+
         TbXpmusn7hTLtLznwi4DR6HQD3C07glJPcisAFYYl0G+YFt3O4X/xKbjanjTtMm80WRG
         F48IbWFhofUBn2qSQ7heRxQBca7Hm8Vn1hVt4NIUdkqsWP2WYTXmujzLI0e2U/NnirMw
         QLN6bJhmS3zwDE2OtcABWvG3RtL6gnaM4CdVsoR1hs7yZMTBCDbZCjjadC0deLOLAqO4
         vC4w==
X-Forwarded-Encrypted: i=1; AJvYcCW5oYygMX98LsdXEc8FBYSZf9Fx+IHsgWxOBSU4+wyMTrxTsUTpaldzc1ybpBsKaQtiUkOcAXgycXorITiJDtHTyWAw
X-Gm-Message-State: AOJu0YydUhILrEJZRM3aFf9lmkFTqEF/YGtQUVhDNAA085wYQ7Dofq6C
	97P0AlzTWmbh4B4BDLu0CLrU+m4PaLTioxXWJh3WZ3vLQq/ZfO4/ZVDi9MX4Lw==
X-Google-Smtp-Source: AGHT+IFFj8jBe6nRrRBGwoYHi36e2dGWFvjwk/si7X8fIhP7hhB2NcPgVHy9uf9nr79PQPUfZEoItg==
X-Received: by 2002:a05:6358:10a2:b0:1a5:bbe2:504f with SMTP id e5c5f4694b2df-1acc5c8397dmr475221955d.25.1721550782254;
        Sun, 21 Jul 2024 01:33:02 -0700 (PDT)
Received: from thinkpad ([120.56.206.118])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f47c828sm32776495ad.276.2024.07.21.01.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jul 2024 01:33:01 -0700 (PDT)
Date: Sun, 21 Jul 2024 14:02:58 +0530
From: "manivannan.sadhasivam" <manivannan.sadhasivam@linaro.org>
To: Johannes Fischer <johannes.fischer@verificationpartners.com>
Cc: Slark Xiao <slark_xiao@163.com>,
	Steven Edwards <steven.edwards@verificationpartners.com>,
	mhi <mhi@lists.linux.dev>
Subject: Re: Linux Kernel 6.6.36 and upstream mhi repo latest: Interface
 definition of sierra_em919x
Message-ID: <20240721083258.GJ1908@thinkpad>
References: <AS2PR03MB90043BBFBCA2E14D2EB62E84E5A62@AS2PR03MB9004.eurprd03.prod.outlook.com>
 <20240712161303.GC3571@thinkpad>
 <716a2414.bcfae.190a7cf2247.Coremail.slark_xiao@163.com>
 <AS2PR03MB90048FCF02A8050A0375045EE5A72@AS2PR03MB9004.eurprd03.prod.outlook.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AS2PR03MB90048FCF02A8050A0375045EE5A72@AS2PR03MB9004.eurprd03.prod.outlook.com>

On Sat, Jul 13, 2024 at 09:33:17AM +0000, Johannes Fischer wrote:
> Hi all,
> @Stark,
> first, I accept that changes may have side impact on other modems.
> Please have in mind that I flashed SWIX55C_03.14.10.04 and the respective generic nvu a few days ago, so I assume to be quite close to default config.
> 
> Using the sierra_em919x config with IP links changed to MBIM in kernel I can establish data traffic; I do not see a component converting the MBIM stream to RMnet in Linux kernel (?). I wonder whether there is positive confirmation about a EM919x working in PCIe mode with the current kernel config, in which mode? (We did not have trouble using the EM919x in USB mode.)
> 
> About GPIO handling, as said there is none for for Full_Card_Power_off# (6, 10k pull-up to 3V3) and RESET# (67, just a C=100nF to GND) on the BPI-R4.
> We have not validated the timing in BPI-R4 with 6.6.36 or current kernel versus the timing diagram at "AirPrime EM919X/EM7690 Product Technical Specification". As you said there may be a corner case that we end up with the Foxconn config due to timing at BPI-R4 power up times.
> 
> I get from your statement, that the valid config should be sierra_em919x, thanks for this clarification.
> 
> @Mani,
> for my understanding: I would be only able to get a MBIM type channel if the channel is configured for IP_HW0_MBIM. If it is configured for IP_HW0 only than it would be plain IP traffic like RMnet. Is this understanding right? - Thanks
> 

Correct.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
