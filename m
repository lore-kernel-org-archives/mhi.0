Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D5613AD1C
	for <mhi@lists.linux.dev>; Sun,  6 Oct 2024 18:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728238020; cv=none; b=LyMTSex86SQ44zvDbTqtVQ+6BDTGy5zrW6VEps0qj84FYqTaw2mmx5cB8/Xr3St+2ZaLh7/nqDbD6DO5kZFdujpJMOS+Y0xsgROAGT/MpDWADvsob5hkmaV+WxDEo4lich/ZklurV3EfhcVtkUtrTMvkBIcu7jsPLzT5npngUaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728238020; c=relaxed/simple;
	bh=puSNQXAugT1xkNChFzu/b68+Xo9PvtlQ/j+G7gfjRXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S1s8kEmol+3bNYGnr5c0NiAb8z6z0pf7ocXfFg65t+yi2OszSu2dhEqJJkxuR5Zoqcumb63UlJSgiOZjGdCP1IFYIpeUgA62mZ5CH9FKht3gjMGmvZGCpl7c0ah9lKQb3ZHmEI+h18JkryJrffj56KMnchHGA1ZoUfpKtPOkpko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a9aEhrQA; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a9aEhrQA"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-71e023635acso201418b3a.2
        for <mhi@lists.linux.dev>; Sun, 06 Oct 2024 11:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728238019; x=1728842819; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R2rEk73CxsoDmlidARikf9pj5QBpTcv09pnBHqqK3GE=;
        b=a9aEhrQAGExu0ioECZlDuOeByqv/uEAm7umMG/+V0/doBOIoY1ZST22I1TAl/gKldr
         XI0EKcEY+cd/l9cuFcJ3e9VVkxYtHBldaQ3C0aQKBik9vgQucf8EGXF0j8BKfU3lYlDq
         1F4onHTyAtEun+fQOoVvWUmQJEC7JVcrpc6yfTBN1V6Ir5DHCgQyFpZe/PwnUExZb04K
         VQVxD9yEjaTNFpWiCQiHR9RpdG7d2LSdmLrgV2e3SnRV6QUpHM4sede8eEOnL+MdMhZu
         vq11yK/2KPI+ftAWVefGkjTiiWS09FzHY6HFI37D4i1rvLlSvM/y6dCfsY2ER1EnAwgn
         J2CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728238019; x=1728842819;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R2rEk73CxsoDmlidARikf9pj5QBpTcv09pnBHqqK3GE=;
        b=kTnAgauDpd0b/VlfbzWajqj0EBpqPBI1IglK501517zFQiuzOmij6pnmaEWP68QNjL
         xwfYJOHwiPYWvSgXPdkLB+QMTlTms33BpBE3drm2CPkkBYB5/fcp7u8EY9A7AScsRttD
         Qd2I6+zexlBsh2uIkD7BP03zR5R6lyRcbNsAjGTNuelDWSE3C2vfysutDESPmkfCdoX8
         75/lsSmSEt6/IgjR+0jWRmL6SRp+sClyfxRne74z0bKA1q0RqR5HHoyTCuVaNcXvUVL2
         BZoPu3FQtXyfzDTF6mp/Ftgh6oTqsPmdXG/NIU7zcIYx+KbxkLckWL+MjSHdMAEs0Xng
         Ti5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXsHleqmxIxW3ubU9uO0TyHC8zfcy3O30mBVDAhG5BfBVW2E2/rkZTSQvOaybyLUrwu2WE=@lists.linux.dev
X-Gm-Message-State: AOJu0YzXiiQTkIZ4J0tMfBIvRjiwGIYW2jUCC5DwbcZCjYcqUtxh1npO
	2NP3nCJVkEvnaydOUPY9vIMafZOE5WKn8EDLupHgOreg6JU5Tu0AZdRjTNAIgg==
X-Google-Smtp-Source: AGHT+IGOKKbGokCNKWe9GPDiqe2400mq6UX7Z9N6tQ4E61yzGsckC/W5+GtKYt0cqtRd192YkVp+oA==
X-Received: by 2002:a05:6a20:438c:b0:1d2:e78a:36a2 with SMTP id adf61e73a8af0-1d6dfa24b28mr13406852637.8.1728238018742;
        Sun, 06 Oct 2024 11:06:58 -0700 (PDT)
Received: from thinkpad ([220.158.156.57])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0d4a39bsm3103212b3a.97.2024.10.06.11.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 11:06:58 -0700 (PDT)
Date: Sun, 6 Oct 2024 23:36:53 +0530
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
Message-ID: <20241006180653.amrkwtlgjiggenny@thinkpad>
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

Applied to mhi-next!

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
