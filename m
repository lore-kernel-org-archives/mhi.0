Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B0E298CAF;
	Tue, 23 Jun 2026 11:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782213610; cv=none; b=oNEhtF0MBwvaChX2FddO1AOQkY2ratQFB0335X4RYokow3J7AXypTl91lX8jDaFY5/dBRyjR5uoFTB/+60tbsZ0MQ9RDrQgmWnhd79eV1OHybr/bKxg0mDMR3YlbZ2eI4Nynqm6Ga5aQWObBhJX6ObjkLALVXfcScrsb1q+dYNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782213610; c=relaxed/simple;
	bh=BWN430f2xONd3QUn+ILccVzQRiL80anxExkmZTRhO0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OkCOt1TDkKTued4GmPsJ7dE6odI5vY45/M9HatLU0V1lS7BZd7OfVJtKc0qHl59wP+z3MBu6hl6ICz8FBDBADXtTnGa2E4e1HGMEzyAI8mHwvQbiCO3sI8Z0OADnMxAEMZn2qd2f+lnOiSp2ucnBJ+mFaG+oIRm8ZND4S7vLDxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=brnq1g5p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="brnq1g5p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF7EC1F000E9;
	Tue, 23 Jun 2026 11:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782213608;
	bh=BOHOOxYzsLwc6uQ/8LFee/tjpWg6OBR4Mo13GtI8cqA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=brnq1g5p2hpJj9CAW0zOqOvE+q+wfMbWY++3LKWFn0iYiPRw2rKs+Dmgs7gEiq8l6
	 12JdjOiuBsJLKQy0Xd7mCOT8HK8TYF+LdWc2Mtoo/YAP3MFbTcYDqRMcN60SyQuxAV
	 Hco2X8N8b1KZEhGSbNW04t2P1W2jMtB2g2KuaVGII8BGthRhT1FhNWPwq5OvlL94jm
	 NzDUpon1hlzpmQOAKr81BEXfFjLTv8kClO/eJeHzLdCx7Zh14GbEH3NLs0hV+m+7AN
	 qvogQDfPkenZyard06JB8/1EpwLInnu3ZzoD/dOql00Wv6KquKDWMR4SPp9WACCZtX
	 CdbMaRn11fjqw==
Date: Tue, 23 Jun 2026 13:20:01 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/3] bus: mhi: host: clients: Add loopback driver with
 sysfs interface
Message-ID: <uprjbvbojknioyczod63ik3foy57k5gonfe6po2nhm5nov4ctk@mjwtrl3luncl>
References: <20260622-loopback_mhi-v4-0-782b3a0f2eef@oss.qualcomm.com>
 <20260622-loopback_mhi-v4-1-782b3a0f2eef@oss.qualcomm.com>
 <gwcckverwvbt7r4puj2iu2b2j36olwwu4ua4x4uthht7bfq6my@yifjh6swxisq>
 <34155623-bbb5-4801-b051-ed3ff87bcb93@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <34155623-bbb5-4801-b051-ed3ff87bcb93@oss.qualcomm.com>

On Tue, Jun 23, 2026 at 03:58:00PM +0530, Sumit Kumar wrote:
> 

[...]

> > > +static void mhi_loopback_remove(struct mhi_device *mhi_dev)
> > > +{
> > > +	struct mhi_loopback *loopback = dev_get_drvdata(&mhi_dev->dev);
> > > +
> > > +	complete(&loopback->comp);
> > > +
> > > +	mutex_lock(&loopback->lb_mutex);
> > > +	mutex_unlock(&loopback->lb_mutex);
> > What does this locking protect?
> since start_store() is holding the mutex for its entire duration,
> this lock will block until any in-progress start_store() has fully
> completed before teardown, ensuring  mhi_unprepare_from_transfer()
> does not race with an active test still accessing the channel.
> 

How can you ensure that start_store doesn't race if you unlock the mutex before
mhi_unprepare_from_transfer()? Anyway, once you remove the sysfs files here as I
suggested, you do not need to worry about the race.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
