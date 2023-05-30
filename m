Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62AA94A0C
	for <mhi@lists.linux.dev>; Tue, 30 May 2023 11:23:16 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-96f5685f902so650288166b.2
        for <mhi@lists.linux.dev>; Tue, 30 May 2023 04:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685445794; x=1688037794;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AiBtQpcnGR4P7/eOZeHYTEHahcUyThTulbflkUfN96o=;
        b=H6biMQ/5DnK2+eYc/F/eKyK1wUyjHGTWCYzPKTT40qCeMAWgjxcD7C2fmKrSH0bARa
         YV28Ko6XRRZj33nhmPdgR1DXxv8L8kQZAxrUEwcXTIFNBRfnyHf3feg4NeQVm56JRygC
         WftJpZDh3vckRwhLTxLvN16M6IDgK3GrxlP63cRHP2flaUc4I1vJuNyZ7cnxkhW+D56s
         +p3Y+w+UHzINoUrWFDSaelwqi3xh6KflqKNOyfM5+QBFFvh/gI6+PbX1vAM9g9Ij+iOO
         +OjsG0aIoeptXVwCJJGGTBOgAsnzzCgcD1oGPbCkfDj55QRXNae6PQ7mbETGe79yRCd7
         keQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685445794; x=1688037794;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AiBtQpcnGR4P7/eOZeHYTEHahcUyThTulbflkUfN96o=;
        b=lm3utP/mY9X3zXJf8eHwcrXIav9RmdDQpzMLM0wa4XHv/jDOUPfrUR6J9h8P6hi1UJ
         CebK9FX8sbz2AnzhqZu2qSuLtvrwca20rpoblAXsnWBfwge9UxvSPTCyV/VGDQS1RFUY
         /r6lO2CEziMDckK8J4r9S3WWC5fEIwPzszLd/Q0AEddLf2pLdNrtPGhAefD7IXZ7iKpa
         IM+ca82PVp21QBsCNiagCF+RYF5k/g35jzoW3/qKfL24Ekrnp1qhqcV+AIkAqe4VXA28
         ciLQlQECI7mrfwagKF8J3kQPz5u4bhkxgtalG0+K566mkEKSnKxk6T+qKxSw5IvLxvny
         G8Pg==
X-Gm-Message-State: AC+VfDxNHVCKLgfcFqifl9VNDY3xyDwkC2jsT4xgFJCyo210KR0WZAiR
	VXZEOC81r4+0wQQR9PgpFb9iUMZ5Jad0cAD8RW8=
X-Google-Smtp-Source: ACHHUZ7RJ5ihneof3IXvDvhc5qmvEuAi/oEkOXjYfFnCGcgDLP9ZCqp3yA1GbNJithzKs1pAOPR1n4NRUg1/SMUbg8I=
X-Received: by 2002:a17:907:6d1f:b0:974:1eeb:1ad6 with SMTP id
 sa31-20020a1709076d1f00b009741eeb1ad6mr1921200ejc.30.1685445794319; Tue, 30
 May 2023 04:23:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230530091340.3513141-1-dnlplm@gmail.com> <20230530103103.GB6379@thinkpad>
In-Reply-To: <20230530103103.GB6379@thinkpad>
From: Daniele Palmas <dnlplm@gmail.com>
Date: Tue, 30 May 2023 13:12:59 +0200
Message-ID: <CAGRyCJGR4YsUgWekf_DgYHJqoXNfmFpL-N_virvqE18aU=Ovkg@mail.gmail.com>
Subject: Re: [PATCH 1/1] bus: mhi: host: allow SBL as initial EE
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mani,

Il giorno mar 30 mag 2023 alle ore 12:31 Manivannan Sadhasivam
<mani@kernel.org> ha scritto:
>
> On Tue, May 30, 2023 at 11:13:40AM +0200, Daniele Palmas wrote:
> > There are situations in which SBL is a legitimate initial execution
> > environment (e.g. modem stuck in SBL due to a firmware failure...), but
> > mhi refuses to start:
> >
> > mhi-pci-generic 0000:01:00.0: MHI PCI device found: foxconn-sdx55
> > mhi-pci-generic 0000:01:00.0: BAR 0: assigned
> > mhi-pci-generic 0000:01:00.0: enabling device (0000 -> 0002)
> > mhi mhi0: Requested to power ON
> > mhi mhi0: SECONDARY BOOTLOADER is not a valid EE for power on
> > mhi-pci-generic 0000:01:00.0: failed to power up MHI controller
> > mhi-pci-generic: probe of 0000:01:00.0 failed with error -5
> >
> > Fix this by adding SBL as an allowed initial execution environment.
> >
>
> What can you do with the modem when firmware failure happens? If there is=
 a
> usecase, please explain.

(removing Siddartha and Sujeev due to addresses not working)

A possible scenario for a Telit modem not being able to go to mission
mode is when a firmware update does not work properly: in this case it
remains stuck in SBL, but the SAHARA device can be used for retrying
the firmware update.

Telit FN990 supports the SAHARA channels in pci_generic. It's true
that there's still missing the exposed device for userspace, something
that we are currently managing with out of tree patches, but I see
that there's some ongoing effort for that
https://lore.kernel.org/mhi/20230522190459.13790-1-quic_jhugo@quicinc.com/

I'm not sure if non-Telit modems have other reasonable use-cases.

Regards,
Daniele

>
> - Mani
>
> > Fixes: 3000f85b8f47 ("bus: mhi: core: Add support for basic PM operatio=
ns")
> > Signed-off-by: Daniele Palmas <dnlplm@gmail.com>
> > ---
> >  drivers/bus/mhi/host/internal.h | 2 +-
> >  drivers/bus/mhi/host/pm.c       | 3 ++-
> >  2 files changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/int=
ernal.h
> > index 2e139e76de4c..3bdcd2321aa5 100644
> > --- a/drivers/bus/mhi/host/internal.h
> > +++ b/drivers/bus/mhi/host/internal.h
> > @@ -56,7 +56,7 @@ extern const char * const mhi_ee_str[MHI_EE_MAX];
> >
> >  #define MHI_IN_PBL(ee) (ee =3D=3D MHI_EE_PBL || ee =3D=3D MHI_EE_PTHRU=
 || \
> >                       ee =3D=3D MHI_EE_EDL)
> > -#define MHI_POWER_UP_CAPABLE(ee) (MHI_IN_PBL(ee) || ee =3D=3D MHI_EE_A=
MSS)
> > +#define MHI_POWER_UP_CAPABLE(ee) (MHI_IN_PBL(ee) || ee =3D=3D MHI_EE_A=
MSS || ee =3D=3D MHI_EE_SBL)
> >  #define MHI_FW_LOAD_CAPABLE(ee) (ee =3D=3D MHI_EE_PBL || ee =3D=3D MHI=
_EE_EDL)
> >  #define MHI_IN_MISSION_MODE(ee) (ee =3D=3D MHI_EE_AMSS || ee =3D=3D MH=
I_EE_WFW || \
> >                                ee =3D=3D MHI_EE_FP)
> > diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
> > index 083459028a4b..18872c5017be 100644
> > --- a/drivers/bus/mhi/host/pm.c
> > +++ b/drivers/bus/mhi/host/pm.c
> > @@ -1203,10 +1203,11 @@ int mhi_sync_power_up(struct mhi_controller *mh=
i_cntrl)
> >
> >       wait_event_timeout(mhi_cntrl->state_event,
> >                          MHI_IN_MISSION_MODE(mhi_cntrl->ee) ||
> > +                        mhi_cntrl->ee =3D=3D MHI_EE_SBL ||
> >                          MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state),
> >                          msecs_to_jiffies(mhi_cntrl->timeout_ms));
> >
> > -     ret =3D (MHI_IN_MISSION_MODE(mhi_cntrl->ee)) ? 0 : -ETIMEDOUT;
> > +     ret =3D (MHI_IN_MISSION_MODE(mhi_cntrl->ee) || mhi_cntrl->ee =3D=
=3D MHI_EE_SBL) ? 0 : -ETIMEDOUT;
> >       if (ret)
> >               mhi_power_down(mhi_cntrl, false);
> >
> > --
> > 2.37.1
> >
>
> --
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D
