Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34D713F01A
	for <mhi@lists.linux.dev>; Mon, 26 Aug 2024 08:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724660894; cv=none; b=kWfdCg2TlU9DpOUUPuJjHCtUaptuZfq8PNAliULFkV7GC5yM3IXg6B4u6qbxGArwYgh/3wzRvydz/O5FOXFStkRaZCFVborMjOQ77D1a7wqluTTXWkk8Z8/94y9wROl8H1MA/ztl4gPg59DUOdhtDgAoaZp9z16QYLPHJCrT3jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724660894; c=relaxed/simple;
	bh=vt7J5fux2isI7FeeCpAPhtTik4aGVuoRkW0tWzHij04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iP7C4TQ7zsU78UfOndAJMN2dRG/Vrg/3sP+J+pvGJ3kUmhie6r/+h8sye4MACJwSa17+MBDRldkioIUhH5h4UWNBmhLsQ8rk1xASs6mKcvJ30b1HCn58Chsp2+V9mRdnmUc0qPJx5iYvxJV0aOJ1AcYwO7ht/OiIQIUNPxfbnjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Bjk7XjWB; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bjk7XjWB"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-201d5af11a4so34948065ad.3
        for <mhi@lists.linux.dev>; Mon, 26 Aug 2024 01:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724660892; x=1725265692; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gnSngmqp5XPF4Gq535As1t8mXzDMy72BxOhWXC2WS8g=;
        b=Bjk7XjWB80yiiqzppKcanr4PMS4Kc3q1ziJSQwUlZM+TjkLWevnNXpGkI4EgPoW86k
         gcLQTlLJZJZVpd0vjgnaxUzUZsN0CxmXLQdLOx8cjnFOtAxIfDuBiEngnl1sBH3vg19G
         sE3ZN0A+VUxj7q7dqmRKXOuswpL1Gooqd6B5yNJt7F4YddI+8JoALSuLJ/e01BxmFUOF
         yzXcney3r7PBSTYSNSuQrhpgujnuKaO2Cvr2v4fhMauZoYu1NbD1DV9O27pg+5C3jhNY
         HKyj1MhaINMrUG7VdRCZG9woQs/SldC67Q3H0cqSqLn2MhzDXlGA7Y2RLyBFqOtvHRjs
         piIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724660892; x=1725265692;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gnSngmqp5XPF4Gq535As1t8mXzDMy72BxOhWXC2WS8g=;
        b=qZoB8gF9876AQQ559Q+qo8nyIORuIiQQmCt8WUnjwKVLEwKrNmzIaW6z3trXqlrfsN
         EGsDwclm4M1pE1qAf4KcEJGPK0KRKpvbFm0sai6kWr5Jtkuag1P8wYvBpsyVtuP1sHym
         zA+2fmv7VBBesYVduXGZAkFgvjzve1PIUGNWQ99uGI+sYuGM8iWc2041I02WzGdjJtFV
         K2ASv6WOaBy/ubkQFAyPBEwG0qGAepaZJ7zchSVJqMyOjS5tH3jwEEj4xegmY0nnXFi4
         s54aL3451gZ1I7USbcfqG86iO0I5X6//zS9NySPFPTkLa4kunTjwUF7zcjfBuyrwGnmZ
         +1Qg==
X-Forwarded-Encrypted: i=1; AJvYcCULpmchZZC0GSrMivyUuRyvVf7aCauPtBkjjbdwScitzhJkXf1cpqyrXy3QnSWLEM/hQBw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzRJpxzJnOGMdkWmdMUCrDptnUft8vhdE9EurRkFiOjjhMLfYxG
	oQTzBbTL3BkW7JQUiUqNMrc1jbzWz1vXysBxMKbQLs6qoSsUZVz+I+e473x9VKEdOx25x+87J/4
	=
X-Google-Smtp-Source: AGHT+IF4dF7YIx5UOBAuR3Levd85eEDnPi0e521uYSc593XVFS3WuJodpsylh0iqMs4OnqtH2tw+Tg==
X-Received: by 2002:a17:903:22c7:b0:203:a030:d0a1 with SMTP id d9443c01a7336-203a030df42mr113206305ad.58.1724660891917;
        Mon, 26 Aug 2024 01:28:11 -0700 (PDT)
Received: from thinkpad ([220.158.156.53])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2038560e53dsm63489725ad.191.2024.08.26.01.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 01:28:11 -0700 (PDT)
Date: Mon, 26 Aug 2024 13:58:08 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Fabio Porcedda <fabio.porcedda@gmail.com>
Cc: Daniele Palmas <dnlplm@gmail.com>, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Fix the name for the Telit
 FE990A
Message-ID: <20240826082808.gnsrbjfxvpqqi3fo@thinkpad>
References: <20240820080439.837666-1-fabio.porcedda@gmail.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240820080439.837666-1-fabio.porcedda@gmail.com>

On Tue, Aug 20, 2024 at 10:04:39AM +0200, Fabio Porcedda wrote:
> Add a mhi_pci_dev_info struct specific for the Telit FE990A modem in
> order to use the correct product name.
> 
> Cc: stable@vger.kernel.org # 6.1+
> Fixes: 0724869ede9c ("bus: mhi: host: pci_generic: add support for Telit FE990 modem")
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>

Applied to mhi-next!

- Mani

> ---
>  drivers/bus/mhi/host/pci_generic.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 14a11880bcea..fb701c67f763 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -680,6 +680,15 @@ static const struct mhi_pci_dev_info mhi_telit_fn990_info = {
>  	.mru_default = 32768,
>  };
>  
> +static const struct mhi_pci_dev_info mhi_telit_fe990a_info = {
> +	.name = "telit-fe990a",
> +	.config = &modem_telit_fn990_config,
> +	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> +	.dma_data_width = 32,
> +	.sideband_wake = false,
> +	.mru_default = 32768,
> +};
> +
>  /* Keep the list sorted based on the PID. New VID should be added as the last entry */
>  static const struct pci_device_id mhi_pci_id_table[] = {
>  	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0304),
> @@ -697,9 +706,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
>  	/* Telit FN990 */
>  	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, 0x1c5d, 0x2010),
>  		.driver_data = (kernel_ulong_t) &mhi_telit_fn990_info },
> -	/* Telit FE990 */
> +	/* Telit FE990A */
>  	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, 0x1c5d, 0x2015),
> -		.driver_data = (kernel_ulong_t) &mhi_telit_fn990_info },
> +		.driver_data = (kernel_ulong_t) &mhi_telit_fe990a_info },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0308),
>  		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx65_info },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0309),
> -- 
> 2.46.0
> 

-- 
மணிவண்ணன் சதாசிவம்
