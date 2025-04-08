Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D3F25FA12
	for <mhi@lists.linux.dev>; Tue,  8 Apr 2025 07:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744095783; cv=none; b=SwIHv271+gKOWM84LLVZoTdi46ol+GgdoBQ1nnYXrjFSPGXy0sI/9CGDOqzakUoPugYDL9jzgB97wWDoQ/nQ36OHgfOqKb9pkPfDbT30b7giD91UCM/votkUonNcc3kfqzk1lUKkPXZDxrp7uTNwF+rAYYklRDf6FNWawEU09vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744095783; c=relaxed/simple;
	bh=GvadZfMXMpsJnMBm6ZbGyy8iFPHgJ5t996/Hht726+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tSKiE/0DDHYIIlKY+dHM1gC2bi6ljsjhOMg0ixOkV7YbNUmHFrQy7bSrAr3plY1E8O6zhB2N0LKPl+5d7ePabjYBrFgzwNuSfuOHUrcH8LO27SBxKqQdzPaCpf3hz2lEHAo7BrRX5NNm0e59UiLuev5bhvihUfOlZVIOdCgyEO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Fzn82d2a; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fzn82d2a"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-73712952e1cso4631939b3a.1
        for <mhi@lists.linux.dev>; Tue, 08 Apr 2025 00:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744095780; x=1744700580; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U7loFTiO6E+EyqiwigrWat5HcbdO0GHdIhW3O4BohHk=;
        b=Fzn82d2a2W83Lq8+IFd3TRPuDgkeZGpaL6K0kN+4fngx+JttY9S/uKkoqgzKMClmaE
         Z2Hzmc4oYt9eT0XDg2qk5F9TCVg72nFrbtr4EI7IShcdX2vEDqkcTOolB8AQMVHrV3kL
         1LdV0xWbhJVMa5Z+yh9V5kf4o0Wdkg7UPeYrBZp993W9oOaM6mpolc6ZigCWr4ZV1sjM
         Fi+uJjPByNySz7WLblZrQRcW7LPSBpqc/4FN5D/1QP5Pac2uR/ryDc1wpX04FBWtq+gm
         NohnUhA0fOlq1P4WiI0PTgutvfC850JOjhtcevkUYQoY99dDEzAQRYH5nFLnHH88/lia
         +C4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744095780; x=1744700580;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U7loFTiO6E+EyqiwigrWat5HcbdO0GHdIhW3O4BohHk=;
        b=RBGjtx2tVYzYuUblMwGY+F0nBAJrYAei6LWVahb5Kea3AIRZrL43Mc6AvRMG8SRNDC
         LuDYsICjlhQvfxNfUpt3ddrpKXxm5McibE0BdOV68Qh91M63EOqFeA3e9YN9FKs1j4vI
         rGjpidgn7cBtA3kOKENfPuAwIp/czScpOfBN2vssONzJmvp+Oq3Q1y6AtFTUy0D3pw96
         BcOXQTtrf7rtYetwFaNiH92+AELgtUZIbrlmKaWyCoMRotixwwwmHOd+Jt16kT6Vhaqb
         3+/C+2uhxlHbE0+nIIXKwaSyMFsI4waolEAh5yu8vP+XAmqPlf5gLcVCWEtSg1IirSCR
         XR1A==
X-Forwarded-Encrypted: i=1; AJvYcCV1Iq4JykpLosFg1U/awCIwnYHYfQUVZkJTJV4ncvoJEIRRfEnrziAVEnMhhLrMIn7t908=@lists.linux.dev
X-Gm-Message-State: AOJu0YzLSTDtB4sLgFVjXUtcH6Y+X/JTe6VCfZUviYOX+mtJlmD9dK/J
	rLeJp95rAdtb2sxYJpBZnsKUSPhqcOn4VI5B06H4tjZ4BI5UIeqczhimm5aY4g==
X-Gm-Gg: ASbGncv/+0YDNjNj2SRV4PBWN5i6nevgjpkU5P0xk3zp90zhqwqyDVjph3Awyw/q/1F
	6cnHcHbY9L5bLJqtUHFSG5lTRP/sudpwqdzL58EeY6GdIDehScgkeKCKLjeWej9Q/5t8yaIngxF
	ky9Xa1HZPTDAumbne2E4y6FQgFXSL18t7qR/DPFN9rPGLsWsQwb1HbCwIpLbu9juU7v1xkc56GS
	AyfJxbgJ7mYI7M+s7FyLphwvz5GJJ1RRJW74dF1qzlOF+oQ7C4eXL5283A6qrNrYtRpSYrfuBqQ
	SOzn0J01+0yXWAhLntHsIl/nnHe8jl+axRKVD1fibngCF7TQSECk85Ht
X-Google-Smtp-Source: AGHT+IEeAQClEkhjfgQVtiJavpu0HRxfn9e91mnCoOu0Ml5tesLz/WVCrHI6MywYI5eXpL14taEBYA==
X-Received: by 2002:a05:6a21:9013:b0:1f5:6c94:2ccb with SMTP id adf61e73a8af0-20104601d33mr24057798637.22.1744095779699;
        Tue, 08 Apr 2025 00:02:59 -0700 (PDT)
Received: from thinkpad ([120.60.134.231])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d9ea09c8sm10032926b3a.101.2025.04.08.00.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:02:59 -0700 (PDT)
Date: Tue, 8 Apr 2025 12:32:56 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: quic_carlv@quicinc.com, quic_thanson@quicinc.com, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH v3] bus: mhi: host: Address conflict between power_up and
 syserr
Message-ID: <wki7wqwrnccdnkcor2yk47ju72q6vxhlsy63oiutfeztv6zwxl@rpr3sgrkkg4c>
References: <20250328163526.3365497-1-jeff.hugo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250328163526.3365497-1-jeff.hugo@oss.qualcomm.com>

On Fri, Mar 28, 2025 at 10:35:26AM -0600, Jeff Hugo wrote:
> From: Jeffrey Hugo <quic_jhugo@quicinc.com>
> 
> mhi_async_power_up() enables IRQs, at which point we can receive a syserr
> notification from the device.  The syserr notification queues a work item
> that cannot execute until the pm_mutex is released.
> 
> If we receive a syserr notification at the right time during
> mhi_async_power_up(), we will fail to initialize the device.
> 
> The syserr work item will be pending.  If mhi_async_power_up() detects the
> syserr, it will handle it.  If the device is in PBL, then the PBL state
> transition event will be queued, resulting in a work item after the
> pending syserr work item.  Once mhi_async_power_up() releases the pm_mutex
> the syserr work item can run.  It will blindly attempt to reset the MHI
> state machine, which is the recovery action for syserr.  PBL/SBL are not
> interrupt driven and will ignore the MHI Reset unless syserr is actively
> advertised.  This will cause the syserr work item to timeout waiting for
> Reset to be cleared, and will leave the host state in syserr processing.
> The PBL transition work item will then run, and immediately fail because
> syserr processing is not a valid state for PBL transition.
> 
> This leaves the device uninitialized.
> 
> This issue has a fairly unique signature in the kernel log:
> 
> [  909.803598] mhi mhi3: Requested to power ON
> [  909.803775] Qualcomm Cloud AI 100 0000:36:00.0: Fatal error received from device.  Attempting to recover
> [  909.803945] mhi mhi3: Power on setup success
> [  911.808444] mhi mhi3: Device failed to exit MHI Reset state
> [  911.808448] mhi mhi3: Device MHI is not in valid state
> 
> We cannot remove the syserr handling from mhi_async_power_up() because the
> device may be in the syserr state, but we missed the notification as the
> irq was fired before irqs were enabled.  We also can't queue the syserr
> work item from mhi_async_power_up() if syserr is detected because that may
> result in a duplicate work item, and cause the same issue since the
> duplicate item will blindly issue MHI Reset even if syserr is no longer
> active.
> 
> Instead, add a check in the syserr work item to make sure that the device
> is in the syserr state if the device is in the PBL or SBL EEs.
> 
> It is unknown when this issue was introduced. It was first observed with
> commit bce3f770684c ("bus: mhi: host: Add MHI_PM_SYS_ERR_FAIL state") but
> that commit does not appear to introduce the issue per code inspection.
> This issue is suspected to trace back to the introduction of MHI, but the
> relevant code paths have drastically changed since then. Therefore, do
> not identify a specific commit in a Fixes tag as confidence is low that
> such a commit would be correctly identified.
> 
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> Reviewed-by: Troy Hanson <quic_thanson@quicinc.com>
> ---
> 
> v3:
> -Fix the moved comment due to misunderstanding the initial feedback
> 
> v2:
> -Move comment to reset_device condition
> -Rename cur_statemachine_state to cur_state
> -Amend commit text to explain the lack of a Fixes:
> 
>  drivers/bus/mhi/host/pm.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
> index 11c0e751f223..e567a356f136 100644
> --- a/drivers/bus/mhi/host/pm.c
> +++ b/drivers/bus/mhi/host/pm.c
> @@ -602,6 +602,7 @@ static void mhi_pm_sys_error_transition(struct mhi_controller *mhi_cntrl)
>  	struct mhi_cmd *mhi_cmd;
>  	struct mhi_event_ctxt *er_ctxt;
>  	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> +	bool reset_device = false;
>  	int ret, i;
>  
>  	dev_dbg(dev, "Transitioning from PM state: %s to: %s\n",
> @@ -630,8 +631,23 @@ static void mhi_pm_sys_error_transition(struct mhi_controller *mhi_cntrl)
>  	/* Wake up threads waiting for state transition */
>  	wake_up_all(&mhi_cntrl->state_event);
>  
> -	/* Trigger MHI RESET so that the device will not access host memory */
>  	if (MHI_REG_ACCESS_VALID(prev_state)) {
> +		/*
> +		 * If the device is in PBL or SBL, it will only respond to
> +		 * RESET if the device is in SYSERR state.  SYSERR might
> +		 * already be cleared at this point.
> +		 */
> +		enum mhi_state cur_state = mhi_get_mhi_state(mhi_cntrl);
> +		enum mhi_ee_type cur_ee = mhi_get_exec_env(mhi_cntrl);
> +
> +		if (cur_state == MHI_STATE_SYS_ERR)
> +			reset_device = true;
> +		else if (cur_ee != MHI_EE_PBL && cur_ee != MHI_EE_SBL)
> +			reset_device = true;
> +	}
> +
> +	/* Trigger MHI RESET so that the device will not access host memory */
> +	if (reset_device) {
>  		u32 in_reset = -1;
>  		unsigned long timeout = msecs_to_jiffies(mhi_cntrl->timeout_ms);
>  
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்
