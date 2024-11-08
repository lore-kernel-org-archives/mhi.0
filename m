Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2121F5820
	for <mhi@lists.linux.dev>; Fri,  8 Nov 2024 15:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731081471; cv=none; b=XniZOok2XZs59YxcSWVBjIF5/IuVgEdXPooSzqNmOyC6DxlatY+PZM8rjQxYhRY9LuQ0kQE4CFrnjfbNS++csEnosAorOE8xcuC1AI3/mgIOS9EB7ZGKKQCipEphN64W3y6OmFz7YZKMLhb/mzXKX+hl2r+mIl/La7TUVBR1RO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731081471; c=relaxed/simple;
	bh=qyyi8ikLp/8/U5Edfk1kt+OFj5KMrVi9dgzQaDKTB5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MmHvw2Tclo2lECTMFCQfQvbp6qoVde3wYanIzM9cfOtFYCWBEyWtEC0w9427U/1Vng+njY7AkkYp9wRjYZdV3WARGkinlD2mSYasQe7Xa2K8of+y7w0P4z+GjFAqgvF+muLZtiUvXOwSxH6r5f+mXkGGcdE1nJvm34k8lvSyUwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=BVAj2Zlh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BVAj2Zlh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C4B4C4CED0;
	Fri,  8 Nov 2024 15:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1731081470;
	bh=qyyi8ikLp/8/U5Edfk1kt+OFj5KMrVi9dgzQaDKTB5Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BVAj2Zlhrl+SD+cahtUioEHbidpUefokEzaqfeS9MGSbHM57QowYjUCkOhxkgvhyJ
	 mBXy3xluzITbQTio488TKIgfz2x46/3gnsw6WGq4hsAbjCDenZhC/1yscBGTlONWF/
	 LCxpWAbHl/4U2g1BcU0PDB+WGNiluE3IP+5BtpVg=
Date: Fri, 8 Nov 2024 16:57:25 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev
Subject: Re: [GIT PULL] MHI changes for v6.13
Message-ID: <2024110816-rickety-bouncy-5b40@gregkh>
References: <20241108120259.q6yyxrx3v63cv6su@thinkpad>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241108120259.q6yyxrx3v63cv6su@thinkpad>

On Fri, Nov 08, 2024 at 12:02:59PM +0000, Manivannan Sadhasivam wrote:
> The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:
> 
>   Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git tags/mhi-for-v6.13

Pulled and pushed out, thanks.

greg k-h
