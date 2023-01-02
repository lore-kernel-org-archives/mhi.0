Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC7F20EC
	for <mhi@lists.linux.dev>; Mon,  2 Jan 2023 08:01:19 +0000 (UTC)
Received: by mail-oo1-f48.google.com with SMTP id t15-20020a4a96cf000000b0049f7e18db0dso5152529ooi.10
        for <mhi@lists.linux.dev>; Mon, 02 Jan 2023 00:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=40JsF6PNmDEZZ4y8a8jdXK2aWXlWFPHueZj2OHlZ0eg=;
        b=c9/UDfhp8SQ2BtyvFBkKPyAXxdwVen1w2VO/AWBh8I9/xiR0kuqMXnutL6DjL+FtYw
         nk8KWCqU3dxvdHb5JZ5NgdAJmBZbRAC0Q5CpET6gMXz+E4ZKrV3jFdt1Iu+sU/S6DNk3
         rdiI9KH2w3e7Cgamhmy7t/INRXx94/9fesPRA/bp65r5q3wKqXg6+9aE9tSfxeLrGAw5
         +9737DzFSQ7KJKpjnYnmHD//JcWX3d2XJyrdfWp0L6zmivC1kG3/I/1GMhalo2oQdg8n
         yJkHMpkNR6ohto3q1CJilOkTVm0cIw8fr7gltxFTwNy2jplH+D6mDEUl25pStNAJ4L/L
         VTbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=40JsF6PNmDEZZ4y8a8jdXK2aWXlWFPHueZj2OHlZ0eg=;
        b=fjUnzdGk+vy1blZB0Er8lQhnWeLM9hNnrpatqlILr9CwI/Yc6HRb+3boNgKqXK1xPx
         ZDiY0ATrHJjwLHDf+KVEJIVv9/3MPE62vMxWPgCThuItReIgzwet1mvw8roKphLF/nRg
         tHTLLSdnWft+BLLYqZkMW6WTKp6016TWCyhgRgPkLevz66on3G6/xnDDnNIGWWBQbugw
         qaJq2DngPyJQOtvWNuCMbR6eFt6QnRjf15eZ7KqbC3UvZC5Sbyz14V5MOVaTv0zuXpxl
         VwRh0gAnUgzpKiAwGQldDOvojX1EzmO21/5Uvrdkcr0N4YStYjkNc/7X1qRJAnHdPunY
         jXIQ==
X-Gm-Message-State: AFqh2kqmobTHRgjLk1aDR23Ih9EezNO0eY2Sx32BH4lNoB2wdtn1FvLT
	Hw4Zr74BPZoQCh9yA3RX3LnkozdV3NMno1UKd0xI0w==
X-Google-Smtp-Source: AMrXdXu1Qi5mlSVdZMFT2cQ/3oABMgacFmnT1FSvlTPrxV6i4ytnGLFT3VQMVBbgf2xOvoXXPH5wcVqfrIFQEU/ityg=
X-Received: by 2002:a05:6820:82c:b0:498:260c:d780 with SMTP id
 bg44-20020a056820082c00b00498260cd780mr1849729oob.27.1672646478952; Mon, 02
 Jan 2023 00:01:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221230075726.122806-1-duke_xinanwen@163.com>
In-Reply-To: <20221230075726.122806-1-duke_xinanwen@163.com>
From: Loic Poulain <loic.poulain@linaro.org>
Date: Mon, 2 Jan 2023 09:00:42 +0100
Message-ID: <CAMZdPi_zPFq7meLbTQ9mA8b+9VHtz-N=8-NFAwKzPDaq7XAakg@mail.gmail.com>
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Add support for Quectel
 RM520N-GL modem
To: =?UTF-8?B?RHVrZSBYaW4o6L6b5a6J5paHKQ==?= <duke_xinanwen@163.com>
Cc: mani@kernel.org, slark_xiao@163.com, gregkh@linuxfoundation.org, 
	dnlplm@gmail.com, yonglin.tan@outlook.com, fabio.porcedda@gmail.com, 
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	inux-kernel@vger.kernel.org, jerry.meng@quectel.com, duke.xin@quectel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Duke,

On Fri, 30 Dec 2022 at 08:57, Duke Xin(=E8=BE=9B=E5=AE=89=E6=96=87) <duke_x=
inanwen@163.com> wrote:
>
> The project is based on Qualcomm's sdx6x chips for laptop,so the mhi inte=
rface definition and
> enumeration align with previous Quectel sdx24 configuration
>
> Signed-off-by: Duke Xin(=E8=BE=9B=E5=AE=89=E6=96=87) <duke_xinanwen@163.c=
om>
> ---
>  drivers/bus/mhi/host/pci_generic.c | 46 ++++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
>
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pc=
i_generic.c
> index f39657f71483..83f40617af9a 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -335,6 +335,50 @@ static const struct mhi_pci_dev_info mhi_quectel_em1=
xx_info =3D {
>         .sideband_wake =3D true,
>  };
>
> +static const struct mhi_channel_config mhi_quectel_rm5xx_channels[] =3D =
{
> +       MHI_CHANNEL_CONFIG_UL(0, "NMEA", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL(1, "NMEA", 32, 0),
> +       MHI_CHANNEL_CONFIG_UL_SBL(2, "SAHARA", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL_SBL(3, "SAHARA", 32, 0),
> +       MHI_CHANNEL_CONFIG_UL(4, "DIAG", 32, 1),
> +       MHI_CHANNEL_CONFIG_DL(5, "DIAG", 32, 1),
> +       MHI_CHANNEL_CONFIG_UL(12, "MBIM", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL(13, "MBIM", 32, 0),
> +       MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
> +       /* The EDL firmware is a flash-programmer exposing firehose proto=
col */
> +       MHI_CHANNEL_CONFIG_UL_FP(34, "FIREHOSE", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL_FP(35, "FIREHOSE", 32, 0),
> +       MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0_MBIM", 128, 2),
> +       MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0_MBIM", 128, 3),
> +};
> +
> +static struct mhi_event_config mhi_quectel_rm5xx_events[] =3D {
> +       MHI_EVENT_CONFIG_CTRL(0, 128),
> +       MHI_EVENT_CONFIG_DATA(1, 128),
> +       MHI_EVENT_CONFIG_HW_DATA(2, 1024, 100),
> +       MHI_EVENT_CONFIG_HW_DATA(3, 1024, 101)
> +};
> +
> +static const struct mhi_controller_config modem_quectel_rm5xx_config =3D=
 {
> +       .max_channels =3D 128,
> +       .timeout_ms =3D 20000,
> +       .num_channels =3D ARRAY_SIZE(mhi_quectel_rm5xx_channels),
> +       .ch_cfg =3D mhi_quectel_rm5xx_channels,
> +       .num_events =3D ARRAY_SIZE(mhi_quectel_rm5xx_events),
> +       .event_cfg =3D mhi_quectel_rm5xx_events,
> +};
> +
> +static const struct mhi_pci_dev_info mhi_quectel_rm5xx_info =3D {
> +       .name =3D "quectel-rm5xx",
> +       .edl =3D "qcom/prog_firehose_sdx6x.elf",
> +       .config =3D &modem_quectel_rm5xx_config,

Use `modem_quectel_em1xx_config` if compatible instead of duplicating
the configuration.

Regards,
Loic
