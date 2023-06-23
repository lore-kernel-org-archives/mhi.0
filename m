Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87EA5154AC
	for <mhi@lists.linux.dev>; Fri, 23 Jun 2023 21:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=CbwxMU596UN3SHXGFCDkR8oQ2050lXlWn2EuGniSkS4=;
  b=EnKI3OerFqRJX9FzejlToSjLEGBQaFe4p1OYUsELEL5mz49EsMp7ZTrL
   0rRfmNl38pAAant36AUp5WyAldBAMH9gGcou0pN731+QmBCeBJ/fMisKG
   BNkUQ/FAz38XkMpHuBvR/jzmTPPzMuBlAOAw+Tqm5JEM5IyQ7cUIrX8cT
   I=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.01,153,1684792800"; 
   d="scan'208";a="59686842"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2023 23:45:49 +0200
Date: Fri, 23 Jun 2023 23:45:48 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
cc: Manivannan Sadhasivam <mani@kernel.org>, keescook@chromium.org, 
    kernel-janitors@vger.kernel.org, mhi@lists.linux.dev, 
    linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/26] bus: mhi: host: use array_size
In-Reply-To: <3b4ff79b-93b4-cf56-1488-113905b3981d@quicinc.com>
Message-ID: <alpine.DEB.2.22.394.2306232340510.3129@hadrien>
References: <20230623211457.102544-1-Julia.Lawall@inria.fr> <20230623211457.102544-11-Julia.Lawall@inria.fr> <3b4ff79b-93b4-cf56-1488-113905b3981d@quicinc.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Fri, 23 Jun 2023, Jeffrey Hugo wrote:

> On 6/23/2023 3:14 PM, Julia Lawall wrote:
> > Use array_size to protect against multiplication overflows.
> >
> > The changes were done using the following Coccinelle semantic patch:
> >
> > // <smpl>
> > @@
> >      expression E1, E2;
> >      constant C1, C2;
> >      identifier alloc = {vmalloc,vzalloc};
> > @@
> >      (
> >        alloc(C1 * C2,...)
> > |
> >        alloc(
> > -           (E1) * (E2)
> > +           array_size(E1, E2)
> >        ,...)
> > )
> > // </smpl>
> >
> > Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> >
> > ---
> >   drivers/bus/mhi/host/init.c |    4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
> > index f72fcb66f408..34a543a67068 100644
> > --- a/drivers/bus/mhi/host/init.c
> > +++ b/drivers/bus/mhi/host/init.c
> > @@ -759,8 +759,8 @@ static int parse_ch_cfg(struct mhi_controller
> > *mhi_cntrl,
> >   	 * so to avoid any memory possible allocation failures, vzalloc is
> >   	 * used here
> >   	 */
> > -	mhi_cntrl->mhi_chan = vzalloc(mhi_cntrl->max_chan *
> > -				      sizeof(*mhi_cntrl->mhi_chan));
> > +	mhi_cntrl->mhi_chan = vzalloc(array_size(mhi_cntrl->max_chan,
> > +				      sizeof(*mhi_cntrl->mhi_chan)));
> >   	if (!mhi_cntrl->mhi_chan)
> >   		return -ENOMEM;
> >
> >
>
> This doesn't seem like a good fix.
>
> If we've overflowed the multiplication, I don't think we should continue, and
> the function should return an error.  array_size() is going to return
> SIZE_MAX, and it looks like it is possible that vzalloc() may be able to
> allocate that successfully in some scenarios. However, that is going to be
> less memory than parse_ch_cfg() expected to allocate, so later on I expect the
> function will still corrupt memory - basically the same result as what the
> unchecked overflow would do.
>
> I'm not convinced the semantic patch is bringing value as I suspect most of
> the code being patched is in the same situation.

OK, this just brings the code in line with all the calls updated by Kees's
original patch, cited in the cover letter, which were all the
calls containing a multiplication that existed at the time.

42bc47b35320 ("treewide: Use array_size() in vmalloc()")
fad953ce0b22 ("treewide: Use array_size() in vzalloc()")

julia

>
> -Jeff
>
