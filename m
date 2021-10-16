Received: from smtprelay.hostedemail.com (smtprelay0011.hostedemail.com [216.40.44.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D581A72
	for <mhi@lists.linux.dev>; Sat, 16 Oct 2021 12:54:01 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
	by smtpgrave05.hostedemail.com (Postfix) with ESMTP id 226C7182895B4
	for <mhi@lists.linux.dev>; Sat, 16 Oct 2021 10:24:27 +0000 (UTC)
Received: from omf19.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
	by smtprelay02.hostedemail.com (Postfix) with ESMTP id 0B04439BA7;
	Sat, 16 Oct 2021 10:24:20 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf19.hostedemail.com (Postfix) with ESMTPA id 9523220D764;
	Sat, 16 Oct 2021 10:24:18 +0000 (UTC)
Message-ID: <6ddc01b24b1c72f7e92174a037043b5cfffa3431.camel@perches.com>
Subject: Re: [PATCH 3/3] bus: mhi: replace snprintf in show functions with
 sysfs_emit
From: Joe Perches <joe@perches.com>
To: Greg KH <gregkh@linuxfoundation.org>, Manivannan Sadhasivam
	 <manivannan.sadhasivam@linaro.org>
Cc: hemantk@codeaurora.org, bbhatt@codeaurora.org, loic.poulain@linaro.org, 
	wangqing@vivo.com, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>
Date: Sat, 16 Oct 2021 03:24:17 -0700
In-Reply-To: <YWqBTj4slHq7HexS@kroah.com>
References: <20211016065734.28802-1-manivannan.sadhasivam@linaro.org>
	 <20211016065734.28802-4-manivannan.sadhasivam@linaro.org>
	 <YWqBTj4slHq7HexS@kroah.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.4-1 
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.38
X-Stat-Signature: 91sxoiniyzum7wdgd7kangjd88gejuj5
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: 9523220D764
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18mqnsmvmciBIb4oKRgjUfrWQOVP9NORno=
X-HE-Tag: 1634379858-169333

On Sat, 2021-10-16 at 09:37 +0200, Greg KH wrote:
> On Sat, Oct 16, 2021 at 12:27:34PM +0530, Manivannan Sadhasivam wrote:
> > From: Qing Wang <wangqing@vivo.com>
> > coccicheck complains about the use of snprintf() in sysfs show functions.
[]
> > diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
[]
> > @@ -94,7 +94,7 @@ static ssize_t serial_number_show(struct device *dev,
> >  	struct mhi_device *mhi_dev = to_mhi_device(dev);
> >  	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
> >  
> > -	return snprintf(buf, PAGE_SIZE, "Serial Number: %u\n",
> > +	return sysfs_emit(buf, "Serial Number: %u\n",
> >  			mhi_cntrl->serial_number);
> 
> The text "Serial Number: " should not be in here, right?  It's obvious
> this is a serial number, that's what the documentation and file name
> says.  Userspace should not have to parse sysfs files.

sysfs is ABI right?  Parsing or not, it's what's already there.


