Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCFA2F4E
	for <mhi@lists.linux.dev>; Tue, 22 Feb 2022 13:41:54 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id 195so9921396iou.0
        for <mhi@lists.linux.dev>; Tue, 22 Feb 2022 05:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=rqvvnvokXkoku3Es5PfYdus6e0X0eMIUBESKSyd+1kg=;
        b=smwgEOHrMzHvWEqQZpCYnR1qnmPv0h05cUoWdwwjXgT8rgeVVQ0m07fclL3Ojk0j0d
         ES/mFVmFimqCDzAMrxJcnV1gIuCyNHkLDqZro3f27LIQOYbDJyUBhc7kUHQkNsQTCaBG
         B4hDSNeoz2GWyDQ5FzWLlWjAk0/ubs0J4wHZqifWx5nyn15pIwbmfk71PqwwkmbV9MYv
         KnRpviNhcntmnIl6lzorZ+jJPw5lHSvpkWQdGb7h/J4EER4SvGwFPVOFFAO2LVqE9x/U
         u3GrAVFPjbtTJoXSFaev58sEjOgsydjikhcw52U9KgagY+bTrFLSOXUt3e/dHLHeyTMq
         Xehw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=rqvvnvokXkoku3Es5PfYdus6e0X0eMIUBESKSyd+1kg=;
        b=NesQ8Ryj2LeSTsle95zOvvroAnuY1Z0hTy8Gv3C2/xskQLPytTdqOELrkTs7DALvOI
         TVx3AJRjjW3Io6IWJI44O2mrtvmQty+OTbNExRbjI4H31zeBI55NCSKLKGooGpA7gGmn
         pnr/KBhCVMdVa5V4ljHKxiN7uQySXXZYSNfu1dJ0WGRBie9qrU1zs1hHGD49/1eOmNKz
         +gkvUTZ5mrLZNxKLw566shetCiK7q+60eBeFGwu1Em0DY6RFpoj+tDYTMTL/0yHmmqjJ
         0n47R8/s9KKEwLRKkAAP4FW7sq1zwW1no1ulWAzZ2BYsABvIuzvhbu2XFG9iGXSlgBPB
         IKxA==
X-Gm-Message-State: AOAM530rYLFx2FjaaqVSVdVPEHj8k8RQYgZMYP/J9AxTuzBAQIHhB6PV
	YQAgTuFlpXHnOWPMBntguSafJA==
X-Google-Smtp-Source: ABdhPJyS8s+X/O86KU0cqJ9e+X8mtTTAvSrkzsQ/nrfb2OMCon5y8J/eGZGek/ghBTVNvPlWuUzRfQ==
X-Received: by 2002:a02:c551:0:b0:314:ac09:428d with SMTP id g17-20020a02c551000000b00314ac09428dmr16309457jaj.0.1645537313552;
        Tue, 22 Feb 2022 05:41:53 -0800 (PST)
Received: from [172.22.22.26] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id x11sm840461ilg.22.2022.02.22.05.41.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Feb 2022 05:41:52 -0800 (PST)
Message-ID: <0fa2922e-ad3c-6ca3-f6c2-b8838d0cafcf@linaro.org>
Date: Tue, 22 Feb 2022 07:41:51 -0600
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 13/25] bus: mhi: ep: Add support for sending events to
 the host
Content-Language: en-US
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev, quic_hemantk@quicinc.com, quic_bbhatt@quicinc.com,
 quic_jhugo@quicinc.com, vinod.koul@linaro.org, bjorn.andersson@linaro.org,
 dmitry.baryshkov@linaro.org, quic_vbadigan@quicinc.com,
 quic_cang@quicinc.com, quic_skananth@quicinc.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220212182117.49438-1-manivannan.sadhasivam@linaro.org>
 <20220212182117.49438-14-manivannan.sadhasivam@linaro.org>
 <3396cc98-8640-8f5a-fad3-c7a913faaa58@linaro.org>
 <20220222060623.GA5029@thinkpad>
From: Alex Elder <elder@linaro.org>
In-Reply-To: <20220222060623.GA5029@thinkpad>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/22/22 12:06 AM, Manivannan Sadhasivam wrote:
> On Tue, Feb 15, 2022 at 04:39:17PM -0600, Alex Elder wrote:
>> On 2/12/22 12:21 PM, Manivannan Sadhasivam wrote:
>>> Add support for sending the events to the host over MHI bus from the
>>> endpoint. Following events are supported:
>>>
>>> 1. Transfer completion event
>>> 2. Command completion event
>>> 3. State change event
>>> 4. Execution Environment (EE) change event
>>>
>>> An event is sent whenever an operation has been completed in the MHI EP
>>> device. Event is sent using the MHI event ring and additionally the host
>>> is notified using an IRQ if required.
>>>
>>> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>>
>> A few things can be simplified here.
>>
>> 					-Alex
>>
>>> ---
>>>    drivers/bus/mhi/common.h      |  15 ++++
>>>    drivers/bus/mhi/ep/internal.h |   8 ++-
>>>    drivers/bus/mhi/ep/main.c     | 126 ++++++++++++++++++++++++++++++++++
>>>    include/linux/mhi_ep.h        |   8 +++
>>>    4 files changed, 155 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/bus/mhi/common.h b/drivers/bus/mhi/common.h
>>> index 728c82928d8d..26d94ed52b34 100644
>>> --- a/drivers/bus/mhi/common.h
>>> +++ b/drivers/bus/mhi/common.h
>>> @@ -176,6 +176,21 @@
>>>    #define MHI_TRE_GET_EV_LINKSPEED(tre)			((MHI_TRE_GET_DWORD(tre, 1) >> 24) & 0xFF)
>>>    #define MHI_TRE_GET_EV_LINKWIDTH(tre)			(MHI_TRE_GET_DWORD(tre, 0) & 0xFF)
>>> +/* State change event */
>>> +#define MHI_SC_EV_PTR					0
>>> +#define MHI_SC_EV_DWORD0(state)				cpu_to_le32(state << 24)
>>> +#define MHI_SC_EV_DWORD1(type)				cpu_to_le32(type << 16)
>>> +
>>> +/* EE event */
>>> +#define MHI_EE_EV_PTR					0
>>> +#define MHI_EE_EV_DWORD0(ee)				cpu_to_le32(ee << 24)
>>> +#define MHI_EE_EV_DWORD1(type)				cpu_to_le32(type << 16)
>>> +
>>> +/* Command Completion event */
>>> +#define MHI_CC_EV_PTR(ptr)				cpu_to_le64(ptr)
>>> +#define MHI_CC_EV_DWORD0(code)				cpu_to_le32(code << 24)
>>> +#define MHI_CC_EV_DWORD1(type)				cpu_to_le32(type << 16)
>>> +
>>>    /* Transfer descriptor macros */
>>>    #define MHI_TRE_DATA_PTR(ptr)				cpu_to_le64(ptr)
>>>    #define MHI_TRE_DATA_DWORD0(len)			cpu_to_le32(len & MHI_MAX_MTU)
>>> diff --git a/drivers/bus/mhi/ep/internal.h b/drivers/bus/mhi/ep/internal.h
>>> index 48d6e9667d55..fd63f79c6aec 100644
>>> --- a/drivers/bus/mhi/ep/internal.h
>>> +++ b/drivers/bus/mhi/ep/internal.h
>>> @@ -131,8 +131,8 @@ enum mhi_ep_ring_type {
>>>    };
>>>    struct mhi_ep_ring_element {
>>> -	u64 ptr;
>>> -	u32 dword[2];
>>> +	__le64 ptr;
>>> +	__le32 dword[2];
>>
>> Yay!
>>
>>>    };
>>>    /* Ring element */
>>> @@ -227,4 +227,8 @@ void mhi_ep_mmio_get_mhi_state(struct mhi_ep_cntrl *mhi_cntrl, enum mhi_state *s
>>>    void mhi_ep_mmio_init(struct mhi_ep_cntrl *mhi_cntrl);
>>>    void mhi_ep_mmio_update_ner(struct mhi_ep_cntrl *mhi_cntrl);
>>> +/* MHI EP core functions */
>>> +int mhi_ep_send_state_change_event(struct mhi_ep_cntrl *mhi_cntrl, enum mhi_state state);
>>> +int mhi_ep_send_ee_event(struct mhi_ep_cntrl *mhi_cntrl, enum mhi_ep_execenv exec_env);
>>> +
>>>    #endif
>>> diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
>>> index 2c8045766292..61f066c6286b 100644
>>> --- a/drivers/bus/mhi/ep/main.c
>>> +++ b/drivers/bus/mhi/ep/main.c
> 
> [...]
> 
>>> +static int mhi_ep_send_completion_event(struct mhi_ep_cntrl *mhi_cntrl,
>>> +					struct mhi_ep_ring *ring, u32 len,
>>> +					enum mhi_ev_ccs code)
>>> +{
>>> +	struct mhi_ep_ring_element event = {};
>>> +	__le32 tmp;
>>> +
>>> +	event.ptr = le64_to_cpu(ring->ring_ctx->generic.rbase) +
>>> +			ring->rd_offset * sizeof(struct mhi_ep_ring_element);
>>
>> I'm not sure at the moment where this will be called.  But
>> it might be easier to pass in the transfer channel pointer
>> rather than compute its address here.

As I recall, I made this comment thinking that in the context of
the caller, the ring element address might be known; but I didn't
look at those calling locations to see.

In any case, what you do here looks correct, so that's fine.

					-Alex

> Passing the ring element to these functions won't help. Because, the ring
> element only has the address of the buffer it points to. But what we need here
> is the address of the ring element itself and that can only be found in ring
> context.
> 
> Thanks,
> Mani

