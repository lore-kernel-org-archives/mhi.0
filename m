Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794573791;
	b=d7v4f0MRExR9l4imVajLDKqR3itEPUPwcQrSgM4wFyfuKRq4A6fQU0iDyvP+Fpwer71H
	 IvlgsduMoVvmuy5XHvKsQP6+7soCFW7K6sSwKcq0wKmkl+J+R/lzgOBy0QDgmkZ8xqmkl
	 IU0Q/wfnS6zufIpF1u0YCdD8UhYzqd1cshPJtznBPE+5zkLaCj3xKWniWefj14krVD9WP
	 1yt8lb/GWpMC20rFdrRsib6lWruJ+Axv5ouP2M/GvKsLFXUHsHLgUOKBYrZVPiTm+gwVc
	 eY/aojCDZhpvTGOcKGuKRYCxRhmLrZ18I8bR/o5jIaUzgdWaxb5IYTYjYY4x+zL1DJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794573791;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=eShdbW7sqvfZ7ijY79As2thpO2U2i6N5CJpBkNsicqs=;
	b=NUBGw5js55Fg9gtuPvBFGdL5BNJWfH+OFvjw7vbIoomJ6GTbDbeiOCill3kFGEtaa4tR
	 POWCWs8VRIdNGZwytVNr7XHXy4mYQCdzMiTLgKNGIaZM/caB7oCsdrLhpRVVLIJWh8jgg
	 I3NsTgajewjgKYyBoHJU+ZXl2MmqeLuPNlaPHb4/no/v5SgzmlMPcvGGVM2zJ/ZBZ3sag
	 Z+QBugjw9HHUeV+7SlqvIDM5VFZTLpoy3sZPkXkEuR2MDC36bS/UDUk8HfZxqyhtm01Zw
	 3RQCGyg9v3DKBthTgrDCBzZLNJiz9By37TsW+BL1PRt7XWcaE2rYd80J0lDi2nvPu2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EDEqVvYu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14E9606A32D
	for <mhi@lists.linux.dev>; Fri, 13 Nov 2026 12:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EDEqVvYu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 748681F000C5
	for <mhi@lists.linux.dev>; Fri, 13 Nov 2026 12:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794573791;
	bh=eShdbW7sqvfZ7ijY79As2thpO2U2i6N5CJpBkNsicqs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=EDEqVvYuTKMLMu6f42/+Teh3wbTsvwjrn1MuaXI9yRoL9mfa5a5xgX5qRTK/A262K
	 0OgCI0uGj9YRZ1MhRfg3JQkFBwwUfyEQH0U8W64vP10lite0zEnYem9z4VfMmLzhlH
	 2mfQzmWSTYeXxQhypZeMbQyTw6MRGPfCBgxOjXmGJL1DALkVt48hQBSesq9mmGLao4
	 OCnl3bbnS/M/thvZj4RdkN5RRAUhGhQxZRzfXwwQJm6CGQdZm93O9p0YvCaYcHLiWr
	 szrX2MTQnUckkM16gr8/kz9ubzPhpD8+x+GQe/4fYMTjxkcUZhV/Zlchpj8ammcb08
	 x4xPtLgqwOUhQ==
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b56221d361so1897285a12.3
        for <mhi@lists.linux.dev>; Fri, 13 Nov 2026 04:43:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEbOYM9N4HkD90jotnzkMTB4tneBt78+i8/NFwlk2h1TVzsxTsWQPH+eAHr+6oaR5Gdf+4=@lists.linux.dev
X-Gm-Message-State: APuU4Z82AaXTmEMjVkHQXs+hIq09AeFdwsd+68j4utcuMVPYH1cTgAPE
	sej0CDAjTMUsn9hKK0L5xomlxkMnAf94MWqwOVJVuhpaXlbstQjm4mee+mz1AMFj7rF5suvfdH5
	Rkxh5HFmUotL0qDAE/WAjk3Qn643u8lw=
X-Received: by 2002:aa7:d587:0:b0:6b5:fb30:5651 with SMTP id
 4fb4d7f45d1cf-6b7c0be070fmr1524244a12.26.1794573790409; Fri, 13 Nov 2026
 04:43:10 -0800 (PST)
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Post: <mailto:mhi@lists.linux.dev>
List-Help: <mailto:mhi+help@lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mhi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <b47282f1514a9012ac51d0915afb83782c3c0050.1794417398.git.len.brown@intel.com>
 <CAFEp6-0yj-+7uYnj5PCvaP39ruQ=xduBbQgJc7MyakuPLJhmvw@mail.gmail.com>
In-Reply-To: <CAFEp6-0yj-+7uYnj5PCvaP39ruQ=xduBbQgJc7MyakuPLJhmvw@mail.gmail.com>
From: Len Brown <lenb@kernel.org>
Date: Fri, 13 Nov 2026 09:42:57 -0300
X-Gmail-Original-Message-ID: <CAJvTdKnnqZJrZ6bgaxsyy6QttGwgh5RL=De9ggV3KhMPDau_BQ@mail.gmail.com>
X-Gm-Features: AclHuK-qV3odlCZg-rvJ7Er0tAbjRJL99Hmn9EJPElO7oP1o5xdv9czMmzm7XIs
Message-ID: <CAJvTdKnnqZJrZ6bgaxsyy6QttGwgh5RL=De9ggV3KhMPDau_BQ@mail.gmail.com>
Subject: Re: [PATCH] bus: mhi: pci_generic: Fix erroneous system suspend abort
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: rafael@kernel.org, Manivannan Sadhasivam <mani@kernel.org>, linux-pm@vger.kernel.org, 
	mhi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Loic,

I agree that the device and the driver should be debugged, and perhaps
re-implemented.

Indeed, I'm happy to share the dmesg from 28,000 suspend/resume cycles
on this machine
over the last few months to support that effort, should somebody else
undertake it.

But today, this device is allowing its internal contagion to spread
into Linux and interfere with
system wide suspend due to an obvious 1-line programming error.

This 1-line fix should be applied NOW, without waiting for internal
mhi internal or development.

thanks,
-Len

ps.  I filed this over a year ago:
https://bugzilla.kernel.org/show_bug.cgi?id=3D220020

On Thu, Nov 12, 2026 at 5:23=E2=80=AFAM Loic Poulain
<loic.poulain@oss.qualcomm.com> wrote:
>
> Hi Len,
>
> On Wed, Nov 11, 2026 at 6:23=E2=80=AFPM Len Brown <lenb@kernel.org> wrote=
:
> >
> > From: Len Brown <len.brown@intel.com>
> >
> > mhi sometimes aborts system suspend on the thinkpad T16 gen3:
> >
> > mhi-pci-generic 0000:08:00.0: failed to suspend device: -16
> > mhi-pci-generic 0000:08:00.0: PM: pci_pm_suspend(): mhi_pci_suspend [mh=
i_pci_generic] returns -16
> > mhi-pci-generic 0000:08:00.0: PM: dpm_run_callback(): pci_pm_suspend re=
turns -16
> > mhi-pci-generic 0000:08:00.0: PM: pci_pm_suspend returned -16 after 151=
45 usecs
> > mhi-pci-generic 0000:08:00.0: PM: failed to suspend async: error -16
> >
> > When a driver returns -EBUSY for its runtime suspend method,
> > that means "try again later".
> >
> > But when a driver returns anything but 0 from its system-suspend
> > method, that means "abort system suspend".
> >
> > Always return 0 from mhi_pci_suspend().
>
> Two things:
> - I think we should simply use pm_runtime_force_suspend() /
> pm_runtime_force_resume() for the system sleep callbacks instead of
> implementing separate suspend/resume handling.
> - Rather than silently ignoring the error, I think it would be worth
> looking at the mhi_pm_suspend() implementation to understand what can
> be returned here and under which conditions the MHI device fails to
> suspend.
>
> Regards,
> Loic
>
> >
> > Fixes: d3800c1dce24 ("bus: mhi: pci_generic: Add support for runtime PM=
")
> > Signed-off-by: Len Brown <len.brown@intel.com>
> > ---
> >  drivers/bus/mhi/host/pci_generic.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/=
pci_generic.c
> > index 7193a384cca4..b036fa6e06c4 100644
> > --- a/drivers/bus/mhi/host/pci_generic.c
> > +++ b/drivers/bus/mhi/host/pci_generic.c
> > @@ -1727,7 +1727,8 @@ static int __maybe_unused mhi_pci_runtime_resume(=
struct device *dev)
> >  static int  __maybe_unused mhi_pci_suspend(struct device *dev)
> >  {
> >         pm_runtime_disable(dev);
> > -       return mhi_pci_runtime_suspend(dev);
> > +       mhi_pci_runtime_suspend(dev);
> > +       return 0;
> >  }
> >
> >  static int __maybe_unused mhi_pci_resume(struct device *dev)
> > --
> > 2.45.2
> >



--=20
Len Brown, Intel Open Source Technology Center
