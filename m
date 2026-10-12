Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3886341660
	for <mhi@lists.linux.dev>; Mon, 12 Oct 2026 13:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791812453; cv=pass; b=KhqYUE+Qxt4dLHuHlOB2v2eKM70+W3kLCizdJu7W/smhs0Cf+E3TubcoaNbweTYx0LTqYyTHwT+RDXfLvsygAAFJ7Rj4QqFJIILCqhD1ERtXI9k9B8GThhrTkJccTp7c/HqGq6p6vHWuQEcTsHESBtUqFYEjlDI0b08D07yRTGU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791812453; c=relaxed/simple;
	bh=tr28fG4ZEXTsiIAwMe0wjF7BnaOQzBQT7Xkb6b/2La0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sMyxS5pLNegz6mjIgxwKYFRZfAVXZlRDUhg+2vMlrCnweFeMx3sMbMqABA69VYrJq8WsTwLMBxMNKNi0s8Zf30Q4ZaAhSVt/ia2XxfRuE5RWckd/iWEZeb1bRGomqhun67VuBxDrWc5WDjd8I499Lx+77hE7lbCntgn8asS8Jz0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TvVIycOo; arc=pass smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TvVIycOo"
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-9851592ada1so384639241.0
        for <mhi@lists.linux.dev>; Mon, 12 Oct 2026 06:40:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791812450; cv=none;
        d=google.com; s=arc-20260327;
        b=qFOY01064a/V6+aTLXrbRPPJMM/2geJv1Ha1BBJ5zW5nqJN9jkz0Z8l77G9XUP1zEB
         EdYEzlgCe+M2IK9XVs1cF3r1noZ+TCdlTBhcDJL+AW2RZeKqGvQJaocd8vm9p26UL/d2
         Hq+7GF06IYYvQyVibjcMbpMCsW+ymt1or3dkAtmCzQ09Qkh/nDOp2UBLFcGiT2AqovIf
         swjRJCZtUehNbh7tcxl3dRC6BCmkDlSA/EOZ884e2yfuREJ8nb8i4RPeSr3g7LP9CRNX
         cBfrZQKKenQCeBnN13xN7tX1hAozpLshNhti9QqQszwDVjMZIil+hfRvDeBhpRYVJiHd
         bTyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fISPJgkN0H7LYXqIa8i3iQfM2z/jXKgb3BG/d5Eps08=;
        fh=Td0gCjC4LyynGvkcevjzJyOLgjK9YULHuADfnmhZbAk=;
        b=XL3n5kmmY/P9LXmB0V655r6j1Jqkqw36cY2y6nL2dCgdoghMg1O10R9wR0vjgHZhZK
         9xw+YMlNkz9xrPITpVu4BohrKyK2q4u0fayAk6fZ0G/QvO3KISn5pXmv6EdIMh+hyaOv
         7MupgEcGeyjvA0c9bkfXqJV+rlzh+zCia5JS+PUAZeH/WW+QU7876zMSwYJu6QyyMthR
         w5+X/cC71r4rlXumROuMX7trfvEOlNLqA4iKbJrTYNWUY5oUX6ELtB4iA8eUzT174eLp
         PqlOwsz+qHLlwiyehcmRfoONTOPO4FJCYXDCFm3EwxkuTQclThDkmT13CAz8NBfP+Tfv
         3nfQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791812450; x=1792417250; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fISPJgkN0H7LYXqIa8i3iQfM2z/jXKgb3BG/d5Eps08=;
        b=TvVIycOoSW1Q9PTLKyJkt2KNs2RbVHT1EIBBOHUZcOw5/MLy69DSMUj10Yzm8Qrpqh
         TyZPOLDqEraaymPimFIlzZd2tnHQFBj4iJ8tbKE1zUgBI2yMVJx5Iud3uLDL7yunOdNY
         8N2OdwAVZkXKYu3yG9Y16K5HCKb+9RV+Fn4E0HNuyCFJDC83PU/IpNWq/TyZ50MB3rDh
         zU0GCsRGdxvd9iCcdaNPU/UxDl4XoEayIbQkE4nyGaGiJen5eMiY+mHFc9d08rTtU3QR
         0onQiaA5TPk7mlYjK4Wo6o+TnIYCS4iWfwe93Uz3sxE0+kiK2rxjXGekqO+dLF/iMqm0
         UIiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791812450; x=1792417250;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fISPJgkN0H7LYXqIa8i3iQfM2z/jXKgb3BG/d5Eps08=;
        b=LxSzoOSxAjBY119sHNzNSuzHpxwwECKNVbcG9Ir1+GdcqGMPncGzadFfyldt3WT+54
         7LtvHSelf9pv5lJR60wc6z9ax7I9kn+R59pQqXd+oYLhKw8aPdBtSS8d/UxdoUIbIUsZ
         UM8Dy3Z1+NwKZOU167hca4qeSFz6UdtwvwSLI+5Nzp9YYshUOyB0vG+1et4/BW5EhH+6
         o7U9rfamDOYoyRuKqFq5m7MNfqM3s74K6FSL8IFS9CNVSr3KbSUS4lLGTI6G3vhzK94y
         E5+wms4Vlk53ATsixyQtHOLyQyDlKoOiaKxxNKeUCYfXdo5DeXrpEhKrMoGi2ga/a4ru
         HXAw==
X-Forwarded-Encrypted: i=1; AKwUvBwfblqgEVROhwxMR7SLf5tFypPs0EfWwe6JKB2tfc505e0howOi4gy/yQrYpjVa6g9/ytA=@lists.linux.dev
X-Gm-Message-State: AFq9FYKL6H5epNkohL0UIdeG5iETXyjHKDQ5j2qy0s9y5dtp2wVR73EW
	3EqwoHYSRZZtd5+fryEgF4tsr4wiVHMI7yS3mLt11yY7TtLgZt/Xqu3R5OH5suDwP9c6v8ddPwM
	ChN3xr33D0s1TR2Stx6Sg17YHas1+Kp0=
X-Gm-Gg: AYBFou1lQG5jwiJdDteiKrmZHY1kZTSIb/W4j9T+nPLyVTffi1r4QB5tLZaIfbmI9Bp
	gcnwfA41RiUYe91/HMu3BpPlfMKpEYAzJU17iOs4lSEXxL+steC+N33G7CimA0oUNfbvDOI6g9o
	HAXdTgD9qULxZ4EYIKLEbJEncq3oqWwFrEMfNFFVKjF0zScuAl0y4RY3C2OfwF55JGY9B4Z0psN
	zbVgjlDMdeQdhMvr+BwkNMPFV0Muc3huzGbg3sPf3I0+s+j+nkiQlFQvT0jZbrrtEzq+fOOc5j3
	4eRrkcc+pm8aY0uLVSMYtksq2Q8bj2fRFoPXK1l+Wg0+s9Jre4G2pqZBupvVuPioERDSa69zonc
	s3vvdJKHY
X-Received: by 2002:a05:6102:f10:b0:7c1:918d:d188 with SMTP id
 ada2fe7eead31-7cb373e9685mr2247621137.35.1791812450478; Mon, 12 Oct 2026
 06:40:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261007182238.1154851-2-peter.hunt@opengear.com>
 <CAFEp6-2QsKyZfEdSotVPhxVNOyRzncUphqLY5cRwHXGJiEbzuA@mail.gmail.com>
 <20261009001714.1078580-1-peter.hunt@opengear.com> <20261010171531.1659006-1-peter.hunt@opengear.com>
 <CAFEp6-0vuU2sy3pfgyprMMiLOaKCoZMQN=nHQ+dQR1ku9dbwkw@mail.gmail.com>
In-Reply-To: <CAFEp6-0vuU2sy3pfgyprMMiLOaKCoZMQN=nHQ+dQR1ku9dbwkw@mail.gmail.com>
From: Daniele Palmas <dnlplm@gmail.com>
Date: Mon, 12 Oct 2026 15:40:39 +0200
X-Gm-Features: AclHuK99dZi0qD-kjTJ8chj2shsT6zJyFcPaX8IvEYin0Vx-u0gytz2jHkZuBVk
Message-ID: <CAGRyCJFnszYkYbB8fJneue_DgJY_9yOwK2_T1aB-b+RuK7mqjA@mail.gmail.com>
Subject: Re: [PATCH net-next v8 1/2] net: wwan: core: propagate modem control
 signals to port drivers
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Peter Hunt <peter.hunt@opengear.com>, ryazanov.s.a@gmail.com, 
	johannes@sipsolutions.net, mani@kernel.org, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	netdev@vger.kernel.org, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peter and Loic,

Il giorno lun 12 ott 2026 alle ore 14:15 Loic Poulain
<loic.poulain@oss.qualcomm.com> ha scritto:
>
> Hi Peter,
>
> On Sat, Oct 10, 2026 at 7:16=E2=80=AFPM Peter Hunt <peter.hunt@opengear.c=
om> wrote:
> >
> > Hi Loic,
> >
> > A follow-up to my reply, as I overstated one point and would rather ask
> > than argue on both. (Adding Daniele, as the first question touches his
> > recent QCDM ioctl work.)
> >
> > On the AT-only check: I said QCDM has no DTR semantics, but I don't
> > actually know that. I've only verified DTR/RTS on the AT (DUN) port of =
a
> > Sierra EM9291. I don't know whether the DIAG channel behind QCDM ports
> > honours DTR on these modems, or whether libqcdm relies on it now that
> > QCDM ports have the TIOCM ioctls. So I see two options:
> >
> >   a) Keep it AT-only in all four places (open, close, removal, ioctl).
> >   b) Call ->dtr_rts for any port with the TIOCM ioctls (AT and QCDM)
> >      whenever the driver implements it, again in all four places, and
> >      leave it to the driver to ignore ports where it doesn't apply.
> >
> > Which would you prefer? If you or Daniele know that QCDM/DIAG ports
> > care about DTR, that would settle it for b).
>
> I think we can go with option a) for now. The documentation I have
> only references virtual RS-232 control signals for DUN, and we can
> always revisit this later if additional use cases arise.
>

Agree, I don't think control signals are used for diag.

Regards,
Daniele

> >
> > On the locking: I agree the data_lock/ops_lock split is awkward, and
> > it's this series that made the two locks interact. Most of the races
> > found in earlier versions came from it. My only concern is the blocking
> > write case I mentioned, so the options as I see them are:
> >
> >   a) Use only ops_lock, with the whole ioctl handler under a guard and
> >      mutex_lock_interruptible() so a waiting ioctl can be interrupted,
> >      accepting the wait behind a blocking write on rpmsg ports.
> >   b) Keep data_lock for the termios/TIOCM state and take ops_lock,
> >      interruptibly, only around the ->dtr_rts call. v9 already limits
> >      that to when DTR or RTS actually changes.
> >
> > I'm happy to do either in v9, which do you prefer?
>
> I would also lean toward option a). We may want more fine-grained
> locking in the future, particularly given the blocking write path, but
> I think the current approach is acceptable for now.
>
> Regards,
> Loic
