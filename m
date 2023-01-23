Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995F2A21
	for <mhi@lists.linux.dev>; Mon, 23 Jan 2023 07:54:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B44F3C433EF;
	Mon, 23 Jan 2023 07:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674460441;
	bh=2BWYydLu5yMbAy5ZTuhmFIUErDd7gT6zGsRFjGxMD58=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AcaGyylgw6BzOjjjOdMhd/qRgyXdAMKNUc+A/43ZY9M0COnFLE3kakJs03fI0KJ9I
	 gp5UVijWts11ZkgOyn5MZRPxuPg9LgwMbff23Oquq5WafvAPzti4k3Hyv47yvUhDuM
	 GaLl8bR6CRWDdLf5XBbkU9VcfRLjcSpcO1gngUNXpC0L1DDwbQQvGMf9yz6YHnbhnq
	 p37EJSd3SE9bF4BlypU78iBp7yYU4K/UwUr+SB1AopMvVI0PQEfmMp5E1WrDXQIDzh
	 sAPV6vYgS6+4No0JQwIQStoaBZiHekPn/sKf1bhBW52C1/3BqE5BTQIT/OxmLgEykD
	 Q4XVMG8jKAMkA==
Date: Mon, 23 Jan 2023 13:23:49 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Dan Carpenter <error27@gmail.com>
Cc: mani@kernel.org, mhi@lists.linux.dev
Subject: Re: [bug report] bus: mhi: ep: Add support for suspending and
 resuming channels
Message-ID: <20230123075349.GB14294@thinkpad>
References: <Y8at3oH+T0wd2NR+@kili>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y8at3oH+T0wd2NR+@kili>

On Tue, Jan 17, 2023 at 05:17:02PM +0300, Dan Carpenter wrote:
> Hello Manivannan Sadhasivam,
> 
> The patch e4b7b5f0f30a: "bus: mhi: ep: Add support for suspending and
> resuming channels" from Apr 5, 2022, leads to the following Smatch
> static checker warning:
> 
> 	drivers/bus/mhi/ep/main.c:1141 mhi_ep_resume_channels()
> 	warn: sleeping in atomic context
> 
> drivers/bus/mhi/ep/main.c
>     1129 void mhi_ep_resume_channels(struct mhi_ep_cntrl *mhi_cntrl)
>     1130 {
>     1131         struct mhi_ep_chan *mhi_chan;
>     1132         u32 tmp;
>     1133         int i;
>     1134 
>     1135         for (i = 0; i < mhi_cntrl->max_chan; i++) {
>     1136                 mhi_chan = &mhi_cntrl->mhi_chan[i];
>     1137 
>     1138                 if (!mhi_chan->mhi_dev)
>     1139                         continue;
>     1140 
> --> 1141                 mutex_lock(&mhi_chan->lock);
>                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
> This is called from mhi_ep_set_m0_state().  The mhi_ep_set_m0_state()
> function takes a spinlock so we can't take a mutex if we're holding a
> spinlock.
> 
> Enable CONFIG_DEBUG_ATOMIC_SLEEP for more information.
> 

Thanks Dan for the report!

Submitted a fix now: https://lore.kernel.org/mhi/20230123075049.168040-1-manivannan.sadhasivam@linaro.org/

Thanks,
Mani

> regards,
> dan carpenter
> 
> 

-- 
மணிவண்ணன் சதாசிவம்
