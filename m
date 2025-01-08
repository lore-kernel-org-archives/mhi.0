Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F67A1F8F14
	for <mhi@lists.linux.dev>; Wed,  8 Jan 2025 12:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736340562; cv=none; b=IYiNO8KEWMOKA/Iw4DhnXqzHZYXNp4wDsllaIohmJlX01dUtYSW9enlEF+QkgmbrqulBRJ9f4UCn0RYxt3U4V4LPKGmdrKAR5uRimk/oNyipsnc+f22S1AtAxX+3C5hnV7xP+v3BJLLPaCj51+j7iSbE9JpqYSrgikE2sOVePks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736340562; c=relaxed/simple;
	bh=poSpoPWVxMjpM5jM3gPzh6LWSF45p7xg5JasQjs/93c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VqnriZHIr2ExDuigCAFn9pnCdpQroTqvgp6QxAwOOjRlIevcOwQa1nNzHH0C84oyCvQ8JPII1Szt63edhNjSoR4IbyM96kM0erwrI4GxgfLjekTwIlnv4HZmUQkSpMGJsYitiChW3zgs+PT5zoXO6d/IK+muHrPTIUcevjLyT6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nxnw7XSw; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nxnw7XSw"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2f13acbe29bso1217651a91.1
        for <mhi@lists.linux.dev>; Wed, 08 Jan 2025 04:49:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736340560; x=1736945360; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6NNrevyaBXsAg2aeCPAAcVTXNgTwcz58dYMHb1uQ+vA=;
        b=nxnw7XSw4L2yCSn5ScelMIvqh8Elh7Zd+U6I2gpPg4W3tJm9l9T2N1TVlS1gg1eHHx
         7Feoe5XkmhMkELDo/wK8Hr1PcvDzXXMjjJw6Be9aZ3OwFWWLFhUAw7aLN6pRhpOS/RaF
         zl3J4TGruy+LszLY8i6aOOqA5Id+sWjnITKkBhMxNLr4KzEe41jOIp9ZMsytamiHLU9O
         w66Js3RSqsgU4fOJ/uSUDTouh9FaGaqLNNlDpOjiaIdYYpQTFD6aUbKE1o/XLY0ZMWs/
         jovU4Ra1/gDxkYZE5RLoNNNs5uDqDPydE3BwutZVkYqMGhvYbSf2p91avbAweM+4RiTu
         IdSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736340560; x=1736945360;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6NNrevyaBXsAg2aeCPAAcVTXNgTwcz58dYMHb1uQ+vA=;
        b=kxlY9Fyfta1Qy1OuJPfBxvPoR24F64KhHPMCHzDJP7XYwHKjBACihE6NKIlUsoPPzo
         8XktyFZP0rOu9Q8XR7qKiqODAKRLFmPC33tGshePd/Ef+h7Z0OUQsoGaZcoxO1RWr/5V
         0wuXb2S8Paw227iR+cdaNsypjTDjZMynSAt/fOn4S15USpOZaFQK78jRrTPQ07WR3wdr
         5VSKB0P+6gQITALBEdqafMwm6BobmdnwYNDTPLG+1dK0ucLvUMlzmATdXimyFHWgbwJy
         CaL/rC91R9jve9EOx1/6ocUAw6UxpCjEagSjrVDHUE/pzRvC3ObMCWtJvg9D/8AWvzao
         KynQ==
X-Gm-Message-State: AOJu0Yy4YR40KWv6HohVqAQ50xrNxMyUjz7ezdFsiqZNYyFxdc8SO4DS
	0LdD0HCxya8JjAoMwwenRx+wGvYsUHt81Hlb03sqFyaMUdu9gRxth6AWYFNoyg==
X-Gm-Gg: ASbGncvD/0AFl1fGHp5CrPmN9GeRmthTc8VnVl0IcxQoQuh9qo26vKnUnaJb0HB70NZ
	pPDoSs3dPH1c4UcOg4UVlsFayw61QUj3367JLY21GZ5kKUmhuOYRdgoNCUATcqlQTF5Hxj4mZz1
	B/r5aszkv1+9oItBwO1wHU6e+r77Gv0CXMYzRzuOEHh1ioOha5DHSGwaBXer4DSOxQhZLdDhGic
	UhDQR95X/fQMbxgq6rXMCwkAY0bgWJqFcojv4piW0NX13ooLftvZVc3igePc8vV8up6
X-Google-Smtp-Source: AGHT+IFWK/PR3S3nvHRSyBgo3gPIRzY+MUOAKiqkmj3Dqt+w+3OVvcssxaGIgcq2ILGKfpdUQoFVZg==
X-Received: by 2002:a05:6a00:4296:b0:725:4301:ed5a with SMTP id d2e1a72fcca58-72d2167241bmr4305126b3a.2.1736340559634;
        Wed, 08 Jan 2025 04:49:19 -0800 (PST)
Received: from thinkpad ([117.213.97.234])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8309acsm35014695b3a.45.2025.01.08.04.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 04:49:19 -0800 (PST)
Date: Wed, 8 Jan 2025 18:19:13 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Loic Poulain <loic.poulain@linaro.org>
Subject: Re: mhi resume failure on reboot with 6.13-rc2
Message-ID: <20250108124913.k2p6h4pja2k5vazf@thinkpad>
References: <20241216141303.2zr5klbgua55agkx@thinkpad>
 <Z2KKjWY2mPen6GPL@hovoldconsulting.com>
 <20241218113830.efflnkxz7qu24xux@thinkpad>
 <Z2K53-As8w4IH06U@hovoldconsulting.com>
 <20241218123019.py57s4r3takm2fs6@thinkpad>
 <Z2LUNo--8YpLO6kD@hovoldconsulting.com>
 <20241218140910.ysovysnvns26vbmd@thinkpad>
 <Z2LbnoSplfVNmNaa@hovoldconsulting.com>
 <20241218183555.qste4gve7vnvdml2@thinkpad>
 <Z2PbEPYpqFfrLSJi@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z2PbEPYpqFfrLSJi@hovoldconsulting.com>

On Thu, Dec 19, 2024 at 09:36:32AM +0100, Johan Hovold wrote:
> On Thu, Dec 19, 2024 at 12:05:55AM +0530, Manivannan Sadhasivam wrote:
> > On Wed, Dec 18, 2024 at 03:26:38PM +0100, Johan Hovold wrote:
> > > On Wed, Dec 18, 2024 at 07:39:10PM +0530, Manivannan Sadhasivam wrote:
> > > > On Wed, Dec 18, 2024 at 02:55:02PM +0100, Johan Hovold wrote:
> 
> > > > > But that's not going to happen as that reset is what is currently
> > > > > causing the deadlock and which would simply be skipped if you switch to
> > > > > pci_try_reset_function().
> > > > > 
> > > > 
> > > > mhi_pci_runtime_resume() will queue the recovery_work() and return. So I was
> > > > hoping that by the time pci_try_reset_function() is called, the lock would be
> > > > available.
> > > 
> > > We can't rely on luck with timings, and this is the very reason for the
> > > deadlock I'm currently seeing (i.e. the recovery thread is still running
> > > when another thread grabs the lock and waits for the recovery thread to
> > > finish).
> > > 
> > > Perhaps the recovery work should be done synchronously in the resume
> > > handler to avoid such issues.
> > 
> > Synchronously? How can that help when the recovery_work() cannot acquire the
> > lock?
> 
> During system suspend, pm core waits for any on-going runtime resume
> operations to complete before taking the device lock and suspending the
> device.
> 

Right, but mhi_pci_runtime_resume() is also called from mhi_pci_resume(). So we
cannot safely carry out the recovery_work() synchronously without the
pci_try_reset_function() change.

> Unfortunately, that's currently not the case during shutdown() where
> those operations are reversed, so that would indeed need to be addressed
> first.
> 
> But what the driver is currently doing looks highly questionable as it
> returns success when it failed to resume the device (after scheduling
> the asynchronous recovery work).
> 

I completely agree and this goes against what PM core expects. IMO we need
two fixes, one uses pci_try_reset_function() and another recovers the device
synchronously from mhi_pci_runtime_resume() and passes the return value to PM
core.

Will post the patches.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
