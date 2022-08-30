Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49779468F
	for <mhi@lists.linux.dev>; Tue, 30 Aug 2022 17:46:06 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id n202so9866783iod.6
        for <mhi@lists.linux.dev>; Tue, 30 Aug 2022 10:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=J2cP1zEmJs4AW+kwzgO3IXRQKPxdp1Guit6RAokACzU=;
        b=M2y48DtXF6XjIuX6NRVfCh37l04NO15D1Fdya5Ed4KYDmbLRK/E2UNZrHuPrIsgdzH
         nvdahC7hHkEGoY0H+yKxAKMn8D2EGVxh3xENediJjaDTVbyA1G/3GRXNY74S4/sPCTYu
         7VqFDf+DKVrwQdKDJ2mVGzszhnNiipNX4TfL4HIqUBHQHQwJxnTfldYqyiYXSdjNgxES
         OFhTBho98Nt60vqaAS1aYf4Sh24zV2ZHpXtoDR/3TYswEN9H0GNgGtsw6DGrGaygoHfu
         c3NwhJhPS5HG0+tj31k4UdkU2ucOLIhAIMnrpJOogXE4fpTVydhkb/GtirbAOJIlgMYG
         Yong==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=J2cP1zEmJs4AW+kwzgO3IXRQKPxdp1Guit6RAokACzU=;
        b=Oi65Hi5qDsfBpI65+B/KgaZy+8cTSqF0FAw0paKkZX0tL6AhjE1zOhi2Vx7PJ1WcWu
         8G2MPlm6ZDHhUVq0j7XP1GFFu0WMspbgOwj/4rQ6w5f8hbZQ8QavO25nWF2tBNH+DjF7
         L5FfwlLt9axMaNOLNmTtcC4fI8XDeSrD4fq+9GXvNGlEOupyM76SkslyXda2kfau9kS9
         Gl2eNXNaV36UnNFNSBlNfD4JjFKRdx1rq0n2lXo6RNbbcg2QANvmRKpiBhw3RUYl7lsK
         jjCzADk/wxEPT1cz7WymvJOAUeIdSC+Z9fITLEgLEnnEXg+bl0HZRNmiWUrPW5em28d1
         rnKA==
X-Gm-Message-State: ACgBeo39VuJ5QHLt4mYsRo26UhxMLiQD4inrOrKk+xhcajXAgSNDSmok
	GKb6NmF35jdLLT2vylrB9eQxHmk4x9JocMjOGXj6SQ==
X-Google-Smtp-Source: AA6agR6Za2oYgKv6pNdml/KexbJSMzuGkEAlUBCUuvOapb7jS1nNo9qCufwJXeo9lp5qbVIRcoIOINn1uiBJ+AAOd2E=
X-Received: by 2002:a02:9509:0:b0:349:b6cb:9745 with SMTP id
 y9-20020a029509000000b00349b6cb9745mr13303150jah.281.1661881565235; Tue, 30
 Aug 2022 10:46:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220819083615.251960-1-koen.vandeputte@ncentric.com> <20220829173708.GC84762@thinkpad>
In-Reply-To: <20220829173708.GC84762@thinkpad>
From: Loic Poulain <loic.poulain@linaro.org>
Date: Tue, 30 Aug 2022 19:45:28 +0200
Message-ID: <CAMZdPi-op+SnOKvtnsTiEKPNayq20to+Vyne6oFU9XoQ6spbeA@mail.gmail.com>
Subject: Re: [PATCH] bus: mhi: host: always print detected modem name
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Koen Vandeputte <koen.vandeputte@citymesh.com>, mhi@lists.linux.dev, 
	Koen Vandeputte <koen.vandeputte@ncentric.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 29 Aug 2022 at 19:37, Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
>
> + Loic
>
> On Fri, Aug 19, 2022 at 10:36:15AM +0200, Koen Vandeputte wrote:
> > This harmless print provides a very easy way of knowing
> > if the modem is detected properly during probing.
> >
> > Promote it to an informational print so no hassle is required
> > enabling kernel debugging info to obtain it.
> >
> > The rationale here is that:
> > On a lot of low-storage embedded devices, extensive kernel
> > debugging info is not always present as this would
> > increase it's size to much causing partition size issues.
> >
> > Signed-off-by: Koen Vandeputte <koen.vandeputte@ncentric.com>
>
> The justification makes sense to me.
>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Fair enough.

Reviewed-by: Loic Poulain <loic.poulain@linaro.org>

>
> Thanks,
> Mani
>
> > ---
> >  drivers/bus/mhi/host/pci_generic.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/=
pci_generic.c
> > index 9e545f2a5a26..51e2b901bae0 100644
> > --- a/drivers/bus/mhi/host/pci_generic.c
> > +++ b/drivers/bus/mhi/host/pci_generic.c
> > @@ -841,7 +841,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, cons=
t struct pci_device_id *id)
> >       struct mhi_controller *mhi_cntrl;
> >       int err;
> >
> > -     dev_dbg(&pdev->dev, "MHI PCI device found: %s\n", info->name);
> > +     dev_info(&pdev->dev, "MHI PCI device found: %s\n", info->name);
> >
> >       /* mhi_pdev.mhi_cntrl must be zero-initialized */
> >       mhi_pdev =3D devm_kzalloc(&pdev->dev, sizeof(*mhi_pdev), GFP_KERN=
EL);
> > --
> > 2.34.1
> >
> >
>
> --
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D
