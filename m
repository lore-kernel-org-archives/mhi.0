Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D800B63B5
	for <mhi@lists.linux.dev>; Fri, 10 Mar 2023 12:28:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AA5EC433EF;
	Fri, 10 Mar 2023 12:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678451282;
	bh=C+nH+YcsuNlpiEZVxQFMo9/53HgGd7ErpTyhLpbYFeI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FO+Vo3YgG5NUFfiY8KWkcgXB6fJMUOZ6Tm2rgpX/qBitUSJsxRwjpwijJlfTMOKiR
	 9fnhjhGboa4y3nIeZPmSKXdi4u7NBYucCdCszwCpIBti19brkJFI2A/xycUnR9RCJ8
	 NWoZA4RKfiO1RCNH95LkDwmYLFX+XgccFxCREOUTdxF23oNVdlTXcAL0hooTHHdGRp
	 3ES631oZnI8zA2BDV+Mi0XLB0tVRwApPwF5TQfYQQFCguHSKg8LBsjpry+oSffFPtQ
	 irp5lRIkaLC2iVuf5lkGg2sP5r7hBn8A7yS6X1YUL1TMK11Ty/bW+l0GUCchMegaIm
	 N0d1Xdyx5ojYQ==
Date: Fri, 10 Mar 2023 17:57:54 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Slark Xiao <slark_xiao@163.com>, loic.poulain@linaro.org,
	fabio.porcedda@gmail.com, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Revert "Add a secondary AT
 port to Telit FN990"
Message-ID: <20230310122754.GD6838@thinkpad>
References: <20230310101715.69209-1-slark_xiao@163.com>
 <c5bc74dc-4926-9830-069a-fb30fbaf3189@linaro.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c5bc74dc-4926-9830-069a-fb30fbaf3189@linaro.org>

On Fri, Mar 10, 2023 at 02:18:23PM +0200, Dmitry Baryshkov wrote:
> On 10/03/2023 12:17, Slark Xiao wrote:
> > This reverts commit 2d5253a096c6057bbf7caa5520856dcdf7eca8bb.
> > There are 2 commits with commit message "Add a secondary AT
> > port to Telit FN990". But the last one 2d5253a096 was added
> > on Foxconn devices. Actually the second AT port of Foxconn
> > devices doesn't work in PCIe mode. And the commit message
> > mismatch with the changes. So we need to remove it.
> > 
> > Signed-off-by: Slark Xiao <slark_xiao@163.com>
> 
> Probably also:
> 
> Fixes: 2d5253a096c6 ("bus: mhi: host: pci_generic: Add a secondary AT port
> to Telit FN990")
> 

Added fixes tag and CCed stable for backporting to 6.2.

Thanks,
Mani

> > ---
> >   drivers/bus/mhi/host/pci_generic.c | 2 --
> >   1 file changed, 2 deletions(-)
> > 
> > diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> > index 6e13c43a84d1..91d02f84ba21 100644
> > --- a/drivers/bus/mhi/host/pci_generic.c
> > +++ b/drivers/bus/mhi/host/pci_generic.c
> > @@ -343,8 +343,6 @@ static const struct mhi_channel_config mhi_foxconn_sdx55_channels[] = {
> >   	MHI_CHANNEL_CONFIG_DL(13, "MBIM", 32, 0),
> >   	MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
> >   	MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
> > -	MHI_CHANNEL_CONFIG_UL(92, "DUN2", 32, 1),
> > -	MHI_CHANNEL_CONFIG_DL(93, "DUN2", 32, 1),
> >   	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0_MBIM", 128, 2),
> >   	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0_MBIM", 128, 3),
> >   };
> 
> -- 
> With best wishes
> Dmitry
> 

-- 
மணிவண்ணன் சதாசிவம்
