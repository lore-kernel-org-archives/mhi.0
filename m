Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC10200BB4
	for <mhi@lists.linux.dev>; Mon, 16 Dec 2024 14:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734358391; cv=none; b=O9PVwmegXmgZKTXRSpNzly08SXP0H9uUfrRNgRJwtkndGwQrAQcIgZTUtTjeNvps+CoKM3KH/heXtxfgnFF6qtZ/TQQkNLDz+fI0iDRmxSxgsrHlELt5gG5HxptaUrEwQD53bzTDqRY9nSiQP0yhjEl446U5rufzRvmH/k0OQoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734358391; c=relaxed/simple;
	bh=YXb2OO26JuzzRT5gugYbGq1eBtgz8qYkjN+bl/xvvu8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TKJZGEpWwql8/vLf1Zjrtjs+V0mDxBRumIl71sx09qKYCj4GEcbhQN0AxlJE8AR2ojkabpMpNz7dEtTUqYkZE3XsdLwQWVqI5BRluA01IjbWJzVbJ3r6Pv7eyijzWvXq+LPPLSp1DXTWbGMjxurQK+0xzK5E1Fcpyf9+DEv/ITU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oLDF1Wx8; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oLDF1Wx8"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-21661be2c2dso30015175ad.1
        for <mhi@lists.linux.dev>; Mon, 16 Dec 2024 06:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734358388; x=1734963188; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4lqEeDutj/XDSerpsZ8M++ye4tVb7VkggEGa71i6G0U=;
        b=oLDF1Wx8HTx1SAgPbBTfxMiSeub4ku0R4SCPJa64ZUldHy+fphdQ7oPSgBZ/ViyzSI
         etYiq9ivtlipRtcRHCm6rQyjWYKYgUZAvH3HUTYvsn9MgU7lwFNyzQWuHCQNq3A/dpxi
         9UKY999L9Horu7aUQuPkLxLRSGjZO1WCZwDT6ryfmYDLHredHTK4AqgOQSJQ1Zmn3RYh
         xXped2sm1b/tTvRE/5WDwdsGfeLbs3zZgFU7LmcNiV6UHTFXLwZdDqwt+61jm54mODB9
         WNLmEXagc4cReQcgI5OEaKePlgaT1cz0OS/Kx0schfajSStSk4EMBEml86zuvTN+3BhC
         1XdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734358388; x=1734963188;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4lqEeDutj/XDSerpsZ8M++ye4tVb7VkggEGa71i6G0U=;
        b=dEq2dlLYfn7LtyUY142O+exXUchB9Wk0rpwCW592sQ8JlIC3ef2Uyq5dl7tEP3vkFo
         kPA+PHYW21vnU62L96itzYvOO6Z32j/Q7wj84PC/x35KagEEn1FiP7C4ViR3bmJ8xA68
         k0YPe2R2+CiF9ssmuncXsX+lt6TUo5PD3pKG/Zal8qmBjmWnoZRF/weLyclY9yfovMGW
         CkV2FZt2h6xYBf6XWuWj/vE+Wnnu2Mfj3eAkANsIyrak+FgQ3eYpCmEEDd/UZSNutx3M
         VGvF3jhaxo6NdsxVi2pPIAYtZgu/Nhp7Lcb14RDcAC5V1SYnN8NdodxDt6cphNJd509H
         4Ydw==
X-Gm-Message-State: AOJu0YzYGOjJ3GehmsxeVKV/klvOsSxcbt++q23dZi05M20nlasHEpTf
	jXnc86qFb/9ANfPRmgLTaEfPGIqFSCS1DhCJ0Xrt+uO0ZkktBDcSSB+2A1SXBA==
X-Gm-Gg: ASbGnctxtmMt6H+Vpn1tF6DgjrPZv2hhHRRP8b5LGhCba5v2b8RMs5WVuUK34/ylAtf
	pI8KV6Uz+JZf9mySQ3ZxK70M04RGU1NZ8LlZNE0EpVout2xCB2YkEUhpKkC0ih3qCFNdxqdEK7Q
	IuU1P03/ZZ8t9vvpLSpZiTl7tZKIxDSBSO8eqgaDHZhM8fM5zE4ypTK0s+MO304zBSfGUdOcP4j
	ebCOh/KhcuuxJacX/plihEYqcGO24xsYvHRyL2xzK08Je57XzllTPDlB9XUM4y+BZ8W
X-Google-Smtp-Source: AGHT+IFbwXMmkjRCJjhB390rc2YrPcY2ddmkYzVMrHtWWR7ffsZEsQAAigu4VplGhhTpeUsoGW86wg==
X-Received: by 2002:a17:902:db09:b0:215:83e1:99ff with SMTP id d9443c01a7336-218929c7077mr158661225ad.27.1734358387786;
        Mon, 16 Dec 2024 06:13:07 -0800 (PST)
Received: from thinkpad ([120.56.200.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1db63cesm43415695ad.33.2024.12.16.06.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 06:13:07 -0800 (PST)
Date: Mon, 16 Dec 2024 19:43:03 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Loic Poulain <loic.poulain@linaro.org>
Subject: Re: mhi resume failure on reboot with 6.13-rc2
Message-ID: <20241216141303.2zr5klbgua55agkx@thinkpad>
References: <Z1me8iaK7cwgjL92@hovoldconsulting.com>
 <20241211145315.vaf7gbapieywcvau@thinkpad>
 <Z1mp3_ArzL-GLr3D@hovoldconsulting.com>
 <20241216074021.kwoid2747o7piquv@thinkpad>
 <Z2ApCU3DAxKS7Y9k@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z2ApCU3DAxKS7Y9k@hovoldconsulting.com>

On Mon, Dec 16, 2024 at 02:20:09PM +0100, Johan Hovold wrote:
> On Mon, Dec 16, 2024 at 01:10:21PM +0530, Manivannan Sadhasivam wrote:
> > On Wed, Dec 11, 2024 at 04:03:59PM +0100, Johan Hovold wrote:
> > > On Wed, Dec 11, 2024 at 08:23:15PM +0530, Manivannan Sadhasivam wrote:
> > > > On Wed, Dec 11, 2024 at 03:17:22PM +0100, Johan Hovold wrote:
> > > 
> > > > > I just hit the following modem related error on reboot of the x1e80100
> > > > > CRD for the second time with 6.13-rc2:
> > > > > 
> > > > > 	[  138.348724] shutdown[1]: Rebooting.
> > > > >         [  138.545683] arm-smmu 3da0000.iommu: disabling translation
> > > > >         [  138.582505] mhi mhi0: Resuming from non M3 state (SYS ERROR)
> > > > >         [  138.588516] mhi-pci-generic 0005:01:00.0: failed to resume device: -22
> > > > >         [  138.595375] mhi-pci-generic 0005:01:00.0: device recovery started
> > > > >         [  138.603841] wwan wwan0: port wwan0qcdm0 disconnected
> > > > >         [  138.609508] wwan wwan0: port wwan0mbim0 disconnected
> > > > >         [  138.615137] wwan wwan0: port wwan0qmi0 disconnected
> > > > >         [  138.702604] mhi mhi0: Requested to power ON
> > > > >         [  139.027494] mhi mhi0: Power on setup success
> > > > >         [  139.027640] mhi mhi0: Wait for device to enter SBL or Mission mode
> > > > > 
> > > > > and then the machine hangs.
> 
> > Could be. But the issue seems to be stemming from the modem crash while exiting
> > M3. You can try removing the modem autosuspend by skipping the if condition
> > block:
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/bus/mhi/host/pci_generic.c?h=v6.13-rc1#n1184
> > 
> > If you no longer see the crash, then the issue might be with modem not coping
> > up with autosuspend. If you still see the crash, then something else going wrong
> > during reboot/power off.
> 
> I've only hit this issue three times and only since 6.13-rc2. So not
> sure how useful that sort of experiment would be.
> 

I do not have access to the device. So if you cannot spend time on debugging the
reason for crash, then I'll have to rely on Qcom to do it (which I've asked
anyway).

> > > Is there anything you can do on the mhi side to prevent it from blocking
> > > reboot/power off?
> > 
> > It should not block the reboot/power off forever. There is a timeout waiting for
> > SBL/Mission mode and the max time is 24s (depending on the modem). Can you share
> > the modem VID:PID?
> 
> I just hit the issue again and can confirm that it does block
> reboot/shutdown forever (I've been waiting for 20 minutes now).
> 

Ah, that's bad.

> Judging from a quick look at the code, "Wait for device to enter SBL or
> Mission mode" is printed by mhi_fw_load_handler(), which in turn is only
> called from the mhi_pm_st_worker() state machine.
> 
> I can't seem to find anything that makes sure that the next state is
> ever reached, so regardless of the cause of the modem fw crash

This code will make sure:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/bus/mhi/host/pm.c?h=v6.13-rc1#n1264

But then it doesn't print the error and returns -ETIMEDOUT to the caller after
powering down MHI. The caller (mhi_pci_recovery_work), in the case of failure,
unprepares MHI and starts function level recovery.

> (if
> that's what it is) the hung reboot appears to be a bug in mhi.
> 

I'm not sure where exactly it got stuck. I've asked Qcom folks to reproduce this
issue. We will investigate and hopefully get back with a fix asap.

> This is with the SDX65 modem in the x1e80100 CRD:
> 	
> 	17cb:0308

Okay thanks!

- Mani

-- 
மணிவண்ணன் சதாசிவம்
