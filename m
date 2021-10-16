Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15172C83
	for <mhi@lists.linux.dev>; Sat, 16 Oct 2021 15:07:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DA8AD60ED5;
	Sat, 16 Oct 2021 15:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1634396833;
	bh=IIcR3vigEHlyG+m7wrxzuIMKNB+TXsX74NmOA7yY2Lc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H7xORHgRcyt8t9uvNTK5OU/QU8G+15ATpwFXYCtQ6YpGPlL/AyEZHJ4fyCoEO8JmD
	 6VKG5aUB9OdE6ixcTN2mFbCGNjTxmHONKxiTt3sW7ZGDBTzkN+eGYlOuPUCNmLpcmw
	 Q9gSi8raSVpCmHPE7jRhoR4LRvKoOHPr3YBwlfjY=
Date: Sat, 16 Oct 2021 17:07:06 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Joe Perches <joe@perches.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	hemantk@codeaurora.org, bbhatt@codeaurora.org,
	loic.poulain@linaro.org, wangqing@vivo.com, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH 3/3] bus: mhi: replace snprintf in show functions with
 sysfs_emit
Message-ID: <YWrqmiT1pC+SbecM@kroah.com>
References: <20211016065734.28802-1-manivannan.sadhasivam@linaro.org>
 <20211016065734.28802-4-manivannan.sadhasivam@linaro.org>
 <YWqBTj4slHq7HexS@kroah.com>
 <6ddc01b24b1c72f7e92174a037043b5cfffa3431.camel@perches.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ddc01b24b1c72f7e92174a037043b5cfffa3431.camel@perches.com>

On Sat, Oct 16, 2021 at 03:24:17AM -0700, Joe Perches wrote:
> On Sat, 2021-10-16 at 09:37 +0200, Greg KH wrote:
> > On Sat, Oct 16, 2021 at 12:27:34PM +0530, Manivannan Sadhasivam wrote:
> > > From: Qing Wang <wangqing@vivo.com>
> > > coccicheck complains about the use of snprintf() in sysfs show functions.
> []
> > > diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> []
> > > @@ -94,7 +94,7 @@ static ssize_t serial_number_show(struct device *dev,
> > >  	struct mhi_device *mhi_dev = to_mhi_device(dev);
> > >  	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
> > >  
> > > -	return snprintf(buf, PAGE_SIZE, "Serial Number: %u\n",
> > > +	return sysfs_emit(buf, "Serial Number: %u\n",
> > >  			mhi_cntrl->serial_number);
> > 
> > The text "Serial Number: " should not be in here, right?  It's obvious
> > this is a serial number, that's what the documentation and file name
> > says.  Userspace should not have to parse sysfs files.
> 
> sysfs is ABI right?  Parsing or not, it's what's already there.

If no tools rely on this, and we can change it, we should at least try.

We can not change ABI if something breaks.  If nothing relies on it,
then it is fine to do so.

thanks,

greg k-h
