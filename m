Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E998917C64
	for <mhi@lists.linux.dev>; Mon, 16 Dec 2024 15:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734363125; cv=none; b=qTA2mcX//K4NXVfYNcAh8muqCAaVq2eDtEWiNjRhNZ+gCBIWLckT/nGEY2A2Z3y1kYvclIp7ws1vMmJdXNQv+Y70NiSlaEh76yfdCH+RlnDqD2FA6RWL79pIFXXLwQSgfEDNNXAlGCo3FPUt+ZplXofaDM1mj3UVBOtIGeEcnbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734363125; c=relaxed/simple;
	bh=feAIxXgYtXT0cdIeJqc6bU/49p1lPtDylKD9paGVOnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eVGOZwUlHsPN0qsyHLVRyG7S0vTLJRr3bEbHfkYWPWtReHqAOneQUpM3slFhDUomOLratw8QNQqDf3bGvhGNGcsP3tNZNq4AqcRpSEAuGfSkFD1387zpDmfN6aP4bEX64/O6W0VbttZat8keo8OhNE2W0k1JdNEkpbYBQO2a9P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=fBQmkjyr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fBQmkjyr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E291C4CED4;
	Mon, 16 Dec 2024 15:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1734363123;
	bh=feAIxXgYtXT0cdIeJqc6bU/49p1lPtDylKD9paGVOnQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fBQmkjyrdt8Xd75AdSg6bVVYdIVcgfxZr5kaL5mOu1ON4IQYREk1vc/XKC54B1AKM
	 eNWdaWl5o//1FTSPsnouW5uZF9aF0XrhMldRaA3nO9nABt35AUdnY1RjrQFQToqMI5
	 E4kH8AaN8U9hQogUdp/yHwXkTN4Tzg2jU7GtZZcg=
Date: Mon, 16 Dec 2024 16:31:35 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev, Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [GIT PULL] MHI fix for v6.13
Message-ID: <2024121627-culminate-oat-6d9a@gregkh>
References: <20241203060311.66xwhgpqcw2hit6m@thinkpad>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203060311.66xwhgpqcw2hit6m@thinkpad>

On Tue, Dec 03, 2024 at 11:33:11AM +0530, Manivannan Sadhasivam wrote:
> The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:
> 
>   Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git tags/mhi-fixes-for-v6.13
> 

Pulled and pushed out, thanks.

greg k-h
