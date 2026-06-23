Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05BC38BF9A
	for <mhi@lists.linux.dev>; Tue, 23 Jun 2026 10:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782210522; cv=none; b=LyzXIrWrnbzogSrJzeJasJJXp7yJ9oMbxGBMWzLmU53MGhBhBBG4tOE+GOE7fItw+eiKnwBWTMw8In/B/H86PsfwAUHNJyFO1bVasOpoiyMyD2H3CGnh/IC38Pn42FJfmQOW61gP36N3nGQqFvP60E//FvkNy4N9FaHDw3RTHLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782210522; c=relaxed/simple;
	bh=ufm1miMdwR0zo58ODrBD83PgnN893/j/y7OjJdZUngw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZlRbpOvQdT0uMKSPafgKMRCzWjA2pHYqIeGHOYlfR4k3MYAiDvzxuiA2h0S7EaKd7fJ72BL9mx8iHieqsuqr0GnzPOYORrKHuyhK/8oofOIb2w04z/hgJiU95Ec81Hnk8hK7BZfRgu4nLolvFqusp5IvpBws9wRylcC78U9/8Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pZ+HuUwr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c04Hh6T5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pZ+HuUwr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c04Hh6T5"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N6cnNu3338661
	for <mhi@lists.linux.dev>; Tue, 23 Jun 2026 10:28:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8Z0WGjL5WJQsX6jEfVaa1gPYH2limW3kYUa23NVwtr8=; b=pZ+HuUwrrt9PxGWq
	66s2iMkxGN+mIG6NnuSZ/PA/E4qsI8Rl6K6tVNR/k5qRHocxbUKurbltMzPOCqvY
	y4VmK99QizwJH8T7ASXL+iG3cH6zCqL1zAdW9aaJ0QPAUdhFceZqHmNwBB/YwEBM
	0OAC/xY5qrP1a/AXzEpmY4sfZMR+N/ZqZff/oiTNH30aJYQYWb772ElaEbAhXcAV
	GtJWMwnkeGHek4gLezR0qTO1BqZNpPAldRvpK9keRgGcpemGB5PZlKRdhMADywOX
	efeKkb/EiigxsZXG6x5VMu0/PRtU3o79l3w655u4pQ9/a5zUIQjUv1uOsgGmqqiZ
	BAw5rQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eygkjhv1d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Tue, 23 Jun 2026 10:28:38 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c8aeb2c867fso5400071a12.3
        for <mhi@lists.linux.dev>; Tue, 23 Jun 2026 03:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782210518; x=1782815318; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8Z0WGjL5WJQsX6jEfVaa1gPYH2limW3kYUa23NVwtr8=;
        b=c04Hh6T5ENePd9ZzlGPxoF2uoUruCS5O39ryqeGXtDqzKsH1VMz9FYgT5I4TSbasMU
         nHdGu0OI5HmZzYgWvFpf/hwK9cZV22RaRiRQ2LJB3x+as8CsnCeyJWnXbHj8KtgHA88Y
         pIP4I0Bfb04AFrZbMKrzekS+u/7I3Pr+bzgJMdMpR8aDJ5KDvTfu1bduc6wb3sW94HA+
         wAgggaIoGhSLb3lZ6kQfQtOUkFfrW8qmsptCEiF5vSW+UZ7gCyZOMpnWLmIKt+ce6GfM
         Ycwa4ZonM5QKMUNcqUakEKt7kElkXC8Z04CmHVxJ+ohQXsu+2NVWhoNsPcbtqW9/0qtY
         Zljg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782210518; x=1782815318;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Z0WGjL5WJQsX6jEfVaa1gPYH2limW3kYUa23NVwtr8=;
        b=Y6bmxzabgbZq20CdJyaSBjx5vwyv3AI2221o9ifVkbZrJ0LVOVFLZ3NF75IxTYIohA
         gwQhk49WlievVa+cJxRIxXhHmZjQSE6Wr2I5xh6QiaSA4tHwDhGLu737M2LRKQoWinj5
         jix89WsG2+t/SVD23vOZlc+qM78tc/Zo8vxTNhTjBL6f232NMbtdvZFsDri33+EvktD4
         taX0YqQytyLeG11Fl875FTZLWh4SSJy2wcOBCZjXqZKvpc0KfsMi1TxMShbC1+K3BigT
         6n0entIovnKgDL1KhxFARPnTptTUIJMLmzmDQOa93K+ekf5tsl2D08UqFT4Molw3rpwZ
         qBTw==
X-Gm-Message-State: AOJu0YzL7Rbqw+Mm34HIYFL4FemkMJR3dxVCKbGlOBxBGTAdNUQ1Uy/v
	kd15Cm3L83hxf+QZCumePzXGoS4ngx79p0qZIAtIrgJniw050koCDPsk/fTL0DjXI7S0QHV7GEd
	8wM1a6Z4jL+q6tbFTWHYPTE+CLmsy6w9Dm8k2Fgorlr9VfKH4y7q/3y0=
X-Gm-Gg: AfdE7cmVUCcAKyRpF8guOIcgaBcLuxA35abw6M/92+IAouFImYJPNgEDHUjSfzfQQLe
	NAeS0AIGrjXaAte+FBXhkd0FnEHN+3HrGxoiQ2aUd2q+0LLIEIDSBNwCGMW40B+khViMmHt0LDz
	l6wYiytvPIwtWGFLv64G4GnrA4yKpnY8VCDjqu4E7PuQy4Nkm6v0Yl22DJglHKeJ2tl6MVaS2VB
	3Icx4ltfS8HWxK62nEM27H07lL9xT93ECjxecttLI4qI0TOYzMYJxE6RVCMh0f62RwyHo4vOf6s
	5daaLItQi5e0Zfnr014XeJhAlIwA+if69bY8OAPeCf3Or3193fd7B4FEIMAuBHr5ARAaOls+nS+
	gmh0wJvUk4VjcGmNvfEpXaw+IQvr+SYgUr26nlZVc
X-Received: by 2002:a05:6a20:1455:b0:3b4:65ac:e2e3 with SMTP id adf61e73a8af0-3bd18f2345amr2537575637.5.1782210517740;
        Tue, 23 Jun 2026 03:28:37 -0700 (PDT)
X-Received: by 2002:a05:6a20:1455:b0:3b4:65ac:e2e3 with SMTP id adf61e73a8af0-3bd18f2345amr2537523637.5.1782210516953;
        Tue, 23 Jun 2026 03:28:36 -0700 (PDT)
Received: from [10.217.219.124] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8bc563bf01sm10942157a12.17.2026.06.23.03.28.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 03:28:36 -0700 (PDT)
Message-ID: <34155623-bbb5-4801-b051-ed3ff87bcb93@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 15:58:00 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] bus: mhi: host: clients: Add loopback driver with
 sysfs interface
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
References: <20260622-loopback_mhi-v4-0-782b3a0f2eef@oss.qualcomm.com>
 <20260622-loopback_mhi-v4-1-782b3a0f2eef@oss.qualcomm.com>
 <gwcckverwvbt7r4puj2iu2b2j36olwwu4ua4x4uthht7bfq6my@yifjh6swxisq>
Content-Language: en-US
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
In-Reply-To: <gwcckverwvbt7r4puj2iu2b2j36olwwu4ua4x4uthht7bfq6my@yifjh6swxisq>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA4NSBTYWx0ZWRfX0MD7nCyHQr/x
 ZCOsGauONC1811Je4xGt4KI+u9enw6gx0BJupeU45cGrK5gyZIBTOwFV/f9KzKLZkM4pUNbCHmG
 6+wRm7T1HEjowrp+OQvD8YyAzCSJNa4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA4NSBTYWx0ZWRfX/UwDHzLAE7Ti
 yCXUo7B2PCdxFW6oM3tUD7hLsKU+uWDn9FI/VKVKFrR6NbvV8fQjrc67PFBFarm/D/RefdJJk+4
 R6Byu+ArilF1mzhS6Fhqx6manoiKuKHRml0dl6CTy/OMwSEfVa2ezEdXucpb282QByDsfvNIY6T
 +c9YU1SfeAJKf4l4KFjXJFExMxI1KQYYUjohOHXa8RBV1yu5rdx/yabmEOG8BD8UMMw9YEaNz9o
 OUzKiXuMFs80HPHWkqDM9ViAvwwyXk9ffrDRrg54ScGsLfj4NFMndg2jL0Kig+TKxTlWjqYfDTw
 SMPI/mjqWSDj09JwuJMedZtdC5Lzt4xqAYVj0xbAUJ+Uns1fatmqlDrJmFSBhs86kGOv22/7/Bo
 lDgPpKj5zXjlm4U+J+YX7B4RldaDLg==
X-Proofpoint-GUID: jOAN-VEwmVzZ6WjrySHPduHzj15Qyq6x
X-Authority-Analysis: v=2.4 cv=SoKgLvO0 c=1 sm=1 tr=0 ts=6a3a5fd7 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=smCnZ9EAa_bRAeT-5YEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: jOAN-VEwmVzZ6WjrySHPduHzj15Qyq6x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230085



On 6/23/2026 2:15 PM, Manivannan Sadhasivam wrote:
> On Mon, Jun 22, 2026 at 10:39:15AM +0530, Sumit Kumar wrote:
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
>> Co-developed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
>> ---
>>   .../ABI/testing/sysfs-bus-mhi-devices-loopback     |  51 ++++
>>   MAINTAINERS                                        |   1 +
>>   drivers/bus/mhi/host/Kconfig                       |   1 +
>>   drivers/bus/mhi/host/Makefile                      |   1 +
>>   drivers/bus/mhi/host/clients/Kconfig               |  17 ++
>>   drivers/bus/mhi/host/clients/Makefile              |   2 +
>>   drivers/bus/mhi/host/clients/loopback.c            | 329 +++++++++++++++++++++
>>   7 files changed, 402 insertions(+)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-bus-mhi-devices-loopback b/Documentation/ABI/testing/sysfs-bus-mhi-devices-loopback
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..3bd770747799a3341a23903cc1a108e650e915b8
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-bus-mhi-devices-loopback
>> @@ -0,0 +1,51 @@
>> +What:		/sys/bus/mhi/devices/mhi<N>_LOOPBACK/tre_size
>> +Date:		April 2026
>> +KernelVersion:	7.1
>> +Contact:	mhi@lists.linux.dev
>> +Description:
>> +		(RW) Size of each Transfer Ring Element (TRE) buffer in bytes
>> +		used for the loopback test. Valid range is 1 to the value
>> +		reported by max_tre_size. Default value is 32 bytes.
>> +
>> +What:		/sys/bus/mhi/devices/mhi<N>_LOOPBACK/max_tre_size
>> +Date:		April 2026
>> +KernelVersion:	7.1
>> +Contact:	mhi@lists.linux.dev
>> +Description:
>> +		(RO) Maximum allowed TRE size in bytes. Reading this file
>> +		returns the upper bound for the tre_size attribute.
>> +
>> +What:		/sys/bus/mhi/devices/mhi<N>_LOOPBACK/num_tre
>> +Date:		April 2026
>> +KernelVersion:	7.1
>> +Contact:	mhi@lists.linux.dev
>> +Description:
>> +		(RW) Number of Transfer Ring Elements (TREs) to use per
>> +		loopback test. Must be greater than zero and must not exceed
>> +		the channel ring capacity. Default value is 1.
>> +
>> +What:		/sys/bus/mhi/devices/mhi<N>_LOOPBACK/start
>> +Date:		April 2026
>> +KernelVersion:	7.1
>> +Contact:	mhi@lists.linux.dev
>> +Description:
>> +		(WO) Write any value to trigger a loopback test. The driver
>> +		sends random data to the endpoint using the configured tre_size
>> +		and num_tre parameters, waits for the endpoint to echo it back,
>> +		and verifies the received data matches what was sent.
>> +
>> +		This is a blocking write that returns when the test completes
>> +		or times out after 5 seconds.
>> +
>> +What:		/sys/bus/mhi/devices/mhi<N>_LOOPBACK/status
>> +Date:		April 2026
>> +KernelVersion:	7.1
>> +Contact:	mhi@lists.linux.dev
>> +Description:
>> +		(RO) Result of the last loopback test. Returns one of:
>> +		  "pass"        - last test completed successfully
>> +		  "fail"        - last test failed
>> +		  "not started" - no test has been run yet
>> +
>> +		Reading this file while a test is in progress will block
>> +		until the test completes.
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 6dcfbd11efef87927041f5cf58d70633dbb4b18d..ff12a6da48947ac853bc638359a7046fea85fc21 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -16441,6 +16441,7 @@ L:	linux-arm-msm@vger.kernel.org
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
>> index 0000000000000000000000000000000000000000..d1463c3e0df0da461c815afaec623ba349b51dda
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
>> +	  implemented by MHI-based devices (modems, WLAN) in the field, where
>> +	  the endpoint firmware echoes back whatever the host sends.
>> +
>> +	  This driver exposes a sysfs interface for testing MHI data path
>> +	  integrity between host and endpoint. Users can configure the TRE
>> +	  size and count, trigger a loopback test, and read the result.
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
>> index 0000000000000000000000000000000000000000..693691fff26dc8fa0d58931b98ce5f287fbd5c3e
>> --- /dev/null
>> +++ b/drivers/bus/mhi/host/clients/loopback.c
>> @@ -0,0 +1,329 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +/*
>> + * The MHI LOOPBACK channel is defined in the MHI specification and is
>> + * implemented by MHI-based devices (modems, WLAN) already deployed in the
>> + * field. The endpoint firmware echoes back whatever the host sends on this
>> + * channel. This driver binds to the LOOPBACK channel and exposes a sysfs
>> + * interface for testing MHI data path integrity between host and endpoint.
>> + * The sysfs interface is stable ABI because the wire protocol is fixed by
>> + * the endpoint firmware and cannot be changed.
>> + */
> This comment just duplicates Kconfig help text. So drop it.
>
>> +
>> +#include <linux/atomic.h>
>> +#include <linux/cleanup.h>
>> +#include <linux/completion.h>
>> +#include <linux/errno.h>
>> +#include <linux/mhi.h>
>> +#include <linux/mod_devicetable.h>
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
>> +	struct mutex lb_mutex;
>> +	struct completion comp;
>> +	atomic_t tres_pending;
> tre_pending
>
>> +	const char *result;
>> +	u32 num_tre;
>> +	u32 tre_size;
>> +};
>> +
>> +static ssize_t tre_size_show(struct device *dev,
>> +			     struct device_attribute *attr, char *buf)
>> +{
>> +	struct mhi_loopback *loopback = dev_get_drvdata(dev);
>> +
>> +	if (!loopback)
>> +		return -ENODEV;
> I think you have this check here to avoid race between sysfs cleanup and driver
> remove due to the use of devm_device_add_group(). But you can drop these by
> switching to non-devm helpers and freeing the sysfs entries directly in
> mhi_loopback_remove().
>
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
>> +	if (!loopback)
>> +		return -ENODEV;
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
>> +	if (!loopback)
>> +		return -ENODEV;
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
>> +	if (!loopback)
>> +		return -ENODEV;
>> +
>> +	if (kstrtou32(buf, 0, &val))
>> +		return -EINVAL;
>> +
>> +	if (val == 0)
>> +		return -EINVAL;
>> +
>> +	guard(mutex)(&loopback->lb_mutex);
>> +
>> +	el_num = mhi_get_free_desc_count(loopback->mdev, DMA_TO_DEVICE);
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
>> +	int i;
>> +
>> +	if (!loopback)
>> +		return -ENODEV;
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
>> +	atomic_set(&loopback->tres_pending, tre_count);
>> +	reinit_completion(&loopback->comp);
>> +
>> +	for (i = 0; i < tre_count; i++) {
>> +		int ret = mhi_queue_buf(loopback->mdev, DMA_FROM_DEVICE,
>> +					recv_buf + (i * tre_size), tre_size, MHI_EOT);
>> +		if (ret) {
>> +			dev_err(dev, "Unable to queue read TRE %d: %d\n", i, ret);
>> +			loopback->result = "fail";
>> +			if (atomic_sub_and_test(tre_count - i, &loopback->tres_pending))
>> +				complete(&loopback->comp);
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	for (i = 0; i < tre_count - 1; i++) {
>> +		int ret = mhi_queue_buf(loopback->mdev, DMA_TO_DEVICE,
>> +					send_buf + (i * tre_size), tre_size, MHI_CHAIN);
>> +		if (ret) {
>> +			dev_err(dev, "Unable to queue send TRE %d: %d\n", i, ret);
>> +			loopback->result = "fail";
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	int ret = mhi_queue_buf(loopback->mdev, DMA_TO_DEVICE,
>> +				send_buf + (i * tre_size), tre_size, MHI_EOT);
>> +	if (ret) {
>> +		dev_err(dev, "Unable to queue final TRE: %d\n", ret);
>> +		loopback->result = "fail";
>> +		return ret;
>> +	}
>> +
>> +	if (!wait_for_completion_timeout(&loopback->comp,
>> +					 msecs_to_jiffies(MHI_LOOPBACK_TIMEOUT_MS))) {
>> +		dev_err(dev, "Loopback test timed out\n");
>> +		loopback->result = "fail";
>> +		return -ETIMEDOUT;
> So once this function exits, both buffers will get freed due to the destructor.
> But the device may still hold the reference to the buffers in TRE and may
> read/write to it later. So you need to make sure that you flush the buffers in
> the error path. But we don't have any explicit APIs to do that, so maybe you can
> call mhi_unprepare_from_transfer() followed by mhi_prepare_for_transfer() in the
> error path?
>
>> +	}
>> +
>> +	if (memcmp(send_buf, recv_buf, total_size)) {
>> +		dev_err(dev, "Loopback data mismatch\n");
>> +		loopback->result = "fail";
>> +		return -EIO;
>> +	}
>> +
>> +	loopback->result = "pass";
>> +
>> +	return count;
>> +}
>> +static DEVICE_ATTR_WO(start);
>> +
>> +static ssize_t status_show(struct device *dev,
>> +			   struct device_attribute *attr, char *buf)
>> +{
>> +	struct mhi_loopback *loopback = dev_get_drvdata(dev);
>> +
>> +	if (!loopback)
>> +		return -ENODEV;
>> +
>> +	guard(mutex)(&loopback->lb_mutex);
>> +
>> +	return sysfs_emit(buf, "%s\n", loopback->result);
> I don't see a need for this separate 'status' attribute. 'start' attribute
> blocks until the write is completed or timesout, prints an error message with
> relevant errno and returns the error code. Though the syscall interface converts
> all error code to (-1), it is sufficient for the userspace to know whether the
> test has passed or not.
>
>> +}
>> +static DEVICE_ATTR_RO(status);
>> +
>> +static void mhi_loopback_dl_callback(struct mhi_device *mhi_dev,
>> +				     struct mhi_result *mhi_res)
>> +{
>> +	struct mhi_loopback *loopback = dev_get_drvdata(&mhi_dev->dev);
>> +
>> +	if (!loopback)
>> +		return;
>> +
>> +	if (mhi_res->transaction_status && mhi_res->transaction_status != -ENOTCONN)
>> +		dev_err(&mhi_dev->dev, "DL callback error: status %d\n",
>> +			mhi_res->transaction_status);
>> +
>> +	if (atomic_dec_and_test(&loopback->tres_pending))
>> +		complete(&loopback->comp);
>> +}
>> +
>> +static void mhi_loopback_ul_callback(struct mhi_device *mhi_dev,
>> +				     struct mhi_result *mhi_res)
>> +{
>> +}
>> +
>> +static struct attribute *mhi_loopback_attrs[] = {
>> +	&dev_attr_tre_size.attr,
>> +	&dev_attr_max_tre_size.attr,
>> +	&dev_attr_num_tre.attr,
>> +	&dev_attr_start.attr,
>> +	&dev_attr_status.attr,
>> +	NULL,
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
>> +	int rc;
> 'int ret'
>
>> +
>> +	loopback = devm_kzalloc(&mhi_dev->dev, sizeof(*loopback), GFP_KERNEL);
>> +	if (!loopback)
>> +		return -ENOMEM;
>> +
>> +	loopback->mdev = mhi_dev;
>> +	loopback->tre_size = MHI_LOOPBACK_DEFAULT_TRE_SIZE;
>> +	loopback->num_tre = MHI_LOOPBACK_DEFAULT_NUM_TRE;
>> +	loopback->result = "not started";
>> +
>> +	mutex_init(&loopback->lb_mutex);
>> +	init_completion(&loopback->comp);
>> +
>> +	dev_set_drvdata(&mhi_dev->dev, loopback);
>> +
>> +	rc = mhi_prepare_for_transfer(mhi_dev);
>> +	if (rc) {
>> +		dev_err(&mhi_dev->dev, "failed to prepare for transfers\n");
> nit: Capitalize 'Failed' and print the errno. Applies to all error prints.
>
>> +		return rc;
>> +	}
>> +
>> +	rc = devm_device_add_group(&mhi_dev->dev, &mhi_loopback_group);
>> +	if (rc) {
>> +		dev_err(&mhi_dev->dev, "failed to create sysfs attributes\n");
>> +		mhi_unprepare_from_transfer(mhi_dev);
>> +	}
>> +
>> +	return rc;
> 'return 0'
>
>> +}
>> +
>> +static void mhi_loopback_remove(struct mhi_device *mhi_dev)
>> +{
>> +	struct mhi_loopback *loopback = dev_get_drvdata(&mhi_dev->dev);
>> +
>> +	complete(&loopback->comp);
>> +
>> +	mutex_lock(&loopback->lb_mutex);
>> +	mutex_unlock(&loopback->lb_mutex);
> What does this locking protect?
since start_store() is holding the mutex for its entire duration,
this lock will block until any in-progress start_store() has fully
completed before teardown, ensuring  mhi_unprepare_from_transfer()
does not race with an active test still accessing the channel.

Will fix other things you have mentioned.

-  Sumit
>
>> +
>> +	mhi_unprepare_from_transfer(mhi_dev);
>> +	dev_set_drvdata(&mhi_dev->dev, NULL);
> As I mentioned above, once you call sysfs_create_group() in probe() and
> sysfs_remove_group() before mhi_unprepare_from_transfer(), you can drop setting
> drvdata to NULL.
>
> - Mani
>

