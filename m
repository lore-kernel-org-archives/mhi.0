Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C291FF7B9
	for <mhi@lists.linux.dev>; Thu,  9 Jan 2025 20:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736455896; cv=none; b=l9qCzhY+WRkhdUu/f0GBm6cMVvbDMmvO+ondvt59P/yTvjocQOUT+7Uua8yHwiJuYtLw3BOjuouE2Vtx6O2Tp/S1NEkZyCW7Q4r1zybzUUXxhqYdqnRopmbCF5/Sf6JMkZgMhp/cvJjk7He2Sr0qh6kr/gh9zuDU17YbOwDkdXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736455896; c=relaxed/simple;
	bh=/TsRdN+g/t5WPSJQXnaL9WV9wg//3dakf9wDwajrJgs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O8CTET9Jm4loR0DCgpgK57cHD9KHEMYdyjzzX03kLOF2dX4Bv1FkY2Kb2A3e1Fmo4ZdfwQsBeydl54N0M9gLSkbQcR1GOmOi/OoJrnp104x3P8YyCSZXaIRhsrVDs/6Wj8nvUDtuxFlrfH8Aqr93AjFTnKERByXMwPTQM1VWGyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zgUq6fPA; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zgUq6fPA"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-5f4cc48ab37so446553eaf.1
        for <mhi@lists.linux.dev>; Thu, 09 Jan 2025 12:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736455894; x=1737060694; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Mebvm12Efix/HOfbzCEke0YYM9SXOWLxp0bQs2kiNYc=;
        b=zgUq6fPA/ppCOSlptgfbPmeclTpG4aaLaJeywMQdpaRKEiV8U/EHLMk4L1qVZiKW/q
         sWLZKNeUxv6v/ymvvImiABFh0cG4pyAYdlfU0Fao1L/fW4qb3AupXq5Hqn+a7Ltng3qa
         W0Z77+KtXA+Azu5m8nJYewcwOJVI7kvEH++l1iEtDWmmJAVwXqBdFWoru2IeJ5fDIuFL
         Qkbf4/YZYa8vlrYKiLFLHISwC8wsp1lPylOaRGDT4ioLZ88MTCVxqOMTGQwmy5z1NCQR
         zu1vcSVelW1L4K7gepST+hNpDAu22ehGu3AJHnAPg9Gwej9FHMz6RT2UBWjZZ317qyaM
         i0AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736455894; x=1737060694;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mebvm12Efix/HOfbzCEke0YYM9SXOWLxp0bQs2kiNYc=;
        b=R5eMEkQ1UZsEP1HlTTy3+lS04dSV5AlIKnPR9SjcuxKjQM1opEHwrhVCfRZEU6Rhs3
         i3knxJ2rHcmsk9wsgL4OpqVpQFyGCAxh6Ua1v+PheRHD89cp0F9sAU4Q2PCJw858WlAY
         OP51z0f1mR4MeQR96XPLjyeGitICsFNBwJFIojAilZRjCSQcObmlDaCAgj+Nu/0uxyta
         Wuv0JZyXOqSs1lnO1t6fkbB98kkWKJxVsutd+zzGoP6JgoClQlNer80AAHVHgajShnKQ
         mNmTT+MMI+GRhZA2wlEdbJbRUKzISWZWp+r2MqMTiYnDX8GJRyiJLymmJSRRV0WeAmdS
         PLpw==
X-Gm-Message-State: AOJu0Yw+T/HrJXLlDP3WZKZHDasrUW0/fMkbbBw5Js16AF0nGCOk/fsj
	02z2X4SZtsHs1TwG7K6+dzb8LIyc1QuoHV4antH/ZpKb2dxJu430E3mrItPW6JCW9CKE4qQUyy3
	jvsV2HLn2SozD+nSOy8IDYr4ADmO+FtslFSILlA==
X-Gm-Gg: ASbGncsCgyEwwkHQLcrHzQhXzVWGCalO1nWIc2V5KuURcglkYhVHgDBsIlBKXTSHUPh
	1gP52CyHwUX4ex7zJptKVkS+/Ed9iSQcCWxcYTw==
X-Google-Smtp-Source: AGHT+IGw0KIVg/dvzz7d9PF80SBHOTL5uvW2Zpk7HWjQlYX/tsf3aX9InA3qQG3yCXLbshZwbBGvXAfuWrNEWOn1Gs0=
X-Received: by 2002:a05:6820:1798:b0:5f3:4175:1d7f with SMTP id
 006d021491bc7-5f73096717dmr4383494eaf.8.1736455893957; Thu, 09 Jan 2025
 12:51:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250108-mhi_recovery_fix-v1-0-a0a00a17da46@linaro.org>
 <20250108-mhi_recovery_fix-v1-2-a0a00a17da46@linaro.org> <CAMZdPi9KiLczjETLwJG_9krn_z=Og0uZhYuajPeZYoBHanxMiw@mail.gmail.com>
 <20250108160211.6dok3zcn2qaoj3lp@thinkpad>
In-Reply-To: <20250108160211.6dok3zcn2qaoj3lp@thinkpad>
From: Loic Poulain <loic.poulain@linaro.org>
Date: Thu, 9 Jan 2025 21:50:55 +0100
X-Gm-Features: AbW1kvaYy2ijj3_SpahQvOJx-c_o9llvwrvJ3pguay-O4M-tUnMoDS8jvItsP7k
Message-ID: <CAMZdPi_OPXGkrT_4iyLF-698TPUgHu=Y5M-wVRq=kx6RWH4bVw@mail.gmail.com>
Subject: Re: [PATCH 2/2] bus: mhi: host: pci_generic: Recover the device
 synchronously from mhi_pci_runtime_resume()
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev, Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 Jan 2025 at 17:02, Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
>
> On Wed, Jan 08, 2025 at 04:19:06PM +0100, Loic Poulain wrote:
> > On Wed, 8 Jan 2025 at 14:39, Manivannan Sadhasivam via B4 Relay
> > <devnull+manivannan.sadhasivam.linaro.org@kernel.org> wrote:
> > >
> > > From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > >
> > > Currently, in mhi_pci_runtime_resume(), if the resume fails, recovery_work
> > > is started asynchronously and success is returned. But this doesn't align
> > > with what PM core expects as documented in
> > > Documentation/power/runtime_pm.rst:
> > >
> > > "Once the subsystem-level resume callback (or the driver resume callback,
> > > if invoked directly) has completed successfully, the PM core regards the
> > > device as fully operational, which means that the device _must_ be able to
> > > complete I/O operations as needed.  The runtime PM status of the device is
> > > then 'active'."
> > >
> > > So the PM core ends up marking the runtime PM status of the device as
> > > 'active', even though the device is not able to handle the I/O operations.
> > > This same condition more or less applies to system resume as well.
> > >
> > > So to avoid this ambiguity, try to recover the device synchronously from
> > > mhi_pci_runtime_resume() and return the actual error code in the case of
> > > recovery failure.
> > >
> > > For doing so, move the recovery code to __mhi_pci_recovery_work() helper
> > > and call that from both mhi_pci_recovery_work() and
> > > mhi_pci_runtime_resume(). Former still ignores the return value, while the
> > > latter passes it to PM core.
> > >
> > > Cc: stable@vger.kernel.org # 5.13
> > > Reported-by: Johan Hovold <johan@kernel.org>
> > > Closes: https://lore.kernel.org/mhi/Z2PbEPYpqFfrLSJi@hovoldconsulting.com
> > > Fixes: d3800c1dce24 ("bus: mhi: pci_generic: Add support for runtime PM")
> > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> >
> > Note that it will noticeably impact the user experience on system-wide
> > resume (mhi_pci_resume), because MHI devices usually take a while (a
> > few seconds) to cold boot and reach a ready state (or time out in the
> > worst case). So we may have people complaining about delayed resume
> > regression on their laptop even if they are not using the MHI
> > device/modem function. Are we ok with that?
> >
>
> Are you saying that the modem will enter D3Cold all the time during system
> suspend? I think you are referring to x86 host machines here.

It depends on the host and its firmware implementation, but yes I
observed that x86_64 based laptops are powering off the mPCIe slot
while suspended.

> If that is the case, we should not be using mhi_pci_runtime_*() calls in
> mhi_pci_suspend/resume(). Rather the MHI stack should be powered down during
> suspend and powered ON during resume.

Yes, but what about the hosts keeping power in suspend state? we can
not really know that programmatically AFAIK.

Regards,
Loic
