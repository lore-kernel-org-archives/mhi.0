Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E19F17A586
	for <mhi@lists.linux.dev>; Fri, 14 Mar 2025 05:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741931218; cv=none; b=O4S9vIp9Am99wbPwFl+otXgsKT9gJgi2hl3XVLUnJDAdylg67dfvzkpQnw2r5O9CGtoei1Lq3JujKfA1xBF2S1/PPK5D4nkugU/2yo/JG+/nfjMKKY1i14pPbvbjG01AFJYEu0AOXI46TlimzF6370PdmvngYb96uejvUkiPB/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741931218; c=relaxed/simple;
	bh=ul3R7jtmfTkNR91cB1ZQcsKkdbKIhRpe8N6UWTr2pBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ViAy2wQROPyTvQ5WUX4vlTeXDDqyiFdRPACe4Cr4r8R6nXxBdOLGQsEfbPiJhLjCFeKOkgDKyuSeZfPcZf0vjUvlWGVUduXWcLcuL6U8m73WUHxJ/tw3bDtw0r9IWZe5o5Joiw+wziPx5GXEYCd/e/RMbE0Olt87+Iv+tbwyVr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DWBBcsL1; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DWBBcsL1"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-219f8263ae0so31746875ad.0
        for <mhi@lists.linux.dev>; Thu, 13 Mar 2025 22:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741931216; x=1742536016; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=elfAuMJHoolYmn57P5hXk5/lLKgLrVuStnKmq4AdqUY=;
        b=DWBBcsL1dXgLpt4RNzhL7DfoEza+nXznc+seFHBpAIthq16Mwf+mtNDdaCTlyd3q7A
         N6sWkoH6yWuzdsr1iYb/yiGIbU36jNJ4jNKqiMqoCcf8xTS6D0gkk3Gb43sIR9rvaMU7
         Yq9l7uNmraP7av3WTShoSxXJQ9E6thJAmaihYMkcVCZVkfWvyyWUUWAL/LAaUkz3k3ks
         q7jN7tnezc2GEnD1LxxnQ69hwu7CJQLInxxIYl7gOanCBzvHOyV6SC6j45LljBFikK4e
         cUHE+GFMtbl9dlZ8wLyIRy4rCh45WSmMzc+uDpV+rGKHesV7KdVYKMBaOHevGkJDCwnt
         TRSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741931216; x=1742536016;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=elfAuMJHoolYmn57P5hXk5/lLKgLrVuStnKmq4AdqUY=;
        b=O8wOh0RJBldPYxTxjCDi+gCmEjn+N5Vn0G2hAkX9FxT32plyaPv3IbQNCfP9PE+VXI
         L0ffiqGvKV74UYCq66xcRdi5ikzXx2ZAMR1jyQf0LgUtDN65d6SVUlvLIqZaGGMXFlB5
         B5bXIrqTuWf0QxDiRc2N6A54hsh74TlZZyXgJ1vhG2fKnfLiKY6fUAU9Kdz7nEh9WrSc
         DqeqTH8uP/eHOSFy8mhlMqFnZ/dm7swVoWcRqzNyEsMe5Tt24iSeo8XZw2mHx7dym5k6
         8pyXvl6rHPTisCnK2tcq5qMe4C9UKEAsMf+AZQrALwgpVK98Mu5tjB30hW/Ad3qAVBpC
         4lPw==
X-Forwarded-Encrypted: i=1; AJvYcCUNs3mi7m0vI0RheAvyhtFMmmRkxPPRptD2Rals/JmduCSEsywts/0tvHdeqihu1mgNzU0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyCgAEtnBuZWdOD4IEmEllZqfgTFJ4iUMfFBUGcr8NLVoD7Piro
	XlCD5W7T5tuIpMv9SjblBlfi7fl3T4LZnSSv7HT+PMNIepp3tXt+V+oQliIzM4JQzfmRcfaJ/BE
	=
X-Gm-Gg: ASbGncuBWo8ccOh+Fk88DxYu0vDC8qBqb5PHB3OFQoU8tGmivRSau/adipxffFEcgQ1
	EB02DlIGOlIqYJoJDGVnH0RPnKf/EV5aNaNJd1nrS8kwtx7vhXGR9Uw3OdOjoUGGcVEKdiOyJT5
	6xtRcryJgyGTnIhNB7ED6v3z4/kBbKq++IIVWpyuHZC+d4l87oCn82YnunTByPEZ5pZWsHDibp0
	K1JFneuZomo+PkiN17r99JJl+U0SC3nICCDLvgPJ1ltHkdwBt0FL2hZ0q6p9LjiX+uryXa0YppZ
	zZY9JOcYnVzG3BS7aS8M8if2+/OMKmzWXxFIibzIZ+l2jikNCnZsU2IZFMEC5KCI7fI=
X-Google-Smtp-Source: AGHT+IEDHDcE2nsWay4x5212Q9dwE5Pu/hfncAbR9VQ1eoCkuWaU2M1xG6urqjKX6m2kNZqO1jWOKQ==
X-Received: by 2002:a17:903:3c66:b0:223:325c:89f6 with SMTP id d9443c01a7336-225e0a22b7amr22117525ad.10.1741931216173;
        Thu, 13 Mar 2025 22:46:56 -0700 (PDT)
Received: from thinkpad ([120.56.195.144])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68a874csm22761075ad.98.2025.03.13.22.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 22:46:55 -0700 (PDT)
Date: Fri, 14 Mar 2025 11:16:51 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: quic_carlv@quicinc.com, quic_thanson@quicinc.com, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH] bus: mhi: host: Address conflict between power_up and
 syserr
Message-ID: <20250314054651.iu6t3q3o5za2zrjs@thinkpad>
References: <20250306173226.857335-1-jeff.hugo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250306173226.857335-1-jeff.hugo@oss.qualcomm.com>

On Thu, Mar 06, 2025 at 10:32:26AM -0700, Jeff Hugo wrote:
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

Don't we need a Fixes tag?

> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
> ---
>  drivers/bus/mhi/host/pm.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
> index 11c0e751f223..3dff0f932726 100644
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
> +	/*
> +	 * Trigger MHI RESET so that the device will not access host memory.

Move this comment before 'if (reset_device)'.

> +	 * If the device is in PBL or SBL, it will only respond to RESET if
> +	 * the device is in SYSERR state.  SYSERR might already be cleared
> +	 * at this point.
> +	 */
>  	if (MHI_REG_ACCESS_VALID(prev_state)) {
> +		enum mhi_state cur_statemachine_state = mhi_get_mhi_state(mhi_cntrl);

s/cur_statemachine_state/cur_state

- Mani

-- 
மணிவண்ணன் சதாசிவம்
