Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2DD18A6DE
	for <mhi@lists.linux.dev>; Fri, 14 Mar 2025 07:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741938653; cv=none; b=cnZ+w3GEJFYGieuap5yBhVR8Ji+ZELM1TLGSxPbleOqfq5k2w1HHCXuenWMpDHUwzRinzDTs9Rcx7YPYm7GyTcLprOI6pCtkUWIFM4Bw4GL9h3I/whp73K699UccB5GkLE34/Ea7jLVqxhGKQEv6xe4/69crnE2/VrmBmlJFzYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741938653; c=relaxed/simple;
	bh=01rQFzdF3fUR49AcL9+qtr4Uo3WL76JMqjXzuxE4Lag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R/ifFQip7Ti1rEUUkDCcg1CPa0UGlyTM/I2RTvQwlYDP5puAhe2LLTemvnJi4uhBjJ6xqA+14dibg89rmnOHkoaXSPjDED/soJm1zVCfjBE2eMq2LvmyfLNYoIcD8DTYioSmt0CCck6yuOAfLwKW6gbgn0zLqwwGT3wm/+1yAaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=bHAOkEJv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="bHAOkEJv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0493AC4CEE3;
	Fri, 14 Mar 2025 07:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1741938652;
	bh=01rQFzdF3fUR49AcL9+qtr4Uo3WL76JMqjXzuxE4Lag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bHAOkEJvUe8eXVSYNLSVpa9l+wLhsM45oLZI4Xin4s1aVo/vzO9DY+GIqfLOBnIlK
	 UBy8nPSoiLlmbM8ZiiSwT23GRL2hX/N5K4+a26RFORxAvCosLEOv5Qp+XyhtEHrWaz
	 OV2NkTnAEIgHBrMaMaV1xtx2LdyhbTjHDbbjxkGk=
Date: Fri, 14 Mar 2025 08:44:49 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev
Subject: Re: [GIT PULL] MHI changes for v6.15
Message-ID: <2025031439-stash-tinkling-28f6@gregkh>
References: <20250314060146.vlfazasu2vicyep4@thinkpad>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250314060146.vlfazasu2vicyep4@thinkpad>

On Fri, Mar 14, 2025 at 11:31:46AM +0530, Manivannan Sadhasivam wrote:
> The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:
> 
>   Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git tags/mhi-for-v6.15

Pulled and pushed out, thanks.

greg k-h
