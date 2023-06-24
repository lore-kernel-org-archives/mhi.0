Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93CC818
	for <mhi@lists.linux.dev>; Sat, 24 Jun 2023 07:17:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6633C433C8;
	Sat, 24 Jun 2023 07:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1687591041;
	bh=agg+qken6eP4doV5JAZCm259/6CGeqOxnWHR48cUacs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gz529giSfCF+4GFRsCTWkIR9VQx6urcmX3K1U4C5PR5b1FlNcu1q6+GY9aMTulfH3
	 4/g8R+v7e1GAAK3U80tlc3S2eBAICm+JNAIunlSn6QwQBLkIXnryIUfq8w0p1xTrVC
	 LbtHgEVvRoi7kKl8f07VsJKg+G/O0GFVHj4nD5rQ=
Date: Sat, 24 Jun 2023 09:17:18 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev, quic_qianyu@quicinc.com, duke_xinanwen@163.com
Subject: Re: [GIT PULL] MHI changes for v6.5
Message-ID: <2023062429-twistable-wielder-48c8@gregkh>
References: <20230624070843.GH5611@thinkpad>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230624070843.GH5611@thinkpad>

On Sat, Jun 24, 2023 at 12:38:43PM +0530, Manivannan Sadhasivam wrote:
> The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:
> 
>   Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git tags/mhi-for-v6.5
> 
> for you to fetch changes up to 6bb6aba2f57ab58a8853bf09cc4e875a46646c0b:
> 
>   bus: mhi: host: pci_generic: Add support for Quectel EM160R-GL modem (2023-06-09 21:07:17 +0530)

Sorry, it's too late, my tree is closed.   Please resend this after
6.5-rc1 is out.

greg k-h
