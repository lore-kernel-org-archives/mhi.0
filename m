Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56DD26B2D6
	for <mhi@lists.linux.dev>; Mon, 28 Apr 2025 15:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745852978; cv=none; b=KArsUhqwN3uEJca4Z7zFcuz2Kjso1StGYgSsmaYlWsGABQOe+pENnJim3RIzOtUVZP6d5fRdWLYQ/JveBQyiglK/hh4fGl/f/zfsZz/J0dlIZoO68iSGrCWx7vY9Y9+c71kWHaUW0AX21jIHSLTy8sltHKlcG26pwdp0fDpI/S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745852978; c=relaxed/simple;
	bh=HCAZ4kto/mGJaVyhqTgPefL2klZ389e6US/vm3Csn6k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dyVRFx/HdPOkMXxrfnZYDldXsmDEi+d+hgnR8dMwDdyiEgEWIaoQRghI+LFi+NHjRunkr7trF3LHx/pTRiMg4FGiT20RnQdxzrrnPyyeLFJmX5WhMgP96WPeBuXyiktYrnregskIJiX6MyVyPVmlIUY/Z6p5qfVt37jcOwl/4G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mt4LGlGy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mt4LGlGy"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SACw8h026275
	for <mhi@lists.linux.dev>; Mon, 28 Apr 2025 15:09:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KEOkZ6mFuMRqr/HXy2j51jt/b9iumegqKoRWn+Qv12E=; b=Mt4LGlGyk0CPhMoK
	TZEoagfDspmi7PlJjB3BIQRoOCzIMjxJWa9gRgvDuyS8w7gX2d8NCQDEEB7BcjNq
	9ZW12JhvgX5yB5snPUXKQfdnHECs50HUZ+qe6c/rf2bRUcDkkfUzLykzP4NqWSqh
	sOYfXAj4glCfBPNKcs6VBEHOfoPMzXfPBzJbtr6p+9Hd9BCdi8HeHhO29nyrvV8N
	jELYBQTImV2KI78fXazwuOPrM8RjOrrbp/KVutfqocFy2Y4Wv+2v79qJhhIFlZTQ
	spN9MG1MhzcKvuf8KDjl8NmKthjzAoJa5HtEcJXC/tMc9t16eM+gY4i7usDb5fiP
	1UnUZA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468q321j88-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 28 Apr 2025 15:09:35 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2265a09dbfcso73372935ad.0
        for <mhi@lists.linux.dev>; Mon, 28 Apr 2025 08:09:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745852974; x=1746457774;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KEOkZ6mFuMRqr/HXy2j51jt/b9iumegqKoRWn+Qv12E=;
        b=JPIHIi7jijsAr145Wmu/S69N70s1Rwjt+/SFoOP1ZjlipFYvmPjyq5TOBjhwSwFKkP
         vosyxP5rcQiWX8AuRa5BRg87cOC3SJjP0z3Mob77t0xVreT/ICWzL+PQM9ZdaXq5ZVrz
         dPzd9e1Va9oILTI+8gbxMR2c8Hc8WIYbWLV6LXDG2klSPNin5OuyMQ8u/PC5UxjF56QY
         cifwQyygYs+ddnim4hSHV7f9qQ5bm2hrbCPTtzx/HsjdlxAT8cyJ0wQMj8FYTFbnZf7c
         dmW1/AAjMGCa7ldXAyalPaZJdOJ1GB+mXuXr9EgoX/QopQIpWti+ap4w+j7hEENvLZQu
         5jOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFGYEr+6mD6nmkSVn7Vlc4jaqL2L/8LU2kzVRMztIGTPaPtq/D1eP4QXzZvJ069lMzNqU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzVUiktmynN/CppWvkojF/xUbPDB/5PcA0sr02z1OTDepIdbMSt
	sxHmJlNO0SBj43mMdIRxRm0Nag5RHnSPr1Ebut5U/5tjYkUYX9lMQk4LANCpWFarlqiXxyjhXEK
	ibgjzBfy/pBgrrdpabwk8te7o4iMduhyZVQLAvyfw3zTLVuHg/sw=
X-Gm-Gg: ASbGnct6PHZcvgf2h8ZicC27DflXqNsgWZ1bBftg7XI7prHMUq0vsCxtEEFNJbCTFIJ
	YqpFqBqJsy3BqswZANDpQdyDmoy4dkjTpg5DMeFDzHowwFDHXfHIHUbcMrjEzdLVNtUND6fz87/
	aMQrr2xZ87CN85a85Hjs3k1D2i7hjmbbOyXJ7AspcNXAowDK/CaRrY1STVbf4eB6hq620oFnI5w
	radEu3zA7/M/pnBLsYAhs52veFqktFu2Ka+bkidhRhF8qlKbDAADDpu3qL9XO/ZWwru/oe4HLc9
	omaPbmgmVYdn04iQPj6jlavF0CrAkJpnrweXjMXdGeoCuwLRuou0SRihnF89Rg==
X-Received: by 2002:a17:903:32c8:b0:224:1c41:a4bc with SMTP id d9443c01a7336-22dbf5ee6bdmr183111725ad.12.1745852973907;
        Mon, 28 Apr 2025 08:09:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFu18ANnj4a36qONwaL8w3obR2ut06Y1UcDSPMiihA60mbLWURzJlp6wajfLIa479txER3WLQ==
X-Received: by 2002:a17:903:32c8:b0:224:1c41:a4bc with SMTP id d9443c01a7336-22dbf5ee6bdmr183111355ad.12.1745852973498;
        Mon, 28 Apr 2025 08:09:33 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5102721sm84123075ad.186.2025.04.28.08.09.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 08:09:32 -0700 (PDT)
Message-ID: <723cb707-2bc2-481c-ab6a-1146c9677821@oss.qualcomm.com>
Date: Mon, 28 Apr 2025 09:09:31 -0600
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: mhi: host: Allocate entire MHI control config once
To: Baochen Qiang <quic_bqiang@quicinc.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: quic_carlv@quicinc.com, quic_thanson@quicinc.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
References: <20250328165913.3380933-1-jeff.hugo@oss.qualcomm.com>
 <pgr6u3onrlf4mvldqn7cxlqkh3krduv542jqgjcy5c535ys6hm@dujbvax4b56s>
 <07cc4ee2-4a13-495c-bc4d-8837d6b54414@oss.qualcomm.com>
 <3d162e4f-a15f-4943-8639-ac8c47a77b93@quicinc.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <3d162e4f-a15f-4943-8639-ac8c47a77b93@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=M7xNKzws c=1 sm=1 tr=0 ts=680f9a2f cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=H3YptR6XEMwMqONLRA8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: _2ntWXV3hgu68Gbek6sTwyPsNc5-0s8S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDEyNCBTYWx0ZWRfX7v/aTygzHfJz ETbIdrSbhgqOfjhfEgjYo9KqqWRrHRVBwd/RNlbcED8FHGMs+Ko6rlyewTtRnXnueRtB9zPTIs9 kx7dKVveWjM0AIx9G6+KWGLT5u+UNnTgvN6HoQeAoXPZOUruN+wF3DlmwQrqTj795cXOlgouPy0
 7psnZt9dyYvJ1vSyUTrKLBGQz6COeqo6gXMxqIxzLcDbB+JpbSUloYMZ2fleMNxKApRKOlaHUjf EwuE4cREXeN/IUYDbL2JNJWwqw60fdTAVSY1LnQlZfmj/UNsF43nyU3ZCNUlW/wC8GhxFkPJbQf iqeoVFIhNvHcObvFrqzU/d85QnFisCz9Z3DJ+oWCMWSA9BtJqjLvR2gMte5CPUeQdfC9XbPdKFO
 rNiW6rdGTTwsDawKosEpIkJkNtMhslvZeo9/+HL84QCl/CZz4dzcVWCG6cQVOGW5MIG4kuQZ
X-Proofpoint-ORIG-GUID: _2ntWXV3hgu68Gbek6sTwyPsNc5-0s8S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=999 spamscore=0 phishscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280124

On 4/27/2025 7:37 PM, Baochen Qiang wrote:
> 
> 
> On 4/8/2025 10:56 PM, Jeff Hugo wrote:
>> On 4/8/2025 1:01 AM, Manivannan Sadhasivam wrote:
>>> On Fri, Mar 28, 2025 at 10:59:13AM -0600, Jeff Hugo wrote:
>>>> From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
>>>>
>>>> MHI control configurations such as channel context, event context, command
>>>> context and rings, are currently allocated individually. During MHI
>>>> initialization MHI bus driver needs to configure the address space in
>>>> which this control configuration resides. Since different component of the
>>>> config is being allocated separately, only logical solution is to give the
>>>> entire RAM address space, as they could be anywhere.
>>>>
>>>
>>> This is fine...
>>
>> We tripped over this when experimenting with an automotive market product. The FW for that
>> product had a rather strict interpretation of the spec, which we confirmed with the spec
>> owner.
>>
>> In the specific FW implementation, the device maps the entire MHI space of shared
>> structures in a single ATU entry. The device cannot map an entire 64-bit address space,
>> and it expects all of the shared structures in a single compact range.
>>
>> This applies to the control structures, not the data buffers per the device implementation.
>>
>> This restriction seems backed by the spec.  I can't find a reason why the device is
>> invalid, if limited.  I don't think this should break anything, but more on that below.
>>
>>>
>>>> As per MHI specification the MHI control configuration address space should
>>>> not be more them 4GB.
>>>>
>>>
>>> Where exactly this limitation is specified in the spec? The spec supports full
>>> 64 bit address space for the MHI control/data structures. But due to the device
>>> DMA limitations, MHI controller drivers often use 32 bit address space. But
>>> that's not a spec limitation.
>>
>> Its not the clearest thing, sadly.
>>
>> Document 80-NF223-11 Rev AB "MHI spec v1.2" Section 6.2 "MHI Registers" table 6-19 (page
>> 106) -
>>
>> Describing MHICTRLLIMIT: "The most significant 32 bits of MHICTRLBASE and MHICTRLLIMIT
>> registers must be equal."
>>
>> This means we have a 4GB range (32-bit) to play with in a 64-bit address space.  If the
>> upper 32-bits of the 64-bit address for both the base and the limit must be the same, then
>> the range of addresses from the base to the limit can only vary the lower 32-bits.
>>
>> Invalid:
>> BASE: 0x0
>> LIMIT: 0xffffffff_ffffffff
>>
>> Valid:
>> BASE: 0x0f_00000000
>> LIMIT: 0x0f_ffffffff
> 
> as an MHI controller driver, ath11k is doing
> 
> 		mhi_ctrl->iova_start = 0;
> 		mhi_ctrl->iova_stop = ab_pci->dma_mask;
> 
> where ab_pci->dma_mask is defined as
> 
> 		ab_pci->dma_mask = DMA_BIT_MASK(36)
> 
> clearly this does not align with the 32bit requirement above, however there is no issue hit.
> 
> What happens if the most significant 32 bits of MHICTRLBASE and MHICTRLLIMIT is not equal?
> SYS_ERR or RDDM?

On the device we experienced this with, we would be able to transition 
to M0, but the later the device would have an internal fault and crash.

-Jeff
