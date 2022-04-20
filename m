Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184D71841
	for <mhi@lists.linux.dev>; Wed, 20 Apr 2022 12:00:59 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id 12so1548729pll.12
        for <mhi@lists.linux.dev>; Wed, 20 Apr 2022 05:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4x/nniN9E8m90PRyLnC3qrpb7kQ+WEP5ChtBH2U8kMo=;
        b=NYeiRC2npjsNr6wW0oCHDEAk57Gr1EgLIjXIF7B2/IkPWxBQCCldrcvfye9l1Rs/QB
         xTzq4yDECNZR6F31YdPLiuauGJCPxcV8CXCODyn23WYkX4gNGOlV1sbQKVLcfTulCYrg
         GxsQiBryjYXK2Pk2zRdm5xy5hkvaDf4/hnFURCz0rGvVgqPXFrUcVQMG2hpHQII675dZ
         O4XbNdcoXtESEToGDpl2VizCqQ+olRZ15UZeTA5IXeKJQbbWyfdP+JIeluO3JRTVXu8F
         RVax/i8LmZ77GeUsaioHhzU/EvGyb40vbsFei3dzhllKAihllcump0Em2aFb5KWwih7x
         8nMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4x/nniN9E8m90PRyLnC3qrpb7kQ+WEP5ChtBH2U8kMo=;
        b=C4MiP49CfOq1yczkxrLGYwF3MinFsc1YmN3/DqYfGtpHSgoN59LzHkp1hkEbHqvDT1
         rGc971I4lvyjH/+CZhU/7bQ6gjnmh5EfdfWKjRdkVNjPLWpV5fj+6zxX3EwHHsQfSc3g
         y9UoN5Y6vZGa0E2IzyEJIoQdRp994osAwBYpLAwlWv9q1JJ+FVCcbH3OEouHhWxqwWuL
         o8PijTR69mgCBMbJ4X54sYaFhj+NhrGm3tgWfZyKTEOjfHGDfoK6LknInYsvSzQOlFc8
         5VI5AyN3DSHyY6OLHpJep79rCPfDBwy18FznydPH1QikHRxIuU+zQZxmxMuTjAzlJwFl
         of0A==
X-Gm-Message-State: AOAM532bdrSY144Q8g6OsLfDx2VsT5ngLx7wIjcIXDibimF2INVG5gOk
	0JTbwmM2Ps7c0bY19VKRXCHtwqK1RppFL7G64OmK/g==
X-Google-Smtp-Source: ABdhPJzDAk+ptW68T/TwHLLdT+qVLohzJyd35bV7s8fKq9voji+ToXFJ/JYFGS5BENSO/fLBfptF2O+Ll8ewYtScQFM=
X-Received: by 2002:a17:90a:e7c7:b0:1d2:6ee8:63ed with SMTP id
 kb7-20020a17090ae7c700b001d26ee863edmr3969267pjb.209.1650456059505; Wed, 20
 Apr 2022 05:00:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220420102811.3157-1-slark_xiao@163.com>
In-Reply-To: <20220420102811.3157-1-slark_xiao@163.com>
From: Loic Poulain <loic.poulain@linaro.org>
Date: Wed, 20 Apr 2022 14:00:23 +0200
Message-ID: <CAMZdPi9WJsz5nyzQB39q=Jhy8_q2=N8VAucYMUYKUf_faL5csQ@mail.gmail.com>
Subject: Re: [PATCH] bus: mhi: host: Add support for Cinterion MV32-WA/MV32-WB
To: Slark Xiao <slark_xiao@163.com>
Cc: mani@kernel.org, quic_hemantk@quicinc.com, gregkh@linuxfoundation.org, 
	bbhatt@codeaurora.org, christophe.jaillet@wanadoo.fr, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Slark,

On Wed, 20 Apr 2022 at 12:28, Slark Xiao <slark_xiao@163.com> wrote:
>
> MV32-WA is designed based on Qualcomm SDX62, and
> MV32-WB is designed based on QUalcomm SDX65. Both
> products' enumeration would align with previous
> product MV31-W.
> Add some new items for mv32 to separate it from
> mv31-w, in case we need to do any changes in
> future.

On the contrary, do not overly clone the structures, and re-use the
mv31 ones if they apply. You can rename them to mv3x if you really
want to.

Regards,
Loic



>
> Signed-off-by: Slark Xiao <slark_xiao@163.com>
> ---
>  drivers/bus/mhi/host/pci_generic.c | 41 ++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 541ced27d941..a2da40340df7 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -406,6 +406,41 @@ static const struct mhi_pci_dev_info mhi_mv31_info = {
>         .mru_default = 32768,
>  };
>
> +static const struct mhi_channel_config mhi_mv32_channels[] = {
> +       MHI_CHANNEL_CONFIG_UL(0, "LOOPBACK", 64, 0),
> +       MHI_CHANNEL_CONFIG_DL(1, "LOOPBACK", 64, 0),
> +       /* MBIM Control Channel */
> +       MHI_CHANNEL_CONFIG_UL(12, "MBIM", 64, 0),
> +       MHI_CHANNEL_CONFIG_DL(13, "MBIM", 64, 0),
> +       /* MBIM Data Channel */
> +       MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0_MBIM", 512, 2),
> +       MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0_MBIM", 512, 3),
> +};
> +
> +static struct mhi_event_config mhi_mv32_events[] = {
> +       MHI_EVENT_CONFIG_CTRL(0, 256),
> +       MHI_EVENT_CONFIG_DATA(1, 256),
> +       MHI_EVENT_CONFIG_HW_DATA(2, 1024, 100),
> +       MHI_EVENT_CONFIG_HW_DATA(3, 1024, 101),
> +};
> +
> +static const struct mhi_controller_config modem_mv32_config = {
> +       .max_channels = 128,
> +       .timeout_ms = 20000,
> +       .num_channels = ARRAY_SIZE(mhi_mv32_channels),
> +       .ch_cfg = mhi_mv32_channels,
> +       .num_events = ARRAY_SIZE(mhi_mv32_events),
> +       .event_cfg = mhi_mv32_events,
> +};
> +
> +static const struct mhi_pci_dev_info mhi_mv32_info = {
> +       .name = "cinterion-mv32",
> +       .config = &modem_mv32_config,
> +       .bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> +       .dma_data_width = 32,
> +       .mru_default = 32768,
> +};
> +
>  static const struct mhi_channel_config mhi_sierra_em919x_channels[] = {
>         MHI_CHANNEL_CONFIG_UL_SBL(2, "SAHARA", 32, 0),
>         MHI_CHANNEL_CONFIG_DL_SBL(3, "SAHARA", 256, 0),
> @@ -475,6 +510,12 @@ static const struct pci_device_id mhi_pci_id_table[] = {
>         /* MV31-W (Cinterion) */
>         { PCI_DEVICE(0x1269, 0x00b3),
>                 .driver_data = (kernel_ulong_t) &mhi_mv31_info },
> +       /* MV32-WA (Cinterion) */
> +       { PCI_DEVICE(0x1269, 0x00ba),
> +               .driver_data = (kernel_ulong_t) &mhi_mv32_info },
> +       /* MV32-WB (Cinterion) */
> +       { PCI_DEVICE(0x1269, 0x00bb),
> +               .driver_data = (kernel_ulong_t) &mhi_mv32_info },
>         {  }
>  };
>  MODULE_DEVICE_TABLE(pci, mhi_pci_id_table);
> --
> 2.25.1
>
