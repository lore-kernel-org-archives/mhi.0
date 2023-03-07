Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095DDAD5F
	for <mhi@lists.linux.dev>; Tue,  7 Mar 2023 16:48:21 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id c10so8439238pfv.13
        for <mhi@lists.linux.dev>; Tue, 07 Mar 2023 08:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678207701;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FQnICWvYNs7bD2B+ziOmGBVgtAqH+5wOKJPUGlck5eg=;
        b=z2ozD7ZRJgyIlEMW8q3T9LWyeevK9dBUmKibHc/1FJlFiyDrsvLAYj4xkJe3eFp3aY
         PUj/lf0VBUulWKNWcGVh3nWijnzJfDrDv51PSbRfRvAG8EqAu/QetAk3Q91guu85Fnnf
         DYpUtqsfxn2DLqozmhF71gsMFo4ekpt8nzABC3Z74/g7qDlK4H8RYSKVPDBAF2rsbcTR
         KTwW/XPlmZQ2OpW6iE05808tI6+EWazlk1DeIcp7ZpebXLtfat2dtN/oBKw5rR9n0dTw
         hFtlJUkUhislJFikc44YQKXYYGO0qyRKitUOlRGyGw7TYdPOexPHT3QquaiTPW5sH/rx
         bv9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678207701;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FQnICWvYNs7bD2B+ziOmGBVgtAqH+5wOKJPUGlck5eg=;
        b=HuIFegd3F9+Y8r7LmLDBXrHmG/aIVp1ayFWGSDyPNWTiF01JshUFKP5BfuFl71LMru
         fRhFQkx4P/MbdwknEH+FIxthVudApNmFpZ+XQlsRFVXvbJMcgPS0LBjdjhyaTd8d8zKP
         sSUwBlpOxs/RMWl3gjrblUMjNMnvtwVHtllvWhh56eqSLlbdLJ3r9CgOiq7IfqE8CA6x
         igI91c9cEGZkFQDeye87G2dthytWZaXTzDPky9E/o3Um+O3CvtrUCUuB+w+lkdXI3vv2
         wmGF1JqtaZIpvdhBQAskdm4UoDSvo5wUuQyu2g/mwbVJ3kc0oEbm4rxxl7zs2B3kf8D6
         CKQA==
X-Gm-Message-State: AO0yUKW5DThxAWHDOuEGBiCAKFR1eW0X1N+Qwijjfwntx9P3UkaQuVP8
	6ZNXuzxSUw/TlLx4QYRgDCCbycJZU/2ReeHieg==
X-Google-Smtp-Source: AK7set/xI2XzvtghAIfjdss+dCxdLBLJoPdvd/R/wO5iEqlbPT2FT9l8MyPTUZxYk26HbVjL/HTF7w==
X-Received: by 2002:aa7:9489:0:b0:5a9:d619:e5e4 with SMTP id z9-20020aa79489000000b005a9d619e5e4mr13037993pfk.0.1678207701215;
        Tue, 07 Mar 2023 08:48:21 -0800 (PST)
Received: from thinkpad ([59.97.52.140])
        by smtp.gmail.com with ESMTPSA id d22-20020aa78e56000000b005a8512c9988sm8383488pfr.93.2023.03.07.08.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 08:48:20 -0800 (PST)
Date: Tue, 7 Mar 2023 22:18:16 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: ep: Demote unsupported channel error log to
 debug
Message-ID: <20230307164816.GH5599@thinkpad>
References: <20230307074248.86731-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230307074248.86731-1-manivannan.sadhasivam@linaro.org>

On Tue, Mar 07, 2023 at 01:12:48PM +0530, Manivannan Sadhasivam wrote:
> Not all MHI endpoints will support all available channels. Most of them
> support only a selected number of channels based on the implementations.
> In those cases, it is not needed to print error messages in the endpoint.
> So let's demote the error log to debug.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Applied to mhi-next!

Thanks,
Mani

> ---
>  drivers/bus/mhi/ep/main.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
> index 48bc6abb7b37..ba062df4fe25 100644
> --- a/drivers/bus/mhi/ep/main.c
> +++ b/drivers/bus/mhi/ep/main.c
> @@ -126,7 +126,7 @@ static int mhi_ep_process_cmd_ring(struct mhi_ep_ring *ring, struct mhi_ring_ele
>  
>  	/* Check if the channel is supported by the controller */
>  	if ((ch_id >= mhi_cntrl->max_chan) || !mhi_cntrl->mhi_chan[ch_id].name) {
> -		dev_err(dev, "Channel (%u) not supported!\n", ch_id);
> +		dev_dbg(dev, "Channel (%u) not supported!\n", ch_id);
>  		return -ENODEV;
>  	}
>  
> @@ -702,7 +702,7 @@ static void mhi_ep_cmd_ring_worker(struct work_struct *work)
>  		el = &ring->ring_cache[ring->rd_offset];
>  
>  		ret = mhi_ep_process_cmd_ring(ring, el);
> -		if (ret)
> +		if (ret && ret != -ENODEV)
>  			dev_err(dev, "Error processing cmd ring element: %zu\n", ring->rd_offset);
>  
>  		mhi_ep_ring_inc_index(ring);
> -- 
> 2.25.1
> 

-- 
மணிவண்ணன் சதாசிவம்
