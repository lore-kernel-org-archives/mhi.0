Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE292C80
	for <mhi@lists.linux.dev>; Fri, 26 Nov 2021 03:01:51 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id x131so7498921pfc.12
        for <mhi@lists.linux.dev>; Thu, 25 Nov 2021 19:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BynVQIeiNIivT05KJS287cNnQbooVUGhheNqcoVB4w4=;
        b=iIt14tMtJniwQbZaAxQ3Est4t3Ff2ts/f/MX1Z156JA5MWVxigWssvjYU5EZJe36v6
         EfRA2YIb7gMLSJ9e8AUw2SkHewhVtX8Z9PuFsPqlvq119QeECz648sU5fJUEmeTIIFeR
         /hX6E5r/BI4+vcbNBJCBK60qwZOeAQz7zuLat9mjGDPJI4OYB8GoXr0enoVLuNXlJ8t4
         5ZpuZiKngvPQKsj4jlEsxGggQ8oex/vT8zIPqw2YucrnSFoEhV93a521klxipWNBZjuG
         1EHaioBjoG8MjVspsZokAmRuGgs4CRnS4WydA99kE72y8p8lwR3+wlH3gvl2lV111t8q
         UlTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BynVQIeiNIivT05KJS287cNnQbooVUGhheNqcoVB4w4=;
        b=UvE+yawu3RqSvxKbvRwmti+GMSf2LxJRfxXInZLaqBxpa11pyYctKrJoQfFqz3U0f4
         S6KdniBNnU6jUtI/prz4LkyYIFlEFthWRxCbVqgCGSq/Br2MnERShKlFD9JNHUHS8D5n
         /pTLNGK/eoS7OTzuKroyz9ZifuzeSzxdLEqq5Lc2HO74jF+EarenZ7KBTkyl2rP5K1HT
         WJ8kjmovy6/t0ch/XgzeE5chDFsBreM+891tLd12IkbJNELVIII4/5uYfsVxC9ZEovKs
         8oVcjKMLGkY7PZPObAx/eUaTmyXzbeTowapzOn9qZd+NaLqtYHxwkEh+A/vhBIo2sY0n
         kwVQ==
X-Gm-Message-State: AOAM530ntphyfrWAA7JpF40Q/wNHffYYAi8imOYPlO2kXBB2rbh3s9cM
	GbTKjNNtGzYA1J3LEyQegeBU0c4g/SQk
X-Google-Smtp-Source: ABdhPJzAB/unmK4+Mb/MfAf42HoI7g6onRWKtvspjP/fglbRciESFe8VcxE1LBEMAY1C7pt3p6LBqA==
X-Received: by 2002:a63:4745:: with SMTP id w5mr19143246pgk.320.1637895710318;
        Thu, 25 Nov 2021 19:01:50 -0800 (PST)
Received: from thinkpad ([117.215.117.247])
        by smtp.gmail.com with ESMTPSA id h186sm4731054pfg.59.2021.11.25.19.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 19:01:49 -0800 (PST)
Date: Fri, 26 Nov 2021 08:31:44 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: mhi@lists.linux.dev, quic_jhugo@quicinc.com, hemantk@codeaurora.org,
	bbhatt@codeaurora.org
Cc: aleksander@aleksander.es, loic.poulain@linaro.org,
	thomas.perrot@bootlin.com, linux-arm-msm@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v4] bus: mhi: Fix race while handling SYS_ERR at power up
Message-ID: <20211126030144.GC5859@thinkpad>
References: <20211124132221.44915-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211124132221.44915-1-manivannan.sadhasivam@linaro.org>

On Wed, Nov 24, 2021 at 06:52:21PM +0530, Manivannan Sadhasivam wrote:
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

Hemant, Bhaumik, Jeff: Can you please do the review again?

Thanks,
Mani

> ---
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
>  drivers/bus/mhi/core/pm.c | 33 +++++++++++----------------------
>  1 file changed, 11 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> index fb99e3727155..21484a61bbed 100644
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
> +		goto error_setup_irq;
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
> +			goto error_setup_irq;
>  		}
>  
>  		/*
> @@ -1104,6 +1092,10 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
>  		mhi_write_reg(mhi_cntrl, mhi_cntrl->bhi, BHI_INTVEC, 0);
>  	}
>  
> +	ret = mhi_init_irq_setup(mhi_cntrl);
> +	if (ret)
> +		goto error_setup_irq;
> +
>  	/* Transition to next state */
>  	next_state = MHI_IN_PBL(current_ee) ?
>  		DEV_ST_TRANSITION_PBL : DEV_ST_TRANSITION_READY;
> @@ -1116,9 +1108,6 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
>  
>  	return 0;
>  
> -error_async_power_up:
> -	mhi_deinit_free_irq(mhi_cntrl);
> -
>  error_setup_irq:
>  	mhi_cntrl->pm_state = MHI_PM_DISABLE;
>  	mutex_unlock(&mhi_cntrl->pm_mutex);
> -- 
> 2.25.1
> 
