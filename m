Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1C74FD7A5
	for <mhi@lists.linux.dev>; Mon, 12 Oct 2026 21:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791840929; cv=none; b=d0LjI+hTY4u47zvSj7CXya4JJYdpQ57wa4w6fg6jWGdrGJCQnPiU9aulwJRouydRFpr7X08hofjQrP8cXtTDwm083t8cMzP62ztRzJfRTQ/+DbIpARaw708ImqU/C7W2opR9RsvGK6z02NYkP3j3ytGcoNtp6w81xFHEOmQ/8Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791840929; c=relaxed/simple;
	bh=W2Trm/nICL8IpQWE3KSrb1Z1635z6pVvaf7pWexEYS4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E1DT7KYfq3Nt5nTn9Pua5ngiES1CaMgCm0arI+mU7p72op7MF8Ertj9hUHcT6cKodyRvgOrEXN2bLFLwJi2CysLBQ7nTwzlCMOkADo1c98HSR5Ii020xP/TEEEO8scldCsj1Wh8ve8RQkE0fNMIx5Y7gc44BZjyKdOkLLucX090=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g0h3LdSm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EsjDHDhU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g0h3LdSm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EsjDHDhU"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CJMn6e144077
	for <mhi@lists.linux.dev>; Mon, 12 Oct 2026 21:35:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9ksiK0T4L7o5SFNFytJEd7y68wkigvQZU6mjV4dVdPM=; b=g0h3LdSmFr4e3N4W
	kWFQe6Z72oW7bYJwcLrMoI5ic9/ZrLHhXclKmvQO9d8Fy40NhuW9un2UqIgeyn2m
	wjdooOi6odu+gbyxNLMT5pSu+kT5BtAGsufB2oyu5O4K0jytMzNg7DexMv7EI3mj
	IsNCo06gBtnrBVxWMKZeSy6cg+l4u/bKHEOm/K+w0NX/NFHesjvl7xF/9sdLGarg
	MJqspBr5k3SNcbIO5NSZSYXcgccBiYswuymKqUV++qA22acWHvTMUHg+wYAFxWOT
	6bbX3AJ/lq90VXxgVHE7fgKdA8o/2DnPivnM5AXgvQ4w1yeT/VHNXuwGc5APpV8C
	+WovyQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wdrawfp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 12 Oct 2026 21:35:24 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3510d0baf63so6536693eec.1
        for <mhi@lists.linux.dev>; Mon, 12 Oct 2026 14:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791840924; x=1792445724; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ksiK0T4L7o5SFNFytJEd7y68wkigvQZU6mjV4dVdPM=;
        b=EsjDHDhUADXTj9loctyNYzXZgy9DAncgrHjokfUyA12Xwsz5duy5mhK5cbaZ0q8OIY
         aPIc+olHW/loT3MnpovsFVRgPcIvYF27a1vplY9LJ50p+c6dQEaiWYLvSBgtTOwwXfkj
         NkWR56j6n0HoWvGa25EYavKsAiu7vQJEcTa7GCrtDg8akeM39RbKutE55ukNUMIMv1ID
         9Yf+YL0vRLlWsdDHaL4jt1WKznprXeISmsH98x3sNeJzDWfMPObRO+Qjl/JHrT0xZEE4
         XrRQo8kvMJbZ5kOVpx69dF2dAsLLijmqjuJ7ZOlioplbyF1mFu2Yo14RQp54BWJcDBLN
         kjOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791840924; x=1792445724;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ksiK0T4L7o5SFNFytJEd7y68wkigvQZU6mjV4dVdPM=;
        b=elMtsUvpFTmZbatJ5wzYdkr8LzhKAOPViGF2lCvd5Hai87A1EQrsaijPoeU2xZPxIa
         jga5NVoSbmo8XoQKlWdgkfm5uKn6JWh1vRhNPyom5H4z49dQNY7i225sMiUq49vp+Ehh
         XIPvLPT/npMLMk2eepIoAFHZISkMQ9dm4WhrU9IO/S9fnVDDGnMTit3pdPxqC+Cr+ukm
         imNIIXPF5+Q0dMJqO3DbqO3eiv+MrNz0/4+9zVYBRiPgW0U0lHEWe9GFnKaoARNz+UMI
         Znnd29evoAhlY8Xetwo8wB9xfqregXMW1udp5tvVPXlhflxkEFWDbU0FRpT7ydNCtn4a
         5W9g==
X-Forwarded-Encrypted: i=1; AKwUvBzE5YLx84dHIX4y41Pjjrsc7x9UPv7oqDMjqAdiAwddR2umfO5z6Ij+ZRZd0Zt6XdVmDhk=@lists.linux.dev
X-Gm-Message-State: AFq9FYI2L612qASXGmHcfboY54sbdOEoGVzgZOfW04GGbpqvHvPYg1v2
	cDH9iKAfmJo+1koiXvP6oAfqQ1i2c4o29kP0YMfoWV1EpHVqTywwOX2dWpACPkkIDQu4BLJS5aE
	6TlDS1e/SI83/DO7CQzABkQ98P5jO4PG7xScfva+V2J/yOVJUhoC+g1s=
X-Gm-Gg: AYBFou3JLOp42GrI2FO2Sf1ULf27KSM+1qeGZ+ub0IC6BlUOOtQyIIda1ATjRm+OPBv
	UxEPxW7lqjLgDyj8Vz6Ie+hi0Ovw2lJz22h265auSeiU42JeIEiuMBjPktI+Zm99D6yZfDgWZ0s
	JNNMmRk1VJO/iaBh9FPrdBpBNHXYqau16ItHNq9Yqd4elGUNyaccEmo3rIWja92cM31MSvwrrrA
	k6L+luoMeYSmRcwrx7m2G37IdWRQXWtcvebCUjXrs1f5mkrmeN30vM2LyM03gZ7YhgsK3cuybFG
	WspUkZZgxVY4sawCv1GhF5NNN4czZEpi12SfCaU4nK9kDsBPMpHxpW2jD+0p04qjr4+Je5faA4X
	HTD30JtCxx5gNja8ZqAtH67WGepv2jNcU9xd+ueCdN8POZUgyM4G8
X-Received: by 2002:a05:7022:1581:b0:151:2e62:fe89 with SMTP id a92af1059eb24-16a60812c7fmr20204145c88.32.1791840923462;
        Mon, 12 Oct 2026 14:35:23 -0700 (PDT)
X-Received: by 2002:a05:7022:1581:b0:151:2e62:fe89 with SMTP id a92af1059eb24-16a60812c7fmr20204104c88.32.1791840922795;
        Mon, 12 Oct 2026 14:35:22 -0700 (PDT)
Received: from [10.73.232.100] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a3f6186fsm34188115c88.14.2026.10.12.14.35.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 14:35:22 -0700 (PDT)
Message-ID: <2bf0a2e0-7466-4e90-b53d-f3fc0d26378c@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 14:35:20 -0700
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/7] bus: mhi: Move Sahara protocol driver under MHI
 host client drivers
To: Kishore Batta <kishore.batta@oss.qualcomm.com>,
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
Content-Language: en-US
From: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
In-Reply-To: <20261012-sahara_protocol_new_v2-v8-2-e12939d229a1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA4NiBTYWx0ZWRfXzo1AwTtCDxYZ
 AVZ43C9aED7RDLK1p3mj97Nb5ZTVDOXBStwJYisxZlmMct7Az47R+wMvsBs7aKXhXEWjjBP9SfV
 7JVIhrtmcetLwNui0P04QZkv+6Y09SQ0E/uSJyQZF+3/Qdk7tI4klPitLFi0y4E4jKBJHfw6dMQ
 YjoEPGU9ofzbRjlXWOXwErRULciKeL56oHdVBGHLvJMwCaAGfskwuIEK5YYpBuCrEKJjqEkoSDB
 obmU67bVlbdk90OdXCvFasfyj/929e346SQ1h6nfn77EUPoj7+fd/us4eNKi1X3hoZ5/cwaW+4Z
 GzIxunYNNlzTtn1w6yAfDgX5HsfjAKu8SdNUC3va9vKWB2nvA3AE1k7CvRybDlbQXfH7pNV/uLI
 2KxLffJuLM5jgnx7v4YSmiU92XF6HRiO50yj+c0fwNjwYv5Uv8wxBMNPrYCfCO+QRE/RDKRC8iY
 37Y3TuiNHYE1gQ8Rmsg==
X-Authority-Analysis: v=2.4 cv=SvAFe/O0 c=1 sm=1 tr=0 ts=6acd529c cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=EyST5JTptKXFtIIvUhkA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA4NiBTYWx0ZWRfX8WJnTldwIVec
 3PRabDEyLFTPRFPHNcJF/hpRVvonfa6eNsCuyabXtsNMJAGCOsiJ+bRFPlQlRZUoXVRYWqM+303
 MR9nCoZPlEa9tvnj+VoFdIEFqdENCJQ=
X-Proofpoint-ORIG-GUID: ccPk_nWSfLpLe4dHQpQTPT6g96kn9aKn
X-Proofpoint-GUID: ccPk_nWSfLpLe4dHQpQTPT6g96kn9aKn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_06,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1011 phishscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120086

On 10/12/2026 11:18 AM, Kishore Batta wrote:
> The Sahara protocol driver currently lives under the QAIC accelerator
> subsystem even though the protocol is transported over MHI and is used by
> multiple Qualcomm flashless devices. This makes Sahara appear QAIC specific
> and complicates reuse by other MHI based devices.
> 
> Move the Sahara protocol driver under drivers/bus/mhi as a host client
> driver and build it as an independent MHI protocol driver. This keeps the
> QAIC driver focused on the accelerator device while allowing other MHI
> users to enable Sahara without depending on QAIC.
> 
> As part of the move, add a dedicated Kconfig/Makefile hierarchy under the
> MHI host client drivers and convert the driver to use module_mhi_driver()
> instead of register/unregister hooks.
> 
> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
> ---
>  drivers/accel/qaic/Kconfig                          |  1 +
>  drivers/accel/qaic/Makefile                         |  3 +--
>  drivers/accel/qaic/qaic_drv.c                       |  9 ---------
>  drivers/accel/qaic/sahara.h                         | 10 ----------
>  drivers/bus/mhi/host/Makefile                       |  2 +-
>  drivers/bus/mhi/host/clients/Kconfig                |  6 ++++++
>  drivers/bus/mhi/host/clients/Makefile               |  1 +
>  drivers/bus/mhi/host/clients/sahara/Kconfig         | 15 +++++++++++++++
>  drivers/bus/mhi/host/clients/sahara/Makefile        |  2 ++
>  .../qaic => bus/mhi/host/clients/sahara}/sahara.c   | 21 ++++++++-------------
>  10 files changed, 35 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/accel/qaic/Kconfig b/drivers/accel/qaic/Kconfig
> index 116e42d152ca885b8c59e33c7a87519a0abc6bb3..af90fdfcf77eeb6dd5ad309b33d793d4fdc91b1e 100644
> --- a/drivers/accel/qaic/Kconfig
> +++ b/drivers/accel/qaic/Kconfig
> @@ -8,6 +8,7 @@ config DRM_ACCEL_QAIC
>  	depends on DRM_ACCEL
>  	depends on PCI && HAS_IOMEM
>  	depends on MHI_BUS
> +	depends on MHI_SAHARA
>  	select CRC32
>  	select WANT_DEV_COREDUMP
>  	help
> diff --git a/drivers/accel/qaic/Makefile b/drivers/accel/qaic/Makefile
> index 71f727b74da3bb4478324689f02a7cea24a05c2d..e7b8458800072aa627f7f36c3257883aa56f4ce4 100644
> --- a/drivers/accel/qaic/Makefile
> +++ b/drivers/accel/qaic/Makefile
> @@ -13,7 +13,6 @@ qaic-y := \
>  	qaic_ras.o \
>  	qaic_ssr.o \
>  	qaic_sysfs.o \
> -	qaic_timesync.o \
> -	sahara.o
> +	qaic_timesync.o
>  
>  qaic-$(CONFIG_DEBUG_FS) += qaic_debugfs.o
> diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
> index 0acf6cdd44f81430ec52c7120b8b50c60721a615..64e87dfaa560376ecdf1e6f8bf7abf6153160926 100644
> --- a/drivers/accel/qaic/qaic_drv.c
> +++ b/drivers/accel/qaic/qaic_drv.c
> @@ -32,7 +32,6 @@
>  #include "qaic_ras.h"
>  #include "qaic_ssr.h"
>  #include "qaic_timesync.h"
> -#include "sahara.h"
>  
>  MODULE_IMPORT_NS("DMA_BUF");
>  
> @@ -789,12 +788,6 @@ static int __init qaic_init(void)
>  		goto free_pci;
>  	}
>  
> -	ret = sahara_register();
> -	if (ret) {
> -		pr_debug("qaic: sahara_register failed %d\n", ret);
> -		goto free_mhi;
> -	}
> -
>  	ret = qaic_timesync_init();
>  	if (ret)
>  		pr_debug("qaic: qaic_timesync_init failed %d\n", ret);
> @@ -816,7 +809,6 @@ static int __init qaic_init(void)
>  
>  free_bootlog:
>  	qaic_bootlog_unregister();
> -free_mhi:
>  	mhi_driver_unregister(&qaic_mhi_driver);
>  free_pci:
>  	pci_unregister_driver(&qaic_pci_driver);
> @@ -845,7 +837,6 @@ static void __exit qaic_exit(void)
>  	qaic_ras_unregister();
>  	qaic_bootlog_unregister();
>  	qaic_timesync_deinit();
> -	sahara_unregister();
>  	mhi_driver_unregister(&qaic_mhi_driver);
>  	pci_unregister_driver(&qaic_pci_driver);
>  }
> diff --git a/drivers/accel/qaic/sahara.h b/drivers/accel/qaic/sahara.h
> deleted file mode 100644
> index 08037281c80e28f6c85b924c45ce2c2f9dc60c39..0000000000000000000000000000000000000000
> --- a/drivers/accel/qaic/sahara.h
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-only */
> -
> -/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. */
> -
> -#ifndef __SAHARA_H__
> -#define __SAHARA_H__
> -
> -int sahara_register(void);
> -void sahara_unregister(void);
> -#endif /* __SAHARA_H__ */
> diff --git a/drivers/bus/mhi/host/Makefile b/drivers/bus/mhi/host/Makefile
> index 2a16008aeb38127494782bbff4e1656428d2b776..2e8949f1a2fe6f3f3b2e1dc541f97d2c393d6a0f 100644
> --- a/drivers/bus/mhi/host/Makefile
> +++ b/drivers/bus/mhi/host/Makefile
> @@ -4,4 +4,4 @@ mhi-$(CONFIG_MHI_BUS_DEBUG) += debugfs.o
>  
>  obj-$(CONFIG_MHI_BUS_PCI_GENERIC) += mhi_pci_generic.o
>  mhi_pci_generic-y += pci_generic.o
> -obj-y += clients/
> +obj-$(CONFIG_MHI_BUS) += clients/
> diff --git a/drivers/bus/mhi/host/clients/Kconfig b/drivers/bus/mhi/host/clients/Kconfig
> index 8bb5715e61d0d6e64a51012b4e1594ba46e5bfc1..1932344157a5b1dc25c8d63f6d4ac38f896d08a7 100644
> --- a/drivers/bus/mhi/host/clients/Kconfig
> +++ b/drivers/bus/mhi/host/clients/Kconfig
> @@ -15,3 +15,9 @@ config MHI_BUS_LOOPBACK
>  
>  	  To compile this driver as a module, choose M here. The module
>  	  will be called mhi_loopback.
> +
> +menu "MHI host client drivers"
> +
> +source "drivers/bus/mhi/host/clients/sahara/Kconfig"
> +
> +endmenu
> diff --git a/drivers/bus/mhi/host/clients/Makefile b/drivers/bus/mhi/host/clients/Makefile
> index 3811b6928f42b38f94b1167941cf3b0fe512d32b..67e70de280369870164b4808f39d9b3340f2589b 100644
> --- a/drivers/bus/mhi/host/clients/Makefile
> +++ b/drivers/bus/mhi/host/clients/Makefile
> @@ -1,2 +1,3 @@
>  obj-$(CONFIG_MHI_BUS_LOOPBACK) += mhi_loopback.o
>  mhi_loopback-y += loopback.o
> +obj-$(CONFIG_MHI_SAHARA) += sahara/
> diff --git a/drivers/bus/mhi/host/clients/sahara/Kconfig b/drivers/bus/mhi/host/clients/sahara/Kconfig
> new file mode 100644
> index 0000000000000000000000000000000000000000..f1fc7013a2dee0be645c50f32305659e591de7e7
> --- /dev/null
> +++ b/drivers/bus/mhi/host/clients/sahara/Kconfig
> @@ -0,0 +1,15 @@
> +config MHI_SAHARA
> +	tristate "Sahara protocol driver"
> +	depends on MHI_BUS
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
> diff --git a/drivers/bus/mhi/host/clients/sahara/Makefile b/drivers/bus/mhi/host/clients/sahara/Makefile
> new file mode 100644
> index 0000000000000000000000000000000000000000..fc02a25935011cbd7138ea8f24b88cf5b032a4ce
> --- /dev/null
> +++ b/drivers/bus/mhi/host/clients/sahara/Makefile
> @@ -0,0 +1,2 @@
> +obj-$(CONFIG_MHI_SAHARA) += mhi_sahara.o
> +mhi_sahara-y := sahara.o
> diff --git a/drivers/accel/qaic/sahara.c b/drivers/bus/mhi/host/clients/sahara/sahara.c
> similarity index 99%
> rename from drivers/accel/qaic/sahara.c
> rename to drivers/bus/mhi/host/clients/sahara/sahara.c
> index c7c0b3eb4b65fb7776a6c724cb3105046cf6f7eb..dc64beae06ada6915a506ed8f4ae4d71c03158bb 100644
> --- a/drivers/accel/qaic/sahara.c
> +++ b/drivers/bus/mhi/host/clients/sahara/sahara.c
> @@ -1,19 +1,20 @@
>  // SPDX-License-Identifier: GPL-2.0-only
> -
> -/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. */
> +/*
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + *
> + */

Never delete the copyright lines please.  Is there any previous discussion on why we are doing it? 

---Trilok Soni

