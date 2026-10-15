Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847364E8E15;
	Thu, 15 Oct 2026 13:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792072291; cv=none; b=mtxljQrfeLJcOu/AN6S+mopkuaJh72LR3claC8ke60kgEJCN3v0svr8x9h+ikhpbE9qeqnM79uGRwJtL8JT4Dq7P1TQxIw/QBOrSBg1EmNwTmUNJnYao5fk8wxfO/yrgJp84AL6aQwfIE8uQHKYYC6UieKC1gLIphKdM3MjeiFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792072291; c=relaxed/simple;
	bh=RAY21xpGqEs8ofV/k20DKQeUzNm/8Inq5CJjVCWvefg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KLd1YIhkNuKTXKJmi9gobMlAOYiqRYn4qow2zlqzhNNIGwTE1yJBtyXAoFo2OhPrQzYGFMYHbvX+TvzMmU1tVbvY6ZO/YGiUoLrtUNJvelcuWIgSP5JdzOyakA+Pj2I6zFF8rNdU1kmNi0r/vZINRbbAsYoLz3eWkmwV+owWjuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zf1jItGk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zf1jItGk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C65101F000C4;
	Thu, 15 Oct 2026 13:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792072290;
	bh=LQL9K7FjotLrNIQa5EP0wrOkT/xTAPGvJiGrgbZ57gs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Zf1jItGkxeDKvZwKtxSrdc+c2zH1+At/56XkmzrwOfJJvX6GXoRvtliRF2108ZLR6
	 VQGL/yPphm1XF1Mvd02TrlFvIPf8SrKh8nFNyt8iEuqFC738kcOx1WzfJgV2n+9mjz
	 q8NFeTbU8FfMqFC0OxPN/ErWJqFYiWvS/7AuGFUp8cK6hrQKjXFkXZGx890/tbYaKH
	 CmOpFkMAwhP5Swv2HUANQ0ZmjYhH9+ehdegW/Gl+s2QyYkGKRsTc4GRFzPrYpICzGa
	 9dVtqyHRxIp3AiPrYbZzv7p6Zske3u2Dm4r5k0wb1zr9bTby36jEu1VmQoyhno1AbZ
	 fBk2gF5zHliIg==
Date: Thu, 15 Oct 2026 19:21:10 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Slark Xiao <slark_xiao@163.com>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
	jeff.hugo@oss.qualcomm.com, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Add autosuspend_delay
 customized support
Message-ID: <atDZ7vQggXGK8bIo@debian>
References: <20260919095506.9570-1-slark_xiao@163.com>
 <bf94f351-777d-4dc0-98a2-7af77f832f2b@oss.qualcomm.com>
 <1bec2fd7.99f3.1a0c8ea4db6.Coremail.slark_xiao@163.com>
 <2b0d3e13-96fa-437a-9de9-4a61911fe232@oss.qualcomm.com>
 <nsaa4cchprkgqka7uc4ccr5wq7v6uhue5dpsvquwxyk4ndr57t@i56bkvwpclpo>
 <5506abc6.8919.1a11aab7e81.Coremail.slark_xiao@163.com>
 <astaLolGh8XkPNms@debian>
 <6e90be7f.4d64.1a13e32174b.Coremail.slark_xiao@163.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6e90be7f.4d64.1a13e32174b.Coremail.slark_xiao@163.com>

On Thu, Oct 15, 2026 at 02:13:52PM +0800, Slark Xiao wrote:
> 
> At 2026-10-11 17:46:22, "Manivannan Sadhasivam" <mani@kernel.org> wrote:
> >On Thu, Oct 08, 2026 at 04:40:09PM +0800, Slark Xiao wrote:
> >> 
> >> 
> >> At 2026-09-26 19:26:15, "Manivannan Sadhasivam" <mani@kernel.org> wrote:
> >> >On Wed, Sep 23, 2026 at 09:24:55AM +0530, Krishna Chaitanya Chundru wrote:
> >> >> 
> >> >> 
> >> >> On 9/22/2026 5:09 PM, Slark Xiao wrote:
> >> >> > At 2026-09-22 12:12:35, "Krishna Chaitanya Chundru" <krishna.chundru@oss.qualcomm.com> wrote:
> >> >> >>
> >> >> >> On 9/19/2026 3:25 PM, Slark Xiao wrote:
> >> >> >>> For some WWAN device, it may get a SYS ERROR issue when resuming
> >> >> >>> from suspend state frequently. Refer to the Qualcomm Windows
> >> >> >>> driver, the default value of autosuspend_delay_ms is set as 5000
> >> >> >>> ms. But in Linux side, all WWAN device were set as 2000ms. We
> >> >> >>> tried to set this value to 5000ms and we can get a positive test
> >> >> >>> result.
> >> >> >>>
> >> >> >>> So we add a support to allow vendor to set a difference value for
> >> >> >>> specific WWAN device.
> >> >> >> you can change auto suspend delay from sysfs, please use that way instead of
> >> >> >> doing in the driver.
> >> >> >>
> >> >> >> - Krishna Chaitanya.
> >> >> > Yes, we can do this by setting the sysfs API . However, not all users 
> >> >> > are aware of this method. Additionally, this approach is only
> >> >> > effective for a single instance; it requires reconfiguration after each
> >> >> > restart, which is quite inconvenient.
> >> >> you can have udev rule to set this without any user intervention.
> >> >
> >> >We should not rely on userspace to fix the SYS_ERROR. Userspace knob should only
> >> >be exercised to customize the delay for power management purposes, not to fix
> >> >firmware crash.
> >> 
> >> >
> >> Agree. We are still working on the issue debug on the modem side. 
> >> 
> >> >First we should know whether the default delay can be increased to 5000ms for
> >> >all devices or not. If that is not desired, then we can go for Endpoint specific
> >> >delay.
> >> >
> >> >- Mani
> >> >
> >> For reference, MTK 5G modem T700 is using 5000ms as default value. And Qualcomm
> >> Windows drivers side, the default value is 5000ms as well.
> >> However, I cannot guarantee that if all MHI devices are adjusted to 5000ms, some
> >> power-sensitive devices will not oppose this change. Additional, DELL hopes that
> >> we only modify the SDX72 device while keeping the 2000ms setting for the SDX62
> >> devices, as there are currently no similar issues with the SDX62 platform.
> >> 
> >
> >I think we should know the root cause of the crash before adding my fix. Right
> >now, we only know that it is a firmware crash, but we don't know if the crash is
> >due to MHI stack or PCI bus. If it is the MHI stack, then we can quirk the
> >device in pci_generic driver. If it is a PCI bus issue, then we need to handle
> >the quirk in pci/quirks.c.
> >
> >- Mani
> We provided the crash dumps to Qualcomm for further analysis. Issue seems
> come from firmware side. Finally, Qualcomm recommend us to update this
> auto suspend delay value to 5s. Otherwise we may get a unexpected issue
> for some specific scenario.
> And currently our customer agreed that we set this value to 5s for all DW5934e
> products. So I want to add this update based on our real requirement.
> 

Sure, go ahead and respin this patch

- Mani

-- 
மணிவண்ணன் சதாசிவம்
