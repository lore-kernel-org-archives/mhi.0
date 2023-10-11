Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6532F1EA66
	for <mhi@lists.linux.dev>; Wed, 11 Oct 2023 12:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b78s2ozn"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-53b8f8c6b1fso6787877a12.0
        for <mhi@lists.linux.dev>; Wed, 11 Oct 2023 05:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697025642; x=1697630442; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aVTN0BqqtO5MKlfxI7sXoH95j77MBJ0QiNgQ07twsNg=;
        b=b78s2oznbW+QdjrJQ+9e1E9tDJyinjEHN7peouEnbRMgAxGPyo9OMzbYElGaO+VSYB
         x8k5f8GyilhJ+xIBV/LpFeTZJluYXtWQJy/uOkITl8OiPgrYZzIRexvdH48PcualD/qX
         GWCQXfjGAYuX49H6bLbnTyYM/GBkKU+YcAqwkLdou/vJTe9uzsxN40RzIVwCHvLaAF7w
         fXtYuMh12zCOPBBxJbAK/RiJVafEcIVw86UlFEhUL3QUWAYCGK3kcdbkFhVKGja3VP+2
         VfegcFsLlU3GR3DIIpJXdyBg6LQy4M/1u8ptmHlHjqE1kC0Mm0wQ9BgpGKQWssQ1l91V
         tCTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697025642; x=1697630442;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aVTN0BqqtO5MKlfxI7sXoH95j77MBJ0QiNgQ07twsNg=;
        b=nu36pii1kRYTNRcQU0kte4WvDGR/J8q8+CcAjklseSLqN2nDo1DombPKqqzGaIAeco
         ijPhA2Ap+5zJJpEDMjVGJcD35/CjguTQn8O0n4Ucuh9CAzBaouJXDQA9bipnk92nezkY
         vewqF2QUJJV08ISHK4UmvUh003LzF6jWvo9DQCKZvth3kFwInOJVLdGQDAzdsqbUg8F1
         kgh9wa0vE2gRnF1eRr+zbtZyQbAbW0nEXSUxS01pmqAVrkEKqN10bQ9WCl63Gg3DO58x
         JNsekLh3Zz2zDTiWzyRTVKSJEgrsuIInH7W6omOSleIvQaNbMaqukyPJ3mcEF/thyi9w
         oN0g==
X-Gm-Message-State: AOJu0Yzr2PRLzVwNTbOfW/XLSvpPArK5/j9o4+ij5qg+WAv1lSik7S5r
	UJi3Ps40eUxSyjOqiAXeEh7EOh69Cg1YMgvGbVrSLw==
X-Google-Smtp-Source: AGHT+IFKnbdS+liyq5BOO9m8ERjMSQL8biVjydd35Z2zaMUPssKf5QQkaQtgJ+ughRnn6bk/oM/oer9yveoYwYchCJs=
X-Received: by 2002:a17:906:19b:b0:9b6:e6ff:b20b with SMTP id
 27-20020a170906019b00b009b6e6ffb20bmr17472854ejb.8.1697025642572; Wed, 11 Oct
 2023 05:00:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1697023109-23671-1-git-send-email-quic_msarkar@quicinc.com>
 <1697023109-23671-3-git-send-email-quic_msarkar@quicinc.com>
 <CAA8EJpoLxeSvxjcyq1BMR9XuAffrxLmO-eaBYJ+Fhnb4zYmxUQ@mail.gmail.com> <6531b333-b978-6b97-5cb4-59562d775ac3@quicinc.com>
In-Reply-To: <6531b333-b978-6b97-5cb4-59562d775ac3@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 11 Oct 2023 15:00:29 +0300
Message-ID: <CAA8EJpoidaW8x3CAwNLWGcq2fz+x49kQWan2GXkgODUUypzKOQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] phy: qcom-qmp-pcie: add endpoint support for sa8775p
To: Mrinmay Sarkar <quic_msarkar@quicinc.com>
Cc: agross@kernel.org, andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	conor+dt@kernel.org, konrad.dybcio@linaro.org, mani@kernel.org, 
	quic_shazhuss@quicinc.com, quic_nitegupt@quicinc.com, quic_ramkri@quicinc.com, 
	quic_nayiluri@quicinc.com, robh@kernel.org, quic_krichai@quicinc.com, 
	quic_vbadigan@quicinc.com, quic_parass@quicinc.com, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mhi@lists.linux.dev, 
	linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Oct 2023 at 14:56, Mrinmay Sarkar <quic_msarkar@quicinc.com> wrote:
>
>
> On 10/11/2023 5:06 PM, Dmitry Baryshkov wrote:
> > On Wed, 11 Oct 2023 at 14:19, Mrinmay Sarkar <quic_msarkar@quicinc.com> wrote:
> >> Add support for dual lane end point mode PHY found on sa8755p platform.
> >>
> >> Signed-off-by: Mrinmay Sarkar <quic_msarkar@quicinc.com>
> >> ---
> >>   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c   | 41 ++++++++++++++++++++++++++++++
> >>   drivers/phy/qualcomm/phy-qcom-qmp-pcs-v5.h |  2 ++
> >>   2 files changed, 43 insertions(+)
> > Two minor questions.
> >
> >> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> >> index a63ca74..962b4a1 100644
> >> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> >> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> >> @@ -2147,6 +2147,38 @@ static const struct qmp_phy_init_tbl sa8775p_qmp_gen4x4_pcie_rc_serdes_alt_tbl[]
> >>          QMP_PHY_INIT_CFG(QSERDES_V5_COM_CLK_SELECT, 0x34),
> >>   };
> >>
> >> +static const struct qmp_phy_init_tbl sa8775p_qmp_gen4x2_pcie_ep_serdes_alt_tbl[] = {
> >> +       QMP_PHY_INIT_CFG(QSERDES_V5_COM_BG_TIMER, 0x02),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V5_COM_SYS_CLK_CTRL, 0x07),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V5_COM_CP_CTRL_MODE0, 0x27),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V5_COM_CP_CTRL_MODE1, 0x0a),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V5_COM_PLL_RCTRL_MODE0, 0x17),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V5_COM_PLL_RCTRL_MODE1, 0x19),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V5_COM_PLL_CCTRL_MODE0, 0x00),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V5_COM_PLL_CCTRL_MODE1, 0x03),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V5_COM_SYSCLK_EN_SEL, 0x00),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V5_COM_INTEGLOOP_GAIN0_MODE0, 0xfb),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V5_COM_INTEGLOOP_GAIN1_MODE0, 0x01),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V5_COM_INTEGLOOP_GAIN0_MODE1, 0xfb),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V5_COM_INTEGLOOP_GAIN1_MODE1, 0x01),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V5_COM_CMN_MODE, 0x14),
> > I should check whether we miss QSERDES_V5_COM_CMN_MODE in
> > sm8450_qmp_gen4x2_pcie_ep_serdes_tbl, which is otherwise nearly
> > identical.
> > Also do you need to set QSERDES_V5_COM_CORE_CLK_EN here?
> QSERDES_V5_COM_CORE_CLK_EN is common for both RC and EP
> so we are using it in sa8775p_qmp_gen4x2_pcie_serdes_alt_tbl
>
> -Mrinmay
> >> +       QMP_PHY_INIT_CFG(QSERDES_V5_COM_LOCK_CMP1_MODE0, 0xff),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V5_COM_LOCK_CMP2_MODE0, 0x04),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V5_COM_LOCK_CMP1_MODE1, 0xff),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V5_COM_LOCK_CMP2_MODE1, 0x09),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V5_COM_DEC_START_MODE0, 0x19),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V5_COM_DEC_START_MODE1, 0x28),
> >> +};
> >> +
> >> +static const struct qmp_phy_init_tbl sa8775p_qmp_gen4_pcie_ep_pcs_misc_tbl[] = {
> >> +       QMP_PHY_INIT_CFG(QPHY_V5_20_PCS_PCIE_OSC_DTCT_MODE2_CONFIG5, 0x08),
> >> +};
> > This is the same as sm8450_qmp_gen4x2_pcie_ep_pcs_misc_tbl
>
> so you want me to use sm8450_qmp_gen4x2_pcie_ep_pcs_misc_tbl
> instead of creating new one for sa8775?

If you don't see a problem with that, yes.

>
> -Mrinmay
>
> >> +
> >> +static const struct qmp_phy_init_tbl sa8775p_qmp_gen4x2_pcie_ep_pcs_alt_tbl[] = {
> >> +       QMP_PHY_INIT_CFG(QPHY_V5_PCS_INSIG_MX_CTRL7, 0x00),
> >> +       QMP_PHY_INIT_CFG(QPHY_V5_PCS_INSIG_SW_CTRL7, 0x00),
> >> +};
> > Could you please confirm that these registers belong to the V5
> > namespace rather than V5_20 one?
> may I know difference between V5 and V5_20 namespace
> can't we use V5 namespace here?

Register names are different, see existing v5 vs v5.20 and v4 vs v4.20
headers. So, I'd kindly ask to use the appropriate namespace.

>
> -Mrinmay
> >> +
> >>   struct qmp_pcie_offsets {
> >>          u16 serdes;
> >>          u16 pcs;
> >> @@ -3043,6 +3075,15 @@ static const struct qmp_phy_cfg sa8775p_qmp_gen4x2_pciephy_cfg = {
> >>                  .pcs_misc_num   = ARRAY_SIZE(sa8775p_qmp_gen4_pcie_rc_pcs_misc_tbl),
> >>          },
> >>
> >> +       .tbls_ep = &(const struct qmp_phy_cfg_tbls) {
> >> +               .serdes         = sa8775p_qmp_gen4x2_pcie_ep_serdes_alt_tbl,
> >> +               .serdes_num     = ARRAY_SIZE(sa8775p_qmp_gen4x2_pcie_ep_serdes_alt_tbl),
> >> +               .pcs_misc       = sa8775p_qmp_gen4_pcie_ep_pcs_misc_tbl,
> >> +               .pcs_misc_num   = ARRAY_SIZE(sa8775p_qmp_gen4_pcie_ep_pcs_misc_tbl),
> >> +               .pcs            = sa8775p_qmp_gen4x2_pcie_ep_pcs_alt_tbl,
> >> +               .pcs_num        = ARRAY_SIZE(sa8775p_qmp_gen4x2_pcie_ep_pcs_alt_tbl),
> >> +       },
> >> +
> >>          .reset_list             = sdm845_pciephy_reset_l,
> >>          .num_resets             = ARRAY_SIZE(sdm845_pciephy_reset_l),
> >>          .vreg_list              = qmp_phy_vreg_l,
> >> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v5.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v5.h
> >> index 36cc80b..6ee1c33 100644
> >> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v5.h
> >> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v5.h
> >> @@ -11,6 +11,8 @@
> >>   #define QPHY_V5_PCS_PCS_STATUS1                                0x014
> >>   #define QPHY_V5_PCS_POWER_DOWN_CONTROL                 0x040
> >>   #define QPHY_V5_PCS_START_CONTROL                      0x044
> >> +#define QPHY_V5_PCS_INSIG_SW_CTRL7                     0x060
> >> +#define QPHY_V5_PCS_INSIG_MX_CTRL7                     0x07c
> >>   #define QPHY_V5_PCS_LOCK_DETECT_CONFIG1                        0x0c4
> >>   #define QPHY_V5_PCS_LOCK_DETECT_CONFIG2                        0x0c8
> >>   #define QPHY_V5_PCS_LOCK_DETECT_CONFIG3                        0x0cc
> >> --
> >> 2.7.4
> >>
> >



-- 
With best wishes
Dmitry
