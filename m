Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FF43C48D
	for <mhi@lists.linux.dev>; Thu, 14 Dec 2023 10:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E81kGTR/"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3b9e2a014e8so5727961b6e.2
        for <mhi@lists.linux.dev>; Thu, 14 Dec 2023 02:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702551314; x=1703156114; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IfG/ysGevH7N1+fittwEeggjkDoQ9clr+IHO2E1aJ/Y=;
        b=E81kGTR/P4DxBq4ZrtSAcjX4xu11MHOcU+4F446bMAHOO8zfTGjtQhpHsiF//xf093
         RhbK8UZ3iiMKV5CWBldCXNzIQX5kXeBrMR+Fl0CqP5SrTmbAYIQGU1atrFsnLL4Px815
         /w59oNu/Ro9BO2s194lNmOe0+5SeV1TaVwiC158OBoyo7dJtT3THjZVEXuqnrchfuEeR
         HeN8Z0Zkvy16MaDMCv8dmZwsRJzOdVDm3fnAdmhkJhdu7AYZFPGXJG4B1fbMVRLjtOY5
         iKu49CJrzjprxpmbjIzJaAIvRKiWMv+JjvSYfKBxV/S8VeSij+em5cTuh9v09AEkHfcL
         NwIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702551314; x=1703156114;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IfG/ysGevH7N1+fittwEeggjkDoQ9clr+IHO2E1aJ/Y=;
        b=vuoAxcQKt1E/ev7zB7ASpzhoN98HUVRIkqe5uVHXjX5yFwfHWdis2ZYVmYZGJK/dLx
         JTKvzqDYQWXuCWmkVJqoZhnNtCEECVazCXWR2qA22x99GwWGhHLdAkFdWlHOIJ57oEJN
         9TP8a3ln42s0+Am3KI3zdCSc6yRs+fgtbAuMPvvGH2ZOAOo8o+wzn7jU489Wf9CMczhG
         H/3DLJFp8bq8f417GkbzhuPk0n+oLMxmXV0JijyLYTkDJyPivOTsA5Fu5dmzANFMV10h
         2dAh7YePZ6P6NW16VApck6PnCxQYqZQ6GBsp8FrtX02fD7Thp+TpPEjaaL+9pLMwxTPQ
         faHQ==
X-Gm-Message-State: AOJu0YyemdoH19AogqyoVXENYlOhe3eTaXDduLdyTL8TqlEYKBDdZlV9
	akFns0xYcoqKgjUr4hGDJaYn
X-Google-Smtp-Source: AGHT+IH9dKZ7weDdopz65PuRKkbO/Mp6K8kuMEeI2h6VFnM6F5xt5c41hlBPLlHFALw9Ax8DidTESA==
X-Received: by 2002:a05:6808:1690:b0:3ba:3234:a068 with SMTP id bb16-20020a056808169000b003ba3234a068mr970504oib.110.1702551313755;
        Thu, 14 Dec 2023 02:55:13 -0800 (PST)
Received: from thinkpad ([117.216.120.87])
        by smtp.gmail.com with ESMTPSA id g25-20020aa78759000000b006d0951e74cbsm6780784pfo.178.2023.12.14.02.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 02:55:13 -0800 (PST)
Date: Thu, 14 Dec 2023 16:25:06 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: lpieralisi@kernel.org, kw@linux.com
Cc: kishon@kernel.org, bhelgaas@google.com, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/9] bus: mhi: ep: Add async read/write support
Message-ID: <20231214105506.GA48078@thinkpad>
References: <20231127124529.78203-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231127124529.78203-1-manivannan.sadhasivam@linaro.org>

On Mon, Nov 27, 2023 at 06:15:20PM +0530, Manivannan Sadhasivam wrote:
> Hi,
> 
> This series add async read/write support for the MHI endpoint stack by
> modifying the MHI ep stack and the MHI EPF (controller) driver.
> 
> Currently, only sync read/write operations are supported by the stack,
> this resulting in poor data throughput as the transfer is halted until
> receiving the DMA completion. So this series adds async support such
> that the MHI transfers can continue without waiting for the transfer
> completion. And once the completion happens, host is notified by sending
> the transfer completion event.
> 
> This series brings iperf throughput of ~4Gbps on SM8450 based dev platform,
> where previously 1.6Gbps was achieved with sync operation.
> 

Applied to mhi-next with reviews from Bjorn and Krzysztof for PCI EPF patches.

- Mani

> - Mani
> 
> Manivannan Sadhasivam (9):
>   bus: mhi: ep: Pass mhi_ep_buf_info struct to read/write APIs
>   bus: mhi: ep: Rename read_from_host() and write_to_host() APIs
>   bus: mhi: ep: Introduce async read/write callbacks
>   PCI: epf-mhi: Simulate async read/write using iATU
>   PCI: epf-mhi: Add support for DMA async read/write operation
>   PCI: epf-mhi: Enable MHI async read/write support
>   bus: mhi: ep: Add support for async DMA write operation
>   bus: mhi: ep: Add support for async DMA read operation
>   bus: mhi: ep: Add checks for read/write callbacks while registering
>     controllers
> 
>  drivers/bus/mhi/ep/internal.h                |   1 +
>  drivers/bus/mhi/ep/main.c                    | 256 +++++++++------
>  drivers/bus/mhi/ep/ring.c                    |  41 +--
>  drivers/pci/endpoint/functions/pci-epf-mhi.c | 314 ++++++++++++++++---
>  include/linux/mhi_ep.h                       |  33 +-
>  5 files changed, 485 insertions(+), 160 deletions(-)
> 
> -- 
> 2.25.1
> 

-- 
மணிவண்ணன் சதாசிவம்
