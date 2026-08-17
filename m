Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69AAA43F085
	for <mhi@lists.linux.dev>; Mon, 17 Aug 2026 20:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786997693; cv=none; b=DCFdmZ+0ghOjmD2Qb4txMFtJilldVYuBX8hb7PbLn6oINusKimhBiFLiG4LpQWB8qzp6b5qzXH9Yf/uHwfqtiQJQiBupjZU/b/kUCRyH++GCaV9MMd+/t09R2mIWhEeweh6ZDH/jkVnLgoxFpirhJ0jwKzMXTYA7Ya+XEo6urlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786997693; c=relaxed/simple;
	bh=0p5U2mZ9pFGL+cVxKO+d4T7B5DEZxK2XBgxHmp+6t5Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tYbnVHHulRX2dtt6Esolmp9A6khsY8VpRUvRyvJowoodVo7ikGITIR7JIMWW7M1QbAlHhTfrWxacltxeaU/gOFlCNQt6SXBv0zZh+ZfL98HAWbuDQlx93Smx/lwGEPxD9EOGcayFFFe4Ebz/vTWYINBanNn98YeGDkDe8zlrhYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BNgCGo7U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T1QI8kO8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BNgCGo7U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T1QI8kO8"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HIRYdX1909575
	for <mhi@lists.linux.dev>; Mon, 17 Aug 2026 20:14:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u3lGwKZ0pCeF54C056iWA8ghYAbCCtaH8ropmAW0y5A=; b=BNgCGo7Un+ByFUnD
	5Oh3jF0sPvxVzWUTOqAgr8lHlQSWzmR7ImIeTzz/Nho0YOtfHCnM7uV8UR+hBuxA
	a2Bp4kO34kUjnQqTZedrFmGGxDGvsmkoINOncJclGFh1126oEZo22C4TOIgq6OXc
	KRVhMxFy7pQICl4okZ8aVAiwXlklpYs0UZPnD4jZemsYxD5bCpV6lLZGiXel7ARW
	FbLRowLENdn38C3ZES/C3X9LEvd2tiNg7EKdM4sdecRXR8p0LL7PuPnNAhHFUVE+
	lQ4yqFGgMx3ePGtuHFIkr6UEzqj2cdev7zawTWqbo+YLsngbcNfHcf3FDrQaMXjr
	s2kNZA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3wke37a5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 17 Aug 2026 20:14:50 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cab048cdb3eso4420322a12.0
        for <mhi@lists.linux.dev>; Mon, 17 Aug 2026 13:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786997689; x=1787602489; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u3lGwKZ0pCeF54C056iWA8ghYAbCCtaH8ropmAW0y5A=;
        b=T1QI8kO8NQDL+8omucUck6K03RjNVn8tMXhVJnOKA5Wt3K2KEyHlTWsI/2/R+xS0jo
         jK18F2H+Nqxb4YSboZ93Z0kmEjvP7UKI4xNO7BpxRWmRiJZoeHLf6Wos74Jjegrz55Qa
         X4id9J6sBlP6ZiUkA7u4j6SYK6T7MELVraJH+ToD7xGHajNeVfy3fM8zwSkoEqYkWlOn
         tOjZmaOcIvzXkHN1LXsc/JlQuzV6nxQzWStalldah6OeE6OJIQz+RPiHdpyE8Mez+ogv
         cIDWh3yDD4YFJlSEFSmEpM/cyXF5BFrGLheh0GDWEa9dfgwfHYHb4vIB2j4csQOVuVCB
         2nCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786997689; x=1787602489;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u3lGwKZ0pCeF54C056iWA8ghYAbCCtaH8ropmAW0y5A=;
        b=H2VzuojQkQxEpNXuxXTMoHVzAsKjMrFyYjpORXLx9mSgAK4QKRRrTvzDPmRlyZhxRS
         IpvwDPHqj0n2D1ViRWkh+FXcJRKGFLY27e4TryTXv3a8P68ymFD4Svmyh2QKJGitbAX4
         NCsh3vwQcKfuGgXqteAfLyqzjglZqBKApJfeJwCZGP2LHytUYlTlsfboc4pSLvfAJVUb
         rgpJBtSunblnbWMB2fhjCVhIVXqvtLnJ/J6NzqY+VmWdCVtxc5M34qTeTzijLNMj3xLk
         vPGpbcE/qzowuU7Az4Haqjf+MtwW6Bnczb1M7cl3x3LZTRehWPNd9R7jl0oLDfVrU1Dn
         uPdw==
X-Gm-Message-State: AOJu0YzbIgmh8w9dtdC5I6JizBLp3OA/qfELrg5ciEEKzhiFwZjr9mxa
	bVLXPUnsFysYUPRr8IkuDCHHq8EDv8Qpoi8ua8LcDYpXoMNrAm1afYeKXTIdV3yY1ck8Rl73SZm
	bjmaJLMcKBaqJjv4C4ZpLyK4v5eKPlLiCXTYkFytVNE7uX4ZDNTxS77I=
X-Gm-Gg: AR+sD10EPqm87BFnP48un4mn8Z/GraTZ0DNXAXKVihXXqwI8Qseh1P8xvuVqiZ5GsOF
	kU6mEH0Wrmre1ec28osFnNVIYMNgmBDlB/46FW+fXQ22/RQUsOwai0SF0OfTnW7hPiP0DP05mUB
	oFJKRXYtmRR0D75sB1zS9a7d04lDlbwST6FXEGdwR7FyMvXD1hHuecX46khN99B4bUqVpH1wkDM
	vBmY97DdWVXqP/VawsHKWqzGiJg/LPAZsFbAywDGt82vKvYvpjY3mHN2WnqXFM7fDqbbwSpQLXA
	m7Ad7Hh5df2OuKxR19YgSX494HE35893+HGSDC567FiCT7RSNmRj9GNWB/pASRQT8bpptOsvXU5
	3zDO/05TFVKu16VaX9mYdeSh9E3UHHh+rEk9YgydKAVk8kDbebuw5Ig==
X-Received: by 2002:a05:6a21:3a48:b0:3c3:b57b:6291 with SMTP id adf61e73a8af0-3ccdac00616mr3098095637.18.1786997688847;
        Mon, 17 Aug 2026 13:14:48 -0700 (PDT)
X-Received: by 2002:a05:6a21:3a48:b0:3c3:b57b:6291 with SMTP id adf61e73a8af0-3ccdac00616mr3098013637.18.1786997688236;
        Mon, 17 Aug 2026 13:14:48 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1415315900csm9043579c88.11.2026.08.17.13.14.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 13:14:47 -0700 (PDT)
Message-ID: <1b5301df-3d0a-497b-823d-fe43a34a5ee6@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 14:14:46 -0600
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] bus: mhi: host: clients: Add loopback driver with
 sysfs interface
To: Sumit Kumar <sumit.kumar@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
References: <20260817-loopback_mhi-v5-0-50efc7360b7f@oss.qualcomm.com>
 <20260817-loopback_mhi-v5-1-50efc7360b7f@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20260817-loopback_mhi-v5-1-50efc7360b7f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDE1NCBTYWx0ZWRfXz94ZfPwG/M99
 Aq6IW2+WSwq4dxzTZS+25DyBk8vUcAkPUi+dR6kgkybpk680qUMlMpaYXWyYsTvz9IHPpeOlhQS
 Inj4rljTwYSX8mPXIiD5ClxWVZzspkvvUvwp2KASP8XStg0/7aQh4HwDwblorEtZGyZ9WWMn3G1
 6wmgwm1NFUnZ2cMD2f9lnK4t5b9yJvEelRROWuYQhb8PW0kpxYLY4pZiWWeHpiU869sbgjwJYG4
 6mHRb28vXNthvHx28qzNb02N2jIq8FEJac8yABkAOXU8nW9ueDrcS7WOQjFCgrZJLBGXNf2WfPQ
 0QoH1QkpnF3UzNFMlvYS+ZrN9K1+ZqAFJojZnsdgvEA63Bu5nidNtSuWkhprqjLT/I5lLEQcZC7
 r62IcnKc55gMW9gCpUy/NyQ9z2288Fry+hPZcpwIo9zWxnQMCAa3VfZjpeCIfv8ysDQam15asO/
 WV7u2t99smTxpYWNHzQ==
X-Authority-Analysis: v=2.4 cv=QetWeMbv c=1 sm=1 tr=0 ts=6a836bba cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=a58Mu5QqHWmLOZgColsA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: bWqqBOI7t28y0CKQi6c8xjBBdKu7FT8l
X-Proofpoint-GUID: bWqqBOI7t28y0CKQi6c8xjBBdKu7FT8l
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDE1NCBTYWx0ZWRfXxhGsODzDQZ0z
 HTbLoulftufJeONAM4gqBN9tG9S4YF6qjRmvMN44ogH+9otI85cm9PzdLolBETAGs+BJwsPtyR+
 1JUVP99lAv0r2SBPB+pLmeNYfhQEL3o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170154

On 8/17/2026 4:14 AM, Sumit Kumar wrote:
> The MHI specification defines a LOOPBACK channel. The endpoint firmware
> echoes back whatever the host sends on this channel. Without a host-side
> driver, there is no way to exercise this channel to validate MHI data path
> integrity between host and endpoint.
> 
> Add a host-side loopback driver that binds to the LOOPBACK channel and
> expose a sysfs interface for data path testing. The sysfs interface allows
> users to configure TRE buffer size and count, trigger a loopback test, and
> read the result.
> 
> Co-developed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
> ---
>   .../ABI/testing/sysfs-bus-mhi-devices-loopback     |  39 +++
>   MAINTAINERS                                        |   1 +
>   drivers/bus/mhi/host/Kconfig                       |   1 +
>   drivers/bus/mhi/host/Makefile                      |   1 +
>   drivers/bus/mhi/host/clients/Kconfig               |  17 ++
>   drivers/bus/mhi/host/clients/Makefile              |   2 +
>   drivers/bus/mhi/host/clients/loopback.c            | 289 +++++++++++++++++++++
>   7 files changed, 350 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-mhi-devices-loopback b/Documentation/ABI/testing/sysfs-bus-mhi-devices-loopback
> new file mode 100644
> index 0000000000000000000000000000000000000000..1622a146110c2069c8b51e5bdf665c882b853303
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-bus-mhi-devices-loopback
> @@ -0,0 +1,39 @@
> +What:		/sys/bus/mhi/devices/mhi<N>_LOOPBACK/tre_size
> +Date:		August 2026
> +KernelVersion:	7.2

This series missed 7.2, and will miss 7.3 since the merge window is 
already open.  Next oppertunity is 7.4.

> +Contact:	mhi@lists.linux.dev
> +Description:
> +		(RW) Size of each Transfer Ring Element (TRE) buffer in bytes
> +		used for the loopback test. Valid range is 1 to the value
> +		reported by max_tre_size. Default value is 32 bytes.
> +
> +What:		/sys/bus/mhi/devices/mhi<N>_LOOPBACK/max_tre_size
> +Date:		August 2026
> +KernelVersion:	7.2
> +Contact:	mhi@lists.linux.dev
> +Description:
> +		(RO) Maximum allowed TRE size in bytes. Reading this file

Entry before this and after this explains the TRE acronym, but this does 
not.  It probably should, as someone may jump directly to this section 
and not read the entire document start to finish.

> +		returns the upper bound for the tre_size attribute.
> +
> +What:		/sys/bus/mhi/devices/mhi<N>_LOOPBACK/num_tre
> +Date:		August 2026
> +KernelVersion:	7.2
> +Contact:	mhi@lists.linux.dev
> +Description:
> +		(RW) Number of Transfer Ring Elements (TREs) to use per
> +		loopback test. Must be greater than zero and must not exceed
> +		the channel ring capacity. Default value is 1.

How would I know the channel ring capacity?  Should I just try values 
until I get an error?

> +
> +What:		/sys/bus/mhi/devices/mhi<N>_LOOPBACK/start
> +Date:		August 2026
> +KernelVersion:	7.2
> +Contact:	mhi@lists.linux.dev
> +Description:
> +		(WO) Write any value to trigger a loopback test. The driver
> +		sends random data to the endpoint using the configured tre_size

It feels like these kind of interfaces usually give an option to specify 
a byte pattern as well, but I don't see that option here.  Is random 
data considered to cover all usecases?

> +		and num_tre parameters, waits for the endpoint to echo it back,
> +		and verifies the received data matches what was sent.
> +
> +		This is a blocking write that returns when the test completes
> +		or times out after 5 seconds. The write returns an error code
> +		if the test fails or times out.
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a4b89bd497ad5051c190025838e0e93d257ed061..098b12692140514da52565a3200801f5e24a43b7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17469,6 +17469,7 @@ L:	linux-arm-msm@vger.kernel.org
>   S:	Maintained
>   T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git
>   F:	Documentation/ABI/stable/sysfs-bus-mhi
> +F:	Documentation/ABI/testing/sysfs-bus-mhi-devices-loopback

Commit text says this ABI is stable.  Seems odd its being added to testing.

>   F:	Documentation/mhi/
>   F:	drivers/bus/mhi/
>   F:	drivers/pci/endpoint/functions/pci-epf-mhi.c
> diff --git a/drivers/bus/mhi/host/Kconfig b/drivers/bus/mhi/host/Kconfig
> index da5cd0c9fc620ab595e742c422f1a22a2a84c7b9..627c57948235aa52348179ae8b2d0826ebaed01e 100644
> --- a/drivers/bus/mhi/host/Kconfig
> +++ b/drivers/bus/mhi/host/Kconfig
> @@ -29,3 +29,4 @@ config MHI_BUS_PCI_GENERIC
>   	  This driver provides MHI PCI controller driver for devices such as
>   	  Qualcomm SDX55 based PCIe modems.
>   
> +source "drivers/bus/mhi/host/clients/Kconfig"
> diff --git a/drivers/bus/mhi/host/Makefile b/drivers/bus/mhi/host/Makefile
> index 859c2f38451c669b3d3014c374b2b957c99a1cfe..2a16008aeb38127494782bbff4e1656428d2b776 100644
> --- a/drivers/bus/mhi/host/Makefile
> +++ b/drivers/bus/mhi/host/Makefile
> @@ -4,3 +4,4 @@ mhi-$(CONFIG_MHI_BUS_DEBUG) += debugfs.o
>   
>   obj-$(CONFIG_MHI_BUS_PCI_GENERIC) += mhi_pci_generic.o
>   mhi_pci_generic-y += pci_generic.o
> +obj-y += clients/
> diff --git a/drivers/bus/mhi/host/clients/Kconfig b/drivers/bus/mhi/host/clients/Kconfig
> new file mode 100644
> index 0000000000000000000000000000000000000000..312a0b5a8e83b6ad7246453908bd552841a89188
> --- /dev/null
> +++ b/drivers/bus/mhi/host/clients/Kconfig
> @@ -0,0 +1,17 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +config MHI_BUS_LOOPBACK
> +	tristate "MHI LOOPBACK client driver"
> +	depends on MHI_BUS
> +	help
> +	  MHI LOOPBACK client driver that binds to the MHI LOOPBACK channel
> +	  as defined in the MHI specification. The LOOPBACK channel is
> +	  implemented by MHI-based devices (modems, WLAN) in the field, where

Are modems, WLAN the only devices that implement this, or are those 
intended to be examples?  Current reads as a limitation.

> +	  the endpoint firmware echoes back whatever the host sends.
> +
> +	  This driver exposes a sysfs interface for testing MHI data path
> +	  integrity between host and endpoint. Users can configure the TRE
> +	  size and count, and trigger a loopback test.
> +
> +	  To compile this driver as a module, choose M here. The module
> +	  will be called mhi_loopback.
> diff --git a/drivers/bus/mhi/host/clients/Makefile b/drivers/bus/mhi/host/clients/Makefile
> new file mode 100644
> index 0000000000000000000000000000000000000000..3811b6928f42b38f94b1167941cf3b0fe512d32b
> --- /dev/null
> +++ b/drivers/bus/mhi/host/clients/Makefile
> @@ -0,0 +1,2 @@
> +obj-$(CONFIG_MHI_BUS_LOOPBACK) += mhi_loopback.o
> +mhi_loopback-y += loopback.o
> diff --git a/drivers/bus/mhi/host/clients/loopback.c b/drivers/bus/mhi/host/clients/loopback.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..02a952e8e01222cd8cb842c9f9490479df8ea2bd
> --- /dev/null
> +++ b/drivers/bus/mhi/host/clients/loopback.c
> @@ -0,0 +1,289 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/atomic.h>
> +#include <linux/cleanup.h>
> +#include <linux/completion.h>
> +#include <linux/errno.h>
> +#include <linux/mhi.h>
> +#include <linux/mod_devicetable.h>

I'm pretty sure this is now incorrect based on cleanups that just 
occured in tree.

> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/random.h>
> +#include <linux/sizes.h>
> +#include <linux/slab.h>
> +#include <linux/string.h>
> +#include <linux/sysfs.h>
> +#include <linux/types.h>
> +
> +#define MHI_LOOPBACK_DEFAULT_TRE_SIZE	32
> +#define MHI_LOOPBACK_DEFAULT_NUM_TRE	1
> +#define MHI_LOOPBACK_TIMEOUT_MS		5000
> +#define MHI_LOOPBACK_MAX_TRE_SIZE	(SZ_64K - 1)
> +
> +struct mhi_loopback {
> +	struct mhi_device *mdev;
> +	/* Serializes the sysfs attributes against a running test */
> +	struct mutex lb_mutex;
> +	struct completion comp;
> +	atomic_t tre_pending;

I'm not really sure I understand what purpose this is serving.

> +	u32 num_tre;
> +	u32 tre_size;

I'm pretty sure these are the wrong types since they cross kernel 
boundaries.


