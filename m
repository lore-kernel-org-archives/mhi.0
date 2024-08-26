Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B0A43ABD
	for <mhi@lists.linux.dev>; Mon, 26 Aug 2024 08:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724659570; cv=none; b=QwDWYXobbRwLGsav5gsJ5ReNBK+smXe3LfW7e2Ick2ZDjNgrjJcshKV2Sa7DLYe7jo5TuaTmvYOt+3w5J76nghF3uYeaU56ppuFSsbp5ZHLPKMc9KCOVlI3D8luKIxupyRyBGOsByeJUBONoMVpWN70/KxX2eJCBZpyO1cJXZj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724659570; c=relaxed/simple;
	bh=20T+z1/UbHbTVU1JoaoVQa/Dmn44LgaPG0dQ4LmTMiU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rUpQesqq5MHx5CbyPnKyOG7CrQ3CIxa6RxmZ3UGfoHxREPfv66m7y8itlrzeIWbXNni1jWdRmkQkAsSSvC+/uKBiHQjDeppaoEFWMzZnOQ5Hx8J6yVNjYTVOMFTWcMiGj9BbK7IWlNdf/W1i3W2yK1Iy3aWIb6qvlIK2KuInBHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XYeJO8YG; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XYeJO8YG"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-39d2e4d73bcso16669875ab.1
        for <mhi@lists.linux.dev>; Mon, 26 Aug 2024 01:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724659568; x=1725264368; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QkvVVX0WwYMRkuJr4fT+lZy5RdN02KU4cSUWfXWqpT4=;
        b=XYeJO8YGxFdKPcQydxh5HhddLzT4CWJ4DxajN/PyU+1NsX7jey4QzSlvJtYqDCNU6f
         pnVq28I2dvYItyFeX+zKeenvCaiEfG52Gkv3/z432R64ZNA7WguagrK2WrEVoLGbqJZz
         JO+zHCmc8BPvHkKQuLziVZvEAIVDyVYcDlLsAntUqZNKXMBwAonAuqBmzBdLE1XosFZN
         u/GhS6BnpNJAoS/9M5VzNSKQ8trpzx8uKVIzHuUXFDkhdh4NE8mgmMLLGhhFY+uT608X
         bo5NKn2Ylw9J0OxWurT64XSDDCvMiTmM/GrDHDESoulhLR5t20UtWjgoVcXJXoyxgPEI
         OG0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724659568; x=1725264368;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QkvVVX0WwYMRkuJr4fT+lZy5RdN02KU4cSUWfXWqpT4=;
        b=cCUKVIAVVIRXngAhcDsrJoFtZRg6sgFujxNyIhJXpSHQig63RGLKy2gEdA170qI/+8
         yElKUYtDlzbl5GhCF5UwWmeS6z6xcBdiNztkV3RCgyBR025RkHCeko2USfHpDrXw+pZx
         SmznuHJM5gxSS0Uxy7vyMhegJW29IDqU0QVV4WClvBELMgeghoorftzrXUR5SqtdiLb7
         A5Q1DQD895M3A1gbAhIqZgtMjktW2axYYU/7sZJ58lWHLg8bSgu7EPn8+vIe+3HqCT0f
         ZQ1JVddJ+LlkB0hyf/k3IVFmUJAEaJUKk9sDwFOLNfUBKjrH1af7PrYOcTLhnvQZuClT
         oTPA==
X-Forwarded-Encrypted: i=1; AJvYcCU95/xb+ygNfYXZrOg0jrbokBUx0Tb6mM0K1rEbPm0YWmA4RlxS/JBvFZApAb2vSaK28xY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9Y/WOWNx58M57sbg42HKLORBeVbJjp/G2MVPgPcnM+lTWd+DO
	buz0Z5EmWnTDwHMWqWHHfLvDKW0JZY2GhoWPZe8BrSUPwpxYv/Sbd+dQYZooSw==
X-Google-Smtp-Source: AGHT+IE14MNMnJz/dTmMXrxFZE1GO2GsfhXBXLXTNOED5Orn8DKvtf61Cpi9sYgA4TkhBdRdPZ3h9w==
X-Received: by 2002:a05:6e02:190c:b0:39b:2669:4e44 with SMTP id e9e14a558f8ab-39e3c985c60mr130046555ab.8.1724659568225;
        Mon, 26 Aug 2024 01:06:08 -0700 (PDT)
Received: from thinkpad ([220.158.156.53])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7cd9ac98b32sm7134309a12.2.2024.08.26.01.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 01:06:07 -0700 (PDT)
Date: Mon, 26 Aug 2024 13:36:03 +0530
From: "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>
To: Mank Wang <mank.wang@netprisma.us>
Cc: "duke_xinanwen@163.com" <duke_xinanwen@163.com>,
	"loic.poulain@linaro.org" <loic.poulain@linaro.org>,
	"quic_qianyu@quicinc.com" <quic_qianyu@quicinc.com>,
	"mhi@lists.linux.dev" <mhi@lists.linux.dev>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Add support for Netprisma
 LCUR57 and FCUN69
Message-ID: <20240826080603.joynf4hqklgt6kph@thinkpad>
References: <PH7PR22MB30388908C5E6DCE67E98C68681B02@PH7PR22MB3038.namprd22.prod.outlook.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PH7PR22MB30388908C5E6DCE67E98C68681B02@PH7PR22MB3038.namprd22.prod.outlook.com>

On Tue, Jul 30, 2024 at 03:01:05AM +0000, Mank Wang wrote:
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

Can you please add a note on how this modem is tested? Like using any modem
manager commands, how the IP interface is created (IPA or MBIM) etc...

> Signed-off-by: Mank Wang <mank.wang@netprisma.us>
> ---
>  drivers/bus/mhi/host/pci_generic.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 14a11880bcea..054420ca4c8f 100644
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
> @@ -680,6 +681,28 @@ static const struct mhi_pci_dev_info mhi_telit_fn990_info = {
>  	.mru_default = 32768,
>  };
>  
> +static const struct mhi_pci_dev_info mhi_netprisma_lcur57_info = {
> +	.name = "netprisma-lcur57",
> +	.edl = "qcom/prog_firehose_sdx24.mbn",
> +	/* LCUR57 uses the same controller configuration as quectel_em1xx */

No need of this comment here and below.

- Mani

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
> +	/* FCUN69 uses the same controller configuration as quectel_em1xx */
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
> @@ -778,6 +801,12 @@ static const struct pci_device_id mhi_pci_id_table[] = {
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
