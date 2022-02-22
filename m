Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52222361
	for <mhi@lists.linux.dev>; Tue, 22 Feb 2022 10:50:30 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id qe15so18036655pjb.3
        for <mhi@lists.linux.dev>; Tue, 22 Feb 2022 02:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5xXqSAHagTJE559oaHlLg/c+Ad153OGfu++AbH4hfUg=;
        b=OrsEBm7pYEKVo7jsPe5iEQgv05yoY6LM/3nzwZfwEc0v+O1p7b0nqzk1rpVF3+j3xe
         jWqHh6tOYIuqpKa7TgO3hnCugDGGSAqLYOnoXMTemq4l6Y6vHSp5pVOWAGXWLBzO6EqA
         mhvFHUJYwbvAuYmrLfBHDKdz66c/2vjQEWt35H01fAWsewYejDNjU7/gJUJ2OIKd/5CQ
         KeYs81u+9yaLCon4PhyrQ+LpvXO4Fy54vfPvW2OZZYzOIRB/moqLPG2ssQR5vgXMP/Mp
         0NDqIp/m5d26fo05wORFLxVQDJ5b6bKpPB9CIcusKEiGfiaiauIS1i2xyo9i2oEG/i7V
         77Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5xXqSAHagTJE559oaHlLg/c+Ad153OGfu++AbH4hfUg=;
        b=3kSrCMahtNP42BBLrZjfLvA3Mdz8IqsUE2rWS/wztRlw2pG51diVsDV68WvNk0azog
         V/9jn/edRqqo4cUxf3ex6SlAwZA8JZOEjUySFwUF+LrMsJyMYzGUgVpSm1sXbvu9GRmx
         ISyZWq8izPTCXVCJ1kUxKOkrqneXp3wZQ8fXy9SZzkBTLFa5mDPOUDoK30mZ0iB6R2a2
         eL82TXhWCab/Wfv89QAVpGcN1pcHu+UweZCsnfFL8kwk2aRV2wKkireH23K4Shvk8TRp
         aKGosDeAaquzB98suxXmDOKhgiMzDJDUOZPfy2sncB8EDGL5CsoToBLJ1yLcP8YTbpsY
         aMdg==
X-Gm-Message-State: AOAM533glgwLA8oDMHdqWo7wz51t3KLph83bk8RFRZd3fcODuVjI4bdY
	rRhS81jjekDMJEKZoWori7bN
X-Google-Smtp-Source: ABdhPJzZA3ZxDPNU12CTVzpzjl2/dqPRLeN5wlC8uzUVshTTZKvXpplM4yqxqutaEaPsHx19Mx065w==
X-Received: by 2002:a17:90b:240e:b0:1b9:2963:d5a1 with SMTP id nr14-20020a17090b240e00b001b92963d5a1mr3495898pjb.227.1645527029752;
        Tue, 22 Feb 2022 02:50:29 -0800 (PST)
Received: from thinkpad ([117.217.186.202])
        by smtp.gmail.com with ESMTPSA id c1sm8539189pfl.130.2022.02.22.02.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 02:50:29 -0800 (PST)
Date: Tue, 22 Feb 2022 16:20:23 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Alex Elder <elder@linaro.org>
Cc: mhi@lists.linux.dev, quic_hemantk@quicinc.com, quic_bbhatt@quicinc.com,
	quic_jhugo@quicinc.com, vinod.koul@linaro.org,
	bjorn.andersson@linaro.org, dmitry.baryshkov@linaro.org,
	quic_vbadigan@quicinc.com, quic_cang@quicinc.com,
	quic_skananth@quicinc.com, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 22/25] bus: mhi: ep: Add support for processing
 transfer ring
Message-ID: <20220222105023.GG5029@thinkpad>
References: <20220212182117.49438-1-manivannan.sadhasivam@linaro.org>
 <20220212182117.49438-23-manivannan.sadhasivam@linaro.org>
 <f91de912-977b-4e78-2e8c-12f4c09134bd@linaro.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f91de912-977b-4e78-2e8c-12f4c09134bd@linaro.org>

On Tue, Feb 15, 2022 at 04:40:18PM -0600, Alex Elder wrote:
> On 2/12/22 12:21 PM, Manivannan Sadhasivam wrote:
> > Add support for processing the transfer ring from host. For the transfer
> > ring associated with DL channel, the xfer callback will simply invoked.
> > For the case of UL channel, the ring elements will be read in a buffer
> > till the write pointer and later passed to the client driver using the
> > xfer callback.
> > 
> > The client drivers should provide the callbacks for both UL and DL
> > channels during registration.
> 
> I think you already checked and guaranteed that.
> 
> I have a question and suggestion below.  But it could
> be considered an optimization that could be implemented
> in the future, so:
> 
> Reviewed-by: Alex Elder <elder@linaro.org>
> 
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >   drivers/bus/mhi/ep/main.c | 49 +++++++++++++++++++++++++++++++++++++++
> >   1 file changed, 49 insertions(+)
> > 
> > diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
> > index b937c6cda9ba..baf383a4857b 100644
> > --- a/drivers/bus/mhi/ep/main.c
> > +++ b/drivers/bus/mhi/ep/main.c
> > @@ -439,6 +439,55 @@ static int mhi_ep_read_channel(struct mhi_ep_cntrl *mhi_cntrl,
> >   	return 0;
> >   }
> > +int mhi_ep_process_tre_ring(struct mhi_ep_ring *ring, struct mhi_ep_ring_element *el)
> > +{
> > +	struct mhi_ep_cntrl *mhi_cntrl = ring->mhi_cntrl;
> > +	struct mhi_result result = {};
> > +	u32 len = MHI_EP_DEFAULT_MTU;
> > +	struct mhi_ep_chan *mhi_chan;
> > +	int ret;
> > +
> > +	mhi_chan = &mhi_cntrl->mhi_chan[ring->ch_id];
> > +
> > +	/*
> > +	 * Bail out if transfer callback is not registered for the channel.
> > +	 * This is most likely due to the client driver not loaded at this point.
> > +	 */
> > +	if (!mhi_chan->xfer_cb) {
> > +		dev_err(&mhi_chan->mhi_dev->dev, "Client driver not available\n");
> > +		return -ENODEV;
> > +	}
> > +
> > +	if (ring->ch_id % 2) {
> > +		/* DL channel */
> > +		result.dir = mhi_chan->dir;
> > +		mhi_chan->xfer_cb(mhi_chan->mhi_dev, &result);
> > +	} else {
> > +		/* UL channel */
> > +		do {
> > +			result.buf_addr = kzalloc(len, GFP_KERNEL);
> 
> So you allocate an 8KB buffer into which you copy
> received data, then pass that to the ->xfer_cb()
> function.  Then you free that buffer.  Repeatedly.
> 
> Two questions about this:
> - This suggests that after copying the data in, the
>   ->xfer_cb() function will copy it again, is that
>   correct?
> - If that is correct, why not just reuse the same 8KB
>   buffer, allocated once outside the loop?
> 

The allocation was moved into the loop so that the TRE length buffer could be
allocated but I somehow decided to allocate the Max length buffer. So this could
be moved outside of the loop.

Thanks,
Mani

> It might also be nice to consider whether you could
> allocate the buffer here and have the ->xfer_cb()
> function be responsible for freeing it (and ideally,
> pass it along rather than copying it again).
> 
> > +			if (!result.buf_addr)
> > +				return -ENOMEM;
> > +
> > +			ret = mhi_ep_read_channel(mhi_cntrl, ring, &result, len);
> > +			if (ret < 0) {
> > +				dev_err(&mhi_chan->mhi_dev->dev, "Failed to read channel\n");
> > +				kfree(result.buf_addr);
> > +				return ret;
> > +			}
> > +
> > +			result.dir = mhi_chan->dir;
> > +			mhi_chan->xfer_cb(mhi_chan->mhi_dev, &result);
> > +			kfree(result.buf_addr);
> > +			result.bytes_xferd = 0;
> > +
> > +			/* Read until the ring becomes empty */
> > +		} while (!mhi_ep_queue_is_empty(mhi_chan->mhi_dev, DMA_TO_DEVICE));
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >   static int mhi_ep_cache_host_cfg(struct mhi_ep_cntrl *mhi_cntrl)
> >   {
> >   	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> 
