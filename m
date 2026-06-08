Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99B533F8D6
	for <mhi@lists.linux.dev>; Mon,  8 Jun 2026 19:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780946948; cv=none; b=S+Vc2ZAoe0L5kUZOuxspBCxyTU06SYAQ5+2Cpc4+rm61SQvUypaS4YWlLR+BBlbZHyHq/bPjBKVKijYKC9lx88iwFYyA+fNEBwkbdlq49kUCPJqnuPNeDH00itFyPd4ipI//6nWg1FXQaqoqkJrYzgTRCSPRr8F9rUy42UzdWi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780946948; c=relaxed/simple;
	bh=AkiJpaPWhzrhCRTYp9U2uEe7mTTbtDA4WxgVHJ4mxdE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DJtHuRXmTyZTIjJpc0Kwj++DQXYC34s+k94TAX6Z0apP8cLkrDDW2V/Y+eOQ2rNSJ9fMBI4gHkeI7aUjjofzg9JxL8Aac/ir01Brn/qr8N/i2XHZfO42OhHLF+/6QIaN0Mcj1xmif4l+pSLdWLfApOkEEXGwZ7IwL0RWoyxMtAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=o/TENN6S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="o/TENN6S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D46A31F00893;
	Mon,  8 Jun 2026 19:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1780946947;
	bh=yXsKD1ML4grOwfWV1P39T+pD+o+YYO33XNNgwPPbcEk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=o/TENN6SJJzt+0PBcGJ+AfRcvA5gzHtZZpBTSFrfP/5yKXQqDB9cuRBa72Fv9hm/X
	 NtWlgCtmHQ9OrwSo4J3rmXxMvT+/OevRwrFg3zwPSVpGWGuxWtByZj2FPDkFawFjKb
	 9sac8S3QNYs5eWrq29HXVgvSR0aZI2San5uCQwYg=
Date: Mon, 8 Jun 2026 21:28:08 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev
Subject: Re: [GIT PULL] MHI changes for v7.2
Message-ID: <2026060859-manual-hypocrisy-716b@gregkh>
References: <jerqsbmye24zebssys3tv7oncaj3gurirpjzrqvz2nmandl4xg@oqeyjeuy3rkj>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <jerqsbmye24zebssys3tv7oncaj3gurirpjzrqvz2nmandl4xg@oqeyjeuy3rkj>

On Fri, Jun 05, 2026 at 09:43:18AM +0200, Manivannan Sadhasivam wrote:
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
> 
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git tags/mhi-for-v7.2

Pulled and pushed out, thanks.

greg k-h
