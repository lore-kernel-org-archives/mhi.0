Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85037415F36;
	Sat, 26 Sep 2026 11:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790421995; cv=none; b=kabnDMHzik/nyL92CTxEjwftKJdGbs3ww4yB5A1htf0z9TcWoNRTbdPnoJNSvw3s9Zso6Y+XpubeYVd8SlhkptMnEyFV/Q9gjd+JcmsmPwMZu/MsrFJco3EoX4NcjoIZQntE5ohnB7xW3IqX2mjhVD65TXMDspQKcJUyIuXM5rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790421995; c=relaxed/simple;
	bh=K1wCaMjlEn6zyMupTboGDcgRhJtcCweyxOXDWcswh4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n4tAFaxOkyYx800rAEHYXeE7hm2dmcuJEOulULiEbYxV30+2gdiQiEEOPo7XErftpIVG3WFSOHwRhPBG8Bef3/jJpGoUlphGaZGxHU205t7xI2XMOHLtT9ctWBvxj3+dVEY8/7Avf75fjAPAgtbPHzO5pUtFtuDQlslXDvyqNMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zct4zqp/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zct4zqp/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB5401F000FF;
	Sat, 26 Sep 2026 11:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790421992;
	bh=980fQ7kBt/d28PmP02rMg1BM1AiePRSmXEpKUdzVp58=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Zct4zqp/0nNtWaPw65lJRYrurG6N/lGgQe8BLCLJIsOPzTXVfv6+18IRtm8pxvSbY
	 f+b8sZFHvS3NR+sRgpNcLiGW+JTfd3eVgbPjFsIqMyIVcgu2QOIw7cYKboQbFF1Lp1
	 5gSwbTIsdazCI70wikaMrYQk5AIpbgzyBq/CFsN9MUwTreBQf9jhBM4VXw0sGpVmdQ
	 9WbDrrLleDHsRw5YGqrQJeGIkhwhLCymBUN3aWvL+PY3YR7EgieblL3QCGxQLXTOx+
	 FVAozkUXm97+PjUBoUQ7ncaY9ZJIWt+90HZE8D+mElkd4FNCNnpouB77v3hREzfbrM
	 wFnUEnn29RJTQ==
Date: Sat, 26 Sep 2026 13:26:15 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Slark Xiao <slark_xiao@163.com>, jeff.hugo@oss.qualcomm.com, 
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Add autosuspend_delay
 customized support
Message-ID: <nsaa4cchprkgqka7uc4ccr5wq7v6uhue5dpsvquwxyk4ndr57t@i56bkvwpclpo>
References: <20260919095506.9570-1-slark_xiao@163.com>
 <bf94f351-777d-4dc0-98a2-7af77f832f2b@oss.qualcomm.com>
 <1bec2fd7.99f3.1a0c8ea4db6.Coremail.slark_xiao@163.com>
 <2b0d3e13-96fa-437a-9de9-4a61911fe232@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2b0d3e13-96fa-437a-9de9-4a61911fe232@oss.qualcomm.com>

On Wed, Sep 23, 2026 at 09:24:55AM +0530, Krishna Chaitanya Chundru wrote:
> 
> 
> On 9/22/2026 5:09 PM, Slark Xiao wrote:
> > At 2026-09-22 12:12:35, "Krishna Chaitanya Chundru" <krishna.chundru@oss.qualcomm.com> wrote:
> >>
> >> On 9/19/2026 3:25 PM, Slark Xiao wrote:
> >>> For some WWAN device, it may get a SYS ERROR issue when resuming
> >>> from suspend state frequently. Refer to the Qualcomm Windows
> >>> driver, the default value of autosuspend_delay_ms is set as 5000
> >>> ms. But in Linux side, all WWAN device were set as 2000ms. We
> >>> tried to set this value to 5000ms and we can get a positive test
> >>> result.
> >>>
> >>> So we add a support to allow vendor to set a difference value for
> >>> specific WWAN device.
> >> you can change auto suspend delay from sysfs, please use that way instead of
> >> doing in the driver.
> >>
> >> - Krishna Chaitanya.
> > Yes, we can do this by setting the sysfs API . However, not all users 
> > are aware of this method. Additionally, this approach is only
> > effective for a single instance; it requires reconfiguration after each
> > restart, which is quite inconvenient.
> you can have udev rule to set this without any user intervention.

We should not rely on userspace to fix the SYS_ERROR. Userspace knob should only
be exercised to customize the delay for power management purposes, not to fix
firmware crash.

First we should know whether the default delay can be increased to 5000ms for
all devices or not. If that is not desired, then we can go for Endpoint specific
delay.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
