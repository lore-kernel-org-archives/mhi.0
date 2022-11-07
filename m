Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0817F12294
	for <mhi@lists.linux.dev>; Mon,  7 Nov 2022 17:53:01 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id v4-20020a17090a088400b00212cb0ed97eso10986418pjc.5
        for <mhi@lists.linux.dev>; Mon, 07 Nov 2022 09:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pGDSu1HwTp8Hzn3+6AcUul22zLdVAgEAi2l5r8MevaA=;
        b=e17zQN/Ll1K6hypKVJs5dl5uuIsryhnGpiFwe6zSfvsir+kyCQ6q4vVBFWyCSZSKJm
         kTBt6/i7ONJgtHzmjRnDFeJEan7C/CBfH+yhfZI1F+iGqMMI8V9mMt4KCNWI6TKpBfzx
         mnMhg6OKNgxbTuVw7D/Gk2cUtNX7/wtuRcswUJEL0J0y5u3WOPukQB2+0sMW8PJFgqXm
         BRDPIdU+X/sRv3/KUdrvzCpxRklxuc+Alk/bHBGosiw9vceQ2BwYDDJyp10iSeeXpWcC
         wtHCFLWvmUBOh83V+2vFmdqUz/XPDUsgBTzh5e+aFGyDqmw+DVQIpySEXNbKQB7I5x2r
         C5iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pGDSu1HwTp8Hzn3+6AcUul22zLdVAgEAi2l5r8MevaA=;
        b=osrUwXxTdHhp1I19M1yanJEOFCUXhmPkA0673QgjOQCdIf71cFXq/9/5eyuZLw3Ncm
         KW4PBCHw3UmOe8x2pURjwbrQ9VB8DIKxJ9Vtte4qFJbAqubpRicp3T8jy1QS7tAdnGms
         QHxDzIx9bdbtvyoV1yb5IHBAsSe+X3sBJrfsqetA/j3Aohdh4AvRCuj7PRhRr7WYdedS
         11yfkSGT12vc3P0b+EhmbGG8yystcFKw/TPoYf6q58eBvehAeLKaNA77drOvSnHXEv72
         bAXi8p/4SqmwwCOu2Xr14xa3ijwgPNzlxjZrFwRvDAUxBCKivWey86rPYQjYr+JEBkO9
         BM6A==
X-Gm-Message-State: ACrzQf0HVGuLNZdogKRlCAN4WIF8FvJMOdWZNwXx8ZndfuYMuPvhRY+Z
	Be1TGc5sDUn6SPWrL82k8ONxWOqBK+DBE9YhjAc=
X-Google-Smtp-Source: AMsMyM4iy2nvTFr7Z2bZsHmiKiAOBu1+srKDKqpX25TlNV5rpb8bFpzBaTL0p98tPmePjGnMrwcSBGCViCx3yeiPvXQ=
X-Received: by 2002:a17:902:7c12:b0:186:8111:ade2 with SMTP id
 x18-20020a1709027c1200b001868111ade2mr51463799pll.111.1667843581400; Mon, 07
 Nov 2022 09:53:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221105194943.826847-1-robimarko@gmail.com> <20221105194943.826847-2-robimarko@gmail.com>
 <20221107174727.GA7535@thinkpad>
In-Reply-To: <20221107174727.GA7535@thinkpad>
From: Robert Marko <robimarko@gmail.com>
Date: Mon, 7 Nov 2022 18:52:50 +0100
Message-ID: <CAOX2RU5OZKpDUqB67kDBrqaG-gfJfYAcgUkmnebRZtVpWc3CEQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] wifi: ath11k: use unique QRTR instance ID
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: kvalo@kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, gregkh@linuxfoundation.org, 
	elder@linaro.org, hemantk@codeaurora.org, quic_jhugo@quicinc.com, 
	quic_qianyu@quicinc.com, bbhatt@codeaurora.org, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, ath11k@lists.infradead.org, 
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org, ansuelsmth@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 7 Nov 2022 at 18:47, Manivannan Sadhasivam <mani@kernel.org> wrote:
>
> On Sat, Nov 05, 2022 at 08:49:43PM +0100, Robert Marko wrote:
> > Currently, trying to use AHB + PCI/MHI cards or multiple PCI/MHI cards
> > will cause a clash in the QRTR instance node ID and prevent the driver
> > from talking via QMI to the card and thus initializing it with:
> > [    9.836329] ath11k c000000.wifi: host capability request failed: 1 9=
0
> > [    9.842047] ath11k c000000.wifi: failed to send qmi host cap: -22
> >
>
> There is still an outstanding issue where you cannot connect two WLAN mod=
ules
> with same node id.

Yes, but as far as I can understand QRTR that is never gonna be
possible, node ID-s
must be different, but I dont have any docs at all.

>
> > So, in order to allow for this combination of cards, especially AHB + P=
CI
> > cards like IPQ8074 + QCN9074 (Used by me and tested on) set the desired
> > QRTR instance ID offset by calculating a unique one based on PCI domain
> > and bus ID-s and writing it to bits 7-0 of BHI_ERRDBG2 MHI register by
> > using the SBL state callback that is added as part of the series.
> > We also have to make sure that new QRTR offset is added on top of the
> > default QRTR instance ID-s that are currently used in the driver.
> >
>
> Register BHI_ERRDBG2 is listed as Read only from Host as per the BHI spec=
.
> So I'm not sure if this solution is going to work on all ath11k supported
> chipsets.
>
> Kalle, can you confirm?
>
> > This finally allows using AHB + PCI or multiple PCI cards on the same
> > system.
> >
> > Before:
> > root@OpenWrt:/# qrtr-lookup
> >   Service Version Instance Node  Port
> >      1054       1        0    7     1 <unknown>
> >        69       1        2    7     3 ATH10k WLAN firmware service
> >
> > After:
> > root@OpenWrt:/# qrtr-lookup
> >   Service Version Instance Node  Port
> >      1054       1        0    7     1 <unknown>
> >        69       1        2    7     3 ATH10k WLAN firmware service
> >        15       1        0    8     1 Test service
> >        69       1        8    8     2 ATH10k WLAN firmware service
> >
> > Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1-01208-QCAHKSWPL_SILICONZ-1
> > Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01208-QCAHKSWPL_SILICONZ-1
> >
> > Signed-off-by: Robert Marko <robimarko@gmail.com>
> > ---
> >  drivers/net/wireless/ath/ath11k/mhi.c | 47 ++++++++++++++++++---------
> >  drivers/net/wireless/ath/ath11k/mhi.h |  3 ++
> >  drivers/net/wireless/ath/ath11k/pci.c |  5 ++-
> >  3 files changed, 38 insertions(+), 17 deletions(-)
> >
> > diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wirele=
ss/ath/ath11k/mhi.c
> > index 86995e8dc913..23e85ea902f5 100644
> > --- a/drivers/net/wireless/ath/ath11k/mhi.c
> > +++ b/drivers/net/wireless/ath/ath11k/mhi.c
> > @@ -294,6 +294,32 @@ static void ath11k_mhi_op_runtime_put(struct mhi_c=
ontroller *mhi_cntrl)
> >  {
> >  }
> >
> > +static int ath11k_mhi_op_read_reg(struct mhi_controller *mhi_cntrl,
> > +                               void __iomem *addr,
> > +                               u32 *out)
> > +{
> > +     *out =3D readl(addr);
> > +
> > +     return 0;
> > +}
> > +
> > +static void ath11k_mhi_op_write_reg(struct mhi_controller *mhi_cntrl,
> > +                                 void __iomem *addr,
> > +                                 u32 val)
> > +{
> > +     writel(val, addr);
> > +}
> > +
> > +static void ath11k_mhi_qrtr_instance_set(struct mhi_controller *mhi_cn=
trl)
> > +{
> > +     struct ath11k_base *ab =3D dev_get_drvdata(mhi_cntrl->cntrl_dev);
> > +
> > +     ath11k_mhi_op_write_reg(mhi_cntrl,
> > +                             mhi_cntrl->bhi + BHI_ERRDBG2,
> > +                             FIELD_PREP(QRTR_INSTANCE_MASK,
> > +                             ab->qmi.service_ins_id - ab->hw_params.qm=
i_service_ins_id));
> > +}
> > +
> >  static char *ath11k_mhi_op_callback_to_str(enum mhi_callback reason)
> >  {
> >       switch (reason) {
> > @@ -315,6 +341,8 @@ static char *ath11k_mhi_op_callback_to_str(enum mhi=
_callback reason)
> >               return "MHI_CB_FATAL_ERROR";
> >       case MHI_CB_BW_REQ:
> >               return "MHI_CB_BW_REQ";
> > +     case MHI_CB_EE_SBL_MODE:
> > +             return "MHI_CB_EE_SBL_MODE";
> >       default:
> >               return "UNKNOWN";
> >       }
> > @@ -336,27 +364,14 @@ static void ath11k_mhi_op_status_cb(struct mhi_co=
ntroller *mhi_cntrl,
> >               if (!(test_bit(ATH11K_FLAG_UNREGISTERING, &ab->dev_flags)=
))
> >                       queue_work(ab->workqueue_aux, &ab->reset_work);
> >               break;
> > +     case MHI_CB_EE_SBL_MODE:
> > +             ath11k_mhi_qrtr_instance_set(mhi_cntrl);
>
> I still don't understand how SBL could make use of this information durin=
g
> boot without waiting for an update.

Me neither, but it works reliably as long as it's updated once SBL is live.
Trying to do it earlier or later does nothing, it will just use the
default node ID then.

Regards,
Robert
>
> Thanks,
> Mani
>
> > +             break;
> >       default:
> >               break;
> >       }
> >  }
> >
> > -static int ath11k_mhi_op_read_reg(struct mhi_controller *mhi_cntrl,
> > -                               void __iomem *addr,
> > -                               u32 *out)
> > -{
> > -     *out =3D readl(addr);
> > -
> > -     return 0;
> > -}
> > -
> > -static void ath11k_mhi_op_write_reg(struct mhi_controller *mhi_cntrl,
> > -                                 void __iomem *addr,
> > -                                 u32 val)
> > -{
> > -     writel(val, addr);
> > -}
> > -
> >  static int ath11k_mhi_read_addr_from_dt(struct mhi_controller *mhi_ctr=
l)
> >  {
> >       struct device_node *np;
> > diff --git a/drivers/net/wireless/ath/ath11k/mhi.h b/drivers/net/wirele=
ss/ath/ath11k/mhi.h
> > index 8d9f852da695..0db308bc3047 100644
> > --- a/drivers/net/wireless/ath/ath11k/mhi.h
> > +++ b/drivers/net/wireless/ath/ath11k/mhi.h
> > @@ -16,6 +16,9 @@
> >  #define MHICTRL                                      0x38
> >  #define MHICTRL_RESET_MASK                   0x2
> >
> > +#define BHI_ERRDBG2                          0x38
> > +#define QRTR_INSTANCE_MASK                   GENMASK(7, 0)
> > +
> >  int ath11k_mhi_start(struct ath11k_pci *ar_pci);
> >  void ath11k_mhi_stop(struct ath11k_pci *ar_pci);
> >  int ath11k_mhi_register(struct ath11k_pci *ar_pci);
> > diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wirele=
ss/ath/ath11k/pci.c
> > index 99cf3357c66e..cd26c1567415 100644
> > --- a/drivers/net/wireless/ath/ath11k/pci.c
> > +++ b/drivers/net/wireless/ath/ath11k/pci.c
> > @@ -370,13 +370,16 @@ static void ath11k_pci_sw_reset(struct ath11k_bas=
e *ab, bool power_on)
> >  static void ath11k_pci_init_qmi_ce_config(struct ath11k_base *ab)
> >  {
> >       struct ath11k_qmi_ce_cfg *cfg =3D &ab->qmi.ce_cfg;
> > +     struct ath11k_pci *ab_pci =3D ath11k_pci_priv(ab);
> > +     struct pci_bus *bus =3D ab_pci->pdev->bus;
> >
> >       cfg->tgt_ce =3D ab->hw_params.target_ce_config;
> >       cfg->tgt_ce_len =3D ab->hw_params.target_ce_count;
> >
> >       cfg->svc_to_ce_map =3D ab->hw_params.svc_to_ce_map;
> >       cfg->svc_to_ce_map_len =3D ab->hw_params.svc_to_ce_map_len;
> > -     ab->qmi.service_ins_id =3D ab->hw_params.qmi_service_ins_id;
> > +     ab->qmi.service_ins_id =3D ab->hw_params.qmi_service_ins_id +
> > +     (((pci_domain_nr(bus) & 0xF) << 4) | (bus->number & 0xF));
> >
> >       ath11k_ce_get_shadow_config(ab, &cfg->shadow_reg_v2,
> >                                   &cfg->shadow_reg_v2_len);
> > --
> > 2.38.1
> >
> >
>
> --
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D
