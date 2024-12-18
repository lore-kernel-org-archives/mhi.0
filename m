Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E8219D090
	for <mhi@lists.linux.dev>; Wed, 18 Dec 2024 11:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734521918; cv=none; b=tvLOf8GustOZyEX+uG88iiKSjX+dD2MW3IW1eI2IQg8clogjuuszmn5r2Ndi+ywpVXbScQmerVukQmkAR2whEEkNRcL+PKypAGCNMVKOUhsc27B6y76PrGuyonDJ5RCatyfDbUvnf1uAfkYzQoaZP6N0mGD2bsNUdggfhnnxA+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734521918; c=relaxed/simple;
	bh=4yfP5WU7a/pVrsCJ7B/M/xfP8WOHCD3Dq6wN1kvsLRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dD/zvvg7CxehJXOY4GbDR085YtyRoMAhMbceztrs9pEjk+ziVzNjiQ/prvhSGS9I2jIAF76wmDu3nI2m8AJW2AFm9NqSNQNl0o0glsA0IGSW+G1pEu63SV1MOELiHhldMMfrWcOqAbKbiTM42nKuxWAJHMqoYiwBUyRyPFt9r6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A0X32FaL; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A0X32FaL"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-21628b3fe7dso49074865ad.3
        for <mhi@lists.linux.dev>; Wed, 18 Dec 2024 03:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734521916; x=1735126716; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GvY1ReTdW6brhPpJplDpvn3n8IDN60bd5c4AH0ipMaM=;
        b=A0X32FaLf6l0wdRYnPj5blEVIN8JfLeRw++ZyP+i0rTgDOhj5OPQadtS+IIfF/wWTC
         8HpsnRFJnP1923dIgqRfFAKJuUdgvoIMe3USa+WQaqKR2MRjhMvEGtjo+wXE/u/KVPka
         MZxQS84V5MLEy7GXmMhT+Gtxbf7H7QRLjUvvRL+ZjMCtfIBO59yAi6TPcihA/ORzUGld
         O3gK0r5vnkv0fDdGA4UPaheH2GNkLqaRIU12VQTBY1QdpvLgUC42zwyyrftF+oNp/FJG
         t+eRwekpjzi69W3yhZ8uQ+oiiMgni49ZFUUBhSHXIAQi0SkSMu5lY/QAY84bf/oxkMMh
         y05A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734521916; x=1735126716;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GvY1ReTdW6brhPpJplDpvn3n8IDN60bd5c4AH0ipMaM=;
        b=UIr//zyynCf47GOyOK371ohpw4gIXZkBU9uvRyqyywAuuOJKCxqLNtJVA0vupxj+cA
         Cr6rGRQEludR9vHgvsUOzFXI6QgcKna313VOzTvOKYlqwyis2vBWpndJa9VsbdJqiQwp
         LNZhPUzcIugZPEW4kzZKNw8x3FnlqA3tW2mpbG5FNAVTJ0arYcjXYx4caDZoY/fWybww
         0VrpalVZ4esJDyh7o7eADh7PKCmN0b7Wr+tZTjxe4727swlxyAMP4PdL0dJiC+IU8bRS
         72THwNPzg83mCdKZWgg3Hi627YAUzNFatJHa8l3XEfAsw/rB7C0gsJGzowfFktEe0DxR
         jLUA==
X-Gm-Message-State: AOJu0YwYoXhF711wNUVPQ6noT66K8n3DOBgoub7qyeBPEp4pbm0YltI/
	orX08k2SKFTyPrs/3Q970OY2VF/ifsb+SKJ9Dyp4x8f/b4KKqPm3IxpNgz2tAw==
X-Gm-Gg: ASbGncsxeaMJncLtr46lTMLu/W9Um1Q5TL0KpylEZBFHvu/eyQlLNf76AGsSc5U5Boi
	gjFGzNvV1FfvwQHSY28u22vRtI+ejHF/2KvEvEbTPwdGfDpDgCsqdMdaBsi8Kj53cpoLiD/zYfx
	Xnac4gXAvK1b6lfl6+qo6M1OYhXBEWT0vAWilDgZT1ur6Z8X9VOlNjbbpg5udaf5upgqdvn3u2V
	gBvZx1+/45wfQHL3ikeuhLB/3tP7xQSxuO6tjh5maMZK88lW2O0s3oqxO4Akm1DlCK7
X-Google-Smtp-Source: AGHT+IHX7hi8Bt767lKAE4MHsWyaXEw7oDBc31jaTBX9wt+ORcrbTTXMJJbcsgzFDoCQCj8Bd/5hKg==
X-Received: by 2002:a17:902:dac4:b0:216:2dc5:2310 with SMTP id d9443c01a7336-218d727e651mr36313535ad.48.1734521916156;
        Wed, 18 Dec 2024 03:38:36 -0800 (PST)
Received: from thinkpad ([117.213.97.217])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1e721easm74281915ad.254.2024.12.18.03.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 03:38:35 -0800 (PST)
Date: Wed, 18 Dec 2024 17:08:30 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Loic Poulain <loic.poulain@linaro.org>
Subject: Re: mhi resume failure on reboot with 6.13-rc2
Message-ID: <20241218113830.efflnkxz7qu24xux@thinkpad>
References: <Z1me8iaK7cwgjL92@hovoldconsulting.com>
 <20241211145315.vaf7gbapieywcvau@thinkpad>
 <Z1mp3_ArzL-GLr3D@hovoldconsulting.com>
 <20241216074021.kwoid2747o7piquv@thinkpad>
 <Z2ApCU3DAxKS7Y9k@hovoldconsulting.com>
 <20241216141303.2zr5klbgua55agkx@thinkpad>
 <Z2KKjWY2mPen6GPL@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z2KKjWY2mPen6GPL@hovoldconsulting.com>

On Wed, Dec 18, 2024 at 09:40:45AM +0100, Johan Hovold wrote:
> On Mon, Dec 16, 2024 at 07:43:03PM +0530, Manivannan Sadhasivam wrote:
> > On Mon, Dec 16, 2024 at 02:20:09PM +0100, Johan Hovold wrote:
> > > On Mon, Dec 16, 2024 at 01:10:21PM +0530, Manivannan Sadhasivam wrote:
> > > > On Wed, Dec 11, 2024 at 04:03:59PM +0100, Johan Hovold wrote:
> 
> > > I just hit the issue again and can confirm that it does block
> > > reboot/shutdown forever (I've been waiting for 20 minutes now).
> > 
> > Ah, that's bad.
> > 
> > > Judging from a quick look at the code, "Wait for device to enter SBL or
> > > Mission mode" is printed by mhi_fw_load_handler(), which in turn is only
> > > called from the mhi_pm_st_worker() state machine.
> > > 
> > > I can't seem to find anything that makes sure that the next state is
> > > ever reached, so regardless of the cause of the modem fw crash
> > 
> > This code will make sure:
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/bus/mhi/host/pm.c?h=v6.13-rc1#n1264
> > 
> > But then it doesn't print the error and returns -ETIMEDOUT to the caller after
> > powering down MHI. The caller (mhi_pci_recovery_work), in the case of failure,
> > unprepares MHI and starts function level recovery.
> > 
> > > (if
> > > that's what it is) the hung reboot appears to be a bug in mhi.
> 
> I've tracked down the hang to a deadlock on the parent device lock.
> 
> Driver core takes the parent device lock before calling shutdown(), and
> then mhi_pci_shutdown() waits indefinitely for the recovery thread to
> finish.
> 
> But the mhi recovery thread ends up trying to take the same parent
> device lock in pci_reset_function() when recovery fails:
> 
> [  339.351915] shutdown[1]: Rebooting.
> [  339.724498] arm-smmu 3da0000.iommu: disabling translation
> [  339.760134] mhi mhi0: Resuming from non M3 state (SYS ERROR)
> [  339.766211] mhi-pci-generic 0005:01:00.0: failed to resume device: -22
> [  339.773158] mhi-pci-generic 0005:01:00.0: device recovery started
> 
> The recovery thread is running before shutdown() is called.
> 
> [  339.779638] mhi-pci-generic 0005:01:00.0: __mhi_power_down
> [  339.779650] mhi-pci-generic 0005:01:00.0: mhi_pci_shutdown
> [  339.785422] wwan wwan0: port wwan0qcdm0 disconnected
> [  339.791001] mhi-pci-generic 0005:01:00.0: mhi_pci_remove
> [  339.791006] mhi-pci-generic 0005:01:00.0: mhi_pci_remove - cancel work sync
> 
> shutdown() waits for the recovery thread to finish
> 
> [  339.825892] wwan wwan0: port wwan0mbim0 disconnected
> [  339.831320] wwan wwan0: port wwan0qmi0 disconnected
> [  339.904249] mhi-pci-generic 0005:01:00.0: __mhi_power_down - returns
> [  340.025390] mhi mhi0: Requested to power ON
> [  340.233771] mhi mhi0: Power on setup success
> [  340.233954] mhi mhi0: Wait for device to enter SBL or Mission mode
> [  340.238272] mhi-pci-generic 0005:01:00.0: mhi_sync_power_up - wait event timeout_ms = 8000
> [  348.400082] mhi-pci-generic 0005:01:00.0: mhi_sync_power_up - wait event returns, ret = -110
> 
> The recovery thread fails to power up the device.
> 
> [  348.419967] mhi-pci-generic 0005:01:00.0: __mhi_power_down
> [  348.472665] mhi-pci-generic 0005:01:00.0: __mhi_power_down - returns
> [  348.725069] mhi-pci-generic 0005:01:00.0: mhi_sync_power_up - returns
> [  348.742644] mhi-pci-generic 0005:01:00.0: mhi_pci_recovery_work - mhi unprepare after power down
> [  348.762737] mhi-pci-generic 0005:01:00.0: mhi_pci_recovery_work - pci reset
> [  348.780904] mhi-pci-generic 0005:01:00.0: pci_reset_function
> 
> And tries to reset the device, which triggers the deadlock when
> trying to take the already held parent (bridge) device lock.
> 

Thanks for tracking the deadlock. I think we should use pci_try_reset_function()
instead of pci_reset_function() in mhi_pci_recovery_work().

If the pci_dev_lock() is already taken, it will return with -EAGAIN and we do
not need to worry in that case since the host is going to be powered off anyway
(and so the device).

- Mani

-- 
மணிவண்ணன் சதாசிவம்
