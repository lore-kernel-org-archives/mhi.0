Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60252C82
	for <mhi@lists.linux.dev>; Thu, 16 Dec 2021 05:34:37 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id k6-20020a17090a7f0600b001ad9d73b20bso21531771pjl.3
        for <mhi@lists.linux.dev>; Wed, 15 Dec 2021 21:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VqjuAZq4oYCDMdr1hBIQdlpGSzDoDJuodoNVlHQ7Q0s=;
        b=xls5EM4qKFWwvtdK4cimzOnYs74i3CN7oPdWI7GGC8tVpFeIZjeSBeZzxnRlWmOQc5
         JFkje+nsfQg/DN+8v9LjaeUwgNUub7A4l1tC+5FxS/1RSHoA+pXH/5VbueCMm5WLAv45
         aFZVk1zxrkGXpRlDMOnmWsIs+GcW0pYVZcwSxFGfP/Y2cIbjEaLbTysVL1ePuxgcm8bX
         G5OkPJvcSImkxx42eJ1ZXYwclBP/E9/w0HdLc8HxOe1/aw+n9V5eTs82YlovTl4/D67T
         IgF2TOQY7i7hIlc2sBG5hR6vRRjBf4AsD+UJwd0JQH8OTujuEjQ9siJk5NlwB/qZsqqY
         i+Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VqjuAZq4oYCDMdr1hBIQdlpGSzDoDJuodoNVlHQ7Q0s=;
        b=0VGTZ2TiinvmTMmo3odPm8ZU3vzWjUyK79SuTLR1oJ0YNfBiWkP4e5HhSpRCpmDSup
         vAmfDxecPtrdRwAVnFrGsccclhMNYr48njZmWTdLFf3neubqtyURMBF5BNKZ/BTpC0FJ
         WhWy2aGWbgM3v5IuKYZPrcDoZOOtk0+tLTE9rsnDQz7zSG+rUVBrV5U2bdi2zg6IwZX8
         2kTtlGHvdHGvBSTZD82py3wb25KKsuE6KeYuDRcJ8XMXd729nwvvJb1a8ZyhAXQZYNXW
         Y0caHoRxwNKci4l5FAuLaMGmQFEtexKUjCsTlIBmT8MrpYfSOMU+0FHqwCaiET2WhXpD
         VunQ==
X-Gm-Message-State: AOAM532kzTpGJd0fF/r44EcfYokHAa7k67T8qkdQQqfsdWbfHnmWGhVH
	A82HAyZq9VeO83dqDacbWUKhawHxiwmx
X-Google-Smtp-Source: ABdhPJxC1DCgra3M7loMbJwumYjV0t3Kms8EW6VqH88yxs0m4oX009/rQ2R5hxrkywNW6U3GpWfiJQ==
X-Received: by 2002:a17:902:d4ce:b0:148:a2f7:9d52 with SMTP id o14-20020a170902d4ce00b00148a2f79d52mr8023101plg.113.1639632876922;
        Wed, 15 Dec 2021 21:34:36 -0800 (PST)
Received: from thinkpad ([117.193.209.65])
        by smtp.gmail.com with ESMTPSA id mv22sm3880583pjb.36.2021.12.15.21.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 21:34:36 -0800 (PST)
Date: Thu, 16 Dec 2021 11:04:31 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: mhi@lists.linux.dev
Cc: aleksander@aleksander.es, loic.poulain@linaro.org,
	thomas.perrot@bootlin.com, hemantk@codeaurora.org,
	bbhatt@codeaurora.org, quic_jhugo@quicinc.com,
	linux-arm-msm@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v5] bus: mhi: Fix race while handling SYS_ERR at power up
Message-ID: <20211216053431.GB42608@thinkpad>
References: <20211207070018.115219-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211207070018.115219-1-manivannan.sadhasivam@linaro.org>

On Tue, Dec 07, 2021 at 12:30:18PM +0530, Manivannan Sadhasivam wrote:
> During SYS_ERR condition, as a response to the MHI_RESET from host, some
> devices tend to issue BHI interrupt without clearing the SYS_ERR state in
> the device. This creates a race condition and causes a failure in booting
> up the device.
> 
> The issue is seen on the Sierra Wireless EM9191 modem during SYS_ERR
> handling in mhi_async_power_up(). Once the host detects that the device
> is in SYS_ERR state, it issues MHI_RESET and waits for the device to
> process the reset request. During this time, the device triggers the BHI
> interrupt to the host without clearing SYS_ERR condition. So the host
> starts handling the SYS_ERR condition again.
> 
> To fix this issue, let's register the IRQ handler only after handling the
> SYS_ERR check to avoid getting spurious IRQs from the device.
> 
> Cc: stable@vger.kernel.org
> Fixes: e18d4e9fa79b ("bus: mhi: core: Handle syserr during power_up")
> Reported-by: Aleksander Morgado <aleksander@aleksander.es>
> Tested-by: Aleksander Morgado <aleksander@aleksander.es>
> Tested-by: Thomas Perrot <thomas.perrot@bootlin.com>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Applied to mhi-next!

Thanks,
Mani

> ---
> 
> Changes in v5:
> 
> * Rewored the commit message and used "error_exit" goto label for error
>   path
> 
> Changes in v4:
> 
> * Reverted the change that moved BHI_INTVEC as that was causing issue as
>   reported by Aleksander.
> 
> Changes in v3:
> 
> * Moved BHI_INTVEC setup after irq setup
> * Used interval_us as the delay for the polling API
> 
> Changes in v2:
> 
> * Switched to "mhi_poll_reg_field" for detecting MHI reset in device.
> 
>  drivers/bus/mhi/core/pm.c | 35 ++++++++++++-----------------------
>  1 file changed, 12 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> index 7464f5d09973..9ae8532df5a3 100644
> --- a/drivers/bus/mhi/core/pm.c
> +++ b/drivers/bus/mhi/core/pm.c
> @@ -1038,7 +1038,7 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
>  	enum mhi_ee_type current_ee;
>  	enum dev_st_transition next_state;
>  	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> -	u32 val;
> +	u32 interval_us = 25000; /* poll register field every 25 milliseconds */
>  	int ret;
>  
>  	dev_info(dev, "Requested to power ON\n");
> @@ -1055,10 +1055,6 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
>  	mutex_lock(&mhi_cntrl->pm_mutex);
>  	mhi_cntrl->pm_state = MHI_PM_DISABLE;
>  
> -	ret = mhi_init_irq_setup(mhi_cntrl);
> -	if (ret)
> -		goto error_setup_irq;
> -
>  	/* Setup BHI INTVEC */
>  	write_lock_irq(&mhi_cntrl->pm_lock);
>  	mhi_write_reg(mhi_cntrl, mhi_cntrl->bhi, BHI_INTVEC, 0);
> @@ -1072,7 +1068,7 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
>  		dev_err(dev, "%s is not a valid EE for power on\n",
>  			TO_MHI_EXEC_STR(current_ee));
>  		ret = -EIO;
> -		goto error_async_power_up;
> +		goto error_exit;
>  	}
>  
>  	state = mhi_get_mhi_state(mhi_cntrl);
> @@ -1081,20 +1077,12 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
>  
>  	if (state == MHI_STATE_SYS_ERR) {
>  		mhi_set_mhi_state(mhi_cntrl, MHI_STATE_RESET);
> -		ret = wait_event_timeout(mhi_cntrl->state_event,
> -				MHI_PM_IN_FATAL_STATE(mhi_cntrl->pm_state) ||
> -					mhi_read_reg_field(mhi_cntrl,
> -							   mhi_cntrl->regs,
> -							   MHICTRL,
> -							   MHICTRL_RESET_MASK,
> -							   MHICTRL_RESET_SHIFT,
> -							   &val) ||
> -					!val,
> -				msecs_to_jiffies(mhi_cntrl->timeout_ms));
> -		if (!ret) {
> -			ret = -EIO;
> +		ret = mhi_poll_reg_field(mhi_cntrl, mhi_cntrl->regs, MHICTRL,
> +				 MHICTRL_RESET_MASK, MHICTRL_RESET_SHIFT, 0,
> +				 interval_us);
> +		if (ret) {
>  			dev_info(dev, "Failed to reset MHI due to syserr state\n");
> -			goto error_async_power_up;
> +			goto error_exit;
>  		}
>  
>  		/*
> @@ -1104,6 +1092,10 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
>  		mhi_write_reg(mhi_cntrl, mhi_cntrl->bhi, BHI_INTVEC, 0);
>  	}
>  
> +	ret = mhi_init_irq_setup(mhi_cntrl);
> +	if (ret)
> +		goto error_exit;
> +
>  	/* Transition to next state */
>  	next_state = MHI_IN_PBL(current_ee) ?
>  		DEV_ST_TRANSITION_PBL : DEV_ST_TRANSITION_READY;
> @@ -1116,10 +1108,7 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
>  
>  	return 0;
>  
> -error_async_power_up:
> -	mhi_deinit_free_irq(mhi_cntrl);
> -
> -error_setup_irq:
> +error_exit:
>  	mhi_cntrl->pm_state = MHI_PM_DISABLE;
>  	mutex_unlock(&mhi_cntrl->pm_mutex);
>  
> -- 
> 2.25.1
> 
