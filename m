Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC18A256F
	for <mhi@lists.linux.dev>; Mon, 19 Sep 2022 13:22:55 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id c198so28063738pfc.13
        for <mhi@lists.linux.dev>; Mon, 19 Sep 2022 06:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=rB2efXodZAeYQuXLadLjMv2cW1RkQIyx3Ihg+D/gw2c=;
        b=ET0WcksjYR3a5lAHYU8+chKDBmAmJUMY/Uu3b21tpvzYK0jUQWxMHtwZHRmkwUvHKB
         Lw7wMkYLcE8Nti9KSDCttDqOOINaGyZVjXporEHIGgyetB0FX0KMOGFMwWzSKIEk0KR8
         pjTTy+PrMFDI6zLRdSAfgkC/Sx6UGa5Ie/XTt4rJ8pHSu955+XXaMqjIsjvuZzbD7yoV
         BISYEg/W7/O+MS9Ize574hxM8RMy8Duwk+l0eQnGdz0S8PB2WVajd7a0jeEmXiB4yfzX
         Q8k3YdX2qqW4PNRjMRTFwOgzHzinvWa1+8g+TAYNZUlmLYGE5ptFCNf6Xwsf7vIOnWRq
         Bqfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=rB2efXodZAeYQuXLadLjMv2cW1RkQIyx3Ihg+D/gw2c=;
        b=yGUTae+xixtkbem6WG+ReuuV23EocGEvAQPSVUuWSWr1E3O5HVtGCo5cxjMk9hosSs
         Op4NFMZZNzJbUz5Z34waD7oDtwp1DOAHFjTVEXotSINx9t3LTUifiV9wGDrB487wOixM
         5a8P5o6Kc1lIUpo0DIISJ2Byh/ZicjdAgyCZGlwFY9aQ432vbfxTh5HPREjrUJLrasYQ
         QI1yHXiIHpE/2PohIjs9U9koYCKAf037IYnWwbzfe3abhiYS/oeF7ggTJfgky9ZGswW4
         VtT3PbEggMd663l8phNPmr5c0oxmSA0NdFSfTnN9MB5/fu/dq0XVDi8RY/wOHgvciuuV
         vSQA==
X-Gm-Message-State: ACrzQf1jymZC8lOPf3WLhO9+HHY3HmpsDO+Vfrcj7opBwuNE2tOMBwfD
	ls+2VTBkPjMvev/bqv+7eK6fOsH25NponwoXnSXVgA==
X-Google-Smtp-Source: AMsMyM7qX8JaivH+pU9JLjukCe0RRS9uuMlO5zhLeRj22V7Arc9eQv7VeHLlk1eIIGd7/vgHW1i6xYshGo7yqPUtWKo=
X-Received: by 2002:a05:6a00:acc:b0:530:e79e:fc27 with SMTP id
 c12-20020a056a000acc00b00530e79efc27mr18886647pfl.61.1663593775199; Mon, 19
 Sep 2022 06:22:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220916144329.243368-1-fabio.porcedda@gmail.com> <20220916144329.243368-3-fabio.porcedda@gmail.com>
In-Reply-To: <20220916144329.243368-3-fabio.porcedda@gmail.com>
From: Loic Poulain <loic.poulain@linaro.org>
Date: Mon, 19 Sep 2022 15:22:18 +0200
Message-ID: <CAMZdPi8gGrbkKnDR+WLadF92shJbwH-ksQY+dbpgfZ21iAp9ug@mail.gmail.com>
Subject: Re: [PATCH 2/2] bus: mhi: host: pci_generic: Add a secondary AT port
 to Telit FN990
To: Fabio Porcedda <fabio.porcedda@gmail.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, 
	mani@kernel.org, ryazanov.s.a@gmail.com, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, dnlplm@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 16 Sept 2022 at 16:43, Fabio Porcedda <fabio.porcedda@gmail.com> wrote:
>
> Add a secondary AT port using one of OEM reserved channel.
>
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>

Reviewed-by: Loic Poulain <loic.poulain@linaro.org>

> ---
>  drivers/bus/mhi/host/pci_generic.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 51e2b901bae0..caa4ce28cf9e 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -507,6 +507,8 @@ static const struct mhi_channel_config mhi_telit_fn990_channels[] = {
>         MHI_CHANNEL_CONFIG_DL(13, "MBIM", 32, 0),
>         MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
>         MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
> +       MHI_CHANNEL_CONFIG_UL(92, "DUN2", 32, 1),
> +       MHI_CHANNEL_CONFIG_DL(93, "DUN2", 32, 1),
>         MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0_MBIM", 128, 2),
>         MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0_MBIM", 128, 3),
>  };
> --
> 2.37.3
>
