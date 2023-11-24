Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A755017733;
	Fri, 24 Nov 2023 10:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fW/cmt1T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48068C433C8;
	Fri, 24 Nov 2023 10:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700820251;
	bh=odyegxK7uxxBKnGsjhd8OdJQcNHKmuTu63nAYxY3t2E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fW/cmt1TnBYSriyoDoMYuXJEjNH09il9ygKQUnnl5ODH1Wr4IfG4Y93l6CbHMIkvU
	 WdRO66wZVI6cOKxPozmzXAtliC+A0SXhgb3rANXFTcpI8DECN74dAXajeWG/4bgXVc
	 hru+IlPXZuZ7As/Yj8pyZCrhdTzKJ9RnHGTzZoZke5XVwMKib7d/xeqhAKRqgrT7U5
	 r07Hlt5ewNzEZTaxBK/Kqi+BRziZUliGYLT/327vvKele7g2dQpAif2AbkiQg5cQ+9
	 ffFrzzCmaOUX3wv6lFkFY9+9myZABvN3CxMgW2FTRNEJVgUyifLQObqRDR0enfupJr
	 D5aRl8/ymt0oA==
Date: Fri, 24 Nov 2023 15:34:03 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Qiang Yu <quic_qianyu@quicinc.com>
Cc: quic_jhugo@quicinc.com, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_cang@quicinc.com, quic_mrana@quicinc.com
Subject: Re: [PATCH v4 2/4] bus: mhi: host: Drop chan lock before queuing
 buffers
Message-ID: <20231124100403.GA4536@thinkpad>
References: <1699939661-7385-1-git-send-email-quic_qianyu@quicinc.com>
 <1699939661-7385-3-git-send-email-quic_qianyu@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1699939661-7385-3-git-send-email-quic_qianyu@quicinc.com>

On Tue, Nov 14, 2023 at 01:27:39PM +0800, Qiang Yu wrote:
> Ensure read and write locks for the channel are not taken in succession by
> dropping the read lock from parse_xfer_event() such that a callback given
> to client can potentially queue buffers and acquire the write lock in that
> process. Any queueing of buffers should be done without channel read lock
> acquired as it can result in multiple locks and a soft lockup.
> 

Is this patch trying to fix an existing issue in client drivers or a potential
issue in the future drivers?

Even if you take care of disabled channels, "mhi_event->lock" acquired during
mhi_mark_stale_events() can cause deadlock, since event lock is already held by
mhi_ev_task().

I'd prefer not to open the window unless this patch is fixing a real issue.

- Mani

> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
> ---
>  drivers/bus/mhi/host/main.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
> index 6c6d253..c4215b0 100644
> --- a/drivers/bus/mhi/host/main.c
> +++ b/drivers/bus/mhi/host/main.c
> @@ -642,6 +642,8 @@ static int parse_xfer_event(struct mhi_controller *mhi_cntrl,
>  			mhi_del_ring_element(mhi_cntrl, tre_ring);
>  			local_rp = tre_ring->rp;
>  
> +			read_unlock_bh(&mhi_chan->lock);
> +
>  			/* notify client */
>  			mhi_chan->xfer_cb(mhi_chan->mhi_dev, &result);
>  
> @@ -667,6 +669,8 @@ static int parse_xfer_event(struct mhi_controller *mhi_cntrl,
>  					kfree(buf_info->cb_buf);
>  				}
>  			}
> +
> +			read_lock_bh(&mhi_chan->lock);
>  		}
>  		break;
>  	} /* CC_EOT */
> -- 
> 2.7.4
> 
> 

-- 
மணிவண்ணன் சதாசிவம்
