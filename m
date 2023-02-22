Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3502586
	for <mhi@lists.linux.dev>; Wed, 22 Feb 2023 11:13:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C1EAC433EF;
	Wed, 22 Feb 2023 11:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1677064387;
	bh=GvAz75RpNZIIMsht3uClU2dTBKOmBuR7h7BuGl65Zps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NC7iXhe2B6n+V3jQuXjFSTL71WFfxw/X/cKheG0ihlyXKx44lm9mvhQB2u4/6O6Qo
	 qLdSn8W0thykKEyeaxVVakXqIBI92mN1YQFW5Z2watNjHfH8jZ3Ak/mAlTE1U4g2Jb
	 yj6m6UEUk1VAQkvgRHpPvVjA0OiLvcQf4+hDbYFs=
Date: Wed, 22 Feb 2023 12:13:05 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Vivek Pernamitta <quic_vpernami@quicinc.com>
Cc: mhi@lists.linux.dev, quic_qianyu@quicinc.com,
	manivannan.sadhasivam@linaro.org, quic_vbadigan@quicinc.com,
	quic_krichai@quicinc.com, quic_skananth@quicinc.com,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alex Elder <elder@linaro.org>,
	Hemant Kumar <hemantk@codeaurora.org>,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Bhaumik Bhatt <bbhatt@codeaurora.org>,
	Paul Davey <paul.davey@alliedtelesis.co.nz>,
	"open list:MHI BUS" <linux-arm-msm@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V3] bus: mhi: host: Avoid ringing EV DB if there is no
 elements to process
Message-ID: <Y/X4wSSjkPCotvlC@kroah.com>
References: <1677063601-28083-1-git-send-email-quic_vpernami@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1677063601-28083-1-git-send-email-quic_vpernami@quicinc.com>

On Wed, Feb 22, 2023 at 04:29:59PM +0530, Vivek Pernamitta wrote:
> Avoid ringing Event DB if there is no elements to process.
> As mhi_poll function can be called by mhi client drivers
> which will call process_event, which will ring DB even if
> there no ring elements to process.
> 
> Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
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

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
