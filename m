Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF13635
	for <mhi@lists.linux.dev>; Mon,  6 Nov 2023 04:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Peu4o7qw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BE74C433C7;
	Mon,  6 Nov 2023 04:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699245694;
	bh=IIAQOZpGjXwc7fKWKRroagG6s2bx1zCT3L6uGLaxqXs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Peu4o7qwkZo0Z/MtDJwwNepcGBQMJdQbjgWPgzXc+T/RJql4g3M4oNSBYjfwm3zA8
	 D60CvLEE8mwOV7PvEoMIEr0N8CG6NJvNBQt51rV65D6wl33VBWMJcuxScTcqWD6BEn
	 jjWBpUfGQcdxWVa16xNRGkao9uCTdhAbjK71voulOHuLOUn21VC4fWWJeRbz//adoV
	 z+3EUB8vYniwy7gQ9qyvn2+adlyfL0J8E4SZPv59SCf338th4OPhS1kk7KYPE7bJzG
	 ovbSinbVbc79rWH6cdf2MMMm/gvLJkcSKmk7W6H6O8cnG9Lbpn9XVpSNkdEpR/Gu3C
	 9a4KSxhSjHfKg==
Date: Mon, 6 Nov 2023 10:11:26 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Qiang Yu <quic_qianyu@quicinc.com>
Cc: mani@kernel.org, quic_jhugo@quicinc.com, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_cang@quicinc.com, quic_mrana@quicinc.com,
	Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: Re: [PATCH v2 1/2] bus: mhi: host: Add spinlock to protect WP access
 when queueing TREs
Message-ID: <20231106044126.GA2474@thinkpad>
References: <1694594861-12691-1-git-send-email-quic_qianyu@quicinc.com>
 <1694594861-12691-2-git-send-email-quic_qianyu@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1694594861-12691-2-git-send-email-quic_qianyu@quicinc.com>

On Wed, Sep 13, 2023 at 04:47:40PM +0800, Qiang Yu wrote:
> From: Bhaumik Bhatt <bbhatt@codeaurora.org>
> 
> Protect WP accesses such that multiple threads queueing buffers for
> incoming data do not race and access the same WP twice. Ensure read and
> write locks for the channel are not taken in succession by dropping the
> read lock from parse_xfer_event() such that a callback given to client
> can potentially queue buffers and acquire the write lock in that process.
> Any queueing of buffers should be done without channel read lock acquired
> as it can result in multiple locks and a soft lockup.
> 

This change is doing two things:

1. Unlocking xfer_cb to prevent potential lockup
2. Protecting mhi_gen_tre() against concurrent access

So you should split this into two patches and also add Fixes tag if appropriate.

- Mani

> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
> ---
>  drivers/bus/mhi/host/main.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
> index dcf627b..13c4b89 100644
> --- a/drivers/bus/mhi/host/main.c
> +++ b/drivers/bus/mhi/host/main.c
> @@ -642,6 +642,7 @@ static int parse_xfer_event(struct mhi_controller *mhi_cntrl,
>  			mhi_del_ring_element(mhi_cntrl, tre_ring);
>  			local_rp = tre_ring->rp;
>  
> +			read_unlock_bh(&mhi_chan->lock);
>  			/* notify client */
>  			mhi_chan->xfer_cb(mhi_chan->mhi_dev, &result);
>  
> @@ -667,6 +668,7 @@ static int parse_xfer_event(struct mhi_controller *mhi_cntrl,
>  					kfree(buf_info->cb_buf);
>  				}
>  			}
> +			read_lock_bh(&mhi_chan->lock);
>  		}
>  		break;
>  	} /* CC_EOT */
> @@ -1204,6 +1206,9 @@ int mhi_gen_tre(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
>  	int eot, eob, chain, bei;
>  	int ret;
>  
> +	/* Protect accesses for reading and incrementing WP */
> +	write_lock_bh(&mhi_chan->lock);
> +
>  	buf_ring = &mhi_chan->buf_ring;
>  	tre_ring = &mhi_chan->tre_ring;
>  
> @@ -1221,8 +1226,10 @@ int mhi_gen_tre(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
>  
>  	if (!info->pre_mapped) {
>  		ret = mhi_cntrl->map_single(mhi_cntrl, buf_info);
> -		if (ret)
> +		if (ret) {
> +			write_unlock_bh(&mhi_chan->lock);
>  			return ret;
> +		}
>  	}
>  
>  	eob = !!(flags & MHI_EOB);
> @@ -1239,6 +1246,8 @@ int mhi_gen_tre(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
>  	mhi_add_ring_element(mhi_cntrl, tre_ring);
>  	mhi_add_ring_element(mhi_cntrl, buf_ring);
>  
> +	write_unlock_bh(&mhi_chan->lock);
> +
>  	return 0;
>  }
>  
> -- 
> 2.7.4
> 
> 

-- 
மணிவண்ணன் சதாசிவம்
