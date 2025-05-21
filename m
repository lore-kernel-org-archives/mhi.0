Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA8C256C9F
	for <mhi@lists.linux.dev>; Wed, 21 May 2025 12:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747829479; cv=none; b=smWNSEKPbqyNqpDoggMKKljhU7oSxoo/xs0163nuQhrW9QlmoyRny1pad+cRQ5RBV7yape514gnLpTrELaUFc5DzeyxG5vMy4I/rLZco1hP6zwsITQ5tb2kJtsqG8WO0tjPPjP35HWlwsBWuKXUIP2L4oIaYf2wJMh1j5R6AlA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747829479; c=relaxed/simple;
	bh=JM9ysH6BIvex4YSJDeo6K3Xb8K2Kzl+OLk6L72szuJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=flrGTEmntNHk20d9dvphPsaOP65QrCcdWBtOziopXR5kj7O5M8NObVNvlEqLqlguW14HH5VJmIsRSuSpSouwtcDCncZjMVyISwpEwfilUxxWwcKpWY+Ma+O8rOszNhGmFNZXXdv1loXpyp1nV+jO9bLiAcdas84ywiYK3eb4ozE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ZfR8M3GE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZfR8M3GE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C05EAC4CEE4;
	Wed, 21 May 2025 12:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747829479;
	bh=JM9ysH6BIvex4YSJDeo6K3Xb8K2Kzl+OLk6L72szuJ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZfR8M3GE2Nh5MEya3THrbXOHf/cBRzinqPfVgKZHEdxXE4PWx5cyc63NdUqcHQjXf
	 PLSJwDbpSfsx7NaOXslHEFXxetMn/oNy3dwceAAqebrdO9RNoZdlsGvCuzLJ1qxQcP
	 Vp09GEdRqwKarUmsD55VWsbnTk1BUAhpBgl/cBbQ=
Date: Wed, 21 May 2025 14:11:16 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev
Subject: Re: [GIT PULL] MHI fix for v6.15
Message-ID: <2025052106-uncombed-zoologist-f139@gregkh>
References: <w67btqvfqd6eeq3ufcjjqagnnigazqn64mjn5tofcc4onhkc56@6ke4pre2hgpa>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <w67btqvfqd6eeq3ufcjjqagnnigazqn64mjn5tofcc4onhkc56@6ke4pre2hgpa>

On Wed, May 14, 2025 at 10:19:23AM +0100, Manivannan Sadhasivam wrote:
> The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:
> 
>   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git tags/mhi-fixes-for-v6.15

Pulled into my char-misc-next branch now, thanks.

greg k-h
