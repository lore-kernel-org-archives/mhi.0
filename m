Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BEF17BBE
	for <mhi@lists.linux.dev>; Tue,  2 Apr 2024 04:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712033811; cv=none; b=f2hYRF1pKjwB3CuHWoAlUOiXVNXYNeXhCD+o5vItnc8LeFhvgHpWKzs7NyaJAalisNISvnGjlwO5I6vEz2D6T3Wv+ykerXzR3JmAsEKjzZTR7/Tok788/dqOMwO9at2Icpd0RK/rtus4R2DA68pc6fG6wY0PhCF+H+gR7ZDD5gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712033811; c=relaxed/simple;
	bh=mTzIJSj3c+9OTLvLPgl0yiej3h2UqQYmOPv0ZKmDBgc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X8qnTND9hzYJh6MPguK9j/p+aFnSLVq/WMfHEdK99L7X1UfZ1w7Z/oB2XVY8NjuUZfGUNP1NKZovKPrXJ+vhZNXF5tl7K+sn0EKlKuTKJRIs0NW5Wz6H1oA2L4FlVdwxnrUiUv4ZqNnEu/Y22VVCnb1+pE0pgS1iMNh9fGgfoMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kRzV4bUg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kRzV4bUg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 663CEC433C7;
	Tue,  2 Apr 2024 04:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712033811;
	bh=mTzIJSj3c+9OTLvLPgl0yiej3h2UqQYmOPv0ZKmDBgc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kRzV4bUgs/onvcWPzq5CasScV9Az3AWKvbiy8XCb0c7O0obwSn9+bCW6TyLeliea0
	 NgCfpX0SmrjfuqMlZfwj1yV8roJpqlQY0AWBmMKMwPSqLnw5lcgSNC38tnSG4RhBjQ
	 /06O4Q98C0KXr4UdRkB9vgwwD2nyjhiiHHLS0ayshbWUC/cI1JxR5MLY/9fubKXLr5
	 Ikq6wS5nLDRKV5yGQ+Np7fhU/VLYgSIwAWJDddT82cFy/UA3rEVS6sd0TJkuAUEeBn
	 RaOQ7wuGivJOIFzyTTMWU5N28qNkD/cd2D+0ZO7YjqQvsJm1OY2vGGRBVx+6L6DFlJ
	 zPcY2lRQ6uoow==
Date: Tue, 2 Apr 2024 10:26:47 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Slark Xiao <slark_xiao@163.com>
Cc: mhi@lists.linux.dev
Subject: Re: failed to power up MHI controller issue
Message-ID: <20240402045647.GG2933@thinkpad>
References: <38c7997c.10212.18e84f08a4f.Coremail.slark_xiao@163.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <38c7997c.10212.18e84f08a4f.Coremail.slark_xiao@163.com>

+ MHI list

On Thu, Mar 28, 2024 at 08:02:20PM +0800, Slark Xiao wrote:
> Hi Mani,
>  Hope you are doing well! I got a problem with our sdx65 device in some
> 
> specific platform. MHI driver would report "failed to power up MHI controller"
> when device bootup. Actually, I can reproduce this error when host doing a
> reboot. It's Rockpro64 with SDX65, and kernel 6.6.3 or 6.7.10.
> 
> So I add some logs and change dbg level log to info for more print. You can
> see my attachments for reference.
> It seems the host didn't receive the event of "MISSION MODE" and then
> power down the device.
> BTW, there are some extra log prints were added in function
> mhi_sync_power_up(). You can find it with mask "##shawn##".
> Do you have any idea to debug it?
> 

Looks like something gone wrong with the device firmware. Is it possible to get
the logs from the device?

This could be due to the way the PCIe controller driver on the host handling
reboot.

But let's get the device logs first to debug further.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
