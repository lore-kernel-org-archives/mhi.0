Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CABC8F43
	for <mhi@lists.linux.dev>; Thu,  2 Feb 2023 17:29:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56C4EC433EF;
	Thu,  2 Feb 2023 17:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675358969;
	bh=m9Z8lqoRFxKjAl6SE+TAr1XWFse10Uc+XLiEY3QtCFY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bEJvlQvu6c5Kzl7u8yfiLwAt/FuOKdQh5uzTogYoC+SLABpdLvAdlkMJWDHkmA4bn
	 GgVM6aQfpOzgQB44E3KnU5AMbDS3Xk6aSv+BEB+9fZfNaChfKToULe3KagssSw5OOR
	 D2tQ99RZRoE9/qdKzUN+atYXMHCtasdOmxgfJN/YPrZ5Ajt1t5yIA8S72dkZuhFX3S
	 cmDoVblmVhjV1RctcWBCREMbWCGh2S6PT+ms9uRjVvyT4R5cYhcVLUoFjeXp0UJvK9
	 Qfi5MkGakGPNhwk7L0uodBl7EUVxVmmWmzNzY3R7Y5is0jayS04ZMC5RmjpItGE5q4
	 ZxPAJuNncnDDw==
Date: Thu, 2 Feb 2023 22:59:23 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Dan Carpenter <error27@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, mhi@lists.linux.dev,
	quic_carlv@quicinc.com, slark_xiao@163.com
Subject: Re: [GIT PULL] MHI changes for v6.3
Message-ID: <20230202172923.GC257939@thinkpad>
References: <20230130082131.GB12687@thinkpad>
 <Y9vczrEM8Rcb48wC@kroah.com>
 <Y9viCijUV3LvQZ8C@kadam>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y9viCijUV3LvQZ8C@kadam>

On Thu, Feb 02, 2023 at 07:17:14PM +0300, Dan Carpenter wrote:
> On Thu, Feb 02, 2023 at 04:54:54PM +0100, Greg KH wrote:
> > On Mon, Jan 30, 2023 at 01:51:31PM +0530, Manivannan Sadhasivam wrote:
> > > The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:
> > > 
> > >   Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)
> > > 
> > > are available in the Git repository at:
> > > 
> > >   git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git tags/mhi-for-v6.3
> > 
> > I get the following error when pulling this in and trying to push it
> > out:
> > 
> > Commit: 62c0f48fa940 ("bus: mhi: ep: Fix off by one in mhi_ep_process_cmd_ring()")
> > 	Fixes tag: Fixes: 2527ad44ddb2 ("bus: mhi: ep: Check if the channel is supported by the controller")
> > 	Has these problem(s):
> > 		- Target SHA1 does not exist
> > 
> > 
> > Didn't you get this error also from linux-next?  I use the same scripts as they
> > have.
> > 
> > Please fix up and resend.
> 
> Somebody must have done a rebase.  It's now:
> 
> Fixes: 6de4941c0215 ("bus: mhi: ep: Check if the channel is supported by the controller")
> 
> Manivannan, can you take care of that?
> 

Sent v2. That's a mistake from my end, sorry.

Thanks,
Mani

> regards,
> dan carpenter
> 
> 

-- 
மணிவண்ணன் சதாசிவம்
