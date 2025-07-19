Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FEC421D3E8
	for <mhi@lists.linux.dev>; Sat, 19 Jul 2025 07:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752910835; cv=none; b=tXBs+n04c+GuiR3k81/hwYlFsIlkywL39m+iRS17VfUEV/XgWw+zrGLhQBqJCN9bAoVyNBkEjxJi0I2xQnLxWNC6kr5QymDekzqmn4aFvmFPVKML2xC9+meEfVRuBH06Z0UKeXIG3z06vHfFRTTgKFhhxdcZr3ltmCbtwNdwnII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752910835; c=relaxed/simple;
	bh=ET/bP2DesCIqjFsQ+L5mj+cVlUe6lLN/VHBM1qLCYMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fzv+isaOMWrlzUJgbnkRZfpDdTURR7Dn48Q8pcZWlX8QuKf6/aSvTkAKgoH2xDbeQXsRBvs1mv9nqjhXxgi3P/GZx97Ppq8mXRLc4nti55E7srPO9eqfYEDTiWHrM17wU1dEmbnobtr0t+xZMz/8xDrLAg7c9NbtJZdkqoofSKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=lDjQrGX7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="lDjQrGX7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49F3EC4CEE3;
	Sat, 19 Jul 2025 07:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1752910834;
	bh=ET/bP2DesCIqjFsQ+L5mj+cVlUe6lLN/VHBM1qLCYMg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lDjQrGX7Xb88EW2Pc8kHIvaaQi9J4a89vA824SidE43zwISsSsWjmN8UEnyyOB3sB
	 OY2LjiZ5p4GB/I4v67n77XH/vzgpRag0cvQonsVBo3+BrV66G0YLeT2723tXSL655M
	 rKWKDzJ6mbCFFA3j5wvXJP6EsyfqWNwWqoPBSPqU=
Date: Sat, 19 Jul 2025 09:40:10 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev
Subject: Re: [GIT PULL] MHI changes for v6.17
Message-ID: <2025071957-detonator-radiator-21c5@gregkh>
References: <cwupgp4ao3j6ahhg3xvmok3tez3xvhopqgqkma655ut6hkujdq@3q5xvmrwpist>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cwupgp4ao3j6ahhg3xvmok3tez3xvhopqgqkma655ut6hkujdq@3q5xvmrwpist>

On Sat, Jul 19, 2025 at 09:11:00AM +0530, Manivannan Sadhasivam wrote:
> The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:
> 
>   Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git tags/mhi-for-v6.17

Pulled and pushed out, thanks.

greg k-h
