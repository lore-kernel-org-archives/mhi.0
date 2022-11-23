Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE78C3236
	for <mhi@lists.linux.dev>; Wed, 23 Nov 2022 18:39:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24CC0C433D6;
	Wed, 23 Nov 2022 18:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1669228748;
	bh=Stmo8/fYT8D2M93dR3Dtbem0ad4ZUrnYYz8AHrtPfTM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vTGRmGq/jxXVpog9EqmGKHMWa7bwl6jUoVW6uY4Rxd0KQ27U5sCNPdpCuf2HbR349
	 b9zWy8V12msP4M2pPAJUzsI6rOBYW3XAX6uqgGPyYpQp1WW0qixiwuORzNLKroEfsi
	 397r9nPDvAqSeybztD07ghqEwdAdKVQBrmzuK270=
Date: Wed, 23 Nov 2022 19:38:50 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev, quic_qianyu@quicinc.com, fabio.porcedda@gmail.com,
	johan+linaro@kernel.org, song.fc@gmail.com, slark_xiao@163.com
Subject: Re: [GIT PULL] MHI changes for v6.2
Message-ID: <Y35oulYNg9u3xh8L@kroah.com>
References: <20221121070849.GD11945@thinkpad>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221121070849.GD11945@thinkpad>

On Mon, Nov 21, 2022 at 12:38:49PM +0530, Manivannan Sadhasivam wrote:
> The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:
> 
>   Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git tags/mhi-for-v6.2

Pulled and pushed out, thanks.

greg k-h
