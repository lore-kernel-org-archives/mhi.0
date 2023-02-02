Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1B48F43
	for <mhi@lists.linux.dev>; Thu,  2 Feb 2023 17:28:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E6D3C433D2;
	Thu,  2 Feb 2023 17:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675358906;
	bh=1rTj96usfpy5gop0hzmpSC2Fx/dL4gxTnIcctokm8ls=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cqE/U5X4hlcW40ip2HEAsrG8npiE5LJXUTNENzhYxBGCDdn4FD3wk2/e+Grj8oEUj
	 jR0JV6R8EmUpMgqsnU9o/iz/twdOd4CmiMz7mleFCE60e2dZ/k6k+SzARebc9eBt+r
	 /gyxcoUyywpObHJ5ifGh0Rf0tM7JY2mSmlIi7dX60riL6VE5GgcLcgtZJ4+gZN3Lmn
	 OV2Q4bTVLATOgd9cFN6O8Nlj24g9b0+JIMa8Sy2s8glO8Omv1N0lQg0prpSqK2e+4G
	 TRkRt68vrEI58tr/sz/JVVWSuBi3srNTIXyjLGyWmdMhF1MTmTbI0gqwV9RgBs7YP6
	 hzpL76yp9kiow==
Date: Thu, 2 Feb 2023 22:58:19 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>, mhi@lists.linux.dev,
	quic_carlv@quicinc.com, slark_xiao@163.com, error27@gmail.com
Subject: Re: [GIT PULL] MHI changes for v6.3
Message-ID: <20230202172819.GB257939@thinkpad>
References: <20230130082131.GB12687@thinkpad>
 <Y9vczrEM8Rcb48wC@kroah.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y9vczrEM8Rcb48wC@kroah.com>

On Thu, Feb 02, 2023 at 04:54:54PM +0100, Greg KH wrote:
> On Mon, Jan 30, 2023 at 01:51:31PM +0530, Manivannan Sadhasivam wrote:
> > The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:
> > 
> >   Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)
> > 
> > are available in the Git repository at:
> > 
> >   git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git tags/mhi-for-v6.3
> 
> I get the following error when pulling this in and trying to push it
> out:
> 
> Commit: 62c0f48fa940 ("bus: mhi: ep: Fix off by one in mhi_ep_process_cmd_ring()")
> 	Fixes tag: Fixes: 2527ad44ddb2 ("bus: mhi: ep: Check if the channel is supported by the controller")
> 	Has these problem(s):
> 		- Target SHA1 does not exist
>

Oops. Looks like a mistake from my end, sorry.
 
> 
> Didn't you get this error also from linux-next?  I use the same scripts as they
> have.
> 

No, I did not see the error from linux-next yet.

> Please fix up and resend.
> 

Done!

Thanks,
Mani

> thanks,
> 
> greg k-h
> 

-- 
மணிவண்ணன் சதாசிவம்
