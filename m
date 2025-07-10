Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D512F0E31
	for <mhi@lists.linux.dev>; Thu, 10 Jul 2025 17:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752167889; cv=none; b=g54SnRvUmDLNbveGOcCMwwWC93GSaP/tAOXgpVHJ1JnTkQqEJIE5KcHxtSCx/CJfODDuvv2R4QqbwQ3vXIIl2ISHq4drL2dJXIkt1zJPoHMYwvWXmn6rZicf2UywlMDwWgWUvy/aLiZWD5VK7LmlL1548ro0xgkkBmSwYy+AZNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752167889; c=relaxed/simple;
	bh=AMvH8CbgflCSwtZv4m6a1RA/Wg9jDTGoMyT6/VZgH/o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eG8CjAKPS/lUAxtHGzfMGS2ArNt0xLHIyRwHva1uCG7OQvqFFZdbVTfXQmUnEAza+n5pjKaQqGbbLqpUFfCDuW60F6YbBbtWZsi/rhLUeSL6o5g3Ef/6wdhw0dIkugwLdbnakVKjkV/ADd8VRhVWOADxLb+m/GrrQTr9nWwIOG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kftSpZ9Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kftSpZ9Y"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A9HoWe011316
	for <mhi@lists.linux.dev>; Thu, 10 Jul 2025 17:18:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ar7cVymq/jtUHBmvH1VZaUyciNOHi8uWBeFm9Lj+JaM=; b=kftSpZ9YXjb9tP8z
	JAa7GP/C5N1nGxlH9A8arpDhrAqIcgd0Ga9o0P84DK05+Q7dKtyGNZt6b8HMn2tw
	2ORX65/2UdoBSPG0ncP6NiYWtDVilajBiYoZ6j+5CahLCPbwt4t8lyz9oZ8rUkB5
	tmZWZN+HNChoCB6+SRBUW4I1tS2X3FifvuGUeLC2qUMcNERFtPWQ27xtQePftVGY
	H5SdSLyPMSLonbwuZYQFzVQHI43CrnNINhkcycur23ivtvSTguMNk/IHaQh8e8c+
	x1KfD1I4AVZIIxD8PhiiccHeNDKBbgGNNU51RDnTtnRF11rxnwvnNfHsIZ5/Uw/3
	o+Vzeg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smafnqh8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 10 Jul 2025 17:18:06 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-74ae13e99d6so2018958b3a.0
        for <mhi@lists.linux.dev>; Thu, 10 Jul 2025 10:18:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752167885; x=1752772685;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ar7cVymq/jtUHBmvH1VZaUyciNOHi8uWBeFm9Lj+JaM=;
        b=Os6mw5HTieUZR/sLjWhZJ9ndL4wrQLkb/BoBw9goSt5qWIKOjjJowGVMjUeGLEFYjk
         Dywhe+cgjmh7xG+DYeMwD/Cz8c38Deyo12m/9sH1hduSLA3DnpcKnO0a/as4+HuruWqa
         nkfWImScJkhdX+tlrPpwDcnSF62NLvv0fOhBdu7I7wd5JrpDWaKIk3Hf+i1eDMRMrRqb
         G/chrilTDihxlweYdko2tDDCh/Glyh2Gt1Qs9Ey86bIBBJZzBez2A22F0T0hxW8z9Qxw
         a4DJiYhe9zHyhEEq32MMOsZ7ePwpKHQxkwijsF/ILLuQ4YS1KTfSTxRPvzgxgxHulMli
         2PdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlmBw3EoZ89OZckqfwnDGkzx0ayqcMJSW4/DFJOVoCEZnL19Qx0hVUBiZ3qkE8fjkqawo=@lists.linux.dev
X-Gm-Message-State: AOJu0YzhTl1UAUL/+tex+eC7dFAHjP9BV7QtINrR1eeDlr+vMbQorQkp
	6rYBedybdT54h94L2IRsUU7eYgefQZFblIhBq+LdgVR/ZEnm3KuQ/wwoK04rxc3gm9xT93QIWGM
	0kHdnVghUc8P5UyQY/Mf2ybIhtFI93ISc2zu1qunAiXFFu8Hi1wjxlJI=
X-Gm-Gg: ASbGncs7REKO1sCDJW7PHzcgnuUbPAf7MAFa1x47ZhItWbeUp+ZAvRMxv4Tmms24uoC
	QQZn1AcZQ4loVA35ZIfdjWJvaWjhdYCwXCJ407IdLJ5GGEFBb7eZvrMLpYR4JCKTszJ5FG8byKS
	M/0f/yZAnFUIEM3d6q92Pqqm28TN58x52W4LTL9dgm2DD8V1Ct1cID6MZmUahe1Gpy5+2YJfZTJ
	kSYYTZrQR92/5yvSGXaqX1J6JWYtOEX0mLYlQo9w4vvhsjC3fZ2phDH4JEUa4jUVeSO+1V0+XwB
	KWv1RASB6LoQtFxripb5lx8FPkM0on/QZpkidTdPxmnFgcaJXjM=
X-Received: by 2002:a05:6a20:729e:b0:21f:9b24:321b with SMTP id adf61e73a8af0-22fc57e7824mr8500633637.20.1752167884961;
        Thu, 10 Jul 2025 10:18:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHffsp+s2THEsKwd99/2YsGeT6E/wKdQJkZlm+vr/bjKBhhIbOq/IXrxnXy0oU1VYAbUwh2SA==
X-Received: by 2002:a05:6a20:729e:b0:21f:9b24:321b with SMTP id adf61e73a8af0-22fc57e7824mr8500573637.20.1752167884443;
        Thu, 10 Jul 2025 10:18:04 -0700 (PDT)
Received: from [192.168.29.92] ([49.43.227.1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3bbe72ea8bsm2779997a12.76.2025.07.10.10.17.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jul 2025 10:18:04 -0700 (PDT)
Message-ID: <304d71ca-5773-4fa6-aece-50f92b70c77f@oss.qualcomm.com>
Date: Thu, 10 Jul 2025 22:47:53 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] bus: mhi: keep device context through suspend cycles
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Youssef Samir <quic_yabdulra@quicinc.com>,
        Matthew Leung <quic_mattleun@quicinc.com>, Yan Zhen <yanzhen@vivo.com>,
        Alexander Wilhelm <alexander.wilhelm@westermo.com>,
        Alex Elder <elder@kernel.org>, Kunwu Chan <chentao@kylinos.cn>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Siddartha Mohanadoss <smohanad@codeaurora.org>,
        Sujeev Dias <sdias@codeaurora.org>,
        Julia Lawall <julia.lawall@lip6.fr>, John Crispin <john@phrozen.org>,
        Muna Sinada <quic_msinada@quicinc.com>,
        Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
        Maharaja Kennadyrajan <quic_mkenna@quicinc.com>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Cc: kernel@collabora.com
References: <20250630074330.253867-1-usama.anjum@collabora.com>
 <20250630074330.253867-4-usama.anjum@collabora.com>
 <b72b3635-1c09-444f-98f5-30fcc219b297@oss.qualcomm.com>
 <c40f13e8-7420-4046-880d-7c72620fc021@collabora.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <c40f13e8-7420-4046-880d-7c72620fc021@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZJ/XmW7b c=1 sm=1 tr=0 ts=686ff5ce cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=4nqOr+EkFiuPl9GB/B4vcQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=QX4gbG5DAAAA:8 a=zOkQIraDPy1jB-BB_0EA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: HyIFWFczeXIMX4A8QphiVldZy9EPdFUC
X-Proofpoint-GUID: HyIFWFczeXIMX4A8QphiVldZy9EPdFUC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDE0NyBTYWx0ZWRfX5sD4BvIJsC/I
 x4ZdrhVRchlGK0N8/ShCE84xQeQCdMEI0r7YB0FbVPHvfmjviFvgTsO4l+5uU6XzQexurVtJ2SH
 NTfOMBoXL6TE5VfUb7medChVjsIVwjjTSE5UzZQCgvnxCC5gU+QMPTQPVxZAgzBjKkF6sYMptOT
 O+HIGiuK468EJs0JVNY9rXewiYZmqTFD2X0HSeeJV4pnKEKYmHlaKejovxj8I4ygf9zkU7w1zN+
 zsVoRcIhRks2br9nIDaIY9D5XkF3pJoJR9K+pXQ9pd4B4Igkl6vQAiXT5tP+IzjFVK3JZhYeYBh
 2SFhR14f/37gYVM5OULwxEXbSUz9jleChLIthbAm7ZcYNF6Q/HG5/1W8AICnzhk6P68NUKpcSoD
 a/ahP1P89obxlQVZ73k68uRjIuWFlRvI6TmKW6CUxOSCR7kz9COzDTJFwz1bQPuV1EGtxNUI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_04,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 impostorscore=0 spamscore=0 adultscore=0 clxscore=1015
 bulkscore=0 phishscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507100147



On 7/10/2025 8:37 PM, Muhammad Usama Anjum wrote:
> On 7/8/25 3:15 PM, Krishna Chaitanya Chundru wrote:
>>
>>
>> On 6/30/2025 1:13 PM, Muhammad Usama Anjum wrote:
>>> Don't deinitialize the device context while going into suspend or
>>> hibernation cycles. Otherwise the resume may fail if at resume time, the
>>> memory pressure is high and no dma memory is available.
>>>
>>> Tested-on: WCN6855 WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.6
>>>
>>> Fixes: 3000f85b8f47 ("bus: mhi: core: Add support for basic PM operations")
>>> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
>>> ---
>>>    drivers/bus/mhi/host/init.c | 11 ++++++-----
>>>    1 file changed, 6 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
>>> index 2e0f18c939e68..8f56e73fdc42e 100644
>>> --- a/drivers/bus/mhi/host/init.c
>>> +++ b/drivers/bus/mhi/host/init.c
>>> @@ -1133,9 +1133,11 @@ int mhi_prepare_for_power_up(struct mhi_controller *mhi_cntrl)
>>>          mutex_lock(&mhi_cntrl->pm_mutex);
>>>    -    ret = mhi_init_dev_ctxt(mhi_cntrl);
>> mhi init dev ctxt also initializes the ring pointers to base value,
>> I think we should take care of them also ?
> Are you referring to mhi_rings? They are getting initialized inside
> mhi_init_dev_ctxt() and de-initialized in __mhi_deinit_dev_ctxt(). That's
> why I've not handled them separately.
> 
Maybe I was not clear in my previous comment/not a correct place to do
the comment.

My point you are not freeing __mhi_deinit_dev_ctxt as part of suspend,
that means we are expecting device will continue to use the rp and wr 
pointers of ring as the previous i.e before suspend pointers.

What if PCIe keeps link in D3cold as part of system suspend, will the
device able to handle the previous rp & wp of ring. I don't think
device can handle this.

- Krishna Chaitanya.
>>
>> - Krishna Chaitanya.
>>> -    if (ret)
>>> -        goto error_dev_ctxt;
>>> +    if (!mhi_cntrl->mhi_ctxt) {
>>> +        ret = mhi_init_dev_ctxt(mhi_cntrl);
>>> +        if (ret)
>>> +            goto error_dev_ctxt;
>>> +    }
>>>          ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->regs, BHIOFF, &bhi_off);
>>>        if (ret) {
>>> @@ -1212,8 +1214,6 @@ void mhi_deinit_dev_ctxt(struct mhi_controller *mhi_cntrl)
>>>    {
>>>        mhi_cntrl->bhi = NULL;
>>>        mhi_cntrl->bhie = NULL;
>>> -
>>> -    __mhi_deinit_dev_ctxt(mhi_cntrl);
>>>    }
>>>      void mhi_unprepare_after_power_down(struct mhi_controller *mhi_cntrl)
>>> @@ -1234,6 +1234,7 @@ void mhi_unprepare_after_power_down(struct mhi_controller *mhi_cntrl)
>>>        }
>>>          mhi_deinit_dev_ctxt(mhi_cntrl);
>>> +    __mhi_deinit_dev_ctxt(mhi_cntrl);
>>>    }
>>>    EXPORT_SYMBOL_GPL(mhi_unprepare_after_power_down);
>>>    
> 
