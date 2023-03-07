Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0764BA23
	for <mhi@lists.linux.dev>; Tue,  7 Mar 2023 16:35:38 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id ce7so8415655pfb.9
        for <mhi@lists.linux.dev>; Tue, 07 Mar 2023 08:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678206938;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9pR75UXxJJDCvUExjKq/k+oT/PbY8Y2h2A1+3G11v6I=;
        b=iPdlCPQQsX8iALAOCSW21wKVChAuVbCrGq0ewYPiUTyn/PMOrm6AWT2UYBkG2rLmTO
         ULYUGIwliqabiguRqb2oFHjMcsd5hH+/UINhgs+3yrohu97AmX9r/0zfT1JNXHxsGQVc
         i5JA2plwnCeG0OyEcoivfOv8j+/oggKJ5/kSm5MZ6EtqsSl4mhzSDWdblMDJ426pk3ch
         dG4Wm30JvYQfBT7k2O3ZFmP554Ppf+bfly6JajgOt76rFdyi1E4HXgmi5xvhpJFBwlID
         6InQZYbhnOUrvbXh3EUmygJgI7FNZbk04RaIEWR7Ihog6ayCwxI0U3tkcE7YUM2hqZJY
         Wneg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678206938;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9pR75UXxJJDCvUExjKq/k+oT/PbY8Y2h2A1+3G11v6I=;
        b=5LLzeKjfQZCaK57Q/yhrShCoEgVyfdhDvdgJwqOuQkyT3o8s8Yy42dt5gN2xCf2mKr
         ySJtfDdGLcKsphnLfN4D3co0640NBrQ/5hVy+HThHFR2nwSaG4oalLeFq3h/qAzwTUsh
         R/ifswpjusrdS49yZlU621YUt7CBm7qfBvxpxOG9HAcU1KEXiUpNpT6eVMNu6hbg6uqV
         uF4uZxSDu9jVJBGzEVNWWGRaph3oSmEWTDgcb1cvOp0fl3vCdV4UgwniqsZni7GeX4oW
         ktKDOCXHrOKRa9LagSJ9ynekuArkC6Q/G+YuPOAvl/lFrHR4GlIFrBmuJ8FUcZ0Ap5z3
         QTSQ==
X-Gm-Message-State: AO0yUKWRk9UrFJUcI1lITCDzxtCHjpBTBlKHz+LQYs07JMZVRUn3GiPU
	r53PcGJMoB9KUqY5Yvwzlrpi821PJGiwGfMKPA==
X-Google-Smtp-Source: AK7set8TuJt9LLSwyRmIBUOELWvLSEAXveq87OFp6D3M8Tcck6ETSoEbI6T6kjt/B12y0TrmcXgGrA==
X-Received: by 2002:a62:19cd:0:b0:5a8:ac0f:e116 with SMTP id 196-20020a6219cd000000b005a8ac0fe116mr12879996pfz.24.1678206937997;
        Tue, 07 Mar 2023 08:35:37 -0800 (PST)
Received: from thinkpad ([59.97.52.140])
        by smtp.gmail.com with ESMTPSA id u4-20020aa78484000000b00575d1ba0ecfsm8031406pfn.133.2023.03.07.08.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 08:35:37 -0800 (PST)
Date: Tue, 7 Mar 2023 22:05:33 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: mhi@lists.linux.dev
Cc: quic_jhugo@quicinc.com, quic_vpernami@quicinc.com
Subject: Re: [PATCH] bus: mhi: host: Remove mhi_poll() API
Message-ID: <20230307163533.GF5599@thinkpad>
References: <20230224120147.19851-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230224120147.19851-1-manivannan.sadhasivam@linaro.org>

On Fri, Feb 24, 2023 at 05:31:47PM +0530, Manivannan Sadhasivam wrote:
> mhi_poll() API is not used within the MHI stack and also not by any client
> drivers in mainline. So let's remove it until any consumer is available.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Applied to mhi-next!

Thanks,
Mani

> ---
>  drivers/bus/mhi/host/main.c | 15 ---------------
>  include/linux/mhi.h         |  7 -------
>  2 files changed, 22 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
> index df0fbfee7b78..4fa0969472fc 100644
> --- a/drivers/bus/mhi/host/main.c
> +++ b/drivers/bus/mhi/host/main.c
> @@ -1679,18 +1679,3 @@ void mhi_unprepare_from_transfer(struct mhi_device *mhi_dev)
>  	}
>  }
>  EXPORT_SYMBOL_GPL(mhi_unprepare_from_transfer);
> -
> -int mhi_poll(struct mhi_device *mhi_dev, u32 budget)
> -{
> -	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
> -	struct mhi_chan *mhi_chan = mhi_dev->dl_chan;
> -	struct mhi_event *mhi_event = &mhi_cntrl->mhi_event[mhi_chan->er_index];
> -	int ret;
> -
> -	spin_lock_bh(&mhi_event->lock);
> -	ret = mhi_event->process_event(mhi_cntrl, mhi_event, budget);
> -	spin_unlock_bh(&mhi_event->lock);
> -
> -	return ret;
> -}
> -EXPORT_SYMBOL_GPL(mhi_poll);
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index a5441ad33c74..f6de4b6ecfc7 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -765,13 +765,6 @@ int mhi_prepare_for_transfer_autoqueue(struct mhi_device *mhi_dev);
>   */
>  void mhi_unprepare_from_transfer(struct mhi_device *mhi_dev);
>  
> -/**
> - * mhi_poll - Poll for any available data in DL direction
> - * @mhi_dev: Device associated with the channels
> - * @budget: # of events to process
> - */
> -int mhi_poll(struct mhi_device *mhi_dev, u32 budget);
> -
>  /**
>   * mhi_queue_dma - Send or receive DMA mapped buffers from client device
>   *                 over MHI channel
> -- 
> 2.25.1
> 

-- 
மணிவண்ணன் சதாசிவம்
