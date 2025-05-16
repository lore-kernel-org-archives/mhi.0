Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B90199FBA
	for <mhi@lists.linux.dev>; Fri, 16 May 2025 14:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747407080; cv=none; b=MT11OrlBhnhSojoKTqCNJ2OJ1eGVetznKsZ2epFbUopsA4hxB/p+cZarHF57uqextjb8JTIxznoPmlld5BjsvQjCfRJR0mUh3rHBuos0I9G2GBhNQOTbYqmMQiTxAJMgwEURXGvEhISNRdBRbyCXbbVc0hbO8D67nl3SUrxjaAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747407080; c=relaxed/simple;
	bh=KNFRjiN4itgNRddB0/L21A2UkFn5gn+qxiQDZPkS34w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kpmOS9ciybCLLaH19DlWb/6sPIe03m36KXrGqnnO2GAU+ISDhpcrCxZwCW+KbWJmX36B4eJYMQshycub31rTJ6f4xJhJU7ZKRXR4ijuWF91kG79O23eMBa2Bs4PQIa6fmFLqxF7IItUzBopAtws/7YL5f4qw5hdkAucQjTjCkOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O3d3BJn/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O3d3BJn/"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GBIOZM026631
	for <mhi@lists.linux.dev>; Fri, 16 May 2025 14:51:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3Ch0BYBwSZN5KXFGrDCxm1IpVItg6AEzdyvHnT6AfyU=; b=O3d3BJn/2q4ugIal
	t/vAI1TUHWnLK+8C+cqeWybg0HXH3gOp4T8Bxn9/jG3fwVk9Hxz8yt5n0+BFzYb7
	ejPc0F2YiMgwhUabmwTMskCploHa5INOkqVBe38BnMYNz7HtcQ651unTsz8UU1O3
	ArWXXp9VkF1/SPWRdB9APnIiKwdacm+VJQfV1OFUautq0X0vKQs1utO6Zfam178i
	6X3aAL7IEkv7s9bCWzwo0ckInaAp7KZDzKLNTUV252T+XqIghB3bO67tVt1FdDLb
	af40HP1tLe6rL5FaT3rzdxr3nXVWHvBp2rT7a9TcYMuzDMZJp30b9olE3kTOSaIZ
	cXE+ng==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcytg1y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Fri, 16 May 2025 14:51:11 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-22e6c82716dso17927475ad.0
        for <mhi@lists.linux.dev>; Fri, 16 May 2025 07:51:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747407071; x=1748011871;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3Ch0BYBwSZN5KXFGrDCxm1IpVItg6AEzdyvHnT6AfyU=;
        b=vZaRJvndfyjn4lPCJjZKplpXvzocR2n9LMgCrtBLH19hDyLkoAsPtE48UL/ZNY5Pcc
         eGL5a5Jwsx1j+0V8+YzqGYKI2yviYjdfaYu4x96iB+g2zU9V7WsD9ohOm73pfdy+EmSf
         AOl84AV709YJITQFKcWiVddKuHcyZr4d04ZGVBLtIL2PFo5zPrgo4EzscqEf//JIQDKt
         x+odlHMleehtTLOc/m3uEEufLDXaLSYW2ZKXk0Xb9w2XKIPZ49dSo7o5bmZ+xIC0NYZ6
         xupsYUDiTropkigGSSgGda9yqi32zmeAvZIPYL+Be9wQb2uTxWwgVQHKRItQh4tmAtTk
         n4xQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhJZE5lroLJ9vkc7BBDy0ZiM6USeKFNYTWTuwKGcjE3v0NTYy32V3KujDNsHEuf1R4KZY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzh2e1uzHaoaTrdNq8Ekua2CgjbS8Vuwbd+Bse2EqP8mBk/i9Or
	k0uLJBzFN32XfMQ70tqOESIu+gP2iNP5DRWP6kCgneNC9fUvkdxNb6B1CibXk59V+BBQZiImZzp
	zu6aN8DlpQb2RDEpzhmU4kYJsswztey++QACD/gpOS7H38J2KwSm/R3s=
X-Gm-Gg: ASbGncsVDpgfYgahunGD51wcV9QBDrgE7gpgpZJMo/Wb6l44Gj/4T17OE0SeM8dBXgU
	/34PU5IXlzEFeMurPhtZPJ4SPdOvCGwE8DNpmC2CJvGdza07j2fNHXA09xlCdf0NNU5Y9r+7CsT
	TcpINXbD+BkMEcYoKl0TAPliCsmlicUdE7Z6JP8wNAxaTU1r06xlKOkhr/VQQFjD1Sp0OlRUoo3
	wUg0fa/CfeR90gAn0FltO8biBGhOLfKu38mH8J/ac5SJjHsuTqqJLrvEE0aN2HOba6kTWe2fZ49
	OVjo05e3mFNjQNcBY+Va1ayDSf1vMRUIIskoETC2ltD0UoS49DEkdJ09xcvu1A==
X-Received: by 2002:a17:903:2391:b0:22e:491b:20d5 with SMTP id d9443c01a7336-231d4eafb92mr44472215ad.26.1747407070858;
        Fri, 16 May 2025 07:51:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE41uGVPM/WG1xEbUbYIeUABAxvP4p+9qesBcCJl/FXidzWoV+dxou7/6C+oR6dLx8Hn1EVOQ==
X-Received: by 2002:a17:903:2391:b0:22e:491b:20d5 with SMTP id d9443c01a7336-231d4eafb92mr44471735ad.26.1747407070393;
        Fri, 16 May 2025 07:51:10 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ebb0f5sm15098265ad.192.2025.05.16.07.51.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 07:51:09 -0700 (PDT)
Message-ID: <eb376c5e-3805-4ce4-a1d8-60ca1d5d5fda@oss.qualcomm.com>
Date: Fri, 16 May 2025 08:51:07 -0600
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] bus: mhi: host: don't free bhie tables during
 suspend/hibernation
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Youssef Samir
 <quic_yabdulra@quicinc.com>,
        Matthew Leung <quic_mattleun@quicinc.com>, Yan Zhen <yanzhen@vivo.com>,
        Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,
        Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
        Kunwu Chan <chentao@kylinos.cn>,
        Troy Hanson <quic_thanson@quicinc.com>,
        "Dr. David Alan Gilbert" <linux@treblig.org>
Cc: kernel@collabora.com, sebastian.reichel@collabora.com,
        Carl Vanderlip <quic_carlv@quicinc.com>, Alex Elder <elder@kernel.org>,
        mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org
References: <20250506144941.2715345-1-usama.anjum@collabora.com>
 <4a6b83f4-885a-46e1-ae31-21a4f3959bae@oss.qualcomm.com>
 <5521efad-1ca8-41e3-b820-5527d634c539@collabora.com>
 <57e04b5a-9f04-49bb-8a7d-978276e9033f@oss.qualcomm.com>
 <951203c6-44a6-4fa9-afad-6ce3973774ae@collabora.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <951203c6-44a6-4fa9-afad-6ce3973774ae@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: crj2xq6YrSJfdTs_wpqbKwIJ2pQK2Dfa
X-Proofpoint-ORIG-GUID: crj2xq6YrSJfdTs_wpqbKwIJ2pQK2Dfa
X-Authority-Analysis: v=2.4 cv=JszxrN4C c=1 sm=1 tr=0 ts=682750df cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=la5BVXO8aNgUUJlq0p0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDE0MiBTYWx0ZWRfXxfJzAoe4h7+W
 frAvfV0UP8uSDsPpkaXQW9fMlDn/LtIzEhX0Nh96JEKpb4iT03le8JFPDbenCzqdVv0+0UxZa9l
 ojBJkr8gRYEJbmXd7pi33acw8W6fUdQ/XRS2jv2r44Kruprufxv1hUXPyu30LZnlw7ARJ9nymmd
 pfMGGZNoFons8Fh/bVc0SaLmD2g+5K8fRwcPiJpMDp+OoZjtN09ovIxA7uT6nvymp3eNzB6yyf1
 vCIqVWQl6zKalSLnG0owwBeWc6nWFfAIcHUR/KB8QlVEvjUSYzVfrMiS8VdU+sW4/o/1pQpncfm
 eHU/I5GtlfHQBa6g+U6CEcsCFxtNwmOvlE2Y81NACbR0HRDDnGn4xMTI4uMavVuSzZGAAYrxQFt
 vp+VEk0M+vl5qSVcjvaLPXjyT9Jlm2NbQCIN3L2++nWf4Gk/agzhAjvY67ZcnnffKudT14YZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505160142

On 5/14/2025 1:17 AM, Muhammad Usama Anjum wrote:
> On 5/13/25 8:16 PM, Jeff Hugo wrote:
>> On 5/13/2025 12:44 AM, Muhammad Usama Anjum wrote:
>>> On 5/12/25 11:46 PM, Jeff Hugo wrote:
>>>> On 5/6/2025 8:49 AM, Muhammad Usama Anjum wrote:
>>>>> Fix dma_direct_alloc() failure at resume time during bhie_table
>>>>> allocation because of memory pressure. There is a report where at
>>>>> resume time, the memory from the dma doesn't get allocated and MHI
>>>>> fails to re-initialize.
>>>>>
>>>>> To fix it, don't free the memory at power down during suspend /
>>>>> hibernation. Instead, use the same allocated memory again after every
>>>>> resume / hibernation. This patch has been tested with resume and
>>>>> hibernation both.
>>>>>
>>>>> The rddm is of constant size for a given hardware. While the fbc_image
>>>>> size depends on the firmware. If the firmware changes, we'll free and
>>>>> allocate new memory for it.
>>>>
>>>> Why is it valid to load new firmware as a result of suspend?  I don't
>>>> users would expect that.
>>> I'm not sure its valid or not. Like other users, I also don't expect
>>> that firmware would get changed. It doesn't seem to be tested and hence
>>> supported case.
>>>
>>> But other drivers have code which have implementation like this. I'd
>>> mentioned previously that this patch was motivated from the ath12k [1]
>>> and ath11k [2] patches. They don't free the memory and reuse the same
>>> memory if new size is same.
>>
>> It feels like this justification needs to be detailed in the commit
>> text. I suspect at some point we'll have another MHI device where the FW
>> will need to be cached.
> Okay. I'll add this information to the commit message. Currently I've
> not seen firmware caching being used other than graphics driver.
> 
>>
>>>>> diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
>>>>> index efa3b6dddf4d2..bc8459798bbee 100644
>>>>> --- a/drivers/bus/mhi/host/boot.c
>>>>> +++ b/drivers/bus/mhi/host/boot.c
>>>>> @@ -584,10 +584,17 @@ void mhi_fw_load_handler(struct mhi_controller
>>>>> *mhi_cntrl)
>>>>>          * device transitioning into MHI READY state
>>>>>          */
>>>>>         if (fw_load_type == MHI_FW_LOAD_FBC) {
>>>>
>>>> Why is this FBC specific?
>>> It seems we allocate fbc_image only when firmware load type is
>>> FW_LOAD_FBC. I'm just optimizing the buffer allocation here.
>>
>> We alloc bhie tables in non FBC usecases. Is this somehow an FBC
>> specific issue? Perhaps you could clarify the limits of this solution in
>> the commit text?
> Okay. I'll add information that we are optimizing the bhie allocations.
> It has nothing to do with firmware type. I've found only 2 bhie
> allocations; fbc_image and rddm_image. So we are optimizing those.

There is a 3rd allocation, and it has everything to do with firmware 
type. Did you miss mhi_load_image_bhie()?  I'm not asking you to touch 
mhi_load_image_bhie(), but to recognize that what you are doing is 
specific to some BHIe devices, not all.

> 
>>
>>>
>>>>
>>>>> -        ret = mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl->fbc_image,
>>>>> fw_sz);
>>>>> -        if (ret) {
>>>>> -            release_firmware(firmware);
>>>>> -            goto error_fw_load;
>>>>> +        if (mhi_cntrl->fbc_image && fw_sz != mhi_cntrl->prev_fw_sz) {
>>>>> +            mhi_free_bhie_table(mhi_cntrl, mhi_cntrl->fbc_image);
>>>>> +            mhi_cntrl->fbc_image = NULL;
>>>>> +        }
>>>>> +        if (!mhi_cntrl->fbc_image) {
>>>>> +            ret = mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl-
>>>>>> fbc_image, fw_sz);
>>>>> +            if (ret) {
>>>>> +                release_firmware(firmware);
>>>>> +                goto error_fw_load;
>>>>> +            }
>>>>> +            mhi_cntrl->prev_fw_sz = fw_sz;
>>>>>             }
>>>>>               /* Load the firmware into BHIE vec table */
>>>>> diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
>>>>> index e6c3ff62bab1d..107d71b4cc51a 100644
>>>>> --- a/drivers/bus/mhi/host/pm.c
>>>>> +++ b/drivers/bus/mhi/host/pm.c
>>>>> @@ -1259,10 +1259,19 @@ void mhi_power_down(struct mhi_controller
>>>>> *mhi_cntrl, bool graceful)
>>>>>     }
>>>>>     EXPORT_SYMBOL_GPL(mhi_power_down);
>>>>>     +static void __mhi_power_down_unprepare_keep_dev(struct
>>>>> mhi_controller *mhi_cntrl)
>>>>> +{
>>>>> +    mhi_cntrl->bhi = NULL;
>>>>> +    mhi_cntrl->bhie = NULL;
>>>>
>>>> Why?
>>> This function is shorter version of mhi_unprepare_after_power_down(). As
>>> we need different code path in case of suspend/hibernation case, I was
>>> adding a new API which Mani asked me remove and consolidate into
>>> mhi_power_down_keep_dev() instead. So this static function has been
>>> added. [3]
>>
>> I don't understand the need to zero these out.  Also, if you are copying
>> part of the functionality of mhi_unprepare_after_power_down(), shouldn't
>> that functionality be moved into your new API to eliminate duplication?
> This how the cleanup works mhi_unprepare_after_power_down(). Yeah, it
> makes sense to use this function in mhi_unprepare_after_power_down().
> 
> Sending next version soon.
>>
> 
> 

