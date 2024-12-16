Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B2919066D
	for <mhi@lists.linux.dev>; Mon, 16 Dec 2024 07:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734334838; cv=none; b=rHCFpZ0j3WDwgMr6FiL1mEKOSJnIayngYY0iQkYjsGhpXCsGK2W9C5rljmg+LQ4/XKm+RhovHPKpssJ+WKgUVhSxkS1/KCywxrmbwJ8WrNCt5a9e9bKAI/XJvEIbkgtXo3f6hBqyrCFrOgf49GqQQ+qNP0faLP1qhQnVxne3rv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734334838; c=relaxed/simple;
	bh=sSaYK2tg4AyOEiujF9xShUjCJHhLBfgOPM3fu4GnXkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eknyJN5xSyzmMWltsoNxJuEqZhWAnJobLgSRNoPSsu33ECOxtFPDYZ061CXlXnk7liZj9t+b1k7e4+v80BTD4OoRn4BpK4ZDk7x8fth2SN/Fxrcom04gp8FRQswJKDqBhNIz6BRSrOZDnpsG+OTKkK1/YpfUCrG6SgLwk+QKfoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yDYOvK7U; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yDYOvK7U"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-725ce7b82cbso4336711b3a.0
        for <mhi@lists.linux.dev>; Sun, 15 Dec 2024 23:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734334835; x=1734939635; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8mDgxM0yEOok2sKIVcUGDtQKV48thFUw050xg1Tx7VU=;
        b=yDYOvK7URsuhKdU2O8Cfm1QFeZ5IUo7gNtpxzM7nPaXUH8hRWDXMZecVXi5swgrk6L
         u0Dd4ONBSfH9M3nwd/5Be6Ja5eI31T5PW4YuCU9u+LuA20oirLRHiBBW/NIHZS9Ad4+h
         YqKUMHl895xmSD6zjHjT+hKYCFD+Z1PlonWex0Xd4o+faehD1T1RiqJgLCuvDbA4Q4ul
         RpxJe0xOaFG2zWTWDkpeaD5FW7nCCt74Z4yAbmrvzVu9c89RKOsO2xbm06NoCJhP3uwc
         jDowfHw9b2+GW2Dz+v8VdyJdmWNQMapifC9XOAtLVFjUjMP5G+ZG3slCTiYQitB3lyBQ
         UVpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734334835; x=1734939635;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8mDgxM0yEOok2sKIVcUGDtQKV48thFUw050xg1Tx7VU=;
        b=FesdJG9onyEgaQJBtXnAmHEs0UGqnEPex3strUUuIPbpyL99j/hpV7g5xa+T6Fu1IY
         fgjt1RIzCZuJ0Nxfk8zxn/NFMuMW0g4MeCVtvY1FBriGreEMQkhOIsH4c/WKg9H1/N5I
         xonmzH33mO/nzAbwgbCWwWGZbMpSJbQzOqc5hLjhb11s2iO/QM0wwyXVbS9ZbiGXqeSd
         no51PVc9iUKjj0Z1XDEigbBoixas978DtAV2OfKY0GdflGtD1CFWnB6ZKBPmmZD7I7ae
         qPuu5NOgAjxeiKqr0vhquhGTV4My1bN0r9e1GY7FdipsqA1Z2CoaqMwJ2RjI9ZSZj+bl
         o6fA==
X-Gm-Message-State: AOJu0YzDt/O0cqCMeisqBZsSsU0tdp2MiVkNK1R4hbJshFf+06/BYqq3
	ewG/tUoOiTg0uFQ1t46xN6ELtwYa6g62kzfyyuOA8PkmOiC+QTcrWiG3xcsYZA==
X-Gm-Gg: ASbGnct4qT83j2W/wc53tBXdUgFyDSnKvGutndC8BAicanHJm5514epGsvz3dtk/3rx
	FhvI1jN6nE9mUSda+AKNkhLS9Mz/rhd28xbKlA08lnX2nqIU9rSjkRASlnqwyFKawtFQByfOsw+
	QIs+XWayXjifO9h3YZd9YPLiOcA4cChpGdJC4g+0AYokuD0iqoYzrcX4vzLZzgidM5g4fsiv/ZG
	99NviDuxJx0KBVhxIqkd6zrQ/+DXUObRQR1uoXghqWf4D8BjUNpZofPMHEYra3Acl0=
X-Google-Smtp-Source: AGHT+IGGVu4KJwdCoYzSffGoaGBpFi0gWJGthQi9td/n7fVzDFpB7iakWS1EO51d1T+rE8NLKPwRjQ==
X-Received: by 2002:a05:6a00:1815:b0:724:d503:87a1 with SMTP id d2e1a72fcca58-7290c144b3amr13962615b3a.7.1734334834646;
        Sun, 15 Dec 2024 23:40:34 -0800 (PST)
Received: from thinkpad ([120.60.56.176])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918ad6536sm4132897b3a.76.2024.12.15.23.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2024 23:40:34 -0800 (PST)
Date: Mon, 16 Dec 2024 13:10:21 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: mhi resume failure on reboot with 6.13-rc2
Message-ID: <20241216074021.kwoid2747o7piquv@thinkpad>
References: <Z1me8iaK7cwgjL92@hovoldconsulting.com>
 <20241211145315.vaf7gbapieywcvau@thinkpad>
 <Z1mp3_ArzL-GLr3D@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z1mp3_ArzL-GLr3D@hovoldconsulting.com>

On Wed, Dec 11, 2024 at 04:03:59PM +0100, Johan Hovold wrote:
> On Wed, Dec 11, 2024 at 08:23:15PM +0530, Manivannan Sadhasivam wrote:
> > On Wed, Dec 11, 2024 at 03:17:22PM +0100, Johan Hovold wrote:
> 
> > > I just hit the following modem related error on reboot of the x1e80100
> > > CRD for the second time with 6.13-rc2:
> > > 
> > > 	[  138.348724] shutdown[1]: Rebooting.
> > >         [  138.545683] arm-smmu 3da0000.iommu: disabling translation
> > >         [  138.582505] mhi mhi0: Resuming from non M3 state (SYS ERROR)
> > >         [  138.588516] mhi-pci-generic 0005:01:00.0: failed to resume device: -22
> > >         [  138.595375] mhi-pci-generic 0005:01:00.0: device recovery started
> > >         [  138.603841] wwan wwan0: port wwan0qcdm0 disconnected
> > >         [  138.609508] wwan wwan0: port wwan0mbim0 disconnected
> > >         [  138.615137] wwan wwan0: port wwan0qmi0 disconnected
> > >         [  138.702604] mhi mhi0: Requested to power ON
> > >         [  139.027494] mhi mhi0: Power on setup success
> > >         [  139.027640] mhi mhi0: Wait for device to enter SBL or Mission mode
> > > 
> > > and then the machine hangs.
> > > 
> > > Do you know if there are any changes since 6.12 that could cause this?
> > 
> > Only 3 changes went in for 6.13-rc1 and they shouldn't cause any issues. One
> > caused the regression with pcim_iomap_region(), but you submitted a fix for
> > that and other two were trivial.
> 
> Ok, thanks.
> 
> > From the log, 'mhi mhi0: Resuming from non M3 state (SYS ERROR)' indicates that
> > the firmware got crashed while resuming. So maybe you should check with ath12k
> > folks.
> 
> This is the modem so I don't think the ath12k wifi folks are to blame
> here.
> 

Ah, even after these years I always confuse between WLAN and WWAN :)

> It may be an older, existing issue that started triggering due to
> changes in timing or something.
>

Could be. But the issue seems to be stemming from the modem crash while exiting
M3. You can try removing the modem autosuspend by skipping the if condition
block:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/bus/mhi/host/pci_generic.c?h=v6.13-rc1#n1184

If you no longer see the crash, then the issue might be with modem not coping
up with autosuspend. If you still see the crash, then something else going wrong
during reboot/power off.

> Is there anything you can do on the mhi side to prevent it from blocking
> reboot/power off?
> 

It should not block the reboot/power off forever. There is a timeout waiting for
SBL/Mission mode and the max time is 24s (depending on the modem). Can you share
the modem VID:PID?

- Mani

-- 
மணிவண்ணன் சதாசிவம்
