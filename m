Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B300328E2
	for <mhi@lists.linux.dev>; Mon,  7 Nov 2022 11:32:09 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id i3so10308037pfc.11
        for <mhi@lists.linux.dev>; Mon, 07 Nov 2022 03:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mwsOXXbcfC9fPjVivpon0nxUnv1iu8M1E4VwDE036so=;
        b=HwjEbCai0XhnP/RUIQarlE9bfsmBkDgCqDCOF5dUFqyYssiqdFn8MvDkPr1Q0XQ1Pj
         CeEer3BdC00JYtah1OgHhWFD7FEeXIdTHqCNq/l5B5WtDmLbwvFTSEJh5WOMZqIfZ254
         hIr1csj6KbkARIBEnmh7fNWIBxQZ9uXtlo/ONmYvdv8MlS2SzlyCP6fzFQ++AxnZHbJ1
         Bw9hbjjKguoWE1dJIKht/T48yspuYjguQp12lk1TYz6b/UxuPuHk0h6y52HksR4TMHg9
         ROwX96Tc2xwh7oVG7i/4rwPqek693EFnOuBPV9qtSRchs+6Ahsp/sda91TD8n5p40iv4
         w/QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mwsOXXbcfC9fPjVivpon0nxUnv1iu8M1E4VwDE036so=;
        b=tsOvysDc8LDjAEfz9OEZAZAhphzbUSH6z6I3tKAJ+zSj6TOvDnU8WG7QTg3tOS+Qrd
         ICzwt3nzNEx0CTe/NG7iykIIW3DRO5ht8yQZXe40AnEaIjam6XzNsEAk3EQyfKA0eFpN
         W7ICA49/p393+tLnLj2LkLLz4RABv5ms/dK9Tl/Ty3yxLomDbDzY7ob0NUuSBAm8glfT
         1KaEjMVWuzpTQQHlmFQeXc24BbCb0Zc7qO/SM9ZOUg6aKClaAJoamm4X+2PDACCRG7r0
         aubd3QFzTvauC9zhza27cGHfrAlbeDnRoKGtCri7A2HuOI8UVScjH93ewzGrZ6AMfqrc
         JTlQ==
X-Gm-Message-State: ACrzQf2xQMI/z21dZ0Oepd1zPFL9vaRQ1cgamvoPZrKur1n/KBAu+QWh
	6VxkZbfzv5AdRPcB5SPsaCwW1XhgWT9N4XDmxeg=
X-Google-Smtp-Source: AMsMyM7zwf8phIoE3ww8OFA5vj88vgpNeKkyhY1W/vxSrjcVmEPM/kkmNqbqDSDVIIKqQtBpzLIFVgqddNs2chqqWS0=
X-Received: by 2002:a63:f801:0:b0:46f:fe3f:ea87 with SMTP id
 n1-20020a63f801000000b0046ffe3fea87mr26347950pgh.10.1667820728974; Mon, 07
 Nov 2022 03:32:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221105194943.826847-1-robimarko@gmail.com> <20221107112756.GB2220@thinkpad>
In-Reply-To: <20221107112756.GB2220@thinkpad>
From: Robert Marko <robimarko@gmail.com>
Date: Mon, 7 Nov 2022 12:31:57 +0100
Message-ID: <CAOX2RU6mVCRNobsPDrzpmHqf=KY57GaG4VCruNBfLa8sucydiA@mail.gmail.com>
Subject: Re: [PATCH 1/2] bus: mhi: core: add SBL state callback
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: kvalo@kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, gregkh@linuxfoundation.org, 
	elder@linaro.org, hemantk@codeaurora.org, quic_jhugo@quicinc.com, 
	quic_qianyu@quicinc.com, bbhatt@codeaurora.org, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, ath11k@lists.infradead.org, 
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org, ansuelsmth@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 7 Nov 2022 at 12:28, Manivannan Sadhasivam <mani@kernel.org> wrote:
>
> On Sat, Nov 05, 2022 at 08:49:42PM +0100, Robert Marko wrote:
> > Add support for SBL state callback in MHI core.
> >
> > It is required for ath11k MHI devices in order to be able to set QRTR
> > instance ID in the SBL state so that QRTR instance ID-s dont conflict i=
n
> > case of multiple PCI/MHI cards or AHB + PCI/MHI card.
> > Setting QRTR instance ID is only possible in SBL state and there is
> > currently no way to ensure that we are in that state, so provide a
> > callback that the controller can trigger off.
> >
>
> Where can I find the corresponding ath11k patch that makes use of this
> callback?

Hi Mani,
ath11k patch was sent as part of the same series to everybody included
in this patch as well
under the name of "[PATCH 2/2] wifi: ath11k: use unique QRTR instance ID".

If you did not receive it due to some kind of error, its available at
the linux-wireless patchwork[1]
or ath11k mailing list[2].

[1] https://patchwork.kernel.org/project/linux-wireless/patch/2022110519494=
3.826847-2-robimarko@gmail.com/
[2] http://lists.infradead.org/pipermail/ath11k/2022-November/003678.html

Regards,
Robert

>
> Thanks,
> Mani
>
> > Signed-off-by: Robert Marko <robimarko@gmail.com>
> > ---
> >  drivers/bus/mhi/host/main.c | 1 +
> >  include/linux/mhi.h         | 2 ++
> >  2 files changed, 3 insertions(+)
> >
> > diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
> > index df0fbfee7b78..8b03dd1f0cb8 100644
> > --- a/drivers/bus/mhi/host/main.c
> > +++ b/drivers/bus/mhi/host/main.c
> > @@ -900,6 +900,7 @@ int mhi_process_ctrl_ev_ring(struct mhi_controller =
*mhi_cntrl,
> >                       switch (event) {
> >                       case MHI_EE_SBL:
> >                               st =3D DEV_ST_TRANSITION_SBL;
> > +                             mhi_cntrl->status_cb(mhi_cntrl, MHI_CB_EE=
_SBL_MODE);
> >                               break;
> >                       case MHI_EE_WFW:
> >                       case MHI_EE_AMSS:
> > diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> > index a5441ad33c74..beffe102dd19 100644
> > --- a/include/linux/mhi.h
> > +++ b/include/linux/mhi.h
> > @@ -34,6 +34,7 @@ struct mhi_buf_info;
> >   * @MHI_CB_SYS_ERROR: MHI device entered error state (may recover)
> >   * @MHI_CB_FATAL_ERROR: MHI device entered fatal error state
> >   * @MHI_CB_BW_REQ: Received a bandwidth switch request from device
> > + * @MHI_CB_EE_SBL_MODE: MHI device entered SBL mode
> >   */
> >  enum mhi_callback {
> >       MHI_CB_IDLE,
> > @@ -45,6 +46,7 @@ enum mhi_callback {
> >       MHI_CB_SYS_ERROR,
> >       MHI_CB_FATAL_ERROR,
> >       MHI_CB_BW_REQ,
> > +     MHI_CB_EE_SBL_MODE,
> >  };
> >
> >  /**
> > --
> > 2.38.1
> >
>
> --
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D
