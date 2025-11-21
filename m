Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C1434EEF6
	for <mhi@lists.linux.dev>; Fri, 21 Nov 2025 14:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763735209; cv=none; b=tHz0+Nwuqp6bZj9zIL5fHXAOEfci3yzAhJFNlnZBbFhb6bX2i/m7AZLPDYn8QZSFFOVBWLKyqSjpNDVEi6HVYTCbab+rJZH6zqBNo9DEmkCptqF/bW7QRlESR/RLGrUKrt3ZM6jAfG2b9M2A3hlYMxYwwaLfzwXNjo+9NaolQNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763735209; c=relaxed/simple;
	bh=1Ov+HL8z0PapoE7n26BA8sNo4GOWmBWqHxxvqcpI46k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sVJE3RwGhMF/cjs4jZMsLK5l0oQf5eOw8NYY/P7HKTY/CG0cd8jEEupL/85YlVeqPT5x2nmkIvRh0UMImRGPUnr/X3ZNUW9vhtjDw7mwbKdJqdidebp+lAuVQmYtPZnMRaoR3o51KUzwPZ1eLxuhejUkBOOIcfxLJE8KA5KZU5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=0UvZ+Elt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0UvZ+Elt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8050AC4CEF1;
	Fri, 21 Nov 2025 14:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1763735208;
	bh=1Ov+HL8z0PapoE7n26BA8sNo4GOWmBWqHxxvqcpI46k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0UvZ+Elto7EHr6+CPR6/a7x1Aogse7k2QSeRxoDquBXOZfHGysRqrvucqNLdlKXXt
	 gDyNQS8hzUcRpEXG3qc2YJU+x2eek8R7R+hPP+/wJBdl/3/4mvX+XAT2jxyDAZqauY
	 zNVjN9C/ky2XJSotjCczX66y6D6FTwW33BheMl0k=
Date: Fri, 21 Nov 2025 15:24:51 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev
Subject: Re: [GIT PULL] MHI changes for v6.19
Message-ID: <2025112136-rinsing-refurnish-83c6@gregkh>
References: <34iklxcwetejiip7pjaohgudz5plbbxvt6bj3ijv7gcsf4t4jx@alpswssesdws>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34iklxcwetejiip7pjaohgudz5plbbxvt6bj3ijv7gcsf4t4jx@alpswssesdws>

On Thu, Nov 20, 2025 at 11:40:45AM +0530, Manivannan Sadhasivam wrote:
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:
> 
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git tags/mhi-for-v6.19

This is not a signed tag :(

Please fix up and resend.

thanks,

greg k-h
