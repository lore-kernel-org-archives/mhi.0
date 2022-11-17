Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C25623CD
	for <mhi@lists.linux.dev>; Thu, 17 Nov 2022 11:49:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EEB5C433D6;
	Thu, 17 Nov 2022 11:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668685774;
	bh=vwbbKbLlsfVOCis5WYItUBnfNowseUKkUd9wdym+97k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xfg9p7NdeqvBWxIl5GO+J6vVDTAtp+iqstPTx01DKyOUeAERj3Pr662Tczj5NzNg3
	 +Ssvt6DV38ZyUREj3nL+SjyWzPwbEvf+qAGVnRlYaj+QtO11mtgpDsw443uSilOHKW
	 J6A6QZmGSqtpQq2KUMwHW7634SH1ql2LBJXpKl8M4RwVGFJIlTKv8NB7g+AqgGwIVj
	 /YnLdunhrU15rSLuoWpih/OS4K6kWOh0BYJKJSo7Vx5fAHsewGYDu1yD1Qten7Z5cj
	 ire2KX80HmjWPhbIE9sx9RJVaNH3IvbvPcx87hGoCB2zCZszy1BrS5MbfiyQkbHtzI
	 PSFywd7Q1WnpA==
Date: Thu, 17 Nov 2022 17:19:23 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Qiang Yu <quic_qianyu@quicinc.com>
Cc: mani@kernel.org, loic.poulain@linaro.org, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_cang@quicinc.com, mrana@quicinc.com
Subject: Re: [PATCH v3] bus: mhi: host: Disable preemption while processing
 data events
Message-ID: <20221117114923.GD93179@thinkpad>
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

Reverse X-Mas tree order please. Move this definition to the last.

>  	struct mhi_event *mhi_event = (struct mhi_event *)data;
>  	struct mhi_controller *mhi_cntrl = mhi_event->mhi_cntrl;
>  
>  	/* process all pending events */
> -	spin_lock_bh(&mhi_event->lock);
> +	spin_lock_irqsave(&mhi_event->lock, flags);
> +	/*
> +	 * When multiple IRQs come, the tasklet will be scheduled out with event ring lock

s/come/arrive

> +	 * remaining acquired, causing M0 event process on another core gets stuck when it

s/remaining//

"causing other high priority events like M0 state transition getting stuck
while trying to acquire the same event ring lock."

> +	 * tries to acquire the same event ring lock. Thus, let's disable local IRQs here.
> +	 */

This comment should be placed above spin_lock_irqsave().

The comment "process all pending events" can be moved here.

Thanks,
Mani

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
