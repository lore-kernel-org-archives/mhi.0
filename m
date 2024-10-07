Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C8818BB98
	for <mhi@lists.linux.dev>; Mon,  7 Oct 2024 13:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728309555; cv=none; b=Yzb8c4vV5AvvJ8XVozjDGQKW/xTjVz0HVRJyLssIH0nedGbBwHzVaDaB/ZzOnlND/x1Oaw90mcoskdy41mPJa2Z41a950tKRxfFy0F/V9nXBTJ2VOAPIfkVYBczB+kfMxsb+OQ8ZGX+Ivd+30dEOlVuRnr0O7LISMYK64LcmQTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728309555; c=relaxed/simple;
	bh=n4oG5LTAxLA3y2xDimyibVs2v/zqS3TxXWLrkbSEufY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r56Y5K00/y7qRMRhsRLu8EmjVtlQNFsNGAGq9P9cL5GUhJNmsgGwlQhVo4BntfGqRWIXjVfWumh4TtR/Q6fK1EYqPYsIgYvF+ZFf2TSF9QkScUMGTgfwLYOFYUHbM9xHItYk9DV3ZYB0WdASYLaSwzD67m7mg4+8PY9UAgBY60c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FNvl7T2l; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FNvl7T2l"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2facf48166bso50667991fa.0
        for <mhi@lists.linux.dev>; Mon, 07 Oct 2024 06:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728309552; x=1728914352; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1uBnw43piXXI7n4DTLKHOMAEK5UpUIcRTL2fHxKrp9w=;
        b=FNvl7T2lQxTHMsQV7Gy0cfkbZinhPTGHy9fb6kAgTJUwPK9IiuowImgWA/tvxazEwO
         23epR+tpmm1z+FoYeFgVdr09JvNCxuUy1iMHuW6hFV8BC65PMpgVLbhs+0TBDF3NeJ7o
         jf/OKdh/hOHUEAk0Opjy6vSDVbYdbYSn4jhy7Hv4Bk5eIjdsMw2gwl+HzeII3GAwNUME
         vroTlx340W93ga1H9fVROYsHmzmN6un2UYXWlRGxhQ5EwleeFTa/8yTByZffH5njN4yN
         LGbG6OP50zYYEA3SZRrFDV92czDX4zmvYqDpS/blRoswScIhQz2bMNu/0Z4fPkCipUco
         6uwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728309552; x=1728914352;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1uBnw43piXXI7n4DTLKHOMAEK5UpUIcRTL2fHxKrp9w=;
        b=Lg7Otd+DT9MIj48V6CjIKY0hKcbI2o9dMcXMu38R447hh+3E2YVFS0pUbrHeXz6HYc
         It2Iq8XgW3gPW3Y4ZXipvn9CzxEudM2TZlNWgGPcAJLDvWX5RdZ8cKqKnEEtDJPjeoXK
         jLN7D+m8PMwYN9pI1AQlvR+YvLCbk38waHudkSbWSDxA35BjyQytdfX7au/o3XuZcGgd
         pTexFzxw2ZWTgpaAbtIqIEtdpyHyVjlOJLk1C+ikR2xQ/rJyKTVqgkjy3EPvoYMuTgZw
         eKvGVM12CS3d+ZTbktBQJ0NkgCI9fleUol9OfL6xQ7VqWr9k/aM6HSZH8B/85lDPiP8A
         Y9Dg==
X-Gm-Message-State: AOJu0YwbHKIAXWJgoagXHUp8YTNWte9BB+F/w85X2sgmBM2/K+Wqjv0j
	VfVXC4SbCzqCE4ObH5P+zSZ4YYJuIfv4GIH7fgEw58nNoG0gGIl61ijPWERwYZg=
X-Google-Smtp-Source: AGHT+IFYsE5/TCR+Rx1O7DTrCu76UULZ5EhjsnIt4QmOaZn1KvQoOZfaRPVgfvAAqetrCt3ywPY3Rg==
X-Received: by 2002:a2e:bc21:0:b0:2fa:d534:3ee7 with SMTP id 38308e7fff4ca-2faf3d724dfmr57178661fa.35.1728309552125;
        Mon, 07 Oct 2024 06:59:12 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2faf9adcdd3sm7887201fa.69.2024.10.07.06.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 06:59:10 -0700 (PDT)
Date: Mon, 7 Oct 2024 16:59:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vivek Pernamitta <quic_vpernami@quicinc.com>
Cc: mhi@lists.linux.dev, quic_qianyu@quicinc.com, 
	manivannan.sadhasivam@linaro.org, quic_vbadigan@quicinc.com, quic_krichai@quicinc.com, 
	quic_skananth@quicinc.com, quic_mrana@quicinc.com, Slark Xiao <slark_xiao@163.com>, 
	Mank Wang <mank.wang@netprisma.us>, Jeff Johnson <quic_jjohnson@quicinc.com>, 
	Fabio Porcedda <fabio.porcedda@gmail.com>, "open list:MHI BUS" <linux-arm-msm@vger.kernel.org>, 
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] bus: mhi: host: pci_generic: Add support for QDU100
 device
Message-ID: <kukqsg4dpvfa2i53fssqsdihud3qy3w6le5srf2a7yiiwsbmob@se44vnmgbbye>
References: <20241007091622.3497928-1-quic_vpernami@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007091622.3497928-1-quic_vpernami@quicinc.com>

On Mon, Oct 07, 2024 at 02:46:20PM GMT, Vivek Pernamitta wrote:
> Add MHI controller configuration for QDU100 device
> 
> The Qualcomm X100 5G RAN Accelerator Card is designed to
> enhance Open vRAN servers by offloading CPUs from intensive
> 5G baseband functions.
> 
> Currently IP_SW1/2 channel support is not present in
> mhi_net driver, will be supporting them in future.

When? Can we get corresponding support as a part of the same patch
series?

> 
> Link: https://docs.qualcomm.com/bundle/publicresource/87-79371-1_REV_A_Qualcomm_X100_5G_RAN_Accelerator_Card_Product_Brief.pdf
> 

No empty lines between tags.

> Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
> 
> ---
> changs from V2:
> - updated commit text.
> 
> changes from V1:
> - Changing naming convention from modem_qcom_qdu100*
>   to mhi_qcom_qdu100*.
> - Updated commit text.
> - Fixed and corrected by passing mhi_pci_dev_info struct
>   instead of mhi_controller_config.
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
> +	.fw = "qcom/lassen/xbl_s.melf",
> +	.edl = "qcom/lassen/edl.mbn",
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
>  	{  }
>  };
>  MODULE_DEVICE_TABLE(pci, mhi_pci_id_table);
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
