Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DD0236424
	for <mhi@lists.linux.dev>; Wed, 21 May 2025 12:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747829537; cv=none; b=jtojFyv4QCA09PAGPecvBWO/NNYqRLBWHHKL3gxJLi9SQsRBv7x6ojT+y0wDCljzcDVp0zFtaveh30ue7u987Hw6k2g/uWQ9nWoG3+O6bg8g/pR3/zfquiOvZCBuWjey1DRFknP2MAPhKqh3bsNWebpwGfMYYORjWCFjEBxAbjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747829537; c=relaxed/simple;
	bh=mOY9cH0YnnNkjsYBZ8VeAeCNRQVw6aJxsi/CfQXTYco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ddLVD4vR87Q03jgZNde2kysEEjM6i6m8l8I7BDCiybEzJy2cQ7Rfy7BpBjG5xlw4/Shdu+mqkQMOV1D+oN/bcwQrmApaFmVf4jJcgKcIIYs7ozP6CLMJOL/Kp/zgp8wXEci2hQbtif7neniTK6UuwRUMkDyJatoV+fNQTflrJ5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=vJ8aPtk2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vJ8aPtk2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EE2BC4CEE4;
	Wed, 21 May 2025 12:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747829535;
	bh=mOY9cH0YnnNkjsYBZ8VeAeCNRQVw6aJxsi/CfQXTYco=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vJ8aPtk2HLRpyAd0PpQCuV56BX/93h9aVBufAnCS3fOoPNoeDKJOLzTGREKN/PChN
	 z+zyHWGAA03tlXv3QclIjibLH01DszTtHlA+uGsC/tTzFeJz1uDsEviXhRi6rbZKlG
	 XNMrKReWysu/FS3V3wxEQR//L23QntF/EYAWZh04=
Date: Wed, 21 May 2025 14:12:12 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev
Subject: Re: [GIT PULL] MHI changes for v6.16
Message-ID: <2025052106-postnasal-destiny-e7bf@gregkh>
References: <bcmjaizharbnql26jevllz4trepcjiurnqidttr565kie22kci@g37cswbge5nl>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bcmjaizharbnql26jevllz4trepcjiurnqidttr565kie22kci@g37cswbge5nl>

On Wed, May 14, 2025 at 11:37:26AM +0100, Manivannan Sadhasivam wrote:
> The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:
> 
>   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git tags/mhi-for-v6.16

Pulled and pushed out, thanks.

greg k-h
