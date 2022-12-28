Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7580E1C08
	for <mhi@lists.linux.dev>; Wed, 28 Dec 2022 16:35:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84B5DC433EF;
	Wed, 28 Dec 2022 16:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672245339;
	bh=1wovFQPRyTT0z/Wc0dbWD71k8XyyUm2vZt3lLxUQ954=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iWTvtg4mZuTDpQ5PgIUtt4GjPywT3kPiTAPmU35HTIKHfjGK9zZUrhX+UKdNG761V
	 K8rwxbERWwTyYvHEfLwP3VbO26fqjNrdtyXXMaZMBU82nJRgD0pDJGUoqL8YPY6atl
	 3mkLuX0AhGXNl2P3/5y5A07rqGPgPbGW/MUs5S2VJ1edXXrQ/1dqUDd+00EFDhS3by
	 mtj+yY2Ngu3zF4mfpXpMFrLqZ4cDEyWmEnyJ5iPjpP+ZM3HeLTSJkzIy09wya76i17
	 FlyHTlw2VQ7LltuKO9iZOKK4zfn6VtLwqjSgGOQ4wudWLap63pCWmp1DzaULDCJFgF
	 lg7YTuR6R+Hsw==
Date: Wed, 28 Dec 2022 22:05:26 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: Qiang Yu <quic_qianyu@quicinc.com>, loic.poulain@linaro.org,
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_cang@quicinc.com,
	mrana@quicinc.com
Subject: Re: [PATCH v4] bus: mhi: host: Disable preemption while processing
 data events
Message-ID: <20221228163526.GF30143@thinkpad>
References: <1669023264-84125-1-git-send-email-quic_qianyu@quicinc.com>
 <35752702-1ae2-126f-9237-a2f24c3bc3de@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <35752702-1ae2-126f-9237-a2f24c3bc3de@quicinc.com>

On Mon, Nov 21, 2022 at 10:48:54PM -0700, Jeffrey Hugo wrote:
> On 11/21/2022 2:34 AM, Qiang Yu wrote:
> > If data processing of an event is scheduled out because core
> > is busy handling multiple irqs, this can starve the processing
> > of MHI M0 state change event on another core. Fix this issue by
> > disabling irq on the core processing data events.
> > 
> > Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
> 
> I've been pondering this off and on since it's been proposed.
> 
> This solution will break the described deadlock, but I don't like it.
> 
> What I really don't like is that this is selfish.  We already preempt
> anything else on the CPU that isn't a hard IRQ because we are using a
> tasklet (which is deprecated, see include/linux/interrupt.h).  Now we are
> going to essentially preempt IRQs as well by preventing them from being
> serviced.  So, now the CPU is essentially dedicated to processing MHI
> events.  It seems selfish to say that MHI is the most important thing on a
> particular CPU.
> 
> This can have a huge effect on system behavior.  If say the ssh IRQ is
> assigned to the same CPU, and we block that CPU long enough, then it will
> appear to the user as if the ssh connection has frozen.  I've witnessed this
> occur with other drivers.
> 
> How long can we block the CPU?  According to the code, pretty much for an
> unlimited amount of time.  If the tasklet is processing
> mhi_process_data_event_ring(), then we can process U32_MAX events before
> throttling (which might as well be unlimited).  If the tasklet is processing
> mhi_process_ctrl_ev_ring() then there is no throttling.
> 
> I'm thinking it would be better of the IRQ handling was refactored to use
> threaded interrupts.  The thread is an actual process, so it could move to
> another CPU.  It is also FIFO priority, so it basically will preempt
> everything but hard IRQs and soft IRQs (eg tasklets).  The downside of a
> tasklet is that it is bound to the scheduling CPU, which in our case is the
> CPU servicing the IRQ, and more than a few systems tend to load the majority
> of the IRQs to CPU0.
> 

This sounds like a plausible solution.

> I'm not going to go refactor the IRQ code at this time.  This looks like an
> issue that is actually observed based on how it was reported, so it likely
> should be addressed.  I'm not happy with this solution, but I don't have an
> alternative at this time.
> 
> Mani, up to you if you want to pick this up.  I'm not nack'ing it.
> Technically I've reviewed it, but I'd say I'm "on the fence" about if this
> really should be accepted.  I can't say there is a flaw in the logic, but I
> don't feel good about this.
> 

I do agree with you.

Qiang, can you please look into Jeff's suggestion on fixing this performance
issue?

Thanks,
Mani

> > ---
> > v3->v4: modify the comment
> > v2->v3: modify the comment
> > v1->v2: add comments about why we disable local irq
> > 
> >   drivers/bus/mhi/host/main.c | 10 ++++++++--
> >   1 file changed, 8 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
> > index f3aef77a..6c804c3 100644
> > --- a/drivers/bus/mhi/host/main.c
> > +++ b/drivers/bus/mhi/host/main.c
> > @@ -1029,11 +1029,17 @@ void mhi_ev_task(unsigned long data)
> >   {
> >   	struct mhi_event *mhi_event = (struct mhi_event *)data;
> >   	struct mhi_controller *mhi_cntrl = mhi_event->mhi_cntrl;
> > +	unsigned long flags;
> > +	/*
> > +	 * When multiple IRQs arrive, the tasklet will be scheduled out with event ring lock
> > +	 * acquired, causing other high priority events like M0 state transition getting stuck
> > +	 * while trying to acquire the same event ring lock. Thus, let's disable local IRQs here.
> > +	 */
> > +	spin_lock_irqsave(&mhi_event->lock, flags);
> >   	/* process all pending events */
> > -	spin_lock_bh(&mhi_event->lock);
> >   	mhi_event->process_event(mhi_cntrl, mhi_event, U32_MAX);
> > -	spin_unlock_bh(&mhi_event->lock);
> > +	spin_unlock_irqrestore(&mhi_event->lock, flags);
> >   }
> >   void mhi_ctrl_ev_task(unsigned long data)
> 

-- 
மணிவண்ணன் சதாசிவம்
