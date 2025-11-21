Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B5827703E
	for <mhi@lists.linux.dev>; Fri, 21 Nov 2025 16:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763742098; cv=none; b=QRz+yqYIaGqO7sAMr2yQ9Sy7IYqSY1WbD/jX0fxNYHGMBob9VsTLdxTyKWH4YRgnMT0aNCdvvjeTP1EGPyIVKbreyFm7a4pqH60fy+CErtfftjKHKhrgE5pQjcyDMXxKko5keY2O0csfMgzKo+i7H3MzIXgTpLcxu3Lr9FGHCOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763742098; c=relaxed/simple;
	bh=UDyCfUwJsrecWnm2fRgiP/lOHi79CAwzv6mPHsmxyb0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X3V7jRwBHdVPqdYfE39l2Plt2ZroDRAXetRpXXujDwxwUmvugHwB39rttJIaNoi2SFda/qO/aeZ4WXuMKXcsbPTRAynx7+W1oQfSbde0pFWS7d1+PQb9+KcZuuLwMZNEboysKkUmjMm3RVWIJP82BokDOYwEhfip/uCkMxCOA/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vFUsXoDn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vFUsXoDn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94F07C4CEF1;
	Fri, 21 Nov 2025 16:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763742097;
	bh=UDyCfUwJsrecWnm2fRgiP/lOHi79CAwzv6mPHsmxyb0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vFUsXoDnJAfZRfIeGAj7Ij13zcSU9GM4TJ2uYwJtecrSsl2jwy0ZxrDsmQQ/q9GCm
	 XKE4IXF4qDyPwnxoHRI/NtE3J3USVxcqpUOk/6KwnYcmeDsoRUw4kNYLFJrZlW2hB8
	 +nHEdqG0Xqi1upNVwZ0L3Ktd79RIam+iOzmT/hkbaNaLb+A6OPKQJ/oPSdNLTNWoTQ
	 bb0L65i/hOW0ocFRZ0cGGb91EDokoi85wslIQX+o3emQhXCfrgSif3CAKgJZXjxRLJ
	 BzMxbn3JMzu/rnyaJkk4L3wERyH8jsDAah4bL3S9+2X6ZndMln80azKnVBJjlzwl4x
	 gbWrXXRK+FfVA==
Date: Fri, 21 Nov 2025 21:51:24 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: mhi@lists.linux.dev
Subject: Re: [GIT PULL] MHI changes for v6.19
Message-ID: <td6dikzc4wvm5caguuypvw6vfe53moec447ropssr2bkjrwnqd@ljm4wgebcq25>
References: <34iklxcwetejiip7pjaohgudz5plbbxvt6bj3ijv7gcsf4t4jx@alpswssesdws>
 <2025112136-rinsing-refurnish-83c6@gregkh>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2025112136-rinsing-refurnish-83c6@gregkh>

On Fri, Nov 21, 2025 at 03:24:51PM +0100, Greg KH wrote:
> On Thu, Nov 20, 2025 at 11:40:45AM +0530, Manivannan Sadhasivam wrote:
> > The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:
> > 
> >   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
> > 
> > are available in the Git repository at:
> > 
> >   https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git tags/mhi-for-v6.19
> 
> This is not a signed tag :(
> 

Oops. Looks like my signature got removed when I changed the tag message.

> Please fix up and resend.
> 

Sent v2. Sorry for the inconvenience.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
