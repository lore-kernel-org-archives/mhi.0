Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9536086F
	for <mhi@lists.linux.dev>; Tue, 30 Jan 2024 10:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706608861; cv=none; b=bI6VekUHgW05J1kRifrUC54pyvmpF4STxq+3r7XHFqk+JkUywICXpGFLznjPfjma/x6olDDRpA+yu+qk33aSME+a9hocTEEcsr04xzeo9AIqUVTbREUiE7QMudTFImHNzGyAHb49qhOE9d59RJLDAtU+7+MyLgUavowvNB8Couo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706608861; c=relaxed/simple;
	bh=hKlCC6YUzxSXpDs5Zn6rvnAxPGMT1RzEP6h13cQWdtE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UA8pkhwwoeAAIR9PJD1+zoBOtIFWih2Cn86OGX09Cc7yims3DuRBucwKc9ieqeOGffGxBOL1O0JU/QBqYPZU/LDn3fGPHkhyzzx9ilVQhhCVq5ba5lAgs1WduB439Obc8/oK4x9vVv7JKM1Ukm7e4NTk/58+HI4mA+4B/G7U6fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mi+PdG7d; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mi+PdG7d"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-50eabbc3dccso4633749e87.2
        for <mhi@lists.linux.dev>; Tue, 30 Jan 2024 02:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706608858; x=1707213658; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nyIC+0v2XinIiBdeUWjmL9g3EZvpHlLY+6DNNfN27Qo=;
        b=mi+PdG7d9E910Lb+npl6OEOT0tyRwhxiR7xrrKezhSE2NhlyDT1X1LKKleLCSr80DL
         vlcOpGkqzb4g5uHnviOiKHMD2BE2pE6qXSIk5/5vE6a7+UyL4fSHfudMT3XDvyYdqNUM
         UD/bJQG+/QImok59ModOfzqiRae0uLAVjZpfVLjH/ij8uxTjZHIu9zVjk7LC1sJnHX+I
         UhZHJmbVhpOzpYo88MOhsVcCGfFhTLO6a7+dF+cNz6LYkjrsOVaujPz1unpNcoY0lTWg
         WrqZO1QBiP220NgAqyuHzu+iifCTQFk9TkRV7VV5g1fEM79D/98au8pUzKVNvDUnR57v
         4STw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706608858; x=1707213658;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nyIC+0v2XinIiBdeUWjmL9g3EZvpHlLY+6DNNfN27Qo=;
        b=J6fHQzpvyWWWvqm5M+DKQWtNBBlEj+Cxft/5q2k/vfC9CNGg5XU1ixcdTmhOShnPTb
         YkWd2wrAuNpq6rY8hszd48i0sx/rPOn790fXNP7l2VNqfrnNYYpIPVDaET6gHidJMcuW
         TJMaS1mcFlLdBU2UNG4bmn0riJcLAoyvClnk1Offozl1zfyqO9hEx341eJ2TZMdeiW3u
         lc64qkajDginn4S9dDR6fOL6zjg1XIyoZN/p7Q8PMr+HMzSqZ1F2ZwylLRtD65gHnfbu
         CEv/uVJq0DxSa5SEaJrmP6tjII52Mc2sIwdDWUlakhPBGfJBg/uCXsyfY8+h94nQTJXx
         Y6Ug==
X-Gm-Message-State: AOJu0YwX29gnk+SDvUAnJISn7OS0m654xlFSSDCir0VvE6KESE19vkIF
	QWW9nXnqtO7q82Ja15BivxNcJbBdk2aWhhsMohu4xTf2h44OnmLrom+XICS0UtY=
X-Google-Smtp-Source: AGHT+IGmJxgGMmmaVLREQN6NVgyEYuTQSRRLERxVVt5MueMLM0D2kw3IvlV1xef3VoXvP3q+2nMlrQ==
X-Received: by 2002:a05:6512:138c:b0:50e:3e4a:f248 with SMTP id fc12-20020a056512138c00b0050e3e4af248mr6224744lfb.3.1706608857449;
        Tue, 30 Jan 2024 02:00:57 -0800 (PST)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id y8-20020ac24208000000b0051010608804sm1390457lfh.65.2024.01.30.02.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 02:00:56 -0800 (PST)
Date: Tue, 30 Jan 2024 13:00:53 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Mrinmay Sarkar <quic_msarkar@quicinc.com>
Cc: vkoul@kernel.org, jingoohan1@gmail.com, conor+dt@kernel.org, 
	konrad.dybcio@linaro.org, manivannan.sadhasivam@linaro.org, robh+dt@kernel.org, 
	quic_shazhuss@quicinc.com, quic_nitegupt@quicinc.com, quic_ramkri@quicinc.com, 
	quic_nayiluri@quicinc.com, dmitry.baryshkov@linaro.org, quic_krichai@quicinc.com, 
	quic_vbadigan@quicinc.com, quic_parass@quicinc.com, quic_schintav@quicinc.com, 
	quic_shijjose@quicinc.com, Gustavo Pimentel <gustavo.pimentel@synopsys.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev
Subject: Re: [PATCH v1 0/6] Add Change to integrate HDMA with dwc ep driver
Message-ID: <yfnvs3l5t7ggvdj2ebrwg7zmrn3r3su3t2xbvcfkwhb2q4sajv@ya3urqlwpzt7>
References: <1705669223-5655-1-git-send-email-quic_msarkar@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1705669223-5655-1-git-send-email-quic_msarkar@quicinc.com>

Hi Mrinmay

On Fri, Jan 19, 2024 at 06:30:16PM +0530, Mrinmay Sarkar wrote:
> Hyper DMA (HDMA) is already supported by the dw-edma dmaengine driver.
> Unlike it's predecessor Embedded DMA (eDMA), HDMA supports only the
> unrolled mapping format. This patch series is to integrate HDMA with
> dwc ep driver.
> 
> Add change to provide a valid base address of the CSRs from the
> platform driver and also provides read/write channels count from
> platform driver since there is no standard way to auto detect the
> number of available read/write channels in a platform and set the
> mapping format in platform driver for HDMA.
> 
> This series passes 'struct dw_edma_chip' to irq_vector() as it needs
> to access that particular structure and fix to get the eDMA/HDMA
> max channel count. Also move the HDMA max channel definition to edma.h
> to maintain uniformity with eDMA.

Thanks for the patchset. I'll have a look at it later on this
week or early on the next one. If you wish you can resubmit it by then
with the Dmitry' and Mani' notes fixed.

-Serge(y)

> 
> Dependency
> ----------
> Depends on:
> https://lore.kernel.org/dmaengine/20231117-b4-feature_hdma_mainline-v6-0-ebf7aa0e40d7@bootlin.com/
> https://lore.kernel.org/all/1701432377-16899-1-git-send-email-quic_msarkar@quicinc.com/
> 
> Manivannan Sadhasivam (4):
>   dmaengine: dw-edma: Pass 'struct dw_edma_chip' to irq_vector()
>   dmaengine: dw-edma: Introduce helpers for getting the eDMA/HDMA max
>     channel count
>   PCI: dwc: Add HDMA support
>   dmaengine: dw-edma: Move HDMA_V0_MAX_NR_CH definition to edma.h
> 
> Mrinmay Sarkar (2):
>   PCI: qcom-ep: Provide number of read/write channel for HDMA
>   PCI: epf-mhi: Add flag to enable HDMA for SA8775P
> 
>  drivers/dma/dw-edma/dw-edma-core.c           | 29 ++++++++++---
>  drivers/dma/dw-edma/dw-edma-pcie.c           |  4 +-
>  drivers/dma/dw-edma/dw-hdma-v0-core.c        |  4 +-
>  drivers/dma/dw-edma/dw-hdma-v0-regs.h        |  3 +-
>  drivers/pci/controller/dwc/pcie-designware.c | 63 ++++++++++++++++++++++------
>  drivers/pci/controller/dwc/pcie-qcom-ep.c    | 19 ++++++++-
>  drivers/pci/endpoint/functions/pci-epf-mhi.c |  1 +
>  include/linux/dma/edma.h                     | 18 +++++++-
>  8 files changed, 115 insertions(+), 26 deletions(-)
> 
> -- 
> 2.7.4
> 
