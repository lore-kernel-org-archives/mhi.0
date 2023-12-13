Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA8A818
	for <mhi@lists.linux.dev>; Wed, 13 Dec 2023 18:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6ce9e897aeaso6489689b3a.2
        for <mhi@lists.linux.dev>; Wed, 13 Dec 2023 10:49:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702493375; x=1703098175;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QYvsi1BeF9vZr5nFKSjT9VCibEudQ5MsSdiBfCjNBkM=;
        b=QsTqwoqYRtGFAgdlCK0c6pSlKtjFFDDT4Smf8dSImJEy3gU/1deGNFvfxWeVYSA/36
         d6sewFrVCRB1Id76UGoLa6I8mje7Y5gWqeW4Be6PzzcW/Gs5Xw07mmUIXXzSNWjpaxqQ
         6+iat9B1CqUVxBoTcELCLpnaaY0UZ1jdFKkCB0i/4cCNa9O/pcTbB3fkiBAjDNirP1MY
         kc6soyrs5aDspn3p0XQ152qFPa3GXfgyVUtt16uaHi5iZfvGhcdajnLUdjfICLdIS2+E
         7skjM6QDn+AVh8ywGQH9hr7JFyQPA6yD0Cs1mo42wvbUoe7YdYBnr4+XBoyawzHuKnWf
         xfaA==
X-Gm-Message-State: AOJu0YzeGy55Z0ZV28c/ZQs/cL2mQ6aV1Rhzv1zqQJLWGH72RErBgIfh
	gvt05EoFsK7ZJta3Gciz+5JF3nFr9zVMQg==
X-Google-Smtp-Source: AGHT+IHbTzuBKGDSYgmQol7b/mqaHA3bV6bgpiSsqgzYkZOWUq77+BmvHTJKWeODi3tFFMrCo/GAJQ==
X-Received: by 2002:a05:6a00:2d9d:b0:6cd:d639:b353 with SMTP id fb29-20020a056a002d9d00b006cdd639b353mr10248064pfb.18.1702493375559;
        Wed, 13 Dec 2023 10:49:35 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id o73-20020a62cd4c000000b006c875abecbcsm10687034pfg.121.2023.12.13.10.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 10:49:34 -0800 (PST)
Date: Thu, 14 Dec 2023 03:49:33 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: lpieralisi@kernel.org, kishon@kernel.org, bhelgaas@google.com,
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/9] PCI: epf-mhi: Simulate async read/write using iATU
Message-ID: <20231213184933.GB924726@rocinante>
References: <20231127124529.78203-1-manivannan.sadhasivam@linaro.org>
 <20231127124529.78203-5-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231127124529.78203-5-manivannan.sadhasivam@linaro.org>

Hello,

> Even though iATU only supports synchronous read/write, the MHI stack may
> call async read/write callbacks without knowing the limitations of the
> controller driver. So in order to maintain compatibility, let's simulate
> async read/write operation with iATU by invoking the completion callback
> after memcpy.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  drivers/pci/endpoint/functions/pci-epf-mhi.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/pci/endpoint/functions/pci-epf-mhi.c b/drivers/pci/endpoint/functions/pci-epf-mhi.c
> index 34e7191f9508..7214f4da733b 100644
> --- a/drivers/pci/endpoint/functions/pci-epf-mhi.c
> +++ b/drivers/pci/endpoint/functions/pci-epf-mhi.c
> @@ -234,6 +234,9 @@ static int pci_epf_mhi_iatu_read(struct mhi_ep_cntrl *mhi_cntrl,
>  
>  	mutex_unlock(&epf_mhi->lock);
>  
> +	if (buf_info->cb)
> +		buf_info->cb(buf_info);
> +
>  	return 0;
>  }
>  
> @@ -262,6 +265,9 @@ static int pci_epf_mhi_iatu_write(struct mhi_ep_cntrl *mhi_cntrl,
>  
>  	mutex_unlock(&epf_mhi->lock);
>  
> +	if (buf_info->cb)
> +		buf_info->cb(buf_info);
> +
>  	return 0;
>  }

Looks good!

Reviewed-by: Krzysztof Wilczyński <kw@linux.com>

	Krzysztof
