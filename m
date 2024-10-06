Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AEE189B81
	for <mhi@lists.linux.dev>; Sun,  6 Oct 2024 18:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728237947; cv=none; b=lgI30CDrz60Mm9mD1WzUw6iSl7k6iB8gg8hSWVdyLdZT4U8ewwkup445BJHg181EFX0eAh0y7XuquOuk221P4lZMriKj93mTn+GOzHJnraGtcz8cMG8EGkFfulGacsTtExkoBfH+jX+z2Tdrwh/f36r2BbY2TRmSQQlp7lmqq6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728237947; c=relaxed/simple;
	bh=CeCY6OlU97fOl5fAIAjg4El2sF2r4zcPwjhHQh45MiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T1PkD9D2jb8eyyLgCy1WgQM643kldAmWjMyYmSsydOPzJe3AGNS0tah7Fjf/TLWU+tzsnnn5UQ6KC3nDlxoFE0ErqdrdRtmr4akf2EdAOaHHFzqTfVG8HHdRtu+s4zDLMcOnfnAJWmE61bRDTy7HN7WqokC3FjRqnVvVNf0fBt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N8FZnqoR; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N8FZnqoR"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2e0a060f6e8so2657106a91.1
        for <mhi@lists.linux.dev>; Sun, 06 Oct 2024 11:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728237945; x=1728842745; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+egSknvcric7COXOJEt3WaLe0bXI3f03zAkyGMKR7x8=;
        b=N8FZnqoRjml9BcWKH4IP0YMvVNMCricC7DI22gTk45SfMuZ8Z+Ibz33tAuDnG1E9Q0
         9HgZGrfVh2V4hPqVwH/zAYVbScXwwkI+93/T8rfT/uuvLFDzhDgom5EnE9wBkNcMbx5W
         wet5QFKtODSJ3s3JZUJhPJEvl4Twr1Z+FB5SGaEHkRr1Hw/8g8iV283n8VZFI+4Hy4j6
         GUCGUmvf/yXojMNCpTj9WPzO5TlE4wk+USDtTk9t87o/50A1ZWWYrWcOHRMk9nAuN7PN
         L745w/t39V2vCuX7xDPe7Yc9mejs0KeJoEHE+1EM4jXuhGtfV6iQVSbGXJC+l7xQ1i+0
         FYrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728237945; x=1728842745;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+egSknvcric7COXOJEt3WaLe0bXI3f03zAkyGMKR7x8=;
        b=QHGVlMtzyzJQHvfi2SepapP6pgdYpdm6HBkZ/9bGwAsEDQ0aSPUnsU94rb9vTTJjF6
         +lq86uoFt8gVKN8YXvt2NUwM+Ah9OxJSIAr0QliWYmHFL6LJkiipMZpgiHYzsDqJVgED
         9KVUfLubN7W+NEpuA+EQVvl5+cSwa9W4trubghFVfDJbSVjjd4AfXLXbAfBNXzJbo3Lh
         QUvdZaVStle34Z7/6xhcYAyy2UWv4PZjAoBke7HwOsWNe4AT5TzLW73jMle5W7Fxz9dZ
         alpa3bxKtBWD79/iOKCRLNNAAoFnopGV+b2XkK2/6FTqpGiW5Iwd+q0TlXEAPQIIyPDD
         Lj/w==
X-Forwarded-Encrypted: i=1; AJvYcCUEV5LGEej+cj55iSJnuk0GoLr6rWePomCTor1yD96Jn9id9RgbUIdG1F/YIACXBhPUpIM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwVgwM760H8CfKI4vUGI/yxIzGQHeDgpF/4Zx58MbYhJ70xcoZ7
	CqxcLOMQYhhjTD56niI1h6ncMm/PB26BtbA4FzWFzBPWsi5JH8RqrUpBgPpo1A==
X-Google-Smtp-Source: AGHT+IFNIq/a9CYHxz6Nm/b1lVN0D3Q3ap4lFm5Vk/bWNcJrztvixtRP8zufCmXOjRckcJJ0KhVydg==
X-Received: by 2002:a17:90b:4a45:b0:2e0:921a:3383 with SMTP id 98e67ed59e1d1-2e1e620f326mr11675222a91.1.1728237945016;
        Sun, 06 Oct 2024 11:05:45 -0700 (PDT)
Received: from thinkpad ([220.158.156.57])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e20b0f7690sm3689924a91.42.2024.10.06.11.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 11:05:44 -0700 (PDT)
Date: Sun, 6 Oct 2024 23:35:38 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Fedor Pchelkin <pchelkin@ispras.ru>
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Kalle Valo <quic_kvalo@quicinc.com>,
	Carl Vanderlip <quic_carlv@quicinc.com>,
	Sujeev Dias <sdias@codeaurora.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Siddartha Mohanadoss <smohanad@codeaurora.org>, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alexey Khoroshilov <khoroshilov@ispras.ru>,
	lvc-project@linuxtesting.org
Subject: Re: [PATCH] bus: mhi: host: free buffer on error in
 mhi_alloc_bhie_table
Message-ID: <20241006180538.l6ghaz5vopld5qa5@thinkpad>
References: <20240207065136.18316-1-pchelkin@ispras.ru>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240207065136.18316-1-pchelkin@ispras.ru>

On Wed, Feb 07, 2024 at 09:51:36AM +0300, Fedor Pchelkin wrote:
> img_info->mhi_buf should be freed on error path in mhi_alloc_bhie_table().
> This error case is rare but still needs to be fixed.
> 
> Found by Linux Verification Center (linuxtesting.org).
> 
> Fixes: 3000f85b8f47 ("bus: mhi: core: Add support for basic PM operations")
> Signed-off-by: Fedor Pchelkin <pchelkin@ispras.ru>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/bus/mhi/host/boot.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
> index edc0ec5a0933..738dcd11b66f 100644
> --- a/drivers/bus/mhi/host/boot.c
> +++ b/drivers/bus/mhi/host/boot.c
> @@ -357,6 +357,7 @@ int mhi_alloc_bhie_table(struct mhi_controller *mhi_cntrl,
>  	for (--i, --mhi_buf; i >= 0; i--, mhi_buf--)
>  		dma_free_coherent(mhi_cntrl->cntrl_dev, mhi_buf->len,
>  				  mhi_buf->buf, mhi_buf->dma_addr);
> +	kfree(img_info->mhi_buf);
>  
>  error_alloc_mhi_buf:
>  	kfree(img_info);
> -- 
> 2.39.2
> 

-- 
மணிவண்ணன் சதாசிவம்
