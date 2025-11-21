Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81E22248B9
	for <mhi@lists.linux.dev>; Fri, 21 Nov 2025 16:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763743467; cv=none; b=kzKqjLuvVjTRnn8NHuzWDGN0CFGen6dLQ+Vzfoi8MQ0M8rX9hRH0GYBWSXdKpwhbC/P2jAIyva7g8x07+qkC4Y1QYgbFyU+UNbR1QJ9ACNXdGZWKSohj5R54tX9uXjxNeMsaX4NcSFEl02I11FSXHPKKqYwtdTE2uiwkn5BDers=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763743467; c=relaxed/simple;
	bh=nZq0urEYjm/fNFy8qL+JUPH/GLY9fm92+mE3z4VOo6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rzLVroEbCHwGgkt4En+gdqMkaNZjr2P7ttI1UilcguzSwc4ZYIOigZIgdw2hJIhnvyZ/utt7K6pR7SEY6ONI7l4TZSRdQDh5VunhkZmfkICVIKPTv2JGFStBrqccQhLFJ2PppTHlDVSy0BzM2ke91oVVxAxivgi/JZmviEfMMQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=nepEXWG3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="nepEXWG3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C0B9C4CEF1;
	Fri, 21 Nov 2025 16:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1763743466;
	bh=nZq0urEYjm/fNFy8qL+JUPH/GLY9fm92+mE3z4VOo6Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nepEXWG3DOA/yNK18ikFybQrrbWPugKrGELHvRzPbIoj96OU0dnf4u9RJn2f5cEWB
	 lqhtYqFyoMPyOvdbOms1W3ylRYcQsK5BZ05fhyoabIcFN4eDY5REHzJ1om9PAT9g/d
	 nMxfZPszca+hpKJz79EnlnyaIjW9bNXdj7xw/Rk4=
Date: Fri, 21 Nov 2025 17:44:23 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev
Subject: Re: [GIT PULL v2] MHI changes for v6.19
Message-ID: <2025112115-repossess-staple-32c2@gregkh>
References: <3qqwa5qem45mdxadswbzrzcow3xsu4gixk26a34oplcaslede2@ofagkk4px26u>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3qqwa5qem45mdxadswbzrzcow3xsu4gixk26a34oplcaslede2@ofagkk4px26u>

On Fri, Nov 21, 2025 at 09:49:49PM +0530, Manivannan Sadhasivam wrote:
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:
> 
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git tags/mhi-for-v6.19
> 

Pulled and pushed out, thanks.

greg k-h
