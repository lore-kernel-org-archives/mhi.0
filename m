Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4012D23CD
	for <mhi@lists.linux.dev>; Thu, 17 Nov 2022 11:43:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3449FC433C1;
	Thu, 17 Nov 2022 11:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668685427;
	bh=xgKPqZLlA+5TY1lw/gQlp4xDwC3HaX8Anj5NcM7+ksQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d9IX4d7eD50LL8mVClfWD1wICywrMzh+btm6VU32ub1WbE/RWdJRE1VTe+RQBT7xN
	 LfSfwAbF8tNGEC1WRqmXNo7+KV1yg1me2kO/VyZ9G58OwwQu73WTmRxm0GYFNf2Mx8
	 Sq0QQLh95a3Uk2AezAQWCQVn+LQg8HM3AmFt4OvRUGihVJBs/c4jZXNxh6De+rDtut
	 F3GIiC9ru2f+YyTPCfXaZR0vLIyeawHZN8I2QPpc5kz5Ykk7TktQBPebzBEifgjZBA
	 fOlQIqPvYTR24puShvqMvyYpAL0hc2OE3AOJo5EG82h8wRPzOBWLqhXX96NIa4qaLN
	 72q60AbRVTDxg==
Date: Thu, 17 Nov 2022 17:13:36 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Qiang Yu <quic_qianyu@quicinc.com>
Cc: mani@kernel.org, loic.poulain@linaro.org, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_cang@quicinc.com, mrana@quicinc.com
Subject: Re: [PATCH v3] bus: mhi: host: Disable preemption while processing
 data events
Message-ID: <20221117114336.GC93179@thinkpad>
References: <1668479031-12853-1-git-send-email-quic_qianyu@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1668479031-12853-1-git-send-email-quic_qianyu@quicinc.com>

On Tue, Nov 15, 2022 at 10:23:51AM +0800, Qiang Yu wrote:
> If data processing of an event is scheduled out because core
> is busy handling multiple irqs, this can starve the processing
> of MHI M0 state change event on another core. Fix this issue by
> disabling irq on the core processing data events.
> 
> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>

I'm counting on Jeff's review for this patch.

Thanks,
Mani

> ---
> v2->v3: modify the comment
> v1->v2: add comments about why we disable local irq
> 
>  drivers/bus/mhi/host/main.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
> index f3aef77a..5dca0a0 100644
> --- a/drivers/bus/mhi/host/main.c
> +++ b/drivers/bus/mhi/host/main.c
> @@ -1027,13 +1027,20 @@ int mhi_process_data_event_ring(struct mhi_controller *mhi_cntrl,
>  
>  void mhi_ev_task(unsigned long data)
>  {
> +	unsigned long flags;
>  	struct mhi_event *mhi_event = (struct mhi_event *)data;
>  	struct mhi_controller *mhi_cntrl = mhi_event->mhi_cntrl;
>  
>  	/* process all pending events */
> -	spin_lock_bh(&mhi_event->lock);
> +	spin_lock_irqsave(&mhi_event->lock, flags);
> +	/*
> +	 * When multiple IRQs come, the tasklet will be scheduled out with event ring lock
> +	 * remaining acquired, causing M0 event process on another core gets stuck when it
> +	 * tries to acquire the same event ring lock. Thus, let's disable local IRQs here.
> +	 */
> +
>  	mhi_event->process_event(mhi_cntrl, mhi_event, U32_MAX);
> -	spin_unlock_bh(&mhi_event->lock);
> +	spin_unlock_irqrestore(&mhi_event->lock, flags);
>  }
>  
>  void mhi_ctrl_ev_task(unsigned long data)
> -- 
> 2.7.4
> 
> 

-- 
மணிவண்ணன் சதாசிவம்
