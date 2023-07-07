Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A956D1852
	for <mhi@lists.linux.dev>; Fri,  7 Jul 2023 06:20:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43E68C433C8;
	Fri,  7 Jul 2023 06:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688710847;
	bh=1MeOrvHtUCSYE7kxR6A8QgS00BZuNloT74Tt/wU01dE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h8EYNPJVallMHAMCnvk+TtxCklhlQ99PghXUPpvTlTwsjqB/AOOLIixUAxHczxZL+
	 9lFKzf0AwxZTZPqzxh7sjgShNrLG8w+R6Oqbw7rkWWCA+ZTjfgoThbxSSPPLHrYhfb
	 EKod1DQM2XatbHv/iaIjEyXSLtsmhCDFJ42EGtxILFkvrMzz46RvI6xpE2fVKKeNZc
	 D6JaUYHq++IqQ5ihn9o8j3nGIqF3MY9sW6bgVS9ApPxh5GROUt3q5yi7daYufAhKcu
	 Pf5aj3RP1cFhiFZdqw08ZpH5EgBsW2y0xZMXXfa5ys3J5qKD3J/kuwZ7sbboqCum1A
	 DQPEexPUSzwlw==
Date: Fri, 7 Jul 2023 11:50:31 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krishna chaitanya chundru <quic_krichai@quicinc.com>
Cc: manivannan.sadhasivam@linaro.org, helgaas@kernel.org,
	linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_vbadigan@quicinc.com,
	quic_nitegupt@quicinc.com, quic_skananth@quicinc.com,
	quic_ramkri@quicinc.com, krzysztof.kozlowski@linaro.org,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Dan Carpenter <error27@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bo Liu <liubo03@inspur.com>,
	"open list:MHI BUS" <mhi@lists.linux.dev>
Subject: Re: [PATCH v2 8/8] bus: mhi: ep: wake up host is the MHI state is in
 M3
Message-ID: <20230707062031.GG6001@thinkpad>
References: <1688122331-25478-1-git-send-email-quic_krichai@quicinc.com>
 <1688122331-25478-9-git-send-email-quic_krichai@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1688122331-25478-9-git-send-email-quic_krichai@quicinc.com>

On Fri, Jun 30, 2023 at 04:22:11PM +0530, Krishna chaitanya chundru wrote:
> If the MHI state is in M3 then the most probably the host kept the
> device in D3 hot or D3 cold, due to that endpoint transctions will not
> be read by the host, so endpoint needs to bring the host to D0 which
> eventually bring back the MHI state to M0.
> 

Endpoint cannot bring the host to D0, it can only wake up the host and the host
will bring the device to D0.

> Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
> ---
>  drivers/bus/mhi/ep/main.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
> index 6008818..42d3791 100644
> --- a/drivers/bus/mhi/ep/main.c
> +++ b/drivers/bus/mhi/ep/main.c
> @@ -451,12 +451,14 @@ int mhi_ep_queue_skb(struct mhi_ep_device *mhi_dev, struct sk_buff *skb)
>  	struct mhi_ep_cntrl *mhi_cntrl = mhi_dev->mhi_cntrl;
>  	struct mhi_ep_chan *mhi_chan = mhi_dev->dl_chan;
>  	struct device *dev = &mhi_chan->mhi_dev->dev;
> +	u32 buf_left, read_offset, count = 0;
>  	struct mhi_ring_element *el;
> -	u32 buf_left, read_offset;
>  	struct mhi_ep_ring *ring;
>  	enum mhi_ev_ccs code;
> +	enum mhi_state state;
>  	void *read_addr;
>  	u64 write_addr;
> +	bool mhi_reset;
>  	size_t tr_len;
>  	u32 tre_len;
>  	int ret;
> @@ -464,6 +466,18 @@ int mhi_ep_queue_skb(struct mhi_ep_device *mhi_dev, struct sk_buff *skb)
>  	buf_left = skb->len;
>  	ring = &mhi_cntrl->mhi_chan[mhi_chan->chan].ring;
>  
> +	if (mhi_cntrl->mhi_state == MHI_STATE_M3) {
> +		dev_dbg(dev, "wake up by ch id %x\n", mhi_chan->chan);

This is not needed.

> +		mhi_cntrl->wakeup_host(mhi_cntrl);
> +	}
> +
> +	/* Wait for Host to set the M0 state */
> +	do {
> +		msleep(M0_WAIT_DELAY_MS);
> +		mhi_ep_mmio_get_mhi_state(mhi_cntrl, &state, &mhi_reset);
> +		count++;
> +	} while (state != MHI_STATE_M0 && count < M0_WAIT_COUNT);
> +

Move this change to a function like mhi_ep_wake_host().

- Mani

>  	mutex_lock(&mhi_chan->lock);
>  
>  	do {
> -- 
> 2.7.4
> 

-- 
மணிவண்ணன் சதாசிவம்
