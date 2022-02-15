Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFBCB7C
	for <mhi@lists.linux.dev>; Tue, 15 Feb 2022 20:01:56 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id q8so2377458iod.2
        for <mhi@lists.linux.dev>; Tue, 15 Feb 2022 12:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=mgRhZesJswJ3/ynhybWZOU8hr/RyxGXmljZMpkuuJW4=;
        b=odYILHCrnwbsOfpGCV+JaE2s3lvJ3Ht1HPQsg+dukRqGJ/nMmvPjXfhbODV+KhXzpB
         xjmbl7pccnIdeQmlVLdeYqk9GuyKYCcpVtJgyTA6rsJwxfCPUd/gXe15VgFoS7srSIXt
         HVqhAI66OnEg7f+9b6qs5KCandGkCGCU/oR906pGI4RTidBsmDIaqTSDsBplwgH3gLtR
         KgMTes4ezt7G/su7DY0xhgyBGgPtx0AFlwn9ngUv10uh0/YD+LhqgLS06qzKuCFW63Vo
         IqzDclXOZmCuX/JNhcVi0wqCotAOVGYMHgEBqrWcApVORpe8fdDk3YVOuG5EIMzDsKVd
         Cl2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=mgRhZesJswJ3/ynhybWZOU8hr/RyxGXmljZMpkuuJW4=;
        b=NNEIVxNTOkzyQf+6onrhg79sdwj9PmwlXJ3B/DTA/a5VhKugi4b/JV9cGX2i/MYE7l
         5xe2vTsbhWgQM6McuFoILuyTnmSql9O4Bqlwk5XtBcSpahyVVTnliomhn8gwq4XET3De
         yQdfmpPnq3vSWMoqTWyheWZbNoTiTSCObDLf6KUJ22Ky2C0pGgpLTD7Z9ZHRN/RAzUb5
         o9qZpJHs/ofqgSRZqVdQyW+ESjVp4Shqr1mcyMig0t9P3A4XeZVIngor2GtFhrtTRcz7
         n6rcw9AbD4ARayGbBEiY7ZHOjlN4jRHGyYrMQXR1jf5W7IvSCyjwWJTMnboKvWhhxiR4
         L5Vg==
X-Gm-Message-State: AOAM5323rdudp9feDnLs6VJvd7WqAOd1iL7F6+eXoWtjaWeF5zvljjTR
	uWOPuFM9lHJo6lbpJOKSkFx2uQ==
X-Google-Smtp-Source: ABdhPJwcV/GbLd9CikXqISjwI58+VzhQaVZtbO/QUToPhsnUL3EHQ2SawA9MRgvrzJCVD3rmpAdjkA==
X-Received: by 2002:a6b:e60d:: with SMTP id g13mr323488ioh.39.1644955315941;
        Tue, 15 Feb 2022 12:01:55 -0800 (PST)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id p11sm25923177iov.38.2022.02.15.12.01.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Feb 2022 12:01:55 -0800 (PST)
Message-ID: <0c95c9a5-cf66-dcec-bfde-0ca201206c8b@linaro.org>
Date: Tue, 15 Feb 2022 14:01:54 -0600
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 01/25] bus: mhi: Fix pm_state conversion to string
Content-Language: en-US
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 mhi@lists.linux.dev
Cc: quic_hemantk@quicinc.com, quic_bbhatt@quicinc.com,
 quic_jhugo@quicinc.com, vinod.koul@linaro.org, bjorn.andersson@linaro.org,
 dmitry.baryshkov@linaro.org, quic_vbadigan@quicinc.com,
 quic_cang@quicinc.com, quic_skananth@quicinc.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Paul Davey <paul.davey@alliedtelesis.co.nz>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Hemant Kumar <hemantk@codeaurora.org>, stable@vger.kernel.org
References: <20220212182117.49438-1-manivannan.sadhasivam@linaro.org>
 <20220212182117.49438-2-manivannan.sadhasivam@linaro.org>
From: Alex Elder <elder@linaro.org>
In-Reply-To: <20220212182117.49438-2-manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/12/22 12:20 PM, Manivannan Sadhasivam wrote:
> From: Paul Davey <paul.davey@alliedtelesis.co.nz>
> 
> On big endian architectures the mhi debugfs files which report pm state
> give "Invalid State" for all states.  This is caused by using
> find_last_bit which takes an unsigned long* while the state is passed in
> as an enum mhi_pm_state which will be of int size.

I think this would have fixed it too, but your fix is better.

	int index = find_last_bit(&(unsigned long)state, 32);

> Fix by using __fls to pass the value of state instead of find_last_bit.
> 
> Fixes: a6e2e3522f29 ("bus: mhi: core: Add support for PM state transitions")
> Signed-off-by: Paul Davey <paul.davey@alliedtelesis.co.nz>
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
> Cc: stable@vger.kernel.org
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>   drivers/bus/mhi/core/init.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index 046f407dc5d6..af484b03558a 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -79,10 +79,12 @@ static const char * const mhi_pm_state_str[] = {
>   
>   const char *to_mhi_pm_state_str(enum mhi_pm_state state)

The mhi_pm_state enumerated type is an enumerated sequence, not
a bit mask.  So knowing what the last (most significant) set bit
is not meaningful.  Or normally it shouldn't be.

If mhi_pm_state really were a bit mask, then its values should
be defined that way, i.e.,

	MHI_PM_STATE_DISABLE	= 1 << 0,
	MHI_PM_STATE_DISABLE	= 1 << 1,
	. . .

What's really going on is that the state value passed here
*is* a bitmask, whose bit positions are those mhi_pm_state
values.  So the state argument should have type u32.

This is a *separate* bug/issue.  It could be fixed separately
(before this patch), but I'd be OK with just explaining why
this change would occur as part of this modified patch.

>   {
> -	unsigned long pm_state = state;
> -	int index = find_last_bit(&pm_state, 32);
> +	int index;
>   
> -	if (index >= ARRAY_SIZE(mhi_pm_state_str))
> +	if (state)
> +		index = __fls(state);
> +
> +	if (!state || index >= ARRAY_SIZE(mhi_pm_state_str))
>   		return "Invalid State";

Do this test and return first, and skip the additional
check for "if (state)".

					-Alex

>   	return mhi_pm_state_str[index];

