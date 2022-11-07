Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DD17F
	for <mhi@lists.linux.dev>; Mon,  7 Nov 2022 09:54:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51DC1C433C1;
	Mon,  7 Nov 2022 09:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1667814845;
	bh=TL6caa0Q0MOS19RlX7tnUaF/QNVZc9/JMhrEHvxpbKQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jn4vVbPciz+Pd8UD0JuAeyeOLmzT0biwtH2yFqpIgH9zXIi3KCRx3xRTY3fUhhGIS
	 sRa8DvQgw8m91fsqZDGBqFpU7QQqwKSkG5129ybYhTtgsuVu7l3nMooFCwkzbRgeEV
	 CJ/7m0vJ8qK2/KD9yazyXs6Ic9lGJLegowgb2FZQ=
Date: Mon, 7 Nov 2022 10:53:57 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Slark Xiao <slark_xiao@163.com>
Cc: mani@kernel.org, loic.poulain@linaro.org, dnlplm@gmail.com,
	yonglin.tan@outlook.com, fabio.porcedda@gmail.com,
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH v2] bus: mhi: host: pci_generic: Add macro for some
 VIDs
Message-ID: <Y2jVtWPdTybNCYqX@kroah.com>
References: <20221107084826.8888-1-slark_xiao@163.com>
 <Y2jJpT5//xBUOQMq@kroah.com>
 <28f1e702.28d7.184516dbbbb.Coremail.slark_xiao@163.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28f1e702.28d7.184516dbbbb.Coremail.slark_xiao@163.com>

On Mon, Nov 07, 2022 at 05:30:56PM +0800, Slark Xiao wrote:
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
> At 2022-11-07 17:02:29, "Greg KH" <gregkh@linuxfoundation.org> wrote:
> >On Mon, Nov 07, 2022 at 04:48:26PM +0800, Slark Xiao wrote:
> >> To make code neat and for convenience purpose, use macro for
> >> some VIDs. These macros are supposed to be added to pci_ids.h.
> >
> >No, they are not supposed to be added there at all.
> >
> >And they are not a "macro", it is a "#define".
> >
> >> But until the macros are used in multiple places, it is not
> >> recommended. So adding it locally for now.
> >
> >Again, these are not macros
> >
> >thanks,
> >
> >greg k-h
> 
> Hi Greg,
> Thanks for your comment.
> In my opinion, MACRO almost same as a '#define'.  May I know how do 
> you call such definition?

As I said, this is just a define, not a macro at all.

> And could you give your comments in previous patch, not the 'final' one?

I do not understand, what previous patrch?  What "final" one?  What is
the "latest" patch?

> In another pci_ids patch, you break it in v3 and break it here again in v2.

I broke what?

> Honestly,  it's positive for whole project. But it's negative  for contributor 
> and maintainer. 

I am totally confused here and do not understand what you are referring
to, sorry.

greg k-h
