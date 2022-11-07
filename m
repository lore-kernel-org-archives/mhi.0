Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97085CB4
	for <mhi@lists.linux.dev>; Mon,  7 Nov 2022 12:07:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5EA5C4347C;
	Mon,  7 Nov 2022 12:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1667822876;
	bh=bAveuJlCOoCX/Gy1WjcK67NcvEunw1tl9ZBr69hFsgI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bx6hRpWkz+KS0BVBbB7z+4BGcKQJjYMTFtjXLf8rVoUc1xgfrsbrGSoN5YtpfO6lb
	 7iqPuH6whzRDBMeVyFtfd3PurimQ57+VZinboN1262PTyDfvRV/A6BRQOeQdfNbmhC
	 omvL+UHuWpSNLros6gHSEUCskf1PRduWCclh1S1o=
Date: Mon, 7 Nov 2022 13:07:52 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Slark Xiao <slark_xiao@163.com>
Cc: mani@kernel.org, loic.poulain@linaro.org, dnlplm@gmail.com,
	yonglin.tan@outlook.com, fabio.porcedda@gmail.com,
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: Re: Re: [PATCH v2] bus: mhi: host: pci_generic: Add macro for
 some VIDs
Message-ID: <Y2j1GBLQB2N8+lUM@kroah.com>
References: <20221107084826.8888-1-slark_xiao@163.com>
 <Y2jJpT5//xBUOQMq@kroah.com>
 <28f1e702.28d7.184516dbbbb.Coremail.slark_xiao@163.com>
 <Y2jVtWPdTybNCYqX@kroah.com>
 <5b96b2e2.3a97.18451a061a3.Coremail.slark_xiao@163.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5b96b2e2.3a97.18451a061a3.Coremail.slark_xiao@163.com>

On Mon, Nov 07, 2022 at 06:26:16PM +0800, Slark Xiao wrote:
> 
> 
> 
> 
> 
> 
> 
> 
> 
> 
> 
> 
> 
> 
> 
> 

Why all the blank lines?

> At 2022-11-07 17:53:57, "Greg KH" <gregkh@linuxfoundation.org> wrote:
> >On Mon, Nov 07, 2022 at 05:30:56PM +0800, Slark Xiao wrote:
> >As I said, this is just a define, not a macro at all.
> >
> >> And could you give your comments in previous patch, not the 'final' one?
> >
> >I do not understand, what previous patrch?  What "final" one?  What is
> >the "latest" patch?
> previous patch:
> https://lore.kernel.org/lkml/20221027115123.5326-1-slark_xiao@163.com/
> https://lore.kernel.org/lkml/20221028023711.4196-1-slark_xiao@163.com/
> https://lore.kernel.org/lkml/20221102024437.15248-1-slark_xiao@163.com/
> 
> 'final' patch:
> https://lore.kernel.org/lkml/20221107084826.8888-1-slark_xiao@163.com/
> https://lore.kernel.org/lkml/20221101015858.6777-1-slark_xiao@163.com/

That's 2 different versions, with a total of 3.

> 
> The 'final' patch was committed according to the advice of the feature
> maintainer. 
> >
> >> In another pci_ids patch, you break it in v3 and break it here again in v2.
> >
> >I broke what?
> You could have  voiced out such comment in V1, V2 before the 'final'. 

We all review patches when we can.  There is no rule that people can not
comment on newer patches, or older ones.

In fact, it would be wonderful if you could take some time and review
patches from others.  It would help your understanding of the code and
how the kernel development process works.

thanks,

greg k-h
