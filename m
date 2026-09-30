Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F416738A73B
	for <mhi@lists.linux.dev>; Wed, 30 Sep 2026 05:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790747829; cv=none; b=ZRwI8emcvI7kA5ihOZCvh8+x5fVSnAJ6SkOv2CXCmsvg1gSBeUsmF3h6/iu3YeejedwQYq8P7MGFWnqcHn5NxWU/y6vy6Wct4Mx9oPfJHydTB4VMvRu29uXwViVk/b+8st44YzUPlSH+lr15OKzYsx2nuCkJzrIL9J0B6mJJwBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790747829; c=relaxed/simple;
	bh=7hDT9ijRUqs84SbsacWmodAEcXjxGZGqdCHnJ1MPieY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U5+G+qXB1x2tB+nMmajss/MoDsk0wKnhb0RZEr4dZfJAvgY0FOtthCht+dADDaZfjbOlE4hQw96mFaWwSU8s+miMPwVWZxSzWjXqe9vhqB+jWWFfYS/YcjOd/kFR4+IveSWf6uzzytf/rNjg3DdtEQCwwTSMAwwHCojdhSO7nVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fq2Pk2EM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gyPucbTS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fq2Pk2EM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gyPucbTS"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TNQNYi2411407
	for <mhi@lists.linux.dev>; Wed, 30 Sep 2026 05:57:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q0GPd3zTZFYp2lJxk97RxyfRjqzFT4bjAoTIW7luDbo=; b=fq2Pk2EMKZELqvbn
	3q6FtSuW0Mjbp52tVuR4vo+w9tr1/3QBt/LLnKGd8IZQjDCa/muUF5Hs74hiyt9j
	kUkJPmTa1hRZuK2oQVqFvVGjZT06LS3La/bVpG9Jtb8Cz9nNUEIZ1PMtYWTT5DWl
	wkE0vgMWH1BRYPC1J9IUIKh3S+RpxCV7AG9NTqajOBv29gIEC1ydSJi7XzSIX6WE
	dUPLdEiE3vkaI2+ALozFq178Fb2maioZ0tvpdNzfubMPdT/7rya2LqZjRBKvmC3H
	0f2SD5QYYuxTpumUmgH17YiOKzjl8gd/bPgd6JJv29s/79srUf0TY3FhCRPBNLs9
	WDvFmg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0j97tj9w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Wed, 30 Sep 2026 05:57:05 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8872ada18d7so185773b3a.1
        for <mhi@lists.linux.dev>; Tue, 29 Sep 2026 22:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790747825; x=1791352625; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q0GPd3zTZFYp2lJxk97RxyfRjqzFT4bjAoTIW7luDbo=;
        b=gyPucbTSuRffy92rMqSJ/28aVpY/0omHQjxRvlBcN1E7S9P8bt3WCuQ3v6C+g+6+Ol
         SWXFldqIyh8LKv6Mgq9gu8++K95CRImHuYAI0khAR2N053ysOY/h3QkKyTn5mBFsOedE
         xBMopnjSzM/1nmA++YQ8+puEwclzNeZSl8BoH+RptcHvvt2y5ziedbrrxB7J6NkCxVL2
         nrugyrVt+nGc5w6qzehXlxkor1MGllJrBHJa5fO40oey+sik6QW5heUodL54JuKvliCx
         Djm1zcDyT96jlCkqxPBH2Dp5mgSu8TG4rNSZUsl3t+8Rvz3QbGmkeFO8XpGakC2Ta6xc
         xLWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790747825; x=1791352625;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q0GPd3zTZFYp2lJxk97RxyfRjqzFT4bjAoTIW7luDbo=;
        b=v+DkUW1ZMbkLdaDECaLlSYA/yFQYs1bqBUgkBDOMi1emFzCpw05HTxpiuTASD2vW0V
         h0WaXi5KRtJSC2bZenWUIfwZxdecy28Nr8/QqC5OcagoDn/dviiTLSQc5DafLDStgY9e
         MU/hI60b5FImDfAiBnVkL3bMLZEFy3wnYcFosgeP7dPlOfFj29LGh460EQTauFYyi+N+
         6sKDkJoUvgKB5pdW3W/rS6i03KUbs4FRFUcOo+ucP6MQceggGkLAV9Mf0nwHnJAKYJNp
         RnfspnoekuKvdiOa4D7qFQ2CXxGnBqYLksvWKwaiGF9we0i1yE4Stg9fJe6ediZdkuq/
         L++A==
X-Forwarded-Encrypted: i=1; AKwUvBwmglhciuUvcnZCTzkKpkSRxCYB4reNT3W48a3FCsZ1dDEHa9bL8YWaPL0cfeg3MoPQC6E=@lists.linux.dev
X-Gm-Message-State: AFuF++mf7YozGU/Uu3t8NmNAkp35jk673Ua9vpSgPZ+96tQ2nygufkvo
	hRsgdaDknuSiAI3q1rDdZ3gN6L3v0FtMliJAFj9eGEPAN7pH/i+wFzgDde4P5V+Yx3d7kSn4fWL
	oUQf4UojIbhvzPe+rmNWKEnHCqy4T0wWdETJNOmyGwaqR+NrLBHU26EU=
X-Gm-Gg: AYBFou1+sAAeg5BeAJTskQClaapHwRQR2q2XB9jQnKi8jE5c0rn9d5hQThhHdFyLsRv
	2M1yaNTKpVVfjcIdNpBD1XHryh9gbUJ8oBCIapF8PseK3uMaw0QsGhtm9P/w3bBnQ6ic85EQw7C
	QpmIWI8xUcgeA4jfFv2HL/9VTcH9vsPzx84mPnQWmxqFYxKKgr2uuUAFmg7dTkFnzKBUR0dtkAK
	HpviLy0OviWshZx9FNnEd5VjL9ds6XeMkkkpgeaGgtum0M+yRnNRH4c19++hRPZeeBMcRPKl62p
	xWs0AL2NHUGZpkAgWr4wAOtXCgzrop1bRP6bCgOd6PEUS6oBRb2OZhFqKWdp1ZYl7aLZVUXVZQK
	6jxqro3fiiCRJ9HYxK421MVgy3rrw
X-Received: by 2002:a05:6a00:14d3:b0:878:3507:8d62 with SMTP id d2e1a72fcca58-8874ed0a74fmr201179b3a.41.1790747824358;
        Tue, 29 Sep 2026 22:57:04 -0700 (PDT)
X-Received: by 2002:a05:6a00:14d3:b0:878:3507:8d62 with SMTP id d2e1a72fcca58-8874ed0a74fmr201157b3a.41.1790747823603;
        Tue, 29 Sep 2026 22:57:03 -0700 (PDT)
Received: from [10.217.216.255] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88726441614sm239987b3a.49.2026.09.29.22.57.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 22:57:03 -0700 (PDT)
Message-ID: <d05a60d1-3787-4318-b28d-9901d7fd7a00@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 11:26:59 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] bus: mhi: host: clients: Add loopback driver with
 sysfs interface
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
References: <20260908-lb-v6-0-66755ceb16cc@oss.qualcomm.com>
 <20260908-lb-v6-1-66755ceb16cc@oss.qualcomm.com>
 <xji3thurj6lnez56opmh5xoxzjiwtlh4o5qd6iqokbqkcb4rxu@mblahsfmtioz>
Content-Language: en-US
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
In-Reply-To: <xji3thurj6lnez56opmh5xoxzjiwtlh4o5qd6iqokbqkcb4rxu@mblahsfmtioz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: geMZckY5mGG1IB8NeWouMWj6jiBAjWhI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAyMyBTYWx0ZWRfX1ygc0BxwYzCQ
 nuUIhwpcQ0Xyk3uLWMLzYTsehung6+ZIlnlJC6CoOEEFoYHy5cZYhxzZ+ySiUknjdjJW3cWnUQi
 FpYl0eOTckIv+G7/txWKDUL2sAfx4Mjj6zFA3385OIZAlja9c5BvH0SnYRc9mM2uJ3WahbJ6wys
 EFLDo5j6IJN03//yuUGjimREqVz6JTbJhlPzqq9GlJvQnX9daklM/XzsRKQhvPgX+WJsXkoZvdI
 s+7pmX62EumCjU0ujWbJ5q2VLPlfHxFY8zmrDe71M+ixHuLkqI92aTRQT4d/a/WjDVYjJqRBVu+
 kP4vAL/Abdxro6Pm4Q3V+RTSFTppE1j0KJnQyc36hUOTDpE0Csp7xfoODUu3qpvK/gLXckmcYfI
 t+IqE171J6aKUW+dQi6bZeFCcvcl7bwrudIgHT0AzoJbyK+wSdythbhsfyZg3ITp4TGjvAc+YT5
 fwfC2FFVCaJqSbrzofA==
X-Proofpoint-ORIG-GUID: geMZckY5mGG1IB8NeWouMWj6jiBAjWhI
X-Authority-Analysis: v=2.4 cv=BPImP1QG c=1 sm=1 tr=0 ts=6abca4b1 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=xgnnbfARpDOHo6esDpYA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAyMyBTYWx0ZWRfX6afj6Ajn3sAu
 FfqaJEhVmF0LvWPk5YDpNXnGZF1SvxZkBktU2H8FeUMtxB/RqjpJ0RFpqKrZkVenxqO6l190fgb
 UL/6yoFv2ec/U8B6ghw/0ohnvb28yaE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300023



On 9/26/2026 4:36 PM, Manivannan Sadhasivam wrote:
> On Tue, Sep 08, 2026 at 02:57:22PM +0530, Sumit Kumar wrote:
>> The MHI specification defines a LOOPBACK channel. The endpoint firmware
>> echoes back whatever the host sends on this channel. Without a host-side
>> driver, there is no way to exercise this channel to validate MHI data path
>> integrity between host and endpoint.
>>
>> Add a host-side loopback driver that binds to the LOOPBACK channel and
>> expose a sysfs interface for data path testing. The sysfs interface allows
>> users to configure TRE buffer size and count, trigger a loopback test, and
>> read the result.
>>
>> The new sysfs ABI is documented under Documentation/ABI/testing/, not
>> stable/, since this is a new interface without established API
>> guarantees yet. It is unrelated to the existing stable MHI sysfs ABI
>> documented in Documentation/ABI/stable/sysfs-bus-mhi, despite both
>> being covered by the same MAINTAINERS entry.
>>
>> Co-developed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
>> ---
>>   .../ABI/testing/sysfs-bus-mhi-devices-loopback     |  40 +++
>>   MAINTAINERS                                        |   1 +
>>   drivers/bus/mhi/host/Kconfig                       |   1 +
>>   drivers/bus/mhi/host/Makefile                      |   1 +
>>   drivers/bus/mhi/host/clients/Kconfig               |  17 ++
>>   drivers/bus/mhi/host/clients/Makefile              |   2 +
>>   drivers/bus/mhi/host/clients/loopback.c            | 287 +++++++++++++++++++++
>>   7 files changed, 349 insertions(+)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-bus-mhi-devices-loopback b/Documentation/ABI/testing/sysfs-bus-mhi-devices-loopback
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..9e47e8443f309199691a50d70adadf84f3237037
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-bus-mhi-devices-loopback
>> @@ -0,0 +1,40 @@
>> +What:		/sys/bus/mhi/devices/mhi<N>_LOOPBACK/tre_size
>> +Date:		August 2026
>> +KernelVersion:	7.4
>> +Contact:	mhi@lists.linux.dev
>> +Description:
>> +		(RW) Size of each Transfer Ring Element (TRE) buffer in bytes
>> +		used for the loopback test. Valid range is 1 to the value
>> +		reported by max_tre_size. Default value is 32 bytes.
>> +
>> +What:		/sys/bus/mhi/devices/mhi<N>_LOOPBACK/max_tre_size
>> +Date:		August 2026
>> +KernelVersion:	7.4
>> +Contact:	mhi@lists.linux.dev
>> +Description:
>> +		(RO) Maximum allowed Transfer Ring Element (TRE) size in bytes.
>> +		Reading this file returns the upper bound for the tre_size
>> +		attribute.
>> +
>> +What:		/sys/bus/mhi/devices/mhi<N>_LOOPBACK/num_tre
>> +Date:		August 2026
>> +KernelVersion:	7.4
>> +Contact:	mhi@lists.linux.dev
>> +Description:
>> +		(RW) Number of Transfer Ring Elements (TREs) to use per
>> +		loopback test. Must be greater than zero and must not exceed
>> +		the channel ring capacity. Default value is 1.
> How does the user know 'channel ring capacity'?
If the user enters a number greater than the ring capacity the error 
will log the max num_tre value.
Would you prefer having a new sysfs entry similar to 'max_tre_size'? 
something like 'max_num_tre'.
>
>> +
>> +What:		/sys/bus/mhi/devices/mhi<N>_LOOPBACK/start
>> +Date:		August 2026
>> +KernelVersion:	7.4
>> +Contact:	mhi@lists.linux.dev
>> +Description:
>> +		(WO) Write any value to trigger a loopback test. The driver
>> +		sends random data to the endpoint using the configured tre_size
>> +		and num_tre parameters, waits for the endpoint to echo it back,
>> +		and verifies the received data matches what was sent.
>> +
>> +		This is a blocking write that returns when the test completes
>> +		or times out after 5 seconds. The write returns an error code
>> +		if the test fails or times out.
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 70663089f071c4eaa07fe7b9baf9003d8b981c07..b10f8cd592954e1450e5851045962bf05dcf1a50 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -17628,6 +17628,7 @@ L:	linux-arm-msm@vger.kernel.org
>>   S:	Maintained
>>   T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git
>>   F:	Documentation/ABI/stable/sysfs-bus-mhi
>> +F:	Documentation/ABI/testing/sysfs-bus-mhi-devices-loopback
>>   F:	Documentation/mhi/
>>   F:	drivers/bus/mhi/
>>   F:	drivers/pci/endpoint/functions/pci-epf-mhi.c
>> diff --git a/drivers/bus/mhi/host/Kconfig b/drivers/bus/mhi/host/Kconfig
>> index da5cd0c9fc620ab595e742c422f1a22a2a84c7b9..627c57948235aa52348179ae8b2d0826ebaed01e 100644
>> --- a/drivers/bus/mhi/host/Kconfig
>> +++ b/drivers/bus/mhi/host/Kconfig
>> @@ -29,3 +29,4 @@ config MHI_BUS_PCI_GENERIC
>>   	  This driver provides MHI PCI controller driver for devices such as
>>   	  Qualcomm SDX55 based PCIe modems.
>>   
>> +source "drivers/bus/mhi/host/clients/Kconfig"
>> diff --git a/drivers/bus/mhi/host/Makefile b/drivers/bus/mhi/host/Makefile
>> index 859c2f38451c669b3d3014c374b2b957c99a1cfe..2a16008aeb38127494782bbff4e1656428d2b776 100644
>> --- a/drivers/bus/mhi/host/Makefile
>> +++ b/drivers/bus/mhi/host/Makefile
>> @@ -4,3 +4,4 @@ mhi-$(CONFIG_MHI_BUS_DEBUG) += debugfs.o
>>   
>>   obj-$(CONFIG_MHI_BUS_PCI_GENERIC) += mhi_pci_generic.o
>>   mhi_pci_generic-y += pci_generic.o
>> +obj-y += clients/
>> diff --git a/drivers/bus/mhi/host/clients/Kconfig b/drivers/bus/mhi/host/clients/Kconfig
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..8bb5715e61d0d6e64a51012b4e1594ba46e5bfc1
>> --- /dev/null
>> +++ b/drivers/bus/mhi/host/clients/Kconfig
>> @@ -0,0 +1,17 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +
>> +config MHI_BUS_LOOPBACK
>> +	tristate "MHI LOOPBACK client driver"
>> +	depends on MHI_BUS
>> +	help
>> +	  MHI LOOPBACK client driver that binds to the MHI LOOPBACK channel
>> +	  as defined in the MHI specification. The LOOPBACK channel is
>> +	  implemented by MHI-based devices (e.g. modems, WLAN) in the field,
>> +	  where the endpoint firmware echoes back whatever the host sends.
>> +
>> +	  This driver exposes a sysfs interface for testing MHI data path
>> +	  integrity between host and endpoint. Users can configure the TRE
>> +	  size and count, and trigger a loopback test.
>> +
>> +	  To compile this driver as a module, choose M here. The module
>> +	  will be called mhi_loopback.
>> diff --git a/drivers/bus/mhi/host/clients/Makefile b/drivers/bus/mhi/host/clients/Makefile
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..3811b6928f42b38f94b1167941cf3b0fe512d32b
>> --- /dev/null
>> +++ b/drivers/bus/mhi/host/clients/Makefile
>> @@ -0,0 +1,2 @@
>> +obj-$(CONFIG_MHI_BUS_LOOPBACK) += mhi_loopback.o
>> +mhi_loopback-y += loopback.o
>> diff --git a/drivers/bus/mhi/host/clients/loopback.c b/drivers/bus/mhi/host/clients/loopback.c
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..058a8b587933245230eaae61bb7fe3361d4a362a
>> --- /dev/null
>> +++ b/drivers/bus/mhi/host/clients/loopback.c
>> @@ -0,0 +1,287 @@
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
>> +#include <linux/module.h>
>> +#include <linux/mutex.h>
>> +#include <linux/random.h>
>> +#include <linux/sizes.h>
>> +#include <linux/slab.h>
>> +#include <linux/string.h>
>> +#include <linux/sysfs.h>
>> +#include <linux/types.h>
>> +
>> +#define MHI_LOOPBACK_DEFAULT_TRE_SIZE	32
>> +#define MHI_LOOPBACK_DEFAULT_NUM_TRE	1
>> +#define MHI_LOOPBACK_TIMEOUT_MS		5000
>> +#define MHI_LOOPBACK_MAX_TRE_SIZE	(SZ_64K - 1)
>> +
>> +struct mhi_loopback {
>> +	struct mhi_device *mdev;
>> +	/* Serializes the sysfs attributes against a running test */
>> +	struct mutex lb_mutex;
>> +	struct completion comp;
>> +	/* Tracks outstanding DL+UL completions; comp fires when it hits zero */
> This variable is only used in dl_callback.
>
>> +	atomic_t tre_pending;
>> +	u32 num_tre;
>> +	u32 tre_size;
>> +};
>> +
>> +static ssize_t tre_size_show(struct device *dev,
>> +			     struct device_attribute *attr, char *buf)
>> +{
>> +	struct mhi_loopback *loopback = dev_get_drvdata(dev);
>> +
>> +	return sysfs_emit(buf, "%u\n", loopback->tre_size);
>> +}
>> +
>> +static ssize_t tre_size_store(struct device *dev,
>> +			      struct device_attribute *attr,
>> +			      const char *buf, size_t count)
>> +{
>> +	struct mhi_loopback *loopback = dev_get_drvdata(dev);
>> +	u32 val;
>> +
>> +	if (kstrtou32(buf, 0, &val))
>> +		return -EINVAL;
>> +
>> +	if (val == 0 || val > MHI_LOOPBACK_MAX_TRE_SIZE)
>> +		return -EINVAL;
>> +
>> +	guard(mutex)(&loopback->lb_mutex);
>> +	loopback->tre_size = val;
>> +
>> +	return count;
>> +}
>> +static DEVICE_ATTR_RW(tre_size);
>> +
>> +static ssize_t max_tre_size_show(struct device *dev,
>> +				 struct device_attribute *attr, char *buf)
>> +{
>> +	return sysfs_emit(buf, "%u\n", MHI_LOOPBACK_MAX_TRE_SIZE);
>> +}
>> +static DEVICE_ATTR_RO(max_tre_size);
>> +
>> +static ssize_t num_tre_show(struct device *dev,
>> +			    struct device_attribute *attr, char *buf)
>> +{
>> +	struct mhi_loopback *loopback = dev_get_drvdata(dev);
>> +
>> +	return sysfs_emit(buf, "%u\n", loopback->num_tre);
>> +}
>> +
>> +static ssize_t num_tre_store(struct device *dev,
>> +			     struct device_attribute *attr,
>> +			     const char *buf, size_t count)
>> +{
>> +	struct mhi_loopback *loopback = dev_get_drvdata(dev);
>> +	u32 val;
>> +	int el_num;
>> +
>> +	if (kstrtou32(buf, 0, &val))
>> +		return -EINVAL;
>> +
>> +	if (val == 0)
>> +		return -EINVAL;
>> +
>> +	guard(mutex)(&loopback->lb_mutex);
>> +
>> +	el_num = min(mhi_get_free_desc_count(loopback->mdev, DMA_TO_DEVICE),
>> +		     mhi_get_free_desc_count(loopback->mdev, DMA_FROM_DEVICE));
>> +	if (val > el_num) {
>> +		dev_err(dev, "num_tre (%u) exceeds ring capacity (%d)\n", val, el_num);
>> +		return -EINVAL;
>> +	}
>> +
>> +	loopback->num_tre = val;
>> +
>> +	return count;
>> +}
>> +static DEVICE_ATTR_RW(num_tre);
>> +
>> +static ssize_t start_store(struct device *dev,
>> +			   struct device_attribute *attr,
>> +			   const char *buf, size_t count)
>> +{
>> +	struct mhi_loopback *loopback = dev_get_drvdata(dev);
>> +	u32 total_size, tre_count, tre_size;
>> +	int i, ret;
>> +
>> +	guard(mutex)(&loopback->lb_mutex);
>> +
>> +	tre_size = loopback->tre_size;
>> +	tre_count = loopback->num_tre;
>> +	total_size = size_mul(tre_count, tre_size);
>> +
>> +	if (total_size > KMALLOC_MAX_SIZE)
>> +		return -EINVAL;
>> +
>> +	if (tre_count > mhi_get_free_desc_count(loopback->mdev, DMA_TO_DEVICE) ||
>> +	    tre_count > mhi_get_free_desc_count(loopback->mdev, DMA_FROM_DEVICE)) {
>> +		dev_err(dev, "Not enough ring space for %u TREs\n", tre_count);
>> +		return -ENOSPC;
>> +	}
>> +
>> +	void *recv_buf __free(kfree) = kzalloc(total_size, GFP_KERNEL);
>> +	if (!recv_buf)
>> +		return -ENOMEM;
>> +
>> +	void *send_buf __free(kfree) = kzalloc(total_size, GFP_KERNEL);
>> +	if (!send_buf)
>> +		return -ENOMEM;
>> +
>> +	get_random_bytes(send_buf, total_size);
>> +
>> +	atomic_set(&loopback->tre_pending, tre_count);
>> +	reinit_completion(&loopback->comp);
>> +
>> +	for (i = 0; i < tre_count; i++) {
>> +		ret = mhi_queue_buf(loopback->mdev, DMA_FROM_DEVICE,
>> +				    recv_buf + (i * tre_size), tre_size, MHI_EOT);
>> +		if (ret) {
>> +			dev_err(dev, "Unable to queue read TRE %d: %d\n", i, ret);
>> +			if (atomic_sub_and_test(tre_count - i, &loopback->tre_pending))
>> +				complete(&loopback->comp);
>> +			return ret;
> Both recv_buf and send_buf are allocated with '__free' cleanup. So these buffers
> will get freed once this function exits. But these buffer might've already
> queued to the device in past iterations, making these pointers dangling.
>
> Maybe you should reset the channel as you've done below for completion timeout?
will create a reset channel function and will call that in both paths.
>
>> +		}
>> +	}
>> +
>> +	for (i = 0; i < tre_count - 1; i++) {
>> +		ret = mhi_queue_buf(loopback->mdev, DMA_TO_DEVICE,
>> +				    send_buf + (i * tre_size), tre_size, MHI_CHAIN);
>> +		if (ret) {
>> +			dev_err(dev, "Unable to queue send TRE %d: %d\n", i, ret);
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	ret = mhi_queue_buf(loopback->mdev, DMA_TO_DEVICE,
>> +			    send_buf + (i * tre_size), tre_size, MHI_EOT);
>> +	if (ret) {
>> +		dev_err(dev, "Unable to queue final TRE: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	if (!wait_for_completion_timeout(&loopback->comp,
>> +					 msecs_to_jiffies(MHI_LOOPBACK_TIMEOUT_MS))) {
>> +		dev_err(dev, "Loopback test timed out\n");
>> +		/* Reset the channel to reclaim the TREs still pointing at the buffers */
>> +		mhi_unprepare_from_transfer(loopback->mdev);
>> +		ret = mhi_prepare_for_transfer(loopback->mdev);
>> +		if (ret)
>> +			dev_err(dev, "Failed to re-prepare channel for transfers: %d\n", ret);
>> +
>> +		return -ETIMEDOUT;
>> +	}
>> +
>> +	if (memcmp(send_buf, recv_buf, total_size)) {
>> +		dev_err(dev, "Loopback data mismatch\n");
>> +		return -EIO;
>> +	}
>> +
>> +	return count;
>> +}
>> +static DEVICE_ATTR_WO(start);
>> +
>> +static void mhi_loopback_dl_callback(struct mhi_device *mhi_dev,
>> +				     struct mhi_result *mhi_res)
>> +{
>> +	struct mhi_loopback *loopback = dev_get_drvdata(&mhi_dev->dev);
>> +
>> +	if (mhi_res->transaction_status && mhi_res->transaction_status != -ENOTCONN)
>> +		dev_err(&mhi_dev->dev, "DL callback error: status %d\n",
>> +			mhi_res->transaction_status);
>> +
>> +	if (atomic_dec_and_test(&loopback->tre_pending))
>> +		complete(&loopback->comp);
>> +}
>> +
>> +static void mhi_loopback_ul_callback(struct mhi_device *mhi_dev,
>> +				     struct mhi_result *mhi_res)
>> +{
>> +	if (mhi_res->transaction_status && mhi_res->transaction_status != -ENOTCONN)
>> +		dev_err(&mhi_dev->dev, "UL callback error: status %d\n",
>> +			mhi_res->transaction_status);
>> +}
>> +
>> +static struct attribute *mhi_loopback_attrs[] = {
>> +	&dev_attr_tre_size.attr,
>> +	&dev_attr_max_tre_size.attr,
>> +	&dev_attr_num_tre.attr,
>> +	&dev_attr_start.attr,
>> +	NULL
>> +};
>> +
>> +static const struct attribute_group mhi_loopback_group = {
>> +	.attrs = mhi_loopback_attrs,
>> +};
>> +
>> +static int mhi_loopback_probe(struct mhi_device *mhi_dev,
>> +			      const struct mhi_device_id *id)
>> +{
>> +	struct mhi_loopback *loopback;
>> +	int ret;
>> +
>> +	loopback = devm_kzalloc(&mhi_dev->dev, sizeof(*loopback), GFP_KERNEL);
>> +	if (!loopback)
>> +		return -ENOMEM;
>> +
>> +	loopback->mdev = mhi_dev;
>> +	loopback->tre_size = MHI_LOOPBACK_DEFAULT_TRE_SIZE;
>> +	loopback->num_tre = MHI_LOOPBACK_DEFAULT_NUM_TRE;
>> +
>> +	mutex_init(&loopback->lb_mutex);
>> +	init_completion(&loopback->comp);
>> +
>> +	dev_set_drvdata(&mhi_dev->dev, loopback);
>> +
>> +	ret = mhi_prepare_for_transfer(mhi_dev);
>> +	if (ret)
>> +		return dev_err_probe(&mhi_dev->dev, ret, "Failed to prepare for transfers\n");
>> +
>> +	ret = sysfs_create_group(&mhi_dev->dev.kobj, &mhi_loopback_group);
>> +	if (ret) {
>> +		dev_err(&mhi_dev->dev, "Failed to create sysfs attributes: %d\n", ret);
>> +		mhi_unprepare_from_transfer(mhi_dev);
>> +		return ret;
>> +	}
> You can use mhi_driver->driver.dev_groups to let the driver core create sysfs
> groups for you.
>
> - Mani
>

