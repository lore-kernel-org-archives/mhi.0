Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E06C54662
	for <mhi@lists.linux.dev>; Tue, 27 Feb 2024 07:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709017977; cv=none; b=BnNDsO3HVgYMXmVhOHNQezm0OuRhVgOB6TGZtIvZE4bwgRWHkU9s700RyE5oLdFBMKuKfVjAuaPvtMZsKVfBBbe5Z5Cl+6FTYiKZSL7cSsf2EKuaIg56qTBs7YNoqHpykr/5iA3Skhcl5ytUCCKhpTzLkK7uasjHu98fnAgxNiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709017977; c=relaxed/simple;
	bh=kZGCWF9V8SRkhQVtg5niigQcG80TP38ShNd3A05ffzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H4m/iPGbE7QR2M28rNXyRzd9iHkRbxtp+fQ+9Oy7a6CZeAGV3Dh8dbR8PWbdUKLSZ08y1InkbPvKw8NfSS71/aoYQK96R8oYjE7JphHQ8LEkM34DA2NNgxbcKOhcYKyKZbzAi0sw3cXI3GjbvRS+DVDxLNAV5K+pCHUH0D9+eoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EoadBPRl; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EoadBPRl"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6e4e7e2594cso2130433b3a.2
        for <mhi@lists.linux.dev>; Mon, 26 Feb 2024 23:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709017975; x=1709622775; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2d45gls5E6DHoFDGkz67r8N78oa/WUavR6gYW/EilR8=;
        b=EoadBPRliNg5einxpEklD3VF2J2T1AKHcY2gh/HXD65UbZO12zfnM47vE1Vjz3rQk4
         LpNSO7J1DJrhXcpRgFO3OM+0gzbsPA8ZTnu1Yagm9mb1EMoSwVh0vDsRY0odBmDWSSlJ
         LUfyTF/ME3JC4A9Yk7MFKl8vh44KOmgHN1nOdU1foNqVoM0NH60nXBniorDurN1h6QJ+
         mi8SOG+d+/vx6MYx+Tdyhqgs5rEnRdbZc7tH/M6TGILMfhP6wiG8PLCaAlCaFQa5HQfT
         kJRsjZp3vptxkRTHg4Gtt3CyRQTQfu6W6ydVObxSGrCPg77eYA0A9SF2/W4qqUzpeK53
         VCLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709017975; x=1709622775;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2d45gls5E6DHoFDGkz67r8N78oa/WUavR6gYW/EilR8=;
        b=WJ0z/6KQ0Al5kNo7YGcMkzI519NoEoXI/Kg4HEvbW7J9OtrwUTZ86rUBF7xlGPCxlW
         X0vzjtyUYwWfBWkwzF5LQXi/OEag9ACXWqCFa2cca47uH9FZaqJiKqWGzgvFSDr76IBD
         yIZA/WwpGS5qsvRq6AckyFY/sjRKpfNyF6frP1rE4FpeL8a8X2tzUHfFvxIHaYwQ/q8r
         kLTUgNc0N5oLHJMxt2DPX2tDB+oGmZr3GvHMy/VgJt+mjP16s5zL8i/SAZ9bQ3TJwlKr
         L6R+PM4AyFkqanlnJv8WsqlekuS7/86rqENU1rGhZGSWDcwQ2TUQf0Y37wk4D/y6o2ms
         gVyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSHPkGL4a50/0EOd9b50MtF/VvzaXX/ivvLJlhJR21Fe8KuUG9ZNS5Duli4fRCll11hzrccm0lRXaBnopkEO4LmyK2
X-Gm-Message-State: AOJu0YxMqIF7xaCRuGG6s7pGxiTVMF1aKq5MLXvdCJEQsXjXGhXFgxiH
	7V3l4Fq4nufuG5htYDe+kTj1cjndtUGfMvR7czgkkSuRevL2n8LijDvBPeNJOQ==
X-Google-Smtp-Source: AGHT+IELCobY2pUNJ1u/obojIQqEMSdmJboJV9duSJH4f/IOyx64dLYkKcOFFTxC9LjzZndNZ4hGVQ==
X-Received: by 2002:a62:cd48:0:b0:6e4:bb45:49f3 with SMTP id o69-20020a62cd48000000b006e4bb4549f3mr9585299pfg.34.1709017975099;
        Mon, 26 Feb 2024 23:12:55 -0800 (PST)
Received: from thinkpad ([117.213.97.177])
        by smtp.gmail.com with ESMTPSA id ei29-20020a056a0080dd00b006e507a98254sm3951760pfb.206.2024.02.26.23.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 23:12:54 -0800 (PST)
Date: Tue, 27 Feb 2024 12:42:49 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev
Subject: Re: [PATCH v2 1/3] bus: mhi: host: add mhi_power_down_keep_dev()
Message-ID: <20240227071249.GC2587@thinkpad>
References: <20240227063613.4478-1-quic_bqiang@quicinc.com>
 <20240227063613.4478-2-quic_bqiang@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240227063613.4478-2-quic_bqiang@quicinc.com>

On Tue, Feb 27, 2024 at 02:36:11PM +0800, Baochen Qiang wrote:
> ath11k fails to resume:
> 
> ath11k_pci 0000:06:00.0: timeout while waiting for restart complete
> 
> This happens because when calling mhi_sync_power_up() the MHI subsystem
> eventually calls device_add() from mhi_create_devices() but the device
> creation is deferred:
> 
> mhi mhi0_IPCR: Driver qcom_mhi_qrtr force probe deferral
> 
> The reason for deferring device creation is explained in dpm_prepare():
> 
>         /*
>          * It is unsafe if probing of devices will happen during suspend or
>          * hibernation and system behavior will be unpredictable in this case.
>          * So, let's prohibit device's probing here and defer their probes
>          * instead. The normal behavior will be restored in dpm_complete().
>          */
> 
> Because the device probe is deferred, the qcom_mhi_qrtr_probe() is not
> called and thus MHI channels are not prepared:
> 
> So what this means that QRTR is not delivering messages and the QMI connection
> is not working between ath11k and the firmware, resulting a failure in firmware
> initialization.
> 
> To fix this add new function mhi_power_down_keep_dev() which doesn't destroy
> the devices for channels during power down. This way we avoid probe defer issue
> and finally can get ath11k hibernation working with the following patches.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
> 
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>

Small nitpicks below. With that fixed,

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Unfortunately, I just sent the PR for 6.9. If possible, I'll try to send v2.
Otherwise, I can only apply it for 6.10.

> ---
>  drivers/bus/mhi/host/internal.h |  4 +++-
>  drivers/bus/mhi/host/pm.c       | 41 ++++++++++++++++++++++++++++-----
>  include/linux/mhi.h             | 18 ++++++++++++++-
>  3 files changed, 55 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
> index 5fe49311b8eb..aaad40a07f69 100644
> --- a/drivers/bus/mhi/host/internal.h
> +++ b/drivers/bus/mhi/host/internal.h
> @@ -80,6 +80,7 @@ enum dev_st_transition {
>  	DEV_ST_TRANSITION_FP,
>  	DEV_ST_TRANSITION_SYS_ERR,
>  	DEV_ST_TRANSITION_DISABLE,
> +	DEV_ST_TRANSITION_DISABLE_DESTROY_DEVICE,
>  	DEV_ST_TRANSITION_MAX,
>  };
>  
> @@ -90,7 +91,8 @@ enum dev_st_transition {
>  	dev_st_trans(MISSION_MODE,	"MISSION MODE")		\
>  	dev_st_trans(FP,		"FLASH PROGRAMMER")	\
>  	dev_st_trans(SYS_ERR,		"SYS ERROR")		\
> -	dev_st_trans_end(DISABLE,	"DISABLE")
> +	dev_st_trans(DISABLE,		"DISABLE")		\
> +	dev_st_trans_end(DISABLE_DESTROY_DEVICE, "DISABLE (DESTROY DEVICE)")
>  
>  extern const char * const dev_state_tran_str[DEV_ST_TRANSITION_MAX];
>  #define TO_DEV_STATE_TRANS_STR(state) (((state) >= DEV_ST_TRANSITION_MAX) ? \
> diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
> index 8b40d3f01acc..4b817b259a3e 100644
> --- a/drivers/bus/mhi/host/pm.c
> +++ b/drivers/bus/mhi/host/pm.c
> @@ -468,7 +468,8 @@ static int mhi_pm_mission_mode_transition(struct mhi_controller *mhi_cntrl)
>  }
>  
>  /* Handle shutdown transitions */
> -static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl)
> +static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl,
> +				      bool destroy_device)
>  {
>  	enum mhi_pm_state cur_state;
>  	struct mhi_event *mhi_event;
> @@ -530,8 +531,15 @@ static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl)
>  	dev_dbg(dev, "Waiting for all pending threads to complete\n");
>  	wake_up_all(&mhi_cntrl->state_event);
>  
> -	dev_dbg(dev, "Reset all active channels and remove MHI devices\n");
> -	device_for_each_child(&mhi_cntrl->mhi_dev->dev, NULL, mhi_destroy_device);
> +	/**

Use the preferred style for multi line comments:

	/*
	 *...
	 */

> +	 * Some MHI controller drivers, ath11k as an example, would like to keep
> +	 * MHI deivces for channels during suspend/hibernation to avoid the
> +	 * probe defer issue. Add a check here to make it possible.

How about:

	Only destroy the 'struct device' for channels if indicated by the
	'destroy_device' flag. Because, during system suspend or hibernation
	state, there is no need to destroy the 'struct device' as the endpoint
	device would still be physically attached to the machine.

- Mani

> +	 */
> +	if (destroy_device) {
> +		dev_dbg(dev, "Reset all active channels and remove MHI devices\n");
> +		device_for_each_child(&mhi_cntrl->mhi_dev->dev, NULL, mhi_destroy_device);
> +	}
>  
>  	mutex_lock(&mhi_cntrl->pm_mutex);
>  
> @@ -821,7 +829,10 @@ void mhi_pm_st_worker(struct work_struct *work)
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
> @@ -1175,7 +1186,8 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
>  }
>  EXPORT_SYMBOL_GPL(mhi_async_power_up);
>  
> -void mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful)
> +static void __mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful,
> +			     bool destroy_device)
>  {
>  	enum mhi_pm_state cur_state, transition_state;
>  	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> @@ -1211,15 +1223,32 @@ void mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful)
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
> +
> +void mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful)
> +{
> +	__mhi_power_down(mhi_cntrl, graceful, true);
> +}
>  EXPORT_SYMBOL_GPL(mhi_power_down);
>  
> +void mhi_power_down_keep_dev(struct mhi_controller *mhi_cntrl,
> +			       bool graceful)
> +{
> +	__mhi_power_down(mhi_cntrl, graceful, false);
> +}
> +EXPORT_SYMBOL_GPL(mhi_power_down_keep_dev);
> +
>  int mhi_sync_power_up(struct mhi_controller *mhi_cntrl)
>  {
>  	int ret = mhi_async_power_up(mhi_cntrl);
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index 77b8c0a26674..5ce1fc1167d0 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -630,12 +630,28 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl);
>  int mhi_sync_power_up(struct mhi_controller *mhi_cntrl);
>  
>  /**
> - * mhi_power_down - Start MHI power down sequence
> + * mhi_power_down - Power down the MHI device and also destroy the
> + *		    'struct device' for the channels associated with it.
> + *		    See also mhi_power_down_keep_dev() which is a variant
> + *		    of this API that keeps the 'struct device' for channels
> + *		    (useful during suspend/hibernation).
>   * @mhi_cntrl: MHI controller
>   * @graceful: Link is still accessible, so do a graceful shutdown process
>   */
>  void mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful);
>  
> +/**
> + * mhi_power_down_keep_dev - Power down the MHI device but keep the 'struct
> + *			     device' for the channels associated with it.
> + *			     This is a variant of 'mhi_power_down()' and
> + *			     useful in scenarios such as suspend/hibernation
> + *			     where destroying of the 'struct device' is not
> + *			     needed.
> + * @mhi_cntrl: MHI controller
> + * @graceful: Link is still accessible, so do a graceful shutdown process
> + */
> +void mhi_power_down_keep_dev(struct mhi_controller *mhi_cntrl, bool graceful);
> +
>  /**
>   * mhi_unprepare_after_power_down - Free any allocated memory after power down
>   * @mhi_cntrl: MHI controller
> -- 
> 2.25.1
> 

-- 
மணிவண்ணன் சதாசிவம்
