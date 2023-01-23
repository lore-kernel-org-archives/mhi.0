Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C813817
	for <mhi@lists.linux.dev>; Mon, 23 Jan 2023 07:23:51 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id i1so8107324pfk.3
        for <mhi@lists.linux.dev>; Sun, 22 Jan 2023 23:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m6tKnmsJto8KD4J43SeQBXNxHSRMZg2BEAm8vOemlMs=;
        b=imgatys2gOwj1+CmS5nKJZghqisUaHWlguo9LLcyM/LU0uLMA0+3QMNsLoikalaKia
         2dAv4UawkBfT33PRvgi8dSWWh3WCz34fxmOUi2ZX8ccTbl+IShNiNwhDK1mCJAnbss5P
         sd6bXgSSRWz9+bNiA1/1QYGFVwJzekmDj29iDsJvKkTkpMTUh6r+8MsKxt5AuIyobm3w
         zvSLo3DwqPwwdavVKlzq4VJJdVTi0TDRds8jqAFsM1gK2vlxBsrU8l+cSmnyoFxDRu/Q
         ceTN3oFu7yE5BpzEgaVhqI+XE76y9Owzv6edMpMrUbdXaSZAmVrpoomT06Cy5B+2+72Q
         Ud6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m6tKnmsJto8KD4J43SeQBXNxHSRMZg2BEAm8vOemlMs=;
        b=QIgzeN/tucZMj6H1NcMsqIY7BJEOdlFR0xe7MPp6/oaA0gdA7xYif5yfibsQykojA3
         +PDMEQ2dXjQ53xfFMSgrDoID5rQom3Splo4zomrEjjWR28v5BWVfO8+23Db0Ls9kEmPX
         BB5CoqcZzFTsOs1H0d3MXBUBV57XuHZZuHq860X6TtIGbi+ikrF8lx/FmR7MR+xUR7Ud
         IlhOuDzmhL9a/pG2Q+5UiW+SetW6Fzj6MC0sSGHv6pNmrqTXDu4MBYRE0xKMS8IwOJJW
         9vaWt6Nr+GGtrEWw7n4b0J/+HQT1suul8pzoJKwIlwSz9pZc/kL2bC4xzmot4jIve+aD
         P1xA==
X-Gm-Message-State: AFqh2kpuii++OTeLYZiTiFLJI9hmGwCGEHVO+AQKVR2zxOxEk2AqAL9w
	ypUwpwDKaPbAJ+ADsLpnDCqHa1slo2kGNX8=
X-Google-Smtp-Source: AMrXdXtSmM5/wlX9Cp8Nl4+aTYcH4xyLP/uQeYZbZVprkpOr08XwZgbhvSRkp3J35n0JnC6l+Vu0dA==
X-Received: by 2002:a62:1507:0:b0:581:6069:5c00 with SMTP id 7-20020a621507000000b0058160695c00mr24893986pfv.28.1674458630223;
        Sun, 22 Jan 2023 23:23:50 -0800 (PST)
Received: from thinkpad ([117.193.209.99])
        by smtp.gmail.com with ESMTPSA id z13-20020aa79e4d000000b0058bc1a13ffcsm17005111pfq.25.2023.01.22.23.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jan 2023 23:23:48 -0800 (PST)
Date: Mon, 23 Jan 2023 12:53:41 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: mhi@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] MHI EP fixes and improvements
Message-ID: <20230123072341.GA14294@thinkpad>
References: <20221228161704.255268-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221228161704.255268-1-manivannan.sadhasivam@linaro.org>

On Wed, Dec 28, 2022 at 09:46:58PM +0530, Manivannan Sadhasivam wrote:
> This series fixes several issues on the MHI EP stack and also improves
> the suspend and resume functionality.
> 

Applied to mhi-next!

Thanks,
Mani

> Thanks,
> Mani
> 
> Manivannan Sadhasivam (6):
>   bus: mhi: ep: Power up/down MHI stack during MHI RESET
>   bus: mhi: ep: Check if the channel is supported by the controller
>   bus: mhi: ep: Only send -ENOTCONN status if client driver is available
>   bus: mhi: ep: Fix the debug message for MHI_PKT_TYPE_RESET_CHAN_CMD
>     cmd
>   bus: mhi: ep: Move chan->lock to the start of processing queued ch
>     ring
>   bus: mhi: ep: Save channel state locally during suspend and resume
> 
>  drivers/bus/mhi/ep/main.c | 79 +++++++++++++++++++++------------------
>  1 file changed, 42 insertions(+), 37 deletions(-)
> 
> -- 
> 2.25.1
> 

-- 
மணிவண்ணன் சதாசிவம்
