Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716673FB32
	for <mhi@lists.linux.dev>; Sat,  2 Mar 2024 18:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709405890; cv=none; b=dTURr8ItzmZ0juci8MNRvumROHnUdYEIESiNQuoTocYQvbOQY7KUy/2MFV99H5ccg4W+mTtAOzF4i8gEpZz1skeXU47SnZbGzvVHE0KsKF0z/jGLhb9TQ/WDCvVY70x0RbWeucKyx2uzB6zHHNA0BnU/k5nGwJh/HbRILVl11jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709405890; c=relaxed/simple;
	bh=zhR4TDA+k9AxrxlKJGi5L5fyUrbFR/B6jANiGCI8zOc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YY21v5i244YbgEnMK9c0MFwzlffXnTQIZeQJ7srBuq/7I28BZLjtgqTaNT0FzrZc7CRqpRPE0dwIIO1GwOoMnNN6G8zzGPAFxG7QU1WqX9wBirzl+OECekbfr1bTQYt+NVjqDRZkYvWCkaXM0BsR12swLqzmN4gO2Bd3QhTtGlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=qWclgL5X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="qWclgL5X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EA3AC433F1;
	Sat,  2 Mar 2024 18:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1709405890;
	bh=zhR4TDA+k9AxrxlKJGi5L5fyUrbFR/B6jANiGCI8zOc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qWclgL5X05TjCw6ZhFG+yFPqBf2JmFQ/lue05wJpVGSPWQMb1XBBt5sDAFQzfW5Z6
	 pvRXo9cLMt8mWNj41Cmt5FZrIlJItoAB6VswNeOCdARMFkeo2rRZSYJfpVe4up9HtP
	 r2dLDMWzxzx+2CSpdISM1erZYAQJThJhsR/UsBY4=
Date: Sat, 2 Mar 2024 19:58:07 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev, quic_jhugo@quicinc.com, erick.archer@gmx.com,
	quic_krichai@quicinc.com, dan.carpenter@linaro.org,
	quic_jjohnson@quicinc.com
Subject: Re: [GIT PULL] MHI changes for v6.9
Message-ID: <2024030259-statue-recount-577d@gregkh>
References: <20240227054718.GB2587@thinkpad>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240227054718.GB2587@thinkpad>

On Tue, Feb 27, 2024 at 11:17:18AM +0530, Manivannan Sadhasivam wrote:
> The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:
> 
>   Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git tags/mhi-for-v6.9

Pulled and pushed out, thanks.

greg k-h
