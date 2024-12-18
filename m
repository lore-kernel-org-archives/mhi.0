Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306091A2399
	for <mhi@lists.linux.dev>; Wed, 18 Dec 2024 12:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734525028; cv=none; b=JmDU6rwUzI/ctxRsKiYCLLaMkkw7c/Zx/dpMSarO3meGlJsVrv7XWVjmnwS0tIxb+RzGqJPlVtQ9iR1o2cCBZJ6zIgddYa5LAD1AiUww8KoFNpVfgliHsVJs5RXONm5UcOE4Tl2uh984L/JHxESR3z8moCIk+11OVV4PlC9jwMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734525028; c=relaxed/simple;
	bh=sIokGkGvk5wEoau7cfzmPpCeUIVZzmYqS6W9pDT1pms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b3BOwAB5Hzwj534fVd3+YNGJoSVTfgtXTqqc4SeMYO30yFx1n7B+CIJPmh8xV+5/aT/pueWk+1BagPQuGdPFcDcTyedmeRHU+HhBcD0sSlS2440L7dDChsJ4n/zJGbh3/9eNuxFU36GlHTE5zuhzPzJMFQaVZmDshAbGm4zakZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UfJ3xcty; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UfJ3xcty"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-725ee6f56b4so5623201b3a.3
        for <mhi@lists.linux.dev>; Wed, 18 Dec 2024 04:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734525026; x=1735129826; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6F5mcTldZa7iY872IZQ2vfT0jCbEuXcj2mSPu9gsXzc=;
        b=UfJ3xcty2ty693L/1GoAoaT6iU/LlkHiTY0/T0BBIc/jCvzOl3p3ty5zQ693KuYLBJ
         E0Jd5OERA4fGycvEh3dPA+RHhuEfhl+LlJ+lXz9cKcf11bglEZePrbZmqgbKvEW7LPCR
         dOAbPg2RLVjw+jVgP9vgq52Cbicu6MD7G10VtHMThYpF45n4yP6Scl+kcWj7CEDtTuXt
         nOsdWEcvuik6z+uouMwwCQ+RlP8e5rpZok0AcLqr/FUEdUE2Pn9aqequv/7Blw9CB/Li
         0MExJznN1hm1s8MgRbZudCDLq4XiI302MY9ZEqPu+1K3WYrvy9Q/qGCUjoMBzvRxwpD5
         H5GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734525026; x=1735129826;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6F5mcTldZa7iY872IZQ2vfT0jCbEuXcj2mSPu9gsXzc=;
        b=BfPhPxWpKBXFK0O3Qe73BjEO3r0iSY9fUp5zkUNKrtxviAKuZLYMoHN1HqMoTSXOTr
         GDPGQ2PeVQZn+RC6mB9liexWNRyHaIrwi66oMvYLwm9ICUYhSkt6uFOao6KD5lmP9SUX
         yt3Mr+kwy78k92fRImLTTC/0RdTSPY+9h3E3yl/tAWh9SYqQ8F0iYGNzfU318eSBzow3
         bxz+XU4t4Opvj1VCNvwHwmzaxKh4xzXQDI6/8+OCSEVrxnH4TOmmPt2Liq9cbKiD/Aot
         7E7fIO7VXOIx4AYMueaL3prkVNzpJzTfDKmtOMxXfbqCwUh5h6li3imNI4oJaCg4EpfA
         l8JQ==
X-Gm-Message-State: AOJu0Yy/ymYxxDMsVOGfBYA0UsASM7wH+xAl36PvOLrfmlS+6XiBmMev
	Ky+NsFlYCN9Sms1QrTAsgSAXTuuUNIsTGbBB4uQ6b3XtdRBtopXq7HoxnRR6gg==
X-Gm-Gg: ASbGncsyT6rEFSiKM3zA+76Nla5WleqWucBJ6Evtpccsus2pgGonVR2vyrogHIRYfa/
	6X9gnI7WGU/YwkBe1OlBs1IHBwA/VCgmj0GCWVi+888upwg2Bim0/oD1reT9n5Ovrr6WOqf+DNt
	9bnDpwCoag2+JLJlV389KGrC5AT4NuX7/ecCQRavJ++tv7JDofrZeQsjdP7oxqn7y0vBQXN/MsW
	yLF1fwCwGU/GRrc0GOP9Xq0ptyAtExorzXCeDZQudpIeCPypJ7dhM7LehSU4d5aAtOo
X-Google-Smtp-Source: AGHT+IEVCTF8u4ejkks/VblnJMBrY/RN2wVeVg8W2IFUErI8HUe0PMrVjMwp1C2jnmKDGR2tk1cBMA==
X-Received: by 2002:a05:6a00:180b:b0:728:e27c:a9bc with SMTP id d2e1a72fcca58-72a8d237723mr3199997b3a.7.1734525026308;
        Wed, 18 Dec 2024 04:30:26 -0800 (PST)
Received: from thinkpad ([117.213.97.217])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-801d5ae9fe6sm7377693a12.49.2024.12.18.04.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 04:30:25 -0800 (PST)
Date: Wed, 18 Dec 2024 18:00:19 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Loic Poulain <loic.poulain@linaro.org>
Subject: Re: mhi resume failure on reboot with 6.13-rc2
Message-ID: <20241218123019.py57s4r3takm2fs6@thinkpad>
References: <Z1me8iaK7cwgjL92@hovoldconsulting.com>
 <20241211145315.vaf7gbapieywcvau@thinkpad>
 <Z1mp3_ArzL-GLr3D@hovoldconsulting.com>
 <20241216074021.kwoid2747o7piquv@thinkpad>
 <Z2ApCU3DAxKS7Y9k@hovoldconsulting.com>
 <20241216141303.2zr5klbgua55agkx@thinkpad>
 <Z2KKjWY2mPen6GPL@hovoldconsulting.com>
 <20241218113830.efflnkxz7qu24xux@thinkpad>
 <Z2K53-As8w4IH06U@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z2K53-As8w4IH06U@hovoldconsulting.com>

On Wed, Dec 18, 2024 at 01:02:39PM +0100, Johan Hovold wrote:
> On Wed, Dec 18, 2024 at 05:08:30PM +0530, Manivannan Sadhasivam wrote:
> > On Wed, Dec 18, 2024 at 09:40:45AM +0100, Johan Hovold wrote:
> 
> > > I've tracked down the hang to a deadlock on the parent device lock.
> > > 
> > > Driver core takes the parent device lock before calling shutdown(), and
> > > then mhi_pci_shutdown() waits indefinitely for the recovery thread to
> > > finish.
> 
> > Thanks for tracking the deadlock. I think we should use pci_try_reset_function()
> > instead of pci_reset_function() in mhi_pci_recovery_work().
> > 
> > If the pci_dev_lock() is already taken, it will return with -EAGAIN and we do
> > not need to worry in that case since the host is going to be powered off anyway
> > (and so the device).
> 
> That may work. But note that I've now also seen this deadlock during
> suspend (i.e. when the device is not going away). The
> pci_try_reset_function() should avoid the deadlock here too, but we'll
> end up in funny state.
> 

Hopefully, recovery_work() started by mhi_pci_runtime_resume() would be able to
reset the device.

> Now I'd also like to know why I'm suddenly seeing these runtime PM
> resume errors of this modem. Haven't seen them before 6.13-rc, and I'm
> not sure that it's really the firmware that is crashing left and right
> all of a sudden.
> 

Yeah, that's worth the effort. I'll go ahead with the patch since the issue is
present anyway.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
