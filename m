Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007162EA75E
	for <mhi@lists.linux.dev>; Tue, 13 Oct 2026 07:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791876640; cv=none; b=MGMI91U/xOJMgNV2WHeoTvrl9Vadfu/l/3cbZphWchkiPCxyQdqwF1L22vUtIJVdnIIFeChTFT1Jrt4xlK36CpHymZRgQtOxBef6vzNbK9g61YU6Y/iQWKpYU4IIvinTcld+2KkSWMWLf3P4d+1Imo4ZwXiHAqhO2/1m9wTEr3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791876640; c=relaxed/simple;
	bh=jxJNYrI22RlLexodQlZcE5ZvGLVCwiFJ8RVwNBj6iLQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MZ6MScVm3AffH3+BX6MPWvtZL3TW06sACL2MmeclMcBxIK2Woj3qzyqE61YIbAFjYEXotbb+HlmaZy2K00GTmTkv2evIcFIfAW8ckoWiGOnihunakF2b2UGCz/aPfSENAPoEoIj15YCGQR0N1NBTUJTHTYa9wx+PJROBlpTBZe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E0DOOchF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KIdctqmq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E0DOOchF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KIdctqmq"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D20mhR302840
	for <mhi@lists.linux.dev>; Tue, 13 Oct 2026 07:30:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kHGYKtLSEbyUQdlpz97zgPVlOvItbLPmnAOXZGaC+co=; b=E0DOOchFG4ce55HI
	0D0VDPA7pS2T5EwmXVziwVJk/UVFfKFBaXLK2sY6/rP+3Y+XSZyqCDtFhCqpF0ir
	QoU5xzEZ2BaOyA0KzmCAE3x/Wjjv9wVEFxcFHXk54bR/u8eoNRszXTeA9Me74KAH
	nFKDwXk5ESQMlsrktvzWAu7pWDNeB/04H4K/ko1jn8Q7X22zPSXGKHSwLlFPXrH1
	E7BfytgTeIRyRBTijXfQ3nXBY3O39txVSi1eRVc3FK/A9OzRSwrhxrC9iTIKO5al
	OxDXwnZ74V07+pX3VgCjosdehDZfrFgQyAZukjafgRyJHt18C8xa0KVrUv+CAMzT
	LvVyAg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98sq9mby-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Tue, 13 Oct 2026 07:30:37 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso2074189a91.2
        for <mhi@lists.linux.dev>; Tue, 13 Oct 2026 00:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791876637; x=1792481437; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kHGYKtLSEbyUQdlpz97zgPVlOvItbLPmnAOXZGaC+co=;
        b=KIdctqmqrGOrDTHPHqKmch855v6BUK9Y8VMVupm5sJWC2uuYcLp+XFjE5+BRbdsGd/
         GE9nJTGYdkKi5GMsvzDU8EmmQzZhwdOMa0IRaE4r/Dv3IL2TLp3OvapWYW/VLdvXbqJI
         wTU5+/SOa/ypbqU1mJZHxcMNOv//eT1TxwYAwvkReiqXAC37W45AHd/l+Ru3A1I2GgUY
         3U2sM/rPlymzT3WrK0iSvdQWFA8aqsWbeUb8QTjxl/E6nrGg5pZYs+s1+MS/IGEGZrLB
         wqwFJqItRXvJRpvOgecGiu7OsyQy1O0TWp+jaAkSV+FHPO5OHdMRCGgprKnSj7LEhtR0
         nemw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791876637; x=1792481437;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kHGYKtLSEbyUQdlpz97zgPVlOvItbLPmnAOXZGaC+co=;
        b=NO/XuFTdCDaEvcWDMSFUgFS+lwNzMO4t8OLxqEHqnuhwONK8U6KB3tOFSH+ePCkyuW
         CrZYG/LUhAh2mFFxFHoyT/ZyQj7Ct7VcJEJrKbuaw/5wh7oKPwJ/P0bnQ5aFGpI5iPZN
         Y2nCD2Qjdbz6g/lYYPXvsNCd5/5T7RwlpXPekKLgrKZJvGrDHcRjQBXzVrCPFEKGYR+N
         XsdvABdXv0J/HUYyCNMu+11oxawZtbz8STbFZuZPOHNE55MPBLI52kqF+OruUK2lr4Ip
         VNyJt1B+3yrLXGkpipi/OcRc4tW5dDp0BdrJeVFze4/pszlglRzm4G/uMWO7Oqj9V4hq
         030w==
X-Forwarded-Encrypted: i=1; AKwUvBylSIVMT3rwnJGP4ciUUmXw/2RiInXsgw98n1Yrr899XNgGaR7gApgQTRcM1UiTORTFUaU=@lists.linux.dev
X-Gm-Message-State: AFq9FYIP1GDsSWVzULDGBXYWjuLadMOB3F8aFEfAJjbHAKg9MrVRWP1H
	DGfKR0KYV4ybaT9qUjCZujVqv4A9bd3Ilj+MUFNRTpWSEsy7ng44mrIMeiyBGbyRaSNRGBoCSl0
	+3aHPCwfH8lGQ/DH28mYIzq4TvDYNqSPaoXsdg1rY8at7jF2xmUpdkyI=
X-Gm-Gg: AYBFou0aExZUK23dqKLZRjrNeM4OZTgfIETci8Xk8gSNixJUT7vgKiwhsqK/fGlZTKN
	hUQsQoWTThThJ9WlU0sqD6GuHIhSO0Cqm3vxfJHV8hEivmDdNH94tiI1tYJty+qwkpxAkQHUbY4
	Kx+R7CFTL82RGQcnnsIyJT6FpvL2msMQI2kA7Kb8D2S5U/EMs1QQvDR2LBic/AUZvNCW0pjXlfQ
	EOVncvDt2y6p1fkp0l2asyFvQPRnX5r4J/MBmQiIIaprr3TMly4qT5c8dmiDg5fEJlPy0zaqvtr
	tk3LxMt4Q69u3G5PfREoLIPRO2PxSz49W8XXd6IBEg78I0V+5MiXY4nS0ozjqLzisGKhGULjO4l
	ryzja37ewxeUJZDbVgmhiYuHo7USr47IA
X-Received: by 2002:a17:90a:c88b:b0:3a5:1b:34a5 with SMTP id 98e67ed59e1d1-3ab3af73a91mr9462447a91.49.1791876636574;
        Tue, 13 Oct 2026 00:30:36 -0700 (PDT)
X-Received: by 2002:a17:90a:c88b:b0:3a5:1b:34a5 with SMTP id 98e67ed59e1d1-3ab3af73a91mr9462411a91.49.1791876635809;
        Tue, 13 Oct 2026 00:30:35 -0700 (PDT)
Received: from [10.217.219.169] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab39234b62sm20398370a91.16.2026.10.13.00.30.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 00:30:35 -0700 (PDT)
Message-ID: <a3a83688-0b85-4555-a9ec-4ac51b692f49@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 13:00:29 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/7] bus: mhi: Move Sahara protocol driver under MHI
 host client drivers
To: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev
References: <20261012-sahara_protocol_new_v2-v8-0-e12939d229a1@oss.qualcomm.com>
 <20261012-sahara_protocol_new_v2-v8-2-e12939d229a1@oss.qualcomm.com>
 <2bf0a2e0-7466-4e90-b53d-f3fc0d26378c@oss.qualcomm.com>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <2bf0a2e0-7466-4e90-b53d-f3fc0d26378c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAyOSBTYWx0ZWRfX0ICjwESRhOAe
 srb07BSmXCg+bb7l9hX6GMqgXy8hA8BA/GD8X6JWdMopneLgh7JKRcYpP3tt/siX6G10xbuztUv
 9ZHbENQtnQE+P75Tz1+YAK8EKgKp72NnREyZslwkZ19KaPVfG6AtFHCp7ENUKTBR6Y8/HthJL0c
 p+OrveAY9cpfL5dNHLxAS6JTMMcPrGyFoyoJ1w5cgFeix78E7FU/moRMua3+cZuXjvtyfECyvRO
 T65ohYfAkQr5Js6Gw6hiHuibz1JuS+zvVdPgyW+T3xMy2X/JHNDYMHG34npq+e5CdhgQhKhhunE
 /6dfiSOsiJ7R30G06ixsGgImji0OXOuHAi6JXZ7k5ezK91msjupZ+50RrrkPlwwXvxF863N0gB3
 zrX+hFFW9yL3xk/QquNnEhvvqvcZZ4E5wy4M1ZcLasmp7WDQigu1So9Bmu0Rg+9XntxaJBvTmo0
 NLewJzQ7CzdIKF/qSnw==
X-Authority-Analysis: v=2.4 cv=JN+uIMKb c=1 sm=1 tr=0 ts=6acdde1d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=YsTF_x4DAHpo6Sg_WHoA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAyOSBTYWx0ZWRfX4E+97lAenWUK
 dC9Y/uz1GBWOAoP/mM+clAlxdUhRk83DGuorYziojggEZGchgnmcPpg3mfcCBnjj+EyAFpZXEEg
 1vfw1tsxopAs5EL3OWshWg4Ezy5c68s=
X-Proofpoint-ORIG-GUID: WVY46dYHKAq9HzBEiNK4T6oLjk_mMbFS
X-Proofpoint-GUID: WVY46dYHKAq9HzBEiNK4T6oLjk_mMbFS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130029


On 10/13/2026 3:05 AM, Trilok Soni wrote:
> On 10/12/2026 11:18 AM, Kishore Batta wrote:
>> The Sahara protocol driver currently lives under the QAIC accelerator
>> subsystem even though the protocol is transported over MHI and is used by
>> multiple Qualcomm flashless devices. This makes Sahara appear QAIC specific
>> and complicates reuse by other MHI based devices.
>>
>> Move the Sahara protocol driver under drivers/bus/mhi as a host client
>> driver and build it as an independent MHI protocol driver. This keeps the
>> QAIC driver focused on the accelerator device while allowing other MHI
>> users to enable Sahara without depending on QAIC.
>>
>> As part of the move, add a dedicated Kconfig/Makefile hierarchy under the
>> MHI host client drivers and convert the driver to use module_mhi_driver()
>> instead of register/unregister hooks.
>>
>> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
>> ---
>>   drivers/accel/qaic/Kconfig                          |  1 +
>>   drivers/accel/qaic/Makefile                         |  3 +--
>>   drivers/accel/qaic/qaic_drv.c                       |  9 ---------
>>   drivers/accel/qaic/sahara.h                         | 10 ----------
>>   drivers/bus/mhi/host/Makefile                       |  2 +-
>>   drivers/bus/mhi/host/clients/Kconfig                |  6 ++++++
>>   drivers/bus/mhi/host/clients/Makefile               |  1 +
>>   drivers/bus/mhi/host/clients/sahara/Kconfig         | 15 +++++++++++++++
>>   drivers/bus/mhi/host/clients/sahara/Makefile        |  2 ++
>>   .../qaic => bus/mhi/host/clients/sahara}/sahara.c   | 21 ++++++++-------------
>>   10 files changed, 35 insertions(+), 35 deletions(-)
>>
>> diff --git a/drivers/accel/qaic/Kconfig b/drivers/accel/qaic/Kconfig
>> index 116e42d152ca885b8c59e33c7a87519a0abc6bb3..af90fdfcf77eeb6dd5ad309b33d793d4fdc91b1e 100644
>> --- a/drivers/accel/qaic/Kconfig
>> +++ b/drivers/accel/qaic/Kconfig
>> @@ -8,6 +8,7 @@ config DRM_ACCEL_QAIC
>>   	depends on DRM_ACCEL
>>   	depends on PCI && HAS_IOMEM
>>   	depends on MHI_BUS
>> +	depends on MHI_SAHARA
>>   	select CRC32
>>   	select WANT_DEV_COREDUMP
>>   	help
>> diff --git a/drivers/accel/qaic/Makefile b/drivers/accel/qaic/Makefile
>> index 71f727b74da3bb4478324689f02a7cea24a05c2d..e7b8458800072aa627f7f36c3257883aa56f4ce4 100644
>> --- a/drivers/accel/qaic/Makefile
>> +++ b/drivers/accel/qaic/Makefile
>> @@ -13,7 +13,6 @@ qaic-y := \
>>   	qaic_ras.o \
>>   	qaic_ssr.o \
>>   	qaic_sysfs.o \
>> -	qaic_timesync.o \
>> -	sahara.o
>> +	qaic_timesync.o
>>   
>>   qaic-$(CONFIG_DEBUG_FS) += qaic_debugfs.o
>> diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
>> index 0acf6cdd44f81430ec52c7120b8b50c60721a615..64e87dfaa560376ecdf1e6f8bf7abf6153160926 100644
>> --- a/drivers/accel/qaic/qaic_drv.c
>> +++ b/drivers/accel/qaic/qaic_drv.c
>> @@ -32,7 +32,6 @@
>>   #include "qaic_ras.h"
>>   #include "qaic_ssr.h"
>>   #include "qaic_timesync.h"
>> -#include "sahara.h"
>>   
>>   MODULE_IMPORT_NS("DMA_BUF");
>>   
>> @@ -789,12 +788,6 @@ static int __init qaic_init(void)
>>   		goto free_pci;
>>   	}
>>   
>> -	ret = sahara_register();
>> -	if (ret) {
>> -		pr_debug("qaic: sahara_register failed %d\n", ret);
>> -		goto free_mhi;
>> -	}
>> -
>>   	ret = qaic_timesync_init();
>>   	if (ret)
>>   		pr_debug("qaic: qaic_timesync_init failed %d\n", ret);
>> @@ -816,7 +809,6 @@ static int __init qaic_init(void)
>>   
>>   free_bootlog:
>>   	qaic_bootlog_unregister();
>> -free_mhi:
>>   	mhi_driver_unregister(&qaic_mhi_driver);
>>   free_pci:
>>   	pci_unregister_driver(&qaic_pci_driver);
>> @@ -845,7 +837,6 @@ static void __exit qaic_exit(void)
>>   	qaic_ras_unregister();
>>   	qaic_bootlog_unregister();
>>   	qaic_timesync_deinit();
>> -	sahara_unregister();
>>   	mhi_driver_unregister(&qaic_mhi_driver);
>>   	pci_unregister_driver(&qaic_pci_driver);
>>   }
>> diff --git a/drivers/accel/qaic/sahara.h b/drivers/accel/qaic/sahara.h
>> deleted file mode 100644
>> index 08037281c80e28f6c85b924c45ce2c2f9dc60c39..0000000000000000000000000000000000000000
>> --- a/drivers/accel/qaic/sahara.h
>> +++ /dev/null
>> @@ -1,10 +0,0 @@
>> -/* SPDX-License-Identifier: GPL-2.0-only */
>> -
>> -/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. */
>> -
>> -#ifndef __SAHARA_H__
>> -#define __SAHARA_H__
>> -
>> -int sahara_register(void);
>> -void sahara_unregister(void);
>> -#endif /* __SAHARA_H__ */
>> diff --git a/drivers/bus/mhi/host/Makefile b/drivers/bus/mhi/host/Makefile
>> index 2a16008aeb38127494782bbff4e1656428d2b776..2e8949f1a2fe6f3f3b2e1dc541f97d2c393d6a0f 100644
>> --- a/drivers/bus/mhi/host/Makefile
>> +++ b/drivers/bus/mhi/host/Makefile
>> @@ -4,4 +4,4 @@ mhi-$(CONFIG_MHI_BUS_DEBUG) += debugfs.o
>>   
>>   obj-$(CONFIG_MHI_BUS_PCI_GENERIC) += mhi_pci_generic.o
>>   mhi_pci_generic-y += pci_generic.o
>> -obj-y += clients/
>> +obj-$(CONFIG_MHI_BUS) += clients/
>> diff --git a/drivers/bus/mhi/host/clients/Kconfig b/drivers/bus/mhi/host/clients/Kconfig
>> index 8bb5715e61d0d6e64a51012b4e1594ba46e5bfc1..1932344157a5b1dc25c8d63f6d4ac38f896d08a7 100644
>> --- a/drivers/bus/mhi/host/clients/Kconfig
>> +++ b/drivers/bus/mhi/host/clients/Kconfig
>> @@ -15,3 +15,9 @@ config MHI_BUS_LOOPBACK
>>   
>>   	  To compile this driver as a module, choose M here. The module
>>   	  will be called mhi_loopback.
>> +
>> +menu "MHI host client drivers"
>> +
>> +source "drivers/bus/mhi/host/clients/sahara/Kconfig"
>> +
>> +endmenu
>> diff --git a/drivers/bus/mhi/host/clients/Makefile b/drivers/bus/mhi/host/clients/Makefile
>> index 3811b6928f42b38f94b1167941cf3b0fe512d32b..67e70de280369870164b4808f39d9b3340f2589b 100644
>> --- a/drivers/bus/mhi/host/clients/Makefile
>> +++ b/drivers/bus/mhi/host/clients/Makefile
>> @@ -1,2 +1,3 @@
>>   obj-$(CONFIG_MHI_BUS_LOOPBACK) += mhi_loopback.o
>>   mhi_loopback-y += loopback.o
>> +obj-$(CONFIG_MHI_SAHARA) += sahara/
>> diff --git a/drivers/bus/mhi/host/clients/sahara/Kconfig b/drivers/bus/mhi/host/clients/sahara/Kconfig
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..f1fc7013a2dee0be645c50f32305659e591de7e7
>> --- /dev/null
>> +++ b/drivers/bus/mhi/host/clients/sahara/Kconfig
>> @@ -0,0 +1,15 @@
>> +config MHI_SAHARA
>> +	tristate "Sahara protocol driver"
>> +	depends on MHI_BUS
>> +	help
>> +	  Enable support for the Sahara protocol transported over the MHI bus.
>> +
>> +	  The Sahara protocol is used to transfer firmware images, retrieve
>> +	  memory dumps and exchange command mode DDR calibration data between
>> +	  host and device. This driver is not tied to a specific SoC and may be
>> +	  used by multiple MHI based devices.
>> +
>> +	  If unsure, say N.
>> +
>> +	  To compile this driver as a module, choose M here: the module will be
>> +	  called mhi_sahara.
>> diff --git a/drivers/bus/mhi/host/clients/sahara/Makefile b/drivers/bus/mhi/host/clients/sahara/Makefile
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..fc02a25935011cbd7138ea8f24b88cf5b032a4ce
>> --- /dev/null
>> +++ b/drivers/bus/mhi/host/clients/sahara/Makefile
>> @@ -0,0 +1,2 @@
>> +obj-$(CONFIG_MHI_SAHARA) += mhi_sahara.o
>> +mhi_sahara-y := sahara.o
>> diff --git a/drivers/accel/qaic/sahara.c b/drivers/bus/mhi/host/clients/sahara/sahara.c
>> similarity index 99%
>> rename from drivers/accel/qaic/sahara.c
>> rename to drivers/bus/mhi/host/clients/sahara/sahara.c
>> index c7c0b3eb4b65fb7776a6c724cb3105046cf6f7eb..dc64beae06ada6915a506ed8f4ae4d71c03158bb 100644
>> --- a/drivers/accel/qaic/sahara.c
>> +++ b/drivers/bus/mhi/host/clients/sahara/sahara.c
>> @@ -1,19 +1,20 @@
>>   // SPDX-License-Identifier: GPL-2.0-only
>> -
>> -/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. */
>> +/*
>> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> + *
>> + */
> Never delete the copyright lines please.  Is there any previous discussion on why we are doing it?
>
> ---Trilok Soni


Hi Trilok, In Patch 1 series, I was asked to match the style of comment 
matches the subsystem where this driver is moved to. Same has been 
incorporated. This driver was not developed before 2024 and hence kept 
same copyright.


