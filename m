Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C51445AD5
	for <mhi@lists.linux.dev>; Wed, 19 Aug 2026 09:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787132795; cv=none; b=LoKROqgVsxJnUiKPjWvgP0tuhnlshCOMhM/BdSZLHlOllEinPfkKehAnd4cG3LmlbdalhT+co78L49the0CqiiFw2TbjbjJfrnjqWLy17iJamhKOcf3RMIgEwrZQfj53RPuTMrCz8iDd47a1r1csD3iYOfXiSGZOu5tCCQ7KkbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787132795; c=relaxed/simple;
	bh=pYjwEVl/tkhukaJEMrlUw8VOwNDE+8uSUJf4huCQzK8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lCTJApsE795w2KHCZHJOsrWE0zuK8f128IzbkABOOMZUVNRg0eVJuIOxkHcOtJme3HDS0DwwTudjdpoz83YVkpmwif0T/qdTa66AWHubZs9B+rrvhu8ZeN6E2xiy46NiVnloUcKsfHZJU3oDi6eW7L3tnsa1sN4J970ulyKsKVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Txw+Ppa1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R9O/nSfH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Txw+Ppa1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R9O/nSfH"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67J6Yu94026361
	for <mhi@lists.linux.dev>; Wed, 19 Aug 2026 09:46:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l73nbHT42OxFs92+TFnovfwcUxNgHxMHwTDcJQUBPnk=; b=Txw+Ppa1+8fHZwKo
	JwW2yEPSVm8e7mYkRKuMEhmL3mIl+uiVKKfzEPDJJhGetd2dF3sO/fnEdCkHWmfY
	pRoSB4sFiIKOI6Or44RKaNWi53M4zv25hAxv9ZjPQtC0Ba9G57tpSa7/IjwNsbLk
	dCkv/Ex5DX0h4kflsq6TK4jDLoknP1BS5MpXdZfcOdGKI4EFxKd6pWKS4yi6mblL
	fCQvq9oerXSjzUL+MdvsC2cPCqooc4eMQcfzDPHlOZ+rrFOMGJiZvFdtg4ZUhlSv
	Q7itUYFYDGlk2HvDgFcZj6OPGyLiWNkU3DJh+dbrs0E9DhbgMAQHeKQxVMBLrF3I
	xj/9Rw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfpteuj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Wed, 19 Aug 2026 09:46:33 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cfe48ca1efso10989425ad.0
        for <mhi@lists.linux.dev>; Wed, 19 Aug 2026 02:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787132792; x=1787737592; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l73nbHT42OxFs92+TFnovfwcUxNgHxMHwTDcJQUBPnk=;
        b=R9O/nSfHdVas0gpwqJJQ+gdll3PJMHeMDAhWEniX3sVxbs/RqDe5xS/0qWIdycU8ir
         CkUZXXVUsiCOWTh49RH5Shuvk+8NtyGjFJlVPAmeKHWFAcLQr81gXOic8fU6s1azUBNR
         lPx22lYNfk6++TUMFxe4zAEuqXdKbh+I0Cv1q2XuuOvK8/l4wetHwso+zEGdBFTpcz1r
         szqDOnJV/d7ZfLJwSE9aNYQFksU4q1DfdVTqpGrrEoB2vh6eUwRyXPfxAtxNXcRl73Sn
         YAfeBxf+SVVcdMR9mUnyDyu3Ik4HpF+Yl65Jq5OJn6ukQihwHGWYZPwzgJSKiIH2BXNu
         JcPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787132792; x=1787737592;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l73nbHT42OxFs92+TFnovfwcUxNgHxMHwTDcJQUBPnk=;
        b=Q5mMJQTUzInXZa+krAToG7//uGG7m+W1oQKFeHF3Z/Tl2KPz6v6UiMa+WpA0n2y9Wq
         +PeOcUsXaY3Sea55EfdAjjWuUffNlXMX74qUZRz3Bpe4mtVjbQVVE1hlv/D/T5zwZU3H
         7QhRs05NHyOmPwPzq7GwPJbVWezfnHzgXIKKOY9ld5ozXghfLXnyzsJbyZ6Mu22iYJjl
         Eih61O5FVlTix+a3qk5rK6rLn3RcPQXO5i5thZNo5m6qgy4mJLETLU4Z4bkRZlwpUzEq
         BNbY5gQhhVj8sekOujJ/IltcliMasaFwjrSkuCftjKY2oHxRqoSsqGR0tQaW173LDcWS
         FDYA==
X-Gm-Message-State: AFuF++kaiG/KmMAhajAHiJ0stdpfrH+ck/oNk5iOU448f6MbtskUQeJH
	u3gXT9IaR8Ghrdb5LANP8zotaXbrLu6jdmifVLBlVmjuvAdHppoaVIz+i5Vf5hiBZF2xgmJoWC7
	WYF1P/qbUFw6Ap6g4dNDGwmCOYFhoZB6djR+4GRdpDIiOiqOaGWiiegM=
X-Gm-Gg: AR+sD11V6IqJGPV9pmkGIcNMoNOr4VvQPNdgfGxLMm1+UQX5mchuDIn6r4N2cb7vjFz
	u9xqXKwH3bRYHFP1I7GO7mkw0SM53JSCFqBaSBIjUVUuSVUusQTOnaDgXDZE1885eJBe+Se/2x2
	07EdTa/febDdta1jl6CJAM1h6WZzw8J6b6njxnbUAji/G8yI3vrG1EjIvLB74psM1LXhQhvKHeK
	uOvsE4fXKzD3OtNPqvvoslKYvLnXagOVeHu8l8zetrim1Xu1v0gzNgasCI3vzprVy+TjXeagbLV
	+/Ui2qbJogYWDBB03FnBUAttJ93yKopGbA0Y7vuAekD74Frq0p+kpJcKcYJpgM6l33/o461cn5J
	6gF8EY61R7QKo7sJCudQcD0nWMlgG2Q==
X-Received: by 2002:a17:902:ef44:b0:2ce:93a3:c16c with SMTP id d9443c01a7336-2d600cc605bmr61764615ad.12.1787132792123;
        Wed, 19 Aug 2026 02:46:32 -0700 (PDT)
X-Received: by 2002:a17:902:ef44:b0:2ce:93a3:c16c with SMTP id d9443c01a7336-2d600cc605bmr61763895ad.12.1787132791517;
        Wed, 19 Aug 2026 02:46:31 -0700 (PDT)
Received: from [10.217.216.255] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5bb5326f8sm25299165ad.37.2026.08.19.02.46.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 02:46:30 -0700 (PDT)
Message-ID: <416325cf-1e84-4c28-8dbd-cd42e6edfdeb@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 15:16:27 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] bus: mhi: host: clients: Add loopback driver with
 sysfs interface
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
References: <20260817-loopback_mhi-v5-0-50efc7360b7f@oss.qualcomm.com>
 <20260817-loopback_mhi-v5-1-50efc7360b7f@oss.qualcomm.com>
 <1b5301df-3d0a-497b-823d-fe43a34a5ee6@oss.qualcomm.com>
Content-Language: en-US
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
In-Reply-To: <1b5301df-3d0a-497b-823d-fe43a34a5ee6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: _dXZoF5R86zXGZiaHch_OQqIc7T-Wso4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA3MyBTYWx0ZWRfX9A8BQ261x2XY
 FaDV3mhgnQ2+8ruOmxvOvGN2J2PAmSr5KmxLTd7gFeujNc6nxGrvLUVVvUKBZa44EARsA+UiYxu
 rzSAaDFU4iKWOu4xmoySTHAzHJoRC7WA2REGYzaQIi3IquTXWOkv7c6AugRpzX4cCiQ6+h7od0p
 MOfZ03FkIJ9L5MIK0lk97OTZTUY0QZNkGati21vRoI2iOQglm3cd5IU9HmeLhbG7RSLcxkwyvBt
 ewxjZAYmGo9b+N6gPI8XCFuGolcCdH0dYGYP2SfYEGngdOAGl+SpTL4w56EyehgQgRj1aVdoHke
 5QtbHFhkgStN0/8TakyzRKVaEXCvf7dO83pcpogW/HrDRLsPaooh4yLP4fDstfHvRhZGoZJ+iM6
 MWFG+/aDvmHkm9bFzxJ2LjMTDsBiEDomsmoWKe3zBp0OBzRftLbeBSb9HWKB/fYL3e10h00RK6t
 B017c7fEulxguR0fFow==
X-Authority-Analysis: v=2.4 cv=aMrAb79m c=1 sm=1 tr=0 ts=6a857b79 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=tYF7Tg-db0wKN6MUNa0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: _dXZoF5R86zXGZiaHch_OQqIc7T-Wso4
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA3MyBTYWx0ZWRfX0ztRT3jsvtRH
 G+A4SAuiyTnPfoPumiBIBA9diT7lvVuNOPHlIts2/YkJZRy04G5E5J5S0ko0zabzb7rqhvr2Ezf
 n4f/OMitzEzAw3YbcNQasLvH4L1NYs8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_02,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190073



On 8/18/2026 1:44 AM, Jeff Hugo wrote:
> On 8/17/2026 4:14 AM, Sumit Kumar wrote:
>> The MHI specification defines a LOOPBACK channel. The endpoint firmware
>> echoes back whatever the host sends on this channel. Without a host-side
>> driver, there is no way to exercise this channel to validate MHI data 
>> path
>> integrity between host and endpoint.
>>
>> Add a host-side loopback driver that binds to the LOOPBACK channel and
>> expose a sysfs interface for data path testing. The sysfs interface 
>> allows
>> users to configure TRE buffer size and count, trigger a loopback 
>> test, and
>> read the result.
>>
>> Co-developed-by: Krishna Chaitanya Chundru 
>> <krishna.chundru@oss.qualcomm.com>
>> Signed-off-by: Krishna Chaitanya Chundru 
>> <krishna.chundru@oss.qualcomm.com>
>> Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
>> ---
>>   .../ABI/testing/sysfs-bus-mhi-devices-loopback     |  39 +++
>>   MAINTAINERS                                        |   1 +
>>   drivers/bus/mhi/host/Kconfig                       |   1 +
>>   drivers/bus/mhi/host/Makefile                      |   1 +
>>   drivers/bus/mhi/host/clients/Kconfig               |  17 ++
>>   drivers/bus/mhi/host/clients/Makefile              |   2 +
>>   drivers/bus/mhi/host/clients/loopback.c            | 289 
>> +++++++++++++++++++++
>>   7 files changed, 350 insertions(+)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-bus-mhi-devices-loopback 
>> b/Documentation/ABI/testing/sysfs-bus-mhi-devices-loopback
>> new file mode 100644
>> index 
>> 0000000000000000000000000000000000000000..1622a146110c2069c8b51e5bdf665c882b853303
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-bus-mhi-devices-loopback
>> @@ -0,0 +1,39 @@
>> +What: /sys/bus/mhi/devices/mhi<N>_LOOPBACK/tre_size
>> +Date:        August 2026
>> +KernelVersion:    7.2
>
> This series missed 7.2, and will miss 7.3 since the merge window is 
> already open.  Next oppertunity is 7.4.
Acknowledged, thanks — targeting 7.4 next.
>
>> +Contact:    mhi@lists.linux.dev
>> +Description:
>> +        (RW) Size of each Transfer Ring Element (TRE) buffer in bytes
>> +        used for the loopback test. Valid range is 1 to the value
>> +        reported by max_tre_size. Default value is 32 bytes.
>> +
>> +What: /sys/bus/mhi/devices/mhi<N>_LOOPBACK/max_tre_size
>> +Date:        August 2026
>> +KernelVersion:    7.2
>> +Contact:    mhi@lists.linux.dev
>> +Description:
>> +        (RO) Maximum allowed TRE size in bytes. Reading this file
>
> Entry before this and after this explains the TRE acronym, but this 
> does not.  It probably should, as someone may jump directly to this 
> section and not read the entire document start to finish.
Will update the description.
>
>> +        returns the upper bound for the tre_size attribute.
>> +
>> +What:        /sys/bus/mhi/devices/mhi<N>_LOOPBACK/num_tre
>> +Date:        August 2026
>> +KernelVersion:    7.2
>> +Contact:    mhi@lists.linux.dev
>> +Description:
>> +        (RW) Number of Transfer Ring Elements (TREs) to use per
>> +        loopback test. Must be greater than zero and must not exceed
>> +        the channel ring capacity. Default value is 1.
>
> How would I know the channel ring capacity?  Should I just try values 
> until I get an error?
if you try to write any value bigger than ring capacity the error will 
report it with the max ring capacity.
Would you prefer having another read only sysfs to find out the ring 
capacity ?
>
>> +
>> +What:        /sys/bus/mhi/devices/mhi<N>_LOOPBACK/start
>> +Date:        August 2026
>> +KernelVersion:    7.2
>> +Contact:    mhi@lists.linux.dev
>> +Description:
>> +        (WO) Write any value to trigger a loopback test. The driver
>> +        sends random data to the endpoint using the configured tre_size
>
> It feels like these kind of interfaces usually give an option to 
> specify a byte pattern as well, but I don't see that option here. Is 
> random data considered to cover all usecases?
Since currently we are checking the data path, random bytes should 
suffice for now.
Happy to add a pattern option later if a concrete use case needs 
deterministic content, but I'd prefer random as the default.
>
>> +        and num_tre parameters, waits for the endpoint to echo it back,
>> +        and verifies the received data matches what was sent.
>> +
>> +        This is a blocking write that returns when the test completes
>> +        or times out after 5 seconds. The write returns an error code
>> +        if the test fails or times out.
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 
>> a4b89bd497ad5051c190025838e0e93d257ed061..098b12692140514da52565a3200801f5e24a43b7 
>> 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -17469,6 +17469,7 @@ L:    linux-arm-msm@vger.kernel.org
>>   S:    Maintained
>>   T:    git git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git
>>   F:    Documentation/ABI/stable/sysfs-bus-mhi
>> +F:    Documentation/ABI/testing/sysfs-bus-mhi-devices-loopback
>
> Commit text says this ABI is stable.  Seems odd its being added to 
> testing.
Commit text needs to be fixed for this, Thanks will update it in the 
next revision.
>
>>   F:    Documentation/mhi/
>>   F:    drivers/bus/mhi/
>>   F:    drivers/pci/endpoint/functions/pci-epf-mhi.c
>> diff --git a/drivers/bus/mhi/host/Kconfig b/drivers/bus/mhi/host/Kconfig
>> index 
>> da5cd0c9fc620ab595e742c422f1a22a2a84c7b9..627c57948235aa52348179ae8b2d0826ebaed01e 
>> 100644
>> --- a/drivers/bus/mhi/host/Kconfig
>> +++ b/drivers/bus/mhi/host/Kconfig
>> @@ -29,3 +29,4 @@ config MHI_BUS_PCI_GENERIC
>>         This driver provides MHI PCI controller driver for devices 
>> such as
>>         Qualcomm SDX55 based PCIe modems.
>>   +source "drivers/bus/mhi/host/clients/Kconfig"
>> diff --git a/drivers/bus/mhi/host/Makefile 
>> b/drivers/bus/mhi/host/Makefile
>> index 
>> 859c2f38451c669b3d3014c374b2b957c99a1cfe..2a16008aeb38127494782bbff4e1656428d2b776 
>> 100644
>> --- a/drivers/bus/mhi/host/Makefile
>> +++ b/drivers/bus/mhi/host/Makefile
>> @@ -4,3 +4,4 @@ mhi-$(CONFIG_MHI_BUS_DEBUG) += debugfs.o
>>     obj-$(CONFIG_MHI_BUS_PCI_GENERIC) += mhi_pci_generic.o
>>   mhi_pci_generic-y += pci_generic.o
>> +obj-y += clients/
>> diff --git a/drivers/bus/mhi/host/clients/Kconfig 
>> b/drivers/bus/mhi/host/clients/Kconfig
>> new file mode 100644
>> index 
>> 0000000000000000000000000000000000000000..312a0b5a8e83b6ad7246453908bd552841a89188
>> --- /dev/null
>> +++ b/drivers/bus/mhi/host/clients/Kconfig
>> @@ -0,0 +1,17 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +
>> +config MHI_BUS_LOOPBACK
>> +    tristate "MHI LOOPBACK client driver"
>> +    depends on MHI_BUS
>> +    help
>> +      MHI LOOPBACK client driver that binds to the MHI LOOPBACK channel
>> +      as defined in the MHI specification. The LOOPBACK channel is
>> +      implemented by MHI-based devices (modems, WLAN) in the field, 
>> where
>
> Are modems, WLAN the only devices that implement this, or are those 
> intended to be examples?  Current reads as a limitation.
those are just examples, will reword it.
>
>> +      the endpoint firmware echoes back whatever the host sends.
>> +
>> +      This driver exposes a sysfs interface for testing MHI data path
>> +      integrity between host and endpoint. Users can configure the TRE
>> +      size and count, and trigger a loopback test.
>> +
>> +      To compile this driver as a module, choose M here. The module
>> +      will be called mhi_loopback.
>> diff --git a/drivers/bus/mhi/host/clients/Makefile 
>> b/drivers/bus/mhi/host/clients/Makefile
>> new file mode 100644
>> index 
>> 0000000000000000000000000000000000000000..3811b6928f42b38f94b1167941cf3b0fe512d32b
>> --- /dev/null
>> +++ b/drivers/bus/mhi/host/clients/Makefile
>> @@ -0,0 +1,2 @@
>> +obj-$(CONFIG_MHI_BUS_LOOPBACK) += mhi_loopback.o
>> +mhi_loopback-y += loopback.o
>> diff --git a/drivers/bus/mhi/host/clients/loopback.c 
>> b/drivers/bus/mhi/host/clients/loopback.c
>> new file mode 100644
>> index 
>> 0000000000000000000000000000000000000000..02a952e8e01222cd8cb842c9f9490479df8ea2bd
>> --- /dev/null
>> +++ b/drivers/bus/mhi/host/clients/loopback.c
>> @@ -0,0 +1,289 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#include <linux/atomic.h>
>> +#include <linux/cleanup.h>
>> +#include <linux/completion.h>
>> +#include <linux/errno.h>
>> +#include <linux/mhi.h>
>> +#include <linux/mod_devicetable.h>
>
> I'm pretty sure this is now incorrect based on cleanups that just 
> occured in tree.
I missed the recent rebase on mhi-next therefore missed these merges. 
will rebase and fix.
>
>> +#include <linux/module.h>
>> +#include <linux/mutex.h>
>> +#include <linux/random.h>
>> +#include <linux/sizes.h>
>> +#include <linux/slab.h>
>> +#include <linux/string.h>
>> +#include <linux/sysfs.h>
>> +#include <linux/types.h>
>> +
>> +#define MHI_LOOPBACK_DEFAULT_TRE_SIZE    32
>> +#define MHI_LOOPBACK_DEFAULT_NUM_TRE    1
>> +#define MHI_LOOPBACK_TIMEOUT_MS        5000
>> +#define MHI_LOOPBACK_MAX_TRE_SIZE    (SZ_64K - 1)
>> +
>> +struct mhi_loopback {
>> +    struct mhi_device *mdev;
>> +    /* Serializes the sysfs attributes against a running test */
>> +    struct mutex lb_mutex;
>> +    struct completion comp;
>> +    atomic_t tre_pending;
>
> I'm not really sure I understand what purpose this is serving.
>
tre_pending tracks how many of the tre_count queued DL+UL completions
are still outstanding; comp is signaled once it hits zero, which is what
start_store() waits on. Will add a comment for it.
>> +    u32 num_tre;
>> +    u32 tre_size;
>
> I'm pretty sure these are the wrong types since they cross kernel 
> boundaries.
>
num_tre and tre_size are sysfs attribute values parsed with kstrtou32() 
from a text write,
they don't cross into any MHI wire-protocol struct or UAPI boundary, and 
u32 comfortably covers
the valid range (num_tre is ring-capacity-bounded, tre_size caps at 
MHI_LOOPBACK_MAX_TRE_SIZE = 64K-1)
Could you explain a little bit more about the boundary concern.

