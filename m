Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFB31D54B
	for <mhi@lists.linux.dev>; Mon, 26 Feb 2024 11:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708947796; cv=none; b=CL1vWKUzzR4ePUN9TrnMxRsp+vwCCixoGw9arsgh5mUYSXIx5ARwwTDKfIjlOFVGIzZctaUGJJizmZg5CIKTR4T675+RRvNyYE6KM8OzIZl+KbX1HfvtfvdEVKXRJr8U2j1kwwZQ62kIxDXbAbx578kOFqGPui7UiLL7aNbz5hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708947796; c=relaxed/simple;
	bh=+D1gemzTmM+hYFzEtK0DGUXUvrO2heqPidHgtv/T6VQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C0MJRvKX3q0kCKA7ogYXxSlzmm9lJjyk19ftphP5A8WUIEXyz3p8FYjkrAbfcH7zLG6IBYpRD39KYEt0IJGbQqUcG+E5/b/17MODSH4GOMaTItjifwtmYyaZxXodJFALF2Ss1+GjOGhrsLb5sRhCNhqsAavHdbrAXn45XjTG1uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vo69NCRs; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vo69NCRs"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-787ba16a236so170442485a.1
        for <mhi@lists.linux.dev>; Mon, 26 Feb 2024 03:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708947794; x=1709552594; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A0/ZCukQ/ioxMt1iZ+gVoj8e21UGTGIMIaePv4w50ls=;
        b=Vo69NCRs/0WCyNgv30TAjIv/NeAfasfRlXaeTWjzZufBbVnx8RciCCyRdE3aQvKKMQ
         q/AZf8YUCBaCZJNkH5OEvme8yPbI9AvxArjUjPRTTb4SYIWlNJOti/BTgFbU+VMyq9x1
         4I16mtQ0CbYIQ47vM7sVGHgdhQY4NOPZajaXgKP3D4pc/ESfr3AE3+t1/E/C/o9jteVW
         VFQiADMwXbxgEiZLRzOUDC8yC71OuPeL5fPqhn6FDnFqa4ZJ2pV9tM/lDnjlPTVgLUNr
         LJSMvBVF6knI1BFRpXuojV84GHZc5c4Ojj0/nBcSYVCd+dffVD51mCGsYRmSLft/EOEJ
         NkZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708947794; x=1709552594;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A0/ZCukQ/ioxMt1iZ+gVoj8e21UGTGIMIaePv4w50ls=;
        b=DPW7e0ljifSl19RV9fRelKn1/2U/pj0ucSf9P0ww+ZeKKN9wcJ1/3pePqoRvDYPZvc
         m4pz5pEu/ONEM2Zf8e6pN5oWX0iLk8grE/DycgdpB/LLSx0dxQCekC3B9aGhAaM3CP4k
         LcwKinNTZiNjnr+9uNyT9remi42Nda718ru8APUTnD2zNnK2O+69RNcZs+d7ZNsSCE8s
         qjzrvSOkbOtRunEXTfo/xfCQQ3U6ZZH26ugnUq/BMTaluVSLTs2ZceeU7R+Ej71sTQEW
         PNiWu1ENZMaxPd+dkvCUx7MoiXSmkzm3za6LHGH7DlpPq2+dkdacb7g//voJmE/tYS2d
         X+BQ==
X-Forwarded-Encrypted: i=1; AJvYcCULXqWC4vrMdJczzbAJcf+E1LUmniMrzygC7P3OO4WLtHZ7/9sy+5Yuwm89TsYQWjfh0Kr82YJe9vJ8d0ScjXwBsNIK
X-Gm-Message-State: AOJu0YwF1XMXrBSoVzQ9MWcFk3H21hxmR0nqSl5vWUKZ5LjQyrd3sEjf
	0Rx3rT7iJJMFdrNMRfl8SIwCQa4t+ez0DFXE/scPF+lwV1ji2duyJ66tkeuJkg==
X-Google-Smtp-Source: AGHT+IHNgsf5DnizKG2yBjKkWpOwY6iMjPFmpI2P1crIgzEbd9mSBKH0ULZjXVuNxKokSy0+vf8RYg==
X-Received: by 2002:ac8:5e97:0:b0:42e:74bb:5fd3 with SMTP id r23-20020ac85e97000000b0042e74bb5fd3mr5280037qtx.55.1708947793999;
        Mon, 26 Feb 2024 03:43:13 -0800 (PST)
Received: from thinkpad ([117.202.184.81])
        by smtp.gmail.com with ESMTPSA id r5-20020ac84245000000b0042e61ef71dfsm2347580qtm.33.2024.02.26.03.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 03:43:13 -0800 (PST)
Date: Mon, 26 Feb 2024 17:13:07 +0530
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
Message-ID: <20240226114307.GA8422@thinkpad>
References: <96481a45-3547-4d23-ad34-3a8f1d90c1cd@suse.cz>
 <0994ae16-8174-4a04-b454-1974b16bc106@quicinc.com>
 <20240222054739.GG3374@thinkpad>
 <38c36d16-9cc1-4f03-b758-4a3ba90f8aa4@suse.cz>
 <abc0c24f-2137-41eb-bb99-80aea8dacdb2@quicinc.com>
 <a36b35a9-fb37-4afe-a718-a47dfe658cb5@suse.cz>
 <34123ee0-26c9-4240-8d58-aba02f7c66b9@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <34123ee0-26c9-4240-8d58-aba02f7c66b9@quicinc.com>

On Mon, Feb 26, 2024 at 05:11:17PM +0800, Baochen Qiang wrote:
> 
> 
> On 2/26/2024 4:45 PM, Vlastimil Babka wrote:
> > On 2/26/24 03:09, Baochen Qiang wrote:
> > > 
> > > 
> > > On 2/23/2024 11:28 PM, Vlastimil Babka wrote:
> > > > On 2/22/24 06:47, Manivannan Sadhasivam wrote:
> > > > > On Wed, Feb 21, 2024 at 08:34:23AM -0800, Jeff Johnson wrote:
> > > > > > On 2/21/2024 6:39 AM, Vlastimil Babka wrote:
> > > > > > > Hi,
> > > > > > > 
> > > > > > > starting with 6.8 rc series, I'm experiencing problems on resume from s2idle
> > > > > > > on my laptop, which is Lenovo T14s Gen3:
> > > > > > > 
> > > > > > > LENOVO 21CRS0K63K/21CRS0K63K, BIOS R22ET65W (1.35 )
> > > > > > > ath11k_pci 0000:01:00.0: wcn6855 hw2.1
> > > > > > > ath11k_pci 0000:01:00.0: chip_id 0x12 chip_family 0xb board_id 0xff soc_id 0x400c1211
> > > > > > > ath11k_pci 0000:01:00.0: fw_version 0x1106196e fw_build_timestamp 2024-01-12 11:30 fw_build_id WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.37
> > > > > > > 
> > > > > > > The problem is an allocation failure happening on resume from s2idle. After
> > > > > > > that the wifi stops working and even a reboot won't fix it, only a
> > > > > > > poweroff/poweron cycle of the laptop.
> > > > > > > 
> > > > > 
> > > > > Looks like WLAN is powered down during s2idle, which doesn't make sense. I hope
> > > > > Jeff will figure out what's going on.
> > > > 
> > > > You mean the firmware is supposed to power it down/up transparently without
> > > > kernel involvement? Because it should be powered down to save the power, no?
> > > Let me clarify: from backtrace info, seems you are using a kernel with
> > > the hibernation-support patches [1] applied, which are not accepted yet
> > > to mainline kernel or even
> > > git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git.
> > 
> > Oh, you're right. Sorry for confusing you all. The rc kernel builds we have
> > for openSUSE have nearly no non-upstream patches so it didn't really occur
> > to me to double check if there might be in the area.
> > 
> > Seems Takashi (Cc'd) added them indeed to make hibernation work:
> > https://bugzilla.suse.com/show_bug.cgi?id=1207948#c51
> > 
> > But then, why do they affect also s2idle, is it intentional? And why I only
> Yes, it's intentional. When suspend/resume, ath11k does the same for either
> a s2idle suspend or a deep one.
> 

That's a terrible idea for usecases like Android IMO. s2idle happens very often
on Android platforms (screen lock) and do you want to powerdown the WLAN device
all the time?

Even though it offers power saving, I'm worried about the latency and possible
teardown of the chipset. Later is only valid if the chipset undergoes complete
power cycle though.

- Mani

> > started seeing the problems in 6.8, the patches are there since August.
> > 
> > > So this is why you see WLAN firmware is powered down during suspend.
> > > 
> > > [1]
> > > https://patchwork.kernel.org/project/linux-wireless/cover/20231127162022.518834-1-kvalo@kernel.org/
> > > 
> > > > 
> > > > But I just found out that when I build my own kernel using the distro config
> > > > as base but reduced by make localmodconfig, the "mhi mhi0: Requested to
> > > > power ON" and related messages don't occur anymore, so there's something
> > > > weird going on.
> > > Here your own kernel doesn't include the hibernation-support patches, right?
> > 
> > Right.
> > 
> > 
> > 

-- 
மணிவண்ணன் சதாசிவம்
