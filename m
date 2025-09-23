Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007572EE27D
	for <mhi@lists.linux.dev>; Tue, 23 Sep 2025 12:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758629502; cv=none; b=K17vmCg31YirD7RzIs6il0/dGVxMrVn8Cbfr6YNLpvg0wFGBi6aYxpCl9te50ZkQh4+BzMCjLcL5JRxf2sgFwTuYyhvSQpkQLtXEOMWtH1eu1fPfgNSR38/OxMG3/h0d7sd+aupM0pST3pXsvFMs0tpApTugla1j4jkWC9k7EVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758629502; c=relaxed/simple;
	bh=w6GR9149rKmb5J6FP/wKsCsPdxmKEz1L3ga4Pv88MN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ubp4mQwqOtUl1jObvmahTW3BLcF0q7xQLtElK1110udkw/E8Kj0tit3BHeDJfBEf+IS24CWkMv4cD2r/uUB0wzaInNKyw3qqzUsv8J9rzWgIplwHjkZkfFNBnXAx1pzu/Dbpiq1Wb+fkRTtmlqDQfTIy+SxH1AP/zRXEOtxoiTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=nxgLsQKP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="nxgLsQKP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C24FC4CEF5;
	Tue, 23 Sep 2025 12:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1758629501;
	bh=w6GR9149rKmb5J6FP/wKsCsPdxmKEz1L3ga4Pv88MN4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nxgLsQKPl9efN10Y12y+4anYKsmDp2/maLEAN7Bom9y3WTWbyGIrJxC6ALw5JcX6u
	 mWtov/DaeCeFUGYACZWDKJPbwEPRNQ9sCEuRdIECcNqJscSEYaU6AJCiT2/Xc0s0PB
	 X5Z2KPfgSuRoen/cng2i0YD/OmdIUvparPAoaO6o=
Date: Tue, 23 Sep 2025 14:11:38 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev
Subject: Re: [GIT PULL] MHI changes for v6.18
Message-ID: <2025092312-gumming-relapsing-57f7@gregkh>
References: <bibfbg3463xep4novmwhu3lrazqh3iau4gp2zx73zrnnkvh4ao@73xc46h7u4ro>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bibfbg3463xep4novmwhu3lrazqh3iau4gp2zx73zrnnkvh4ao@73xc46h7u4ro>

On Fri, Sep 19, 2025 at 01:28:25PM +0530, Manivannan Sadhasivam wrote:
> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:
> 
>   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git mhi-next
> 
> for you to fetch changes up to 54c67740fff7360b6607d02b8499d09b944b3fda:
> 
>   bus: mhi: host: pci_generic: Set DMA mask for VFs (2025-09-19 13:10:49 +0530)
> 

No hint as to what is in here?  You do need to write a pull request
summary please.

thanks,

greg k-h
