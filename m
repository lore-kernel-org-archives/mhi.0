Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6637C
	for <mhi@lists.linux.dev>; Mon, 28 Feb 2022 16:10:51 +0000 (UTC)
Received: by mail-il1-f177.google.com with SMTP id q4so10396976ilt.0
        for <mhi@lists.linux.dev>; Mon, 28 Feb 2022 08:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=8jmx30ZbNRzhnyuYyBnZsLywXfqEumxyi1nF6wYiqeE=;
        b=N8coS3WuZ7i775paXOmSmV+emY7pEAnuUsbNjDf1JPILKcAh/ovJPLdcyG6sXHvxyk
         coW9ufp/EgRCYplIxiAVjT83P1fpHProiukpD3qx7b3Vhhx6/dWq6Cyp+wGBAOW25X/5
         yFw08Zt1yJIrB/+WL2syYmNzvE6OjDrkAviWxqJC7Equ3+sB1cAl+cKr20qzwuGSylBq
         kobNlyVpIEGpbDpkFVH4VLpkZMoUYHPoYJCvjv1C5m1ptZHlkqARxbki34V+jkPazq04
         H2O1zgD1+3ZSZAZtSJx2AouqFX98+9cCBWYfOV8kkWNwfUEqZbGZtHg+epE0c+nPCuDP
         Rn6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=8jmx30ZbNRzhnyuYyBnZsLywXfqEumxyi1nF6wYiqeE=;
        b=o7w3PuN/OXX3afJK9zqk/i/d6yBXsIZeoMGva0UDvI/N4Yc7RzrSWeXGp3ICkL0Pui
         SwJcix2JuSqprijUha4ZUVIiQ+SMupuvQ+H7fMi0z98B3rg5SBs3F9q79xGWO3qk9TFL
         2s3VkNXIiLyIU0K5LZwa3WGK71uEC2JBUeBZAIDj//qUk+v62pZy9hOvoPVxlMBJ10yz
         Mp115wghe6ZMxIJ4JwwmQCVe0e+sn64WlGEronZ35P+le9U0+g4deQQrA9Z8VR4zeyD7
         +3Bp6/+0z9LONHUnVF0ZH5QNxmURx5SSV1bubBmuKi1ltXzlBUy+XN7HS3fYm9VB4zM8
         zDFg==
X-Gm-Message-State: AOAM530l30w5wTdDE859NiYgAnPxm9GrgAyQtjVybt5xcUhgi8ebqko6
	s9n6lTkk89V4NMebuFZV1jzOTQ==
X-Google-Smtp-Source: ABdhPJwOxhP4LjANGLGnHVGgdu+kdm5Otpzo6OH6lmLeJzNao/22ra5j4oxv0xsmy2R6qa8k2TbtCg==
X-Received: by 2002:a05:6e02:2142:b0:2bf:ad10:e00e with SMTP id d2-20020a056e02214200b002bfad10e00emr19082701ilv.114.1646064651009;
        Mon, 28 Feb 2022 08:10:51 -0800 (PST)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id u19-20020a6be413000000b0064103112badsm5826854iog.45.2022.02.28.08.10.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Feb 2022 08:10:50 -0800 (PST)
Message-ID: <3535c32c-9f57-325d-21fb-04724da07ccf@linaro.org>
Date: Mon, 28 Feb 2022 10:10:49 -0600
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 12/27] bus: mhi: ep: Add support for creating and
 destroying MHI EP devices
Content-Language: en-US
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 mhi@lists.linux.dev
Cc: quic_hemantk@quicinc.com, quic_bbhatt@quicinc.com,
 quic_jhugo@quicinc.com, vinod.koul@linaro.org, bjorn.andersson@linaro.org,
 dmitry.baryshkov@linaro.org, quic_vbadigan@quicinc.com,
 quic_cang@quicinc.com, quic_skananth@quicinc.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220228124344.77359-1-manivannan.sadhasivam@linaro.org>
 <20220228124344.77359-13-manivannan.sadhasivam@linaro.org>
From: Alex Elder <elder@linaro.org>
In-Reply-To: <20220228124344.77359-13-manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/28/22 6:43 AM, Manivannan Sadhasivam wrote:
> This commit adds support for creating and destroying MHI endpoint devices.
> The MHI endpoint devices binds to the MHI endpoint channels and are used
> to transfer data between MHI host and endpoint device.
> 
> There is a single MHI EP device for each channel pair. The devices will be
> created when the corresponding channels has been started by the host and
> will be destroyed during MHI EP power down and reset.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Looks good.

Reviewed-by: Alex Elder <elder@linaro.org>

> ---
>   drivers/bus/mhi/ep/main.c | 83 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 83 insertions(+)
> 
> diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
> index 2bdcf1657479..3afae0bfd83c 100644
> --- a/drivers/bus/mhi/ep/main.c
> +++ b/drivers/bus/mhi/ep/main.c
> @@ -68,6 +68,89 @@ static struct mhi_ep_device *mhi_ep_alloc_device(struct mhi_ep_cntrl *mhi_cntrl,
>   	return mhi_dev;
>   }
>   
> +/*
> + * MHI channels are always defined in pairs with UL as the even numbered
> + * channel and DL as odd numbered one. This function gets UL channel (primary)
> + * as the ch_id and always looks after the next entry in channel list for
> + * the corresponding DL channel (secondary).
> + */
> +static int mhi_ep_create_device(struct mhi_ep_cntrl *mhi_cntrl, u32 ch_id)
> +{
> +	struct mhi_ep_chan *mhi_chan = &mhi_cntrl->mhi_chan[ch_id];
> +	struct device *dev = mhi_cntrl->cntrl_dev;
> +	struct mhi_ep_device *mhi_dev;
> +	int ret;
> +
> +	/* Check if the channel name is same for both UL and DL */
> +	if (strcmp(mhi_chan->name, mhi_chan[1].name)) {
> +		dev_err(dev, "UL and DL channel names are not same: (%s) != (%s)\n",
> +			mhi_chan->name, mhi_chan[1].name);
> +		return -EINVAL;
> +	}
> +
> +	mhi_dev = mhi_ep_alloc_device(mhi_cntrl, MHI_DEVICE_XFER);
> +	if (IS_ERR(mhi_dev))
> +		return PTR_ERR(mhi_dev);
> +
> +	/* Configure primary channel */
> +	mhi_dev->ul_chan = mhi_chan;
> +	get_device(&mhi_dev->dev);
> +	mhi_chan->mhi_dev = mhi_dev;
> +
> +	/* Configure secondary channel as well */
> +	mhi_chan++;
> +	mhi_dev->dl_chan = mhi_chan;
> +	get_device(&mhi_dev->dev);
> +	mhi_chan->mhi_dev = mhi_dev;
> +
> +	/* Channel name is same for both UL and DL */
> +	mhi_dev->name = mhi_chan->name;
> +	dev_set_name(&mhi_dev->dev, "%s_%s",
> +		     dev_name(&mhi_cntrl->mhi_dev->dev),
> +		     mhi_dev->name);
> +
> +	ret = device_add(&mhi_dev->dev);
> +	if (ret)
> +		put_device(&mhi_dev->dev);
> +
> +	return ret;
> +}
> +
> +static int mhi_ep_destroy_device(struct device *dev, void *data)
> +{
> +	struct mhi_ep_device *mhi_dev;
> +	struct mhi_ep_cntrl *mhi_cntrl;
> +	struct mhi_ep_chan *ul_chan, *dl_chan;
> +
> +	if (dev->bus != &mhi_ep_bus_type)
> +		return 0;
> +
> +	mhi_dev = to_mhi_ep_device(dev);
> +	mhi_cntrl = mhi_dev->mhi_cntrl;
> +
> +	/* Only destroy devices created for channels */
> +	if (mhi_dev->dev_type == MHI_DEVICE_CONTROLLER)
> +		return 0;
> +
> +	ul_chan = mhi_dev->ul_chan;
> +	dl_chan = mhi_dev->dl_chan;
> +
> +	if (ul_chan)
> +		put_device(&ul_chan->mhi_dev->dev);
> +
> +	if (dl_chan)
> +		put_device(&dl_chan->mhi_dev->dev);
> +
> +	dev_dbg(&mhi_cntrl->mhi_dev->dev, "Destroying device for chan:%s\n",
> +		 mhi_dev->name);
> +
> +	/* Notify the client and remove the device from MHI bus */
> +	device_del(dev);
> +	put_device(dev);
> +
> +	return 0;
> +}
> +
>   static int mhi_ep_chan_init(struct mhi_ep_cntrl *mhi_cntrl,
>   			    const struct mhi_ep_cntrl_config *config)
>   {

