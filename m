Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DC9331EB2;
	Sun, 18 Oct 2026 06:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792305251; cv=none; b=g/iaio8NFQDSn9jPhJ19sUBoutCX8GqsITTbZ87ojmkS5Atv4QSrti+Dwz+VyvgQywaMKX9A9lFkPHrSdHXqUNhtQ7Pg8IrjSF3YERMM26GbDIrrOrBoEpeLkU8XK5teRhkdYO+puM2I9ZFF89je+GcMt8KDnYPmYPcEE034cBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792305251; c=relaxed/simple;
	bh=J3THsVBcYDtGxdrOCLCr/ocGl1+bfE8GIqAe3M9vk2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RaUV4TkzOrxkT84Cw7lLpAfyj9PnH0Guqctikum0aYyLAfWtxUhQpbaPowNOsuFsc+hMqUHJv0PynX7dnpZN0b0RMjoKlc7omS7zFVnfxROs8PKl9Q/eGjsdYhHwQa1iLWvBOmNSKoqodv/R8WrXs8IqpMslu/rqVr+yJJnJlgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=uOCT90f+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="uOCT90f+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A6B11F000C4;
	Sun, 18 Oct 2026 06:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1792305250;
	bh=R6gFqTRl+6YBZZj8m9dwbKAB3m48iprzYGS52joKpe8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=uOCT90f+ppCXkKWUS39ccPEPPi3yQplXgo9SYpyZETw4ye210lvVZhtM7xaVrOGsp
	 eLsOXnqmxAqp9TyiGEAlyh4ZkbjE/pEDGOM9W01mXZyJ0oP7t4uvI9h0HGb3Hetx3l
	 RLzlQVSBevrRgMZczKPvK0DOiIN4/b7XjYJilPgM=
Date: Sun, 18 Oct 2026 08:34:06 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jiale Yao <yaojiale02@163.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Alex Elder <elder@kernel.org>, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: ep: cancel reset work during controller
 teardown
Message-ID: <2026101841-unroasted-carbon-e514@gregkh>
References: <20261018040614.533366-1-yaojiale02@163.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261018040614.533366-1-yaojiale02@163.com>

On Sun, Oct 18, 2026 at 12:06:14PM +0800, Jiale Yao wrote:
> The doorbell IRQ schedules reset_work on the system workqueue when the
> host requests an MHI reset. The controller teardown only drains the
> private MHI workqueue before releasing the controller state, so
> reset_work can still run after that state has been freed.
> 
> Cancel reset_work before destroying the private workqueue and releasing
> the controller resources. The caller is required to power down the
> controller first, so the IRQ can no longer queue the work at this point.
> 
> Fixes: 7a97b6b47353 ("bus: mhi: ep: Add support for handling MHI_RESET")
> Signed-off-by: Jiale Yao <yaojiale02@163.com>
> ---
>  drivers/bus/mhi/ep/main.c | 1 +
>  1 file changed, 1 insertion(+)

How was this found and tested?  What about a cc: stable?

thanks,

greg k-h
