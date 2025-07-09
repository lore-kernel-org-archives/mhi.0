Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D5C2D1914
	for <mhi@lists.linux.dev>; Wed,  9 Jul 2025 14:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752071538; cv=none; b=u5/nJuRvvYji6AY5t37V1vj7JXLEDmw4KbSyxzVbBlrpLwOthWBlTC/HEXXoaWrBGaqo+22wTFltPQ8Lctb6tyfMk1jUmxMEdUwg3u9aAgrolvzHLwkr0IsK0bwzVwBuG1w201ZbXziO8Da8+/eRJOVwP5IeOKWiMorwmkbJGQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752071538; c=relaxed/simple;
	bh=MLDmZWGtCeQUH3jn9zi179PGInEvx2xAfAzciMYvzNk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bCGTqLr/86EEawYEYXxJegPqv2gC0rAWIS6E4sjHIiAPhaGx9buJHeqfJZEW2oTd3T8ba7LQR6z0XIr4CYU5i2gz09L58+3Q6ALTjSCLvjcQFGikZ7nHV2LpjMhKXxkIIMQtKaV4sjS6ua46yontC8TGk5E9scP1Tt/TdPF/ZOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VLuXi082; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VLuXi082"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 569CoblB016471
	for <mhi@lists.linux.dev>; Wed, 9 Jul 2025 14:32:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r5fAbmRtBzZx08PigSnVIImcLDXKwCyMY6JVo02jWRg=; b=VLuXi082q/mqp72k
	qRRPuXwuaBc68yx6mPMqNF2M4q+dV7CUBDt0ek5ZRPB9PHP+kPRUA6EGFgQ4e3cQ
	rTvOSiUDbB2DeCYM8OZNvEsLyoBQhp+r9dg4/lsGHL+jsY4qa1bOJ59sk07ReKEl
	5r3V5LSfPu8zhV5/tIjPbiwqtqqNVTko+9aGEejjI9iyFWdQYgikSbX6NJ0rqN5Y
	MyrvWoEKJa7wPIjFbnj43f2FVsBB2eaaVQXaNYezfkp/IDE8wjob4gAWrhkpX2dL
	Rr431YomE1RKlYCkv9Np916V2YMjSKmpKXUwkWeTtCQl96AUOkqEd9Pag49V3H0r
	S8MtDw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smap1cd1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Wed, 09 Jul 2025 14:32:15 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b3184712fd8so4513813a12.3
        for <mhi@lists.linux.dev>; Wed, 09 Jul 2025 07:32:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752071535; x=1752676335;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r5fAbmRtBzZx08PigSnVIImcLDXKwCyMY6JVo02jWRg=;
        b=LJLO9drUXboZOTXZ/2BvVdiNsoPq+q8sqQmyXWRCxOko+SpnITzGGnv7Q6oXefIJCZ
         sljfmRMEh2LXhn/tasPud4sXeyb607uixtG3j7jlUphV6DzS5ZlugbBuTGICA1yzOvZA
         tm2XROfKVuckAiaqZJT+Sk3xbBb75yvQmHup04l0IlfLGieVGjL+W5R0Yx0FR3pMUjWm
         GHp7dIVrCTSKrwuY7tdjr9zmsu3qUsOBUcgKRBzvloFTTuuw2J43kkqJeA9y5n6bXkzv
         Gte/TJ1H8tTj7XyfzuAg7A30Vrn4ISo6WpxM5jZ9YtubvUaaQxiWmcJ+Cgj44wVCbb6R
         Zosw==
X-Forwarded-Encrypted: i=1; AJvYcCWw6DCJJH7FfA781e3rzeu60QwKtN7xnMfdW0DK4D0KeC6Kk/0tCzYOCviP63i4qqfo2EU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxVEyZKii4wTGACHTxAC3Zlco+KZAsgHLUTSoY9t1rQwqIB6vr/
	O899fIEhcId3x/fr6yhNttvPQHpDA5Jg6NNi2C2+2LWDB+u4jAkdfv7nl9xHGsQ+bvAwlglxj0x
	Vlig115QH9ySpk0j41+jIq77xfxMimKs27qwR+wu+DfRd8PDGZ5hvpUQ=
X-Gm-Gg: ASbGnctabQhF8mNxYoLvOdaGNv0jjjUptwXlcshlMEQg9eGRSe+FKUqIan47Kh4o4iF
	HpOYDqxXlVypa1yPNwiatoLVjoNLmi7wQImLtv5aXEG7FQFxdsKGLTRsMAIy6eekj3rdeojPFkz
	G8UpX3HBnycfdFB5dS3RCgf2TivsUXwgB1vTKODvbQBR8HZzc5yUCdsuaIZ8Y7QYsrYS2Y+wOzY
	vNURJ10oxz602ypiCbDjCw9FrjGNwpLCXHrodRaFwZjhP8NyM3LZg61msWcnvij9wzjgMzX2Kgu
	HXRr4K/duahi/MhwfxfyV5894iZjpyKLs2iVFpTs8R4r7MFZdRaMV01qLTJRFBMTruk0xF0w
X-Received: by 2002:a17:90a:e7c6:b0:314:2892:b1e0 with SMTP id 98e67ed59e1d1-31c3c305023mr138125a91.34.1752071534240;
        Wed, 09 Jul 2025 07:32:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEiLVofoEBD+I/f3QFdZJ1EdevVdfAxr4t5VwdXi6k5sKycdxh1mB+D0EBHKBfBqj6iCpJfTQ==
X-Received: by 2002:a17:90a:e7c6:b0:314:2892:b1e0 with SMTP id 98e67ed59e1d1-31c3c305023mr138082a91.34.1752071533681;
        Wed, 09 Jul 2025 07:32:13 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c3003d2e8sm2382998a91.8.2025.07.09.07.32.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jul 2025 07:32:13 -0700 (PDT)
Message-ID: <58baef06-8066-428d-ad72-7bb4cb537085@oss.qualcomm.com>
Date: Wed, 9 Jul 2025 08:32:11 -0600
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: mhi: host: Detect events pointing to unexpected TREs
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Youssef Samir <quic_yabdulra@quicinc.com>,
        manivannan.sadhasivam@linaro.org, quic_carlv@quicinc.com,
        quic_thanson@quicinc.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org
References: <20250521163110.571893-1-quic_yabdulra@quicinc.com>
 <vpgqiiszye6azpn5muq64bxqg63cvizxpzj5cmspjynflzm3oe@2i55blw73j5x>
 <209dec58-c86c-494d-a6e9-fb0ab33b03c2@quicinc.com>
 <ggswqscpu54klfvvevvcswvija4m7l667aov4qu65om5i5adhy@nbmg7dxed56g>
 <a3e2a410-76b0-458a-9b9a-ba8f91283346@oss.qualcomm.com>
 <4atrwojcbhzzegixeyzulldmhp655rcqn4pccbchlrp3gvyzvh@mhcgkjkgfkzb>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <4atrwojcbhzzegixeyzulldmhp655rcqn4pccbchlrp3gvyzvh@mhcgkjkgfkzb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ar7u3P9P c=1 sm=1 tr=0 ts=686e7d6f cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=nlpBPMN-2No23xZClQQA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: grfYW1pqWWsSGssjBr49Wg9HcBErx7fJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDEzMSBTYWx0ZWRfXzjG29PVjTZg6
 u4EzorjdEFjhTQmgbILlF8VTlz7xtIln1I2vpK39nZujUHYipvVZxlj5q1qUF4/rWy5+RYRGR9V
 Fr3LnDmrPOOCaalirPUSPw8J6PBIIXFZ+LVSqmaOMefTUyYaBg7MuK+p93x/gYRRKMTnV6qM99o
 k2cbuL4Soushm2Df3DU2ptD9OOSuKA6w4+/xSijNH+D74AJBIRqY+EG1QTLHnTWBG3uWMdKk3bO
 mubCc2ECwPMkjR6/mGRovIhIIavyFBIhAXFhtzdr2E4VW8daH6utdCXkSBgT/wZMfhJP6sYAaGP
 vZH/NeAO9KhJO2SFKeqlZ4lDzyRinNnOwFGITGMvJQ6XzrPwmFDk7SHynoULDEMcIZ1gsGTqj7d
 LqK7b/g5kiaTVUBjT1rR+HJbj+HwNeufplihYVXVx2fJaCEx0ZT/0tMA+yPxYx3MS8zBii+C
X-Proofpoint-GUID: grfYW1pqWWsSGssjBr49Wg9HcBErx7fJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_03,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015 adultscore=0
 phishscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507090131

On 7/9/2025 5:08 AM, Manivannan Sadhasivam wrote:
> On Tue, Jul 08, 2025 at 11:18:10AM GMT, Jeff Hugo wrote:
>> On 7/8/2025 7:26 AM, Manivannan Sadhasivam wrote:
>>> On Wed, Jul 02, 2025 at 04:06:55PM GMT, Youssef Samir wrote:
>>>>
>>>>
>>>> On 6/17/2025 11:24 AM, Manivannan Sadhasivam wrote:
>>>>> On Wed, May 21, 2025 at 06:31:10PM +0200, Youssef Samir wrote:
>>>>>> When a remote device sends a completion event to the host, it contains a
>>>>>> pointer to the consumed TRE. The host uses this pointer to process all of
>>>>>> the TREs between it and the host's local copy of the ring's read pointer.
>>>>>> This works when processing completion for chained transactions, but can
>>>>>> lead to nasty results if the device sends an event for a single-element
>>>>>> transaction with a read pointer that is multiple elements ahead of the
>>>>>> host's read pointer.
>>>>>>
>>>>>
>>>>> How can this happen? I cannot relate this with the scenario mentioned below.
>>>>>
>>>>>> For instance, if the host accesses an event ring while the device is
>>>>>> updating it, the pointer inside of the event might still point to an old
>>>>>> TRE.
>>>>>
>>>>> I cannot interpret this, sorry. The host is supposed to access the ring elements
>>>>> till the RP. Even if the device updates the RP while host is processing the TREs,
>>>>> it should not cause any issues for the host which only sees the used ring
>>>>> elements.
>>>>>
>>>>> Maybe I'm missing something?
>>>>
>>>> Hi Mani,
>>>>
>>>> This is related to the behavior that 'commit 6f18d174b73d ("bus: mhi: ep: Update read pointer only after buffer is written")'
>>>> aimed to fix from the endpoint. The scenario I observed with a device using drivers/bus/mhi/ep/
>>>> involved the device sending an MSI to host for an event that hasn't had its data
>>>> completely updated. the event could be pointing to a TRE that is not local_rp + 1.
>>>> As you mentioned, the host will process all the TREs until the event's rp,
>>>> which allows it to access data that were freed or hasn't been written to yet.
>>>>
>>>
>>> So you are saying that mhi_ep_ring_add_element() didn't update the ring pointer
>>> before triggering MSI? If that's the case, we should add a barrier to make sure
>>> that the RP is updated before raising MSI. Though, I thought that the implicit
>>> barrier offered by the mutex_unlock() would be enough to make sure that the RP
>>> is updated before triggering MSI.
>>
>> No, we are saying that an ep without 'commit 6f18d174b73d ("bus: mhi: ep:
>> Update read pointer only after buffer is written")' can cause the host to
>> crash because the host is trusting the ep, when it shouldn't be.  This patch
>> hardens the host by removing that trust and checking that the ep didn't do
>> something invalid (to the extend that we can detect invalid behavior).
>>
>> The ep updated the ring pointer before it updated the ring contents.
>> Therefore there is a window where the host can see the updated ring pointer,
>> but the ring contents won't be updated therefore the host sees stale data.
>> This is identical to the scenario where the ep updates the ring contents
>> with invalid data (maybe a FW bug), and then updates the ring pointer.  This
>> proposed patch catches both issues and avoids the host consuming the invalid
>> data.
>>
> 
> Ok, makes sense now. This information (with reference to 6f18d174b73d) should be
> present in the commit message to make it self explanatory.

Youssef please send a v2 with this suggestion.

-Jeff
