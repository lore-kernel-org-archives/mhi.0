Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0031F582C
	for <mhi@lists.linux.dev>; Tue,  8 Apr 2025 14:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744123960; cv=none; b=D3L9aA5ooXXKJC3ksCADlKociaiPDt8o116h/eShCrV/nFZi1vOAgIX/EXoLaXdl+fLMlM3aKDr9uwfwkThe7yNo4lR3MwgdzAGJrkwiSHzGlxkscm1u3Cldq8TmtkOgnOipi2wSXPbZhe1M2XR3z2joT86IL5kKckryWD54dSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744123960; c=relaxed/simple;
	bh=QYspwtBhVsFSgwIRvDlo0+t6maQ17Xcqzma1ZXsCdVE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tX0SYWbCe8jNoE+85JXS1qpb66lkgV/qXWfOozQVaRa5Q512uC51txOyp3fQXOL0alOYEQFtiN+mnwOvRQ7JoZVfNGGzre6QQgcilfel9u064HnnT2ctC/sLNCUTcsEADO+UQEg8Z3z7X8SkwuZdUFj6zS96aEZWhDMYMfJE2Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=unrealasia.net; spf=pass smtp.mailfrom=unrealasia.net; dkim=pass (2048-bit key) header.d=unrealasia-net.20230601.gappssmtp.com header.i=@unrealasia-net.20230601.gappssmtp.com header.b=pP/sP2Uq; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=unrealasia.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=unrealasia.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=unrealasia-net.20230601.gappssmtp.com header.i=@unrealasia-net.20230601.gappssmtp.com header.b="pP/sP2Uq"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54acc0cd458so6879956e87.0
        for <mhi@lists.linux.dev>; Tue, 08 Apr 2025 07:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unrealasia-net.20230601.gappssmtp.com; s=20230601; t=1744123957; x=1744728757; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MovUcynSAJffR7RJo4naoiiZN0xmuejMREjzSeCfcHU=;
        b=pP/sP2UqAa/di7ehQaQnJ4k0aBZJ80DA0s+LN/lXeBcmCyZFZtJbVEWu75goJIHFXg
         6uVi5fl1evyIg54B7LRzsJNyEP7dGzkfFwLgiLY6aogjIVUJwFDyFQgq9bwBZ1AWopp/
         vJOhwEouwLNlro6KnxoTVRjSFVP7cNTBHsXj+xH8VXCoHbbmBDd+8UqLU3r5RYZjfliR
         nhcHhcqAlyPPWKw4v5OLsZyOcYEdMgH4c1n34EzqIe/dYDjr59l1Ce5+AnarkRAirz2D
         1DS94nxTbtT3pRmJRbuL3OL7nCFfHCcjERNVIpaBuZEpeAPpgtP0Q+GYPlE8oBM32U8B
         G/Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744123957; x=1744728757;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MovUcynSAJffR7RJo4naoiiZN0xmuejMREjzSeCfcHU=;
        b=W70sRuA2Zs699i3fmw4BXMmwZrBIBU5CA8vBrK1uOLNTF7I+64ymPaUJngYItEEcJC
         zt2K5TTCUK+nFmkIERi3XrNLo5oFi+WpwXwYT+jubg/IKK7VnD60eIB5fNbEHUJ8vZq+
         MnstyxoU4PZpW/XrPI8V1ZSCHVp6Rogz6ikuqN7Set0zYjWY7vNSKXOvtzFdFD3RXarJ
         Uk7XFRFuqfBnTRdwRztjY2RNQnmZ+CL5vY7P+bqYpE+aYJHir69ZmCihgrsOA9AQNeCv
         v6F1/0PgGCI5TVhIM1wr3uEqNa0D61HKnoNPcE9/4f1sQcAGJm0Yd2xYtNXqLMwikKx/
         QJXA==
X-Forwarded-Encrypted: i=1; AJvYcCUjD9CNimzefGL+uQwXKX4u0CeYe36L7erjWBPAPGbWJ86y1DhWfXl2TpGXTxjOw1yPQZY=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywi15wulhusXpHS4rtaYCdlJLs1wrQ7aGoBgICJ88FBGx4yq6d0
	V6YX4/5LgsMDTc1yAK+NpIrbGC/NacEXxeTByD1r782N0plEvXkk/FZJytWZKi8XwnMiM9ON5RV
	NC7qAfGXqNokP57enCWxDA4mQYM+KA3aCe/BMu3TA1KX3DYM7
X-Gm-Gg: ASbGnctTWZxNJmOHASlH3XkPQ9KLaGOOsXYrwX0h5wY9wjJhBu1VCEiWr84bu3FCmxm
	l/NaHa9Deysd09iUL+UvNG3I/T+s4L0A06Tl/NFFRf0Rb48/jk6n3Yd2OCHhR9wUo69LapQciNH
	fIUZXXoS7NOj6su4VznIbLOCa5r/bLjXS52BtFEtMRD6T+QANL23RpOHH9flg=
X-Google-Smtp-Source: AGHT+IFzWK434nhtb4w+8XqXvvTVLz7cQ33CfkusPzfC4ffnVIgn0gGz66HquvJCMDt0tb15sjoUDK45j0gNOhYrFlo=
X-Received: by 2002:a05:6402:26d4:b0:5f0:7290:394b with SMTP id
 4fb4d7f45d1cf-5f0db889fb1mr12787948a12.27.1744123515199; Tue, 08 Apr 2025
 07:45:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <2703842b.58be.195fa426e5e.Coremail.slark_xiao@163.com>
 <DBU4US.LSH9IZJH4Q933@unrealasia.net> <W6W4US.MQDIW3EU4I8R2@unrealasia.net>
 <f0798724-d5dd-498b-89be-7d7521ac4930@gmail.com> <CACNYkD6skGNsR-AH=6TWeXLqXeyCut=HGJeWUadw198Ha3to1g@mail.gmail.com>
 <CAFEp6-2_+25Z+2nPOQtOzJPgfJM8DAs2h_e6HTQ4fAVLt0+bwQ@mail.gmail.com> <BB06D58C-E27D-42FA-8043-AE767E9B5E91@gmail.com>
In-Reply-To: <BB06D58C-E27D-42FA-8043-AE767E9B5E91@gmail.com>
From: Muhammad Nuzaihan <zaihan@unrealasia.net>
Date: Tue, 8 Apr 2025 22:45:03 +0800
X-Gm-Features: ATxdqUEXOuMMmnIAa6YJ-BdW2lii4EbPgcz6D2oVlm5dOhxW2qYubUdeN-IGJGI
Message-ID: <CACNYkD7FNx6KR_aKA9S10=bXx4-Xj9WLnGVGDWTgNERerCc6uw@mail.gmail.com>
Subject: Re: GNSS support for Qualcomm PCIe modem device
To: Sergey Ryazanov <ryazanov.s.a@gmail.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>, Slark Xiao <slark_xiao@163.com>, 
	Loic Poulain <loic.poulain@linaro.org>, manivannan.sadhasivam@linaro.org, 
	netdev@vger.kernel.org, Qiang Yu <quic_qianyu@quicinc.com>, johan@kernel.org, 
	mhi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Loic, Sergey,

Thank you Sergey for your time for the prototype.

Looking forward for the code (and coding help if necessary) and help
to test it on my machine.

Zaihan

On Tue, Apr 8, 2025 at 6:27=E2=80=AFPM Sergey Ryazanov <ryazanov.s.a@gmail.=
com> wrote:
>
> On April 8, 2025 12:13:17 PM GMT+03:00, Loic Poulain <loic.poulain@oss.qu=
alcomm.com> wrote:
> >Hi Zhaihan, Sergey.
> >
> >On Fri, Apr 4, 2025 at 7:42=E2=80=AFAM Muhammad Nuzaihan <zaihan@unreala=
sia.net> wrote:
> >>
> >> Hi Sergey, Slark,
> >>
> >> Using wwan subsystem and it works without issues, maybe i might miss
> >> something, perhaps the flow control but i never have any problems even
> >> without flow control.
> >>
> >> I am using gpsd + cgps and xgps with a small modification to Linux
> >> kernel's wwan subsystem in the kernel to get NMEA data.
> >>
> >> I had posted the patch previously and i can post the patch again if yo=
u like.
> >>
> >> Attached in this email is the screenshot of cgps + gpsd.
> >>
> >> Maybe it should be in GPS subsystem but it's working for me even using
> >> wwan subsystem for months now.
> >
> >Yes, I would strongly recommend doing the extra step of making it
> >registered to the GNSS subsystem so that device is exposed with the
> >correct class.
> >From WWAN driver perspective, it will not change anything, as we could
> >have the WWAN framework handling this properly (bridging to gnss
> >intead of exposing the port as wwan character device).
> >Sergey, is it your plan?
>
> Yep. I made the prototype exactly in this way. So a modem driver should n=
ot care about the port type. Just call WWAN core and it will do the job for=
 the driver.
>
> The prototype is done. Needs some polishing, proper description, and prob=
ably, today night I'm going to publish  the RFC.
> Hi Loic,
