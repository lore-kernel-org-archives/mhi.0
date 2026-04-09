Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21F233E351
	for <mhi@lists.linux.dev>; Thu,  9 Apr 2026 20:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775766010; cv=none; b=s8a/9W3TAwCPkASe2mSWxNzNHGIEKZ6N+yIehDOhSMjk67RuBEi7AO6n+odyL+YJ7VILsBdWZQ7+7j3AHvqEWcmreEMS//FZifiZKR2R6FZHVkqSHg4KHtpNQSrh5DoVI+VGk37mxAKlBqYsEN8i1o7MlOqxib4WKBWl1K2v8Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775766010; c=relaxed/simple;
	bh=S+q40gG40+NUZNOSZ2uIZTxXET/mFx6Xy0KKm0y23Ts=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AjR6F9YJXtMCLjexH/EEK06ZKo9RlSeFPW9qOkUjna6kzz3CmiPVcZjf08OgFUT7bbaYc8ZPkTq3XSuPuFZ4e2TIPz27qE/daJwPGjAJ3wsae3WyBflbU2fTs3QLzElwzAUYZs7msiwni3jW3moTKnSpWy1O39Ta5/+NR/sSGpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PxUzx8To; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DjA5lHvY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PxUzx8To";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DjA5lHvY"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639EqjL2115045
	for <mhi@lists.linux.dev>; Thu, 9 Apr 2026 20:20:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XGZaqfqEzO+/hDjbxaHef3zkJZ++VUfNhigynidW4X0=; b=PxUzx8ToDQhoK1Be
	IGU+KqUqBw99BU4FFGeUf9SIOYzMM2vHaItFSklYh6ZH6h0EyWgyjDK3AicWVuDk
	4oJ5ScRtSvJT+457O3v7toxLjh0VgtmtxYh9CxI6LVVH7nmB8GhLR7xC4vK+Y9aO
	XoQOXD85sg3/dXxr/6GOmplHVlFvsTyWpiTwCxiY0r48jhKQh21dKB5PxXVkdVLy
	PYSt2z3rB5u9QORFtvo75s5/1TGCwUjZatAZWy7lOsOzODd5mApKDPA+wrHk6SPa
	rBHujfdtdbOYLJwwHGUa851injEWAOPCAsLRVajoMcxKY2fq3jpf8S4kUuAGwG9q
	XviMsQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dee8x9571-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 09 Apr 2026 20:20:06 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2bdc1b30ac8so5224621eec.1
        for <mhi@lists.linux.dev>; Thu, 09 Apr 2026 13:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775766006; x=1776370806; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XGZaqfqEzO+/hDjbxaHef3zkJZ++VUfNhigynidW4X0=;
        b=DjA5lHvYL/xk8GawmvU2PpeCjb3FcsxlNdJgzlTw8bvNXQcoLVb5kcIGocUxYpmJL+
         yZ2JDB9mXmoAcUoB+nVTB6cwCjyquciu2g4ON0nXkkVsCd582XtiQZM8EERW4n9wBssA
         KzEeQ0GV2pdquYprDTXHJPiu0xi/BoESEbIIVs8CBb7+7g8VK9bB4xfUpIm60niFDtnG
         n4sw5sjDKTm3ssVbEjIb+Ob6kseCavDqUEZzytFQgLB5LFC16NL9M+nwITVoidVNlPw1
         CtpIAL9kMowN8havKTSQiPhu8KSNodBpOGDQ2zDHKzeiJbWAGu4/p91uOPZ0kdgMMrA1
         fC9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775766006; x=1776370806;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XGZaqfqEzO+/hDjbxaHef3zkJZ++VUfNhigynidW4X0=;
        b=hoV6uRgT8lo6uFqfl9RFCkIJkwKHo1XokC50rUFq/vfc0ww/GT9X7gAaD3aLHUQ2+u
         rGM5Zj5DEr0IRQzFcl5plhaaA0QlrZsl0H0cfMeGTAwYueCcDf4Qn3v1lFemWP9GtzrM
         PsKjyy9fDsA1DX5k0a8quDybr8X3zwUpz8efu671kqhuKghJcIRObA0TMr860ZCfc1v2
         2mxtq4FnstYmJQgVrMpRz7NiGzibeMYMHhHYrFcFnfAqmruIjlPpQ9r6jC7j9V7ffiTZ
         aqPBZ6AH8Be4DCUw7BXs3LodmYxumgB6sPLtHswkobzpiXp2CibtZyUFIs04cpF5EnXI
         hdXA==
X-Forwarded-Encrypted: i=1; AJvYcCVSzD8Mv07HmRJQzDj2jgnBfBENwJEiBLbNdEcWCdSN7geqKyvxouKkJevQE8IRSbYVeic=@lists.linux.dev
X-Gm-Message-State: AOJu0YxCLHasenZRVI2k9IDbAgSk24IoVK73uL3vbjqXWe36GSMMIZgt
	eGyu2Pocq5EaMuEPV+9wlugBBXQ2u2Dobo2V6vV1t2aCOyo0mRu7NNoMFcAedId5MuPhm32SKAV
	HsXahimvFfe4lDfZ14mJ6+uOJFvYHqk7k4VogsHMSm3BX6mJVtMXsZl8=
X-Gm-Gg: AeBDiesVBf7orP6VTqTRFG3bLnqZw1gtnfJ1/jZn8L3uJLpXW/VpUq7avQFpP6Xb8/T
	U2dAx+iFL1Ywp8vR+CN6VvcZJ0BNdomTbChuqCSK88mBjClMSfTOS5qinnP+ljxn01fe36AQsCb
	iTQsQq9WgGMIuchJhdtqIBrT8Kdxjqb+XpHDJmEsTtDT8BoUce5hY33FxsnQJ6fJ5D59kGQI/PC
	qyaPzziShQL/Sjasst8fuLjnOqYip58/+8oS0eqIEy+CYmFomqJ7VDnJKF3sk+iAmsKvNB3ryeW
	job0Kjn0auLQWVKfpLSYVGEfEbrAB1RNDdRZ+OlMxFEhLZUK6mJdqkByc6A3/f79c7E4eqO5PJW
	dkF4GTxSbFTvuFWgEKYwzqFIlysQpkId7IYmSkbr4J+Y0GxuEDJ+3b29hf4RKQfXGKwGOM/6ayo
	k=
X-Received: by 2002:a05:7301:1f10:b0:2d3:2983:c895 with SMTP id 5a478bee46e88-2d5879944aamr347636eec.7.1775766005550;
        Thu, 09 Apr 2026 13:20:05 -0700 (PDT)
X-Received: by 2002:a05:7301:1f10:b0:2d3:2983:c895 with SMTP id 5a478bee46e88-2d5879944aamr347608eec.7.1775766004904;
        Thu, 09 Apr 2026 13:20:04 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d562db6ac8sm1145878eec.26.2026.04.09.13.20.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 13:20:04 -0700 (PDT)
Message-ID: <0a2af0d1-27da-4f60-952a-409a5abc5647@oss.qualcomm.com>
Date: Thu, 9 Apr 2026 14:20:02 -0600
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/9] bus: mhi: Move sahara protocol driver under
 drivers/bus/mhi
To: Kishore Batta <kishore.batta@oss.qualcomm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, andersson@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev
References: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
 <20260319-sahara_protocol_new_v2-v4-2-47ad79308762@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20260319-sahara_protocol_new_v2-v4-2-47ad79308762@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE4NiBTYWx0ZWRfX/Dm6dTE/rqtn
 jZv6f+ha5Uo47RwD0B3ciXi0Y4Ofv6TnoprEuiUdmUXuBYKArhckqsfMvC5c2rBYznP9KOWyujy
 3KUFdLrXtIEhL/BBbj07LkVi7o30XwYW+cwHb91pUcSaVue1lnqIblcx08rnRtAX2ELlfF9LoSC
 n3hRoQPjdEjOVMoueUycef87TDgY4tB643VYWhPIDl7mcMOMeoVlv4M4aPaMeOzwotTidUjX2xf
 mdFgjqx80pnsIK+8xqKEqdPGFiWw8nMo6gDZHIXvNtpT68T3jwy5ORbYnr5bVSMrE4i02Rur52Q
 Vyt+Nnl3V8arb7NWf4vj6k3z7Q11lllxdcFpdmWGCM12zob5PJdHmVrhUwWJl4CQT3Q5X6fmUfC
 DiSmvfhCgkMR5dV1Y3oK0BfFHF5yBlsYcSMU6AQBXFPphKiC00t0EOHvsQePOQyavmRzh858iqZ
 kdTds+A7svpJJPI3DFA==
X-Proofpoint-GUID: WyCd5SXo8gjp2q3WgjRhsbwJHZ6QVYlh
X-Proofpoint-ORIG-GUID: WyCd5SXo8gjp2q3WgjRhsbwJHZ6QVYlh
X-Authority-Analysis: v=2.4 cv=O7YJeh9W c=1 sm=1 tr=0 ts=69d809f6 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=i-BP5fTv2L-2S3ZuYlQA:9 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090186

On 3/19/2026 12:31 AM, Kishore Batta wrote:
> The Sahara protocol driver is currently located under the QAIC
> accelerator subsystem even though protocol itself is transported over the
> MHI bus and is used by multiple Qualcomm flashless devices.
> 
> Relocate the Sahara protocol driver to drivers/bus/mhi and register it as
> an independent MHI protocol driver. This avoids treating Sahara as QAIC
> specific and makes it available for reuse by other MHI based devices.
> 
> As part of this move, introduce a dedicated Kconfig and Makefile under the
> MHI subsystem and expose the sahara interface via a common header.

I don't think this belongs under MHI. Mani needs to confirm that he 
agrees with the concept of moving this there.

The Sahara protocol as defined by the spec does not require MHI. We know 
that there are Sahara implementations over USB. I don't see a dependency 
or relationship to MHI other than the current in-kernel implementation 
uses MHI, but there are plenty of things that use MHI (qaic, mhi-net, 
ath12k, etc) which are not a part of the MHI bus.

The implementation presented in this series is not well integrated into 
MHI, which also suggests to me that it doesn't belong there. The 
Documentation is not integrated with MHI (which I mentioned over on that 
patch) and I see the header file (sahara.h) is also not integrated.

> diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
> index 63fb8c7b4abcbe4f1b76c32106f4e8b9ea5e2c8e..76cc8086825e7949ed756d51fcb56a08f392d228 100644
> --- a/drivers/accel/qaic/qaic_drv.c
> +++ b/drivers/accel/qaic/qaic_drv.c
> @@ -15,6 +15,7 @@
>   #include <linux/msi.h>
>   #include <linux/mutex.h>
>   #include <linux/pci.h>
> +#include <linux/sahara.h>

What do we need this for? register()/unregister() get removed.

>   #include <linux/spinlock.h>
>   #include <linux/workqueue.h>
>   #include <linux/wait.h>
> @@ -32,7 +33,6 @@
>   #include "qaic_ras.h"
>   #include "qaic_ssr.h"
>   #include "qaic_timesync.h"
> -#include "sahara.h"
>   
>   MODULE_IMPORT_NS("DMA_BUF");
>   
> @@ -782,18 +782,12 @@ static int __init qaic_init(void)
>   	ret = pci_register_driver(&qaic_pci_driver);
>   	if (ret) {
>   		pr_debug("qaic: pci_register_driver failed %d\n", ret);
> -		return ret;
> +		goto free_pci;

This is wrong, and there should not be a change here.

>   
>   	ret = mhi_driver_register(&qaic_mhi_driver);
>   	if (ret) {
>   		pr_debug("qaic: mhi_driver_register failed %d\n", ret);
> -		goto free_pci;
> -	}
> -
> -	ret = sahara_register();
> -	if (ret) {
> -		pr_debug("qaic: sahara_register failed %d\n", ret);
>   		goto free_mhi;

This is also wrong

>   
> @@ -847,7 +841,6 @@ static void __exit qaic_exit(void)
>   	qaic_ras_unregister();
>   	qaic_bootlog_unregister();
>   	qaic_timesync_deinit();
> -	sahara_unregister();
>   	mhi_driver_unregister(&qaic_mhi_driver);
>   	pci_unregister_driver(&qaic_pci_driver);
>   }
> diff --git a/drivers/bus/mhi/Kconfig b/drivers/bus/mhi/Kconfig
> index b39a11e6c624ba00349cca22d74bd876020590ab..4acedb886adccc6f76f69c241d53106da59b491f 100644
> --- a/drivers/bus/mhi/Kconfig
> +++ b/drivers/bus/mhi/Kconfig
> @@ -7,3 +7,4 @@
>   
>   source "drivers/bus/mhi/host/Kconfig"
>   source "drivers/bus/mhi/ep/Kconfig"
> +source "drivers/bus/mhi/sahara/Kconfig"
> diff --git a/drivers/bus/mhi/Makefile b/drivers/bus/mhi/Makefile
> index 354204b0ef3ae4030469a24a659f32429d592aef..e4af535e1bb1bc9481fae60d7eb347700d2e874c 100644
> --- a/drivers/bus/mhi/Makefile
> +++ b/drivers/bus/mhi/Makefile
> @@ -3,3 +3,6 @@ obj-$(CONFIG_MHI_BUS) += host/
>   
>   # Endpoint MHI stack
>   obj-$(CONFIG_MHI_BUS_EP) += ep/
> +
> +# Sahara MHI protocol
> +obj-$(CONFIG_MHI_SAHARA) += sahara/
> diff --git a/drivers/bus/mhi/sahara/Kconfig b/drivers/bus/mhi/sahara/Kconfig
> new file mode 100644
> index 0000000000000000000000000000000000000000..3f1caf6acd979a4af68aaf0e250aa54762e8cda5
> --- /dev/null
> +++ b/drivers/bus/mhi/sahara/Kconfig
> @@ -0,0 +1,18 @@
> +config MHI_SAHARA
> +	tristate
> +	depends on MHI_BUS
> +	select FW_LOADER_COMPRESS

Why are we selecting this? I don't see anyone else doing this. Sahara 
should work with and without firmware compression.

> +	select FW_LOADER_COMPRESS_XZ
> +	select FW_LOADER_COMPRESS_ZSTD
> +	help
> +	  Enable support for the Sahara protocol transported over the MHI bus.
> +
> +	  The Sahara protocol is used to transfer firmware images, retrieve
> +	  memory dumps and exchange command mode DDR calibration data between
> +	  host and device. This driver is not tied to a specific SoC and may be
> +	  used by multiple MHI based devices.
> +
> +	  If unsure, say N.
> +
> +	  To compile this driver as a module, choose M here: the module will be
> +	  called mhi_sahara.
> diff --git a/drivers/bus/mhi/sahara/Makefile b/drivers/bus/mhi/sahara/Makefile
> new file mode 100644
> index 0000000000000000000000000000000000000000..fc02a25935011cbd7138ea8f24b88cf5b032a4ce
> --- /dev/null
> +++ b/drivers/bus/mhi/sahara/Makefile
> @@ -0,0 +1,2 @@
> +obj-$(CONFIG_MHI_SAHARA) += mhi_sahara.o
> +mhi_sahara-y := sahara.o
> diff --git a/drivers/accel/qaic/sahara.c b/drivers/bus/mhi/sahara/sahara.c
> similarity index 99%
> rename from drivers/accel/qaic/sahara.c
> rename to drivers/bus/mhi/sahara/sahara.c
> index fd3c3b2d1fd3bb698809e6ca669128e2dce06613..8ff7b6425ac5423ef8f32117151dca10397686a8 100644
> --- a/drivers/accel/qaic/sahara.c
> +++ b/drivers/bus/mhi/sahara/sahara.c
> @@ -1,6 +1,8 @@
> -// SPDX-License-Identifier: GPL-2.0-only
> -
> -/* Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved. */
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
> + *
> + */

What makes you think that changing the copyright markings is appropiate 
when moving a file?

Furthermore, I wrote this code from scratch based on the spec document 
and therefore know beyond a doubt that this file did not exist prior to 
2024, so what you are changing the markings to is completely invalid.

Also the SPDX marking you are using is long deprecated and should not be 
used.

>   #include <linux/devcoredump.h>
>   #include <linux/firmware.h>
> @@ -9,12 +11,11 @@
>   #include <linux/minmax.h>
>   #include <linux/mod_devicetable.h>
>   #include <linux/overflow.h>
> +#include <linux/sahara.h>
>   #include <linux/types.h>
>   #include <linux/vmalloc.h>
>   #include <linux/workqueue.h>
>   
> -#include "sahara.h"
> -
>   #define SAHARA_HELLO_CMD		0x1  /* Min protocol version 1.0 */
>   #define SAHARA_HELLO_RESP_CMD		0x2  /* Min protocol version 1.0 */
>   #define SAHARA_READ_DATA_CMD		0x3  /* Min protocol version 1.0 */
> @@ -928,8 +929,13 @@ int sahara_register(void)
>   {
>   	return mhi_driver_register(&sahara_mhi_driver);
>   }
> +module_init(sahara_register);
>   
>   void sahara_unregister(void)
>   {
>   	mhi_driver_unregister(&sahara_mhi_driver);
>   }
> +module_exit(sahara_unregister);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("Qualcomm Sahara MHI protocol driver");
> diff --git a/drivers/accel/qaic/sahara.h b/include/linux/sahara.h
> similarity index 100%
> rename from drivers/accel/qaic/sahara.h
> rename to include/linux/sahara.h
> 

