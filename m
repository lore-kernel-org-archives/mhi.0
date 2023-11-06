Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62EB92104
	for <mhi@lists.linux.dev>; Mon,  6 Nov 2023 04:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cqOrrjDY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C83BC433C7;
	Mon,  6 Nov 2023 04:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699246285;
	bh=rySQffP2NQSfe8P6PjPcJtxJpIx3FMaahWg+eEcTVRY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cqOrrjDYWjgU06y+Om+9Tr8F3s1IrKw+AX0vwGeez7F1LD7CfpKDGjgaBRdr0piOW
	 w2lr4mMv7460Mo+rDBqGO4a8/eunMGqZoLCN/LGqzO7L+XLsjspBZsq/+lNgYo4A3j
	 VAtGhDGJFalXR+Nsa68Bgv2hkgpN2EmIBEpXaqwXNW4VijmVzxYKrs8lEkpccZSoLe
	 xKXOWnox/vzIuCyH2snHWfe9YazB/RX4UinKjbXZSTzg/kG3ZHPpo5KS6DmSRWsftD
	 oxPy7PDDild10TR2+wnQPtv864ydxYdmG36uj9dn0etagsrT2Y+X78HLy/Q+13FoRY
	 aQ7+qC20ryVMg==
Date: Mon, 6 Nov 2023 10:21:19 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: Qiang Yu <quic_qianyu@quicinc.com>, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_cang@quicinc.com, quic_mrana@quicinc.com
Subject: Re: [PATCH v2 1/2] bus: mhi: host: Add spinlock to protect WP access
 when queueing TREs
Message-ID: <20231106045119.GB2474@thinkpad>
References: <1694594861-12691-1-git-send-email-quic_qianyu@quicinc.com>
 <1694594861-12691-2-git-send-email-quic_qianyu@quicinc.com>
 <af4fc816-d75b-997d-6d37-a774f5eb96ae@quicinc.com>
 <dfeb6071-8ae4-38ba-5273-59478ea8e178@quicinc.com>
 <c30c9c68-bfe1-0cc5-c511-218f7d1da92d@quicinc.com>
 <15526b95-518c-445a-be64-6a15259405fb@quicinc.com>
 <472817a7-78bb-25d9-b8c6-2d70f713b7fb@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <472817a7-78bb-25d9-b8c6-2d70f713b7fb@quicinc.com>

On Fri, Oct 20, 2023 at 09:07:35AM -0600, Jeffrey Hugo wrote:
> On 10/16/2023 2:46 AM, Qiang Yu wrote:
> > 
> > On 9/29/2023 11:22 PM, Jeffrey Hugo wrote:
> > > On 9/24/2023 9:10 PM, Qiang Yu wrote:
> > > > 
> > > > On 9/22/2023 10:44 PM, Jeffrey Hugo wrote:
> > > > > On 9/13/2023 2:47 AM, Qiang Yu wrote:
> > > > > > From: Bhaumik Bhatt <bbhatt@codeaurora.org>
> > > > > > 
> > > > > > Protect WP accesses such that multiple threads queueing buffers for
> > > > > > incoming data do not race and access the same WP twice.
> > > > > > Ensure read and
> > > > > > write locks for the channel are not taken in succession
> > > > > > by dropping the
> > > > > > read lock from parse_xfer_event() such that a callback given to client
> > > > > > can potentially queue buffers and acquire the write lock
> > > > > > in that process.
> > > > > > Any queueing of buffers should be done without channel
> > > > > > read lock acquired
> > > > > > as it can result in multiple locks and a soft lockup.
> > > > > > 
> > > > > > Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> > > > > > Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
> > > > > > ---
> > > > > >   drivers/bus/mhi/host/main.c | 11 ++++++++++-
> > > > > >   1 file changed, 10 insertions(+), 1 deletion(-)
> > > > > > 
> > > > > > diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
> > > > > > index dcf627b..13c4b89 100644
> > > > > > --- a/drivers/bus/mhi/host/main.c
> > > > > > +++ b/drivers/bus/mhi/host/main.c
> > > > > > @@ -642,6 +642,7 @@ static int parse_xfer_event(struct
> > > > > > mhi_controller *mhi_cntrl,
> > > > > >               mhi_del_ring_element(mhi_cntrl, tre_ring);
> > > > > >               local_rp = tre_ring->rp;
> > > > > >   +            read_unlock_bh(&mhi_chan->lock);
> > > > > 
> > > > > This doesn't work due to the
> > > > > write_lock_irqsave(&mhi_chan->lock, flags); on line 591.
> > > > Write_lock_irqsave(&mhi_chan->lock, flags) is used in case of
> > > > ev_code >= MHI_EV_CC_OOB. We only read_lock/read_unlock the
> > > > mhi_chan while ev_code < MHI_EV_CC_OOB.
> > > 
> > > Sorry.  OOB != EOB
> > > 
> > > > > 
> > > > > I really don't like that we are unlocking the mhi_chan while
> > > > > still using it.  It opens up a window where the mhi_chan
> > > > > state can be updated between here and the client using the
> > > > > callback to queue a buf.
> > > > > 
> > > > > Perhaps we need a new lock that just protects the wp, and
> > > > > needs to be only grabbed while mhi_chan->lock is held?
> > > > 
> > > > Since we have employed mhi_chan lock to protect the channel and
> > > > what we are concerned here is that client may queue buf to a
> > > > disabled or stopped channel, can we check channel state after
> > > > getting mhi_chan->lock like line 595.
> > > > 
> > > > We can add the check after getting write lock in mhi_gen_tre()
> > > > and after getting read lock again here.
> > > 
> > > I'm not sure that is sufficient.  After you unlock to notify the
> > > client, MHI is going to manipulate the packet count and runtime_pm
> > > without the lock (648-652).  It seems like that adds additional
> > > races which won't be covered by the additional check you propose.
> > 
> > I don't think read_lock_bh(&mhi_chan->lock) can protect runtime_pm and
> > the packet count here. Even if we do not unlock, mhi state and packet
> > count can still be changed because we did not get pm_lock here, which is
> > used in all mhi state transition function.
> > 
> > I also checked all places that mhi_chan->lock is grabbed, did not see
> > packet count and runtime_pm be protected by write_lock(&mhi_chan->lock).
> > 
> > 
> > If you really don't like the unlock operation, we can also take a new
> > lock. But I think we only need to add the new lock in two places,
> > mhi_gen_tre and mhi_pm_m0_transition while mhi_chan->lock is held.
> 
> Mani, if I recall correctly, you were the architect of the locking.  Do you
> have an opinion?
> 

TBH, the locking situation is a mess with MHI. Initially, we happen to have
separate locks for protecting various operations, but then during review, it was
advised to reuse existing locks and avoid having too many separate locks.

This worked well but then we kind of abused the locks over time. I asked Hemant
and Bhaumik to audit the locks and fix them, but both of them left Qcom.

So in this situation, the intent of the pm_lock was to protect concurrent access
against updating the pm_state. And it also happen to protect _other_things_ such
as runtime_put, pending_pkts etc... But not properly, because most of the time
read lock is taken in places where pm_state is being read. So there is still a
possibility of race while accessing these _other_things_.

For this patch, I'm happy with dropping chan->lock before calling xfer_cb() and
I want someone (maybe Qiang) to do the audit of locking in general and come up
with fixes where needed.

- Mani
-- 
மணிவண்ணன் சதாசிவம்
