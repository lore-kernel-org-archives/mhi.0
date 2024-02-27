Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9594854775
	for <mhi@lists.linux.dev>; Tue, 27 Feb 2024 07:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709018364; cv=none; b=Fid2OC0a7wz4nisIzOFZnOr2dD3QjtATZ87luJaQUtXhZrx01ONckL0FK1JsFXAxw2hoGLmSUV/me/ubBJmccPHgxGTwflUmYdL021rWEs/a1rNguesA9r7IbR1ZPBa1Xyk5DdA0JFv+haskbK01usKxJyw4bbuEVYhK9I4pMYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709018364; c=relaxed/simple;
	bh=lVyTXCleZImck8BrH8tMbX31xUSHJ2/S9SscG0nZ/HY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oQlIlfRtaFKoPoW1gecqBf5a/jRx8j1xa45qHRThPJttPSS2PNeVyL6CIJxWGkF2i32RFHeLjl7ZyGQCzlSqfcg4hJ7yCtCKtUiWf5ZvH6Yr6SC9mX/jJrZrqJ1tjc+yqpdn1Hsv+f65tDdUjY4f3DprXhyqzAN9qS9Ih9vfE4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g21iPOxP; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g21iPOxP"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6e4d48a5823so3182274b3a.1
        for <mhi@lists.linux.dev>; Mon, 26 Feb 2024 23:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709018362; x=1709623162; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QxFTuOsrpMcuyCu0Hy+lb4Bd4RUL02qdG86Qt+qw8gE=;
        b=g21iPOxPGvkN1EveDWbu2BDnjRGO78spHuQyjBs1WNre6/+rW3hj7+W/QoLOKtZ/Uq
         0yImDSpRxlJF6JX1RY2mfI256yqf7I3L1QkW08V6kCzg+FJFt1jb3Isn4HFswkZDoqSA
         rmFg9Ky47ttB5MvEbS3/47cbLwSoDJHWeIgI6kiZwxEmE9tEV1hiN4LQADfmUPUs5fTd
         RvNZKX8KeaF7JQ4HsTRwe+KA+sExPcBniQ3pnaW4JjlmCeUOfhyk8J/PD+q5WbNo4GyD
         Txbh9VvitAcvn3l5ymyi4md3n598MqDkH7XdjpU2Glkd9PQEUobfgeOEkWcxHFBZNtoN
         XhNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709018362; x=1709623162;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QxFTuOsrpMcuyCu0Hy+lb4Bd4RUL02qdG86Qt+qw8gE=;
        b=BdjznRsev1L0o7t97r2puUEMeNH4V2oHxdK71t4nLoUwT+k+sPfXBkYb9AeqIhbm+g
         hf12MQ4IiY0UlNW1Os2SJSYoRWnFwbelp0POB6T+2rcXNFgzqAV5tyqmsvWelqdBDWWP
         HQnFYMFJWbg0XjlmJrjjMP/FX8FoqjAL72m2pPoKM3hOmRsxdWAxJ5tkmk8X9NrruNal
         1gI8uoS1Jxg/UgRSDTsODnNkrR42YltkB6en8wb3SViCJo5gY0gAlDdZTezJRFzsd/Q4
         ddILpEMKFBU+kd7giXew7rLCLkrbV8Nc0qYhg0xPys81kaOibgXc3Xdq1XuVZRUGYLL5
         UPAA==
X-Forwarded-Encrypted: i=1; AJvYcCWKoe7stGSHTDKrc3SnlyfrAJ/gSLae53/ZjKyB9E6OXSd8Co7zn4N9hKx9jF982LSNArCxUwcqivx6+SirUVRG4pmH
X-Gm-Message-State: AOJu0YzOKE1mY4fAdAn0F7J8LyGoyPLIxe+cDFKPSLTnwdb8swQzM/On
	+bg1FXqin/Kqo7LlheYz8HpRNtOLjzQEq+tPR3KmWH1VLMJTD9CZjssO4lZ/ug==
X-Google-Smtp-Source: AGHT+IF1LF7zhEOVHEOb+Wy1qkWAaN21CKUVcJcNJZUjgL5YGc8K+RirkDo2jbJKuMOoL83r7N2YfA==
X-Received: by 2002:a05:6a20:e605:b0:1a1:e83:8eb4 with SMTP id my5-20020a056a20e60500b001a10e838eb4mr801517pzb.9.1709018361960;
        Mon, 26 Feb 2024 23:19:21 -0800 (PST)
Received: from thinkpad ([117.213.97.177])
        by smtp.gmail.com with ESMTPSA id kr12-20020a170903080c00b001dca813b07csm839619plb.62.2024.02.26.23.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 23:19:21 -0800 (PST)
Date: Tue, 27 Feb 2024 12:49:15 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: Vlastimil Babka <vbabka@suse.cz>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Takashi Iwai <tiwai@suse.de>, Jiri Slaby <jirislaby@kernel.org>,
	Kalle Valo <kvalo@kernel.org>,
	Linux Wireless <linux-wireless@vger.kernel.org>,
	ath11k@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>,
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org
Subject: Re: ath11k allocation failure on resume breaking wifi until power
 cycle
Message-ID: <20240227071915.GE2587@thinkpad>
References: <96481a45-3547-4d23-ad34-3a8f1d90c1cd@suse.cz>
 <0994ae16-8174-4a04-b454-1974b16bc106@quicinc.com>
 <20240222054739.GG3374@thinkpad>
 <38c36d16-9cc1-4f03-b758-4a3ba90f8aa4@suse.cz>
 <abc0c24f-2137-41eb-bb99-80aea8dacdb2@quicinc.com>
 <a36b35a9-fb37-4afe-a718-a47dfe658cb5@suse.cz>
 <34123ee0-26c9-4240-8d58-aba02f7c66b9@quicinc.com>
 <20240226114307.GA8422@thinkpad>
 <c4b7ec62-7d2d-438b-904d-d935e09e517c@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c4b7ec62-7d2d-438b-904d-d935e09e517c@quicinc.com>

On Tue, Feb 27, 2024 at 10:43:22AM +0800, Baochen Qiang wrote:
> 
> 
> On 2/26/2024 7:43 PM, Manivannan Sadhasivam wrote:
> > On Mon, Feb 26, 2024 at 05:11:17PM +0800, Baochen Qiang wrote:
> > > 
> > > 
> > > On 2/26/2024 4:45 PM, Vlastimil Babka wrote:
> > > > On 2/26/24 03:09, Baochen Qiang wrote:
> > > > > 
> > > > > 
> > > > > On 2/23/2024 11:28 PM, Vlastimil Babka wrote:
> > > > > > On 2/22/24 06:47, Manivannan Sadhasivam wrote:
> > > > > > > On Wed, Feb 21, 2024 at 08:34:23AM -0800, Jeff Johnson wrote:
> > > > > > > > On 2/21/2024 6:39 AM, Vlastimil Babka wrote:
> > > > > > > > > Hi,
> > > > > > > > > 
> > > > > > > > > starting with 6.8 rc series, I'm experiencing problems on resume from s2idle
> > > > > > > > > on my laptop, which is Lenovo T14s Gen3:
> > > > > > > > > 
> > > > > > > > > LENOVO 21CRS0K63K/21CRS0K63K, BIOS R22ET65W (1.35 )
> > > > > > > > > ath11k_pci 0000:01:00.0: wcn6855 hw2.1
> > > > > > > > > ath11k_pci 0000:01:00.0: chip_id 0x12 chip_family 0xb board_id 0xff soc_id 0x400c1211
> > > > > > > > > ath11k_pci 0000:01:00.0: fw_version 0x1106196e fw_build_timestamp 2024-01-12 11:30 fw_build_id WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.37
> > > > > > > > > 
> > > > > > > > > The problem is an allocation failure happening on resume from s2idle. After
> > > > > > > > > that the wifi stops working and even a reboot won't fix it, only a
> > > > > > > > > poweroff/poweron cycle of the laptop.
> > > > > > > > > 
> > > > > > > 
> > > > > > > Looks like WLAN is powered down during s2idle, which doesn't make sense. I hope
> > > > > > > Jeff will figure out what's going on.
> > > > > > 
> > > > > > You mean the firmware is supposed to power it down/up transparently without
> > > > > > kernel involvement? Because it should be powered down to save the power, no?
> > > > > Let me clarify: from backtrace info, seems you are using a kernel with
> > > > > the hibernation-support patches [1] applied, which are not accepted yet
> > > > > to mainline kernel or even
> > > > > git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git.
> > > > 
> > > > Oh, you're right. Sorry for confusing you all. The rc kernel builds we have
> > > > for openSUSE have nearly no non-upstream patches so it didn't really occur
> > > > to me to double check if there might be in the area.
> > > > 
> > > > Seems Takashi (Cc'd) added them indeed to make hibernation work:
> > > > https://bugzilla.suse.com/show_bug.cgi?id=1207948#c51
> > > > 
> > > > But then, why do they affect also s2idle, is it intentional? And why I only
> > > Yes, it's intentional. When suspend/resume, ath11k does the same for either
> > > a s2idle suspend or a deep one.
> > > 
> > 
> > That's a terrible idea for usecases like Android IMO. s2idle happens very often
> > on Android platforms (screen lock) and do you want to powerdown the WLAN device
> > all the time?
> I am not familiar with Android case. Is WoWLAN enabled in that case? I am
> asking this because if WoWLAN is enabled ath11k goes another path and only
> calls mhi_pm_suspend()/resume() instead of mhi_power_down()/up().
> 

I don't work on Android platform, no idea about WoWLAN. But I just raised a
possible issue. Please check with the Qcom internal Android teams about this. If
it is not going to be an issue (different code path as you said above), then
feel free to ignore my comment.

- Mani

> > 
> > Even though it offers power saving, I'm worried about the latency and possible
> > teardown of the chipset. Later is only valid if the chipset undergoes complete
> > power cycle though.
> > 
> > - Mani
> > 
> > > > started seeing the problems in 6.8, the patches are there since August.
> > > > 
> > > > > So this is why you see WLAN firmware is powered down during suspend.
> > > > > 
> > > > > [1]
> > > > > https://patchwork.kernel.org/project/linux-wireless/cover/20231127162022.518834-1-kvalo@kernel.org/
> > > > > 
> > > > > > 
> > > > > > But I just found out that when I build my own kernel using the distro config
> > > > > > as base but reduced by make localmodconfig, the "mhi mhi0: Requested to
> > > > > > power ON" and related messages don't occur anymore, so there's something
> > > > > > weird going on.
> > > > > Here your own kernel doesn't include the hibernation-support patches, right?
> > > > 
> > > > Right.
> > > > 
> > > > 
> > > > 
> > 

-- 
மணிவண்ணன் சதாசிவம்
