Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E993BED5A
	for <mhi@lists.linux.dev>; Thu,  4 Jun 2026 05:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780549757; cv=none; b=l2Htrn0IUP/QRGgsCEBi2UQKPw4RFNnvIVwVl6aUe86y7yvANU3VuAo+ZNK64LkExKg67wyVx2nUsCTZz9ACMb6mOz0TS0ZDLLDgdckNSFQN5/L6bNIcuXn0YHkqiSJMIP6u26IuRqxnD+P73xZOTlK1JKAojYpclgycPfBHS/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780549757; c=relaxed/simple;
	bh=Av1frBjcGBjlzFynU2Hy7rkXSpmEfO68DCNBSYURblM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PNIteXKuNKOC3cUNDzYQEaSjSMEJ7hnbhJKqAaIAKeqaoBbY0K8ZRLJ/3QeOf47f22LCc8zYhCnFGykYFSwjBoEFMGXvNnsJQmklRtTU8Jg3nwM7y6GM8nuN/U1PJS9zF3oftG8km4vG/qcqg3ZW/G0R6L8Ko+6mxTFJBYpPl4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=scDVnS0H; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="scDVnS0H"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-36e0a13e801so60862a91.1
        for <mhi@lists.linux.dev>; Wed, 03 Jun 2026 22:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780549755; x=1781154555; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H+vy0QPkbgBGQCp+nbHU8oM3LzLFEBCDA4xt5ygdBfo=;
        b=scDVnS0HIQGl8B4uA4LB0X9ui3SksnIwlbMy1V5WWcuNIzn7C2fR2l1oSpHaGmob4m
         vbGzJzHl68i47FSFgJNq6NeG4lGRwoc5BYKg/Xe5m2FYkEIsfzJpdw4QbQ8uKEhFkhOq
         sDqgF0aesLC7GdgoZ7Ik16J4KRWYtpvjDvd0UNDsW/tWBq1MlvPSFgtE4XSpn8DWieEl
         ebKHI8VdJqxGa3GNo7bTiBhRLIgBhTswjqDbVxdG+XdUNLVeECxjS874F1vCU5EtSbLx
         IxxV/neycW4uqNdG2h7nKFd5VBBNKpkm/yg365fQ2NjGKtIA0TJjXbP93ilIthYjg+3T
         SS3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780549755; x=1781154555;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H+vy0QPkbgBGQCp+nbHU8oM3LzLFEBCDA4xt5ygdBfo=;
        b=ZfBX2UYh4x+fg47ZMmSlE/qaUryqmnT/ivxgMF4pjOor+NdlXv2OZf0kvfW9sLxDYH
         8ikCaBVWL+OxZonYgGvfZK/rghQoi/WfIB5f4aHrNGYWfiht+0nHWd+GFPTc5stNHN/j
         4ZQKeA8Rku/S5CTnm3iYKl4csHq4JPirqsyq1/Vjtppirj61EKFQX6a2Z4xsi0UKblbc
         rU3TBInzkv6Z34TJUG2fgME5aCqr828AQAzf4D111DZrzGamCwvyyJUHQrItAGdW3xTV
         nmo9tHUhmpgqZ8ojbYLmLm1i1rMEnu59iSRDEHYElmn3rXqaqAMzvDfCRyaRcAhMO+TU
         qIjA==
X-Forwarded-Encrypted: i=1; AFNElJ+7vVUUEN2UjCG0UV1pOEHCIw2vMMOhK5GYodpWKB+QwZRUv+SgT7wHmjQqfx7/ccj+JNw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz641UiOjIl16vOqPt7Fxa6P2iDo3/LK5x7bnsM3OqXhIAFNas6
	bqqi/6+OgVlLswJ2Vy49swEpOBsFMe8LUfpXsvtPFonRrQnmUHG4aQL7
X-Gm-Gg: Acq92OHvr9fta/LmnFwWqRCXEw2XyLjCjSdjqAIqNXtomtjpAH9Jloc2Rcapk1Q1UMZ
	tu7ly1Eph/AIXmFXMfrX6nx8SBzoOnEtc+Nj4r0tKvSUDJxEeWvS2aONwcc6D5inJcxyFncaKHE
	eLYSsLGY4iM445T+2pP7+klF2A4L5eWEKxTMZqKTcpWlNXZKJbDn3WNIeve/7NwfVXjvFp9kFu/
	tT0A3xgY7cShgnANNDVSzeGEOnMAI8hHutqkTqTCBGpiq+VqS8RgORPVT3Hx5UwDtrSy4vnzOlN
	fG0zGTYIsJ0XGWwSMSeK9YOKOJDoBA9axEkrQ+ZQjUXOmpFkWQVy0FbuKie2a943LhwbPfru/V9
	t45ls3S+wguMjCubBMSD8xR515iWv9j5cYaOicQJSRKqaUbpCPMfVInEfvJsqjTkT5tlOnCaKcd
	8smmHL4LTHNG/4pLS1MFdDJljxVBPD4oW/JYgwH2gHxGLt
X-Received: by 2002:a17:90b:4b85:b0:366:2b56:3ec2 with SMTP id 98e67ed59e1d1-36fbd7cbd0emr692507a91.1.1780549755227;
        Wed, 03 Jun 2026 22:09:15 -0700 (PDT)
Received: from [192.168.1.7] ([159.192.166.161])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-36f68bf99dcsm1595578a91.0.2026.06.03.22.09.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 22:09:14 -0700 (PDT)
Message-ID: <f5fe7d26-4467-4015-be65-f01d7acda213@gmail.com>
Date: Thu, 4 Jun 2026 12:09:09 +0700
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] bus: mhi: pci_generic: add Rolling Wireless RW135R-GL
 and RW151 support
To: zwq2226404116@163.com, mhi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org
Cc: mani@kernel.org, loic.poulain@oss.qualcomm.com, ryazanov.s.a@gmail.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, kuba@kernel.org,
 Wanquan Zhong <wanquan.zhong@fibocom.com>
References: <20260603070608.309114-1-zwq2226404116@163.com>
Content-Language: en-US
From: Lars Melin <larsm17@gmail.com>
In-Reply-To: <20260603070608.309114-1-zwq2226404116@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-06-03 14:06, zwq2226404116@163.com wrote:
> From: Wanquan Zhong <wanquan.zhong@fibocom.com>
> 
> bus: mhi: pci_generic: add Rolling Wireless RW135R-GL and RW151 support
> 
> Add MHI PCIe device configuration for Rolling Wireless modules:
> 
> - RW135R-GL (Qualcomm sdx35): MBIM, DIAG, DUN, NMEA, FIREHOSE, ADB, IP_HW0
> - RW151 (Qualcomm sdx75): same channel layout with adjusted ring sizes
> 
> Register PCI_DEVICE_SUB entries for vendor 0x2099, device 0x1300/1301 on
> QCOM 0x011a (sdx35) and 0x0309 (sdx75) respectively.
> 
> Enable the ADB MHI channel in mhi_wwan_ctrl so userspace can access the
> WWAN_PORT_ADB port via the wwan subsystem.
> 
> Tested-on: Rolling RW135R-GL / RW151 hardware (MHI probe, MBIM, DIAG, ADB)
> 
> Signed-off-by: Wanquan Zhong <wanquan.zhong@fibocom.com>
> ---
>   drivers/bus/mhi/host/pci_generic.c | 100 +++++++++++++++++++++++++++++
>   drivers/net/wwan/mhi_wwan_ctrl.c   |   1 +
>   2 files changed, 101 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 0884a384b77f..ad166de2d0f3 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -902,6 +902,94 @@ static const struct mhi_pci_dev_info mhi_netprisma_fcun69_info = {
>   	.sideband_wake = true,
>   };
>   
> +static const struct mhi_channel_config mhi_rolling_rw135r_channels[] = {
> +	MHI_CHANNEL_CONFIG_UL(4, "DIAG", 64, 1),
> +	MHI_CHANNEL_CONFIG_DL(5, "DIAG", 64, 1),
> +	MHI_CHANNEL_CONFIG_UL(12, "MBIM", 32, 0),
> +	MHI_CHANNEL_CONFIG_DL(13, "MBIM", 32, 0),
> +	MHI_CHANNEL_CONFIG_UL(14, "NMEA", 32, 0),
> +	MHI_CHANNEL_CONFIG_DL(15, "NMEA", 32, 0),
> +	MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
> +	MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
> +	MHI_CHANNEL_CONFIG_UL_FP(34, "FIREHOSE", 32, 0),
> +	MHI_CHANNEL_CONFIG_DL_FP(35, "FIREHOSE", 32, 0),
> +	MHI_CHANNEL_CONFIG_UL(36, "ADB", 32, 0),
> +	MHI_CHANNEL_CONFIG_DL(37, "ADB", 32, 0),
> +	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0", 128, 2),
> +	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0", 128, 3),
> +};
> +
> +static struct mhi_event_config mhi_rolling_rw135r_events[] = {
> +	MHI_EVENT_CONFIG_CTRL(0, 128),
> +	MHI_EVENT_CONFIG_DATA(1, 128),
> +	MHI_EVENT_CONFIG_HW_DATA(2, 1024, 100),
> +	MHI_EVENT_CONFIG_HW_DATA(3, 2048, 101),
> +};
> +
> +static const struct mhi_controller_config modem_rolling_rw135r_config = {
> +	.max_channels = 128,
> +	.timeout_ms = 8000,
> +	.num_channels = ARRAY_SIZE(mhi_rolling_rw135r_channels),
> +	.ch_cfg = mhi_rolling_rw135r_channels,
> +	.num_events = ARRAY_SIZE(mhi_rolling_rw135r_events),
> +	.event_cfg = mhi_rolling_rw135r_events,
> +};
> +
> +static const struct mhi_pci_dev_info mhi_rolling_rw135r_info = {
> +	.edl = "qcom/sdx35m/prog_firehose_ddr.elf",
> +	.name = "rolling-rw135r",
> +	.config = &modem_rolling_rw135r_config,
> +	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> +	.dma_data_width = 32,
> +	.sideband_wake = false,
> +	.mru_default = 32768,
> +	.edl_trigger = true,
> +};
> +
> +static const struct mhi_channel_config mhi_rolling_rw151_channels[] = {
> +	MHI_CHANNEL_CONFIG_UL(4, "DIAG", 16, 1),
> +	MHI_CHANNEL_CONFIG_DL(5, "DIAG", 16, 1),
> +	MHI_CHANNEL_CONFIG_UL(12, "MBIM", 4, 0),
> +	MHI_CHANNEL_CONFIG_DL(13, "MBIM", 4, 0),
> +	MHI_CHANNEL_CONFIG_UL(14, "NMEA", 32, 0),
> +	MHI_CHANNEL_CONFIG_DL(15, "NMEA", 32, 0),
> +	MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
> +	MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
> +	MHI_CHANNEL_CONFIG_UL_FP(34, "FIREHOSE", 32, 0),
> +	MHI_CHANNEL_CONFIG_DL_FP(35, "FIREHOSE", 32, 0),
> +	MHI_CHANNEL_CONFIG_UL(36, "ADB", 32, 0),
> +	MHI_CHANNEL_CONFIG_DL(37, "ADB", 32, 0),
> +	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0", 128, 2),
> +	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0", 128, 3),
> +};
> +
> +static struct mhi_event_config mhi_rolling_rw151_events[] = {
> +	MHI_EVENT_CONFIG_CTRL(0, 128),
> +	MHI_EVENT_CONFIG_DATA(1, 128),
> +	MHI_EVENT_CONFIG_HW_DATA(2, 1024, 100),
> +	MHI_EVENT_CONFIG_HW_DATA(3, 2048, 101),
> +};
> +
> +static const struct mhi_controller_config modem_rolling_rw151_config = {
> +	.max_channels = 128,
> +	.timeout_ms = 50000,
> +	.num_channels = ARRAY_SIZE(mhi_rolling_rw151_channels),
> +	.ch_cfg = mhi_rolling_rw151_channels,
> +	.num_events = ARRAY_SIZE(mhi_rolling_rw151_events),
> +	.event_cfg = mhi_rolling_rw151_events,
> +};
> +
> +static const struct mhi_pci_dev_info mhi_rolling_rw151_info = {
> +	.edl = "qcom/sdx75m/prog_firehose_lite.elf",
> +	.name = "rolling-rw151",
> +	.config = &modem_rolling_rw151_config,
> +	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> +	.dma_data_width = 32,
> +	.sideband_wake = false,
> +	.mru_default = 32768,
> +	.edl_trigger = true,
> +};
> +
>   /* Keep the list sorted based on the PID. New VID should be added as the last entry */
>   static const struct pci_device_id mhi_pci_id_table[] = {
>   	{PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0116),
> @@ -909,6 +997,12 @@ static const struct pci_device_id mhi_pci_id_table[] = {
>   	/* Telit FN920C04 (sdx35) */
>   	{PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x011a, 0x1c5d, 0x2020),
>   		.driver_data = (kernel_ulong_t) &mhi_telit_fn920c04_info },
> +	/* Rolling RW135R-GL (sdx35) */
> +	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x011a, 0x2099, 0x1300),
> +		.driver_data = (kernel_ulong_t) &mhi_rolling_rw135r_info },
> +	/* Rolling RW135R-GL (sdx35) */
> +	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x011a, 0x2099, 0x1301),
> +		.driver_data = (kernel_ulong_t) &mhi_rolling_rw135r_info },
>   	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0304),
>   		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx24_info },
>   	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0306, PCI_VENDOR_ID_QCOM, 0x010c),
> @@ -941,6 +1035,12 @@ static const struct pci_device_id mhi_pci_id_table[] = {
>   	/* Telit FE990B40 (sdx72) */
>   	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0309, 0x1c5d, 0x2025),
>   		.driver_data = (kernel_ulong_t) &mhi_telit_fe990b40_info },
> +	/* Rolling RW151 (sdx75) */
> +	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0309, 0x2099, 0x1300),
> +		.driver_data = (kernel_ulong_t) &mhi_rolling_rw151_info },
> +	/* Rolling RW151 (sdx75) */
> +	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0309, 0x2099, 0x1301),
> +		.driver_data = (kernel_ulong_t) &mhi_rolling_rw151_info },
>   	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0309),
>   		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx75_info },
>   	/* QDU100, x100-DU */
> diff --git a/drivers/net/wwan/mhi_wwan_ctrl.c b/drivers/net/wwan/mhi_wwan_ctrl.c
> index fa73861db6ad..c0bba94d5c3f 100644
> --- a/drivers/net/wwan/mhi_wwan_ctrl.c
> +++ b/drivers/net/wwan/mhi_wwan_ctrl.c
> @@ -264,6 +264,7 @@ static const struct mhi_device_id mhi_wwan_ctrl_match_table[] = {
>   	{ .chan = "DIAG", .driver_data = WWAN_PORT_QCDM },
>   	{ .chan = "FIREHOSE", .driver_data = WWAN_PORT_FIREHOSE },
>   	{ .chan = "NMEA", .driver_data = WWAN_PORT_NMEA },
> +	{ .chan = "ADB", .driver_data = WWAN_PORT_ADB },
>   	{},
>   };
>   MODULE_DEVICE_TABLE(mhi, mhi_wwan_ctrl_match_table);
> 
> --
> 2.43.0
> 
> 
Hi,
does both the sdx35 and the sdx75 device really have the same Rolling 
PCI Vid:Pid (2099:1300 and 2099:1301)?

thanks
Lars


