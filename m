Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1C315B99E
	for <mhi@lists.linux.dev>; Wed,  8 Jan 2025 16:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736352142; cv=none; b=g56nJ6Uq4I88yHSWB4B+aSBAILjNdizhocXpDGEKOU2Zc3KTItw91mtCDpFyyeEtJpbo9nSQexVpFj9dqFpPQK3tWcHYmW9QiK2QMiNocab32uvuQFZ3DNOeNec9+Nky1KzJGlmhwxtacD/EDi6RDjLFzzLVrzOsl+XWnCN01CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736352142; c=relaxed/simple;
	bh=q2pod2nUbwMJD0bdVvi2G9EzGICOQ3Pcv9WM6ocnZY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YgiIlwJr6bppqp1puF3BEiUrzbixwuri4A2lSPfvy3QoGJi1PQ/5oJI9WSuCh65Gz0aQ2NxpNfgrddRiEBcJuQ30pm3tWO7UBJ+mWkCds4GV6WPu+rp/1sld87SMPMLWjajMpREl7K+cRhLOTu5B/1hkCjk/Gli+FspMJvaD/eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MusnR3hh; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MusnR3hh"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2163bd70069so59862675ad.0
        for <mhi@lists.linux.dev>; Wed, 08 Jan 2025 08:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736352140; x=1736956940; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gDnmmr+BPzeGSONCgPZRDtmO65LxOmvvSiVUiu5r1WI=;
        b=MusnR3hhz4/DGnn+CdYm6xWoi3+OTjc5qYvUS08gcqOhlY5DUNjleOxhcadpNM8eaP
         pdKMDKlFjTFL6Hyv8Z1EWK7Mcdzx4q7rgcgVk2ehyn5DB2y9IW7uFaPbqITe/iCYlRRF
         Ig5EOTc/aaWi0l5cbySiAGrBP5/sSvilwUEuSxwVdDxDeimJUYfVeZNAO0PapuQrkskk
         Vbnw1+KlBlxYmUoSft5JWsIlpCh6cdabfwiu/MF/873RxTSftcCkZPC2Dwm2O1rBjId2
         P5wNni8zMexAOQ3bnTqLN4hfGipwuDQ1zDafY2xn9XETMBvpbv2h3l9FuGz1Gl8cXjXr
         NW+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736352140; x=1736956940;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gDnmmr+BPzeGSONCgPZRDtmO65LxOmvvSiVUiu5r1WI=;
        b=Tnkcuz0Xov8PedpTs4r71GZOmDrHflUPxKMYTbij5AJ2zk20TgNVVDwfN+kAK8zDM6
         bKSJiZtc3B5ugzLEQIUO6Dl329fkSvwpL+ImUpFEKVMR+cL+WOUEDnlZGB1Ptyx4Vzth
         Ye3MUdvn5OZ/i1oy9CRrrzI13Lpr9iDTycp4NNnL2aU/1HbNF/xAwpEp6QPSxz4ny8o7
         drSDbBq37bp5GG7CtH0aVWgebLwFFl7jiyTOtmcCvkzHo5O4fyLzO6/y+aoOam0bOENq
         mF7px3EySdr8qlGTb4Lajrio6rmEDqmKrHdAfaI5hpUwyR48H+DFCdKOgRdJg3oa20wv
         IPiw==
X-Gm-Message-State: AOJu0Yx8ZGn2sHLu1h0zQ+oPuWDkXTpUEgPSm5hLtCRJ59kU5oBNTiEP
	x4qZpqCfF9ZZsEe1t1KgReloVzdsTwGJjWhK+YhgeWNFeTxwHeFEic8Ur86uRw==
X-Gm-Gg: ASbGncsWU3OyRIxjsad/u0T9TaACVNsA1HShoFu95el3E4w4xdZDaafNdzWl6NVly0G
	cd0zHJjT/s0tOirwD5s36hKUVq6wqMAsH+Bf4zMXQ3XqZ7asp38mngXzb5zWpvBtIYSUumWtacE
	WVNH/ggR/2Ez72rxaQx1rOdufP8q8N1NUKgyK+FsrYyTl15ZhruQ6Vct/WZZiamXU4+ZGjbdiDy
	qUMV65hp63UkpDt2nR1ma3Qwatir4df+Q7p9qSQkATMPXsho1PsddzBzc2e9SLLb+4B
X-Google-Smtp-Source: AGHT+IGnIOJxVu4wkWjov5XG3BAJjb4T++JDP8RJTAnpDKLkqISVD6wPeoA7et1loROcLPRxCQ2RcA==
X-Received: by 2002:a17:902:c941:b0:215:7fad:49ab with SMTP id d9443c01a7336-21a83f46a12mr51005925ad.10.1736352138709;
        Wed, 08 Jan 2025 08:02:18 -0800 (PST)
Received: from thinkpad ([117.213.97.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc970cbbsm329441405ad.103.2025.01.08.08.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 08:02:18 -0800 (PST)
Date: Wed, 8 Jan 2025 21:32:11 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Loic Poulain <loic.poulain@linaro.org>
Cc: mhi@lists.linux.dev, Johan Hovold <johan@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 2/2] bus: mhi: host: pci_generic: Recover the device
 synchronously from mhi_pci_runtime_resume()
Message-ID: <20250108160211.6dok3zcn2qaoj3lp@thinkpad>
References: <20250108-mhi_recovery_fix-v1-0-a0a00a17da46@linaro.org>
 <20250108-mhi_recovery_fix-v1-2-a0a00a17da46@linaro.org>
 <CAMZdPi9KiLczjETLwJG_9krn_z=Og0uZhYuajPeZYoBHanxMiw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMZdPi9KiLczjETLwJG_9krn_z=Og0uZhYuajPeZYoBHanxMiw@mail.gmail.com>

On Wed, Jan 08, 2025 at 04:19:06PM +0100, Loic Poulain wrote:
> On Wed, 8 Jan 2025 at 14:39, Manivannan Sadhasivam via B4 Relay
> <devnull+manivannan.sadhasivam.linaro.org@kernel.org> wrote:
> >
> > From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> >
> > Currently, in mhi_pci_runtime_resume(), if the resume fails, recovery_work
> > is started asynchronously and success is returned. But this doesn't align
> > with what PM core expects as documented in
> > Documentation/power/runtime_pm.rst:
> >
> > "Once the subsystem-level resume callback (or the driver resume callback,
> > if invoked directly) has completed successfully, the PM core regards the
> > device as fully operational, which means that the device _must_ be able to
> > complete I/O operations as needed.  The runtime PM status of the device is
> > then 'active'."
> >
> > So the PM core ends up marking the runtime PM status of the device as
> > 'active', even though the device is not able to handle the I/O operations.
> > This same condition more or less applies to system resume as well.
> >
> > So to avoid this ambiguity, try to recover the device synchronously from
> > mhi_pci_runtime_resume() and return the actual error code in the case of
> > recovery failure.
> >
> > For doing so, move the recovery code to __mhi_pci_recovery_work() helper
> > and call that from both mhi_pci_recovery_work() and
> > mhi_pci_runtime_resume(). Former still ignores the return value, while the
> > latter passes it to PM core.
> >
> > Cc: stable@vger.kernel.org # 5.13
> > Reported-by: Johan Hovold <johan@kernel.org>
> > Closes: https://lore.kernel.org/mhi/Z2PbEPYpqFfrLSJi@hovoldconsulting.com
> > Fixes: d3800c1dce24 ("bus: mhi: pci_generic: Add support for runtime PM")
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> Note that it will noticeably impact the user experience on system-wide
> resume (mhi_pci_resume), because MHI devices usually take a while (a
> few seconds) to cold boot and reach a ready state (or time out in the
> worst case). So we may have people complaining about delayed resume
> regression on their laptop even if they are not using the MHI
> device/modem function. Are we ok with that?
> 

Are you saying that the modem will enter D3Cold all the time during system
suspend? I think you are referring to x86 host machines here.

If that is the case, we should not be using mhi_pci_runtime_*() calls in
mhi_pci_suspend/resume(). Rather the MHI stack should be powered down during
suspend and powered ON during resume.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
