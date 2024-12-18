Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2431F0E21
	for <mhi@lists.linux.dev>; Wed, 18 Dec 2024 18:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734546963; cv=none; b=qE0MIIrgABjXp28ZvtnY7IokdTu2yubURppg3OfZG6LmuRnSNOqsHxOPKpkjKrWsjELqQj1xBk6uixj/ByU7qbYqkNjztLkCEFnQUm+tG+zZMXLIbqUELENIMrMqfjypUTr2JewTwrVqceVsenDp5dux+0meOe8tDneuiV3sXYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734546963; c=relaxed/simple;
	bh=H1Aai/I3cMUgqmRzeGvI0h98A1euYUjcp5CSf43av30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EGIqAo/Smd/ex/lGFYAH5I73A0PHhOJ1OvNBDUFrWbjJMTWvmiY2TeVbdcvAobc6r7P1KJGRtvVO0HtD1ClQaHdinI/8LW/kcwd9vWTOVKggsDrM9VLxT0Dp7yWoHkn8HModF/lHfI029KJ3FSDOksNRAgWwGw243qIAy2VR4Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i1zwdfrc; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i1zwdfrc"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21654fdd5daso47855ad.1
        for <mhi@lists.linux.dev>; Wed, 18 Dec 2024 10:36:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734546961; x=1735151761; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9QoqmFThgpYYfz6z8XdmslArNzKFpNPLkZLyt30Nm9Q=;
        b=i1zwdfrcd8C5gt8pBO9aJiq20bqlntHbwNBe9/WChpKI+SNlmpTFf3TyYyjIoRinq4
         zWu6pVfY+jqgvBE/RbGJdipnSfLVWvHwgvFvKCeW9UClIIVEDrF9m4OyL/UrAd6B8kz3
         i/362dP0dyArPJuGXdnc5FiP2ebrSvCUdMhDgcAhnCI8Bw/Ui1s7e3HnAGIrtRxjKszg
         e2nyZiJ7SnKMCFnHd+TvrN8wIWrQXfxeylm+EL6gXFgWiPXggBlCg6Hyzay4iFrdZFoo
         I/NfdjlVr7Z+wES5w/9UlhnTkqR3EZUJkmc7H+dT/ZEREv+SJbl+b478I3tuugkikotb
         wcEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734546961; x=1735151761;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9QoqmFThgpYYfz6z8XdmslArNzKFpNPLkZLyt30Nm9Q=;
        b=jc+7L3fzqMRkmdF9nrvtgP7WsYY0F9vGJTl9Pgmb0jPSIFPSOlz3vzhIK0+e1zFtbC
         l295VbLsA8HibVou2TioBt4JRBokz8jMv+ds5joUYcsnX07DFVPkwwnAdkM+Y/0wgWIe
         qp1ajpIjkE345CoOBmzRMRi4PyVnjlGQ5KcQCJHv96q1u3mhuTHC6pX0XeYGG8vVkwbm
         umQu7LF7QWkVtChRRJUflqXDDAfqc+GeU2VitsvOOgTFOWv4GkORZRf5I4H5+rIHs83a
         SBkWYkBSAyKrpT5zPMdyphuUxu4OrM4/3g5tXMAh4WIuxvA0Qw8QBlozrsKRSMxAC4Qm
         BCoQ==
X-Gm-Message-State: AOJu0YzNc4K0Qfpn81EzJYhVjFXu/k73KjOT4gdpvS3VSspjA3nnmG3I
	1H7/gFP5JgPZnQuueKLNw5fTQcpmAUsOW/mobmNmgjrNJFevaPz5OQe3LOxIdg==
X-Gm-Gg: ASbGnctwIcLccOPp+ZRzM/3D+tUy0Amr7GIZLGf848DboOXssMegp6kVI55rPwX3FRz
	HTEsyHTWp6YtghO4BGbZ0zL0lAHKJUxZZBBuy3IoI4alux6gzIU/Qq1ESgOKwSU7i8AX3l+FaQC
	XNyz00atur9OB60I0lB4Pv+oitZ+mwPv547KcWITHesgzsZEAHoNfyHFPR2Z5+yo6eMFN8uiPM1
	BPG3FRnc85OO1wRNc1100gcgQLp8ogaKbA0E1ruevuVmNo3IqKtMiookmnP+ZkBVI4F
X-Google-Smtp-Source: AGHT+IFx0Y0NES4XTZAx/Y6m34o9Df/LrhxXriUYjPamGfrz7/WYfDVESUdiB5qH/olNqFvYxmIpFw==
X-Received: by 2002:a17:902:f64b:b0:215:9f5a:a236 with SMTP id d9443c01a7336-218d6fc3a62mr57682555ad.6.1734546960758;
        Wed, 18 Dec 2024 10:36:00 -0800 (PST)
Received: from thinkpad ([117.213.97.217])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1d000d9sm79253785ad.0.2024.12.18.10.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 10:36:00 -0800 (PST)
Date: Thu, 19 Dec 2024 00:05:55 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Loic Poulain <loic.poulain@linaro.org>
Subject: Re: mhi resume failure on reboot with 6.13-rc2
Message-ID: <20241218183555.qste4gve7vnvdml2@thinkpad>
References: <20241216074021.kwoid2747o7piquv@thinkpad>
 <Z2ApCU3DAxKS7Y9k@hovoldconsulting.com>
 <20241216141303.2zr5klbgua55agkx@thinkpad>
 <Z2KKjWY2mPen6GPL@hovoldconsulting.com>
 <20241218113830.efflnkxz7qu24xux@thinkpad>
 <Z2K53-As8w4IH06U@hovoldconsulting.com>
 <20241218123019.py57s4r3takm2fs6@thinkpad>
 <Z2LUNo--8YpLO6kD@hovoldconsulting.com>
 <20241218140910.ysovysnvns26vbmd@thinkpad>
 <Z2LbnoSplfVNmNaa@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z2LbnoSplfVNmNaa@hovoldconsulting.com>

On Wed, Dec 18, 2024 at 03:26:38PM +0100, Johan Hovold wrote:
> On Wed, Dec 18, 2024 at 07:39:10PM +0530, Manivannan Sadhasivam wrote:
> > On Wed, Dec 18, 2024 at 02:55:02PM +0100, Johan Hovold wrote:
> > > On Wed, Dec 18, 2024 at 06:00:19PM +0530, Manivannan Sadhasivam wrote:
> > > > On Wed, Dec 18, 2024 at 01:02:39PM +0100, Johan Hovold wrote:
> > > > > On Wed, Dec 18, 2024 at 05:08:30PM +0530, Manivannan Sadhasivam wrote:
> > > > > > On Wed, Dec 18, 2024 at 09:40:45AM +0100, Johan Hovold wrote:
> > > > > 
> > > > > > > I've tracked down the hang to a deadlock on the parent device lock.
> > > > > > > 
> > > > > > > Driver core takes the parent device lock before calling shutdown(), and
> > > > > > > then mhi_pci_shutdown() waits indefinitely for the recovery thread to
> > > > > > > finish.
> > > > > 
> > > > > > Thanks for tracking the deadlock. I think we should use pci_try_reset_function()
> > > > > > instead of pci_reset_function() in mhi_pci_recovery_work().
> > > > > > 
> > > > > > If the pci_dev_lock() is already taken, it will return with -EAGAIN and we do
> > > > > > not need to worry in that case since the host is going to be powered off anyway
> > > > > > (and so the device).
> > > > > 
> > > > > That may work. But note that I've now also seen this deadlock during
> > > > > suspend (i.e. when the device is not going away). The
> > > > > pci_try_reset_function() should avoid the deadlock here too, but we'll
> > > > > end up in funny state.
> > > > 
> > > > Hopefully, recovery_work() started by mhi_pci_runtime_resume() would be able to
> > > > reset the device.
> > > 
> > > But that's not going to happen as that reset is what is currently
> > > causing the deadlock and which would simply be skipped if you switch to
> > > pci_try_reset_function().
> > > 
> > 
> > mhi_pci_runtime_resume() will queue the recovery_work() and return. So I was
> > hoping that by the time pci_try_reset_function() is called, the lock would be
> > available.
> 
> We can't rely on luck with timings, and this is the very reason for the
> deadlock I'm currently seeing (i.e. the recovery thread is still running
> when another thread grabs the lock and waits for the recovery thread to
> finish).
> 
> Perhaps the recovery work should be done synchronously in the resume
> handler to avoid such issues.
> 

Synchronously? How can that help when the recovery_work() cannot acquire the
lock?

Anyhow, even if the lock is not available during resume (worst case), PCI core
should reset the device when it tries to change the state.

I don't know if there is any better solution available.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
