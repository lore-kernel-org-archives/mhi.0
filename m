Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
	(using TLSv1.2 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED7B29A1
	for <mhi@lists.linux.dev>; Fri,  6 May 2022 18:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1651860122; x=1683396122;
  h=message-id:date:mime-version:subject:from:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=l6I0GlDZLn9jFdBOzxWh3af+oL9wPuCwbZyXBTFN764=;
  b=I+6nUT8P0x/NdnQoxDiXdYeH1LecGK028NQZ4AvQDMihFWDWN+imaJW6
   RPe8py2gtIZEpEyWbPMnePQpz8idhUk7VsxIRhwcj4WdgOV7NyTD6cRLA
   e01/z1OXY1pJnzZctCjlOuq9kZZWWH3wFphDzDcaNJXPp6ptUvboySGL5
   Y=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 06 May 2022 11:02:02 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2022 11:01:46 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 6 May 2022 11:01:46 -0700
Received: from [10.110.90.77] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 6 May 2022
 11:01:45 -0700
Message-ID: <c9ac9fbf-d94e-feea-e762-95eeae8f5a74@quicinc.com>
Date: Fri, 6 May 2022 11:01:45 -0700
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 5/5] bus: mhi: host: Remove redundant dma_wmb() before ctx
 wp update
Content-Language: en-US
From: Hemant Kumar <quic_hemantk@quicinc.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Loic Poulain
	<loic.poulain@linaro.org>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <quic_bbhatt@quicinc.com>
References: <20220502104144.91806-1-manivannan.sadhasivam@linaro.org>
 <20220502104144.91806-6-manivannan.sadhasivam@linaro.org>
 <CAMZdPi_i60TqszUL+=ocMn-4veyoGRQoOGD_B4YiEpz_uWE+ZQ@mail.gmail.com>
 <20220504081720.GB5446@thinkpad>
 <CAMZdPi9oA4SSYGSPw9tCmQ=GhwhCgdYz+=rQiUzu1tNbo80ceQ@mail.gmail.com>
 <20220504155855.GA3507@thinkpad>
 <514326aa-49eb-2b07-b99e-53899722c7e2@quicinc.com>
In-Reply-To: <514326aa-49eb-2b07-b99e-53899722c7e2@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)

Hi Loic,

On 5/6/2022 10:41 AM, Hemant Kumar wrote:
> Hi Loic,
> 
> On 5/4/2022 8:58 AM, Manivannan Sadhasivam wrote:
>> On Wed, May 04, 2022 at 11:25:33AM +0200, Loic Poulain wrote:
>>> On Wed, 4 May 2022 at 10:17, Manivannan Sadhasivam
>>> <manivannan.sadhasivam@linaro.org>  wrote:
>>>> Hi Loic,
>>>>
>>>> On Wed, May 04, 2022 at 09:21:20AM +0200, Loic Poulain wrote:
>>>>> Hi Mani,
>>>>>
>>>>> On Mon, 2 May 2022 at 12:42, Manivannan Sadhasivam
>>>>> <manivannan.sadhasivam@linaro.org>  wrote:
>>>>>> The endpoint device will only read the context wp when the host rings
>>>>>> the doorbell.
>>>>> Are we sure about this statement? what if we update ctxt_wp while the
>>>>> device is still processing the previous ring? is it going to continue
>>>>> processing the new ctxt_wp or wait for a new doorbell interrupt? what
>>>>> about burst mode in which we don't ring at all (ring_db is no-op)?
>>>>>
>>>> Good point. I think my statement was misleading. But still this scenario won't
>>>> happen as per my undestanding. Please see below.
>>>>
>>>>>> And moreover the doorbell write is using writel(). This
>>>>>> guarantess that the prior writes will be completed before ringing
>>>>>> doorbell.
>>>>> Yes but the barrier is to ensure that descriptor/ring content is
>>>>> updated before we actually pass it to device ownership, it's not about
>>>>> ordering with the doorbell write, but the memory coherent ones.
>>>>>
>>>> I see a clear data dependency between writing the ring element and updating the
>>>> context pointer. For instance,
>>>>
>>>> ```
>>>> struct mhi_ring_element *mhi_tre;
>>>>
>>>> mhi_tre = ring->wp;
>>>> /* Populate mhi_tre */
>>>> ...
>>>>
>>>> /* Increment wp */
>>>> ring->wp += el_size;
>>>>
>>>> /* Update ctx wp */
>>>> ring->ctx_wp = ring->iommu_base + (ring->wp - ring->base);
>>>> ```
>>>>
>>>> This is analogous to:
>>>>
>>>> ```
>>>> Read PTR A;
>>>> Update PTR A;
>>>> Increment PTR A;
>>>> Write PTR A to PTR B;
>>>> ```
>>> Interesting point, but shouldn't it be more correct to translate it as:
>>>
>>> 1. Write PTR A to PTR B (mhi_tre);
>>> 2. Update PTR B DATA;
>>> 3. Increment PTR A;
>>> 4. Write PTR A to PTR C;
>>>
>>> In that case, it looks like line 2. has no ordering constraint with 3.
>>> & 4? whereas the following guarantee it:
>>>
>>> 1. Write PTR A to PTR B (mhi_tre);
>>> 2. Update PTR B DATA;
>>> 3. Increment PTR A;
>>> dma_wmb()
>>> 4. Write PTR A to PTR C;
>>>
>>> To be honest, compiler optimization is beyond my knowledge, so I don't
>>> know if a specific compiler arch/version could be able to mess up the
>>> sequence or not. But this pattern is really close to what is described
>>> for dma_wmb() usage in Documentation/memory-barriers.txt. That's why I
>>> challenged this change and would be conservative, keeping the explicit
>>> barrier.
>>>
>> Hmm. Since I was reading the memory model and going through the MHI code, I
>> _thought_ that this dma_wmb() is redundant. But I missed the fact that the
>> updating to memory pointed by "wp" happens implicitly via a pointer. So that
>> won't qualify as a direct dependency.
>>
>>>> Here, because of the data dependency due to "ring->wp", the CPU or compiler
>>>> won't be ordering the instructions. I think that's one of the reason we never
>>>> hit any issue due to this.
>>> You may be right here about the implicit ordering guarantee... So if
>>> you're sure, I think it would deserve an inline comment to explain why
>>> we don't need a memory barrier as in the 'usual' dma descriptor update
>>> sequences.
>>>
>> I think the barrier makes sense now. Sorry for the confusion and thanks for the
>> explanations.
>>
>> Thanks,
>> Mani
>>
>>> Loic
> 
> You made a good point. After following your conversation, in case of 
> burst mode is enabled and currently
> 
> we are in polling mode, does it make sense to move dma_wmb after 
> updating channel WP context ?
> 
> DB ring is going to get skipped when we are in pilling mode.
> 
> instead of dma_wmb();
> *ring->ctxt_wp  =  cpu_to_le64(db);
> 
> *ring->ctxt_wp  =  cpu_to_le64(db); dma_wmb();
> 
> Thanks,
> Hemant
> 
i think i spoke too fast. I think we dont need to worry about the 
polling mode as the context_wp update would happen at some point of time 
and that does not require dma_wmb after update context wp.

Thanks,
Hemant
