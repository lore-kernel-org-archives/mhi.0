Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E19C18C34B
	for <mhi@lists.linux.dev>; Wed,  5 Jun 2024 07:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717571815; cv=none; b=ucUAFM8TWXtUtevPv1VuYfwZf7IZ/g18gRd16qp0oiFER+Qswv4/xJnH7eqOwihaQwYiCxJ3+a9hnStdwVaTprVH/lrmJF6k6E6DXOGd+HPw8e/E9GqQfk53jqdB659J61KF7fr2slueLQeGRn7DYUTOOM+HbpPnAleUqbBwWRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717571815; c=relaxed/simple;
	bh=LA7fFwtJTUSwn2dkZM8K68mfKZKK2dTySLuN6I/FshY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tYuVxuqtjE9GBrzV0R/KmQ06yRn+hEwK1oPCRBT+LehVycOMN0z2ux8Lj5TMQARVc893TVbMpgoFH31MSfF8ypWJoUoAMtUOm7Jwn1cDwlBUF98Q+x3Cs4oJjivkBidlKnihMfxW2nqyQPq/QiVvlNUyVTH1MrwcuGMoM8AZizM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tZlC4ayS; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tZlC4ayS"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-702621d8725so3842420b3a.0
        for <mhi@lists.linux.dev>; Wed, 05 Jun 2024 00:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717571813; x=1718176613; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4vfzJjKeGHGpUgDcno/RVJLd5UySDu362eov994HPLk=;
        b=tZlC4aySI9Qf4Y2L4Scu1JbLyr2pm9nr/AQYqR430w7gAGsIfIYZsYvw/Q7iw/f5lk
         m5p4c44GabVYd3RPZaXzRq/u2YAQ980ZHG5PLwCg6apMwwkVAE/pGIs12PXRLd9h7275
         E703/drfNCGeeuuJ86fKyBGHrg9Gh7lDGEyoDIIZesIIpi8hdI5OS3u28HF4Qr3tgwj1
         P0T4Q2CifPT09iNU7KSrbIRupsiLfuAOsJ9dBMHPoGv3iTiIxM1r3aQCzBmucSwYA5mw
         az9gX/QmLv0pFCNlQWZ71791dYxSaRt0/SXaJpvPq9+nAeYFXKI6tYhXD38rgrSqOBaH
         ZmnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717571813; x=1718176613;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4vfzJjKeGHGpUgDcno/RVJLd5UySDu362eov994HPLk=;
        b=l9+IYApPZP+iXtw3H3rWRzaUQycBhYstUfS0MJrea6JQ+lbfM7cROeezzC81I+QamY
         AJX2H3qJc21HT3pYK7jWwop1RuKuLXQ9CNM6h0akbG9F0W4cIjFwb5PnIgLxi60NOFkE
         Pn5u5cdh2iCmjkq00YHW5ua5h65V3KN4wE0d0YHK8qyilwsavZiPGDvrbET1ffHdUNeC
         7CZDJufsrpmY9r6Tz77Xlg9g+ucCKbRwu39Cdw9LpM+fyoYl+2IZr2qDobX+baCA+s39
         5Zz7eD8/+svr1bUjjzmtYH3uwMgyPGC6fKIr6eKd2POoYPy2NMLLpjbx7fOlt6BnJJcb
         xDEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUvZoB5V5yirhQfe6+t5NION5txH/LRLTqHJLj6VN458atRbDDWTtZlMPmQ+p49sKB0uymvm91M8YGgip7xCvAqrp8
X-Gm-Message-State: AOJu0YxfYJ420NNlhtOvT4PDUC5yEHngwl1W2x4QSkzWWWot6db5j1lX
	mbkbTg/ULSzwDTHyfYUhm2oWkTJ6DVu+rW9MOYRrSBIJa76DqL71iH76glzB1w==
X-Google-Smtp-Source: AGHT+IHgMOU9oCWpJwVlXnUxs6AfoCJ5z42b5im/p4607Z9+iJGsyRo1YafudQB8bl9exf3bkKTmeg==
X-Received: by 2002:a05:6a20:12cf:b0:1b2:b4d6:2729 with SMTP id adf61e73a8af0-1b2b70026famr1926898637.30.1717571813204;
        Wed, 05 Jun 2024 00:16:53 -0700 (PDT)
Received: from thinkpad ([120.60.137.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6323ff9f3sm97438795ad.247.2024.06.05.00.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 00:16:52 -0700 (PDT)
Date: Wed, 5 Jun 2024 12:46:48 +0530
From: "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>
To: mank <mank@netprisma.us>
Cc: "duke_xinanwen@163.com" <duke_xinanwen@163.com>,
	"loic.poulain@linaro.org" <loic.poulain@linaro.org>,
	"quic_qianyu@quicinc.com" <quic_qianyu@quicinc.com>,
	"mhi@lists.linux.dev" <mhi@lists.linux.dev>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V2] bus: mhi: host: pci_generic: Add support for
 Netprisma LCUR57 and FCUN69
Message-ID: <20240605071648.GA5085@thinkpad>
References: <LV3PR22MB5104E2E4AD0A22D1B8FD2AAAB0F92@LV3PR22MB5104.namprd22.prod.outlook.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <LV3PR22MB5104E2E4AD0A22D1B8FD2AAAB0F92@LV3PR22MB5104.namprd22.prod.outlook.com>

On Wed, Jun 05, 2024 at 07:01:17AM +0000, mank wrote:
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
> ---
> V1 -> V2:
> 1.Change 0x203E to 0x203e
> 2.Remove redundant code and use existing config:modem_quectel_em1xx_config
> 
> Signed-off-by: Mank Wang <mank@netprisma.us>
> ---
>  drivers/bus/mhi/host/pci_generic.c | 29 +++++++++++++++++++++++++++++

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

>  1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 08844ee79654..21c1d750274c 100644
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
> @@ -606,6 +607,28 @@ static const struct mhi_pci_dev_info mhi_telit_fn990_info = {
>  	.mru_default = 32768,
>  };
>  
> +static const struct mhi_pci_dev_info mhi_netprisma_lcur57_info = {
> +	.name = "netprisma-lcur57",
> +	.edl = "qcom/prog_firehose_sdx24.mbn",
> +	/* LCUR57 uses the same controller configuration as quectel_em1xx */
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
> @@ -695,6 +718,12 @@ static const struct pci_device_id mhi_pci_id_table[] = {
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
