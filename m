Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FAD14274
	for <mhi@lists.linux.dev>; Thu,  1 Jun 2023 09:51:14 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5149e65c244so985200a12.3
        for <mhi@lists.linux.dev>; Thu, 01 Jun 2023 02:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685613073; x=1688205073;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ipYHDpe1QatHXo7eCL9Afp3YAb0BU3UNGO/X/1rrl8s=;
        b=lLP+JzhOp96rZKqFBa+BET4AFt0Xw0A+GVYtYhnDcCV0dlKUcpL7Av8egVwZHi8kPA
         jAX3ldb3QG6qCjF8R0Y45kuST8N0s1eHp0Kl16LDTU27xo9PBbfrLRxuRNUBL6BoIher
         LleGiJL5TwT20ipkYQB4dJVpl49Jf74FarIIUjHKdIS40xpWCw+3oVv1GMIP0znX3y2E
         oxb9T3OEcH8nYnZWnTAOFI1Um/ZQtKeGJ/+9RWrSdcg1TaZVmuhxBW2XjfPQCKyoJemH
         LDCBVeWQM5jxk0J82P8zc3f1a9eBOqRIOSOERajQxFPlhLnixCNZ5nkoX07Bi0vXrtdI
         OxYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685613073; x=1688205073;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ipYHDpe1QatHXo7eCL9Afp3YAb0BU3UNGO/X/1rrl8s=;
        b=F1VQeU7afuAa75h4gHdELqbKdihHLe4m6pd9kP7BpPma/9dVRhQJdUhb4YUbhDwWUJ
         YKWsRztdRf7mEekDvCFJ4b6TWZJTXNk+KhFSsGpnCvPj4+iayC5MBm0Uq0nIhmVBp58m
         kOHYq/5MecFRXKKPqqfB/o6pqTpCgO1wm0NA1BFTR9z91qOS4AYIuqpUkOnCUJ3jiIIO
         kpdEOC0XxbQRTjAdgD6B7MigcZAfYqllorN+fUGqQZxHqZ+qsIH+mHFN50awc0/uDJCf
         +5MEucEira9pdHvaJARTDfvKWuCf27sZpZf6JOPPRK5Gwa8mvH4MkMWxwiufwB5QHjJD
         vakQ==
X-Gm-Message-State: AC+VfDzlkFB+PvotWeLuWnEL7fApWmG46UDkuA7AAXGQYUO2JWkZPSM8
	7bIMiwZ0kWX/8JNRNKx1TzzgaXCI3ZaPikRRuYk=
X-Google-Smtp-Source: ACHHUZ5cYVNSeZ0igWxvLnhE1d9sg8AB9rs7tSqt9svZ+JNJIIna6GFgG0SPZwG0B2wPbX35LQ3o9gaZMoF0Cbalq1M=
X-Received: by 2002:aa7:c712:0:b0:50c:451b:d0f0 with SMTP id
 i18-20020aa7c712000000b0050c451bd0f0mr5758858edq.37.1685613072652; Thu, 01
 Jun 2023 02:51:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230530091340.3513141-1-dnlplm@gmail.com> <20230530103103.GB6379@thinkpad>
 <CAGRyCJGR4YsUgWekf_DgYHJqoXNfmFpL-N_virvqE18aU=Ovkg@mail.gmail.com>
 <20230530135620.GA2313@thinkpad> <CAGRyCJG6+k4PZq0V3h-c-SiEm_7ExjoACTtbgCOEeSt3AQjM3g@mail.gmail.com>
 <20230531130104.GG7968@thinkpad>
In-Reply-To: <20230531130104.GG7968@thinkpad>
From: Daniele Palmas <dnlplm@gmail.com>
Date: Thu, 1 Jun 2023 11:51:01 +0200
Message-ID: <CAGRyCJGXEzUHOp=5emq1a50-oCgWSjn+sPPFR4DKn019kQTQcw@mail.gmail.com>
Subject: Re: [PATCH 1/1] bus: mhi: host: allow SBL as initial EE
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Il giorno mer 31 mag 2023 alle ore 15:01 Manivannan Sadhasivam
<mani@kernel.org> ha scritto:
>
> On Wed, May 31, 2023 at 01:44:24PM +0200, Daniele Palmas wrote:
> > Il giorno mar 30 mag 2023 alle ore 15:56 Manivannan Sadhasivam
> > <mani@kernel.org> ha scritto:
> > >
> > > On Tue, May 30, 2023 at 01:12:59PM +0200, Daniele Palmas wrote:
> > > > Hi Mani,
> > > >
> > > > Il giorno mar 30 mag 2023 alle ore 12:31 Manivannan Sadhasivam
> > > > <mani@kernel.org> ha scritto:
> > > > >
> > > > > On Tue, May 30, 2023 at 11:13:40AM +0200, Daniele Palmas wrote:
> > > > > > There are situations in which SBL is a legitimate initial execu=
tion
> > > > > > environment (e.g. modem stuck in SBL due to a firmware failure.=
..), but
> > > > > > mhi refuses to start:
> > > > > >
> > > > > > mhi-pci-generic 0000:01:00.0: MHI PCI device found: foxconn-sdx=
55
> > > > > > mhi-pci-generic 0000:01:00.0: BAR 0: assigned
> > > > > > mhi-pci-generic 0000:01:00.0: enabling device (0000 -> 0002)
> > > > > > mhi mhi0: Requested to power ON
> > > > > > mhi mhi0: SECONDARY BOOTLOADER is not a valid EE for power on
> > > > > > mhi-pci-generic 0000:01:00.0: failed to power up MHI controller
> > > > > > mhi-pci-generic: probe of 0000:01:00.0 failed with error -5
> > > > > >
> > > > > > Fix this by adding SBL as an allowed initial execution environm=
ent.
> > > > > >
> > > > >
> > > > > What can you do with the modem when firmware failure happens? If =
there is a
> > > > > usecase, please explain.
> > > >
> > > > (removing Siddartha and Sujeev due to addresses not working)
> > > >
> > >
> > > Both left Qualcomm a while ago...
> > >
> > > > A possible scenario for a Telit modem not being able to go to missi=
on
> > > > mode is when a firmware update does not work properly: in this case=
 it
> > > > remains stuck in SBL, but the SAHARA device can be used for retryin=
g
> > > > the firmware update.
> > > >
> > >
> > > So IIUC, while updating SBL over SAHARA channel, the firmware update =
could be
> > > corrupted and the device would get stuck in SBL EE. In that case, the=
 SAHARA
> > > channel exposed by PBL will still be open and that could be used to r=
etry the
> > > firmware update. Am I right?
> > >
> > > Looks like PBL is doing a fail safe upgrade!
> > >
> >
> > Yes, the scenario is a broken firmware update.
> >
> > Telit has implemented custom code in the SBL for allowing the firmware
> > update through a custom protocol using the SAHARA channels: this has
> > been mainly done to avoid sharing with customers Qualcomm IP about
> > firmware update, since it is usually problematic.
> >
> > Firmware update is fail safe in the sense that it is guaranteed that
> > the modem will always power-up at least in SBL, in which the firmware
> > update can always be retried. I don't have the exact details of what
> > is happening inside the modem, but, if required, I can get them.
> >
>
> Okay, I didn't now that it is a custom SBL, so yeah it may not benefit ot=
her
> platforms. But what is the userspace tool that you are using to download
> firmware over SAHARA?

The userspace tool is not public at the moment, but will check about
the plans for open-sourcing.

> Can QDL be used?

I will check that with firmware developers.

Reading also Jeffrey's reply, since this looks like a Telit modem
quirk, I'm wondering if it could make sense to deal with this again
once the quirk framework at
https://lore.kernel.org/mhi/20230519163902.4170-2-quic_jhugo@quicinc.com/T/=
#u
gets merged, otherwise I guess we can continue living with custom
patches.

Thanks,
Daniele

> - Mani
>
> > > > Telit FN990 supports the SAHARA channels in pci_generic. It's true
> > > > that there's still missing the exposed device for userspace, someth=
ing
> > > > that we are currently managing with out of tree patches, but I see
> > > > that there's some ongoing effort for that
> > > > https://lore.kernel.org/mhi/20230522190459.13790-1-quic_jhugo@quici=
nc.com/
> > > >
> > > > I'm not sure if non-Telit modems have other reasonable use-cases.
> > > >
> > >
> > > If my above understanding is correct, then this patch will benefit ot=
her
> > > platforms too.
> > >
> >
> > Well... I can't comment on that, since I don't know if the above
> > described behavior is due to Telit custom SBL.
> >
> > Anyway, maybe there could be other scenarios like, for example, modem
> > falling into core dump mode in a very early stage? Not sure...
> >
> > Regards,
> > Daniele
> >
> > > - Mani
> > >
> > > > Regards,
> > > > Daniele
> > > >
> > > > >
> > > > > - Mani
> > > > >
> > > > > > Fixes: 3000f85b8f47 ("bus: mhi: core: Add support for basic PM =
operations")
> > > > > > Signed-off-by: Daniele Palmas <dnlplm@gmail.com>
> > > > > > ---
> > > > > >  drivers/bus/mhi/host/internal.h | 2 +-
> > > > > >  drivers/bus/mhi/host/pm.c       | 3 ++-
> > > > > >  2 files changed, 3 insertions(+), 2 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/=
host/internal.h
> > > > > > index 2e139e76de4c..3bdcd2321aa5 100644
> > > > > > --- a/drivers/bus/mhi/host/internal.h
> > > > > > +++ b/drivers/bus/mhi/host/internal.h
> > > > > > @@ -56,7 +56,7 @@ extern const char * const mhi_ee_str[MHI_EE_M=
AX];
> > > > > >
> > > > > >  #define MHI_IN_PBL(ee) (ee =3D=3D MHI_EE_PBL || ee =3D=3D MHI_=
EE_PTHRU || \
> > > > > >                       ee =3D=3D MHI_EE_EDL)
> > > > > > -#define MHI_POWER_UP_CAPABLE(ee) (MHI_IN_PBL(ee) || ee =3D=3D =
MHI_EE_AMSS)
> > > > > > +#define MHI_POWER_UP_CAPABLE(ee) (MHI_IN_PBL(ee) || ee =3D=3D =
MHI_EE_AMSS || ee =3D=3D MHI_EE_SBL)
> > > > > >  #define MHI_FW_LOAD_CAPABLE(ee) (ee =3D=3D MHI_EE_PBL || ee =
=3D=3D MHI_EE_EDL)
> > > > > >  #define MHI_IN_MISSION_MODE(ee) (ee =3D=3D MHI_EE_AMSS || ee =
=3D=3D MHI_EE_WFW || \
> > > > > >                                ee =3D=3D MHI_EE_FP)
> > > > > > diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/p=
m.c
> > > > > > index 083459028a4b..18872c5017be 100644
> > > > > > --- a/drivers/bus/mhi/host/pm.c
> > > > > > +++ b/drivers/bus/mhi/host/pm.c
> > > > > > @@ -1203,10 +1203,11 @@ int mhi_sync_power_up(struct mhi_contro=
ller *mhi_cntrl)
> > > > > >
> > > > > >       wait_event_timeout(mhi_cntrl->state_event,
> > > > > >                          MHI_IN_MISSION_MODE(mhi_cntrl->ee) ||
> > > > > > +                        mhi_cntrl->ee =3D=3D MHI_EE_SBL ||
> > > > > >                          MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_st=
ate),
> > > > > >                          msecs_to_jiffies(mhi_cntrl->timeout_ms=
));
> > > > > >
> > > > > > -     ret =3D (MHI_IN_MISSION_MODE(mhi_cntrl->ee)) ? 0 : -ETIME=
DOUT;
> > > > > > +     ret =3D (MHI_IN_MISSION_MODE(mhi_cntrl->ee) || mhi_cntrl-=
>ee =3D=3D MHI_EE_SBL) ? 0 : -ETIMEDOUT;
> > > > > >       if (ret)
> > > > > >               mhi_power_down(mhi_cntrl, false);
> > > > > >
> > > > > > --
> > > > > > 2.37.1
> > > > > >
> > > > >
> > > > > --
> > > > > =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=
=E0=AE=A9=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=
=E0=AE=AE=E0=AF=8D
> > >
> > > --
> > > =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=
=A9=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=
=AE=E0=AF=8D
>
> --
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D
