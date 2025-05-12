Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917A2298261
	for <mhi@lists.linux.dev>; Mon, 12 May 2025 18:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747074807; cv=none; b=FYuZtmEbdhYS8c8EXAMcZQaAwxwVTuDvfOXCy0FwIu0SkIi0vaM/9ofDtHkWu5zSqPAFc2TXIGJZUXolDeMyfbOIcysP4Oq+XOk6zVukYcyoemKPKItp1kGZITM0kqf1s1YCjVKcxUps29bYO8Jx/eklc0rAhh/R2ey8zh46+1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747074807; c=relaxed/simple;
	bh=aDzYot1UR4Zcmwz4Eld/x6O1R7gTqHoNaxoeh9bS+LU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iGfuDX9TcVKYGNjTLhMrX7LzaNlynhWad6uwRTNiJBK5UBhYlqTdubEQz193fD1RNOlBhi6uL+Fqj0freNp0+kXPJx0Y65bH+YWziqW7gZJKO26+XCljb5nAOZuGVPRgu1kd2T2QEUV2Fx76dbXf/THjtCI6HC5uIqDT7Bk4T/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iw/a02li; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iw/a02li"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54CINupN028882
	for <mhi@lists.linux.dev>; Mon, 12 May 2025 18:33:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VxrFhle6Q7x3SsW3S3OBWp8saSxehDwsTZ49UOl2F/o=; b=iw/a02liFRaJEu/f
	XOpE7827hNr1HY2fwuyGRUQMeSJUrxyNX8jdaVFb4TWLVVs3vj9m9FOvziHoMrOK
	LGkgRycaAE9IpcnidEUZCaDhCY3MzmDCAmRYM4Y5KMVnTSMSEUhpTGtWYDSHTfYn
	4Hn+3S48zIAxFLGlwXzZeG6NOMdwznH8GPvlSvdhbZlNf4XP4sqgFbXrp5+syfYA
	q1hBtF7QaOPSU4UHO1RliVCHtgewq3h7omdQ+uZX9bldV920NgczcJhEFh5asGjf
	bw2+MrROoP1Opq6EjDg+YJ82jmOLlaGKH7reKJWlMtfJtiJOibTRrQPy/R5aP9vC
	rhqj7Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hv5qdjfy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 12 May 2025 18:33:24 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-30a91c0745bso4580495a91.1
        for <mhi@lists.linux.dev>; Mon, 12 May 2025 11:33:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747074803; x=1747679603;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VxrFhle6Q7x3SsW3S3OBWp8saSxehDwsTZ49UOl2F/o=;
        b=YU2xKUSimv4ctRXkieNAh62w7b1S+IVotCtw4dBkcU2HlrkoOYerdT5BRFslJyrOB7
         O6z7lSWwjaxRpE1M2SLBBCbO4jC7JTZ0QFRNozFVLLFh6ZYzdeoOrvsuPDORSeVzqQxP
         KzymT9NOPOUve62Kqr5XYC9RUdWU2N2nY/eA00KjfSQqoxUcAu+Jrk26XyWejI4wISF3
         E45TEzxY3kE7+R/rvNVCqrMqFg6OUJs432tEiwyt8z1XdNnBtzWxIzhyEftjA2PVlt6/
         CVSEPcKG+IjNLIfZv2jKDgaSylEMu/gxW/3RPUAY0ytYLf2izMlbjL61yzBcW7zWWbV+
         Yczw==
X-Forwarded-Encrypted: i=1; AJvYcCUliGKhVpgcr62DnCrIzX3nZJBol7W/kyBDnfw7qS47siPMP3737ryP/D7iK5tsTBWUhqo=@lists.linux.dev
X-Gm-Message-State: AOJu0YzNVD5edSZ0jDwabQzj4kTA4pGZgUPfcgiMeLYDcOHCCDXtG8p4
	H6Jpr28/xzeeq78McowDdQm1iBDNH8dg24L/RrElsUthORLk9VBgb8tAnVGcfgar6KCG+uaoPN0
	X1KiN3VrskG4+OOD7bLDIExSktUVIv2rM13v9lOjY7HyBUvVuIIAwAov2cas=
X-Gm-Gg: ASbGncsnXPipbey6Ux1mJu7UzZ3OZBe7CEC1nZAyAeOKXqgHiNfrFDt1cGkc0iRzgq9
	owlZgR3gIf6Hy9DIuArc5RePTsuyMAnwLq1lTAnkVcO5zNzjPsh94933wb4OT5bVmvUDaLQn6SL
	FL3KDZ1R98qFxgCK6duINTcgQpLsSJLoqLQ2i1KBTIdePBZ8ggwI3BrbIimhE+a+usgOOnODSht
	G05PBrZPeuyAuUNKcRQkxL+D5RVkDlagE70di0sybvXsXmaR6AB4M0b1TU6ebou/gge1450Z1cW
	nFwCg90gG30CDMBeBeVqt0Yx+1AvZoh/AAQAQPcdoVn4u5UKiWzwOjPPmTn1MA==
X-Received: by 2002:a17:90a:d448:b0:302:fc48:4f0a with SMTP id 98e67ed59e1d1-30e0d961a48mr788711a91.0.1747074801151;
        Mon, 12 May 2025 11:33:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7h8nksE6voI8ZNDv3lNphjA8snw0h3t7JMhjz++0SjhwNvzvqXw27YDGBnFDpyAfCYyoK1g==
X-Received: by 2002:a17:90a:d448:b0:302:fc48:4f0a with SMTP id 98e67ed59e1d1-30e0d961a48mr788660a91.0.1747074800705;
        Mon, 12 May 2025 11:33:20 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2349325e16sm6094190a12.1.2025.05.12.11.33.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 11:33:20 -0700 (PDT)
Message-ID: <1347c6de-1748-4e35-a0ac-4fd77199045b@oss.qualcomm.com>
Date: Mon, 12 May 2025 12:33:18 -0600
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
 <723cb707-2bc2-481c-ab6a-1146c9677821@oss.qualcomm.com>
 <9ac836c0-2c41-4656-b922-5dc20aecf53f@quicinc.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <9ac836c0-2c41-4656-b922-5dc20aecf53f@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=DqtW+H/+ c=1 sm=1 tr=0 ts=68223ef4 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=FsthO6bNoa9-iHtu9tEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: JeJKlRgmqZqqx7lzf4VcW9A4YIpWubZy
X-Proofpoint-GUID: JeJKlRgmqZqqx7lzf4VcW9A4YIpWubZy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDE5MCBTYWx0ZWRfX8s0zcBXmgE81
 xanf4640wvHBsUU14P3KUIjQcxiYigYpOSarf/o1Y+v4DRD2Yh6mlDfO1si7B8ioQpgKaipkDtU
 mQiElQRL1BssTUX1td+HrlO+53sDvvrJ+WMEAVInjIHeDOz70ksSzubF2qmgc7vSsBJewVd+Fa5
 HDNos2LsnHGeXJid4dkn+ScCoIUYjc5NpFOVMFLOOox2LyCPYxdejnk6+JILCfdHlYnzqrrsRcy
 whvxn9hWSoc2EnF66GEV06pVem7HoUBGstneijoVo+quFTBFuFw5Swq+CSa1tgENdYjwI7pJAwj
 a0Mgoy52HhLZ48ei4ZQtwz37dnNMAG5Cz8h4eEskk7WZ4iZL0LaBXd+XRuQYjBoK4C/dOwcmSVb
 al9wwe1hJN+MbsZjzf7XZrZlDtn0dyBvKahFf/sC3U6rgGJQzE9T33Q+W9jzVrMa8Vcri9i3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_06,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0 phishscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 mlxlogscore=999 malwarescore=0
 suspectscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505120190

On 4/28/2025 7:44 PM, Baochen Qiang wrote:
> 
> 
> On 4/28/2025 11:09 PM, Jeff Hugo wrote:
>> On 4/27/2025 7:37 PM, Baochen Qiang wrote:
>>>
>>>
>>> On 4/8/2025 10:56 PM, Jeff Hugo wrote:
>>>> On 4/8/2025 1:01 AM, Manivannan Sadhasivam wrote:
>>>>> On Fri, Mar 28, 2025 at 10:59:13AM -0600, Jeff Hugo wrote:
>>>>>> From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
>>>>>>
>>>>>> MHI control configurations such as channel context, event context, command
>>>>>> context and rings, are currently allocated individually. During MHI
>>>>>> initialization MHI bus driver needs to configure the address space in
>>>>>> which this control configuration resides. Since different component of the
>>>>>> config is being allocated separately, only logical solution is to give the
>>>>>> entire RAM address space, as they could be anywhere.
>>>>>>
>>>>>
>>>>> This is fine...
>>>>
>>>> We tripped over this when experimenting with an automotive market product. The FW for that
>>>> product had a rather strict interpretation of the spec, which we confirmed with the spec
>>>> owner.
>>>>
>>>> In the specific FW implementation, the device maps the entire MHI space of shared
>>>> structures in a single ATU entry. The device cannot map an entire 64-bit address space,
>>>> and it expects all of the shared structures in a single compact range.
>>>>
>>>> This applies to the control structures, not the data buffers per the device
>>>> implementation.
>>>>
>>>> This restriction seems backed by the spec.  I can't find a reason why the device is
>>>> invalid, if limited.  I don't think this should break anything, but more on that below.
>>>>
>>>>>
>>>>>> As per MHI specification the MHI control configuration address space should
>>>>>> not be more them 4GB.
>>>>>>
>>>>>
>>>>> Where exactly this limitation is specified in the spec? The spec supports full
>>>>> 64 bit address space for the MHI control/data structures. But due to the device
>>>>> DMA limitations, MHI controller drivers often use 32 bit address space. But
>>>>> that's not a spec limitation.
>>>>
>>>> Its not the clearest thing, sadly.
>>>>
>>>> Document 80-NF223-11 Rev AB "MHI spec v1.2" Section 6.2 "MHI Registers" table 6-19 (page
>>>> 106) -
>>>>
>>>> Describing MHICTRLLIMIT: "The most significant 32 bits of MHICTRLBASE and MHICTRLLIMIT
>>>> registers must be equal."
>>>>
>>>> This means we have a 4GB range (32-bit) to play with in a 64-bit address space.  If the
>>>> upper 32-bits of the 64-bit address for both the base and the limit must be the same, then
>>>> the range of addresses from the base to the limit can only vary the lower 32-bits.
>>>>
>>>> Invalid:
>>>> BASE: 0x0
>>>> LIMIT: 0xffffffff_ffffffff
>>>>
>>>> Valid:
>>>> BASE: 0x0f_00000000
>>>> LIMIT: 0x0f_ffffffff
>>>
>>> as an MHI controller driver, ath11k is doing
>>>
>>>          mhi_ctrl->iova_start = 0;
>>>          mhi_ctrl->iova_stop = ab_pci->dma_mask;
>>>
>>> where ab_pci->dma_mask is defined as
>>>
>>>          ab_pci->dma_mask = DMA_BIT_MASK(36)
>>>
>>> clearly this does not align with the 32bit requirement above, however there is no issue
>>> hit.
>>>
>>> What happens if the most significant 32 bits of MHICTRLBASE and MHICTRLLIMIT is not equal?
>>> SYS_ERR or RDDM?
>>
>> On the device we experienced this with, we would be able to transition to M0, but the
>> later the device would have an internal fault and crash.
> 
> so with this patch, MHICTRLBASE/MHICTRLLIMIT are untied from iova_start/iova_stop, meaning
> current ath11k settings does not break the requirement, hence no ath11k change needed, right?

I think so.

-Jeff
