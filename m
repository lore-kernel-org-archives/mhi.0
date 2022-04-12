Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051AD4685
	for <mhi@lists.linux.dev>; Tue, 12 Apr 2022 10:32:31 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id n18so16400065plg.5
        for <mhi@lists.linux.dev>; Tue, 12 Apr 2022 03:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=j/diUgJ6on6fJMFNZB8r5qR9Df3QD60+s0BeH3kCZZE=;
        b=eqPtoZXzQy7EibLkilIePwxil9cDXhi/222u6HQ2xkHFy75qv8m1UEp+2XcV9YhqkW
         p3je/XJIODmDyyGCDBKS9Jmn0dg4o/PFO1+1Azg+eluYxdUV8KxfEtNsJ7svBi/TOwKM
         sSPcvpjYZx7RQbfeQ4IBRkNzDn4OpDRwFmftZTa9dzB6IO8cFYhXR7GcQQYbVkorRwBP
         5uU+FN9jHnKI/bTKHafONRvng3twc2hF1FQWmeUptt4Z+SnkXExC3M+4EdC3k3K52iXU
         MdUp3TckFSJDchBbp6Mb8NH7d2wVL3T1DEHoxVExopqRIurj5lML/4Fz3Vy9CHzNpFYq
         VUwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=j/diUgJ6on6fJMFNZB8r5qR9Df3QD60+s0BeH3kCZZE=;
        b=NmTSrGTP8tDeL/xjVO0MnSh1os88XGXDcYoxbi46OMAPC6FzuK0Tw1zGnvozVLjZa/
         iR1YQfNnpDe/6QLOFFcJFa50higDMa3GzCOGqL2FaaMfXvuF7BfwzXHjhI7tupz9HNLM
         x16K1La8pWs6kcqBiQ4rYwIqa0ormAYZNbeRNHt5LvOyBmAG4zetSuIrxZXahdSVSuv2
         cuxMAY1Owiz39N4K5F4tPBmkUKIey5RUFkdkuwOHtOUOA5gt/YuMbhKmk7529/ts29M6
         aMKZBiBmfMImJgjbg/rcE8qGIm5UqCOkGZyGBqZu9FjN9dXWbcSihoLjcvp1l2TIbFxk
         I6jw==
X-Gm-Message-State: AOAM532YgACa8HLo/xQPdvBHm0jdgZdijxNUOXIMsted6V4n/DjR0Xro
	qvf8JhrNVmxQtFojRXyPW8sJxwmKS0Nd8rtEQXQ=
X-Google-Smtp-Source: ABdhPJxJgTuTm/K4D0Rn0JofYXhgZEIj20GsEhgefL/eIQuy+S3UNBl/Ih83/Cuo5UxX8n90jH9/N/sU99mGf9nIj20=
X-Received: by 2002:a17:902:edc5:b0:156:68e4:416 with SMTP id
 q5-20020a170902edc500b0015668e40416mr36483483plk.87.1649759551356; Tue, 12
 Apr 2022 03:32:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220411133428.42165-1-manivannan.sadhasivam@linaro.org>
In-Reply-To: <20220411133428.42165-1-manivannan.sadhasivam@linaro.org>
From: Daniele Palmas <dnlplm@gmail.com>
Date: Tue, 12 Apr 2022 12:30:18 +0200
Message-ID: <CAGRyCJEFjx6unWLavitXzyWU9G7vLnW9=b+xU-sLLq6LwU3Aow@mail.gmail.com>
Subject: Re: [PATCH v2] bus: mhi: host: pci_generic: Sort mhi_pci_id_table
 based on the PID
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev, quic_hemantk@quicinc.com, quic_bbhatt@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Loic Poulain <loic.poulain@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Mani,

Il giorno lun 11 apr 2022 alle ore 15:34 Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> ha scritto:
>
> Sorting this way helps in identifying the products of vendors. There is no
> sorting required for VID and the new VID should be added as the last entry.
>
> Let's also add a note clarifying this.
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>

Reviewed-by: Daniele Palmas <dnlplm@gmail.com>

I will wait for this change to be merged, then rebase the FN980 one.

Thanks,
Daniele

> Changes in v2:
>
> * Fixup the 0x0306 entry by moving it after subid
>
>  drivers/bus/mhi/host/pci_generic.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 541ced27d941..8858f3bf4f04 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -446,20 +446,21 @@ static const struct mhi_pci_dev_info mhi_sierra_em919x_info = {
>         .sideband_wake = false,
>  };
>
> +/* Keep the list sorted based on the PID. New VID should be added as the last entry */
>  static const struct pci_device_id mhi_pci_id_table[] = {
> +       { PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0304),
> +               .driver_data = (kernel_ulong_t) &mhi_qcom_sdx24_info },
>         /* EM919x (sdx55), use the same vid:pid as qcom-sdx55m */
>         { PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0306, 0x18d7, 0x0200),
>                 .driver_data = (kernel_ulong_t) &mhi_sierra_em919x_info },
>         { PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0306),
>                 .driver_data = (kernel_ulong_t) &mhi_qcom_sdx55_info },
> -       { PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0304),
> -               .driver_data = (kernel_ulong_t) &mhi_qcom_sdx24_info },
> +       { PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0308),
> +               .driver_data = (kernel_ulong_t) &mhi_qcom_sdx65_info },
>         { PCI_DEVICE(0x1eac, 0x1001), /* EM120R-GL (sdx24) */
>                 .driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
>         { PCI_DEVICE(0x1eac, 0x1002), /* EM160R-GL (sdx24) */
>                 .driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
> -       { PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0308),
> -               .driver_data = (kernel_ulong_t) &mhi_qcom_sdx65_info },
>         /* T99W175 (sdx55), Both for eSIM and Non-eSIM */
>         { PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0ab),
>                 .driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
> --
> 2.25.1
>
