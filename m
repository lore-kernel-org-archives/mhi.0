Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCDC0169ACB
	for <mhi@lists.linux.dev>; Wed,  5 Jun 2024 06:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717568116; cv=none; b=r1XFVYPiKoAOXO3Do44m4MEJJDiS5gz21ChlLGls0a0+hPg7YIH/PHkfss4ifKnJi6aJKhnV2dSrkHlhLxshvJ6b/q3kXTXBaicAQctr57Giqt6qITsBgUgpuEW5HQgrhb7vGB3n309ZjVaWSrpP9IimCDnxTvuuSEMxvFBkefE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717568116; c=relaxed/simple;
	bh=FH7/CdAzTjPVb3HTxwH4Z482YZ11x8BQKSxl511snAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tBw1AigEV5b29ZcoWW8kn/fuEEUl9G9a7oUHgItr30qkG6x1RKA6wNAFytjnIhG2N2FD8iGTBGZyPW2lPfmIppqd/9J7d6mCCN3D+j9Bt5DMmytHMAWsKfWXXvl+cWZtcXd5KPN7Tkr6qRhYQVFbUFsOY9zAVfmAmDh52wFT9t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UeoppkG7; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UeoppkG7"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1f62fae8c1aso42113935ad.3
        for <mhi@lists.linux.dev>; Tue, 04 Jun 2024 23:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717568114; x=1718172914; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zAu4SgsSJhhPH/cgZne7lMMDfMb41rkj8xyePWbHmPo=;
        b=UeoppkG7UdqP46ZfNU9ITlxw2XZXqHyRPpEA+jxE8SBWXKp2otO1nJAqexCfIDajBa
         FsysnCWCUpXUFy6sF44ilu5O188JREY3a2fBeTIXyiKXOXZCYPU/AvkkbbpLcBvfjfrM
         nK3BUdEje//oF6bNJF2W3gl2XVht88yhrAC3DOx9bOGF43TGkZzo3XQ3U7bknXz350Mf
         EE7JXfys7ZHZbG9c/+uDZnZBQMrHLLX6dV715k+a/1DtD4Xr8lecGUqKZC5CRMt4zn0r
         cL67bp3xsmXf5lQa/CmlRZzlRKI8Wpk6QP8awuPHTK324cO4V0zBsq5B7XfYFmfDbk6Q
         7CAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717568114; x=1718172914;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zAu4SgsSJhhPH/cgZne7lMMDfMb41rkj8xyePWbHmPo=;
        b=n/R5KkwAHk1wuCMATtURmCLUmWcNzyTSH1OdD09kGH+USVpyXqJr35+/5mTKenX7Ar
         ZtQ5uENwaLt+xWuvrFCbqR7AKQJZ2/278sWxSZ86yp4csCSna4J2kL7KxPicbU4yx0OF
         0bdUZjph+83SnZTHQu6Z8UiM36xnre9czUlhRDVJtZl+h+tlEGE6hMBPxifMWHn0eKq+
         dbg4jt32FTzDjHmEhbjRYBk5v5ps0PWsXASoPwclJRA1kt7Q9VxhAn8x7lncab0irQce
         lcm7KZbWpqy6+egGi/xLhSjdw/nwhnnpaSgoJ9/Rbxn9IgmVFSAaaAoCRcge9H4fnQlv
         q/lw==
X-Forwarded-Encrypted: i=1; AJvYcCVVh9VKr1LRUDQpzasCNbvNIdiwYxlj7kRz9t0jMqoDRhkeuPQXfvHFOhNrOE3PwqogJMAfIwAoUbVFpmTa9Hn4ctBE
X-Gm-Message-State: AOJu0YzorQsEW9zqWk77Am0XJefDe589nzXAfTYdO2ek4Nm6rAgKeISR
	3G0qX4L9PJ54pyygU0zUJHDVaCTdIag9r6PDOH13BNpM674Rpp+K48VazYr8Lg==
X-Google-Smtp-Source: AGHT+IH1r98BP+YeyFiil1aj9qCQowl82TMcJ/FFFdyHro+wBM2epKCpN9R5EB8uhJBH88SsvEFIsw==
X-Received: by 2002:a17:902:da8f:b0:1f4:8faa:cd68 with SMTP id d9443c01a7336-1f6a5a12e06mr18071135ad.29.1717568114029;
        Tue, 04 Jun 2024 23:15:14 -0700 (PDT)
Received: from thinkpad ([120.60.137.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f63232e0ddsm93673055ad.51.2024.06.04.23.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 23:15:13 -0700 (PDT)
Date: Wed, 5 Jun 2024 11:45:08 +0530
From: "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>
To: mank <mank@netprisma.us>
Cc: "duke_xinanwen@163.com" <duke_xinanwen@163.com>,
	"loic.poulain@linaro.org" <loic.poulain@linaro.org>,
	"quic_qianyu@quicinc.com" <quic_qianyu@quicinc.com>,
	"mhi@lists.linux.dev" <mhi@lists.linux.dev>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Add support for Netprisma
 LCUR57 and FCUN69
Message-ID: <20240605061508.GG2417@thinkpad>
References: <LV3PR22MB5104C27AD25D51B08C455B6CB0F92@LV3PR22MB5104.namprd22.prod.outlook.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <LV3PR22MB5104C27AD25D51B08C455B6CB0F92@LV3PR22MB5104.namprd22.prod.outlook.com>

On Wed, Jun 05, 2024 at 12:53:31AM +0000, mank wrote:
> Add Netprisma LCUR57 and FCUN69 hardware revision:
> 
> LCUR57:
> 02:00.0 Unassigned class [ff00]: Device 203e:1000
> 	Subsystem: Device 203e:1000
> 
> FCUN69:
> 02:00.0 Unassigned class [ff00]: Device 203e:1001
> 	Subsystem: Device 203e:1001
> 
> Signed-off-by: Mank Wang <mank@netprisma.us>
> ---
>  drivers/bus/mhi/host/pci_generic.c | 61 ++++++++++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 08844ee79654..e2b88699ce9e 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -26,6 +26,7 @@
>  /* PCI VID definitions */
>  #define PCI_VENDOR_ID_THALES	0x1269
>  #define PCI_VENDOR_ID_QUECTEL	0x1eac
> +#define PCI_VENDOR_ID_NETPRISMA	0x203E

lower case please.

>  
>  #define MHI_EDL_DB			91
>  #define MHI_EDL_COOKIE			0xEDEDEDED
> @@ -606,6 +607,60 @@ static const struct mhi_pci_dev_info mhi_telit_fn990_info = {
>  	.mru_default = 32768,
>  };
>  
> +static const struct mhi_channel_config mhi_netprisma_lcur57_channels[] = {
> +	MHI_CHANNEL_CONFIG_UL(0, "NMEA", 32, 0),
> +	MHI_CHANNEL_CONFIG_DL(1, "NMEA", 32, 0),
> +	MHI_CHANNEL_CONFIG_UL_SBL(2, "SAHARA", 32, 0),
> +	MHI_CHANNEL_CONFIG_DL_SBL(3, "SAHARA", 32, 0),
> +	MHI_CHANNEL_CONFIG_UL(4, "DIAG", 32, 1),
> +	MHI_CHANNEL_CONFIG_DL(5, "DIAG", 32, 1),
> +	MHI_CHANNEL_CONFIG_UL(12, "MBIM", 32, 0),
> +	MHI_CHANNEL_CONFIG_DL(13, "MBIM", 32, 0),
> +	MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
> +	MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
> +	MHI_CHANNEL_CONFIG_UL_FP(34, "FIREHOSE", 32, 0),
> +	MHI_CHANNEL_CONFIG_DL_FP(35, "FIREHOSE", 32, 0),
> +	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0_MBIM", 128, 2),
> +	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0_MBIM", 128, 3),
> +};
> +
> +static struct mhi_event_config mhi_netprisma_lcur57_events[] = {
> +	MHI_EVENT_CONFIG_CTRL(0, 128),
> +	MHI_EVENT_CONFIG_DATA(1, 128),
> +	MHI_EVENT_CONFIG_HW_DATA(2, 1024, 100),
> +	MHI_EVENT_CONFIG_HW_DATA(3, 1024, 101)
> +};
> +
> +static const struct mhi_controller_config modem_netprisma_lcur57_config = {
> +	.max_channels = 128,
> +	.timeout_ms = 20000,
> +	.num_channels = ARRAY_SIZE(mhi_netprisma_lcur57_channels),
> +	.ch_cfg = mhi_netprisma_lcur57_channels,
> +	.num_events = ARRAY_SIZE(mhi_netprisma_lcur57_events),
> +	.event_cfg = mhi_netprisma_lcur57_events,
> +};
> +

The config looks similar to 'modem_quectel_em1xx_config', so you can just reuse
it.

- Mani

> +static const struct mhi_pci_dev_info mhi_netprisma_lcur57_info = {
> +	.name = "netprisma-lcur57",
> +	.edl = "qcom/prog_firehose_sdx24.mbn",
> +	.config = &modem_netprisma_lcur57_config,
> +	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> +	.dma_data_width = 32,
> +	.mru_default = 32768,
> +	.sideband_wake = true,
> +};
> +
> +static const struct mhi_pci_dev_info mhi_netprisma_fcun69_info = {
> +	.name = "netprisma-fcun69",
> +	.edl = "qcom/prog_firehose_sdx6x.elf",
> +	/* FCUN69 uses the same controller configuration as LCUR57 */
> +	.config = &modem_netprisma_lcur57_config,
> +	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> +	.dma_data_width = 32,
> +	.mru_default = 32768,
> +	.sideband_wake = true,
> +};
> +
>  /* Keep the list sorted based on the PID. New VID should be added as the last entry */
>  static const struct pci_device_id mhi_pci_id_table[] = {
>  	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0304),
> @@ -695,6 +750,12 @@ static const struct pci_device_id mhi_pci_id_table[] = {
>  	/* T99W175 (sdx55), HP variant */
>  	{ PCI_DEVICE(0x03f0, 0x0a6c),
>  		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
> +	/* NETPRISMA LCUR57 (SDX24) */
> +	{ PCI_DEVICE(PCI_VENDOR_ID_NETPRISMA, 0x1000),
> +		.driver_data = (kernel_ulong_t) &mhi_netprisma_lcur57_info },
> +	/* NETPRISMA FCUN69 (SDX6X) */
> +	{ PCI_DEVICE(PCI_VENDOR_ID_NETPRISMA, 0x1001),
> +		.driver_data = (kernel_ulong_t) &mhi_netprisma_fcun69_info },
>  	{  }
>  };
>  MODULE_DEVICE_TABLE(pci, mhi_pci_id_table);
> -- 
> 2.34.1
> 



-- 
மணிவண்ணன் சதாசிவம்
