Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0488B476059;
	Sun, 18 Oct 2026 11:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792324400; cv=none; b=J32EC1s/jMHEoRPoKQI1oF0KgPyUuJCK0h1cRahb6Bq3lYk4OgzJ3pDiSOo1VqPZJ3rIt2qU67sxBlLCdNHq7vj3G3FyZC7KjV5eYCRl1juy1Bhxyh6CxDHhZt/N6XyUZzSbPqR0/R8sjhf2UR7R3Y6Aip1DyBpYYOmB/agnNqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792324400; c=relaxed/simple;
	bh=iVRziyNctIbidnQHIi7jBRXSHs4JKhUtNfN7fkFTFdU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HP3XocxsdDmk0jFEvdqkv0UlPzpWoxhHiHeoJyCgOprnIMm+fNc2x72Q1v7IJHLby1mqcdVfm979zfVoO7potn6dlaYQyQKHhZlpB9q8FZWHrM52qu5eKWJswQuLoBXvaJDQZ+svZg7BBCU8EzKDg0UvIl0AgLZ5PlxY+Y4aZgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Sow3kols; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Sow3kols"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F6771F000C4;
	Sun, 18 Oct 2026 11:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1792324397;
	bh=GdObRr/FpNVEeHsNg+G5Yu4pcHmXMnsfqVni+sAxH/0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Sow3kolsRZN4ok6ryzv7l0XvlqIbiCTTkdI0kB1N5lc/zM0YJx8RIa3m4s3tjgHVx
	 D0JiFTFjhUtrs9wYvEk4Ut+X5nohAIYrVqaqiFb/iIhb5Dq6IF2OKMK4yIaxabG1cQ
	 u11hSnllTStxuZNKZ/4XHycAPnq1etY042wGlrwc=
Date: Sun, 18 Oct 2026 13:53:12 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: jiale yao <19888972804@163.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Alex Elder <elder@kernel.org>, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH] bus: mhi: ep: cancel reset work during controller
 teardown
Message-ID: <2026101845-slideshow-entomb-74ad@gregkh>
References: <20261018040614.533366-1-yaojiale02@163.com>
 <2026101841-unroasted-carbon-e514@gregkh>
 <74679635.183c.1a14eb6b4b9.Coremail.19888972804@163.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <74679635.183c.1a14eb6b4b9.Coremail.19888972804@163.com>

On Sun, Oct 18, 2026 at 07:12:39PM +0800, jiale yao wrote:
> At 2026-10-18 14:34:06, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org> wrote:
> >On Sun, Oct 18, 2026 at 12:06:14PM +0800, Jiale Yao wrote:
> >> The doorbell IRQ schedules reset_work on the system workqueue when the
> >> host requests an MHI reset. The controller teardown only drains the
> >> private MHI workqueue before releasing the controller state, so
> >> reset_work can still run after that state has been freed.
> >> 
> >> Cancel reset_work before destroying the private workqueue and releasing
> >> the controller resources. The caller is required to power down the
> >> controller first, so the IRQ can no longer queue the work at this point.
> >> 
> >> Fixes: 7a97b6b47353 ("bus: mhi: ep: Add support for handling MHI_RESET")
> >> Signed-off-by: Jiale Yao <yaojiale02@163.com>
> >> ---
> >>  drivers/bus/mhi/ep/main.c | 1 +
> >>  1 file changed, 1 insertion(+)
> >
> >How was this found and tested?  What about a cc: stable?
> 
> cc:stable is necessory. The bug was found by my static analysis tools.

Then as per our documentation you need to state that, right?
