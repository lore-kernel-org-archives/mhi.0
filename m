Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F451131182
	for <mhi@lists.linux.dev>; Tue, 27 Aug 2024 08:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724747439; cv=none; b=p9tv/5beQvcb6Dqawj1zdbYaJWYD94+mlaIQdq2Wgsqhf/B78Aw14aCVFBDxcBTBsbcvEdL9AZq39Jruj4WiKKNzFDHGiPjFQZ9+bWWNgAtyvFu4R/mJBUi9iIZ5Zj+cs16zMXWogVqokEXIMsUBSXqoUJVwHkkHe55TJc18miE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724747439; c=relaxed/simple;
	bh=cvZH7fUYaeL9wrWckMOUxPYywvVUJJ7wNoFeMasAFh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DQTCtqlKT1Cw8npMs/r5ShPxwg6kKk9fu4f3N6Fo8p61gKcSqyFY4eEwC3yEbDYYHDVesAOWXfACEY8+EB7aIZurHIFRkJPmFyhGNe95bVf1zHMYRwo4zdrQbG7PwTBPTDmZ8tWof6LlZflcEC8ohBWlKaC9a6TCPh549kz0G5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vHNgQuMf; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vHNgQuMf"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-201fae21398so36110455ad.1
        for <mhi@lists.linux.dev>; Tue, 27 Aug 2024 01:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724747437; x=1725352237; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4PG1MKybPmHFMME9V8dY/+bhiqIyDMUmzSsge0xRow8=;
        b=vHNgQuMf8PMeb2Iyo68z6UUBfEPviGrpfeY+hbEmAXkrbdDo1Myncou0wqsGwC4uXX
         EGg5HpZnyia+i3o8NGVC26HRxmeWSDY74xm44fryihK/i5bvCTVhXSFJeXg9HCTQsAq9
         PS2leKdPv+0lxEjH4bnHy/5pMrm547f7Pk3nBGTk60Q0Yp+rTc8h0/Mt8gfGIIqKGeHE
         YypPNfZmDMvfqv/p2Y9IbS1XhTt+ERHp8j5M0FMXn/D73b26wafta/rsBkwNdRcN5AgR
         bhO7nP6e16TEnajsuU3dmuKbvUXWGvUr0lEu87d0OyrCbYRm//b1q4QzwRNnsir/CQ2V
         njCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724747437; x=1725352237;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4PG1MKybPmHFMME9V8dY/+bhiqIyDMUmzSsge0xRow8=;
        b=IDqHee5iYrIATuSoAkNis+ybcEzasfVOHWwmEayPa1Pe5HNnbiWoP16FOHj1DPx+QR
         YJHzPvB6lF36nHzYCv7TXaPGDd2uAdx4QS2eWv7SqL5pJI64aPyl2zU/V4gyYiacS98R
         TfWhr6k9oktJ2BIkWSmvqZjfiojl0l9MRf9VrBdb7lU3IHEkL47iKDDD26dNuoIcf90Q
         5vzQmyR0Aqsk580il2QbsvLzg0ihUf2hvWA/J9McZ3It0rziQH64CCUDLMKHpf01daD9
         cmoAhLgehNsX0G0nRykeEGQyatTkyZQ3RuN6BZTenHsFjfHDRFYo3V7BQk7K4ScblMwu
         kVRg==
X-Forwarded-Encrypted: i=1; AJvYcCXrD2RV0/7xte1cRzn2e+XJsu7Lq/o7krBAt/eG6KG77AteinCBDmjGMOaQIk7VlKnk6aM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxSFPdR2GbalF1PzHhfQqllRtpMbohUTI+OSqrHP6zb0lGLeA58
	chOA29HtNN5ajlVhzq8CgjQfm6igLy5jqh4KPVwXuRPe4nPBr1pZyKdanLgvFw==
X-Google-Smtp-Source: AGHT+IHduWJQyUiCIAY3p1Zf9ALxilUWiklFzc/QeC53bqPhevbARPCSsJCvuo+QiSMorgPzFKWzHg==
X-Received: by 2002:a17:903:11c3:b0:1fd:67c2:f975 with SMTP id d9443c01a7336-204df46c2bamr23997865ad.29.1724747437246;
        Tue, 27 Aug 2024 01:30:37 -0700 (PDT)
Received: from thinkpad ([117.213.96.164])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203855df8d0sm78923245ad.130.2024.08.27.01.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 01:30:36 -0700 (PDT)
Date: Tue, 27 Aug 2024 14:00:31 +0530
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
Message-ID: <20240827083031.pmo4627wizsnp2pf@thinkpad>
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

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

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
