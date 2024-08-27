Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19AAB1993A3
	for <mhi@lists.linux.dev>; Tue, 27 Aug 2024 08:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724747585; cv=none; b=QC5yAPY/963GD7aqzpiY6H1YbDBp7Y8dcnNZyuCbbyGmr8Ay1Q6IRFCiIXtrjEPGwLvgNWEhkV6u+ro40vLmMJfs14BIShlcc2XghFNR4o5EZghYclPNvWoUCYt52n6krcIZ7WMSn0N+uE3Mbfb7IZZaKMmEk8/XF7XkQRW4oks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724747585; c=relaxed/simple;
	bh=M0Q46YRt7b9YHADZL32hHtvvl7AwCNCHYajLxrNxZA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FPfWYTpPD8samePi8Qpdu1/lWGtshmGuz/D1955xwg+VZUf4hXnNCijGPXdMBVkM6OEgftjPev7WbABSv2jvXbywUS+mtr4YBg0OvM/X8dCHCOd/v0MIQKdzaO1fb+Y+ET8S4rCckTJ8EFQej61QdAIzmaKNzriV/YXXuNVmkew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a27i4nq5; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a27i4nq5"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2021537a8e6so46921675ad.2
        for <mhi@lists.linux.dev>; Tue, 27 Aug 2024 01:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724747582; x=1725352382; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zc3JzuFaE5GcnJFm2AtVlHywrBGXAOtwHwNOckOeDnA=;
        b=a27i4nq56YXJD37sXka3D9n7/Q188EThhgHy1RG4cKpOThLucGrhEEZ+h0pnkdndYh
         udN4+nWz5wS6Ki9jeqh3ji05qlhl6W21L4DBmxW+mxAVT/SlI9iChL51jna3yTMIIwo5
         VAN/bh4dL78/cv1Ybr2GRpODioGs/xZkhlRYFONOm44uKYmUFyzTs5hSJ2epZ8khKypV
         iWH4qpBDdjpeMxuKf0ZId+kk1ZDdvzlKZ2Yl+/dg2u2Brrhi3D0KEv1Qjpd8bFqRpLCf
         ZyppF9Sd6O8oYDixSj4WRTHsZMbHqvBnt4jFlDhOgS6KC+vRvUAwht76PGDG1F/j2f3a
         9vyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724747582; x=1725352382;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zc3JzuFaE5GcnJFm2AtVlHywrBGXAOtwHwNOckOeDnA=;
        b=ikuwmgHrLGui6oKnGg591Kx46L1NdjZVCeooWKE3NDkW72dkrNKZ+lmdz4c+HNGZSD
         M1bJwaI2RLblgA7Gkhg3J/u/rXrLJ160Dar2K1UbhXyTNfX9i1dnbGM9GD/XEc2m0zgb
         KnCs7jXuMxf4cGUfeeouP5XlBcvCCKLndLDjkfVukBoc0bGcVjFyBWgNhwBqgfrM3MXz
         26RABPvamRMsTVgQkdcJf6VwxL8tF+08lFnMoc/se4AuB2tT1IXzj377IdtWtvQ50NCB
         jbGLi5phXJiVvetGeN7FAPoFiKeddnm4bKx+tn87DvXCY1gKeLd+nc9veZXsq0J7WsQW
         4Cgg==
X-Forwarded-Encrypted: i=1; AJvYcCWXDNqHBDxg5ReDJHILQ+5hW/3kZ3PVT9MJRwbLdY+9Y5fnY9spWzKXOiYSDahWOymcjRs=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywk6oIrgXPsWbYfuKvLqsBTbvHrkeDvTsxUYNmsk4uzmGV/RhNv
	tk6xmtG4qwaPIcSSqEjPOc9eXoUKLb2wTLO8whQTliV9pWhti4hifele9rIwhQ==
X-Google-Smtp-Source: AGHT+IEMaGd8avwuLHYUKAq8n6l8KJIiU8JdyzSEAV7GOkwNV6F2xm4E9P821RIz07e0YabwVS5b4Q==
X-Received: by 2002:a17:902:ced1:b0:202:2c07:f50d with SMTP id d9443c01a7336-2039e4c1f94mr166376385ad.34.1724747582438;
        Tue, 27 Aug 2024 01:33:02 -0700 (PDT)
Received: from thinkpad ([117.213.96.164])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2038558be10sm78777365ad.118.2024.08.27.01.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 01:33:02 -0700 (PDT)
Date: Tue, 27 Aug 2024 14:02:55 +0530
From: "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>
To: Mank Wang <mank.wang@netprisma.us>
Cc: "duke_xinanwen@163.com" <duke_xinanwen@163.com>,
	"loic.poulain@linaro.org" <loic.poulain@linaro.org>,
	"quic_qianyu@quicinc.com" <quic_qianyu@quicinc.com>,
	"mhi@lists.linux.dev" <mhi@lists.linux.dev>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V2] bus: mhi: host: pci_generic: Add support for
 Netprisma LCUR57 and FCUN69
Message-ID: <20240827083255.ob7rusg2qd5alppw@thinkpad>
References: <PH7PR22MB30386647BE2D813B502226CF81942@PH7PR22MB3038.namprd22.prod.outlook.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PH7PR22MB30386647BE2D813B502226CF81942@PH7PR22MB3038.namprd22.prod.outlook.com>

On Tue, Aug 27, 2024 at 01:58:33AM +0000, Mank Wang wrote:
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
> Both of these modules create IP interfaces through MBIM.
> And these modules can be checked for successful recognition through the
> following command:
> $ mmcli -L
>     /org/freedesktop/ModemManager1/Modem/0 [NetPrisma] LCUR57-WWD
> 
> $ mmcli -L
>     /org/freedesktop/ModemManager1/Modem/0 [NetPrisma] FCUN69-WWD
> 
> Signed-off-by: Mank Wang <mank.wang@netprisma.us>

Applied to mhi-next!

- Mani

> 
> ---
> V1 -> V2:
> 1.Add comments to provide testing methods and IP interface creation methods.
> 2.Remove unnecessary comments.
> 
> Signed-off-by: Mank Wang <mank.wang@netprisma.us>
> ---
>  drivers/bus/mhi/host/pci_generic.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 14a11880bcea..2c44aab8695a 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -26,6 +26,7 @@
>  /* PCI VID definitions */
>  #define PCI_VENDOR_ID_THALES	0x1269
>  #define PCI_VENDOR_ID_QUECTEL	0x1eac
> +#define PCI_VENDOR_ID_NETPRISMA	0x203e
>  
>  #define MHI_EDL_DB			91
>  #define MHI_EDL_COOKIE			0xEDEDEDED
> @@ -680,6 +681,26 @@ static const struct mhi_pci_dev_info mhi_telit_fn990_info = {
>  	.mru_default = 32768,
>  };
>  
> +static const struct mhi_pci_dev_info mhi_netprisma_lcur57_info = {
> +	.name = "netprisma-lcur57",
> +	.edl = "qcom/prog_firehose_sdx24.mbn",
> +	.config = &modem_quectel_em1xx_config,
> +	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> +	.dma_data_width = 32,
> +	.mru_default = 32768,
> +	.sideband_wake = true,
> +};
> +
> +static const struct mhi_pci_dev_info mhi_netprisma_fcun69_info = {
> +	.name = "netprisma-fcun69",
> +	.edl = "qcom/prog_firehose_sdx6x.elf",
> +	.config = &modem_quectel_em1xx_config,
> +	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> +	.dma_data_width = 32,
> +	.mru_default = 32768,
> +	.sideband_wake = true,
> +};
> +
>  /* Keep the list sorted based on the PID. New VID should be added as the last entry */
>  static const struct pci_device_id mhi_pci_id_table[] = {
>  	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0304),
> @@ -778,6 +799,12 @@ static const struct pci_device_id mhi_pci_id_table[] = {
>  	/* T99W175 (sdx55), HP variant */
>  	{ PCI_DEVICE(0x03f0, 0x0a6c),
>  		.driver_data = (kernel_ulong_t) &mhi_foxconn_t99w175_info },
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
