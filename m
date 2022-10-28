Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B3A2916
	for <mhi@lists.linux.dev>; Fri, 28 Oct 2022 16:54:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD04EC433B5;
	Fri, 28 Oct 2022 16:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666976051;
	bh=CagHt1YKwrFPw9NQtg1cErC7qHaLnYF/pJpMHFrobgY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YZCvVBy+vDkYlZMf/7/EGEMNXjyy3syl32922bEgQN1M1C36tEVngOnb1IlPUKXaY
	 wSHlRtWrfGlshaalXeNuf9OC1wFi91GF/zFU8FRIIteQwV4XBD8vvDnUdDRZCdBr8Z
	 UluKjSLTSKuB8OA2wNwxNwaSEDwO6iZALGwhE/z3DxBY7cgJBIwCDojZ7A32ChZPm2
	 1uj+y0rIstBtFf3KBnLeIoxLOljEtHgTP6eP4zlIL9ZUIgHHzAX+BMJ2Riqn8SMFr+
	 HBlQqwfiL2UeHMVKCe9JZBueFJtrk48+E43D/o+CetvRJwTvVTEGSP+gQ5bAhXJNCH
	 RIBOi4AOUoGYQ==
Date: Fri, 28 Oct 2022 22:24:01 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Qiang Yu <quic_qianyu@quicinc.com>
Cc: mani@kernel.org, loic.poulain@linaro.org, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_cang@quicinc.com, mrana@quicinc.com
Subject: Re: [PATCH v2] bus: mhi: host: Fix race between channel preparation
 and M0 event
Message-ID: <20221028165401.GA13880@thinkpad>
References: <1665889532-13634-1-git-send-email-quic_qianyu@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1665889532-13634-1-git-send-email-quic_qianyu@quicinc.com>

On Sun, Oct 16, 2022 at 11:05:32AM +0800, Qiang Yu wrote:
> There is a race condition where mhi_prepare_channel() updates the
> read and write pointers as the base address and in parallel, if
> an M0 transition occurs, the tasklet goes ahead and rings
> doorbells for all channels with a delta in TRE rings assuming
> they are already enabled. This causes a null pointer access. Fix
> it by adding a channel enabled check before ringing channel
> doorbells.
> 
> Fixes: a6e2e3522f29 "bus: mhi: core: Add support for PM state transitions"
> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>

Can you also CC stable list for backporting?

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

Thanks,
Mani

> ---
> v1->v2: add Fixes tags
> 
>  drivers/bus/mhi/host/pm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
> index 4a42186..0834590 100644
> --- a/drivers/bus/mhi/host/pm.c
> +++ b/drivers/bus/mhi/host/pm.c
> @@ -301,7 +301,8 @@ int mhi_pm_m0_transition(struct mhi_controller *mhi_cntrl)
>  		read_lock_irq(&mhi_chan->lock);
>  
>  		/* Only ring DB if ring is not empty */
> -		if (tre_ring->base && tre_ring->wp  != tre_ring->rp)
> +		if (tre_ring->base && tre_ring->wp  != tre_ring->rp &&
> +		    mhi_chan->ch_state == MHI_CH_STATE_ENABLED)
>  			mhi_ring_chan_db(mhi_cntrl, mhi_chan);
>  		read_unlock_irq(&mhi_chan->lock);
>  	}
> -- 
> 2.7.4
> 
> 

-- 
மணிவண்ணன் சதாசிவம்
