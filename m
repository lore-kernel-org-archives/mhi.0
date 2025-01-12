Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B418F1B4258
	for <mhi@lists.linux.dev>; Sun, 12 Jan 2025 13:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736687432; cv=none; b=dj3CzFYqNLM3c92at+eSpZy1Bse5ovuLb0opNwd1pfiKj5xMWx1unOJP7WeOxDDAJSkufFZOS5Zr+i62sC+IpXxWORDaOcbu4hBa29sWJUVJ3lJpxsJ2rWYSDn54czYFFWiqEjK8Zv18JTre6nSlYeq3hcGLfvDXaTQp9Po4fMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736687432; c=relaxed/simple;
	bh=XmdVRXqvJxDsAHFTEHbKfnPD4Oo+WGTkBimoqWAh0CY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hd7Atbq4lonIiJJrKnEnz/vVdhOsAFLlxOLuJ6wNBMAEBI7wmwfO14OQFFsfskEUJ13S1osTOuNeSp5rzCfwDoiOsQXGcsh5aRM9L78ZCjKVb4BfcoF5+ksbHnyWhjDurgMeNs8bseVCPKRqGYCoz7CICS4YHwpx06/xxy+Q68A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Gk86OF6U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Gk86OF6U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C01D1C4CEE4;
	Sun, 12 Jan 2025 13:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1736687432;
	bh=XmdVRXqvJxDsAHFTEHbKfnPD4Oo+WGTkBimoqWAh0CY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gk86OF6UAqQ1uu7F/8JhtsCW+dJEi7DQ4X+cMYf4hvobdxXP9r/YIimcW7D67QUiT
	 2PYMek94qZd5P21CxGrdLpJTdOCi8WdRXsXKBuqLoC8pVbebqHg8WAs0mPvonwFB24
	 AoSKbUVSm9Ag+xUXPrj88TPdc9yR89YuK1uq0Ets=
Date: Sun, 12 Jan 2025 13:58:15 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev
Subject: Re: [GIT PULL] MHI changes for v6.14
Message-ID: <2025011208-ripple-superior-15f9@gregkh>
References: <20250112041756.t477ztqkwd2h36y6@thinkpad>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250112041756.t477ztqkwd2h36y6@thinkpad>

On Sun, Jan 12, 2025 at 09:47:56AM +0530, Manivannan Sadhasivam wrote:
> The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:
> 
>   Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git tags/mhi-for-v6.14

Pulled and pushed out, thanks.

greg k-h
