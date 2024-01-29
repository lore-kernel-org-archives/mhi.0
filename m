Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5F8433CF
	for <mhi@lists.linux.dev>; Mon, 29 Jan 2024 05:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706505635; cv=none; b=duuN0tZXkyoHWP4Fg26g/g0BCwMBIDD/bum+og3SKXcjfd+JJFSHEC2naAaSDjrQHonX+5p+G4PtNXsTtMQAo6eCx8cuz32cu1x0WElA+9M+ayaiGwQjMAIbPi7TbWXU/tpx5oYfiporfl0aSgZr+ENtwoqxdz2Bv48f/CAN0uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706505635; c=relaxed/simple;
	bh=VNfQNXcwaj9L7sBzly9Yd2YYDACh1h3l8Zw6n6MrGnc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dOmzlaD3S+v5NF3pdSuKh9nV5bqRN9e3dsu1Z8yVShtk5scNjhMjDfmGwAIsKTovNYp6LXfNHCelnl0TVu/7fb2HgBWfnGwQEElVnvvdMCQ3uaDc7SGMB1wcMRtyUh+W/ZoJ2rax8PCggSv/WeNuZRbPzeDqvAJmefZ27uEuyhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sb+4gJif; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sb+4gJif"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40e913e3f03so30713735e9.3
        for <mhi@lists.linux.dev>; Sun, 28 Jan 2024 21:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706505630; x=1707110430; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TG0As8Zf+jaNpWP1oUZ8aP25VHp9LmLOVgXQ/rkSlDI=;
        b=sb+4gJifpf0iZcQSX4lrI5xRykDR8tMVvFW3n17o1WzzjH7TMxz1yfdGHDiWQLcvqk
         lbE9VTaP/jZvB6YCZdYa/n4wbNowE4gGXsuQpEA+j96iY8b2ScPWbNq7UKxgAkUbbVgW
         bTGGWX1nLF+8t1mRzF2Pyqc1r5WZrZYu3ld+6/uVk0ERs3CbHdVK3YhlTNfz8f7JNQjy
         IPcGePboJ+OXV/w4nec9QVhtNSQ8b9FLrFa8bpVgcgZRS5JDD2jLoplLHD57rsWwbKUC
         QAyMXv9xsW7HhChHEKDmycbjWvYguviXXVZgQgqYu/TAC2xCDnuBjjh9C78I1R6pr0sC
         RStA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706505630; x=1707110430;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TG0As8Zf+jaNpWP1oUZ8aP25VHp9LmLOVgXQ/rkSlDI=;
        b=LgTS1h/reTwnBCl0U3vtyn73uYeuPvZAiC7/c/fPyzcFQ7o7Z9myF77QKdrKpQm/fB
         6PPXP9UpyiMSo5w16+ukovBpGNMKelczsUnc6YLFTANdCWmvqKZktKtsE3YSLsj720kQ
         DXIoVL/i6PzbUAb+tOUkKZ/Uf+5L87EZjJlrPKm/Z+KlVl8zvYp1iUWHsPwibQvRZ74F
         6ham5aK1Lf7suY6+embrUdTqwmSKX3pgRb/L8zw/K3Ls6lQOOZw8Ix21yGcN0eKfjet1
         2TV7DAKAABx7aBP+g39Sjk5dmUs2wjcHCn7f7QM7U/cnGucPk0F2wpKvBzwrLrl5snRt
         MgSQ==
X-Gm-Message-State: AOJu0YzeipSzoWAFuA9eYz5sloYCKQOejlbruZHd4VOOkNaaJ3p2af1a
	XEMVHVuNEu7oCYcHCWbeNnIE8AjZc0CXlNIR5TPfGe6Wsfb1uamZRC3ETLyF0vw=
X-Google-Smtp-Source: AGHT+IEfoXxJ+z+aVz9Hl5jSUOADUMdycEW6ZCPWSS5N4L7GhwgTKNyeWxDzwUUJNPQ0Lx23qnWpKw==
X-Received: by 2002:a05:600c:ad0:b0:40e:779f:416 with SMTP id c16-20020a05600c0ad000b0040e779f0416mr4554158wmr.2.1706505630593;
        Sun, 28 Jan 2024 21:20:30 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id m5-20020a05600c4f4500b0040ec8330c8asm12823044wmq.39.2024.01.28.21.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jan 2024 21:20:30 -0800 (PST)
Date: Mon, 29 Jan 2024 08:20:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Erick Archer <erick.archer@gmx.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: ep: Use kcalloc() instead of kzalloc()
Message-ID: <3b175cb6-fcbe-4521-b6ac-442c8a11c297@moroto.mountain>
References: <20240120152518.13006-1-erick.archer@gmx.com>
 <43614a09-d520-4111-873a-b352bd93ea07@moroto.mountain>
 <20240128102933.GA2800@titan>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240128102933.GA2800@titan>

On Sun, Jan 28, 2024 at 11:29:33AM +0100, Erick Archer wrote:
> > It's a bit concerning that ->event_rings is set multiple times, but only
> > allocated one time.  It's either unnecessary or there is a potential
> > memory corruption bug.  If it's really necessary then there should be a
> > check that the new size is <= the size of the original buffer that we
> > allocated.
> 
> The ->event_rings is set twice. In the mhi_ep_mmio_init function and in
> the mhi_ep_mmio_update_ner function.
> 

It's not about the type.

The event_rings struct member is the number of elements in the
mhi_cntrl->mhi_event array.  However, we ->event_rings without
re-allocating mhi_cntrl->mhi_event so those are not in sync any more.
So since we don't know the number of elements in the mhi_cntrl->mhi_event
array leading to memory corruption.

> void mhi_ep_mmio_init(struct mhi_ep_cntrl *mhi_cntrl)
> {
> 	[...]
> 	mhi_cntrl->event_rings = FIELD_GET(MHICFG_NER_MASK, regval);
> 	[...]
> }
> 
> void mhi_ep_mmio_update_ner(struct mhi_ep_cntrl *mhi_cntrl)
> {
> 	[...]
> 	mhi_cntrl->event_rings = FIELD_GET(MHICFG_NER_MASK, regval);
> 	[...]
> }

These ->event_rings assignments look exactly the same.  It depends on
regval.  So possibly one could be deleted.

regards,
dan carpenter

