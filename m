Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2292C9C
	for <mhi@lists.linux.dev>; Thu,  6 Jan 2022 00:27:36 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id b85so1160139qkc.1
        for <mhi@lists.linux.dev>; Wed, 05 Jan 2022 16:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=message-id:date:mime-version:user-agent:from:subject:to:cc
         :references:content-language:in-reply-to:content-transfer-encoding;
        bh=FZUZhQVoUQWqJzUA853fLdLBMkKWI3UHL+a5PMEO3LU=;
        b=MvTefVODGu+w2sWDHyFEDH7NACLiNHHk1g6h/M0jUBo0F1pu8G60Jweh9P390lmZXC
         NU493/fXP8+PYig01VXX2wSuNeSPo42fs6zdRznXWzOOxsfiOHSIWlF3A44LvAh5uRP9
         m5iroRx20d4hhac97bOnHzTR2UMTZyNTnyDi8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:from
         :subject:to:cc:references:content-language:in-reply-to
         :content-transfer-encoding;
        bh=FZUZhQVoUQWqJzUA853fLdLBMkKWI3UHL+a5PMEO3LU=;
        b=v4OKW/N6cXeZPgZeAzq2LgJaIkCo5NBlm76a9VjeUFVM7lhkV/AO63XMp0kedUlQ20
         2jPQflGwJtg6rOPm8+3mGajpTZ77Wg0u3tJmZIcwH3yGmprTXnXuZbECxhhNG6jZPMWS
         1XzG4H9irS8niKgxssRfxkUb2t2wMG4Gp+pn/8iLbh9431k+vPOkHrXhdvzplqA8U938
         2im/DI0FfTas5CypyCuNgM2jn0iyTVkJdV3QEDIeiqZ7tehCkTTcfPLFseGD9fCQqM34
         2YtSwARGaPFJh2gj/s75hcZgIEe+ryw298EhRzBjr+NYFRVaebri38/7G3Q/rVgEXS/B
         nNbA==
X-Gm-Message-State: AOAM53353wUPJ9mehbSn75+xxnuvg90De+Evd9D0caDRGYYbDDcZBFC4
	l3ymv+wqjhA4nlmH7e9Ojuvbew==
X-Google-Smtp-Source: ABdhPJyMJf0pQajc6sDwDIES/0dgAYQBInmqZyBfpM5tz0/YpMpqQb+QhKex4yeyFXXX89opIckJiQ==
X-Received: by 2002:a05:620a:4244:: with SMTP id w4mr40028827qko.569.1641428855119;
        Wed, 05 Jan 2022 16:27:35 -0800 (PST)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id z14sm367261qtw.59.2022.01.05.16.27.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jan 2022 16:27:34 -0800 (PST)
Message-ID: <06628c19-7839-2719-3263-7ab2b4410502@ieee.org>
Date: Wed, 5 Jan 2022 18:27:33 -0600
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
From: Alex Elder <elder@ieee.org>
Subject: Re: [PATCH 06/20] bus: mhi: ep: Add support for registering MHI
 endpoint client drivers
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 mhi@lists.linux.dev
Cc: hemantk@codeaurora.org, bbhatt@codeaurora.org, quic_jhugo@quicinc.com,
 vinod.koul@linaro.org, bjorn.andersson@linaro.org,
 dmitry.baryshkov@linaro.org, skananth@codeaurora.org,
 vpernami@codeaurora.org, vbadigan@codeaurora.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211202113553.238011-1-manivannan.sadhasivam@linaro.org>
 <20211202113553.238011-7-manivannan.sadhasivam@linaro.org>
Content-Language: en-US
In-Reply-To: <20211202113553.238011-7-manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/2/21 5:35 AM, Manivannan Sadhasivam wrote:
> This commit adds support for registering MHI endpoint client drivers
> with the MHI endpoint stack. MHI endpoint client drivers binds to one
> or more MHI endpoint devices inorder to send and receive the upper-layer
> protocol packets like IP packets, modem control messages, and diagnostics
> messages over MHI bus.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>   drivers/bus/mhi/ep/main.c | 85 +++++++++++++++++++++++++++++++++++++++
>   include/linux/mhi_ep.h    | 53 ++++++++++++++++++++++++
>   2 files changed, 138 insertions(+)
> 
> diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
> index db664360c8ab..ce0f99f22058 100644
> --- a/drivers/bus/mhi/ep/main.c
> +++ b/drivers/bus/mhi/ep/main.c
> @@ -193,9 +193,88 @@ void mhi_ep_unregister_controller(struct mhi_ep_cntrl *mhi_cntrl)
>   }
>   EXPORT_SYMBOL_GPL(mhi_ep_unregister_controller);
>   
> +static int mhi_ep_driver_probe(struct device *dev)
> +{
> +	struct mhi_ep_device *mhi_dev = to_mhi_ep_device(dev);
> +	struct mhi_ep_driver *mhi_drv = to_mhi_ep_driver(dev->driver);
> +	struct mhi_ep_chan *ul_chan = mhi_dev->ul_chan;
> +	struct mhi_ep_chan *dl_chan = mhi_dev->dl_chan;
> +

Either ul_chan or dl_chan must be set, right?  Check this.
Otherwise I think this looks OK.

					-Alex

> +	if (ul_chan)
> +		ul_chan->xfer_cb = mhi_drv->ul_xfer_cb;
> +
> +	if (dl_chan)
> +		dl_chan->xfer_cb = mhi_drv->dl_xfer_cb;
> +
> +	return mhi_drv->probe(mhi_dev, mhi_dev->id);
> +}

. . .
