Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F93015A856
	for <mhi@lists.linux.dev>; Wed, 18 Dec 2024 14:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734530958; cv=none; b=o0vu353PX01i8eBAHzrLLHDsIUNEMucmU1ae6Aj/oCvOs0wiIHC4j9cPmb+B/UAo3DznthqB63pU/szR47DhrB91LID0Pdo+sfxbh/cGw1RQaisikHPPkB1lqmroLBRGKKlzRKqnqklBr+aYcgpKTeIwpUg1vCEFPU5h6YZMMTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734530958; c=relaxed/simple;
	bh=ab/BzWY6jox/poZbbozr+CLHkFTcOIWwb6vP6tJ3K78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a/HPv7p+6xxvZZ/AZ/7UUicKTUU0xdQZ+ofBxPZ1ltkxQco2qhcPmcwFtVSHiGtJJBXOLK3h8P76QnJ/hv77ZLjHreDXGZSmIRXGrFv2p1RFi/hkPR7Qvjh2tbAbPBTPoywLi+v8sY/BpE3CRt+Giz+f1S/ajFZe+Ry9vNWP4No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rrjGOOeB; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rrjGOOeB"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-7fd581c2bf4so3988251a12.3
        for <mhi@lists.linux.dev>; Wed, 18 Dec 2024 06:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734530956; x=1735135756; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X/Mv6Gl1ZnKmi5pkQYAmxfhejMR6LdMzdSDhbu9FQsw=;
        b=rrjGOOeBv+gVVf8BJ0rO/KgZmQhLTizzGb+FqnwK7lxvJkkRu0WTZ/L+kplbkkgq4u
         pt6q1hzQcgSHy2u6uJ/914kcltEQasH6F7V+nuUHdaaYgXrTdKusQKOi9kk06xt3pKej
         re1hbxX9JpgRVwAC5FpxsTz7pPlPEoF0V3xnn9F+SbC9dP+hhExbasrNb85oNvpoREu8
         ADjJyefPiyiiH2TrEmjqXGp6gWgkQ5LOK0b1QTWYQumG2FR4buFHX0b42/ILb5p1C6ft
         T+4LVJPLxpFx9SDdAeh+cC4V2GQjjSQDhwckODiL6AZ3nK4Lj7OzRhZv58HuDftpsQPL
         XMdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734530956; x=1735135756;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X/Mv6Gl1ZnKmi5pkQYAmxfhejMR6LdMzdSDhbu9FQsw=;
        b=PfwD496NUFjl+rWR15ALRffhU6RPIvdRn7jcB/Ze2D8pGFZZsKQgFoW7FXWeBna5Od
         Nnl/1hxJPAvUJtLjjLX1X0zo2YFiTP9cGd0x2qFlDtVBYppjYQnWJxl1Rau5ombKKIOK
         13H3ezvgqBf1yl4uYisZ1ouNuJc74Rmgl8zmrVL5c8r9UWfyeRRAJiGOK/by7SUgjvo+
         zAwJoiomD765xJZMAsNrvMSCtsq2LM3lscfz8dkPtnvBBUafaqH5xhQLKNSwq/BnEHZ/
         FUKkf0Y2i7LSHcbH9ErdPI5rBEooBWeKqBN674pPyG19uJXqAkEqYxZS6wXweLN1YVLh
         Pr3A==
X-Gm-Message-State: AOJu0YzQ/jnSd4A6xHlV99fSJlpC56YOoDd8Duy3aGbD80uYNtl+nwa5
	dQC25AxkFw2305nL/MnaUowrjpwhUNe3ivB0pbYzmZelzIKpQBX+niW/DNjzZw==
X-Gm-Gg: ASbGncvdx+74/vbpB4f7w1agWTnXuUmm6dPWcwccrskPqyeoIaB6WsGGPge3x5H/FVG
	ZOhMIKFGZrNCiQE34R7S1+qBYdgn0wgIEVRhSxN17z7rStJBdKzEqQDjBAI8ouCSl0zjVlWq4GG
	mDRMTl9g8etmjfMl97DOPmq9CxxEF/Xd1rtLtHCoyAT2IiAYQ/k1ZUPIT41o9daLqtW+YfRAx0S
	vcIlougaxqBhvKa08BcZCxpEdHxHKRpLocMmVPo29c580L70JkO6Ujo7liF78Dzf63g
X-Google-Smtp-Source: AGHT+IH5xzquXkfFb3lF+nm5lz7tueo/hHvx4LOhJ/KLOsglCvaRpW0x6iDimmd/UdbW7dAmaOMPGQ==
X-Received: by 2002:a17:90b:3508:b0:2ea:2a8d:dd2a with SMTP id 98e67ed59e1d1-2f2e935559cmr4099678a91.27.1734530956490;
        Wed, 18 Dec 2024 06:09:16 -0800 (PST)
Received: from thinkpad ([117.213.97.217])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2eda27344sm1446032a91.34.2024.12.18.06.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 06:09:16 -0800 (PST)
Date: Wed, 18 Dec 2024 19:39:10 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Loic Poulain <loic.poulain@linaro.org>
Subject: Re: mhi resume failure on reboot with 6.13-rc2
Message-ID: <20241218140910.ysovysnvns26vbmd@thinkpad>
References: <20241211145315.vaf7gbapieywcvau@thinkpad>
 <Z1mp3_ArzL-GLr3D@hovoldconsulting.com>
 <20241216074021.kwoid2747o7piquv@thinkpad>
 <Z2ApCU3DAxKS7Y9k@hovoldconsulting.com>
 <20241216141303.2zr5klbgua55agkx@thinkpad>
 <Z2KKjWY2mPen6GPL@hovoldconsulting.com>
 <20241218113830.efflnkxz7qu24xux@thinkpad>
 <Z2K53-As8w4IH06U@hovoldconsulting.com>
 <20241218123019.py57s4r3takm2fs6@thinkpad>
 <Z2LUNo--8YpLO6kD@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z2LUNo--8YpLO6kD@hovoldconsulting.com>

On Wed, Dec 18, 2024 at 02:55:02PM +0100, Johan Hovold wrote:
> On Wed, Dec 18, 2024 at 06:00:19PM +0530, Manivannan Sadhasivam wrote:
> > On Wed, Dec 18, 2024 at 01:02:39PM +0100, Johan Hovold wrote:
> > > On Wed, Dec 18, 2024 at 05:08:30PM +0530, Manivannan Sadhasivam wrote:
> > > > On Wed, Dec 18, 2024 at 09:40:45AM +0100, Johan Hovold wrote:
> > > 
> > > > > I've tracked down the hang to a deadlock on the parent device lock.
> > > > > 
> > > > > Driver core takes the parent device lock before calling shutdown(), and
> > > > > then mhi_pci_shutdown() waits indefinitely for the recovery thread to
> > > > > finish.
> > > 
> > > > Thanks for tracking the deadlock. I think we should use pci_try_reset_function()
> > > > instead of pci_reset_function() in mhi_pci_recovery_work().
> > > > 
> > > > If the pci_dev_lock() is already taken, it will return with -EAGAIN and we do
> > > > not need to worry in that case since the host is going to be powered off anyway
> > > > (and so the device).
> > > 
> > > That may work. But note that I've now also seen this deadlock during
> > > suspend (i.e. when the device is not going away). The
> > > pci_try_reset_function() should avoid the deadlock here too, but we'll
> > > end up in funny state.
> > 
> > Hopefully, recovery_work() started by mhi_pci_runtime_resume() would be able to
> > reset the device.
> 
> But that's not going to happen as that reset is what is currently
> causing the deadlock and which would simply be skipped if you switch to
> pci_try_reset_function().
> 

mhi_pci_runtime_resume() will queue the recovery_work() and return. So I was
hoping that by the time pci_try_reset_function() is called, the lock would be
available.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
