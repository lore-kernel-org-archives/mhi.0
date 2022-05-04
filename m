Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13AB2101
	for <mhi@lists.linux.dev>; Wed,  4 May 2022 07:21:57 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id w17-20020a17090a529100b001db302efed6so524352pjh.4
        for <mhi@lists.linux.dev>; Wed, 04 May 2022 00:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FWCJbI4CGT2i31kMbhu+0FR5T+EOna1DU84vOLrzsmI=;
        b=qlAFA/71vDvjib7s4u5s/9fb9WhmNOa74bwXdUw569sClb3DOkNKgU0LG38S7loFYF
         i8zz7CEcGmD4sFS8CZvKH3YxwXSX92OOJ04rhqQzZdB3IAbiWjhkRgC6aXPMsGRW0dRy
         v7UWFf7x8wDQ8xN0tSJQk2YEdaWp4qWeT+ym12lhq8ZEVA/fvdDb9QazbKHUYD/JLmtS
         CLG0QbD33jzFgr5ZtivpApzPL2mxJOyHfT6J8v9F9GVt/lRG4ZtgocaH6ISdaYJiljCJ
         1m57cFJaOc+I6rkUNzsBinGdtwXOzUfeCspq2yKQ8X3HQHnlEwER8JPxubt6jMUBciqe
         egaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FWCJbI4CGT2i31kMbhu+0FR5T+EOna1DU84vOLrzsmI=;
        b=DpUjvpm5+rOnbj7H5XpJvqRNSw2fxDl7Fomh7ToW2OZN0+Xkjbu11K7vmW+HTMdS/O
         ct/b4ksZMQ0C+TgnJ1W9jxI6rN76a22/DF7K/pOpdnr+2yMJiVUsyqWO8PyCXncRMffJ
         x5m4eVltyMGL/6fJnMgcazwndpuo5DL02oARvXRVHu9uXaQurLnF4ZBRVUsxyJHUVD8W
         D0R/fjgogMgaFFxSS4LkfOnlsRZMLWpUBzauY9gEfxl/BUmzY9m5gtqjJPLRveiH8kZI
         Y+krYuT74puQl1F1dDwaYtVfsmky/rWw5KFql7CW06CWOrrDrnsvgzUa/0vbIQbvBgt4
         DYFA==
X-Gm-Message-State: AOAM532yXnrfONoNu/NdOi/bIPl/F9Z2o2aJJpkmzbfcTNwMeV0WOOwU
	xyvTJ+P/+lFTKFVO8FFaqdDPUzsV0Rv85YWxX2u8UU6dvy8=
X-Google-Smtp-Source: ABdhPJxw1DoDKhe05oCD8505mnMKAIxbnxSdPRDLpH6njPy7/kkzjZZ07oYyjOT0XxJ73DnoPKi0bglyZR9oiRkgFhA=
X-Received: by 2002:a17:902:70cb:b0:158:424e:a657 with SMTP id
 l11-20020a17090270cb00b00158424ea657mr20146250plt.6.1651648917003; Wed, 04
 May 2022 00:21:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220502104144.91806-1-manivannan.sadhasivam@linaro.org> <20220502104144.91806-6-manivannan.sadhasivam@linaro.org>
In-Reply-To: <20220502104144.91806-6-manivannan.sadhasivam@linaro.org>
From: Loic Poulain <loic.poulain@linaro.org>
Date: Wed, 4 May 2022 09:21:20 +0200
Message-ID: <CAMZdPi_i60TqszUL+=ocMn-4veyoGRQoOGD_B4YiEpz_uWE+ZQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] bus: mhi: host: Remove redundant dma_wmb() before ctx
 wp update
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_hemantk@quicinc.com, 
	quic_bbhatt@quicinc.com
Content-Type: text/plain; charset="UTF-8"

Hi Mani,

On Mon, 2 May 2022 at 12:42, Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
>
> The endpoint device will only read the context wp when the host rings
> the doorbell.

Are we sure about this statement? what if we update ctxt_wp while the
device is still processing the previous ring? is it going to continue
processing the new ctxt_wp or wait for a new doorbell interrupt? what
about burst mode in which we don't ring at all (ring_db is no-op)?

> And moreover the doorbell write is using writel(). This
> guarantess that the prior writes will be completed before ringing
> doorbell.

Yes but the barrier is to ensure that descriptor/ring content is
updated before we actually pass it to device ownership, it's not about
ordering with the doorbell write, but the memory coherent ones.

>
> So there is no need of an additional dma_wmb() to order the coherent
> memory writes w.r.t each other. Even if the writes gets reordered, it
> won't affect the endpoint device.
>
> Cc: Loic Poulain <loic.poulain@linaro.org>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  drivers/bus/mhi/host/main.c | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
> index 966ffc2458b9..6706a82d3aa8 100644
> --- a/drivers/bus/mhi/host/main.c
> +++ b/drivers/bus/mhi/host/main.c
> @@ -138,11 +138,6 @@ void mhi_ring_chan_db(struct mhi_controller *mhi_cntrl,
>
>         db = ring->iommu_base + (ring->wp - ring->base);
>
> -       /*
> -        * Writes to the new ring element must be visible to the hardware
> -        * before letting h/w know there is new element to fetch.
> -        */
> -       dma_wmb();
>         *ring->ctxt_wp = cpu_to_le64(db);
>
>         mhi_chan->db_cfg.ring_db(mhi_cntrl, &mhi_chan->db_cfg,
> --
> 2.25.1
>

Regards,
Loic
