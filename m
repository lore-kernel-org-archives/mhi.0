Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE24BE7E
	for <mhi@lists.linux.dev>; Fri,  7 Jul 2023 11:42:05 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-4fb863edcb6so2844478e87.0
        for <mhi@lists.linux.dev>; Fri, 07 Jul 2023 04:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688730123; x=1691322123;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8wa7BsPp1pwuUXYKFDe8+3rIlSyzZmk8L9MfJjPY7Hc=;
        b=Q4+p1BE3f451ZQ4nncfxOhnfmawK6shA59BM3UDHQl20cQtxz2Z6Brt9NDWxt/D6zF
         xhFDpWZCxjmpgG3BeBjXv9kHbc7lc4rhbQEbM1MhUvpRKiArZwYaJhn4/WOyZIWphda5
         +tMxSzrkiOdB5eIOQWkp0T2zpZvIIFD+Bgf+CT07wRrad774qCuGuLVpyXuwTb5N6O29
         gr+EWqyxblX7Bc2lzj6U4A4HJ0cOWE4z1EAtDWKX0inJFDyPH+CwhxukS8rLzLIx+j++
         38nFy/HGu2k++J+0d/nKQxEREgNDpEzVIn1q4zU/Jfk5IDh+grbthTxVAGwHmG1tKj6f
         w41A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688730123; x=1691322123;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8wa7BsPp1pwuUXYKFDe8+3rIlSyzZmk8L9MfJjPY7Hc=;
        b=XQWYrzC1J+3BEfsQQJE13TW5qbpIzEM/NPF5ChbX1vUQHO42Nha+7D0FKtfiqHSRze
         LeGNkJ52OEDHk6pmmALpXvq8zXCFF0UU8ZCxgYrBoR6p+rp80s7NWsAeg9ybpAD6N7HU
         y/1uZ5sqDrkBN+nz6DItu4eu4rbEinTXfqgi/h4E4V/r3Zv7x6+iZD5n2IQY9RjZ9od1
         IOVIvAHzK3fWc+/j/Yp+6TYkbXw+9wLAMiCig1yY75NrJmhwT2qFjEoITULavQmqm/1e
         +tv3aPWwclrmWxRCLvyPN7zqOrb7iZCLdq4qSDMa++XRjyD9peKmtdcpm7Ln3+27WcW4
         7ZLQ==
X-Gm-Message-State: ABy/qLYzV1itdwbMyVK8sK3dQFqgUIuXhO9BwEk2EZiJ8E3bIz+tqq9P
	OqOaQy/taFf9pESEG122nuD3KA==
X-Google-Smtp-Source: APBJJlHy5isDdras5n41PxiBO6xaM9mbE5GHZK/Y351j80tyDTleBNnaJY5mxZHx/5Y9DkbUDIyIEA==
X-Received: by 2002:a05:6512:230a:b0:4fb:758c:74ed with SMTP id o10-20020a056512230a00b004fb758c74edmr4579360lfu.35.1688730123070;
        Fri, 07 Jul 2023 04:42:03 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id 23-20020a05600c025700b003fbc9371193sm2216754wmj.13.2023.07.07.04.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 04:42:01 -0700 (PDT)
Date: Fri, 7 Jul 2023 14:41:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Krishna chaitanya chundru <quic_krichai@quicinc.com>
Cc: manivannan.sadhasivam@linaro.org, helgaas@kernel.org,
	linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_vbadigan@quicinc.com,
	quic_nitegupt@quicinc.com, quic_skananth@quicinc.com,
	quic_ramkri@quicinc.com, krzysztof.kozlowski@linaro.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Jeffrey Hugo <quic_jhugo@quicinc.com>, Bo Liu <liubo03@inspur.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <error27@gmail.com>,
	"open list:MHI BUS" <mhi@lists.linux.dev>
Subject: Re: [PATCH v3 9/9] bus: mhi: ep: wake up host is the MHI state is in
 M3
Message-ID: <05b4d009-b50b-4971-9220-615f73db4acd@kadam.mountain>
References: <1688727836-11141-1-git-send-email-quic_krichai@quicinc.com>
 <1688727836-11141-10-git-send-email-quic_krichai@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1688727836-11141-10-git-send-email-quic_krichai@quicinc.com>

On Fri, Jul 07, 2023 at 04:33:56PM +0530, Krishna chaitanya chundru wrote:
> If the MHI state is in M3 then the most probably the host kept the
> device in D3 hot or D3 cold, due to that endpoint transctions will not
> be read by the host, so endpoint wakes up host to bring the host to D0
> which eventually bring back the MHI state to M0.
> 
> Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
> ---
>  drivers/bus/mhi/ep/main.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
> index 6008818..46a8a3c 100644
> --- a/drivers/bus/mhi/ep/main.c
> +++ b/drivers/bus/mhi/ep/main.c
> @@ -25,6 +25,27 @@ static DEFINE_IDA(mhi_ep_cntrl_ida);
>  static int mhi_ep_create_device(struct mhi_ep_cntrl *mhi_cntrl, u32 ch_id);
>  static int mhi_ep_destroy_device(struct device *dev, void *data);
>  
> +static bool mhi_ep_wake_host(struct mhi_ep_cntrl *mhi_cntrl)
> +{
> +	enum mhi_state state;
> +	bool mhi_reset;
> +	u32 count = 0;
> +
> +	mhi_cntrl->wakeup_host(mhi_cntrl);
> +
> +	/* Wait for Host to set the M0 state */
> +	do {
> +		msleep(M0_WAIT_DELAY_MS);
> +		mhi_ep_mmio_get_mhi_state(mhi_cntrl, &state, &mhi_reset);
> +		count++;
> +	} while (state != MHI_STATE_M0 && count < M0_WAIT_COUNT);
> +
>+	if (state != MHI_STATE_M0)
>+		return false;

Functions which return false on success are an abomination.  Also
boolean functions should be named for the question they answer such as
access_ok() or has_feature() etc.

Actually, I think it's the caller which is wrong.  This returns true on
success and false on failure.  But the caller assumes true is failure.
It suggests that this has not been tested.

> +
> +	return true;
> +}

Write it like this:

static int mhi_ep_wake_host(struct mhi_ep_cntrl *mhi_cntrl)
{
	enum mhi_state state;
	bool mhi_reset;
	int count = 0;

	mhi_cntrl->wakeup_host(mhi_cntrl);

	while (count++ < M0_WAIT_COUNT) {
		msleep(M0_WAIT_DELAY_MS);

		mhi_ep_mmio_get_mhi_state(mhi_cntrl, &state, &mhi_reset);
		if (state == MHI_STATE_M0)
			return 0;
	}
	return -ENODEV;
}

> +
>  static int mhi_ep_send_event(struct mhi_ep_cntrl *mhi_cntrl, u32 ring_idx,
>  			     struct mhi_ring_element *el, bool bei)
>  {
> @@ -464,6 +485,13 @@ int mhi_ep_queue_skb(struct mhi_ep_device *mhi_dev, struct sk_buff *skb)
>  	buf_left = skb->len;
>  	ring = &mhi_cntrl->mhi_chan[mhi_chan->chan].ring;
>  
> +	if (mhi_cntrl->mhi_state == MHI_STATE_M3) {
> +		if (mhi_ep_wake_host(mhi_cntrl)) {
> +			dev_err(dev, "Failed to wakeup host\n");
> +			return -ENODEV;
> +		}

Then this becomes:

	if (mhi_cntrl->mhi_state == MHI_STATE_M3) {
		ret = mhi_ep_wake_host(mhi_cntrl);
		if (ret) {
			dev_err(dev, "Failed to wakeup host\n");
			return ret;
		}
	}

regards,
dan carpenter

