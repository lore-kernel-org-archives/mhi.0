Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B272F4E
	for <mhi@lists.linux.dev>; Tue, 22 Feb 2022 14:10:04 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id e22so42282254qvf.9
        for <mhi@lists.linux.dev>; Tue, 22 Feb 2022 06:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=XR5FZFGaIIKTzVrtc+qtDeldPYFhK+vnor66vP4A6qE=;
        b=d2PXqmoJdsG3+AVpuPryy+/yq70x6q2BsCW0wo1sZ2XTr6NKseHqDZJFWBX5EdjBaj
         lUh2Q62sr7Z6VEHYqQZ9bZeQLO5HNGcAldRPjVodDIoO/jUnZXQIWaH9KqdlHqqZN5bZ
         m6CsUUE5mShjmYVas/8ImoZiaDWRUg0Sbl4UKOLiIDFkFGxD4reVTeEP0U9l8D5TTemm
         apZVoAWDK42QHzKM9M2M8FtvZl2CIxrF516twZ+oet52mrU3UEJZ6a0iIdT1O+lVPX1L
         1ealdeBBMSt62qEBjdRqwPJNYxRyqGgEcRpfAgNobS7zu2sqEY0jNdK+VvnbDrwOyAu2
         WgKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=XR5FZFGaIIKTzVrtc+qtDeldPYFhK+vnor66vP4A6qE=;
        b=8QXECZ3nEP1dY90PzZp2rHJaB2ogbRXfvDTN/M+5EaQ8Foy7noyC4DxP/kuvG+lm+9
         6WOc6pKqh0DXd6rl5g/W6DRwRKy5EjeuxOq0eZu72h4Yns20/qP24qFeoegeAxPIHv1y
         XvIjYW3aDO3vDJWXuX2GcrrR4zs3r0n6WbHUebH9C7zzYzuBW/o61sfTITUPhXVldWYh
         SuZGX/9DFC8ZPakHo+sw99WhP6ocbTBakmcHT6COEg7SOjNR0MndTpXciPkJ6iNNEqHu
         Uo/BHn2AIP/eNts+i7S1sKb0qo+awj0ke0nTdFswTIGxzW2855B/oBu3sGc+fuy3elrU
         D8fg==
X-Gm-Message-State: AOAM532izTMI9Y10rOApK260vMhWQx55oZ/Mfap5bQT+9B2oyxQAgPBl
	bk5ExEL98w3VU/aKVJK68elcIg==
X-Google-Smtp-Source: ABdhPJwWqciVne655CNWHtCM8/p9iRCfk7DpJuRiXA0dp7NT/73hA5DeKFBPUvXQ25aZwkNYKL2lVA==
X-Received: by 2002:a05:622a:206:b0:2dd:dbdb:f598 with SMTP id b6-20020a05622a020600b002dddbdbf598mr13521885qtx.138.1645539002901;
        Tue, 22 Feb 2022 06:10:02 -0800 (PST)
Received: from [172.22.22.26] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id e9sm306676qkm.27.2022.02.22.06.10.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Feb 2022 06:10:02 -0800 (PST)
Message-ID: <a1e26159-f27e-e55f-d376-e43a13294246@linaro.org>
Date: Tue, 22 Feb 2022 08:10:00 -0600
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 16/25] bus: mhi: ep: Add support for powering up the
 MHI endpoint stack
Content-Language: en-US
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev, quic_hemantk@quicinc.com, quic_bbhatt@quicinc.com,
 quic_jhugo@quicinc.com, vinod.koul@linaro.org, bjorn.andersson@linaro.org,
 dmitry.baryshkov@linaro.org, quic_vbadigan@quicinc.com,
 quic_cang@quicinc.com, quic_skananth@quicinc.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220212182117.49438-1-manivannan.sadhasivam@linaro.org>
 <20220212182117.49438-17-manivannan.sadhasivam@linaro.org>
 <10240bc5-ef9f-7555-402e-57ca2b0b0a14@linaro.org>
 <20220222090816.GD5029@thinkpad>
From: Alex Elder <elder@linaro.org>
In-Reply-To: <20220222090816.GD5029@thinkpad>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/22/22 3:08 AM, Manivannan Sadhasivam wrote:
> On Tue, Feb 15, 2022 at 04:39:37PM -0600, Alex Elder wrote:
>> On 2/12/22 12:21 PM, Manivannan Sadhasivam wrote:
>>> Add support for MHI endpoint power_up that includes initializing the MMIO
>>> and rings, caching the host MHI registers, and setting the MHI state to M0.
>>> After registering the MHI EP controller, the stack has to be powered up
>>> for usage.
>>>
>>> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>>
>> Very little to say on this one.		-Alex
>>
>>> ---
>>>    drivers/bus/mhi/ep/internal.h |   6 +
>>>    drivers/bus/mhi/ep/main.c     | 229 ++++++++++++++++++++++++++++++++++
>>>    include/linux/mhi_ep.h        |  22 ++++
>>>    3 files changed, 257 insertions(+)
>>>
>>> diff --git a/drivers/bus/mhi/ep/internal.h b/drivers/bus/mhi/ep/internal.h
>>> index e4e8f06c2898..ee8c5974f0c0 100644
>>> --- a/drivers/bus/mhi/ep/internal.h
>>> +++ b/drivers/bus/mhi/ep/internal.h
>>> @@ -242,4 +242,10 @@ int mhi_ep_set_m0_state(struct mhi_ep_cntrl *mhi_cntrl);
>>>    int mhi_ep_set_m3_state(struct mhi_ep_cntrl *mhi_cntrl);
>>>    int mhi_ep_set_ready_state(struct mhi_ep_cntrl *mhi_cntrl);
>>> +/* MHI EP memory management functions */
>>> +int mhi_ep_alloc_map(struct mhi_ep_cntrl *mhi_cntrl, u64 pci_addr, size_t size,
>>> +		     phys_addr_t *phys_ptr, void __iomem **virt);
>>> +void mhi_ep_unmap_free(struct mhi_ep_cntrl *mhi_cntrl, u64 pci_addr, phys_addr_t phys,
>>> +		       void __iomem *virt, size_t size);
>>> +
>>>    #endif
>>> diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
> 
> [...]
> 
>>> +
>>> +static void mhi_ep_enable_int(struct mhi_ep_cntrl *mhi_cntrl)
>>> +{
>>
>> Are channel doorbell interrupts enabled separately now?
>> (There was previously an enable_chdb_interrupts() call.)
>>
> 
> Doorbell interrupts are enabled when the corresponding channel gets started.
> Enabling all interrupts here triggers spurious irqs as some of the interrupts
> associated with hw channels always get triggered.

This is excellent.  Thanks for the explanation.	-Alex

> 
> Thanks,
> Mani

