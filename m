Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5BA3CEB8F;
	Tue, 23 Jun 2026 08:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782204874; cv=none; b=mr55v0IxkMD9qwYbAoq8AJdvGPGuNIrvTHUaRN+oSq8F8XfGDS91TkK0snFIyLUJreUipXuJUYfENnfWS0HczZhBNYu/TEa9Aff7176/9FNHNnTZmaA/jE5HwESRDsYdbORrYi8z8COvmhhWEXLN+lGPTKAptAuI/DD2fr8fvFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782204874; c=relaxed/simple;
	bh=oGWohpozDNj5HcCqKiRi2M0XxBKU2rSmNKqQTb6qDBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V7TTHnuEQQkBUzk6/lUOdhnXhGUK/S+s/C0T9j9lQYqLpzbpHkEkJUHju97ZeWTLwZlFk7cu467QrQs0T4uZtnY/YAgHvicYss7YaAlRw5Hi2ISneZ8a8t4W3EHmytQu0S4H0Pv3o/P4e50+2E+o7GXS/R26zXKWL4QYoGBw8F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CnYDZE5v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CnYDZE5v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D22F41F000E9;
	Tue, 23 Jun 2026 08:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782204872;
	bh=j66E0sANIJ72GqjGOIoBRp/CCYURSlspKpay3Stku4U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CnYDZE5vJu4AiYcc2fs4m0IhdA/NeTkA1nU7SfIuqY1t/83vJhs7Ne34KNwNVENq5
	 dEYWzXvyQxtscdFeHfTrVRfpotek9NWcrEDXumD2P5tZISDFQYceb1LvPY8Yg6fnmE
	 LUcNKxC//BU6MH6xD7fqPjyNwFt0sHEFwl0rTq/rADN0Eeb2Irheka2SlOiqLf0JR4
	 4FkXpvIPygP0SnQxPpaKN11rs/SPZ+/6plTXG8MNa+dmiikRH6TcuVaPim1fMGi9Oz
	 tYqIyQrexMvv3re2wNJ0gZAMmM45PboWckuX1oCBiqRLPLMGQ03NUH6ZnlLmb+zqFH
	 7ji96uqAtPsng==
Date: Tue, 23 Jun 2026 10:54:26 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] bus: mhi: ep: Add mhi_ep_queue_buf() API for raw
 buffer queuing
Message-ID: <2u2w73i6v53rdjkmufolowh55rd5ya3fypif4geed4xtnlzyq6@zqjjeugleht2>
References: <20260622-loopback_mhi-v4-0-782b3a0f2eef@oss.qualcomm.com>
 <20260622-loopback_mhi-v4-2-782b3a0f2eef@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260622-loopback_mhi-v4-2-782b3a0f2eef@oss.qualcomm.com>

On Mon, Jun 22, 2026 at 10:39:16AM +0530, Sumit Kumar wrote:
> Some MHI endpoint clients do not use socket buffers and need a way to queue
> raw buffers for DL transfers. Add mhi_ep_queue_buf() to support this use
> case.
> 
> Refactor mhi_ep_queue_skb() to delegate to a new internal mhi_ep_queue()
> helper shared by both APIs, and rename mhi_ep_skb_completion() to
> mhi_ep_buf_completion() to reflect its broader use.
> 
> Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
> ---
>  drivers/bus/mhi/ep/main.c | 29 ++++++++++++++++++++---------
>  include/linux/mhi_ep.h    | 15 +++++++++++++++
>  2 files changed, 35 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
> index b3eafcf2a2c50d95e3efd3afb27038ecf55552a5..d44e1e54cfb4404b6589aab372e687db7492d3c3 100644
> --- a/drivers/bus/mhi/ep/main.c
> +++ b/drivers/bus/mhi/ep/main.c
> @@ -516,7 +516,7 @@ static int mhi_ep_process_ch_ring(struct mhi_ep_ring *ring)
>  	return 0;
>  }
>  
> -static void mhi_ep_skb_completion(struct mhi_ep_buf_info *buf_info)
> +static void mhi_ep_buf_completion(struct mhi_ep_buf_info *buf_info)
>  {
>  	struct mhi_ep_device *mhi_dev = buf_info->mhi_dev;
>  	struct mhi_ep_cntrl *mhi_cntrl = mhi_dev->mhi_cntrl;
> @@ -544,22 +544,22 @@ static void mhi_ep_skb_completion(struct mhi_ep_buf_info *buf_info)
>  
>  	mhi_ep_ring_inc_index(ring);
>  }
> -
>  /* TODO: Handle partially formed TDs */
> -int mhi_ep_queue_skb(struct mhi_ep_device *mhi_dev, struct sk_buff *skb)
> +static int mhi_ep_queue(struct mhi_ep_device *mhi_dev, void *buf, size_t len,
> +			void *cb_buf)
>  {
>  	struct mhi_ep_cntrl *mhi_cntrl = mhi_dev->mhi_cntrl;
>  	struct mhi_ep_chan *mhi_chan = mhi_dev->dl_chan;
>  	struct device *dev = &mhi_chan->mhi_dev->dev;
>  	struct mhi_ep_buf_info buf_info = {};
>  	struct mhi_ring_element *el;
> -	u32 buf_left, read_offset;
> +	size_t buf_left, read_offset;
>  	struct mhi_ep_ring *ring;
>  	size_t tr_len;
>  	u32 tre_len;
>  	int ret;
>  
> -	buf_left = skb->len;
> +	buf_left = len;
>  	ring = &mhi_cntrl->mhi_chan[mhi_chan->chan].ring;
>  
>  	mutex_lock(&mhi_chan->lock);
> @@ -582,13 +582,13 @@ int mhi_ep_queue_skb(struct mhi_ep_device *mhi_dev, struct sk_buff *skb)
>  		tre_len = MHI_TRE_DATA_GET_LEN(el);
>  
>  		tr_len = min(buf_left, tre_len);
> -		read_offset = skb->len - buf_left;
> +		read_offset = len - buf_left;
>  
> -		buf_info.dev_addr = skb->data + read_offset;
> +		buf_info.dev_addr = buf + read_offset;
>  		buf_info.host_addr = MHI_TRE_DATA_GET_PTR(el);
>  		buf_info.size = tr_len;
> -		buf_info.cb = mhi_ep_skb_completion;
> -		buf_info.cb_buf = skb;
> +		buf_info.cb = mhi_ep_buf_completion;
> +		buf_info.cb_buf = cb_buf;
>  		buf_info.mhi_dev = mhi_dev;
>  
>  		/*
> @@ -627,8 +627,19 @@ int mhi_ep_queue_skb(struct mhi_ep_device *mhi_dev, struct sk_buff *skb)
>  
>  	return ret;
>  }
> +
> +int mhi_ep_queue_skb(struct mhi_ep_device *mhi_dev, struct sk_buff *skb)
> +{
> +	return mhi_ep_queue(mhi_dev, skb->data, skb->len, skb);
> +}
>  EXPORT_SYMBOL_GPL(mhi_ep_queue_skb);
>  
> +int mhi_ep_queue_buf(struct mhi_ep_device *mhi_dev, void *buf, size_t len)
> +{
> +	return mhi_ep_queue(mhi_dev, buf, len, buf);
> +}
> +EXPORT_SYMBOL_GPL(mhi_ep_queue_buf);
> +
>  static int mhi_ep_cache_host_cfg(struct mhi_ep_cntrl *mhi_cntrl)
>  {
>  	size_t cmd_ctx_host_size, ch_ctx_host_size, ev_ctx_host_size;
> diff --git a/include/linux/mhi_ep.h b/include/linux/mhi_ep.h
> index 7b40fc8cbe77ab8419d167e89264b69a817b9fb1..59f796e56207aaf8be09edc9ba4d1f59b665581f 100644
> --- a/include/linux/mhi_ep.h
> +++ b/include/linux/mhi_ep.h
> @@ -302,4 +302,19 @@ bool mhi_ep_queue_is_empty(struct mhi_ep_device *mhi_dev, enum dma_data_directio
>   */
>  int mhi_ep_queue_skb(struct mhi_ep_device *mhi_dev, struct sk_buff *skb);
>  
> +/**
> + * mhi_ep_queue_buf - Send buffer to host over MHI Endpoint

You are not really 'sending' the buffer, but just 'transferring the buffer
contents'.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
