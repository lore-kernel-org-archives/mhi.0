Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6304C207DE6
	for <mhi@lists.linux.dev>; Tue, 18 Mar 2025 10:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742294260; cv=none; b=fV+gpIPTB2fTXHLKIL1019Sgr1pZct/MITM7HsJ9OfcOQq6rXUo9I5kibuji5/SC0xRiyeDzL4erC5/htP09CuFdnlrTcC2AV+Yt03bxZRigfE439s6MbR8tf+QMaqMBeHXr42tmRBbTWK51F7tYBg8+58jYAMPazSb53/80vgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742294260; c=relaxed/simple;
	bh=OIwqaSUyDLr1pGjfoJLDWzA4eujmiLowScIT7EzB5CY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CjHbKNcDiyGx+TGMdvUFuhoWKzQG5xDi2fOc/rTc+sP+jZPsex8bG5eGH5LFnwhgOapIiDGj02+6O0YCoIGDXR5T+/IDoSIOKWXFMPvzvrz5sjQKM6A4WQKhSylZJpt633jn36PPiJj8ytjp5Qk8Wm6yoM6rz/lamCq1RmC58P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K3J4IVRk; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K3J4IVRk"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-22349bb8605so116051545ad.0
        for <mhi@lists.linux.dev>; Tue, 18 Mar 2025 03:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742294257; x=1742899057; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QfGzvG173s2JG+1ZE7f0d1grE/Sw6nJFtm4+MKiVNSo=;
        b=K3J4IVRkLrU65N4xT19dIIda4twiQC6MMaqvxbuc8XMi3/G6hFWdxmjzenH8Wb84m/
         +sv2HUA8YPHlASshKLvpDC/UZoa1ZN68wcx2rg4o6on+/A6kPy0P7WMregpq0ehpWmbO
         yW5xpJxBSqLnVMUuCo6kOyodPetGksaJcodvxaik9GrnfYIPJWN3mND038065n1xqnUZ
         HFktuLFH/rUieQymx0p4MuCg7GpDkSilb/FDPWykLng9y8qYsZJ4fMwkm2Qesfbbcd8E
         RRUAp1UBQp9wn4KZRPx1FgsgYC8K46oTXMolLISVZEap/bC0Wc+fOjQZNPbTB4WGiIjt
         TKEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742294257; x=1742899057;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QfGzvG173s2JG+1ZE7f0d1grE/Sw6nJFtm4+MKiVNSo=;
        b=BEykZ6RRofZ6TQ9sX0vaGG1hFNxnMLmfkr9H5AdBmKome5HgVYqgA0/eZtaIhpZl6O
         WFkRYAVxy90LStMwhGKshLjXYmu6XdM0XFEYu8kReKlZmYihlCGfxjcl7CbW9KMoggY0
         bCixBt+Tyqna+d+Bx4shYz72SG9nmeuYm7ljO+POdLKRrxTGj3XzMknc+Tr6P+YHB74n
         +gKj29GLKM7XJlmkl+q6dtm4jPBpF+5ibCvyOOV9x4qQNoiouQ5/dlVCid6sBlS+lifn
         9w+r2LrfEWjppYbF3Wr7Unj0bxs7MIc0eZMxaSyK5TY8T1qdWmM+7Smy3ZKi1AOQxgMv
         HrfA==
X-Forwarded-Encrypted: i=1; AJvYcCW/7l5XQVh32SvDXjWYvaZ0cnqKqXFo6MtG4rSOgRxiSt3ybluX92cWJKlQO6Q2jfNGuqk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzSP2Q7r/ICrFXQs15u2Aavqanc+0ogxSW2JrsuoKQHzEtMQL2x
	H6dnYWpAYSYHb/fILqH/a97ZxW6vdpfItGMz3uAwRD3etEOAft7ZCeGRSTgsPw==
X-Gm-Gg: ASbGncu80Runer7SGCWbqAqV/SUxuYY0lzOrLreQTqFoy6S7PaudF6yV2KWQwe+spEn
	qgE3A9TK5LruLxHOa4BMQYH87wKS4cIP0D2Q2l1Yf/XU5gCgZV6tUFWaZng5RIXwQ6nuTSLmmtq
	fyqqM0sSNMx+oWe9YbQqtrqhFasc9YKae6G6CPOswhTP0e3U/Izul3kuL30KnwM3tZL64AF2rJu
	H/LvmJgHhf+NeqWw7a4OcUNzerj1Tk/Jc17/u2v9iDcdCCJCFM9oRQI2M2GYvX6Xw71YjPIh/I9
	s6VBqCjO5tqk2iPT6VX2Q0EgMak5N1pSR+TzEsq8k71Bdx6ME8jwBw47
X-Google-Smtp-Source: AGHT+IHgOk9NfxTZL90KwqvSB+P0zUVkeYvXxUz9lNWO2UX0U80pQQ0rDKVAKDBxDkeAH+rn35QsTA==
X-Received: by 2002:a17:902:e745:b0:224:160d:3f5b with SMTP id d9443c01a7336-225e0b2a55dmr200860825ad.49.1742294257634;
        Tue, 18 Mar 2025 03:37:37 -0700 (PDT)
Received: from thinkpad ([120.56.195.170])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68a7f87sm91406475ad.81.2025.03.18.03.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 03:37:37 -0700 (PDT)
Date: Tue, 18 Mar 2025 16:07:28 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: quic_carlv@quicinc.com, quic_thanson@quicinc.com, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH] bus: mhi: host: Address conflict between power_up and
 syserr
Message-ID: <20250318103728.enrcf6mwuxznhgbq@thinkpad>
References: <20250306173226.857335-1-jeff.hugo@oss.qualcomm.com>
 <20250314054651.iu6t3q3o5za2zrjs@thinkpad>
 <6df3f39d-d736-4142-8123-b9afbe8a9848@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6df3f39d-d736-4142-8123-b9afbe8a9848@oss.qualcomm.com>

On Fri, Mar 14, 2025 at 11:47:43AM -0600, Jeff Hugo wrote:
> On 3/13/2025 11:46 PM, Manivannan Sadhasivam wrote:
> > On Thu, Mar 06, 2025 at 10:32:26AM -0700, Jeff Hugo wrote:
> > > From: Jeffrey Hugo <quic_jhugo@quicinc.com>
> > > 
> > > mhi_async_power_up() enables IRQs, at which point we can receive a syserr
> > > notification from the device.  The syserr notification queues a work item
> > > that cannot execute until the pm_mutex is released.
> > > 
> > > If we receive a syserr notification at the right time during
> > > mhi_async_power_up(), we will fail to initialize the device.
> > > 
> > > The syserr work item will be pending.  If mhi_async_power_up() detects the
> > > syserr, it will handle it.  If the device is in PBL, then the PBL state
> > > transition event will be queued, resulting in a work item after the
> > > pending syserr work item.  Once mhi_async_power_up() releases the pm_mutex
> > > the syserr work item can run.  It will blindly attempt to reset the MHI
> > > state machine, which is the recovery action for syserr.  PBL/SBL are not
> > > interrupt driven and will ignore the MHI Reset unless syserr is actively
> > > advertised.  This will cause the syserr work item to timeout waiting for
> > > Reset to be cleared, and will leave the host state in syserr processing.
> > > The PBL transition work item will then run, and immediately fail because
> > > syserr processing is not a valid state for PBL transition.
> > > 
> > > This leaves the device uninitialized.
> > > 
> > > This issue has a fairly unique signature in the kernel log:
> > > 
> > > [  909.803598] mhi mhi3: Requested to power ON
> > > [  909.803775] Qualcomm Cloud AI 100 0000:36:00.0: Fatal error received from device.  Attempting to recover
> > > [  909.803945] mhi mhi3: Power on setup success
> > > [  911.808444] mhi mhi3: Device failed to exit MHI Reset state
> > > [  911.808448] mhi mhi3: Device MHI is not in valid state
> > > 
> > > We cannot remove the syserr handling from mhi_async_power_up() because the
> > > device may be in the syserr state, but we missed the notification as the
> > > irq was fired before irqs were enabled.  We also can't queue the syserr
> > > work item from mhi_async_power_up() if syserr is detected because that may
> > > result in a duplicate work item, and cause the same issue since the
> > > duplicate item will blindly issue MHI Reset even if syserr is no longer
> > > active.
> > > 
> > > Instead, add a check in the syserr work item to make sure that the device
> > > is in the syserr state if the device is in the PBL or SBL EEs.
> > > 
> > 
> > Don't we need a Fixes tag?
> 
> I don't recall seeing documentation saying that Fixes tags are mandatory.

It is the standard practice to add the Fixes tag if the bug was introduced by a
specific commit. But...

> Yes, I agree, they are helpful and should exist.
> 
> I am finding it difficult to point to a single commit that I can say
> introduced this issue. I believe we started seeing it with "bus: mhi: host:
> Add MHI_PM_SYS_ERR_FAIL state", but I don't think that commit actually
> introduced this issue. It seems like a coincidence that the issue was first
> observed with that commit.  I suspect that this issue has been a problem
> since the introduction of MHI, but I am not confident since the relevant
> code paths have radically changed since then.
> 
> Given I don't feel confident in identifying a commit, I felt it was perhaps
> better to not list one at all.
> 
> Do you have any suggestions?
> 

Fine with me. In that case, it would have been helpful if mentioned in the
changelog area.

> > 
> > > Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> > > Signed-off-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
> > > ---
> > >   drivers/bus/mhi/host/pm.c | 18 +++++++++++++++++-
> > >   1 file changed, 17 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
> > > index 11c0e751f223..3dff0f932726 100644
> > > --- a/drivers/bus/mhi/host/pm.c
> > > +++ b/drivers/bus/mhi/host/pm.c
> > > @@ -602,6 +602,7 @@ static void mhi_pm_sys_error_transition(struct mhi_controller *mhi_cntrl)
> > >   	struct mhi_cmd *mhi_cmd;
> > >   	struct mhi_event_ctxt *er_ctxt;
> > >   	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> > > +	bool reset_device = false;
> > >   	int ret, i;
> > >   	dev_dbg(dev, "Transitioning from PM state: %s to: %s\n",
> > > @@ -630,8 +631,23 @@ static void mhi_pm_sys_error_transition(struct mhi_controller *mhi_cntrl)
> > >   	/* Wake up threads waiting for state transition */
> > >   	wake_up_all(&mhi_cntrl->state_event);
> > > -	/* Trigger MHI RESET so that the device will not access host memory */
> > > +	/*
> > > +	 * Trigger MHI RESET so that the device will not access host memory.
> > 
> > Move this comment before 'if (reset_device)'.
> 
> I'll move it, but seems a bit weird to have the explanation for the logic of
> the conditionals (particularly the ones added by this patch) after them in
> the code.
> 

I thought that the comment is better placed where we really reset the device.

> > > +	 * If the device is in PBL or SBL, it will only respond to RESET if
> > > +	 * the device is in SYSERR state.  SYSERR might already be cleared
> > > +	 * at this point.
> > > +	 */
> > >   	if (MHI_REG_ACCESS_VALID(prev_state)) {
> > > +		enum mhi_state cur_statemachine_state = mhi_get_mhi_state(mhi_cntrl);
> > 
> > s/cur_statemachine_state/cur_state
> 
> We already have a cur_state in the function, that is generally used for Host
> state and here we are reading the Device state. I felt that avoiding mixing
> the meanings was perhaps in the interest of the reader, but reusing
> cur_state appears possible.
> 

It should be fine IMO.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
