Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9941728F8
	for <mhi@lists.linux.dev>; Wed, 16 Feb 2022 13:42:00 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id r78so1141680qka.4
        for <mhi@lists.linux.dev>; Wed, 16 Feb 2022 05:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=6j4YO9EeLP9xv8Xofu+6ziA8nbjvJoJDR5KXEsjK89o=;
        b=yf6JAkflOueXZXjKL+iAIQxIwZIGxKZ7CY258oto5DyyFf5IthKzMVJM2DeQRRhOqk
         l8ueu39PfduoZtUvNjM9OphHk4pJBh+GyvNFLoGJIMSCyg9q9JxYTE2hoaVuu5iiU+On
         dbEUrxVOsGwKNq2e8Y5n82fxvVXjPG85mn9ZmvyCiU+ZTG2FgeHe+3gGx0uNeIel9kXv
         U05clhL49ren8zZ23jryW+YpeFtqO4F7BgH7LO01ddgi+a0kfUFHUTujF/CGFYH1IvC1
         q9SNuZXU7wBDt2nsjtk5yj1vaXdMK9au30VeEvSihkUlrWXbu21EL0MQl1fjOXovJh1l
         SPPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=6j4YO9EeLP9xv8Xofu+6ziA8nbjvJoJDR5KXEsjK89o=;
        b=OgnlMy/gycbZyO9Sq/xb9+7g3g/h+LasDggT0tQ0y0ZDvkK/rbGQVbOV0AKrwdAZKc
         D7seIXnV9V6/l0yKCW44lzBTcTtGiGotMlN5oZboVy3UV0NwEihb7ET2qAdr8n4eQK2l
         d+Yn/Dg8Y/y4wCmtfOSjmiFWHMOjkQ9eQMr/FASPPOLy4ISJ/8y1oNcWAm6UH7FRnj/5
         0H/KfYkGbAy0Kerh9HDz5Xc3yKdZvHCHARyKmyuWQezIRj54wO7H91hnAGGFBgi1EtL2
         TwokK49uP8dQIprvPWqjCm0lEQ67a3u2hkN+PwaV/eD1/kn9DAWqOjX+w3TQpQLnq6Jd
         fygw==
X-Gm-Message-State: AOAM530BB+Eu86a673a1aLGoRoCxTs1+yt/IRYieeZgsRKZWIEUPf+Mv
	ixuLzO1q/GIu55E1UTBz437qWg==
X-Google-Smtp-Source: ABdhPJzFphhQVJqA67KCg9ZUhVDEZdpxfr6kz8Rh2VHfiSVWGlE0XV5lyzkM4ska8HCF3TAoDvKWlQ==
X-Received: by 2002:a05:620a:991:b0:508:18c1:e4d with SMTP id x17-20020a05620a099100b0050818c10e4dmr1183003qkx.479.1645018919368;
        Wed, 16 Feb 2022 05:41:59 -0800 (PST)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id t11sm13670938qkp.82.2022.02.16.05.41.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Feb 2022 05:41:58 -0800 (PST)
Message-ID: <8481b845-31c2-a830-4fe1-27798618fc2e@linaro.org>
Date: Wed, 16 Feb 2022 07:41:56 -0600
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
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev, quic_hemantk@quicinc.com, quic_bbhatt@quicinc.com,
 quic_jhugo@quicinc.com, vinod.koul@linaro.org, bjorn.andersson@linaro.org,
 dmitry.baryshkov@linaro.org, quic_vbadigan@quicinc.com,
 quic_cang@quicinc.com, quic_skananth@quicinc.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Paul Davey <paul.davey@alliedtelesis.co.nz>,
 Hemant Kumar <hemantk@codeaurora.org>, stable@vger.kernel.org
References: <20220212182117.49438-1-manivannan.sadhasivam@linaro.org>
 <20220212182117.49438-2-manivannan.sadhasivam@linaro.org>
 <0c95c9a5-cf66-dcec-bfde-0ca201206c8b@linaro.org>
 <20220216113353.GB6225@workstation>
From: Alex Elder <elder@linaro.org>
In-Reply-To: <20220216113353.GB6225@workstation>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/16/22 5:33 AM, Manivannan Sadhasivam wrote:
> On Tue, Feb 15, 2022 at 02:01:54PM -0600, Alex Elder wrote:
>> On 2/12/22 12:20 PM, Manivannan Sadhasivam wrote:
>>> From: Paul Davey <paul.davey@alliedtelesis.co.nz>
>>>
>>> On big endian architectures the mhi debugfs files which report pm state
>>> give "Invalid State" for all states.  This is caused by using
>>> find_last_bit which takes an unsigned long* while the state is passed in
>>> as an enum mhi_pm_state which will be of int size.
>>
>> I think this would have fixed it too, but your fix is better.
>>
>> 	int index = find_last_bit(&(unsigned long)state, 32);
>>
>>> Fix by using __fls to pass the value of state instead of find_last_bit.
>>>
>>> Fixes: a6e2e3522f29 ("bus: mhi: core: Add support for PM state transitions")
>>> Signed-off-by: Paul Davey <paul.davey@alliedtelesis.co.nz>
>>> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
>>> Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
>>> Cc: stable@vger.kernel.org
>>> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>>> ---
>>>    drivers/bus/mhi/core/init.c | 8 +++++---
>>>    1 file changed, 5 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
>>> index 046f407dc5d6..af484b03558a 100644
>>> --- a/drivers/bus/mhi/core/init.c
>>> +++ b/drivers/bus/mhi/core/init.c
>>> @@ -79,10 +79,12 @@ static const char * const mhi_pm_state_str[] = {
>>>    const char *to_mhi_pm_state_str(enum mhi_pm_state state)
>>
>> The mhi_pm_state enumerated type is an enumerated sequence, not
>> a bit mask.  So knowing what the last (most significant) set bit
>> is not meaningful.  Or normally it shouldn't be.
>>
>> If mhi_pm_state really were a bit mask, then its values should
>> be defined that way, i.e.,
>>
>> 	MHI_PM_STATE_DISABLE	= 1 << 0,
>> 	MHI_PM_STATE_DISABLE	= 1 << 1,
>> 	. . .
>>
>> What's really going on is that the state value passed here
>> *is* a bitmask, whose bit positions are those mhi_pm_state
>> values.  So the state argument should have type u32.
>>
> 
> I agree with you. It should be u32.
> 
>> This is a *separate* bug/issue.  It could be fixed separately
>> (before this patch), but I'd be OK with just explaining why
>> this change would occur as part of this modified patch.
>>
> 
> It makes sense to do it in the same patch itself as the change is
> minimal and moreover this patch will also get backported to stable.

Sounds good to me.	-Alex

>>>    {
>>> -	unsigned long pm_state = state;
>>> -	int index = find_last_bit(&pm_state, 32);
>>> +	int index;
>>> -	if (index >= ARRAY_SIZE(mhi_pm_state_str))
>>> +	if (state)
>>> +		index = __fls(state);
>>> +
>>> +	if (!state || index >= ARRAY_SIZE(mhi_pm_state_str))
>>>    		return "Invalid State";
>>
>> Do this test and return first, and skip the additional
>> check for "if (state)".
>>
> 
> We need to calculate index for the second check, so I guess the current
> code is fine.
> 
> Thanks,
> Mani
> 
>> 					-Alex
>>
>>>    	return mhi_pm_state_str[index];
>>

