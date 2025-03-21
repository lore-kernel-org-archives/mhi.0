Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B0222CBD5
	for <mhi@lists.linux.dev>; Fri, 21 Mar 2025 16:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742574282; cv=none; b=Fvn93xXsr8DW5zn+I2pQyJOvECw2494NqbF64JimZwhqP5K8B1njd5bAxkFw4Sbyncsgoct+xPyBG2Px9oZSU9X/yGc7joZaI6e0LMd4sIyOdGBUeSelMl+31Y3f9xgd97H9tJ4Y2FzNNZsyGYqgBfX5hedT6cb10IvBnNhJ8gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742574282; c=relaxed/simple;
	bh=Ce6T8nTMLn8tjbpqvuysX6/kEuTvXxlLF287vhRVScg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UWp6RiVdKDx0LNT4/GmoofGWiGnOvyHji4lIfADJnDuBLE6Rubm2DbxyNUDmhxiG20SY61ybfQewo0c3EQIEqizyJL+29hOZz8bAkQ2EsRa9qsqjLuey4SugyffWS5prOVk6WkXYjKgBIUg0jMGrbfGMAoifL6c+SpE9pgszYiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RjqwbgxZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RjqwbgxZ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LATC6T012672
	for <mhi@lists.linux.dev>; Fri, 21 Mar 2025 16:24:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2RGD55MDUFhr8V4lJtueWfpvxPXNIdGp5Dh8bbN/ZqQ=; b=RjqwbgxZ3vz9ILNP
	+rBY9JZUDFaDCa//YDcl+iaj2jPTqsNscHEep4eOCQL2h2ng5PDa+zptx1iOAVFb
	JEOVJGp2KRjrEH0LuFyjOyfL1kAuLwOssMGCFVA9xd/68QgMHxvaqyri5E58skY0
	AknAMDTPAiKPD5Qy5r5xoaq3R9g8gXEfcTA30Ez2t+kC5K5GnK+cA1uDsQk/IB4k
	KN1x3OepabeCmTt6ErZkFZ4MGoXK/0IlD5gfs2ErpyCgVBIGmhd6y3aZ+r/eiCoL
	43HVb/uJn+ehodw+f6ozxpF5w/Su4ti9JCIRKG5PuW7evMxp5Kk98EgBgPgnxahP
	OqGBGw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45g4t46fsr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Fri, 21 Mar 2025 16:24:39 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2ff8c5d185aso6258117a91.1
        for <mhi@lists.linux.dev>; Fri, 21 Mar 2025 09:24:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742574279; x=1743179079;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2RGD55MDUFhr8V4lJtueWfpvxPXNIdGp5Dh8bbN/ZqQ=;
        b=X/a8bT2o7w6AcIEDbnOLOX1QitYC8SAq+skyA2YgxS9FY1FsB8Cssewh8J8ygaw2Yz
         O/uCklRs6blWHwpdtlvQTvhqiQqG7kJ4BrDSoz6JcTtOZUTHBhYe65BFGp3Fy7ccO7Ch
         ASO+ohOBxn4lcGouWB3hws6O0Ia6hQZCJRwxVX21g/ddEjy5qn7jdUUnHEcoQI7U01Cn
         qyw3FJ1337PJ2Y4xzujJYDsEfOnuhEMF7mYS9RdhpNd91HIUPQa30sETU0rpNHaKJKqz
         XVD+L6rgDbirlMWgj0yWxbbGcM3JaJhstOFvOj3ZZWI8GfqkQvGQ+Y1QE2HOqgdBu+pJ
         xWVg==
X-Forwarded-Encrypted: i=1; AJvYcCWwlnPH7XLcChSwxIsRwL7XAqFCunngaIUytcW2C7L4jmKKaJLYXse9QviKY7BqrfmXRoE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwDS68U+APHSgUlKBz1BIlatMtYeaYSld+iTAodV0BmlCclyUlF
	8D0JEmaek71xwlgVvhK499uJsJL22leDSByo+mZkI45CfEs6WGC9q7p1kEqXUOAyifkA0aU39+t
	UDQf3LiIo9N090+lcyfbye5fKERHBh2RaKUXGA7Hsi9fuKiu3iP4=
X-Gm-Gg: ASbGncvKOWiGNGoabSYhWNz8RdVfItE41kuh9D7JEoFn8AeeqTSMijEF4rTrV47+Xwt
	hFOIvsM0jPQQLcfSSQplGWkymrsrcYxCGsqX9HMAwu8D++Mp4tB4HyuABNf2wK1J8dQSWwErk2X
	Ie87d0NYq5144GdzDIRFBVVojoUq6z7lONngvqAtgnqAvN8mjaej7emMBHHVkdbkE4KOcUSXUNR
	FAH6P3zDVXTZSsh64WBlZlYyoTOnU5E5fJn/e13aHEiSnLZ05UNQ1Aky5uZQss22VWCcULhZVbS
	Xd6hVrJZmZqaj7RX99CtWyNHFu4IhgRUwoazbjKWeaIjVRNYE3zQZtoiwKi+/SJZrw==
X-Received: by 2002:a05:6a21:7011:b0:1f5:902e:1e8c with SMTP id adf61e73a8af0-1fe4344e87dmr6878283637.42.1742574278859;
        Fri, 21 Mar 2025 09:24:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVKyG7jIu8ESkFtrQyVslWXHLnITCP9fIR0F65ogdSO80Eb9WUOondzucd95eBbq1SZEDlHA==
X-Received: by 2002:a05:6a21:7011:b0:1f5:902e:1e8c with SMTP id adf61e73a8af0-1fe4344e87dmr6878227637.42.1742574278294;
        Fri, 21 Mar 2025 09:24:38 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739061592b9sm2122068b3a.152.2025.03.21.09.24.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 09:24:37 -0700 (PDT)
Message-ID: <4c803828-79d5-4bfb-aea9-d5735c8eeee8@oss.qualcomm.com>
Date: Fri, 21 Mar 2025 10:24:36 -0600
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: mhi: host: Address conflict between power_up and
 syserr
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: quic_carlv@quicinc.com, quic_thanson@quicinc.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, Jeffrey Hugo <quic_jhugo@quicinc.com>
References: <20250306173226.857335-1-jeff.hugo@oss.qualcomm.com>
 <20250314054651.iu6t3q3o5za2zrjs@thinkpad>
 <6df3f39d-d736-4142-8123-b9afbe8a9848@oss.qualcomm.com>
 <20250318103728.enrcf6mwuxznhgbq@thinkpad>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250318103728.enrcf6mwuxznhgbq@thinkpad>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HMPDFptv c=1 sm=1 tr=0 ts=67dd92c7 cx=c_pps a=RP+M6JBNLl+fLTcSJhASfg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=XiIw4SY5avMduIS90OoA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 0cEOAWiv3dgFwF3_PqcUHjK8bE7va8zK
X-Proofpoint-ORIG-GUID: 0cEOAWiv3dgFwF3_PqcUHjK8bE7va8zK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 mlxscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503210120

On 3/18/2025 4:37 AM, Manivannan Sadhasivam wrote:
> On Fri, Mar 14, 2025 at 11:47:43AM -0600, Jeff Hugo wrote:
>> On 3/13/2025 11:46 PM, Manivannan Sadhasivam wrote:
>>> On Thu, Mar 06, 2025 at 10:32:26AM -0700, Jeff Hugo wrote:
>>>> From: Jeffrey Hugo <quic_jhugo@quicinc.com>
>>>>
>>>> mhi_async_power_up() enables IRQs, at which point we can receive a syserr
>>>> notification from the device.  The syserr notification queues a work item
>>>> that cannot execute until the pm_mutex is released.
>>>>
>>>> If we receive a syserr notification at the right time during
>>>> mhi_async_power_up(), we will fail to initialize the device.
>>>>
>>>> The syserr work item will be pending.  If mhi_async_power_up() detects the
>>>> syserr, it will handle it.  If the device is in PBL, then the PBL state
>>>> transition event will be queued, resulting in a work item after the
>>>> pending syserr work item.  Once mhi_async_power_up() releases the pm_mutex
>>>> the syserr work item can run.  It will blindly attempt to reset the MHI
>>>> state machine, which is the recovery action for syserr.  PBL/SBL are not
>>>> interrupt driven and will ignore the MHI Reset unless syserr is actively
>>>> advertised.  This will cause the syserr work item to timeout waiting for
>>>> Reset to be cleared, and will leave the host state in syserr processing.
>>>> The PBL transition work item will then run, and immediately fail because
>>>> syserr processing is not a valid state for PBL transition.
>>>>
>>>> This leaves the device uninitialized.
>>>>
>>>> This issue has a fairly unique signature in the kernel log:
>>>>
>>>> [  909.803598] mhi mhi3: Requested to power ON
>>>> [  909.803775] Qualcomm Cloud AI 100 0000:36:00.0: Fatal error received from device.  Attempting to recover
>>>> [  909.803945] mhi mhi3: Power on setup success
>>>> [  911.808444] mhi mhi3: Device failed to exit MHI Reset state
>>>> [  911.808448] mhi mhi3: Device MHI is not in valid state
>>>>
>>>> We cannot remove the syserr handling from mhi_async_power_up() because the
>>>> device may be in the syserr state, but we missed the notification as the
>>>> irq was fired before irqs were enabled.  We also can't queue the syserr
>>>> work item from mhi_async_power_up() if syserr is detected because that may
>>>> result in a duplicate work item, and cause the same issue since the
>>>> duplicate item will blindly issue MHI Reset even if syserr is no longer
>>>> active.
>>>>
>>>> Instead, add a check in the syserr work item to make sure that the device
>>>> is in the syserr state if the device is in the PBL or SBL EEs.
>>>>
>>>
>>> Don't we need a Fixes tag?
>>
>> I don't recall seeing documentation saying that Fixes tags are mandatory.
> 
> It is the standard practice to add the Fixes tag if the bug was introduced by a
> specific commit. But...
> 
>> Yes, I agree, they are helpful and should exist.
>>
>> I am finding it difficult to point to a single commit that I can say
>> introduced this issue. I believe we started seeing it with "bus: mhi: host:
>> Add MHI_PM_SYS_ERR_FAIL state", but I don't think that commit actually
>> introduced this issue. It seems like a coincidence that the issue was first
>> observed with that commit.  I suspect that this issue has been a problem
>> since the introduction of MHI, but I am not confident since the relevant
>> code paths have radically changed since then.
>>
>> Given I don't feel confident in identifying a commit, I felt it was perhaps
>> better to not list one at all.
>>
>> Do you have any suggestions?
>>
> 
> Fine with me. In that case, it would have been helpful if mentioned in the
> changelog area.

Ah, that is a good idea. I'll add something with v2.
