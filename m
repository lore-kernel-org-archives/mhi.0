Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3B0882A
	for <mhi@lists.linux.dev>; Thu,  2 Feb 2023 15:54:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 112B9C433D2;
	Thu,  2 Feb 2023 15:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1675353297;
	bh=ufqzVK8g2QurQs/ZjhRx6gM6y7qYGzot3m+SmwxAuTc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SNF6y2hYB/mncKsbp0+cJFtogJJYPMZ3EOxAuhyPjGcN+SRRqmRLUPZx6T5gTaGAI
	 yUNlWA2+qsNK5W0JAs/V/is3R74pMFmhzf+u+MjCSWbGlgZe805SyLSkuTrH6ez16M
	 5bE0FrcInV5a3ely7b2fWVH0IKBAuOQ17UheNeF0=
Date: Thu, 2 Feb 2023 16:54:54 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev, quic_carlv@quicinc.com, slark_xiao@163.com,
	error27@gmail.com
Subject: Re: [GIT PULL] MHI changes for v6.3
Message-ID: <Y9vczrEM8Rcb48wC@kroah.com>
References: <20230130082131.GB12687@thinkpad>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230130082131.GB12687@thinkpad>

On Mon, Jan 30, 2023 at 01:51:31PM +0530, Manivannan Sadhasivam wrote:
> The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:
> 
>   Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git tags/mhi-for-v6.3

I get the following error when pulling this in and trying to push it
out:

Commit: 62c0f48fa940 ("bus: mhi: ep: Fix off by one in mhi_ep_process_cmd_ring()")
	Fixes tag: Fixes: 2527ad44ddb2 ("bus: mhi: ep: Check if the channel is supported by the controller")
	Has these problem(s):
		- Target SHA1 does not exist


Didn't you get this error also from linux-next?  I use the same scripts as they
have.

Please fix up and resend.

thanks,

greg k-h
