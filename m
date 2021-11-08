Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA3C2C96
	for <mhi@lists.linux.dev>; Mon,  8 Nov 2021 17:54:20 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id x131so11599526pfc.12
        for <mhi@lists.linux.dev>; Mon, 08 Nov 2021 09:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qHTBZxMu3kYmmeW+LImFfM/L855minloH41/tsooYKo=;
        b=FKTCq5ShECv6cJq6WCvHiTniTJ5Yu7GYrJIeLoTJRni7z+BCJl2dCQpADzbu8YobDI
         lYjLqWbEbIuAK/N9/xprjdnLAH1qy/QR4uVjnIncomQ0f7A77CzkOnOfzR0tTExYZfPj
         9pArP5sJ4MIhW/DMoEjGNqzDULBf6NyeQ1BoQnMa6putDqkwM5FC3yr5eeoGVSU7qqaX
         ghUaveXODlRiR8EuktKWYhTrfaMHiO/8E8O0DrdhJjT4n9wHc5k6Dkhh3fS7GGTZtLyA
         QL+4EJSmz1ISrQR9h82+gUP1t+layJG63zkCkzmym1/aGMiBDEskABwZUhAe9ddUdB0M
         32qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qHTBZxMu3kYmmeW+LImFfM/L855minloH41/tsooYKo=;
        b=HnaQWO8qz/uHuMIwfVEdiApvqwBVYDOPG0GeW0teTRT1h4WW7M9n7eZ26ZPHBgihqq
         6j/ragEd3/bkiiXJrHbMlIKk4/FsY02NECXMHCM4qFQUeAtfVQRwpTPHxjFDxOqzgptp
         9yb+N0bszsLUqmz/FD/Kst1BaAwIxuZzduvGYV81mG/VAPpoZ0kWXuVqqm+4E/Y59q9j
         1yDKEifUSExVCSl6YK2XAhdMP7WWngbXgpcPLincnxBCGJDaOwruWOvQp9ez5hXirsSP
         gNpRlIQe78YvC/vNPyrBHBd+QgI+3ShIFY+VTW8UVaFNIHu08yFpZ/GeqDV0rdTFItUh
         h0ig==
X-Gm-Message-State: AOAM532TOmrFMeGyC25cJboxGXfQIgMYuINmMtVRbcxVjjdc/IVN4ST/
	jWs/cMnRbc/IptWDskY0h6otxn/1mS39w0zEvodjWQ==
X-Google-Smtp-Source: ABdhPJzjhcVkUEeD1APwSHAh64c/p96XHoPy4Fh2atUQgZkaOHiOmgpBd47tv0fuWxKGQKpw72E84eSIddf8XzyzM0Y=
X-Received: by 2002:a63:e214:: with SMTP id q20mr892562pgh.431.1636394060000;
 Mon, 08 Nov 2021 09:54:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211108174142.52835-1-manivannan.sadhasivam@linaro.org>
In-Reply-To: <20211108174142.52835-1-manivannan.sadhasivam@linaro.org>
From: Loic Poulain <loic.poulain@linaro.org>
Date: Mon, 8 Nov 2021 19:04:56 +0100
Message-ID: <CAMZdPi-U=nDsGn41tr7NEWAJ3dwYK70fDEkfOO914Q-a1tyfSQ@mail.gmail.com>
Subject: Re: [PATCH] bus: mhi: Fix race while handling SYS_ERR at power up
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev, aleksander@aleksander.es, thomas.perrot@bootlin.com, 
	hemantk@codeaurora.org, bbhatt@codeaurora.org, quic_jhugo@quicinc.com, 
	linux-arm-msm@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mani,

On Mon, 8 Nov 2021 at 18:42, Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
>
> Some devices tend to trigger SYS_ERR interrupt while the host handling
> SYS_ERR state of the device during power up. This creates a race
> condition and causes a failure in booting up the device.
>
> The issue is seen on the Sierra Wireless EM9191 modem during SYS_ERR
> handling in mhi_async_power_up(). Once the host detects that the device
> is in SYS_ERR state, it issues MHI_RESET and waits for the device to
> process the reset request. During this time, the device triggers SYS_ERR
> interrupt to the host and host starts handling SYS_ERR execution.
>
> So by the time the device has completed reset, host starts SYS_ERR
> handling. This causes the race condition and the modem fails to boot.
>
> Hence, register the IRQ handler only after handling the SYS_ERR check
> to avoid getting spurious IRQs from the device.
>
> Cc: stable@vger.kernel.org
> Fixes: e18d4e9fa79b ("bus: mhi: core: Handle syserr during power_up")
> Reported-by: Aleksander Morgado <aleksander@aleksander.es>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  drivers/bus/mhi/core/pm.c | 26 +++++++++++---------------
>  1 file changed, 11 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> index fb99e3727155..ec5f11166820 100644
> --- a/drivers/bus/mhi/core/pm.c
> +++ b/drivers/bus/mhi/core/pm.c
> @@ -1055,10 +1055,6 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
>         mutex_lock(&mhi_cntrl->pm_mutex);
>         mhi_cntrl->pm_state = MHI_PM_DISABLE;
>
> -       ret = mhi_init_irq_setup(mhi_cntrl);
> -       if (ret)
> -               goto error_setup_irq;
> -
>         /* Setup BHI INTVEC */
>         write_lock_irq(&mhi_cntrl->pm_lock);
>         mhi_write_reg(mhi_cntrl, mhi_cntrl->bhi, BHI_INTVEC, 0);
> @@ -1072,7 +1068,7 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
>                 dev_err(dev, "%s is not a valid EE for power on\n",
>                         TO_MHI_EXEC_STR(current_ee));
>                 ret = -EIO;
> -               goto error_async_power_up;
> +               goto error_setup_irq;
>         }
>
>         state = mhi_get_mhi_state(mhi_cntrl);
> @@ -1082,19 +1078,18 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
>         if (state == MHI_STATE_SYS_ERR) {
>                 mhi_set_mhi_state(mhi_cntrl, MHI_STATE_RESET);
>                 ret = wait_event_timeout(mhi_cntrl->state_event,

Shouldn't we use a polling variant such as mhi_poll_reg_field() given
the interrupts are not yet enabled?

> -                               MHI_PM_IN_FATAL_STATE(mhi_cntrl->pm_state) ||
> -                                       mhi_read_reg_field(mhi_cntrl,
> -                                                          mhi_cntrl->regs,
> -                                                          MHICTRL,
> -                                                          MHICTRL_RESET_MASK,
> -                                                          MHICTRL_RESET_SHIFT,
> +                                        mhi_read_reg_field(mhi_cntrl,
> +                                                           mhi_cntrl->regs,
> +                                                           MHICTRL,
> +                                                           MHICTRL_RESET_MASK,
> +                                                           MHICTRL_RESET_SHIFT,
>                                                            &val) ||
>                                         !val,
>                                 msecs_to_jiffies(mhi_cntrl->timeout_ms));
>                 if (!ret) {
>                         ret = -EIO;
>                         dev_info(dev, "Failed to reset MHI due to syserr state\n");
> -                       goto error_async_power_up;
> +                       goto error_setup_irq;
>                 }

Regards,
Loic
