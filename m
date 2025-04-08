Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBD02620EE
	for <mhi@lists.linux.dev>; Tue,  8 Apr 2025 07:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744096697; cv=none; b=W7THWXPqcBmrC8zDhBPwByS7b/9N96D1xNhI2e+a91c0879H32d0OsWBKqrH58oDzP19VICXSXZwDsD9wktVm1T2FTEyKJkyhBVteFisJS90HZFP6wlfpw2y5lzVdXNii+MNnl1CLgE1wNr1y36+ZWHNf0FKg6RvwFiHInuSW9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744096697; c=relaxed/simple;
	bh=BRJa+qv6MRYdc/kS58SsyBfswQe50NMwglmxCspaMpg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nhk4jlM0paTbE3L5fYQh1l++lQm9kyPgeXrDAbSTYZ9oovB/JHNfGFj5iFwlYyHvRoYdpSamz/Yl2i1m2iN/UMBl06Y/HlmgCA11Kv4s6BP1L8CUZomGPFUPPZdv2KAinoA+bZvXYo6cFISqL6QP3JA2VsW0N9vwIzYJ93Fthb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bw8RnDxX; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bw8RnDxX"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-736b0c68092so4170909b3a.0
        for <mhi@lists.linux.dev>; Tue, 08 Apr 2025 00:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744096694; x=1744701494; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cfzRgbvpB9GZBRrqmfD2qZDc6BUDtcQ9WjX5oJwQHrM=;
        b=bw8RnDxXKkd/7wuoe8BMBvQPL53iJya0TLsluFG1U/qqVFetVtj0SKtfbCuPxvOGTi
         NHmslMlcAjQf2av7rkJ6U8WzW/U1qPd80pmD2VBQjIaowKfxPfkBHQ4LdiKAGg7WEisL
         Y8L0pMlc9EPJkc9KqrGrTrZ/jqKKXhKfV1gSO4BUZAYlkoheP5RHnigvWtQCXRFq4Sjj
         hJaPm5vi5ROwMKfJVmtK7H7VWKFX7bUEIFnB7Hfqsy9x9DjDpwIrD1fshOh2ccmod6Hc
         UBNCc4duY0yE3E1ca14cDrXvBzH1AK/4GgmoO8zyigsYI8VlB80V4xBtqgsY6rrvYmn8
         uuDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744096694; x=1744701494;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cfzRgbvpB9GZBRrqmfD2qZDc6BUDtcQ9WjX5oJwQHrM=;
        b=Fsbu/GurCIOz+we26rzdQtxYV6TxmgpgeEtn5PSy1UWyblOr6YH0Y1gWPeIRgJfBdd
         sdberi3azkoxvE/mjymNwipPqpQdYJy02AYfYRP+6upSUESuL1F2lo3ResjZYJrj4Z54
         /kL5b6RuPp2qEKP3XMlsw/IEFtfHQXK8SXI39r8sosmD/I1bBnbWXiKmsoB3EoCFjqmg
         QHfEYF/E4MILRTUfbEdXZXk40WyPZXvLHsY8uDh3Mll2ApxBUvjxllnAuI9Y/RpvZ6wo
         U+8nayomLXVdm7GwGWmmGPXh5FK+Xrrg0yQvysFvMOrgLNmmPbs0HYtEr0Cr84/716P5
         Ikog==
X-Forwarded-Encrypted: i=1; AJvYcCXfoMcq5XW8NutiUQJAJ61yDd0tEzjrXeUomvIjBVO4RglWC44ZgzB1WQnlORIGUs7AHwQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwiIVuGbig+uLD+ErmCfWq91+5esxB9Ia++xxibXNQv3H/KCb59
	h1eCeAqjl8b3wV/I9GWb8TF7i8gwKp7RXYRDbbPf+Mfz5MTS5/pA4V+mh1DnVA==
X-Gm-Gg: ASbGncuPMBHeSzPUBJiOH7CdbbjrjRSVkDFPpBdJeobw50c/qmj6J64hXedl0kVgS7s
	pYjltyW+mvqQVI4D07/0j0MzwhK4DxjDk2IVhubX/su7N1phemUtAtgvjgHdBzk0zWRmX6bf0g+
	/vDaBcle9Udnl6KbnRFZMoOXA1M8cqTz2+DI1LJ0ixPHMRuDPFHzOdBKtAynYjQ7vXKFZqx9vXi
	HxsvPjCTwqFk35k8r90TDSXnceRSaLOGH61LxFJU1AIdgBoUIrgVfwup3KuyfyMWNJPxBDiSPcZ
	Z5CoS76HRkqVRACPMV+J2XzLwcptxOdxY3ZtUF1IEjMxB2Xae1DgyqQS
X-Google-Smtp-Source: AGHT+IFGoqetvCOCUNUSwniybITU1y3S0+JlCGI2IOkKE3aV2mWcNI4g9sqOAljCKTYVHnDHO4m9vA==
X-Received: by 2002:a05:6a20:430a:b0:1ee:e2ac:5159 with SMTP id adf61e73a8af0-20104627e6fmr24466342637.19.1744096694397;
        Tue, 08 Apr 2025 00:18:14 -0700 (PDT)
Received: from thinkpad ([120.60.134.231])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc34eefesm8366604a12.36.2025.04.08.00.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:18:13 -0700 (PDT)
Date: Tue, 8 Apr 2025 12:48:09 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: quic_carlv@quicinc.com, quic_thanson@quicinc.com, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH v3] bus: mhi: host: Address conflict between power_up and
 syserr
Message-ID: <hqy6ykaqg7swaqxiu7hrtwb5calmni4zmdtnd5nlmt2xxuhpsn@3e3t7z6qzmbh>
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

Applied to mhi-next!

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
