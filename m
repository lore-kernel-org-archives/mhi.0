Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC86B14E2D8
	for <mhi@lists.linux.dev>; Tue, 30 Jan 2024 18:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706637861; cv=none; b=I1+chu3zriN9mVqQDXr6QYSrctJIBBhF6jAhs5DriElob770/YPOPCI8WREUxRnbT6HEWqwIUwBoFI7Yrjtky7A5pnNzU/Py1cMQwc7ueCWPyV8I5A0+EU9AfVB5hucPLpn3llxUu7uGQAloY0BwndloppJrU4ju3CZG/VmlQfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706637861; c=relaxed/simple;
	bh=V78DnBYedopWK85p/TXru3XCznMVJAsqjvqz3X/y8yA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iB/yxwS/OqunjCPER9BYRnKNjNitWnK4QfoLjtl9AqqxnPG6xWPJPV8EatFBDr8KwLzcTMqUs6Iurjslq0QzopkiCOj4ZT50+C6W7T8etOc87QQroPUa2dnAsMC7mTQ6Bdqiv2ROcdp4txD0gKIQ9qyqQG6S7wWcr3qgO1EUMFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ANdnyi4Z; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ANdnyi4Z"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6ddce722576so2122822b3a.1
        for <mhi@lists.linux.dev>; Tue, 30 Jan 2024 10:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706637859; x=1707242659; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F5rCUPWRVnCWABaRNN1h1y1plAtstVCj5fDa010mMEE=;
        b=ANdnyi4ZUCKqdMGT154FkZ+QBnvEDIvjIcr+x+dDoyoOYPA4+3xn4GRUor/nBQhs7/
         qkQlK++6CkEQumD6Hr/q3IOBz1/7tVuT4mdcg34hMbf+GOOrh95Bn9blRuPpxGfQlqH1
         gwrk8qr0yipqwty+bkRFybJ1pAKoU5S7RvriJ9jwgzIpPGcbuu0ptqoEBKkjhC4wL3h3
         LsxbyTPtDSPe/MYq2T4bwIVK01KknFV8VhYaYa2VhQsPNs9lh50bHLPrMI9jLEn2/ayZ
         Hy3lClYtP/4Q4y4E7+FsXWUqoWRNC4ZYvNvEt3VZnz1jO2K6T8RWeawqZ7e3SH3DVCho
         Nv0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706637859; x=1707242659;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F5rCUPWRVnCWABaRNN1h1y1plAtstVCj5fDa010mMEE=;
        b=qpb+0lPfa6wZ4KpuWqfTFk9cO7a4TqL8T+WQm1kc2joHYSX4bWBf3kZCYi+PKSY6L4
         xcx4aN9/Ie0vXOO0FUAa7ZAOnQRNPXp39XGcgIaA/+L1z9QlaIS8Iy9EHdo0XrNcrvwX
         0QDb2ghrp/hO4iBWUJJNF93UGbhksoL4U7GW5QsvcNw+nqc475Vsoy4sUg/dqmgSQBir
         dYrifko/QCS08u9Igsh+URgiPLQkrSHfQMeYsEP2/LMpUBzT4kt6JSQYOhYjIRzHIBxy
         fkZ8ge9a6ME9BJ0Yy6V8ZWzlBfkxoyh6DIDQt+SA/k4TB3AShspqi6OcJA54/R6O+cwQ
         62MQ==
X-Gm-Message-State: AOJu0YxZ8e476s/X1hdmQyRInATyzFOEmekbpNWd2SSTBlq7f4tOcbRT
	O99UF0Tnbb7HJVvcSjnuJEuGoe7db5CrkQ0FfgDDm3J6js3vv3BwBtgDMdAMXQ==
X-Google-Smtp-Source: AGHT+IE24Ukg4bkh+RCYauvJd0iOfN2NlWT2ru38iOlXAK6Nun7jw7rCxMFXPNnCOVxpNigZ9/ANMQ==
X-Received: by 2002:a05:6a21:3502:b0:19c:841a:99e4 with SMTP id zc2-20020a056a21350200b0019c841a99e4mr4623182pzb.6.1706637859071;
        Tue, 30 Jan 2024 10:04:19 -0800 (PST)
Received: from thinkpad ([103.28.246.123])
        by smtp.gmail.com with ESMTPSA id v11-20020a056a00148b00b006ddc2cf3662sm8115605pfu.184.2024.01.30.10.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 10:04:18 -0800 (PST)
Date: Tue, 30 Jan 2024 23:34:11 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: mhi@lists.linux.dev, ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH RFC v2 1/8] bus: mhi: host: add
 mhi_power_down_no_destroy()
Message-ID: <20240130180411.GA4218@thinkpad>
References: <20231127162022.518834-1-kvalo@kernel.org>
 <20231127162022.518834-2-kvalo@kernel.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231127162022.518834-2-kvalo@kernel.org>

On Mon, Nov 27, 2023 at 06:20:15PM +0200, Kalle Valo wrote:
> From: Baochen Qiang <quic_bqiang@quicinc.com>
> 
> If ath11k tries to call mhi_power_up() during resume it fails:
> 

This is confusing! Maybe this is what confused me initially. mhi_sync_power_up()
never fails, but ath11k timesout waiting for QMI. You also confirmed the same
[1].

> ath11k_pci 0000:06:00.0: timeout while waiting for restart complete
> 
> This happens because when calling mhi_power_up() the MHI subsystem eventually
> calls device_add() from mhi_create_devices() but the device creation is
> deferred:
> 
> mhi mhi0_IPCR: Driver qcom_mhi_qrtr force probe deferral
> 
> The reason for deferring device creation is explained in dpm_prepare():
> 
> 	/*
> 	 * It is unsafe if probing of devices will happen during suspend or
> 	 * hibernation and system behavior will be unpredictable in this case.
> 	 * So, let's prohibit device's probing here and defer their probes
> 	 * instead. The normal behavior will be restored in dpm_complete().
> 	 */
> 
> Because the device probe is deferred, the qcom_mhi_qrtr_probe() is not called and
> qcom_mhi_qrtr_dl_callback() fails silently as qdev is zero:
> 
> static void qcom_mhi_qrtr_dl_callback(struct mhi_device *mhi_dev,
> 				      struct mhi_result *mhi_res)
> {
> 	struct qrtr_mhi_dev *qdev = dev_get_drvdata(&mhi_dev->dev);
> 	int rc;
> 
> 	if (!qdev || mhi_res->transaction_status)
> 		return;
> 
> So what this means that QRTR is not delivering messages and the QMI connection
> is not working between ath11k and the firmware, resulting a failure in firmware
> initialisation.
> 
> To fix this add new function mhi_power_down_no_destroy() which does not destroy
> the devices during power down. This way mhi_power_up() can be called during
> resume and we can get ath11k hibernation working with the following patches.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
> ---
>  drivers/bus/mhi/host/init.c     |  1 +
>  drivers/bus/mhi/host/internal.h |  1 +
>  drivers/bus/mhi/host/pm.c       | 26 +++++++++++++++++++-------
>  include/linux/mhi.h             | 29 +++++++++++++++++++++++++++--
>  4 files changed, 48 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
> index 65ceac1837f9..e626b03ffafa 100644
> --- a/drivers/bus/mhi/host/init.c
> +++ b/drivers/bus/mhi/host/init.c
> @@ -43,6 +43,7 @@ const char * const dev_state_tran_str[DEV_ST_TRANSITION_MAX] = {
>  	[DEV_ST_TRANSITION_FP] = "FLASH PROGRAMMER",
>  	[DEV_ST_TRANSITION_SYS_ERR] = "SYS ERROR",
>  	[DEV_ST_TRANSITION_DISABLE] = "DISABLE",
> +	[DEV_ST_TRANSITION_DISABLE_DESTROY_DEVICE] = "DISABLE (DESTROY DEVICE)",
>  };
>  
>  const char * const mhi_ch_state_type_str[MHI_CH_STATE_TYPE_MAX] = {
> diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
> index 30ac415a3000..3f45c9c447bd 100644
> --- a/drivers/bus/mhi/host/internal.h
> +++ b/drivers/bus/mhi/host/internal.h
> @@ -69,6 +69,7 @@ enum dev_st_transition {
>  	DEV_ST_TRANSITION_FP,
>  	DEV_ST_TRANSITION_SYS_ERR,
>  	DEV_ST_TRANSITION_DISABLE,
> +	DEV_ST_TRANSITION_DISABLE_DESTROY_DEVICE,
>  	DEV_ST_TRANSITION_MAX,
>  };
>  
> diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
> index a2f2feef1476..8833b0248393 100644
> --- a/drivers/bus/mhi/host/pm.c
> +++ b/drivers/bus/mhi/host/pm.c
> @@ -458,7 +458,8 @@ static int mhi_pm_mission_mode_transition(struct mhi_controller *mhi_cntrl)
>  }
>  
>  /* Handle shutdown transitions */
> -static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl)
> +static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl,
> +				      bool destroy_device)
>  {
>  	enum mhi_pm_state cur_state;
>  	struct mhi_event *mhi_event;
> @@ -520,8 +521,10 @@ static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl)
>  	dev_dbg(dev, "Waiting for all pending threads to complete\n");
>  	wake_up_all(&mhi_cntrl->state_event);
>  
> -	dev_dbg(dev, "Reset all active channels and remove MHI devices\n");
> -	device_for_each_child(&mhi_cntrl->mhi_dev->dev, NULL, mhi_destroy_device);
> +	if (destroy_device) {
> +		dev_dbg(dev, "Reset all active channels and remove MHI devices\n");
> +		device_for_each_child(&mhi_cntrl->mhi_dev->dev, NULL, mhi_destroy_device);
> +	}
>  
>  	mutex_lock(&mhi_cntrl->pm_mutex);
>  
> @@ -806,7 +809,10 @@ void mhi_pm_st_worker(struct work_struct *work)
>  			mhi_pm_sys_error_transition(mhi_cntrl);
>  			break;
>  		case DEV_ST_TRANSITION_DISABLE:
> -			mhi_pm_disable_transition(mhi_cntrl);
> +			mhi_pm_disable_transition(mhi_cntrl, false);
> +			break;
> +		case DEV_ST_TRANSITION_DISABLE_DESTROY_DEVICE:
> +			mhi_pm_disable_transition(mhi_cntrl, true);
>  			break;
>  		default:
>  			break;
> @@ -1160,7 +1166,8 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
>  }
>  EXPORT_SYMBOL_GPL(mhi_async_power_up);
>  
> -void mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful)
> +void __mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful,
> +		      bool destroy_device)
>  {
>  	enum mhi_pm_state cur_state, transition_state;
>  	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> @@ -1196,14 +1203,19 @@ void mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful)
>  	write_unlock_irq(&mhi_cntrl->pm_lock);
>  	mutex_unlock(&mhi_cntrl->pm_mutex);
>  
> -	mhi_queue_state_transition(mhi_cntrl, DEV_ST_TRANSITION_DISABLE);
> +	if (destroy_device)
> +		mhi_queue_state_transition(mhi_cntrl,
> +					   DEV_ST_TRANSITION_DISABLE_DESTROY_DEVICE);
> +	else
> +		mhi_queue_state_transition(mhi_cntrl,
> +					   DEV_ST_TRANSITION_DISABLE);
>  
>  	/* Wait for shutdown to complete */
>  	flush_work(&mhi_cntrl->st_worker);
>  
>  	disable_irq(mhi_cntrl->irq[0]);
>  }
> -EXPORT_SYMBOL_GPL(mhi_power_down);
> +EXPORT_SYMBOL_GPL(__mhi_power_down);

This is a helper, so should not be exported. You should export the API instead.

>  
>  int mhi_sync_power_up(struct mhi_controller *mhi_cntrl)
>  {
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index d0f9b522f328..ae092bc8b97e 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -648,12 +648,37 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl);
>   */
>  int mhi_sync_power_up(struct mhi_controller *mhi_cntrl);
>  
> +void __mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful,
> +		    bool destroy_device);

This is a helper, so make it static.

> +
>  /**
> - * mhi_power_down - Start MHI power down sequence
> + * mhi_power_down - Start MHI power down sequence. See also
> + * mhi_power_down_no_destroy() which is a variant of this for suspend.

suspend/hibernation

> + *
>   * @mhi_cntrl: MHI controller
>   * @graceful: Link is still accessible, so do a graceful shutdown process
>   */
> -void mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful);
> +static inline void mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful)

No, API cannot be static inline. Make it global.

> +{
> +	__mhi_power_down(mhi_cntrl, graceful, true);
> +}
> +
> +/**
> + * mhi_power_down_no_destroy - Start MHI power down sequence but don't
> + * destroy struct devices. This is a variant for mhi_power_down() and is a

"struct devices for channels"

> + * workaround to make it possible to use mhi_power_up() in a resume

You should mention that the devices are not destroyed and this would be useful
in suspend/hibernation.

> + * handler. When using this variant the caller must also call
> + * mhi_prepare_all_for_transfer_autoqueue() and

mhi_prepare_all_for_transfer*()

> + * mhi_unprepare_all_from_transfer().
> + *
> + * @mhi_cntrl: MHI controller
> + * @graceful: Link is still accessible, so do a graceful shutdown process
> + */
> +static inline void mhi_power_down_no_destroy(struct mhi_controller *mhi_cntrl,
> +					     bool graceful)

Same as above, make it global.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
