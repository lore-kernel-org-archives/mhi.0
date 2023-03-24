Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FEB86118
	for <mhi@lists.linux.dev>; Fri, 24 Mar 2023 14:23:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05C8EC433D2;
	Fri, 24 Mar 2023 14:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679667787;
	bh=ByUS8ixdKw9ZOUXU671IFgLj5lR9S0HYOJEGGrPdIBk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s9Zv+2ZlLctru7hz2kVhdsiAvX+YYpdRGP5PLecwt17Z2m9yR/0WPRMrgXInzH7Dl
	 rujAt6ladQADe+s5rrzxZb3DktzXItf/vN955TBu14onwZsxHig1SXb9GExUilKMvl
	 HlWJ2SDi4ByhXCHIeCConJjino6Zk8GzctIAF+c71HN8oGb93qoRJzInD8FJxKqWMF
	 W/OLOtumeU+vPbVuyCadxySEURGItTF6C/gHXRjQtL/QxXLZisg2sOy9Q6BctnuU8f
	 iwP8RONf2yR535vViKnoYt/NaAB5CwoVP5MPvNlAzYNx8VAKzU2+b8QZPuGLelw9Ta
	 UoeTD9lE8KxpQ==
Date: Fri, 24 Mar 2023 19:52:55 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: host: Range check CHDBOFF and ERDBOFF
Message-ID: <20230324142255.GD4259@thinkpad>
References: <1679066059-8399-1-git-send-email-quic_jhugo@quicinc.com>
 <20230324103452.GC4259@thinkpad>
 <11ea2552-27e1-3665-869c-4594de1782a5@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <11ea2552-27e1-3665-869c-4594de1782a5@quicinc.com>

On Fri, Mar 24, 2023 at 07:50:01AM -0600, Jeffrey Hugo wrote:
> On 3/24/2023 4:34 AM, Manivannan Sadhasivam wrote:
> > On Fri, Mar 17, 2023 at 09:14:19AM -0600, Jeffrey Hugo wrote:
> > > If the value read from the CHDBOFF and ERDBOFF registers is outside the
> > > range of the MHI register space then an invalid address might be computed
> > > which later causes a kernel panic.  Range check the read value to prevent
> > > a crash due to bad data from the device.
> > > 
> > > Fixes: 6cd330ae76ff ("bus: mhi: core: Add support for ringing channel/event ring doorbells")
> > 
> > Please CC stable list.
> 
> The stable folks have been automatically picking up everything with a fixes
> tag for years.  CCing the stable list does not seem to do anything unless
> the patch needs specific backporting adjustments.
> 
> Do you still want an explicit CC?
> 

That was the impression I had but Greg wanted us to explicitly CC stable list
and add a hint about how deep the patch needs to be applied.

> > 
> > > Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> > > Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> > > ---
> > >   drivers/bus/mhi/host/init.c | 12 ++++++++++++
> > >   1 file changed, 12 insertions(+)
> > > 
> > > diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
> > > index 3d779ee..ae8ebcfb 100644
> > > --- a/drivers/bus/mhi/host/init.c
> > > +++ b/drivers/bus/mhi/host/init.c
> > > @@ -516,6 +516,12 @@ int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
> > >   		return -EIO;
> > >   	}
> > > +	if (val >= mhi_cntrl->reg_len - (8 * MHI_DEV_WAKE_DB)) {
> > > +		dev_err(dev, "CHDB offset: 0x%x is out of range: 0x%zx\n",
> > > +			val, mhi_cntrl->reg_len - (8 * MHI_DEV_WAKE_DB));
> > > +		return -EINVAL;
> > 
> > Isn't -ERANGE a better errno here and also in other places of the driver?
> 
> I suppose that could work.  This was modeled after the existing BHI (eg
> BHIOFF) range checks.  You want those updated in the same change or a
> separate one?
> 

That can go into a separate change.

Thanks,
Mani

> > Thanks,
> > Mani
> > 
> > > +	}
> > > +
> > >   	/* Setup wake db */
> > >   	mhi_cntrl->wake_db = base + val + (8 * MHI_DEV_WAKE_DB);
> > >   	mhi_cntrl->wake_set = false;
> > > @@ -532,6 +538,12 @@ int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
> > >   		return -EIO;
> > >   	}
> > > +	if (val >= mhi_cntrl->reg_len - (8 * mhi_cntrl->total_ev_rings)) {
> > > +		dev_err(dev, "ERDB offset: 0x%x is out of range: 0x%zx\n",
> > > +			val, mhi_cntrl->reg_len - (8 * mhi_cntrl->total_ev_rings));
> > > +		return -EINVAL;
> > > +	}
> > > +
> > >   	/* Setup event db address for each ev_ring */
> > >   	mhi_event = mhi_cntrl->mhi_event;
> > >   	for (i = 0; i < mhi_cntrl->total_ev_rings; i++, val += 8, mhi_event++) {
> > > -- 
> > > 2.7.4
> > > 
> > > 
> > 
> 

-- 
மணிவண்ணன் சதாசிவம்
