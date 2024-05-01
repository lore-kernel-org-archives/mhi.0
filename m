Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30FC3D97F
	for <mhi@lists.linux.dev>; Wed,  1 May 2024 05:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714540714; cv=none; b=ciWy8AOa3viRJw54//u6afPOxnuJt0rK0cDTxQwyRVyytNFI1qWQEpua9eyCvCaxqksiW9jNDU5/a3kVuv4u+zbL56HXBpJGPsUkASFUFMj1IVZYfn4gXl2DD0czVpEUWn7Qr9rwb5Z6TqMSSyOk0QC1prWaDrZyKoCxmOVrSbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714540714; c=relaxed/simple;
	bh=YlhaJhV5my5PPggnaixBtvYw3nwXbX2fL950Cy6rP3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O8M43iflL/+1ht4XBAZ1Eu0pR+ejia6scpLRq06kbyNWve3qqtddQ0zNxG2hVRZljBXgYdzd6+y8FgF0+72IWWa2v9NhExLhm/n6/RC2IygbbF0+U33o3C/BuYkrC9tq9KjPHMPCuUOnFlrLjG5VSCAlicC+eR0cIAPDkpoIWOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=nmY9o5y7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="nmY9o5y7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05816C113CC;
	Wed,  1 May 2024 05:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1714540714;
	bh=YlhaJhV5my5PPggnaixBtvYw3nwXbX2fL950Cy6rP3Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nmY9o5y7bIskT+PcPuxyk1fq3bG3KwqY4ZPI8Gu8KffhP8Gv6f6B3vlB2JSSXNCr/
	 COO6vi9BrzWEF+Ehb06mGuKHtG2OTkO0vOPEtOSH3RwKDt6kskk7jH+4x5+GO0pV4l
	 RuEO3x0FIjr7TLnWcjpAPENqQW08ZTO+lINHRoZA=
Date: Wed, 1 May 2024 07:18:23 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev, quic_bqiang@quicinc.com,
	ath11k@lists.infradead.org, quic_qianyu@quicinc.com
Subject: Re: [GIT PULL] MHI changes for v6.10
Message-ID: <2024050116-petroleum-causal-bdfc@gregkh>
References: <20240501043450.GA5218@thinkpad>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240501043450.GA5218@thinkpad>

On Wed, May 01, 2024 at 10:04:50AM +0530, Manivannan Sadhasivam wrote:
> The following changes since commit 4cece764965020c22cff7665b18a012006359095:
> 
>   Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git tags/mhi-for-6.10

Pulled and pushed out, thanks.

gre k-h
