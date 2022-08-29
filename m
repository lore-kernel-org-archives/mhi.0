Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8CE35C80
	for <mhi@lists.linux.dev>; Mon, 29 Aug 2022 17:37:14 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id q63so8303204pga.9
        for <mhi@lists.linux.dev>; Mon, 29 Aug 2022 10:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc;
        bh=Fkoh2h30kMhqCuC31iqPKQ6kesLynBjH+mbXyYZdhLY=;
        b=sCFOZvH+2eh1OZtmE6B/ACBH9iz0Wvrm24jFHkkW8a024urratxB82kB2pN16CuQ82
         iC4tyXB9l0u4Se7pQBkyiw3GQZZtDS2Q6OY1FXDE2iijluUicblM1205CFft0rxJFR6Y
         Cy/rbpkKKUF7kNBQyhB/WbTsar0jSuevk3ziNAQm5kZYw8boSveyESKEbejzc2WWlLcB
         18/jNzPnlY79F/VCfRU4psOb0PrCfT/Ip9TloeNe5hMcHOljkEq9OyFZyQKoSrZLrDyZ
         G90ZtEQUEZt6ubAhzsOSrE9y9CaUmyhV2K05mv1WucvtCBm8H/2pdulZdOEq6PXwJ699
         gPaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc;
        bh=Fkoh2h30kMhqCuC31iqPKQ6kesLynBjH+mbXyYZdhLY=;
        b=z0h7x9J8SAwV+Fv+2FFg8c0ZZkT8DSdXWv6VUVkwMxHa37eXzJd8k/6XmaOYYn0qKk
         +moWQcg+ycDBOT14E/cNdgS+vuhcqt1gqqGirHH4HBna7wdenJlEwOLPNvljlIXqiIGL
         xUGqZqKFIGktTg4i/5N5mRRb31EL0w83BBh6npdPuG49qcYewdJ/ska5z45Cz0G+IpbO
         USq7MCwrADMVJXZS9SKB3xYoNVcjxVbThGsorCCuNAxIYXOZBRUiBje09LWtqjTyq0Jh
         mNeN+2GWgGexKkit0b2+Nu/skUw8ZZggOWZEqox/dF+Y+P6QIMtjiyvH8kYbuGgxJ/u/
         j1ZQ==
X-Gm-Message-State: ACgBeo35aQbUQ7AksCNPxJS1bszX20VLhQFK2S7kT2eQ65zJ1rtxFiO8
	qD69yRvjB0ESksMdj0f/HfVU
X-Google-Smtp-Source: AA6agR7eON9r54t1QBnyz2lw+budQ0QaSxpWtfgikJ3R3FUl9yDn/P97PXcCx3YXwpqiXUYpOsQXdg==
X-Received: by 2002:aa7:81c6:0:b0:535:2aea:e29f with SMTP id c6-20020aa781c6000000b005352aeae29fmr17641264pfn.78.1661794634148;
        Mon, 29 Aug 2022 10:37:14 -0700 (PDT)
Received: from thinkpad ([117.193.209.245])
        by smtp.gmail.com with ESMTPSA id n6-20020a170903110600b0016ee26224a4sm2697329plh.305.2022.08.29.10.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 10:37:13 -0700 (PDT)
Date: Mon, 29 Aug 2022 23:07:08 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Koen Vandeputte <koen.vandeputte@citymesh.com>
Cc: mhi@lists.linux.dev, Koen Vandeputte <koen.vandeputte@ncentric.com>,
	loic.poulain@linaro.org
Subject: Re: [PATCH] bus: mhi: host: always print detected modem name
Message-ID: <20220829173708.GC84762@thinkpad>
References: <20220819083615.251960-1-koen.vandeputte@ncentric.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220819083615.251960-1-koen.vandeputte@ncentric.com>

+ Loic

On Fri, Aug 19, 2022 at 10:36:15AM +0200, Koen Vandeputte wrote:
> This harmless print provides a very easy way of knowing
> if the modem is detected properly during probing.
> 
> Promote it to an informational print so no hassle is required
> enabling kernel debugging info to obtain it.
> 
> The rationale here is that:
> On a lot of low-storage embedded devices, extensive kernel
> debugging info is not always present as this would
> increase it's size to much causing partition size issues.
> 
> Signed-off-by: Koen Vandeputte <koen.vandeputte@ncentric.com>

The justification makes sense to me.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/host/pci_generic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 9e545f2a5a26..51e2b901bae0 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -841,7 +841,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  	struct mhi_controller *mhi_cntrl;
>  	int err;
>  
> -	dev_dbg(&pdev->dev, "MHI PCI device found: %s\n", info->name);
> +	dev_info(&pdev->dev, "MHI PCI device found: %s\n", info->name);
>  
>  	/* mhi_pdev.mhi_cntrl must be zero-initialized */
>  	mhi_pdev = devm_kzalloc(&pdev->dev, sizeof(*mhi_pdev), GFP_KERNEL);
> -- 
> 2.34.1
> 
> 

-- 
மணிவண்ணன் சதாசிவம்
