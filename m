Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E4015B3
	for <mhi@lists.linux.dev>; Sat, 29 Oct 2022 03:47:50 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id l6so6233095pjj.0
        for <mhi@lists.linux.dev>; Fri, 28 Oct 2022 20:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pHHuVIPCzYs7vFmo8UtoBL7CxgkvRSRe5+6DkfW68II=;
        b=I4+9NGTpHkN9TQzvwFMlgL1TXIJuXtWwAqK78qqc3zF+sNmjB3S55ZfzRd49mF2xlC
         Z+gZl2Vyoe25nuhYnO3/mw4dYexkH4PUoS+YSooCQPyH2dWOL19alcDoIuf0EHAxsoYS
         WfuO/3lml48WNuWYE3wBzChjkYcaMWFWPh6TwzIQKr9JXiQNMMUaetRgHFrpZeunWwqY
         mDn9/MzQeW2Lo9qve8OSQyup1FwEJ9v0zPu8jaQFThOy+gpd8I96JgYwMdsNBGeI8zsn
         NXzGRFZjXW6YP7u7LSifJhNMCddWJ9hYIO/jO5jgBxehUiDy2kttBUf5i6lk9kRYf0kO
         i3mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pHHuVIPCzYs7vFmo8UtoBL7CxgkvRSRe5+6DkfW68II=;
        b=crafoJ6JhcpJdmfG9ruVHUDE0kpjBRFFE2ENEeLrAQdIEfflNh7NuXwjDejQIKX+9X
         euSubF/wu1n4RU8Kq5HdoCpiAobuEKDjWGD77m04PjqAXQxSa+4kNl5a2ZfLkMI5xwr6
         tPbvDGPlPo4/I+JfcZbXnsrwQIDYOPnw7eCyxUjHB13iequlhnnTnot4CU2yhAug+DYK
         hBuxqhQIiZyUoe/T4wwOzuu1Vqu+UqdNE5sCuXGVM3bQT3RqfSrjtf4qj0ql9iyUj3kG
         baZboi83z11apuCT6zXuKnjnWGB9tIkJmWo+cCGFC9jYdYrwUoJtUrxFG06yGzFupsj3
         ldCw==
X-Gm-Message-State: ACrzQf3gm0C3Xk6Mj74yu315WDcu5UBxjOBB+ha3Afc1SSUeKmB39JFK
	Tabazf+t7EppRVrOvP/vYMXOTIfaqqDn
X-Google-Smtp-Source: AMsMyM5Zcg3AuhBsfjwRtrcFrektA3tWfdXZQtZBW8NNlwtdTNgJimcz25+wKdzPhml1gPJQufMDzg==
X-Received: by 2002:a17:90b:17c3:b0:213:2578:e5ce with SMTP id me3-20020a17090b17c300b002132578e5cemr20042047pjb.231.1667015269407;
        Fri, 28 Oct 2022 20:47:49 -0700 (PDT)
Received: from thinkpad ([59.92.103.167])
        by smtp.gmail.com with ESMTPSA id y28-20020a634b1c000000b004393c5a8006sm195286pga.75.2022.10.28.20.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 20:47:48 -0700 (PDT)
Date: Sat, 29 Oct 2022 09:17:43 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Remove Hemant from MHI bus
Message-ID: <20221029034743.GA5362@thinkpad>
References: <20221028174257.52525-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221028174257.52525-1-manivannan.sadhasivam@linaro.org>

On Fri, Oct 28, 2022 at 11:12:57PM +0530, Manivannan Sadhasivam wrote:
> Hemant moved out of Qualcomm and expressed his wish to not continue doing
> any reviews for MHI patches. So let's remove him from MAINTAINERS file.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Applied to mhi-next!

Thanks,
Mani

> ---
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cf0f18502372..ad9279218885 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13395,7 +13395,6 @@ F:	arch/arm64/boot/dts/marvell/armada-3720-uDPU.dts
>  
>  MHI BUS
>  M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> -R:	Hemant Kumar <quic_hemantk@quicinc.com>
>  L:	mhi@lists.linux.dev
>  L:	linux-arm-msm@vger.kernel.org
>  S:	Maintained
> -- 
> 2.25.1
> 

-- 
மணிவண்ணன் சதாசிவம்
