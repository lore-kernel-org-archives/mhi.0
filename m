Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2C428ED
	for <mhi@lists.linux.dev>; Thu, 23 Feb 2023 15:48:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFCD1C433EF;
	Thu, 23 Feb 2023 15:48:40 +0000 (UTC)
Date: Thu, 23 Feb 2023 21:18:36 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Vivek Pernamitta <quic_vpernami@quicinc.com>
Cc: mhi@lists.linux.dev, quic_qianyu@quicinc.com, quic_vbadigan@quicinc.com,
	quic_krichai@quicinc.com, quic_skananth@quicinc.com,
	mrana@quicinc.com, Alex Elder <elder@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Hemant Kumar <hemantk@codeaurora.org>,
	Bhaumik Bhatt <bbhatt@codeaurora.org>,
	"open list:MHI BUS" <linux-arm-msm@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5] bus: mhi: host: Avoid ringing EV DB if there is no
 elements to process
Message-ID: <20230223154836.GC6422@workstation>
References: <1677087470-7004-1-git-send-email-quic_vpernami@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1677087470-7004-1-git-send-email-quic_vpernami@quicinc.com>
User-Agent: Mutt/1.9.4 (2018-02-28)

On Wed, Feb 22, 2023 at 11:07:48PM +0530, Vivek Pernamitta wrote:
> As mhi_poll function can be called by mhi client drivers
> which will call process_event, which will ring DB even if
> there no ring elements to process. This could cause
> doorbell event to be processed by MHI device to check for
> any ring elements even it is none and also it will occupy
> lot of bandwidth on peripheral when mhi_poll() is called in
> aggressive loop.
> 

The change looks good to me but who is the actual in-kernel user of
mhi_poll() API? It is being exported and if there is no upstream client
driver making use of it, then it shouldn't be.

I'm gonna submit a patch to remove this API altogether.

> Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> 
> ---
> changes since v4:
> 	updating the commit text with more information.
> changes since v3:
> 	- Updating commit text for multiple versions of patches.
> changes since v2:
> 	- Updated comments in code.
> changes since v1:
> 	- Add an check to avoid ringing EV DB in mhi_process_ctrl_ev_ring().
> ---
>  drivers/bus/mhi/host/main.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
> index df0fbfe..1bbdb75 100644
> --- a/drivers/bus/mhi/host/main.c
> +++ b/drivers/bus/mhi/host/main.c
> @@ -961,7 +961,9 @@ int mhi_process_ctrl_ev_ring(struct mhi_controller *mhi_cntrl,
>  	}
>  
>  	read_lock_bh(&mhi_cntrl->pm_lock);
> -	if (likely(MHI_DB_ACCESS_VALID(mhi_cntrl)))
> +
> +	/* Ring EV DB only if there is any pending element to process */
> +	if (likely(MHI_DB_ACCESS_VALID(mhi_cntrl)) && count)
>  		mhi_ring_er_db(mhi_event);
>  	read_unlock_bh(&mhi_cntrl->pm_lock);
>  
> @@ -1031,7 +1033,9 @@ int mhi_process_data_event_ring(struct mhi_controller *mhi_cntrl,
>  		count++;
>  	}
>  	read_lock_bh(&mhi_cntrl->pm_lock);
> -	if (likely(MHI_DB_ACCESS_VALID(mhi_cntrl)))
> +
> +	/* Ring EV DB only if there is any pending element to process */
> +	if (likely(MHI_DB_ACCESS_VALID(mhi_cntrl)) && count)
>  		mhi_ring_er_db(mhi_event);
>  	read_unlock_bh(&mhi_cntrl->pm_lock);
>  
> -- 
> 2.7.4
> 
