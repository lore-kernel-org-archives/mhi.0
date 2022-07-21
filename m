Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D99291C
	for <mhi@lists.linux.dev>; Thu, 21 Jul 2022 11:24:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC544C3411E;
	Thu, 21 Jul 2022 11:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658402643;
	bh=+dJJG/Fz6PNcC2CDlBQWkdUmE3PRlfKqkXqAIbwf1qs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ev4AEEhiYwhgnUj4NSRQbF00ZpzPaVoz/yfDFPRpacLC32tByaHfCFGt/IbAyvcc3
	 PYRlxggKLohTE0RBoC9dEvlILl7IPT7+dwpxe1VUd2dxVeE7Vih/bBig9/yog7LW4B
	 W5HhaqNTAMLqB/TlwGw3Cn7PtMFOt667mI/N12e6wIVtEHOQiKMhuIVMymsNucfwk1
	 JXwauIStNSFjUPCaiacUg6M61wu06I7sQVXUIeJ4/4pUWaybftxUDDdsu3iZIN+fQe
	 wsM6IfZr8fduChlpH/skV9TO8D+zALxvzE+79t+/SU8g6lDnakaUwtklOmZpDkRJij
	 Htbx+4PDa1x4A==
Date: Thu, 21 Jul 2022 16:53:48 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Qiang Yu <quic_qianyu@quicinc.com>
Cc: quic_hemantk@quicinc.com, loic.poulain@linaro.org,
	quic_jhugo@quicinc.com, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_cang@quicinc.com
Subject: Re: [PATCH v2 1/1] bus: mhi: host: Fix up null pointer access in
 mhi_irq_handler
Message-ID: <20220721112348.GD36189@thinkpad>
References: <1658369754-87005-1-git-send-email-quic_qianyu@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1658369754-87005-1-git-send-email-quic_qianyu@quicinc.com>

On Thu, Jul 21, 2022 at 10:15:54AM +0800, Qiang Yu wrote:
> The irq handler for a shared IRQ ought to be prepared for running
> even now it's being freed. So let's check the pointer used by
> mhi_irq_handler to avoid null pointer access since it is probably
> released before freeing IRQ.
> 
> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
> ---
> v1->v2: change dev_err to dev_dbg
> 
>  drivers/bus/mhi/host/main.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
> index f3aef77a..25ea1f8 100644
> --- a/drivers/bus/mhi/host/main.c
> +++ b/drivers/bus/mhi/host/main.c
> @@ -430,12 +430,20 @@ irqreturn_t mhi_irq_handler(int irq_number, void *dev)
>  {
>  	struct mhi_event *mhi_event = dev;
>  	struct mhi_controller *mhi_cntrl = mhi_event->mhi_cntrl;
> -	struct mhi_event_ctxt *er_ctxt =
> -		&mhi_cntrl->mhi_ctxt->er_ctxt[mhi_event->er_index];
> +	struct mhi_event_ctxt *er_ctxt;
>  	struct mhi_ring *ev_ring = &mhi_event->ring;
> -	dma_addr_t ptr = le64_to_cpu(er_ctxt->rp);
> +	dma_addr_t ptr;
>  	void *dev_rp;
>  

It'd be good to add a comment here on why we are checking for the NULL pointer.
Something like,

"If CONFIG_DEBUG_SHIRQ is set, the IRQ handler will get invoked during
__free_irq() and by that time mhi_ctxt() would've freed. So check for the
existence of mhi_ctxt before handling the IRQs."

Thanks,
Mani

> +	if (!mhi_cntrl->mhi_ctxt) {
> +		dev_dbg(&mhi_cntrl->mhi_dev->dev,
> +			"mhi_ctxt has been freed\n");
> +		return IRQ_HANDLED;
> +	}
> +
> +	er_ctxt = &mhi_cntrl->mhi_ctxt->er_ctxt[mhi_event->er_index];
> +	ptr = le64_to_cpu(er_ctxt->rp);
> +
>  	if (!is_valid_ring_ptr(ev_ring, ptr)) {
>  		dev_err(&mhi_cntrl->mhi_dev->dev,
>  			"Event ring rp points outside of the event ring\n");
> -- 
> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.
> 

-- 
மணிவண்ணன் சதாசிவம்
