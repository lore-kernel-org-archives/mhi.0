Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515AF18C02E
	for <mhi@lists.linux.dev>; Fri, 25 Apr 2025 16:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745597467; cv=none; b=kW1wHnX78ehXp0/PUT8mp7NzJ0wqEtiFQJ6H9Z6r866UXvcoM7oixqH+TAcvV/jvz4onFwwuIAK8DepKMs1xHhDSRm3PwOhvZWjZCoQWYWVSmrSOsOv9nx5an6QK2nstD58Q2yF9ZM/qh93zybjr0w66wcnCxd0ZVAqWJkGoviE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745597467; c=relaxed/simple;
	bh=kyXSdPUuw/vVAlQRBSkB9d13MW7ENNLlR7wZk+1Gqkw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NbuBwBw2kLqWPuif0RhW5L3YKBwIf9GZS3ev649bJvMmYMrJbiOCV1BAFbG4/UgAj8D+CwBktI4AA0WQaj9h/kyUBfRcSAAIJ0cwEQAxdgG+Zyp1NvqY0LaQb3ug+R+4npv4vDqcfRQEMr/kp+Jj2ePw+abQeV2MaT0GOZtIcIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dgGaURLn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dgGaURLn"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8TBvF007414
	for <mhi@lists.linux.dev>; Fri, 25 Apr 2025 16:11:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RElAtBUh3JMadqAp/lUXLP08HTrrFyJ/4SCZtOIMXWs=; b=dgGaURLnJKgMlQ0Y
	SMmXUhc0Q212Ckq7NIqIlDyrfbEhw5yYmOxqQZ2wrgQtP16kvaJcaEJUGJTAyKOO
	kEpnALgq0/j15w2yKoqjxN6tJWtKy5XvcQo+Zw4f0vmmS88wKvCtNaljzb7EvUTt
	gavwdkJ4wtAwAKKmUj3UTBRRtScLX4psGEOf7vgxrvoGoEtrA6jVxOas6ot/yRit
	UxBCVOZjUelY0iu10RGtAgqPmFaoUN2hGjUMs2aIXeGkE7lHunhTYPvgLMZ3/JPo
	5kYsQZMyjaUVqmyki+h7oIeavn+TziZqbGqRXJWzBSvLaWvxQLwZwr6AHQ8j0XfM
	5JWgdw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0shck-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Fri, 25 Apr 2025 16:11:02 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-227ea16b03dso37287025ad.3
        for <mhi@lists.linux.dev>; Fri, 25 Apr 2025 09:11:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745597461; x=1746202261;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RElAtBUh3JMadqAp/lUXLP08HTrrFyJ/4SCZtOIMXWs=;
        b=qIuwS9L0Lw6YrBxYn+dnEToAHrpZGOgBoHfVB51rI9GUecs11p9vr2x1GXjxq3HbZC
         zwR0u9TXT6EAN48nfmgMH1splhXvOE+6dlXN0qDn5l7JkwS5RRZFhdE5lRELpQR09LUT
         yantW/G0bc7QTu3V1qHmrgFG4dyJMNuvU+4YAVAERCmVmcpEnVFHD6+eMwTFhshpFBUX
         DvziqwG19aQvUTtN+1tITStxC0X7PYW4f4aOlIFQIYzK4H1Hh1HH9ji+fdKldp7Rt2el
         OKBht0aj1xfDsAqec6/RdAPY1KIUo8yBfH4CNNgBCyMdtj895JtEy4FP5xYRmUxSZkyh
         oD8w==
X-Forwarded-Encrypted: i=1; AJvYcCUCH0BNU3wYE7jwy009xGplmwZJJgwfo5zihlKEIOu4T12m70/0FscupZGVkz1sU/lb1v8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxTbe84cUrJGw/AQjYkXuiKch1dpRR0D4XkYi/CKMYlZ8m6lDYc
	KZ2Pik32ORo4PFI/AOW/TMVPCFbtFOxwT09Af1MIP84KVQ32ycob8JpY7G1ahSp0LyDchhzTQ0K
	JrI9t9cld3pdlkE4a7oucBborzoRExk8qAt7HnVjh5J4q3tvoy2o=
X-Gm-Gg: ASbGncvKdrp8rZ8j5hF3G6gaMIhJsu40b6Z7OW4C8N4Q5218KmWR4jDjIH9+0WhMUw7
	biL74ccEsE5A7hqBXOsFnuEclBCVE9IswRJnl4QlJ1Ti6joIvOLC7IxUelqLmkklbXf9144cxcP
	cGaC/3qzzfaLCYFvNH8572hosSxyjNynHVlzQqv6uDmDkXiTUWY4UbBbZJOFcYVIDnjZ56uE0Lt
	M6jdAGDvjbnNCVCUgvuf5ztRifM51Ck/eB3PBoBXppG+RSOSA4kq86CWCXB9lazFBadpaASS1H9
	0NKFB8lDF8v0dMom8P6ql+4Ot+ZppBrTNLJcGCWhVFc8mRIDN7ktPb1oMIi4oA==
X-Received: by 2002:a17:902:f687:b0:220:efc8:60b1 with SMTP id d9443c01a7336-22dc6a684damr2158265ad.39.1745597461465;
        Fri, 25 Apr 2025 09:11:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+iKresbEHMCAR10tWIKzWkb6iN1Onwn3haKXlAZ0Es+wfyOdv61jmnXzmWzIAafdyl8Xpzw==
X-Received: by 2002:a17:902:f687:b0:220:efc8:60b1 with SMTP id d9443c01a7336-22dc6a684damr2157905ad.39.1745597461048;
        Fri, 25 Apr 2025 09:11:01 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22dc5aaaa54sm2693295ad.227.2025.04.25.09.10.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 09:11:00 -0700 (PDT)
Message-ID: <3ceda07a-7261-48c4-aa60-fd5ad83ebf34@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 10:10:58 -0600
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: mhi: host: Allocate entire MHI control config once
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: quic_carlv@quicinc.com, quic_thanson@quicinc.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
        ath11k@lists.infradead.org, jjohnson@kernel.org,
        quic_bqiang@quicinc.com
References: <20250328165913.3380933-1-jeff.hugo@oss.qualcomm.com>
 <pgr6u3onrlf4mvldqn7cxlqkh3krduv542jqgjcy5c535ys6hm@dujbvax4b56s>
 <07cc4ee2-4a13-495c-bc4d-8837d6b54414@oss.qualcomm.com>
 <qhoirbfx5p23542hhi3kk7ftwtptsnoxgtewddbh322d74rgb2@xbupxi3ix7sx>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <qhoirbfx5p23542hhi3kk7ftwtptsnoxgtewddbh322d74rgb2@xbupxi3ix7sx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: EgMVAU1eHNxubCs43rcz5wxEog-FQqb9
X-Authority-Analysis: v=2.4 cv=ftfcZE4f c=1 sm=1 tr=0 ts=680bb416 cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=KGs-PxyYlbaIbUy0pvQA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: EgMVAU1eHNxubCs43rcz5wxEog-FQqb9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDExNSBTYWx0ZWRfX8pJyd6xH6+Om rFKhjAKdLo6LV3vVJ34kN2IAEmX6yg+MIBB9Dn2myTzZoqYgsPirPscLLRK6pkuokFbA84W2TMH Ky55HL/BI48i2VYTjlzR5WZF2sDwyR2WcLeFQo2/Orsip5b3L0QEfFZZHsio0Afm3IfIrwBMFVb
 +wQ5fh+I8IxL56SDujswMDkiv4lYGcorNdb5yiqf5YtWMJJK0WwGfWdN8RgFEvC1YYKPX0UX8Kk JT3OZlnhZ4ywMcL5GUy7GG2wtP+DV6Maz/m1+bgzyKihCYxJeIhVswTh0ErePwUAof527pTUVH/ u/zYPsNKPZxMLoWzRBRGK2ylCI/ChqbCfcajMBrskBQ9TW13K8C5AB4yg6L3QPPTBjCxRWv9b8d
 ho1SxxFlGjJRjv2YWyr6APA1HuX4bV7YRv1xpCOFHOoFWvPSqTmVrO11d90GIimZUewFgrkM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250115

On 4/24/2025 11:37 PM, Manivannan Sadhasivam wrote:
> + ath11k list, Jeff and Baochen (for question regarding the use of reserved
> memory for allocating the MHI data structures in host)
> 
> On Tue, Apr 08, 2025 at 08:56:43AM -0600, Jeff Hugo wrote:
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
>> We tripped over this when experimenting with an automotive market product.
>> The FW for that product had a rather strict interpretation of the spec,
>> which we confirmed with the spec owner.
>>
>> In the specific FW implementation, the device maps the entire MHI space of
>> shared structures in a single ATU entry. The device cannot map an entire
>> 64-bit address space, and it expects all of the shared structures in a
>> single compact range.
>>
>> This applies to the control structures, not the data buffers per the device
>> implementation.
>>
>> This restriction seems backed by the spec.  I can't find a reason why the
>> device is invalid, if limited.  I don't think this should break anything,
>> but more on that below.
>>
> 
> Yes, atleast I have heard about that limitation before.
> 
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
>> Document 80-NF223-11 Rev AB "MHI spec v1.2" Section 6.2 "MHI Registers"
>> table 6-19 (page 106) -
>>
>> Describing MHICTRLLIMIT: "The most significant 32 bits of MHICTRLBASE and
>> MHICTRLLIMIT registers must be equal."
>>
>> This means we have a 4GB range (32-bit) to play with in a 64-bit address
>> space.  If the upper 32-bits of the 64-bit address for both the base and the
>> limit must be the same, then the range of addresses from the base to the
>> limit can only vary the lower 32-bits.
>>
>> Invalid:
>> BASE: 0x0
>> LIMIT: 0xffffffff_ffffffff
>>
>> Valid:
>> BASE: 0x0f_00000000
>> LIMIT: 0x0f_ffffffff
>>
> 
> Ah. Didn't spot this before, thanks for explaining!
> 
>>>> Since the current implementation is in violation of MHI specification.
>>
>> For example mhi_init_dev_ctxt()
>>
>> We allocate the chan_ctxt with dma_alloc_coherent() as an individual
>> allocation.  In the case of AIC100, the device can access the full 64-bit
>> address space, but the DMA engine is limited to a 32-bit transfer size.  The
>> chan_ctxt probably won't be larger than 4GB, so the size is rather
>> irrelevant.  Can be allocated anywhere.  Lets say that it gets put in the
>> lower 32-bit address space - 0x0_XXXXXXXX
>>
>> Then a little bit later we allocate er_ctxt with a different
>> dma_alloc_coherent() instance.  Being a unique allocation, it is not tied to
>> the chan_ctxt and can exist anywhere.  Lets assume that it gets put
>> somewhere in the non-lower 32-bits - 0x1000_XXXXXXXX
>>
>> Now we have a problem because we cannot describe a single range covering
>> both of these allocations via MHICTRLBASE/MHICTRLLIMIT where the upper
>> 32-bits of both registers is the same.
>>
> 
> Yes, I get it. I do not have issues in allocating all the structures in one go.
> But the problem is with MHICTRL_BASE/LIMIT. More below.
> 
>>>> Allocate a single giant DMA buffer for MHI control configurations and
>>>> limit the configuration address space to that buffer.
>>>>
>>>
>>> I don't think this could work for all devices. For instance, some ath11k devices
>>> use a fixed reserved region in host address space for MHICTRL/BASE.
>>
>> Why would we be unable to allocate all of the control structures in a single
>> allocation out of that reserved region?  Is it larger than 4GB in size?
>>
> 
> I was confused by the fact that ath11k driver adds an offset of 0x1000000 to the
> reserved region for the iova_start:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/wireless/ath/ath11k/mhi.c?h=v6.15-rc3#n331
> 
> So this means the firmware will only map the memory from reserved + 0x1000000
> for MHI data structures. But even with current implementation, the MHI stack
> doesn't know anything about the offset, because it just relies on
> dma_alloc_coherent() API which will only honor the reserved region pointed by
> 'memory' property in the node (without the offset).
> 
> So I'm not sure how the firmware makes sure that the data structures lives
> within the offset region. This is more of a question to ath11k folks.
> 
> But your series is not going to make it any worse. Sorry about the confusion.

No problem.  I appreciate the sanity check.

-Jeff
