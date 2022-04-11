Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D16310ED
	for <mhi@lists.linux.dev>; Mon, 11 Apr 2022 06:00:50 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id o5so1711252pjr.0
        for <mhi@lists.linux.dev>; Sun, 10 Apr 2022 23:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TOrz2TYyKKln5WCCmCjdg2Bgm93TEWKafFMisAhjfgo=;
        b=uDKUMuBk+Zr5/6D3mpQDlD7lWnjM89KGeJd7wpYHIbDzTCmMEEbv4gzYPu+mrFUF8R
         /e1fvzqQIFvgaWr7KJng5KPikVRqS07l2vmjsF39/9hj4FPS4yYnyWsHxpHkfgIjGLSq
         MofXjUkmxK6eTU1CXHQ5fZPtlHn75XefVY5TcSwrMUl92BhW7gcJQuW+FxItHDAX8Iz8
         rU42CvawGyfJuWNlfIcVZCKc0masTO59K91oGj0/sqWpHwEtoQa8CIqTLCXLGapsXTaA
         K+cAD46UoErUo6n5PAaZ1EFciGA9RRMdLcHi5BrYLP1baMkKyVNLnPx78ZwUoHc2T4zh
         NxRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TOrz2TYyKKln5WCCmCjdg2Bgm93TEWKafFMisAhjfgo=;
        b=wItZXhHzk8axaq+GQ2e1npIIhdNWeWUijx16O8gXo7a4OvHqb6H40m8kXI3aNOaR6J
         1+v6T49Q8gXlNh7uEmUH5RVPKJNne3vTor5WS+EEkAkFOjoV7o6K7JqlFhcg51mgEiYV
         XJoLfaoFeqOa+4SH/UPR5DqIB19I5n6xYqAS8xhS61FHx6P9B9/5tMnPMa2zI5yVC2AR
         +SzSrJ1LQ8pvbDJZ40YoO+5ipn50iXqjyPVv0Os1TbbgSmLs1ZkFxZo5nRXI/weHBBMv
         59hD/Im7v+VXWzppbB4VgVe7pBEdYnhZdMPrLoV9q3AD2ScO35nWyy6agUoUKy9wMS+M
         je6g==
X-Gm-Message-State: AOAM533pgadfGksGn5Z0mgJvh69NJwCYNuuS5YvpRUj9XWIzJ6jtGttC
	KsrOvwuAWDuQQSt3yrnTHdlBj6CnMCAI
X-Google-Smtp-Source: ABdhPJymr2uHiw3rePGk47HXX4/TNLZfo6i2NSiXElg+EFB7Li4XBX7woodET5r2u9jQxv/rOEU/tQ==
X-Received: by 2002:a17:90a:8591:b0:1b9:da10:2127 with SMTP id m17-20020a17090a859100b001b9da102127mr34902852pjn.13.1649656850143;
        Sun, 10 Apr 2022 23:00:50 -0700 (PDT)
Received: from thinkpad ([117.217.182.106])
        by smtp.gmail.com with ESMTPSA id f4-20020a056a0022c400b004fb2292cd74sm34245714pfj.206.2022.04.10.23.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 23:00:49 -0700 (PDT)
Date: Mon, 11 Apr 2022 11:30:46 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: mhi@lists.linux.dev
Cc: quic_hemantk@quicinc.com, quic_bbhatt@quicinc.com,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Update Hemant's email id
Message-ID: <20220411060046.GA16845@thinkpad>
References: <20220404064226.59825-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220404064226.59825-1-manivannan.sadhasivam@linaro.org>

On Mon, Apr 04, 2022 at 12:12:26PM +0530, Manivannan Sadhasivam wrote:
> The codeaurora email domain is no longer available for Qualcomm employees.
> Qualcomm employees should now use the new email ids from quicinc domain for
> opensource contributions.
> 
> So let's use the new email id for Hemant.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Applied to mhi-next!

Thanks,
Mani

> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fd768d43e048..d714313d5cb0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12793,7 +12793,7 @@ F:	arch/arm64/boot/dts/marvell/armada-3720-uDPU.dts
>  
>  MHI BUS
>  M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> -R:	Hemant Kumar <hemantk@codeaurora.org>
> +R:	Hemant Kumar <quic_hemantk@quicinc.com>
>  L:	mhi@lists.linux.dev
>  L:	linux-arm-msm@vger.kernel.org
>  S:	Maintained
> -- 
> 2.25.1
> 
