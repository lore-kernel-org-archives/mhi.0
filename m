Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C9F1AA1D2
	for <mhi@lists.linux.dev>; Mon, 30 Dec 2024 14:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735568210; cv=none; b=gJYQIkmU6gn2hW25r1mebiv1zbJ7551g3r5tO3ldw9wE+pKYc1v8LBOsd5nmYRgM3tT9AW3wDIfmk+fPtavYZTqZ2rGvAkdO09jpm6LgBn0odCwiKIXNYGLCapYWIVDijwYkgtMAp3N4DHWPxWTv+dl9ll28SbJsN6k9NGe8adE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735568210; c=relaxed/simple;
	bh=NAWkcRz1xJvoL/sqhfndxD9TxOxRRagPFi1Fdfl4XzI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=keU7C1+Z4q0W1SExx2W8fcJFU2sg5p4SVPIOz/xh/7vzclMQzHYctiKQp7sARWjzCAEnioDA6VpgnYynby+HUQSqaN/GG26oKgcJPnU33B2fbRs8L0FFPpep4nuqNuJ5womh3xOzyVwgR7nDHkT+cJg6XmWwmfjmS2gBmHm+GIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pchaBgvw; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pchaBgvw"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2161eb95317so123973265ad.1
        for <mhi@lists.linux.dev>; Mon, 30 Dec 2024 06:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735568208; x=1736173008; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hlJ+Uw90GU7HpevHe+ix+w6zDzPdLCzEUyg3wlqdmAs=;
        b=pchaBgvwv9OXJws/k7+dFSAOX/24lh4bCj70WycFImsz+rwdDLq5rUv/6P0EgMUtl8
         WkLE4Myu+gkEt1eHyiBRDPg70vITM4kdX4j1a9xIpLI/HOlIm5K6UX9rv3gw3xB6NIAC
         M38qRJPcogteK6vw4BFcPaMv5EUOqDgN2d8YO5d4D6GYTJhgB1hRRkFiQzZnAiZ7ijXa
         JATcILblqWn4SaHW5tEPxQcrwq8vyipyIIzEb2By9b1CaNsDD/6jJYTl/TMUWGRguold
         OyYEFph4vJfjOaC1nEdZjrINynzWc6bsTKXKXeZR09zRvlMYsINXFYVD4SJ6xlFr8m57
         Fx3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735568208; x=1736173008;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hlJ+Uw90GU7HpevHe+ix+w6zDzPdLCzEUyg3wlqdmAs=;
        b=GMIUpXSYk+P5wTZYdvxUO7Ija4UQIVj50wOWVjO82A6PYZWqyfY6Od7EPSWl+TodN0
         pKogggPZoYGtOSGLIb/IfyftE2LBZA7MVXtfpHfrt11eknvm3xYXsdezSdhaLegdlBUA
         JmAhbr4vKdekkVx/SCRvlDnGAvuyj19WUdarvyxM0fizky8BDgyK6M6qjZe7Bsdx6Rxm
         aOS1LWJg0LVcKuvqUQJkSuT8UcyRSXM7VqKnizvcPOSM+9NC2gP7it45QcNeldcT6k7s
         g4cK8cL9Q2Z1jRLXiKvrMD1rFV+XfvWMTdykXLihbGPb1+5wUbDDezZOG0VpeM9gXIri
         G6AA==
X-Forwarded-Encrypted: i=1; AJvYcCWxbDHto8cD6SBXvkMEhxDAFYFiKmBNrm5JEKwlpXhEk7gQSZ1gy8JUzI3WV3vl4ivez5s=@lists.linux.dev
X-Gm-Message-State: AOJu0YyYqQTePhSLjnotdTrYV9uxznFCv8gRDWp3G+dlaPgEy65E5HNK
	yUxEyccMII/FzPqzv34dAfJktpRHkUwyjAuD9RkdXkf5gU9cw4ZAvqNyM8+R6A==
X-Gm-Gg: ASbGncsCrAQ8YGMMtcJfBfkZvAiIfh36qepCovq7MlYFhNshxyzur93XTp1M2yJWE3v
	cW2wMszRgW5W4M5HYVyaIileR3FeempkAtld86ufXe5mylv4gHJZvZTXDoICIjyTcT7f68Kv7mv
	NrmR496MNydNAOM0S5WT40iJVzbRBiwq88WAAbJrW+WNAL+NeSwTEBY6AbIbC1p0Vf3fIcqv5Qb
	YJ2VSivs8lfcW4xjAf5Sxh5xEEu1/cAlNCjiG3Tt4aua7Dw7opxV7RYbSUL2JM+luiK
X-Google-Smtp-Source: AGHT+IEH1T6+Xnl4CvOerewnKkb2WUs0M6/CSQfags5VwkKN1m/zh8Wl4svgUoMVEO9UpRjhhi15EA==
X-Received: by 2002:a17:902:ea08:b0:216:84e9:d334 with SMTP id d9443c01a7336-219e6ebca26mr452680235ad.33.1735568208212;
        Mon, 30 Dec 2024 06:16:48 -0800 (PST)
Received: from thinkpad ([120.60.139.149])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca0282fsm179322425ad.259.2024.12.30.06.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 06:16:47 -0800 (PST)
Date: Mon, 30 Dec 2024 19:46:43 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Vivek Pernamitta <quic_vpernami@quicinc.com>
Cc: quic_krichai@quicinc.com, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] bus: mhi: host: pci_generic: Add support for QDU100
 device
Message-ID: <20241230141643.rkbaway3dwlwwbhm@thinkpad>
References: <20241212-qdu100_us-v5-1-3349fb23512a@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241212-qdu100_us-v5-1-3349fb23512a@quicinc.com>

On Thu, Dec 12, 2024 at 05:27:27PM +0530, Vivek Pernamitta wrote:
> Add MHI controller configuration for QDU100 device.
> 
> The Qualcomm X100 5G RAN Accelerator card is designed to enhance Open vRAN
> servers by offloading CPUs from intensive 5G baseband functions.
> 
> Link: https://docs.qualcomm.com/bundle/publicresource/87-79371-1_REV_A_Qualcomm_X100_5G_RAN_Accelerator_Card_Product_Brief.pdf
> 
> Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
> changes from V4:
> - Updated QDU100 VID as per order in mhi_pci_id_table.
> - Link to v4: https://lore.kernel.org/r/20241209-qdu100_us-v4-1-f9010b2a09a2@quicinc.com
> 
> changes from V3:
> - Removed IP_SW1 and IP_SW2 support currently, will add once
>   SW_IP1/2 channels support are added to mhi-net driver.
> - Removed qdu100 edl images, as EDL images are not needed.
> - Added space inbetween kernel_ulong_t and mhi_qcom_qdu100_info.
> - QDU100 XBL FW images were pushed to linux-firmware git repo
>   https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/qcom/qdu100
> 
> changes from V2:
> - updated commit text.
> 
> changes from V1:
> - Changing naming convention from modem_qcom_qdu100*
>   to mhi_qcom_qdu100*.
> - Updated commit text.
> - Fixed and corrected by passing mhi_pci_dev_info struct
>   instead of mhi_controller_config.
> ---
> 
> ---
>  drivers/bus/mhi/host/pci_generic.c | 55 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 07645ce2119a71c9277356e962252b840379cd81..aa5118dbe2e5de3f3d13a168ebe2d3d2d5930295 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -245,6 +245,58 @@ struct mhi_pci_dev_info {
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
> +	.name = "qcom-qdu100",
> +	.fw = "qcom/qdu100/xbl_s.melf",
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
> @@ -742,6 +794,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
>  		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx65_info },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0309),
>  		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx75_info },
> +	/* QDU100, x100-DU */
> +	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0601),
> +		.driver_data = (kernel_ulong_t) &mhi_qcom_qdu100_info },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_QUECTEL, 0x1001), /* EM120R-GL (sdx24) */
>  		.driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_QUECTEL, 0x1002), /* EM160R-GL (sdx24) */
> 
> ---
> base-commit: 28955f4fa2823e39f1ecfb3a37a364563527afbc
> change-id: 20241127-qdu100_us-abd7d1613c8b
> 
> Best regards,
> -- 
> Vivek Pernamitta <quic_vpernami@quicinc.com>
> 

-- 
மணிவண்ணன் சதாசிவம்
