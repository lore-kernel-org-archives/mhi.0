Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B437437DE9F;
	Sun, 11 Oct 2026 09:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791711990; cv=none; b=OyTCCunxAHH4u3FEsHsn1ffA3vWF2w1PaQ9iWhsKAPTR9Kia37XmNholbrkg9fqx2ksT6KVkPzC5BQiZcDYUDpM7W8icfB0cUkw/FlzoPH2Rgb+R/nnbOsc6muUjR1QpcF9urIaD0LT3Ca1x+LOK6afdROSskb5NtFZ6znAG0V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791711990; c=relaxed/simple;
	bh=4vsUy3JHJZSML7ewaHhSAA2icB4STrIUvNYYS72U6Gw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mrntuqyQqHDn7yKWphxdZ6euh7tJeNNy3GvGb6eCxtVDLP1jDeCWk/PPE8TEeU96hDJjGzKIKuPgfffoUZmajS2Ghrf6Qn0nsFPMBXsVBVkHPW81KTmiOvtEmX4b3sh0UY/9nPiI5KtGprINQXj6iqpadq8DIdhbgrzGfYNhGU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d3tn6XcE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d3tn6XcE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6F2B1F0089B;
	Sun, 11 Oct 2026 09:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791711989;
	bh=BFBlcxhuBA8riS/mJR6sRg852nuNHOxEVFNIKY+8dlU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d3tn6XcEHr2sT8iGRxdjc9KgM4MjP/OtsmIAzPqaAChpOodEJs48XYv3lPchnecxc
	 RbEfb9RC0YPZF9kT37gjaWUoE0CYwgwlij6r2MaIeBIw/FBtScpRaYDuB6BoaFS5YP
	 MgXcvRlDYv5YbVw6lwh5Kx+gmUe3B8L5WPuQT3mJuo1VxvDucehrlyGHjVK58Ac4J9
	 FPTqL0NAPQMXfv4MYtsjpBmiPbNV7qOVRj8ZQOSlm5RJHbBGnLP7nupImBCbRX+Lau
	 gsxleEIClF02pu/E10JRR79xZ0s33MDNrpbq7OHt7R1c6NI1KeEX6cAT2KE/BxhUVd
	 QPifbZFxKgQzA==
Date: Sun, 11 Oct 2026 15:16:22 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Slark Xiao <slark_xiao@163.com>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
	jeff.hugo@oss.qualcomm.com, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Add autosuspend_delay
 customized support
Message-ID: <astaLolGh8XkPNms@debian>
References: <20260919095506.9570-1-slark_xiao@163.com>
 <bf94f351-777d-4dc0-98a2-7af77f832f2b@oss.qualcomm.com>
 <1bec2fd7.99f3.1a0c8ea4db6.Coremail.slark_xiao@163.com>
 <2b0d3e13-96fa-437a-9de9-4a61911fe232@oss.qualcomm.com>
 <nsaa4cchprkgqka7uc4ccr5wq7v6uhue5dpsvquwxyk4ndr57t@i56bkvwpclpo>
 <5506abc6.8919.1a11aab7e81.Coremail.slark_xiao@163.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5506abc6.8919.1a11aab7e81.Coremail.slark_xiao@163.com>

On Thu, Oct 08, 2026 at 04:40:09PM +0800, Slark Xiao wrote:
> 
> 
> At 2026-09-26 19:26:15, "Manivannan Sadhasivam" <mani@kernel.org> wrote:
> >On Wed, Sep 23, 2026 at 09:24:55AM +0530, Krishna Chaitanya Chundru wrote:
> >> 
> >> 
> >> On 9/22/2026 5:09 PM, Slark Xiao wrote:
> >> > At 2026-09-22 12:12:35, "Krishna Chaitanya Chundru" <krishna.chundru@oss.qualcomm.com> wrote:
> >> >>
> >> >> On 9/19/2026 3:25 PM, Slark Xiao wrote:
> >> >>> For some WWAN device, it may get a SYS ERROR issue when resuming
> >> >>> from suspend state frequently. Refer to the Qualcomm Windows
> >> >>> driver, the default value of autosuspend_delay_ms is set as 5000
> >> >>> ms. But in Linux side, all WWAN device were set as 2000ms. We
> >> >>> tried to set this value to 5000ms and we can get a positive test
> >> >>> result.
> >> >>>
> >> >>> So we add a support to allow vendor to set a difference value for
> >> >>> specific WWAN device.
> >> >> you can change auto suspend delay from sysfs, please use that way instead of
> >> >> doing in the driver.
> >> >>
> >> >> - Krishna Chaitanya.
> >> > Yes, we can do this by setting the sysfs API . However, not all users 
> >> > are aware of this method. Additionally, this approach is only
> >> > effective for a single instance; it requires reconfiguration after each
> >> > restart, which is quite inconvenient.
> >> you can have udev rule to set this without any user intervention.
> >
> >We should not rely on userspace to fix the SYS_ERROR. Userspace knob should only
> >be exercised to customize the delay for power management purposes, not to fix
> >firmware crash.
> 
> >
> Agree. We are still working on the issue debug on the modem side. 
> 
> >First we should know whether the default delay can be increased to 5000ms for
> >all devices or not. If that is not desired, then we can go for Endpoint specific
> >delay.
> >
> >- Mani
> >
> For reference, MTK 5G modem T700 is using 5000ms as default value. And Qualcomm
> Windows drivers side, the default value is 5000ms as well.
> However, I cannot guarantee that if all MHI devices are adjusted to 5000ms, some
> power-sensitive devices will not oppose this change. Additional, DELL hopes that
> we only modify the SDX72 device while keeping the 2000ms setting for the SDX62
> devices, as there are currently no similar issues with the SDX62 platform.
> 

I think we should know the root cause of the crash before adding my fix. Right
now, we only know that it is a firmware crash, but we don't know if the crash is
due to MHI stack or PCI bus. If it is the MHI stack, then we can quirk the
device in pci_generic driver. If it is a PCI bus issue, then we need to handle
the quirk in pci/quirks.c.

- Mani
