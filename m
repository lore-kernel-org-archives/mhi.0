Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5CB346AC4
	for <mhi@lists.linux.dev>; Thu,  2 Apr 2026 17:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775150566; cv=pass; b=SPCNyu/fZWg0ko2jEykMnXNDdnD0HRre9n41XVODewKMteNaF48OgVKu/mis7+hQa+ljlCrW2Odvs8MlXSOxIevICPCPHS2JmD34iKyHtwPEZUPIgNsYgzYBnWWBoerD5i9H6TsL+P6QzjjuKnG0RfsgHFAJOaqci5GNPSJUeaw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775150566; c=relaxed/simple;
	bh=WWqCEXiW0B6hlC68GRHCWJPE3J/dWb1ME/Z9GBehyQo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XoXXiA9l6syXHNSv0oaBYXJRf+AFK3j/MGC7Bfb//eCc6G8sDlaumzdjmSidoVppA8XR99w2/sxAWy+IWYg/amHJu63tzjwQB7ikQyNg4JyAmBS14Ahs0uaxIbCt51reo2EGwmphm+IwP68hOLUmu7bqnsvSRAxgKkhlEUXiyic=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XT9vfZ2z; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XT9vfZ2z"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2b258576d8cso7508805ad.0
        for <mhi@lists.linux.dev>; Thu, 02 Apr 2026 10:22:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775150564; cv=none;
        d=google.com; s=arc-20240605;
        b=beNLgUF79wezaoGzTlTPknZe/nZ7gEgl9hJtO/37ohXtgsY+mSKX4koEXk60hBQGjF
         Dm62O2pPiSyjOiR1dw5tEBzveFkz3S4tdyC4NdxKF+p/LRkhmmfWQEPumkuQp0m9vI2m
         1nG1ACVi8uNcGJ5zzTI+ocdzxpJeGu10aJ4MdzGPXMBkLdvt976+VMX6Eima3rjYhT/x
         wkb3hxC8Bz5RwDopRVRwWhuKaR8ssOzXYqvlrmcy9AfY/7QFWL1h08V62eQ2TsAfWhvY
         kQVgYzGq42ElYHM0SXLMkq9izBw5Q7bnqm7aBkH4m8gUgGrhxvfHsr78RNRBsWCEdd/G
         027A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OzcGe2VznKMGwsGs0e+o+5hser+dlWZBrMlZvhi/MNk=;
        fh=/iw1Hgq4uF8XGXqkBPexNoLTEkCQ02Yh/wwjlzYp6i8=;
        b=knmRWAFpIp4EPFEILF/uQno4Sk4WtnYUdHNX6qwC4c3UVG61qFACyqYGSbzMncotaB
         LXytCBX28awl09K+wAnBOU7JjgVyi4pgv8+Vd6DBtfaZ3gR7i4vykZjCWzmQKqOlAZYK
         CfFfavGHQ8un4fvSMpebizAz8iQuOiyocmq7yxdV8IN0SnWAWpMJ7d5tQnl0oxcJ5PnM
         xMQ+YXwL2SCnk1s55hwXFkaGm/EGU9fTzmGWcIvHIlNjW7/WcYWNjPzaZwwF0faBJqfw
         E7CxgvhqcSMGNF8QxiIGzOsLjb+ASZmlBQLFDHU1uWZ0g5mVm7ydtT8UTWbNuZQhNlYu
         VR8A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775150564; x=1775755364; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OzcGe2VznKMGwsGs0e+o+5hser+dlWZBrMlZvhi/MNk=;
        b=XT9vfZ2znW8PvA8kqqhT9AdfhSQD6oT8WHwLd0nQbkLfOUtLds/caQOgDpkNbA7pKL
         0qWWaWNqK4G8xE/HskN7EzWfHKU62p1cFvKicbibERgv9UuCc8LNRw7QOqJVE90sTKLp
         dPAkI1m5M1eO7Dn1Jh934YWeLHt22bQxov1PooGtz0+ij5n4KYuhwWP9BF6EuN8bmce4
         Xb2JBbM0J0IRnIQWMx13M4pU1skNtWS8i6+NVxtgWcYkIJWrZkq3a2a7QDSFe+ztLyUF
         nB7+QOjD3PlE0wT/FdIQ9g3FddgYxgrzIYZV4POPaIfN+QUBPeGYZZ7VLhxrdOPKYXTW
         UnwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775150564; x=1775755364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OzcGe2VznKMGwsGs0e+o+5hser+dlWZBrMlZvhi/MNk=;
        b=UHA7fCoTLRcN7JTsGWZai1d5X+vDNMXjf80z0yWbLUWAqXYVCCy4Ye2ahHMAcSxvHA
         TSKrGSGlHKKNgW5vvwtDyHrF9tKqVaTCsNOXk+Xj73XjtZM3K0VDewHD6ijTF1wh8UnS
         6ht99jtnNlDDzLTGktr7FWyZ24A/p68fqEL6LkpWL+jGpiRsrlrSfi8hqrpsz4O7/6ZL
         i0etsTqrFw75S1XIKAiHCTIFJBJasJpemnnxx/qLqate1SWZKMy/oE2c3+5PtkVVTQGT
         vHWE01L+7u+9dUOL+8D5ay00hj6ZF9PtAyPIPFPbIz42pwO/4TDjv7Mhug7ERWnq66Jt
         RYxw==
X-Gm-Message-State: AOJu0YwkUTUvZNRJKjpGV/O/CraEMaU6bI71cfnqC9qIfVsvNnrjm6Mk
	p9NhS8pWHKfl5G230HA282G9m8H/UcGAU8qKXWjL1leMoIIwB5/4eItiEfunPoc+O+jeyt03JzS
	hMEogrDkKppB1BXxaGzFk2BTcCz3oHfCqiWuckel+tQ==
X-Gm-Gg: AeBDieuVKXt2wb6y89qcohAbDLf3c5q7CWS6jbW+Eu9qtkOy/d5UpOnsSx8HtEoEw0J
	0zHu5k7tA0S7CL2DKuX1XJT5kJmwQzg56tlJvQy7jIEbBX6kkxc9R6ncod0nhjNLzSMqXQ+1DFl
	KEdQgG1XaG8BmFDsrS+q3jOBLCh+/ra4k6XrfxvTVfD0jeT9CSybsAPSlh9WgGMR/54i71Apufl
	Vri0r18qP3koZDYT/+KKPsxBIYCELWknA7pPbD0adguZHHr/XbBlqhf8I++U46k0p+VRrnVtbKR
	PFvu/6vKgGafbUAgqDuIwoe9Q7KaKreA8/Jkpysu
X-Received: by 2002:a17:903:1968:b0:2b2:4fc1:f657 with SMTP id
 d9443c01a7336-2b2817d8be9mr1244885ad.6.1775150564309; Thu, 02 Apr 2026
 10:22:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACixm21PgogxqCRSWHOaj2J5VmSphCULi5Lz2nMbGp6zb32beg@mail.gmail.com>
 <CACixm21E8g-k73HpPMQm2AjEu=PDONe5t0XhAHu3kqUMkYkrLA@mail.gmail.com> <w2vvxje5kadmjoh4qxu77jarevqcue2d73lvje75yve7djnxu4@3v4lhwjep4rk>
In-Reply-To: <w2vvxje5kadmjoh4qxu77jarevqcue2d73lvje75yve7djnxu4@3v4lhwjep4rk>
From: Javier Achirica <jachirica@gmail.com>
Date: Thu, 2 Apr 2026 19:22:32 +0200
X-Gm-Features: AQROBzDE5fBG35PY3G892ZljnTv3wuAOHABGy64ini7hrqURRyZnNhUGKljNvWk
Message-ID: <CACixm23MW85ForXdy0k6D+iCZsW+MN9xTWs=xZ2ONkmQRvfqbA@mail.gmail.com>
Subject: Re: bus: mhi: host: pci_generic: round up nr_irqs to a power of two
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 2, 2026 at 6:37=E2=80=AFPM Manivannan Sadhasivam <mani@kernel.o=
rg> wrote:
>
> On Thu, Apr 02, 2026 at 04:44:21PM +0200, Javier Achirica wrote:
> > Hello,
> >
> > I have an issue with a SDX55 modem in a TCL HH500V router, when trying
> > to make it work under kernel 6.12.x (OpenWrt).
> >
> > It looks like when an MHI device uses standard MSI, the PCI core
> > requires the allocated number of vectors to be a strict power of two.
> >
> > In this case, nr_irqs is 5, so the generated mask is wrong and it
> > won't properly work.
>
> Can you please explain what do you mean by 'won't properly work'?

Since 6.12.58, gicv2m_irq_domain_alloc in
drivers/irqchip/irq-gic-v2m.c looks like this:

....
        unsigned long align_mask =3D nr_irqs - 1;

        spin_lock(&v2m_lock);
        list_for_each_entry(tmp, &v2m_nodes, entry) {
                unsigned long align_off =3D tmp->spi_start -
(tmp->spi_start & ~align_mask);
....

If nr_irqs isn't a power of 2, align_mask won't be a proper mask (as
ending in 0's), so align_off won't be the expected alignment offset
and the interrupts won't be delivered properly.

In the specific case of nr_irqs =3D 5, align_mask will be 4 so
~align_mask will be 0xfffb instead of the expected 0xfff8.

> > It can be fixed by explicitly rounding up the
> > requested IRQ count using `roundup_pow_of_two()` before passing it to
> > `pci_alloc_irq_vectors()`.
> >
> > This patch, in 6.12.x tree, will fix it, but I'm not sure of the
> > impact of it on newer kernels and if it's the right way of fixing it.
> > Any tips on how to properly fix this issue?
> >
>
> This change is correct on its own. You just need to apply it to v7.0-rc1 =
and
> send it as proper patch to mhi@lists.linux.dev. TBH this version itself i=
s fine.
>
> But I'm more curious about the issue you are facing as we never saw it, t=
hough
> it is fundamentally wrong to request non-power-of-2 MSIs.

In the MHI PCI driver most of the devices request a non-power-of-2
irqs (they request one per event plus an additional one), so this
patch will fix that for all of them.

Javier

> - Mani
>
> > Thanks!
> > Javier
> >
> > Signed-off-by: Javier Achirica <jachirica@gmail.com>
> > ---
> > diff --git a/drivers/bus/mhi/host/pci_generic.c
> > b/drivers/bus/mhi/host/pci_generic.c
> > --- a/drivers/bus/mhi/host/pci_generic.c        2026-02-19
> > 16:29:56.000000000 +0100
> > +++ b/drivers/bus/mhi/host/pci_generic.c        2026-03-29
> > 13:14:17.053879617 +0200
> > @@ -1014,7 +1014,7 @@
> >          */
> >         mhi_cntrl->nr_irqs =3D 1 + mhi_cntrl_config->num_events;
> >
> > -       nr_vectors =3D pci_alloc_irq_vectors(pdev, 1,
> > mhi_cntrl->nr_irqs, PCI_IRQ_MSI);
> > +       nr_vectors =3D pci_alloc_irq_vectors(pdev, 1,
> > roundup_pow_of_two(mhi_cntrl->nr_irqs), PCI_IRQ_MSI);
> >         if (nr_vectors < 0) {
> >                 dev_err(&pdev->dev, "Error allocating MSI vectors %d\n"=
,
> >                         nr_vectors);
> >
>
> --
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D
