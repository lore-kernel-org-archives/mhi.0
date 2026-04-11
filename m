Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D322259CBD
	for <mhi@lists.linux.dev>; Sat, 11 Apr 2026 13:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775915447; cv=none; b=kRZLIm1ZCXV7fX2kqmeBKJZHh1X0NO37MYpqq80o9yQcIjh23GcLDonX2yf00sQxohUsLXNx2jG9jrTP2uYwg+t8ftuzFCg89lPonJBcT48cA1ZcKdkbcfE67RHsjxqHLS1oTNB4e2oHbvxoJwQoIZfV+4gqUx4cndHwEruF/sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775915447; c=relaxed/simple;
	bh=jWTEtBSoUuYVX3uYmsPPbfkMn03+61vZqJRvH6Ym1pI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qy6Di6Qeb3Ud6Wv0TG+p3hJG+vKzvKc86TX6tkGPTpEZaupyd44pOCWeM+TVlHhUXLfdy8UhEUe9LgSGoe6gNW8JXN2tali0TJllIIzWSyh/c+xCFiGeBkQHp0tfvFBQFhlwj6LhG1lSXtSeBROk7fCqJJkzBITavYK8IyxGnLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UwoR2E+i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PF9+N6/V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UwoR2E+i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PF9+N6/V"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63BBXNdZ1533669
	for <mhi@lists.linux.dev>; Sat, 11 Apr 2026 13:50:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TYB9dL+sZas18a3SOYDriqRYOhYW5fQ4urBIjpNFZ54=; b=UwoR2E+iBDY/3B3n
	GQbKX+vVChbmoUfY5++ArMGfqzXshl1tVyMAr1zYR1kwTwEXsIe5gRHtcolwVxKT
	TSrnVv7kkxICqLu27KHd0QnkF/NcTHV79jmBe0GijH4xzUxG6BvGqw947+hNNXaC
	5zOUrE1nNBqNTdBYpV6LyktaWE+ME4b6jDIH2OXbEaTM+1I6NWuCj3wdcpbb3onR
	7dXkMHRROpuc9gVWH6klUkEWPoAFphHg/jJ9HdHDBadFsm9SAGKStUWeiP3R/IFs
	U/ik4uHdIzaAQ8uehQzFVglheIYwIIYCSPo6tBftZRmVwbWcxfDo6DJyORVHUNCI
	WuXLSw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfexfrswc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Sat, 11 Apr 2026 13:50:44 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b250d3699aso62933675ad.2
        for <mhi@lists.linux.dev>; Sat, 11 Apr 2026 06:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775915443; x=1776520243; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TYB9dL+sZas18a3SOYDriqRYOhYW5fQ4urBIjpNFZ54=;
        b=PF9+N6/VNP84MEsKUNua+ChwHDSEiPDSqwaLOSXEs9L0TAQyeGI9xl8ptY135dRKDn
         64htR7qYAJ/QLlI7E1L09Ajhv8ummK1ithfGzdjklr8RXreettaNw07fyPyl5i4mBbPo
         sGX+QRyjT2xM6+Y8fwB/F6LeE4SFGLU7WRoXY0K1t1cCnXRrJ0jb3d1UQkwSrZrbYQ2X
         SYHl3yKTIXBbAKOVQvrLGMRW8qqZPvnLC5t4tDO2bobHLbAPOnEyjr/AnpRs63PO3TXa
         b1ImInFtCqBaTxSHezeQveqyp+aa1Rjp+kZxdNYxDpkXAkingjOxWoJRz8gSLuol+wuN
         b+Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775915443; x=1776520243;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TYB9dL+sZas18a3SOYDriqRYOhYW5fQ4urBIjpNFZ54=;
        b=RLxMmZSwg+d/PrjvXlLGxwPLGcGvaeDDVz3Af6GJWz1GAX4yBPOZSpMwOjW7LN83rh
         GFqr+jsci2VEzBEyvweQBU7Xd0QujopBdwNzuI9sjbbmRuFphETZEEGQDYJGY7CJUtD1
         XOmucR7/92AaBcmO0V+mN6/+HJdLsh4qm15XIrhQ62JZ0McUwksfam8nMgFxMKpikpOh
         +AAWbVSi9VVHu6RCqpMJcDIRN+WxlKi78n2zD9Aiv1860TpmwgyGhLu+0Ky5LDcXaU8k
         lquSl7MdBq9MxIjx4Ao8MC+oVm2kY8zPQ6TUhze12pIME7crZMyAd4c99htXeOFpW+mx
         Abng==
X-Gm-Message-State: AOJu0Yz8f3ahDbS9U3Ng4X2RtUahX8CWgNIBl41X7OWm7FT0W7QiA4zz
	BuG9/0ZY8HXkBN5uKcEBOqK3k7ost4l2uOuDoEbIkn16tTwLWHbabbQkKUTECgiCMZ62ZJG6jap
	QOcHdzfAyj4HOJIesJaTndm7JamPIpsA1XR5LJy32WjXEm0Re9aAqAeo=
X-Gm-Gg: AeBDieuurv/mZ+aE3CumPwnHt+Cni6+iOxBk+JggmqLDhm49/fXAl8fFk+2gCZ8onRl
	UUgASl7Q8aQAc7SynR9EeLenBhqzTWoy6sM35Z76bm1Mn1leC+uHHPUspm4MBsLDwxCbsJgfYDO
	eE7t3IBI4MG7a88DC1z0ZUo3IsJm8yBOMZ3X0ehjn9uyVRGaS3m/2SXKuzVDVAr1me07qbEMt0T
	WGZdWSwjUUqMrbC5jfK3DLaMivxlbc+96U93jFD9NgZ9I5R6e12X2Wisf4bJ4MgcZJSJXp3tvDB
	D8PxBRn/y9H/3FFo6POU/4e/9ZAUOkaDw9McnC+cbEzFg+d01khrlH8npaqwHRKDLcm1NYJDmEq
	lxWRAuhxH4q1rKrfpGhP4FVhyLcREGnRMGNu7Nmbxe1GW19+xrhNK6+ohHUhUG1ytuQPbvmZibd
	QAERrRqLPdwg==
X-Received: by 2002:a17:902:e193:b0:2b0:72c7:3ed8 with SMTP id d9443c01a7336-2b2d5a2c1d8mr54178785ad.25.1775915443321;
        Sat, 11 Apr 2026 06:50:43 -0700 (PDT)
X-Received: by 2002:a17:902:e193:b0:2b0:72c7:3ed8 with SMTP id d9443c01a7336-2b2d5a2c1d8mr54178635ad.25.1775915442781;
        Sat, 11 Apr 2026 06:50:42 -0700 (PDT)
Received: from [10.133.33.83] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4f0b284sm61643745ad.52.2026.04.11.06.50.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Apr 2026 06:50:42 -0700 (PDT)
Message-ID: <21f823b7-3140-4436-a4d4-6fb7b6cf8d5b@oss.qualcomm.com>
Date: Sat, 11 Apr 2026 21:50:37 +0800
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] bus: mhi: host: mhi_phc: Add support for PHC over
 MHI
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
References: <20260411-tsc_timesync-v2-0-6f25f72987b3@oss.qualcomm.com>
 <20260411-tsc_timesync-v2-6-6f25f72987b3@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260411-tsc_timesync-v2-6-6f25f72987b3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: V26rd9Kzw36YhGmW5CINNYmpLNRaHgNh
X-Authority-Analysis: v=2.4 cv=OpZ/DS/t c=1 sm=1 tr=0 ts=69da51b4 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=TlgILChHWuASUgA4TAAA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: V26rd9Kzw36YhGmW5CINNYmpLNRaHgNh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDExOCBTYWx0ZWRfX6OMDSMm5L200
 sdFIbQgb8InwM+xr6rwLKydiqzvxMOyCOruYQLvUZT3uSW8vjgxrjDEAc7AS/goyxUR2tQRjjcI
 dZcSST09TfMFl3ZkQwOiqp7ChdsDpjo2xmITCrg75vxhjjYC8HKCc4Y1k+iYKe4GJt5VjW1UXo2
 jQWfv5yFkAkLxMDi3vR1KjeAP9Ub4aUjmHL7ZkYe8MRXs3V+IMzeBveIuhzsSk5dtRpmOs0Qj4u
 2P53o86oH0mYb3/qUveguVk66HXzHMw71NkVH9BMmndRQeR/O67cUoxlbCGy6cr5sfIC3ys0juW
 8iuKbgLBeI5JHbHSXQ/cc+rkPH60TbZzlRczP3G3d1yTFj4boT/2gg4sMaoYvBFc0/vbGpCGgz4
 UzvcyI+95BWnR3Ke8fJgdZJirw5yeTwIB1St1y5Oogn02YCbGJn/qBS7EgT2JypBJ14IbzsMw3Y
 wgHJwEnmD8lTSHy2OTg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110118



On 4/11/2026 4:12 PM, Krishna Chaitanya Chundru wrote:
> From: Imran Shaik <imran.shaik@oss.qualcomm.com>
> 
> This patch introduces the MHI PHC (PTP Hardware Clock) driver, which
> registers a PTP (Precision Time Protocol) clock and communicates with
> the MHI core to get the device side timestamps. These timestamps are
> then exposed to the PTP subsystem, enabling precise time synchronization
> between the host and the device.
> 
> The following diagram illustrates the architecture and data flow:
> 
>   +-------------+    +--------------------+    +--------------+
>   |Userspace App|<-->|Kernel PTP framework|<-->|MHI PHC Driver|
>   +-------------+    +--------------------+    +--------------+
>                                                       |
>                                                       v
>   +-------------------------------+         +-----------------+
>   | MHI Device (Timestamp source) |<------->| MHI Core Driver |
>   +-------------------------------+         +-----------------+
> 
> - User space applications use the standard Linux PTP interface.
> - The PTP subsystem routes IOCTLs to the MHI PHC driver.
> - The MHI PHC driver communicates with the MHI core to fetch timestamps.
> - The MHI core interacts with the device to retrieve accurate time data.
> 
> Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>   drivers/bus/mhi/host/Kconfig       |   8 ++
>   drivers/bus/mhi/host/Makefile      |   1 +
>   drivers/bus/mhi/host/mhi_phc.c     | 150 +++++++++++++++++++++++++++++++++++++
>   drivers/bus/mhi/host/mhi_phc.h     |  28 +++++++
>   drivers/bus/mhi/host/pci_generic.c |  23 ++++++
>   5 files changed, 210 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/Kconfig b/drivers/bus/mhi/host/Kconfig
> index da5cd0c9fc620ab595e742c422f1a22a2a84c7b9..b4eabf3e5c56907de93232f02962040e979c3110 100644
> --- a/drivers/bus/mhi/host/Kconfig
> +++ b/drivers/bus/mhi/host/Kconfig
> @@ -29,3 +29,11 @@ config MHI_BUS_PCI_GENERIC
>   	  This driver provides MHI PCI controller driver for devices such as
>   	  Qualcomm SDX55 based PCIe modems.
>   
> +config MHI_BUS_PHC
> +	bool "MHI PHC driver"
> +	depends on MHI_BUS_PCI_GENERIC
> +	help
> +	  This driver provides Precision Time Protocol (PTP) clock and
> +	  communicates with MHI PCI driver to get the device side timestamp,
> +	  which enables precise time synchronization between the host and
> +	  the device.
> diff --git a/drivers/bus/mhi/host/Makefile b/drivers/bus/mhi/host/Makefile
> index 859c2f38451c669b3d3014c374b2b957c99a1cfe..5ba244fe7d596834ea535797efd3428963ba0ed0 100644
> --- a/drivers/bus/mhi/host/Makefile
> +++ b/drivers/bus/mhi/host/Makefile
> @@ -4,3 +4,4 @@ mhi-$(CONFIG_MHI_BUS_DEBUG) += debugfs.o
>   
>   obj-$(CONFIG_MHI_BUS_PCI_GENERIC) += mhi_pci_generic.o
>   mhi_pci_generic-y += pci_generic.o
> +mhi_pci_generic-$(CONFIG_MHI_BUS_PHC) += mhi_phc.o
> diff --git a/drivers/bus/mhi/host/mhi_phc.c b/drivers/bus/mhi/host/mhi_phc.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..fa04eb7f6025fa281d86c0a45b5f7d3e61f5ce12
> --- /dev/null
> +++ b/drivers/bus/mhi/host/mhi_phc.c
> @@ -0,0 +1,150 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2025, Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/mhi.h>
> +#include <linux/ptp_clock_kernel.h>
> +#include "mhi_phc.h"
> +
> +#define NSEC 1000000000ULL
> +
> +/**
> + * struct mhi_phc_dev - MHI PHC device
> + * @ptp_clock: associated PTP clock
> + * @ptp_clock_info: PTP clock information
> + * @mhi_dev: associated mhi device object
> + * @lock: spinlock
> + * @enabled: Flag to track the state of the MHI device
> + */
> +struct mhi_phc_dev {
> +	struct ptp_clock *ptp_clock;
> +	struct ptp_clock_info  ptp_clock_info;
> +	struct mhi_device *mhi_dev;
> +	spinlock_t lock;
> +	bool enabled;
> +};
> +
> +static int qcom_ptp_gettimex64(struct ptp_clock_info *ptp, struct timespec64 *ts,
> +			       struct ptp_system_timestamp *sts)
> +{
> +	struct mhi_phc_dev *phc_dev = container_of(ptp, struct mhi_phc_dev, ptp_clock_info);
> +	struct mhi_timesync_info time;
> +	ktime_t ktime_cur;
> +	unsigned long flags;
> +	int ret;
> +
> +	spin_lock_irqsave(&phc_dev->lock, flags);
> +	if (!phc_dev->enabled) {
> +		ret = -ENODEV;
> +		goto err;
> +	}
> +
> +	ret = mhi_get_remote_tsc_time_sync(phc_dev->mhi_dev, &time);

mhi_get_remote_tsc_time_sync -> mhi_device_get_sync -> 
__mhi_device_get_sync -> wait_event_timeout (can sleep with spinlock)

Be careful to use the spinlock here.

Thanks,
Jie

> +	if (ret)
> +		goto err;
> +
> +	ktime_cur = time.t_dev_hi * NSEC + time.t_dev_lo;
> +	*ts = ktime_to_timespec64(ktime_cur);
> +
> +	dev_dbg(&phc_dev->mhi_dev->dev, "TSC time stamps sec:%u nsec:%u current:%lld\n",
> +		time.t_dev_hi, time.t_dev_lo, ktime_cur);
> +
> +	/* Update pre and post timestamps for PTP_SYS_OFFSET_EXTENDED*/
> +	if (sts != NULL) {
> +		sts->pre_ts = ktime_to_timespec64(time.t_host_pre);
> +		sts->post_ts = ktime_to_timespec64(time.t_host_post);
> +		dev_dbg(&phc_dev->mhi_dev->dev, "pre:%lld post:%lld\n",
> +			time.t_host_pre, time.t_host_post);
> +	}
> +
> +err:
> +	spin_unlock_irqrestore(&phc_dev->lock, flags);
> +
> +	return ret;
> +}
> +
> +int mhi_phc_start(struct mhi_controller *mhi_cntrl)
> +{
> +	struct mhi_phc_dev *phc_dev = dev_get_drvdata(&mhi_cntrl->mhi_dev->dev);
> +	unsigned long flags;
> +
> +	if (!phc_dev) {
> +		dev_err(&mhi_cntrl->mhi_dev->dev, "Driver data is NULL\n");
> +		return -ENODEV;
> +	}
> +
> +	spin_lock_irqsave(&phc_dev->lock, flags);
> +	phc_dev->enabled = true;
> +	spin_unlock_irqrestore(&phc_dev->lock, flags);
> +
> +	return 0;
> +}
> +
> +int mhi_phc_stop(struct mhi_controller *mhi_cntrl)
> +{
> +	struct mhi_phc_dev *phc_dev = dev_get_drvdata(&mhi_cntrl->mhi_dev->dev);
> +	unsigned long flags;
> +
> +	if (!phc_dev) {
> +		dev_err(&mhi_cntrl->mhi_dev->dev, "Driver data is NULL\n");
> +		return -ENODEV;
> +	}
> +
> +	spin_lock_irqsave(&phc_dev->lock, flags);
> +	phc_dev->enabled = false;
> +	spin_unlock_irqrestore(&phc_dev->lock, flags);
> +
> +	return 0;
> +}
> +
> +static struct ptp_clock_info qcom_ptp_clock_info = {
> +	.owner    = THIS_MODULE,
> +	.gettimex64 =  qcom_ptp_gettimex64,
> +};
> +
> +int mhi_phc_init(struct mhi_controller *mhi_cntrl)
> +{
> +	struct mhi_device *mhi_dev = mhi_cntrl->mhi_dev;
> +	struct mhi_phc_dev *phc_dev;
> +	int ret;
> +
> +	phc_dev = devm_kzalloc(&mhi_dev->dev, sizeof(*phc_dev), GFP_KERNEL);
> +	if (!phc_dev)
> +		return -ENOMEM;
> +
> +	phc_dev->mhi_dev = mhi_dev;
> +
> +	phc_dev->ptp_clock_info = qcom_ptp_clock_info;
> +	strscpy(phc_dev->ptp_clock_info.name, mhi_dev->name, PTP_CLOCK_NAME_LEN);
> +
> +	spin_lock_init(&phc_dev->lock);
> +
> +	phc_dev->ptp_clock = ptp_clock_register(&phc_dev->ptp_clock_info, &mhi_dev->dev);
> +	if (IS_ERR(phc_dev->ptp_clock)) {
> +		ret = PTR_ERR(phc_dev->ptp_clock);
> +		dev_err(&mhi_dev->dev, "Failed to register PTP clock\n");
> +		phc_dev->ptp_clock = NULL;
> +		return ret;
> +	}
> +
> +	dev_set_drvdata(&mhi_dev->dev, phc_dev);
> +
> +	dev_dbg(&mhi_dev->dev, "probed MHI PHC dev: %s\n", mhi_dev->name);
> +	return 0;
> +};
> +
> +void mhi_phc_exit(struct mhi_controller *mhi_cntrl)
> +{
> +	struct mhi_phc_dev *phc_dev = dev_get_drvdata(&mhi_cntrl->mhi_dev->dev);
> +
> +	if (!phc_dev)
> +		return;
> +
> +	/* disable the node */
> +	ptp_clock_unregister(phc_dev->ptp_clock);
> +	phc_dev->enabled = false;
> +}
> diff --git a/drivers/bus/mhi/host/mhi_phc.h b/drivers/bus/mhi/host/mhi_phc.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..e6b0866bc768ba5a8ac3e4c40a99aa2050db1389
> --- /dev/null
> +++ b/drivers/bus/mhi/host/mhi_phc.h
> @@ -0,0 +1,28 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2025, Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifdef CONFIG_MHI_BUS_PHC
> +int mhi_phc_init(struct mhi_controller *mhi_cntrl);
> +int mhi_phc_start(struct mhi_controller *mhi_cntrl);
> +int mhi_phc_stop(struct mhi_controller *mhi_cntrl);
> +void mhi_phc_exit(struct mhi_controller *mhi_cntrl);
> +#else
> +static inline int mhi_phc_init(struct mhi_controller *mhi_cntrl)
> +{
> +	return 0;
> +}
> +
> +static inline int mhi_phc_start(struct mhi_controller *mhi_cntrl)
> +{
> +	return 0;
> +}
> +
> +static inline int mhi_phc_stop(struct mhi_controller *mhi_cntrl)
> +{
> +	return 0;
> +}
> +
> +static inline void mhi_phc_exit(struct mhi_controller *mhi_cntrl) {}
> +#endif
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index b1122c7224bdd469406d96af6d3df342040e1002..6cba5cecd1adb40396bba30c9b2a551898dce871 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -16,6 +16,7 @@
>   #include <linux/pm_runtime.h>
>   #include <linux/timer.h>
>   #include <linux/workqueue.h>
> +#include "mhi_phc.h"
>   
>   #define MHI_PCI_DEFAULT_BAR_NUM 0
>   
> @@ -1044,6 +1045,7 @@ struct mhi_pci_device {
>   	struct timer_list health_check_timer;
>   	unsigned long status;
>   	bool reset_on_remove;
> +	bool mhi_phc_init_done;
>   };
>   
>   #ifdef readq
> @@ -1084,6 +1086,7 @@ static void mhi_pci_status_cb(struct mhi_controller *mhi_cntrl,
>   			      enum mhi_callback cb)
>   {
>   	struct pci_dev *pdev = to_pci_dev(mhi_cntrl->cntrl_dev);
> +	struct mhi_pci_device *mhi_pdev = pci_get_drvdata(pdev);
>   
>   	/* Nothing to do for now */
>   	switch (cb) {
> @@ -1091,9 +1094,21 @@ static void mhi_pci_status_cb(struct mhi_controller *mhi_cntrl,
>   	case MHI_CB_SYS_ERROR:
>   		dev_warn(&pdev->dev, "firmware crashed (%u)\n", cb);
>   		pm_runtime_forbid(&pdev->dev);
> +		/* Stop PHC */
> +		if (mhi_cntrl->tsc_timesync)
> +			mhi_phc_stop(mhi_cntrl);
>   		break;
>   	case MHI_CB_EE_MISSION_MODE:
>   		pm_runtime_allow(&pdev->dev);
> +		/* Start PHC */
> +		if (mhi_cntrl->tsc_timesync) {
> +			if (!mhi_pdev->mhi_phc_init_done) {
> +				mhi_phc_init(mhi_cntrl);
> +				mhi_pdev->mhi_phc_init_done = true;
> +			}
> +
> +			mhi_phc_start(mhi_cntrl);
> +		}
>   		break;
>   	default:
>   		break;
> @@ -1236,6 +1251,10 @@ static void mhi_pci_recovery_work(struct work_struct *work)
>   
>   	pm_runtime_forbid(&pdev->dev);
>   
> +	/* Stop PHC */
> +	if (mhi_cntrl->tsc_timesync)
> +		mhi_phc_stop(mhi_cntrl);
> +
>   	/* Clean up MHI state */
>   	if (test_and_clear_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status)) {
>   		mhi_power_down(mhi_cntrl, false);
> @@ -1457,6 +1476,10 @@ static void mhi_pci_remove(struct pci_dev *pdev)
>   		timer_delete_sync(&mhi_pdev->health_check_timer);
>   	cancel_work_sync(&mhi_pdev->recovery_work);
>   
> +	/* Remove PHC */
> +	if (mhi_cntrl->tsc_timesync)
> +		mhi_phc_exit(mhi_cntrl);
> +
>   	if (test_and_clear_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status)) {
>   		mhi_power_down(mhi_cntrl, true);
>   		mhi_unprepare_after_power_down(mhi_cntrl);
> 

