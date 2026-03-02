Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD0C3376A9;
	Mon,  2 Mar 2026 09:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772442097; cv=none; b=FNPccRUoZdnMMhWP7hEA4jm6jy3IEJWUPS8CEpeH5f9lsWrd3pE1GdNqnR1KG8fCOYlPtChnxanjUXwDLTJAn6Kz5IMeGnDO4qFZ+sy+KiZ6Do2b83SuKnu3+LcTwxIRvYzvpSVFzyn6EWt02ID16i7yXb1gS+AFkefqt7hyWR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772442097; c=relaxed/simple;
	bh=Q5AhbmlTjf+Zxcabh3OWPfjJlGLKMLNIR1YK4h6bMo8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nPbbmLheEZ3Fjxp2gGUzZy+xBG9gF+9sShfz6QjP0KspagTGQdJ41th4rx3uKWNKfQPF4RFvuU5IX8PFl0gg/N4XHoAHrBk2uOlv7Ra1U8hYB0M9ZmDB6k79TMonQYbQ3z690xl9zSGxOLxtbCwJlq6LcKwC/PirXUOYxVSYmFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DqDn5yZh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DqDn5yZh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 093F7C19423;
	Mon,  2 Mar 2026 09:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772442097;
	bh=Q5AhbmlTjf+Zxcabh3OWPfjJlGLKMLNIR1YK4h6bMo8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DqDn5yZhMmJn4pIq6F8yUVqZIZ5y+fOOrPraiNfelD9OLraZ/+Kh865/57aT0UuSz
	 NzApiq2pbq8LcEWBZtvhkfCLBYDkl1nq+y50htjimssn0VvEqh2A/doxbB6dprwp8h
	 N1Gtgze/lqfnb9i101y917qVuah3yeJlW0cOwUq5x8NW/phe0JVWmNpZlisi6hihcs
	 +5Tn9b4hzeAxjtVHDID3dWdg36ooNgOc6znPP4XNDjEMXVeq0J39sBkr2a3vGkHwag
	 GwgF/Zy1XqaYOTfWc8ceELbvLIYDxM6mbYR+BbqSkIvAHyYIcISfNTJ7tzz0FqhEAg
	 gfh7NU6YdhoDg==
Date: Mon, 2 Mar 2026 14:31:24 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Cc: Alex Elder <elder@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Veerabhadrarao Badiganti <veerabhadrarao.badiganti@oss.qualcomm.com>, 
	Subramanian Ananthanarayanan <subramanian.ananthanarayanan@oss.qualcomm.com>, Akhil Vinod <akhil.vinod@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] bus: mhi: ep: Fix potential deadlock in
 mhi_ep_reset_worker()
Message-ID: <ma3chadfmnseacgsjzve3aascg7cpnkdj2kttkkdtrfoxdvllw@vc6qy5nsnufk>
References: <20260203-reset_worker_deadlock-v1-0-7ed889b5bf19@oss.qualcomm.com>
 <20260203-reset_worker_deadlock-v1-1-7ed889b5bf19@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260203-reset_worker_deadlock-v1-1-7ed889b5bf19@oss.qualcomm.com>

On Tue, Feb 03, 2026 at 12:25:01PM +0530, Sumit Kumar wrote:
> There is a potential deadlock scenario in mhi_ep_reset_worker() where
> the state_lock mutex is acquired twice in the same call chain:
> 
> mhi_ep_reset_worker()
>   mutex_lock(&mhi_cntrl->state_lock)
>     mhi_ep_power_up()
>       mhi_ep_set_ready_state()
>         mutex_lock(&mhi_cntrl->state_lock)  <- Deadlock
> 
> Fix this by releasing the state_lock before calling mhi_ep_power_up().
> The lock is only needed to protect current MHI state read operation. The
> lock can be safely released before proceeding with the power up sequence.
> 

While inspecting the code, I also found one instance where
mhi_ep_handle_syserr() was not locked. I've sent a patch to fix it. Please spare
some time to test it and give a tested-by tag.

> Fixes: 7a97b6b47353 ("bus: mhi: ep: Add support for handling MHI_RESET")
> Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
> ---
>  drivers/bus/mhi/ep/main.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
> index cdea24e9291959ae0a92487c1b9698dc8164d2f1..73597de373ef7e0c428bcbc126d63a9a97f95144 100644
> --- a/drivers/bus/mhi/ep/main.c
> +++ b/drivers/bus/mhi/ep/main.c
> @@ -1093,6 +1093,7 @@ static void mhi_ep_reset_worker(struct work_struct *work)
>  	mhi_ep_mmio_reset(mhi_cntrl);

You can also perform locking after mhi_ep_mmio_reset(). There is no need to
protect mhi_ep_mmio_reset().

- Mani

-- 
மணிவண்ணன் சதாசிவம்
