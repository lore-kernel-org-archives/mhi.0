Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DC62562E
	for <mhi@lists.linux.dev>; Mon,  1 Jul 2024 16:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719850800; cv=none; b=OUIZLi/nqJVs/Y9TVZKaDG0rRcZlOVSvLheN+EvTSaai1bvdR7cMm4kGtEcgqc4U5UMg4X5BcMXk/2b6RG50fDGIPCftzPGVUCoIpUY/wIp+lYR5sF3jYRyw/1hqReH7qNmzATWVmDqsMahaN1CodSHJUnWGmJUHibuWf6tD2TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719850800; c=relaxed/simple;
	bh=XH8Osb0c4CXWeNNmUjzFX2RRUGL1tu0cvHhkCktcXCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=shAaTUKDBKfzpnfHI4/chjwRN5VyJzQAplcpP+Z7Ioe7wn0RufuKLOaLx1AaGZffmNHojJz5vJd8dJDhbSsHpE4ERzEw/E97auC1skjIuvJvDL+8ZE+12h0lM1CYDcLYgEclD4d/8UtUuEqZpoyh2Z7frDwfJWmodUIDG/Wp4oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RK/OnKgQ; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RK/OnKgQ"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2c7a6da20f2so1768067a91.0
        for <mhi@lists.linux.dev>; Mon, 01 Jul 2024 09:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719850797; x=1720455597; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=npGZbPFkc3bZWaaUO0pnaqKWSuNckmKN9XglNUgbS7A=;
        b=RK/OnKgQ04yJI0+AGOmnZ0doCJ64bIoTPc2PPM5NqdXxu6uiV3R7Z4NAI9HNc2GFET
         3fkwto3ZVZ9d/dbAUAj70dh5Fx3t2HGqxOSkMiJBgrlzWWuWvTNpw4yjO1LCSdi3bdAY
         4IOpva4vh41t2wYbs3hcYD1GM2U8fsdw0KzwgTt6+Ex4k9bA1C93AaCbUIx4LgcfQiSz
         7K2z1wxIjlRdFRBZfnWwQFeVNOlKKqvqhLb53aWUYPUNly1CPMLv9Hi2jSjKWpOkZJeJ
         8IioLmHkoGEZmIYktzdAFHPv530PY/T/CZZxuasn/1zQNsp7EqHe3sEPXlr2GaUxnT9W
         VWeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719850797; x=1720455597;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=npGZbPFkc3bZWaaUO0pnaqKWSuNckmKN9XglNUgbS7A=;
        b=ovF/4wj1XlfP3tqfA0xeg6LeNU2VygYF4lgrAILQX6CWp+pZKD55NRbDBTks3ko3UO
         9kOC7+nNXl93wK9VW2cbmtveuVsPqRTjrIOxBjWPraajs5eyFOtebOFaAIpMtI3QF+gN
         x1/YhAZiFiAX13AOK0SGpyaSZkJYBIj2AGrWXT96i/Sag12DXzMOa4GeDQZCKn8X5cEO
         cwHItMPhmITEMnZcb1phjyg1cGNXrIilwM9wscA6G2WOGjudfoD+JtkdlaUd6XULwC89
         JKKlTD9b8ZebXklkArCu+5B6mczxdCQ75n8jRzbUAj63rMaTFlb7ZHDt3LYday8kEMEu
         rEVQ==
X-Gm-Message-State: AOJu0YyGZ0UPnslIYIKphBattnbEGwn85hJLKsDP3BXNzm8ZpvoA67Ww
	nMZQlkmGQbPDTrLmw6ypeUX6GZqtvbNog7QGvEbVDrvnRDXy5DUaI7IWkkkp2Q==
X-Google-Smtp-Source: AGHT+IGal1R5vzpDJ7sCzSGyMQEj1ejbiV5YpF8XbjBnrGN69ahWIq2HbSymiIabAN8Zgt3y/qBZgQ==
X-Received: by 2002:a17:90b:e0f:b0:2c7:c6a1:42d9 with SMTP id 98e67ed59e1d1-2c93d77c8d8mr2945206a91.49.1719850796986;
        Mon, 01 Jul 2024 09:19:56 -0700 (PDT)
Received: from thinkpad ([220.158.156.91])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c91ce17a8esm6956074a91.1.2024.07.01.09.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 09:19:56 -0700 (PDT)
Date: Mon, 1 Jul 2024 21:49:51 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Slark Xiao <slark_xiao@163.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] bus: mhi: host: pci_generic: Use unique
 'mhi_pci_dev_info' for product families
Message-ID: <20240701161951.GA133366@thinkpad>
References: <20240626053237.4227-1-manivannan.sadhasivam@linaro.org>
 <34a76874.acd9.1905479d200.Coremail.slark_xiao@163.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <34a76874.acd9.1905479d200.Coremail.slark_xiao@163.com>

On Wed, Jun 26, 2024 at 08:16:28PM +0800, Slark Xiao wrote:
> 
> At 2024-06-26 13:32:37, "Manivannan Sadhasivam" <manivannan.sadhasivam@linaro.org> wrote:
> >Currently, a single 'mhi_pci_dev_info' is shared across different product
> >families. Even though it makes the device functional, it misleads the users
> >by sharing the common product name.
> >
> >For instance, below message will be printed for Foxconn SDX62 modem during
> >boot:
> >
> >"MHI PCI device found: foxconn-sdx65"
> >
> >But this is quite misleading to the users since the actual modem plugged in
> >could be 'T99W373' which is based on SDX62.
> >
> >So fix this issue by using a unique 'mhi_pci_dev_info' for product
> >families. This allows us to specify a unique product name for each product
> >family. Also, once this name is exposed to client drivers, they may use
> >this name to identify the modems and use any modem specific configuration.
> >
> >Modems of unknown product families are not impacted by this change.
> >
> >CC: Slark Xiao <slark_xiao@163.com>
> >Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> Reviewed-by: Slark Xiao <slark_xiao@163.com>
> 
> >---
> >
> >Changes in v2:
> >
> >* Used 'mhi_foxconn_t99w175_info' for HP variant as well
> >
> > drivers/bus/mhi/host/pci_generic.c | 78 ++++++++++++++++++++++--------
> > 1 file changed, 59 insertions(+), 19 deletions(-)
> >
> >diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> >index 08844ee79654..35ae7cd0711f 100644
> >--- a/drivers/bus/mhi/host/pci_generic.c
> >+++ b/drivers/bus/mhi/host/pci_generic.c
> >@@ -419,8 +419,10 @@ static const struct mhi_controller_config modem_foxconn_sdx55_config = {
> > 	.event_cfg = mhi_foxconn_sdx55_events,
> > };
> > 
> >-static const struct mhi_pci_dev_info mhi_foxconn_sdx24_info = {
> >-	.name = "foxconn-sdx24",
> >+static const struct mhi_pci_dev_info mhi_foxconn_sdx55_info = {
> >+	.name = "foxconn-sdx55",
> >+	.fw = "qcom/sdx55m/sbl1.mbn",
> >+	.edl = "qcom/sdx55m/edl.mbn",
> > 	.config = &modem_foxconn_sdx55_config,
> > 	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> > 	.dma_data_width = 32,
> >@@ -428,8 +430,8 @@ static const struct mhi_pci_dev_info mhi_foxconn_sdx24_info = {
> > 	.sideband_wake = false,
> > };
> 
> Seems nobody use this mhi_foxconn_sdx55_info.  Please help remove it.
> 

No, it is used by a Qcom modem.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
