Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E397963B5
	for <mhi@lists.linux.dev>; Fri, 10 Mar 2023 12:02:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97A34C433D2;
	Fri, 10 Mar 2023 12:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678449735;
	bh=8DW/LYgCUONCctCnDq4qvjU4rdTwW+KdDdND0ium5HI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fZl6N5bDfdbh6CPz85FEB6qbTu6Q7lOXXLptgxaiNH3G7i6a4gZn4rcr+WUJ8zzfv
	 UfSAtEW1lb3I/cC6fZ68b65Krs6uBQW360w6uYLRJwbl82vn/rd5nejjzTMOSivJBw
	 A1sPZA2Qb5ale9462b3nypNpkAInDPOl9mfl5X88V5QPgiFVIqHE6ELYz8lBoNSaZ/
	 /u+h2V3UC0pAYYX+Ak8cwnTrxLE4ufIgTnnVHQvEeIpfp90cFTQrqLZSBOjr/nf61C
	 CYsWgvfrOak/DoO6G2tozKa1/K54PUqfueD7SEC9W7JgnIzysZ0u08Nf1iLcpmKKs3
	 ETURGC2UF2wAQ==
Date: Fri, 10 Mar 2023 17:32:09 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Fabio Porcedda <fabio.porcedda@gmail.com>
Cc: Slark Xiao <slark_xiao@163.com>, loic.poulain@linaro.org,
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Revert "Add a secondary AT
 port to Telit FN990"
Message-ID: <20230310120209.GB6838@thinkpad>
References: <20230310101715.69209-1-slark_xiao@163.com>
 <20230310103126.GA6838@thinkpad>
 <CAHkwnC_S_qPOfkoJ-uZ7GNW4J26AXik=33f2=uMfw72yFOFXLg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHkwnC_S_qPOfkoJ-uZ7GNW4J26AXik=33f2=uMfw72yFOFXLg@mail.gmail.com>

On Fri, Mar 10, 2023 at 11:33:56AM +0100, Fabio Porcedda wrote:
> Il giorno ven 10 mar 2023 alle ore 11:31 Manivannan Sadhasivam
> <mani@kernel.org> ha scritto:
> >
> > On Fri, Mar 10, 2023 at 06:17:15PM +0800, Slark Xiao wrote:
> > > This reverts commit 2d5253a096c6057bbf7caa5520856dcdf7eca8bb.
> > > There are 2 commits with commit message "Add a secondary AT
> > > port to Telit FN990". But the last one 2d5253a096 was added
> >
> > Btw, we usually refer the commit SHA by 12 digits. Like, 2d5253a096c6.
> > I can fix it up while applying.
> >
> > > on Foxconn devices. Actually the second AT port of Foxconn
> > > devices doesn't work in PCIe mode. And the commit message
> > > mismatch with the changes. So we need to remove it.
> > >
> >
> > Sigh... the subject itself was wrong :( thanks for catching.
> >
> > > Signed-off-by: Slark Xiao <slark_xiao@163.com>
> >
> > For future Foxconn patches, please help with the review to catch issues like
> > this. Unfortunately, I do not own any Foxconn modems :/
> >
> > Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> 
> Reviewed-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> 
> Just to clarify, the original patch change just the Telit FN990:
> https://lore.kernel.org/netdev/CAMZdPi8gGrbkKnDR+WLadF92shJbwH-ksQY+dbpgfZ21iAp9ug@mail.gmail.com/
> 
> The problem is caused by the fact that it was merged two times and the
> second time was merged wrongly.
> The correct one is commit 479aa3b0ec2e000ac99dd0661936d9685d6cac64 and
> the wrong one is 2d5253a096c6057bbf7caa5520856dcdf7eca8bb.
> 

Ah, so the patch was merged into netdev first and then through MHI, then git
ended up with a resolution :(

Thanks,
Mani 

> BR
> Fabio
> 
> > Thanks,
> > Mani
> >
> > > ---
> > >  drivers/bus/mhi/host/pci_generic.c | 2 --
> > >  1 file changed, 2 deletions(-)
> > >
> > > diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> > > index 6e13c43a84d1..91d02f84ba21 100644
> > > --- a/drivers/bus/mhi/host/pci_generic.c
> > > +++ b/drivers/bus/mhi/host/pci_generic.c
> > > @@ -343,8 +343,6 @@ static const struct mhi_channel_config mhi_foxconn_sdx55_channels[] = {
> > >       MHI_CHANNEL_CONFIG_DL(13, "MBIM", 32, 0),
> > >       MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
> > >       MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
> > > -     MHI_CHANNEL_CONFIG_UL(92, "DUN2", 32, 1),
> > > -     MHI_CHANNEL_CONFIG_DL(93, "DUN2", 32, 1),
> > >       MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0_MBIM", 128, 2),
> > >       MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0_MBIM", 128, 3),
> > >  };
> > > --
> > > 2.34.1
> > >
> >
> > --
> > மணிவண்ணன் சதாசிவம்
> 
> 
> 
> -- 
> Fabio Porcedda

-- 
மணிவண்ணன் சதாசிவம்
