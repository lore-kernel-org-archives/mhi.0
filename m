Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB8466A1
	for <mhi@lists.linux.dev>; Tue, 22 Feb 2022 16:05:20 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id e79so20681989iof.13
        for <mhi@lists.linux.dev>; Tue, 22 Feb 2022 08:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=NDozPatV6Z0U3upLRoA8/0EfvFCyJgU33xu9RXKtnXw=;
        b=qlBo4TNyIiMsjvCisuZQsfrUIdv8juJl7jtH5huUm9T+yenzjxsR383FFe/T9PFGjF
         rYIWLMfTazeq3TEx12AtcTncKpXfRJg5hkt5Yl565taGFtaRViwGUD+KIvTL2tlM3gm+
         5TQI5NFrSO3d0T13GQdRFokkd5cnDL7Lidys0nDgndjhRU1h4oN+r0F17TuDd6SQDccN
         cH/c4ejzG3ugG/1lgRAbO7jX6jO3TGclk09F1MbZXz2jvik4UhHhsK/gZs5fRr/Zs+kG
         7Y7qQpbIw7zUPCeDfyonjiRfjHyTNfawlki2vuVEgZZNbjFlCm6cquQq9/o4b5wSM0QB
         PT3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=NDozPatV6Z0U3upLRoA8/0EfvFCyJgU33xu9RXKtnXw=;
        b=xIDY/tkbUDnDuAU4w9YYj/qU3d0KEPKt+AV41UKfsYjlzTJeJTO2691hIot/gcP/mt
         bLQOANuGwGIJcz45NZ+Fyp2VIpYnEE3u4J/Oi67582MbqcWoG6pIABduchoUSK8b+6Mv
         eGJeBQc3JpFFhnp3NITzj7FOka9UF3In9kZ+oD+dg5E3VWJsZoufkSBbu478a9v1tO3X
         3shRGYHmKXqcZMOixkBn1ySBYqPEYahAnHGTIqe1QB4S+NqGD4yA6ihoQWbETkBq7Rq9
         DSpW1qt+ymrGTTwHbEKVYnFOc0xIlDTBOpnOAw3cZC7JLvCsx4NFGXy78gycoPreWsr6
         vYBg==
X-Gm-Message-State: AOAM5327lQ6l0AetFJUVRrxWu2yXwpjKNWQXkRRbc1bD6ZUXNVaG27dk
	KdAJPk9Ge/lBfW3/qFahaNduY51GzNvtzXgf
X-Google-Smtp-Source: ABdhPJz92BIziZiDFI/R2bhFKyeYRHuN1m718LzwtNyEXyTlVhT2O0XMp3NG/WcY1cOYjEY645t8Hg==
X-Received: by 2002:a05:6638:3045:b0:308:ed08:e744 with SMTP id u5-20020a056638304500b00308ed08e744mr20499419jak.253.1645545919672;
        Tue, 22 Feb 2022 08:05:19 -0800 (PST)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id c5sm1964435ilu.77.2022.02.22.08.05.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Feb 2022 08:05:18 -0800 (PST)
Message-ID: <4ec997ab-8a6f-76e7-20e7-b7f778124c87@linaro.org>
Date: Tue, 22 Feb 2022 10:05:17 -0600
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 23/25] bus: mhi: ep: Add support for queueing SKBs to
 the host
Content-Language: en-US
From: Alex Elder <elder@linaro.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev, quic_hemantk@quicinc.com, quic_bbhatt@quicinc.com,
 quic_jhugo@quicinc.com, vinod.koul@linaro.org, bjorn.andersson@linaro.org,
 dmitry.baryshkov@linaro.org, quic_vbadigan@quicinc.com,
 quic_cang@quicinc.com, quic_skananth@quicinc.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220212182117.49438-1-manivannan.sadhasivam@linaro.org>
 <20220212182117.49438-24-manivannan.sadhasivam@linaro.org>
 <766e6568-0b80-c745-dd8f-7f401fb0422d@linaro.org>
 <20220222143825.GH5029@thinkpad>
 <f3248103-9450-dcf0-719d-77c6dcd85bfe@linaro.org>
In-Reply-To: <f3248103-9450-dcf0-719d-77c6dcd85bfe@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/22/22 9:18 AM, Alex Elder wrote:
> 
>> But anyway, there is no need to check for CHAIN flag while writing to 
>> host.
>> CHAIN flag is only used or even make sense when host writes data to 
>> device, so
> 
> I'm not sure that's correct, but I don't want to get into that issue here.
> We can talk about that separately.

I just wanted to send a short followup here.  My comments
were based on a misunderstanding, and Mani cleared it up
for me.  For host receives, the MHI specification states
that a packet that requires more than the size of the
buffer in a single TRE leads to an overflow event being
generated from the device to the host.  The buffer on
the TRE is filled, and subsequent packet data is written
to the next TRE's buffer (assuming it's present).

This differs from one feature of IPA and its GSI transfer
rings.  I won't explain that here, to avoid any confusion.

Mani explained things to me, and he's going to send an
updated series, which I'll review.

					-Alex
