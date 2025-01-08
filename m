Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253ED1FCFDB
	for <mhi@lists.linux.dev>; Wed,  8 Jan 2025 15:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736349585; cv=none; b=bftSH1sTKb8DbLZeCmA1pPmKvdmu2/7PyMuwyq1mf2dsu7gwJpGyEY9uDM5A/F8YKsANMV6x4oiajx2ETszY1pl9hyjZxD+e94nfna+TOdO9RolfPi+3TFp6wlFRBUzHo2+OiGVEJRgmSmttcKI1LsynUW5k/MTGV8KU36ZaamI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736349585; c=relaxed/simple;
	bh=S8+xIJyK33ZHzGHOInxNuQ7XoyymzN8JimDgUHl2LMQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uv6uP658Ue5xI++g7BbOjEOqKQD3Oa2SGIO2cKjoeISoI02ghXE5Q1MrwzSZepbCRHE+FrWuo0TmPla1B3FRJLCaTeVWuzMOszEI7jM7eDKubqNsNLlQZzzR9dB4pdOlR8+SCnn50cRtqNmaoKyMDSkrpnB39zSV/hQDSDhkRPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WocxUtcI; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WocxUtcI"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-29f9e76802aso479337fac.1
        for <mhi@lists.linux.dev>; Wed, 08 Jan 2025 07:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736349583; x=1736954383; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6Zs0x6zXwLhMKy2YimFx22u5+ybSyZ3K5Ks5ZMiPS6U=;
        b=WocxUtcI+LiFs+Zpdhw1tPPnAIzJ+5Au93ozKQgLERcjqCFO0fWScx39v9sfe8J5VS
         alW3/p3pOT/YPoYSC4cmHP5aZhveZyQ0Kg2qW5v8obj6cwerAhi3kJM5s1pqZ5r+UlBo
         f2J6tnKqSmix+WvNtLnAVpG8zoDU4FwLm7/07WHaL6MduLN6Iu3CWoZ8uMkcWlxKHF/7
         2//P0dbyvJbSgRiRVwegSbq+0eXjaSALnnBeBXcqIdcUFiYcPDUX0DvJo53CcFSsBL8E
         xVQCeRAsDy3QOuJFQVuffajLTU/JywtatlwA9gUxoSmih1nUo2K+Jcdf/XaSlpbDYCeV
         uC6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736349583; x=1736954383;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Zs0x6zXwLhMKy2YimFx22u5+ybSyZ3K5Ks5ZMiPS6U=;
        b=Bqn2zsc5q1lp5GK16aVUG7AabkDIqV5Pdo/TpUKCWeoSUlXeKba1w9wb+BiEz3cmF8
         o5rPi0v6/H0pdasUqYoZow5HH5I0drUyQgR4Y3S9KpKblpFSqHKrGaPetG54Bwy6Ajv4
         A8c7+71fgMuRHOluaGnduFMfOZTDy/wpWYDBisowBxcggWSPmHoNY2p4ukpguJc6kZUm
         7xZt8N01671YV8ka3rUDptjFnKLRXVVWwt0ckAOAVQg9ZWNEU2WqfA26ckI6ifHc9AFW
         YRBeDpO/Tyc0aA+SvMW3SyVO1Ad9FDPt2Wu3uoZsUpnlnheI4s11d0IRrlu+sO0w7m4z
         uvjA==
X-Gm-Message-State: AOJu0Yzh7XcH0cLoG63RSDjehfNYpjuHpkCBHaqvDyrXS3ljN8s/aSAA
	VbxzlBj3pKb6N5vgMcGtBcjfyWVbjIs+jULs3dCO3VxLAroSLKlWXgmYrfuxqMPLPTbBVB757j6
	T/tVqtkjSr9n5jrNXQBObQ0v7qkNYBUej6OW/7g==
X-Gm-Gg: ASbGncszRQcEeMar4SyPu6z5np6OmryEv4KDlpJRL8yGl2951hmXlG83WGVuvOkVRAT
	u0zjxPYw5jWtlESaFF2Zdys5XzdiXP7JmTYfeQRegPfAaJuixY2Z4qNBOsRFksN3oJKDZ
X-Google-Smtp-Source: AGHT+IFdcASMuSPx7wnPTSOxzCIvnK5AZhtUpSDpvfTmQ7F1nQUlpr4kCBfb2r1WlGxp8XqNukwAN1+7QxEq5LVuoOg=
X-Received: by 2002:a05:6870:ff45:b0:29e:7629:1466 with SMTP id
 586e51a60fabf-2a9eaa986e7mr3988370fac.7.1736349583243; Wed, 08 Jan 2025
 07:19:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250108-mhi_recovery_fix-v1-0-a0a00a17da46@linaro.org> <20250108-mhi_recovery_fix-v1-2-a0a00a17da46@linaro.org>
In-Reply-To: <20250108-mhi_recovery_fix-v1-2-a0a00a17da46@linaro.org>
From: Loic Poulain <loic.poulain@linaro.org>
Date: Wed, 8 Jan 2025 16:19:06 +0100
X-Gm-Features: AbW1kvZa6gRkeZ9H-nvbe12ihHDmXyCS470lzORAghiZyMgYmyhYw4TS9_LQmVE
Message-ID: <CAMZdPi9KiLczjETLwJG_9krn_z=Og0uZhYuajPeZYoBHanxMiw@mail.gmail.com>
Subject: Re: [PATCH 2/2] bus: mhi: host: pci_generic: Recover the device
 synchronously from mhi_pci_runtime_resume()
To: manivannan.sadhasivam@linaro.org
Cc: mhi@lists.linux.dev, Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 Jan 2025 at 14:39, Manivannan Sadhasivam via B4 Relay
<devnull+manivannan.sadhasivam.linaro.org@kernel.org> wrote:
>
> From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>
> Currently, in mhi_pci_runtime_resume(), if the resume fails, recovery_work
> is started asynchronously and success is returned. But this doesn't align
> with what PM core expects as documented in
> Documentation/power/runtime_pm.rst:
>
> "Once the subsystem-level resume callback (or the driver resume callback,
> if invoked directly) has completed successfully, the PM core regards the
> device as fully operational, which means that the device _must_ be able to
> complete I/O operations as needed.  The runtime PM status of the device is
> then 'active'."
>
> So the PM core ends up marking the runtime PM status of the device as
> 'active', even though the device is not able to handle the I/O operations.
> This same condition more or less applies to system resume as well.
>
> So to avoid this ambiguity, try to recover the device synchronously from
> mhi_pci_runtime_resume() and return the actual error code in the case of
> recovery failure.
>
> For doing so, move the recovery code to __mhi_pci_recovery_work() helper
> and call that from both mhi_pci_recovery_work() and
> mhi_pci_runtime_resume(). Former still ignores the return value, while the
> latter passes it to PM core.
>
> Cc: stable@vger.kernel.org # 5.13
> Reported-by: Johan Hovold <johan@kernel.org>
> Closes: https://lore.kernel.org/mhi/Z2PbEPYpqFfrLSJi@hovoldconsulting.com
> Fixes: d3800c1dce24 ("bus: mhi: pci_generic: Add support for runtime PM")
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Note that it will noticeably impact the user experience on system-wide
resume (mhi_pci_resume), because MHI devices usually take a while (a
few seconds) to cold boot and reach a ready state (or time out in the
worst case). So we may have people complaining about delayed resume
regression on their laptop even if they are not using the MHI
device/modem function. Are we ok with that?

Regards,
Loic
