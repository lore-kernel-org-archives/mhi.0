Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7EE7C
	for <mhi@lists.linux.dev>; Mon, 28 Feb 2022 15:56:27 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id c14so10315540ilm.4
        for <mhi@lists.linux.dev>; Mon, 28 Feb 2022 07:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=hbd3PzDMWyEi8w1J5lNXrRbncO7Xk3kUZ9oTOFrvQJ0=;
        b=gnVt4aXB09+0KeLqRM4g2nPuDlB7L1RPQLDLf6/lrCScKa5Sj3KEJvT6tKTEWxb+lt
         sBGcD9j7GOlybUEoGBaKMHAlXl12KpI2wbp99B/NWIlsEs1KOdx0yUoFzAuA0UPod/5Q
         S5iuU0zTKVHKPwAOgkInzloiyDAa59CzxgFP1NSE9V/1wB3yjprEMHwIrexRDyLHaeBb
         bk00d5HPXL6uAZnqfDh0CBa1nwzwwG2eqDbBqdpWDQfTu04xv0ubZMrzhA0GapwKr8+V
         DX0yOH4eZWnAPImR9sY3dZ/sHufathoWMbuJiq92cqIjEo6oV931oiNuF8IA+Do7DYdc
         eUKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=hbd3PzDMWyEi8w1J5lNXrRbncO7Xk3kUZ9oTOFrvQJ0=;
        b=ZG4XRv6ZpSYxBfp/Ny+kDoSGPHkYj1vvs5Dulqru/7eOwONXdjIZmQ+MpNslJZ+D9+
         /UJcpQJ8KxHc8wDCNjqK2UP4RHPYE41JWCxAT2nxxKj2LlqSlaLHYUqprGyWGcIOmtdz
         FoHS3lG4kaqWaktC0BIdpjdCwAYGjp5tAkTNvpa6t4S5eafTknbyXV/bGNw2aXxmiK06
         HLWgk9aPFwIe6ji+WsikPoi6ix7yy9+y151J2wQqVlpXZ8R3QxBxecfL0faPQroRxPXb
         qOirFkg0BvtTYqc9GzXv03dfKWwCXL2UqLyaHcBNNnQDyxbAluRvpITjGpFEM3lpuT8P
         uNsw==
X-Gm-Message-State: AOAM533bcAdOCw3Syxi+MRSL1xKj/XGEv4Mhq/Ab72OrPrVtp528n+nm
	aAf1qjYnlHngizXE3t8v5cdDgQ==
X-Google-Smtp-Source: ABdhPJzRqRtUCGEuwISwrH1DaDtQma/kz0pac+miSnEY/BWB/6pd4w316dfFAociGCu/nHgKE39XyQ==
X-Received: by 2002:a92:cb44:0:b0:2be:33b0:2a52 with SMTP id f4-20020a92cb44000000b002be33b02a52mr18025563ilq.142.1646063786869;
        Mon, 28 Feb 2022 07:56:26 -0800 (PST)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id 14-20020a92180e000000b002c1bfa2a5e6sm6349898ily.65.2022.02.28.07.56.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Feb 2022 07:56:26 -0800 (PST)
Message-ID: <c4bcf9f6-82d7-1e35-64bb-0973ed2ceb4a@linaro.org>
Date: Mon, 28 Feb 2022 09:56:25 -0600
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 09/27] bus: mhi: Make mhi_state_str[] array static
 inline and move to common.h
Content-Language: en-US
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 mhi@lists.linux.dev
Cc: quic_hemantk@quicinc.com, quic_bbhatt@quicinc.com,
 quic_jhugo@quicinc.com, vinod.koul@linaro.org, bjorn.andersson@linaro.org,
 dmitry.baryshkov@linaro.org, quic_vbadigan@quicinc.com,
 quic_cang@quicinc.com, quic_skananth@quicinc.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Hemant Kumar <hemantk@codeaurora.org>
References: <20220228124344.77359-1-manivannan.sadhasivam@linaro.org>
 <20220228124344.77359-10-manivannan.sadhasivam@linaro.org>
From: Alex Elder <elder@linaro.org>
In-Reply-To: <20220228124344.77359-10-manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/28/22 6:43 AM, Manivannan Sadhasivam wrote:
> mhi_state_str[] array could be used by MHI endpoint stack also. So let's
> make the array as "static inline function" and move it inside the
> "common.h" header so that the endpoint stack could also make use of it.
> 
> Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

I guess my grumbling on patch 1 belonged here.  I prefer your use
of a switch statement though, and that alleviates my concern.

Reviewed-by: Alex Elder <elder@linaro.org>

> ---
>   drivers/bus/mhi/common.h       | 29 +++++++++++++++++++++++++----
>   drivers/bus/mhi/host/boot.c    |  2 +-
>   drivers/bus/mhi/host/debugfs.c |  6 +++---
>   drivers/bus/mhi/host/init.c    | 12 ------------
>   drivers/bus/mhi/host/main.c    |  8 ++++----
>   drivers/bus/mhi/host/pm.c      | 14 +++++++-------
>   6 files changed, 40 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/bus/mhi/common.h b/drivers/bus/mhi/common.h
> index f2690bf11c99..ec75ba1e6686 100644
> --- a/drivers/bus/mhi/common.h
> +++ b/drivers/bus/mhi/common.h
> @@ -275,9 +275,30 @@ struct mhi_ring_element {
>   	__le32 dword[2];
>   };
>   
> -extern const char * const mhi_state_str[MHI_STATE_MAX];
> -#define TO_MHI_STATE_STR(state) ((state >= MHI_STATE_MAX || \
> -				  !mhi_state_str[state]) ? \
> -				"INVALID_STATE" : mhi_state_str[state])
> +static inline const char * const mhi_state_str(enum mhi_state state)
> +{
> +	switch (state) {
> +	case MHI_STATE_RESET:
> +		return "RESET";
> +	case MHI_STATE_READY:
> +		return "READY";
> +	case MHI_STATE_M0:
> +		return "M0";
> +	case MHI_STATE_M1:
> +		return "M1";
> +	case MHI_STATE_M2:
> +		return "M2";
> +	case MHI_STATE_M3:
> +		return "M3";
> +	case MHI_STATE_M3_FAST:
> +		return "M3 FAST";
> +	case MHI_STATE_BHI:
> +		return "BHI";
> +	case MHI_STATE_SYS_ERR:
> +		return "SYS ERROR";
> +	default:
> +		return "Unknown state";
> +	}
> +};
>   
>   #endif /* _MHI_COMMON_H */
> diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
> index d5ba3c7efb61..b0da7ca4519c 100644
> --- a/drivers/bus/mhi/host/boot.c
> +++ b/drivers/bus/mhi/host/boot.c
> @@ -67,7 +67,7 @@ static int __mhi_download_rddm_in_panic(struct mhi_controller *mhi_cntrl)
>   
>   	dev_dbg(dev, "Entered with pm_state:%s dev_state:%s ee:%s\n",
>   		to_mhi_pm_state_str(mhi_cntrl->pm_state),
> -		TO_MHI_STATE_STR(mhi_cntrl->dev_state),
> +		mhi_state_str(mhi_cntrl->dev_state),
>   		TO_MHI_EXEC_STR(mhi_cntrl->ee));
>   
>   	/*
> diff --git a/drivers/bus/mhi/host/debugfs.c b/drivers/bus/mhi/host/debugfs.c
> index bdc875d7bd4d..cfec7811dfbb 100644
> --- a/drivers/bus/mhi/host/debugfs.c
> +++ b/drivers/bus/mhi/host/debugfs.c
> @@ -20,7 +20,7 @@ static int mhi_debugfs_states_show(struct seq_file *m, void *d)
>   	seq_printf(m, "PM state: %s Device: %s MHI state: %s EE: %s wake: %s\n",
>   		   to_mhi_pm_state_str(mhi_cntrl->pm_state),
>   		   mhi_is_active(mhi_cntrl) ? "Active" : "Inactive",
> -		   TO_MHI_STATE_STR(mhi_cntrl->dev_state),
> +		   mhi_state_str(mhi_cntrl->dev_state),
>   		   TO_MHI_EXEC_STR(mhi_cntrl->ee),
>   		   mhi_cntrl->wake_set ? "true" : "false");
>   
> @@ -206,13 +206,13 @@ static int mhi_debugfs_regdump_show(struct seq_file *m, void *d)
>   
>   	seq_printf(m, "Host PM state: %s Device state: %s EE: %s\n",
>   		   to_mhi_pm_state_str(mhi_cntrl->pm_state),
> -		   TO_MHI_STATE_STR(mhi_cntrl->dev_state),
> +		   mhi_state_str(mhi_cntrl->dev_state),
>   		   TO_MHI_EXEC_STR(mhi_cntrl->ee));
>   
>   	state = mhi_get_mhi_state(mhi_cntrl);
>   	ee = mhi_get_exec_env(mhi_cntrl);
>   	seq_printf(m, "Device EE: %s state: %s\n", TO_MHI_EXEC_STR(ee),
> -		   TO_MHI_STATE_STR(state));
> +		   mhi_state_str(state));
>   
>   	for (i = 0; regs[i].name; i++) {
>   		if (!regs[i].base)
> diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
> index 016dcc35db80..a665b8e92408 100644
> --- a/drivers/bus/mhi/host/init.c
> +++ b/drivers/bus/mhi/host/init.c
> @@ -45,18 +45,6 @@ const char * const dev_state_tran_str[DEV_ST_TRANSITION_MAX] = {
>   	[DEV_ST_TRANSITION_DISABLE] = "DISABLE",
>   };
>   
> -const char * const mhi_state_str[MHI_STATE_MAX] = {
> -	[MHI_STATE_RESET] = "RESET",
> -	[MHI_STATE_READY] = "READY",
> -	[MHI_STATE_M0] = "M0",
> -	[MHI_STATE_M1] = "M1",
> -	[MHI_STATE_M2] = "M2",
> -	[MHI_STATE_M3] = "M3",
> -	[MHI_STATE_M3_FAST] = "M3 FAST",
> -	[MHI_STATE_BHI] = "BHI",
> -	[MHI_STATE_SYS_ERR] = "SYS ERROR",
> -};
> -
>   const char * const mhi_ch_state_type_str[MHI_CH_STATE_TYPE_MAX] = {
>   	[MHI_CH_STATE_TYPE_RESET] = "RESET",
>   	[MHI_CH_STATE_TYPE_STOP] = "STOP",
> diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
> index dabf85b92a84..9021be7f2359 100644
> --- a/drivers/bus/mhi/host/main.c
> +++ b/drivers/bus/mhi/host/main.c
> @@ -477,8 +477,8 @@ irqreturn_t mhi_intvec_threaded_handler(int irq_number, void *priv)
>   	ee = mhi_get_exec_env(mhi_cntrl);
>   	dev_dbg(dev, "local ee: %s state: %s device ee: %s state: %s\n",
>   		TO_MHI_EXEC_STR(mhi_cntrl->ee),
> -		TO_MHI_STATE_STR(mhi_cntrl->dev_state),
> -		TO_MHI_EXEC_STR(ee), TO_MHI_STATE_STR(state));
> +		mhi_state_str(mhi_cntrl->dev_state),
> +		TO_MHI_EXEC_STR(ee), mhi_state_str(state));
>   
>   	if (state == MHI_STATE_SYS_ERR) {
>   		dev_dbg(dev, "System error detected\n");
> @@ -844,7 +844,7 @@ int mhi_process_ctrl_ev_ring(struct mhi_controller *mhi_cntrl,
>   			new_state = MHI_TRE_GET_EV_STATE(local_rp);
>   
>   			dev_dbg(dev, "State change event to state: %s\n",
> -				TO_MHI_STATE_STR(new_state));
> +				mhi_state_str(new_state));
>   
>   			switch (new_state) {
>   			case MHI_STATE_M0:
> @@ -871,7 +871,7 @@ int mhi_process_ctrl_ev_ring(struct mhi_controller *mhi_cntrl,
>   			}
>   			default:
>   				dev_err(dev, "Invalid state: %s\n",
> -					TO_MHI_STATE_STR(new_state));
> +					mhi_state_str(new_state));
>   			}
>   
>   			break;
> diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
> index bb8a23e80e19..3d90b8ecd3d9 100644
> --- a/drivers/bus/mhi/host/pm.c
> +++ b/drivers/bus/mhi/host/pm.c
> @@ -541,7 +541,7 @@ static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl)
>   
>   	dev_dbg(dev, "Exiting with PM state: %s, MHI state: %s\n",
>   		to_mhi_pm_state_str(mhi_cntrl->pm_state),
> -		TO_MHI_STATE_STR(mhi_cntrl->dev_state));
> +		mhi_state_str(mhi_cntrl->dev_state));
>   
>   	mutex_unlock(&mhi_cntrl->pm_mutex);
>   }
> @@ -684,7 +684,7 @@ static void mhi_pm_sys_error_transition(struct mhi_controller *mhi_cntrl)
>   exit_sys_error_transition:
>   	dev_dbg(dev, "Exiting with PM state: %s, MHI state: %s\n",
>   		to_mhi_pm_state_str(mhi_cntrl->pm_state),
> -		TO_MHI_STATE_STR(mhi_cntrl->dev_state));
> +		mhi_state_str(mhi_cntrl->dev_state));
>   
>   	mutex_unlock(&mhi_cntrl->pm_mutex);
>   }
> @@ -859,7 +859,7 @@ int mhi_pm_suspend(struct mhi_controller *mhi_cntrl)
>   	if (!ret || MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state)) {
>   		dev_err(dev,
>   			"Did not enter M3 state, MHI state: %s, PM state: %s\n",
> -			TO_MHI_STATE_STR(mhi_cntrl->dev_state),
> +			mhi_state_str(mhi_cntrl->dev_state),
>   			to_mhi_pm_state_str(mhi_cntrl->pm_state));
>   		return -EIO;
>   	}
> @@ -885,7 +885,7 @@ static int __mhi_pm_resume(struct mhi_controller *mhi_cntrl, bool force)
>   
>   	dev_dbg(dev, "Entered with PM state: %s, MHI state: %s\n",
>   		to_mhi_pm_state_str(mhi_cntrl->pm_state),
> -		TO_MHI_STATE_STR(mhi_cntrl->dev_state));
> +		mhi_state_str(mhi_cntrl->dev_state));
>   
>   	if (mhi_cntrl->pm_state == MHI_PM_DISABLE)
>   		return 0;
> @@ -895,7 +895,7 @@ static int __mhi_pm_resume(struct mhi_controller *mhi_cntrl, bool force)
>   
>   	if (mhi_get_mhi_state(mhi_cntrl) != MHI_STATE_M3) {
>   		dev_warn(dev, "Resuming from non M3 state (%s)\n",
> -			 TO_MHI_STATE_STR(mhi_get_mhi_state(mhi_cntrl)));
> +			 mhi_state_str(mhi_get_mhi_state(mhi_cntrl)));
>   		if (!force)
>   			return -EINVAL;
>   	}
> @@ -932,7 +932,7 @@ static int __mhi_pm_resume(struct mhi_controller *mhi_cntrl, bool force)
>   	if (!ret || MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state)) {
>   		dev_err(dev,
>   			"Did not enter M0 state, MHI state: %s, PM state: %s\n",
> -			TO_MHI_STATE_STR(mhi_cntrl->dev_state),
> +			mhi_state_str(mhi_cntrl->dev_state),
>   			to_mhi_pm_state_str(mhi_cntrl->pm_state));
>   		return -EIO;
>   	}
> @@ -1083,7 +1083,7 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
>   
>   	state = mhi_get_mhi_state(mhi_cntrl);
>   	dev_dbg(dev, "Attempting power on with EE: %s, state: %s\n",
> -		TO_MHI_EXEC_STR(current_ee), TO_MHI_STATE_STR(state));
> +		TO_MHI_EXEC_STR(current_ee), mhi_state_str(state));
>   
>   	if (state == MHI_STATE_SYS_ERR) {
>   		mhi_set_mhi_state(mhi_cntrl, MHI_STATE_RESET);

