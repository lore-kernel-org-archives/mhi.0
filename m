Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D183828E0F
	for <mhi@lists.linux.dev>; Wed, 24 Jun 2026 11:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782299539; cv=none; b=kXWRIT4uvRxIW9LOL9A2FctSCyFR/HUF38/l0nDE4nx8NEAVOE2TF3cpiCBEP+6/WONhGG8/vOaSlnwAmfgkeqcpkPZvlX/vBXgNSa8mtk9HQo1N41yo0L3Zv9mlPFploWjBj7n9Ft7hozwvlGHoDJTHJkX0D3SdZSID0/V9vvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782299539; c=relaxed/simple;
	bh=zww7f4sFzsfUZ30J7VOgNS8sQF0fjHN+eCJz+LiNUos=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QtTA4X5Vxb4vJfSDuFLE4ITvnToYkVtIpP1KWNCAmGfPEJge2nknw1Zga7CI5+7jiWhQfNucYc5ah5a4hUeeBhN9maZrx5j6CDoT3LK7zOumcT7qCLiuLOBqnzgr8S2EeWX4Z7WEsg4yBuBBV9pRIrq1YtVPJ52WcQDgWSQnHSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iWvVR8SZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S5tOTqYC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iWvVR8SZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S5tOTqYC"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OAOUkb4182003
	for <mhi@lists.linux.dev>; Wed, 24 Jun 2026 11:12:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IlkzB21BQLyGO2BKUaCWrS3HNTUhTdWcAGomTPerZl8=; b=iWvVR8SZgE1JCi+S
	d5urdJGSckjzVsGa+aw8Blmn1E6YH5FBINGp4hdv84i+sz+DoFzOOpHQuh/mlNDb
	G8/bBTppdvA9XXwbxizS+fUpLqI0uFmFXctKjlu1BadytT3BIC906f7gcMBtxKQI
	IAg5KJb+22J0FdISa6lsz8eaYpitPL2eUHZJpoEqu5MUifphEqxDj360wsUWh6/2
	OVfVlgmbWTCaae//EC/sBF2tyEoOQEtWWR9MvBCNw792KSHI8wcoCRMB2Ib2LHbr
	9jxguqn8QNQ/vcwPlH26YOh7Xzj1wdZDD6KeFK2xoQlgJ2a9f7r4BbBKnaUPMDkQ
	Qb16cg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0aqp8wju-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Wed, 24 Jun 2026 11:12:16 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c7645ac9b1so8952335ad.3
        for <mhi@lists.linux.dev>; Wed, 24 Jun 2026 04:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782299536; x=1782904336; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IlkzB21BQLyGO2BKUaCWrS3HNTUhTdWcAGomTPerZl8=;
        b=S5tOTqYC6toJ6uGYBZpeS+AYrRSGgJ+0xAO69jcC8dVVgwXX1l2ZHslOQpBYAH21y7
         XTBSh6T5q0pAYFo8gCY2JL8vV7z4rlGFji4eVUJuFSykXpWL0UnjeNT+QwQKkLyY4RKS
         D516AW7LO5MCOP2WUNVsT3A8SZYL4QtEPkgEy+NRynTIxyteJFe4o+nBjPiZzOFNoplY
         FFtGBzOnawYrIortTYVwH2mR4InO9f375wb1ewYK4Sg1EUB8Vl4y9ds1OiXEZ1vBZ8DA
         gKHu+d/R50Qe2NwUDE1RHuUGbVUGGZBKZhwMHmc8ieeasH3yPLquMfOdxgVffvUYCfE2
         6a4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782299536; x=1782904336;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IlkzB21BQLyGO2BKUaCWrS3HNTUhTdWcAGomTPerZl8=;
        b=Lfhm0DV3t2A/E3dKSNBkgFoS0iv0q6/RMRrmBeISYimwk+gAcV2c72++5Rv8dhdQVd
         08v5Yu03Hzl3BwVNMkpl9vYCXQcuXpjW0eWJ4QQ6fbXIdeg3jCV5KdqAA2S6sIdXwrvr
         F+CkHI0Z7hYj2pPbN/5/2Kj4ewwjjPyYgq3CS7Y2l9E3IHzceI3hVn5v/pfJd5iujA8v
         lGxup9f+WREaIra45sPdV7qv8bQxA1TyeD7dX+3eAy5fD97TbvBGs7z0aC35Xt5H2n9E
         veG4WVg9/1KnxdCUi2ZR6HCEte0amY0vb65l7NnHLfyszCGnAeT/ieV3y5kOnI4falzt
         cURg==
X-Gm-Message-State: AOJu0YzFq62Szsx/2MXFoVQVzV0975+yJXcJ9c8zoAsU1YLsx5F283YR
	jeF5i+1CFLhcGNKcHrzcqH4KxAn2Q5el3vl7UjJkHNVJNrd0F8QxJwArXOHoff0mLA2/48Mw2M5
	wCZDYSOqAeyxKhVv9IjXE63pjgd7YGf4rQxRVJ/e8lhjC7JhkhYJiYAV9cfbUAh0=
X-Gm-Gg: AfdE7cnUPpWleI5fhKU+2e19Of8IS1yfxBi8dNMGoBflgkVJgKqNHHADdvld/xht3+k
	kgjQn7fnPFb/MjiyUEqgijXGUL3ehVaw5jDWjQNLc6YVwqlwy3WcLMlBNgO8r76iL+eqVpMmcxF
	taR4PwkBLYYcpvvwuj7XAFaKS5N0d3sSzP+FGskQTfgxzzcq0AkBY1XQxgkt8Qy7ulh/I36Vlo+
	71/vR255WTXWYW2VMDwk0OD/tmALlcGiE2Z4Usz/qR2FP2szgcuRKhbRTm20MOmyEEOXlbKO8R9
	LU3vUpdI0ruITpocL1+purbmo5+fIbLlLY+LVTB0LPJhdMqEiUtW7SeiQBPt1EhJ6ULB3qrmf0a
	SBUI3U6co42gwdi9FOwaj9BLQoc4BpoOv8wgMfvy9
X-Received: by 2002:a17:902:ebc3:b0:2bf:dd8b:7cd with SMTP id d9443c01a7336-2c7c75c4046mr75507115ad.10.1782299536191;
        Wed, 24 Jun 2026 04:12:16 -0700 (PDT)
X-Received: by 2002:a17:902:ebc3:b0:2bf:dd8b:7cd with SMTP id d9443c01a7336-2c7c75c4046mr75506755ad.10.1782299535537;
        Wed, 24 Jun 2026 04:12:15 -0700 (PDT)
Received: from [10.217.219.124] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c743bfdc97sm160971055ad.65.2026.06.24.04.12.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 04:12:15 -0700 (PDT)
Message-ID: <9f0c465e-f9ef-4511-97dc-e3ccb0347151@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 16:42:12 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] bus: mhi: ep: clients: Add loopback driver for
 data path testing
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
References: <20260622-loopback_mhi-v4-0-782b3a0f2eef@oss.qualcomm.com>
 <20260622-loopback_mhi-v4-3-782b3a0f2eef@oss.qualcomm.com>
 <q2bgzlv6o5sgdzg7jdazjd7yultfsxuyww637h5zppidd2k32c@3syfqgbx2r7n>
Content-Language: en-US
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
In-Reply-To: <q2bgzlv6o5sgdzg7jdazjd7yultfsxuyww637h5zppidd2k32c@3syfqgbx2r7n>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: zzo5t05IUr8Jy0d5YeejXE6Fe3tJ6J5k
X-Proofpoint-GUID: zzo5t05IUr8Jy0d5YeejXE6Fe3tJ6J5k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA5MyBTYWx0ZWRfXzZukj41Yt9wW
 AoRzboR9i+fibcB440lqEq19gw6J3A07RCy8Z+i0+N/huz1KMVFQvZlXfwg4wA4knmnMew/nmJK
 +llpt5qwYw6+9fdgJxe2tXb69xjFMN0sxN0DwJcNrZH8waoHBk1BMBrUOI7UQcRdLkresPrBaLm
 br/ir1s7WldNQD53mQdQHKsRd2/CR+tLbNyKpnDJlhn+nBO0JH1T+TB21oGFlQ9/XU0QG7nIVth
 dfKDB1d5DQZ0VL/GN4S7pf0QJsrOapOo3cpIkE2GVoSc5Z3e60RdXktx+6juMN6s0U0yNYim5eN
 7MjYnO1P0QmLit7fmKQOjGOge1Eu67N+T4VjZ25ifOQBoCHQgWo9ORPa0ZrGbf8zOzKVL3CJjpz
 K2SrhfIrWLGuXd/Iws+ecOmcLalRjRS6aAfRwTEo6VF8JTy49Sv4k7QkjtIJDDQi/myHBtiauvC
 +LiHTP+W9YagqlQJSOg==
X-Authority-Analysis: v=2.4 cv=QLhYgALL c=1 sm=1 tr=0 ts=6a3bbb90 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=DC1agn4tkaTvQTsFoT0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA5MyBTYWx0ZWRfX2JS1XX66p/oH
 6E962OLJLavW9eWS/OgRAtdQsn1xhn8bFT2muDOJs8LIghz/s/FxM2mhg1EeghJqd50Uscp5ojI
 FWoJKJToFv401f8hIH+nNVdfzW7gd98=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606240093



On 6/23/2026 2:47 PM, Manivannan Sadhasivam wrote:
> On Mon, Jun 22, 2026 at 10:39:17AM +0530, Sumit Kumar wrote:
>> When an MHI endpoint device runs Linux, there is no firmware to implement
>> the LOOPBACK channel echo that real modem firmware provides. Without an
>> endpoint-side driver, the host loopback test has no software echo partner
>> and cannot exercise the full end-to-end MHI data path.
>>
>> Add an endpoint-side loopback driver that binds to the LOOPBACK channel and
>> echoes received data back to the host. An ordered workqueue is used for
>> asynchronous processing to preserve packet ordering. Together with the
>> host-side loopback driver, this enables complete MHI data path validation
>> for Linux-based endpoint devices.
>>
>> Co-developed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
>> ---
>>   drivers/bus/mhi/ep/Kconfig            |   2 +
>>   drivers/bus/mhi/ep/Makefile           |   1 +
>>   drivers/bus/mhi/ep/clients/Kconfig    |  16 +++++
>>   drivers/bus/mhi/ep/clients/Makefile   |   2 +
>>   drivers/bus/mhi/ep/clients/loopback.c | 128 ++++++++++++++++++++++++++++++++++
>>   5 files changed, 149 insertions(+)
>>
>> diff --git a/drivers/bus/mhi/ep/Kconfig b/drivers/bus/mhi/ep/Kconfig
>> index 90ab3b040672e0f04181d4802e3062afcc7cf782..9edb81b39890e093a51138465a4d7705767eafa5 100644
>> --- a/drivers/bus/mhi/ep/Kconfig
>> +++ b/drivers/bus/mhi/ep/Kconfig
>> @@ -8,3 +8,5 @@ config MHI_BUS_EP
>>   
>>   	  MHI_BUS_EP implements the MHI protocol for the endpoint devices,
>>   	  such as SDX55 modem connected to the host machine over PCIe.
>> +
>> +source "drivers/bus/mhi/ep/clients/Kconfig"
>> diff --git a/drivers/bus/mhi/ep/Makefile b/drivers/bus/mhi/ep/Makefile
>> index aad85f180b707fb997fcb541837eda9bbbb67437..ab36ef2a40ab8174e5ddae44a3e6ccb8eb31168d 100644
>> --- a/drivers/bus/mhi/ep/Makefile
>> +++ b/drivers/bus/mhi/ep/Makefile
>> @@ -1,2 +1,3 @@
>>   obj-$(CONFIG_MHI_BUS_EP) += mhi_ep.o
>>   mhi_ep-y := main.o mmio.o ring.o sm.o
>> +obj-y += clients/
>> diff --git a/drivers/bus/mhi/ep/clients/Kconfig b/drivers/bus/mhi/ep/clients/Kconfig
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..4cf27184058ca2be020885b6f57b4cc44b5054b6
>> --- /dev/null
>> +++ b/drivers/bus/mhi/ep/clients/Kconfig
>> @@ -0,0 +1,16 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +
>> +config MHI_BUS_EP_LOOPBACK
>> +	tristate "MHI Endpoint LOOPBACK client driver"
>> +	depends on MHI_BUS_EP
>> +	help
>> +	  MHI Endpoint LOOPBACK client driver that binds to the MHI LOOPBACK
>> +	  channel as defined in the MHI specification. The LOOPBACK channel is
>> +	  implemented by MHI-based endpoint devices (modems, WLAN) in the field,
>> +	  where the endpoint firmware echoes back whatever the host sends.
>> +
>> +	  This driver receives data on the uplink channel and echoes it back on
>> +	  the downlink channel for testing the MHI endpoint data path.
>> +
>> +	  To compile this driver as a module, choose M here. The module
>> +	  will be called mhi_ep_loopback.
>> diff --git a/drivers/bus/mhi/ep/clients/Makefile b/drivers/bus/mhi/ep/clients/Makefile
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..71dc91cc63b02592b177cf66db6090748c0653a6
>> --- /dev/null
>> +++ b/drivers/bus/mhi/ep/clients/Makefile
>> @@ -0,0 +1,2 @@
>> +obj-$(CONFIG_MHI_BUS_EP_LOOPBACK) += mhi_ep_loopback.o
>> +mhi_ep_loopback-y += loopback.o
>> diff --git a/drivers/bus/mhi/ep/clients/loopback.c b/drivers/bus/mhi/ep/clients/loopback.c
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..05db91be6ffc5afe5a2022962410c96a7ec19962
>> --- /dev/null
>> +++ b/drivers/bus/mhi/ep/clients/loopback.c
>> @@ -0,0 +1,128 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#include <linux/mhi_ep.h>
>> +#include <linux/mod_devicetable.h>
>> +#include <linux/module.h>
>> +#include <linux/string.h>
>> +
>> +struct mhi_ep_loopback {
>> +	struct workqueue_struct *loopback_wq;
> s/loopback_wq/wq
>
>> +	struct mhi_ep_device *mdev;
>> +};
>> +
>> +struct mhi_ep_loopback_work {
>> +	struct mhi_ep_device *mdev;
>> +	struct work_struct work;
>> +	void *buf;
>> +	size_t len;
>> +};
>> +
>> +static void mhi_ep_loopback_work_handler(struct work_struct *work)
>> +{
>> +	struct mhi_ep_loopback_work *mhi_ep_lb_work = container_of(work,
>> +								struct mhi_ep_loopback_work, work);
>> +	int ret;
>> +
>> +	ret = mhi_ep_queue_buf(mhi_ep_lb_work->mdev, mhi_ep_lb_work->buf,
>> +			       mhi_ep_lb_work->len);
>> +	if (ret) {
>> +		dev_err(&mhi_ep_lb_work->mdev->dev, "Failed to send the packet\n");
> 'Failed to queue buffer'
>
>> +		kfree(mhi_ep_lb_work->buf);
>> +	}
>> +
>> +	kfree(mhi_ep_lb_work);
>> +}
>> +
>> +static void mhi_ep_loopback_ul_callback(struct mhi_ep_device *mhi_dev,
>> +					struct mhi_result *mhi_res)
>> +{
>> +	struct mhi_ep_loopback *mhi_ep_lb = dev_get_drvdata(&mhi_dev->dev);
>> +	struct mhi_ep_loopback_work *mhi_ep_lb_work;
>> +	void *buf;
>> +
>> +	if (!mhi_ep_lb)
>> +		return;
> Hmm. This seems similar to patch 1 race condition. But we do not have a EP
> specific API to stop a channel and flush the wq like
> mhi_ep_unprepare_from_transfer(). But you should add one and call it from
> remove().
mhi_ep_driver_remove() already does this before calling mhi_drv->remove():
        mutex_lock(&mhi_chan->lock);
       mhi_chan->xfer_cb(mhi_dev, -ENOTCONN);
       mhi_chan->state = MHI_CH_STATE_DISABLED;
       mhi_chan->xfer_cb = NULL;
       mutex_unlock(&mhi_chan->lock);

So by the time mhi_ep_loopback_remove() is entered, both channels are
already stopped and xfer_cb is NULL. A mhi_ep_unprepare_from_transfer()
call from remove() would be redundant.

The race with mhi_ep_read_completion() is handled by setting
dev_set_drvdata(NULL) before destroy_workqueue(), combined with the NULL
guard in ul_callback.

Please correct me if i am missing something here.

-Sumit
>
>> +
>> +	if (!mhi_res->transaction_status) {
>> +		if (!mhi_res->bytes_xferd)
>> +			return;
>> +
>> +		buf = kmemdup(mhi_res->buf_addr, mhi_res->bytes_xferd, GFP_KERNEL);
>> +		if (!buf)
>> +			return;
> Error log?
>
>> +
>> +		mhi_ep_lb_work = kmalloc(sizeof(*mhi_ep_lb_work), GFP_KERNEL);
>> +		if (!mhi_ep_lb_work) {
>> +			kfree(buf);
> Same here.
>
>> +			return;
>> +		}
>> +
>> +		INIT_WORK(&mhi_ep_lb_work->work, mhi_ep_loopback_work_handler);
>> +		mhi_ep_lb_work->mdev = mhi_dev;
>> +		mhi_ep_lb_work->buf = buf;
>> +		mhi_ep_lb_work->len = mhi_res->bytes_xferd;
>> +
>> +		queue_work(mhi_ep_lb->loopback_wq, &mhi_ep_lb_work->work);
>> +	}
>> +}
>> +
>> +static void mhi_ep_loopback_dl_callback(struct mhi_ep_device *mhi_dev,
>> +					struct mhi_result *mhi_res)
>> +{
>> +	kfree(mhi_res->buf_addr);
>> +}
>> +
>> +static int mhi_ep_loopback_probe(struct mhi_ep_device *mhi_dev, const struct mhi_device_id *id)
>> +{
>> +	struct mhi_ep_loopback *mhi_ep_lb;
>> +
>> +	mhi_ep_lb = devm_kzalloc(&mhi_dev->dev, sizeof(*mhi_ep_lb), GFP_KERNEL);
>> +	if (!mhi_ep_lb)
>> +		return -ENOMEM;
>> +
>> +	mhi_ep_lb->loopback_wq = alloc_ordered_workqueue("mhi_ep_loopback", WQ_MEM_RECLAIM);
>> +	if (!mhi_ep_lb->loopback_wq) {
>> +		dev_err(&mhi_dev->dev, "Failed to create workqueue.\n");
> nit: Remove fullstop at the end of error message.
>
>> +		return -ENOMEM;
>> +	}
>> +
>> +	mhi_ep_lb->mdev = mhi_dev;
>> +	dev_set_drvdata(&mhi_dev->dev, mhi_ep_lb);
>> +
>> +	return 0;
>> +}
>> +
>> +static void mhi_ep_loopback_remove(struct mhi_ep_device *mhi_dev)
>> +{
>> +	struct mhi_ep_loopback *mhi_ep_lb = dev_get_drvdata(&mhi_dev->dev);
>> +
>> +	destroy_workqueue(mhi_ep_lb->loopback_wq);
>> +	dev_set_drvdata(&mhi_dev->dev, NULL);
> As mentioned above, this should be dropped if you can ensure that xfer_cb()
> won't be called.
>
> - Mani
>

