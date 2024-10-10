Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A1F1BF324
	for <mhi@lists.linux.dev>; Thu, 10 Oct 2024 10:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728557826; cv=none; b=Fvb8CWnQr4ZP5FPBRXeucHFPA/UYPNZPBQaLW9QFfH2RSVlyCUyUxMtmgwGSyuaOAJtMlzV/AHvefDhubHYsqnAEm50sJoDGeaEqzbuYlbUNaQuBESxA+XdgWTdluTzb0sZ5STdtptcH4nAwCIyH36DI25X8gqbnU7HSRQRaa68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728557826; c=relaxed/simple;
	bh=d4HU0SLzlcKFVQeiO2JNDPW9qbPHKjFdAn3qjg617pg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a5l5qGcUgPjDLyH/3vkqYQIQWiTfJyo85Dl9Sj6eS8/M8XyWQVyrGdAvmlAFLvspAQGfUVilVClVNqoMSeCcp/lBLT876phD8V2HOag1Z4Hr6oHJngjDz8lavlHLOO7R2LFjuFkwLcZ+Q+Zpl2o2OzNtmLr1ISXtKzUI+EWMc0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qn4kOgiG; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qn4kOgiG"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-7ea0728475dso597369a12.0
        for <mhi@lists.linux.dev>; Thu, 10 Oct 2024 03:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728557824; x=1729162624; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RT2TNTxcIr9d5WrKWzX+3XBsz0hui3Hv6T/2YvST6a8=;
        b=qn4kOgiGv6l0gQ0qyGq4JPoPdVvyKVxx+Yhy6mAYwY9jO0bqujSbLc9Yt5KX7t7vU5
         qtNhkayw8E5wiO4MLWG5fjNVr92iHdbUkkcJ15jzRITCXu8EBXxvzhC0hoX7HQkkz3Yk
         ldxHwNXuXpT/N6CP7Cbhc9foI58gaFRY1vNW93xTNLXOy1pSdvSH311nxU0dwOV3amyZ
         oeebT5bVyo5dAdzZBb+i8pAlWPHYUbmEzXeWmx6Fv4aM7ku7Qtidh/gBTIt5KA2OR9wH
         EkqCjJD2smmPvzlyZSMfIrUJoPVpOOFqb88y6mvPp/ZSmscZ8MRV74sf1t6cF5yJPcVG
         k9Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728557824; x=1729162624;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RT2TNTxcIr9d5WrKWzX+3XBsz0hui3Hv6T/2YvST6a8=;
        b=dwZ1tmoS627izheBNE1zMdRJnIX8B37Zt4Q/LA5MpA89rUEV3mMXOczbtQ6NdsToNM
         DzNTHWv9DOgr/9WCPjhDwghbquhtCuSjtZYpjnXewixXAefdwnYvnrGEJLaMifXKnOrI
         sFYhF7ete8ZcU7XTR8weOfwB0J8/3+6Zp5e6az+MnwjSxXmlJf9Sss5qQ1181IfOsX7t
         5n9Pcd4OI1nVOr3FryamTV5sAPM10GSbJy6dBeECfNmkaRhYVud3bU/5LN4pwQrj7NBA
         +cv4NdHD8+suaQxODLtZao1+E6RR4lb8CKcKWDpSlFYdY3ckEbSP6jvo1aN3iNV48BQF
         zX0Q==
X-Gm-Message-State: AOJu0Yyn+BUfR6t/yCMr+dyT+ejdEU1/Wri6xqefVJzT0nse/D7M2+Pu
	0iNYY7dIcUbYlBhF/hmkrdqeUYGSrnk7t91nxtHKRkc9ppR03XF+Y7gszqAIZw==
X-Google-Smtp-Source: AGHT+IGu+kMq+uRASxcspqSsFqZQjDiE2MpxVF9EDhrlqDoOU3Ztf7Xx1Pk65uGaqBvkRjdyk6326A==
X-Received: by 2002:a17:90b:1803:b0:2d8:9fbe:6727 with SMTP id 98e67ed59e1d1-2e2c800c7a1mr4355972a91.4.1728557824211;
        Thu, 10 Oct 2024 03:57:04 -0700 (PDT)
Received: from thinkpad ([220.158.156.184])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e2a5caa753sm3303473a91.54.2024.10.10.03.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 03:57:03 -0700 (PDT)
Date: Thu, 10 Oct 2024 16:26:58 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Vivek Pernamitta <quic_vpernami@quicinc.com>
Cc: mhi@lists.linux.dev, quic_qianyu@quicinc.com, quic_vbadigan@quicinc.com,
	quic_krichai@quicinc.com, quic_skananth@quicinc.com,
	quic_mrana@quicinc.com, Slark Xiao <slark_xiao@163.com>,
	Mank Wang <mank.wang@netprisma.us>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Fabio Porcedda <fabio.porcedda@gmail.com>,
	"open list:MHI BUS" <linux-arm-msm@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] bus: mhi: host: pci_generic: Add support for QDU100
 device
Message-ID: <20241010105658.mckqvumjrglu6236@thinkpad>
References: <20241007081543.3475027-1-quic_vpernami@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241007081543.3475027-1-quic_vpernami@quicinc.com>

On Mon, Oct 07, 2024 at 01:45:41PM +0530, Vivek Pernamitta wrote:
> Add MHI controller configuration for QDU100 device.
> 
> This Qualcomm QDU100 device is inline accelerator card
> which is an extension to QRU100 5G RAN platform.
> which is designed to simplify 5G deployments by offering
> a turnkey solution for ease of deployment with O-RAN
> fronthaul and 5G NR layer 1 High (L1 High) processing,
> and to accelerate operator and infrastructure vendor
> adoption of virtualized RAN platforms.
> 
> Currently IP_SW1/2 channel support is not present in
> mhi_net driver, will be supporting them in future.

I don't know what column width you are using, but please use 75 columns for
patch descriptions.

> 
> https://docs.qualcomm.com/bundle/publicresource/87-79371-1_REV_A_Qualcomm_X100_5G_RAN_Accelerator_Card_Product_Brief.pdf
> Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
> 
> ---
> changes from V1:
> - Changing naming convention from modem_qcom_qdu100*
>   to mhi_qcom_qdu100*
> - Added more commit test for IP_SW1/2 channels.
> - Fixed and corrected by passing mhi_pci_dev_info struct
>   instead of mhi_controller_config.
> ---
> ---
>  drivers/bus/mhi/host/pci_generic.c | 60 ++++++++++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 9938bb034c1c..b9b7dd8d9411 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -245,6 +245,63 @@ struct mhi_pci_dev_info {
>  		.channel = ch_num,		\
>  	}
>  
> +static const struct mhi_channel_config mhi_qcom_qdu100_channels[] = {
> +	MHI_CHANNEL_CONFIG_UL(0, "LOOPBACK", 32, 2),
> +	MHI_CHANNEL_CONFIG_DL(1, "LOOPBACK", 32, 2),
> +	MHI_CHANNEL_CONFIG_UL_SBL(2, "SAHARA", 128, 1),
> +	MHI_CHANNEL_CONFIG_DL_SBL(3, "SAHARA", 128, 1),
> +	MHI_CHANNEL_CONFIG_UL(4, "DIAG", 64, 3),
> +	MHI_CHANNEL_CONFIG_DL(5, "DIAG", 64, 3),
> +	MHI_CHANNEL_CONFIG_UL(9, "QDSS", 64, 3),
> +	MHI_CHANNEL_CONFIG_UL(14, "NMEA", 32, 4),
> +	MHI_CHANNEL_CONFIG_DL(15, "NMEA", 32, 4),
> +	MHI_CHANNEL_CONFIG_UL(16, "CSM_CTRL", 32, 4),
> +	MHI_CHANNEL_CONFIG_DL(17, "CSM_CTRL", 32, 4),
> +	MHI_CHANNEL_CONFIG_UL(40, "MHI_PHC", 32, 4),
> +	MHI_CHANNEL_CONFIG_DL(41, "MHI_PHC", 32, 4),
> +	MHI_CHANNEL_CONFIG_UL(46, "IP_SW0", 256, 5),
> +	MHI_CHANNEL_CONFIG_DL(47, "IP_SW0", 256, 5),
> +	MHI_CHANNEL_CONFIG_UL(48, "IP_SW1", 256, 6),
> +	MHI_CHANNEL_CONFIG_DL(49, "IP_SW1", 256, 6),
> +	MHI_CHANNEL_CONFIG_UL(50, "IP_SW2", 256, 7),
> +	MHI_CHANNEL_CONFIG_DL(51, "IP_SW2", 256, 7),

Please drop these unsupported IP_SW channels until you add support in mhi-net
driver.

> +};
> +
> +static struct mhi_event_config mhi_qcom_qdu100_events[] = {
> +	/* first ring is control+data ring */
> +	MHI_EVENT_CONFIG_CTRL(0, 64),
> +	/* SAHARA dedicated event ring */
> +	MHI_EVENT_CONFIG_SW_DATA(1, 256),
> +	/* Software channels dedicated event ring */
> +	MHI_EVENT_CONFIG_SW_DATA(2, 64),
> +	MHI_EVENT_CONFIG_SW_DATA(3, 256),
> +	MHI_EVENT_CONFIG_SW_DATA(4, 256),
> +	/* Software IP channels dedicated event ring */
> +	MHI_EVENT_CONFIG_SW_DATA(5, 512),
> +	MHI_EVENT_CONFIG_SW_DATA(6, 512),
> +	MHI_EVENT_CONFIG_SW_DATA(7, 512),
> +};
> +
> +static const struct mhi_controller_config mhi_qcom_qdu100_config = {
> +	.max_channels = 128,
> +	.timeout_ms = 120000,
> +	.num_channels = ARRAY_SIZE(mhi_qcom_qdu100_channels),
> +	.ch_cfg = mhi_qcom_qdu100_channels,
> +	.num_events = ARRAY_SIZE(mhi_qcom_qdu100_events),
> +	.event_cfg = mhi_qcom_qdu100_events,
> +};
> +
> +static const struct mhi_pci_dev_info mhi_qcom_qdu100_info = {
> +	.name = "qcom-lassen",

I don't think you can use internal chip name in the drivers. Please use the
actual chip code like QDU100.

> +	.fw = "qcom/lassen/xbl_s.melf",
> +	.edl = "qcom/lassen/edl.mbn",

Could you please push these fw to linux-firmware repo? This is a requirement to
get this patch accepted. I should've imposed this at the start itself...

> +	.edl_trigger = true,
> +	.config = &mhi_qcom_qdu100_config,
> +	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> +	.dma_data_width = 32,
> +	.sideband_wake = false,
> +};
> +
>  static const struct mhi_channel_config modem_qcom_v1_mhi_channels[] = {
>  	MHI_CHANNEL_CONFIG_UL(4, "DIAG", 16, 1),
>  	MHI_CHANNEL_CONFIG_DL(5, "DIAG", 16, 1),
> @@ -822,6 +879,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
>  	/* NETPRISMA FCUN69 (SDX6X) */
>  	{ PCI_DEVICE(PCI_VENDOR_ID_NETPRISMA, 0x1001),
>  		.driver_data = (kernel_ulong_t) &mhi_netprisma_fcun69_info },
> +	/* QDU100, x100-DU */
> +	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0601),
> +		.driver_data = (kernel_ulong_t)&mhi_qcom_qdu100_info },

Spare after (kernel_ulong_t) and also sort the entries as per the comment above
mhi_pci_id_table[].

- Mani

-- 
மணிவண்ணன் சதாசிவம்
