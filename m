Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E737E6
	for <mhi@lists.linux.dev>; Tue, 24 May 2022 07:27:43 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id f21so3374698pfa.3
        for <mhi@lists.linux.dev>; Tue, 24 May 2022 00:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tsv75/jMSG9IE7z+FFdGkSFpTdlyLS1N1PmQi6VFqBI=;
        b=wvLcdRoTzjduYLMmkssoeHZpDzj+D6Li3c0sGg6dhznKpbBFocVHCep91+LKPeyu6A
         adf8V3sSKAOctotcch5S4mjMvRTbGhUus5+QA9diimFJsnt8A7i6RD2y60WXwsSGiVdh
         bgwJnqToDTyrZHPGBmo0VfUmcmMllbbq6FQB+bPb997SkUODY+yapFzKf5qaekHLwqXu
         +UX9XXuscTRgo2MU9b9/+1PWDINJRaRuHj42B7O7KiR1jhJSTJoTBSaL8gJ2Gt9CqoYy
         eR7pDrcyhkAJYgcV8Nobpd9IwwO8hEcjkrUHmcHmfpQH8XlOqP3WIr1mmEMAnLuWDQDE
         MRTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tsv75/jMSG9IE7z+FFdGkSFpTdlyLS1N1PmQi6VFqBI=;
        b=rpTEMIruOQzdhQw6GUqlxKQwtJDkxWSH2FnehbHPM3/JPyI0rDec7ovcptne1eCXYV
         kv8h+TKkAn28qZK4UwK4CXZvwU1UBWkyOZBFqwDOvCKIoaxbDRGtcHoy3ShWty5eZAZB
         iE5rVq8wZnaC7bF9Ux8W1W4wsFl+/+P+YMwoDLx57eUS+qLpTDs9EHZY+bZAkRfPqljV
         SDgW8au6SG+FhBcJ1V/YqsBxcA8t25rY/3r3vFv83kjr1nQQo51HxUUxn3iruFGq+nM6
         W1euQOH7xGtCfMBFFgthjpkc9w7RQZcX1YZy/jq1lclpefYzoftJSeu8fUjdN2bUnaNN
         xhlw==
X-Gm-Message-State: AOAM5317aDIghYpX7GJZqco8bTJ/TTMQqfZsNLcSvo/ZxCu5qV2axbqi
	/q8le4d8LYhJDOelN13rNz3rmUyBi8f7lPC69Nj9Tw==
X-Google-Smtp-Source: ABdhPJw3ORe/h7f5dIvOTqYeutYcfp1EKqFSPpJWeNvmseS55Kkvyhwnm9kIFnPx97OSfYOHlmOBlicekC0ETSFOvdM=
X-Received: by 2002:a05:6a00:228c:b0:518:9533:4a1e with SMTP id
 f12-20020a056a00228c00b0051895334a1emr11198767pfe.79.1653377262793; Tue, 24
 May 2022 00:27:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <MEYP282MB2374837FFCB18B12BFDEDE80FDCF9@MEYP282MB2374.AUSP282.PROD.OUTLOOK.COM>
In-Reply-To: <MEYP282MB2374837FFCB18B12BFDEDE80FDCF9@MEYP282MB2374.AUSP282.PROD.OUTLOOK.COM>
From: Loic Poulain <loic.poulain@linaro.org>
Date: Tue, 24 May 2022 09:27:06 +0200
Message-ID: <CAMZdPi8c1HqxgGW2woTF=0wUv_gV+pn5q088fYZ=KV0p=avJfA@mail.gmail.com>
Subject: Re: [PATCH v2] bus: mhi: host: Add support for Quectel EM120 FCCL.
To: Yonglin Tan <yonglin.tan@outlook.com>
Cc: mani@kernel.org, gregkh@linuxfoundation.org, quic_hemantk@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	mhi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 May 2022 at 08:38, Yonglin Tan <yonglin.tan@outlook.com> wrote:
>
> The product's enumeration align with previous
> Quectel EM120R-GL, so the EM120 FCCL would use
> the same config as Quectel EM120R-GL.
>
> Signed-off-by: Yonglin Tan <yonglin.tan@outlook.com>

Reviewed-by: Loic Poulain <loic.poulain@linaro.org>

> ---
>
> V2:
> Fixed the format errors in the patch description.
>
>  drivers/bus/mhi/host/pci_generic.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 8416267..0a6469c 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -557,6 +557,8 @@ static const struct pci_device_id mhi_pci_id_table[] = {
>                 .driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
>         { PCI_DEVICE(0x1eac, 0x1002), /* EM160R-GL (sdx24) */
>                 .driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
> +       { PCI_DEVICE(0x1eac, 0x2001), /* EM120R-GL for FCCL (sdx24) */
> +               .driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
>         /* T99W175 (sdx55), Both for eSIM and Non-eSIM */
>         { PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0ab),
>                 .driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
> --
> 2.7.4
>
