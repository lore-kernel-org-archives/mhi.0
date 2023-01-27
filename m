Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4F523A8
	for <mhi@lists.linux.dev>; Fri, 27 Jan 2023 06:46:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E2C0C433EF;
	Fri, 27 Jan 2023 06:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674801994;
	bh=/69QGgxaCKzr+3hTfqCfapjnc3rskY33QiorSfy6fVA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GDp0zEMu9yiBlFB3TDmoQMTVPpbbT2wFR0E3Qrg10fQ2nNAmCFhYUOk/sy56K0HXx
	 o466IcvNd4fF+3Y1nC1OUOI1Olt1MDH6xER96/iA5GO61HZzJldOClUlLEQreyJ4pY
	 qXOHKHS/zegoHWMMCil9tCQMWWTSeE8QgGnT3ppWwZEgiSIyhghUm/3xw6KgULER/D
	 BK0wZGlMFpxP2cX1skqfb286qPS9NZ+khpFngn+4enHpwgmAChD6+u5U36gdLfyWYG
	 3eetfiyAXDOYDoPv18v6nxALzAQ5cJuuWAxdOdfhWevW2kSsZwnI8MQ4fdGktDBKu7
	 gj5MqeCVCAj8Q==
Date: Fri, 27 Jan 2023 12:16:21 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Dan Carpenter <error27@gmail.com>
Cc: Alex Elder <elder@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jeffrey Hugo <quic_jhugo@quicinc.com>, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: ep: Fix off by one in mhi_ep_process_cmd_ring()
Message-ID: <20230127064621.GC7809@thinkpad>
References: <Y9JH5sudiZWvbODv@kili>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y9JH5sudiZWvbODv@kili>

On Thu, Jan 26, 2023 at 12:29:10PM +0300, Dan Carpenter wrote:
> The > comparison should be changed to >= to prevent an out of bounds
> access into the mhi_cntrl->mhi_chan[] array.  The mhi_cntrl->mhi_chan[]
> array is allocated in mhi_ep_chan_init() and has mhi_cntrl->max_chan
> elements.
> 
> Fixes: 2527ad44ddb2 ("bus: mhi: ep: Check if the channel is supported by the controller")
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/ep/main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
> index bcaaba97ef63..be2d56e7f392 100644
> --- a/drivers/bus/mhi/ep/main.c
> +++ b/drivers/bus/mhi/ep/main.c
> @@ -125,7 +125,7 @@ static int mhi_ep_process_cmd_ring(struct mhi_ep_ring *ring, struct mhi_ring_ele
>  	ch_id = MHI_TRE_GET_CMD_CHID(el);
>  
>  	/* Check if the channel is supported by the controller */
> -	if ((ch_id > mhi_cntrl->max_chan) || !mhi_cntrl->mhi_chan[ch_id].name) {
> +	if ((ch_id >= mhi_cntrl->max_chan) || !mhi_cntrl->mhi_chan[ch_id].name) {
>  		dev_err(dev, "Channel (%u) not supported!\n", ch_id);
>  		return -ENODEV;
>  	}
> -- 
> 2.35.1
> 

-- 
மணிவண்ணன் சதாசிவம்
