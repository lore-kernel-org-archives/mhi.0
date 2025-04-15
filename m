Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E86B274FC7
	for <mhi@lists.linux.dev>; Tue, 15 Apr 2025 07:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744702010; cv=none; b=kmk/mac9NOIHEV4nS+X1JFs+Pld5XwzOx5uGxdXMVV/sMUyBRzDIzTbzJUxCpPTBSORP1pMXfE1bEs8UmNVadoEJcvbIZI9whxVhshY9+T3Z2NiJ9DveMGB21NljsJ9tbqGWrAIOHCvlDVfaZSGh0AHKInToIcaydPqtx2KfefE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744702010; c=relaxed/simple;
	bh=ndmBc8dT+YUFbZUh8JSUskzkgEjtafSmthf85hpWieE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uyW+MBd4zBFuo4myPbveiX+Pb1n2K2LXHZuAFG0D4PVINdi3DDzDI1MX8iNvDIuezVTWAm0BSfBUqRFA8abTxtN89kK+nAXGAIrd2YrOLDG/cKqFOcSYqo05XyOY7gf7IvzTd0+Ps5PPpllD1aL+VUkWLApy+JTn/AeGraAygyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZAJQA7yU; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZAJQA7yU"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2279915e06eso55144925ad.1
        for <mhi@lists.linux.dev>; Tue, 15 Apr 2025 00:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744702008; x=1745306808; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fCJNaeHH0qeNbjhZ4y2YJBf4Ih9X6gqwUBqd6D7xbtk=;
        b=ZAJQA7yUNLMjFqr/f16fTRzmPrP60eDkPq1d9SCresLCdGjKusMqRWwfNvnCqKxjV9
         qMRsOtN2sJl7cZBqudcsz1o0Zn75ykjAqtsKJXf3FeiAtQAwKcXzC0j1mq2ljq4suaHW
         aDAws5JRbpzd5oLwJhOfhdqHe+C7iqjmKPiUB6k7BuKBPh2UnWLFH+3v7iDwixqpb84K
         YQNpPXyaLPlm6Xq+MhnX5C6oQoZWzjYkMV8GJwyE4PBOeZqGmzxN/obElQ5mpNNPoZt/
         CPGgCCjS9GufdIVN0iLREoeEYW3J0wo15FIs17CRJZZW3+oSA3cWr3hUnTPYJW1V+Bsd
         o7jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744702008; x=1745306808;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fCJNaeHH0qeNbjhZ4y2YJBf4Ih9X6gqwUBqd6D7xbtk=;
        b=rMS4Qhky/qWlbVDw07kynFfvCmcRj4FJ5QBvOomLf5xrsFdPQ5rnRa6kEyesKXU+mC
         +LxK9tnDpiSMDF5w82X8aaxq8jaB4/76pCdb4YKrjunlrPN2+GeASKS2aOWQz/gpYseh
         vOZF1f/nRO77lxIyZ3FS1KQo8KeyO2JulFY6Oel7w7D2kbCSD3LLPEquMmkCMkmrgVaP
         8flnOnr3o7cQQtpJZ+GDG/aJKcLkgKas+xSf15q1ssNImBnuTda7XkwZKBF0yjMC6IXZ
         IYQOO52UGdh/UYTD2+o1SSje0B6ulee9Uo1Htew5UM+Z+3JTAL2Vi4r7hSi2szAXD/ql
         O8sA==
X-Forwarded-Encrypted: i=1; AJvYcCXXLnT2DYK/aOBankzRTwRfRl48gdvVwHGHQzx4+IAcare3icM6L4jltw7LFKum9pPzdrk=@lists.linux.dev
X-Gm-Message-State: AOJu0YxQlFdfgX1MaDlG6PEzSFQH/vxGnAhIS8fArnVGEDkKl59ASWNb
	5Ic09rVydKOG49RZ4xniJ8pKJI+Dx+p4YwE8sA677nbgnFnGT2hwc3xkpW82eA==
X-Gm-Gg: ASbGnctPW99b0OTPns69O1dQRQkga3w7Fj4oBaWFfwmYeeWrB/g3Ztd/rjGNKfaKsPW
	wR8WNkV0csLqpDHBhOG6rMSKsy60vXhV2HixzNJSVDkrDfMgcVWye8zSxpjCwIbSBv/EA0z3+Kj
	jE2JF6cwnVdOSQaBMD4B0gIrfEb4SnQOdaAbHf1HKFAwSiZLjZK1ecs71Rd6Qz+aBkrMjl9I+S4
	IQEQRB49zGtfKkKpzPd+jZDxVAB3YI3p6LmH5N2x9iV8zI7RF3q6SvhDQsbRkgY76sFREvy1XaV
	Oe/nVkAxUsLSJTlM4cHlKpyWu5KLxpFz6PTsXJIg3DezL0r0Kg==
X-Google-Smtp-Source: AGHT+IHguLmuMIGRBsFlyspehfjQDN2w8AskD61wkAT+OvpAWkCdIa3KMt+LNv9RjQaYs4JZBwB+yQ==
X-Received: by 2002:a17:903:904:b0:227:ac2a:1dcf with SMTP id d9443c01a7336-22bea4bd870mr208246955ad.23.1744702007792;
        Tue, 15 Apr 2025 00:26:47 -0700 (PDT)
Received: from thinkpad ([120.60.71.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c93aa3sm110866935ad.149.2025.04.15.00.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 00:26:47 -0700 (PDT)
Date: Tue, 15 Apr 2025 12:56:41 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Sumit Kumar <quic_sumk@quicinc.com>
Cc: Alex Elder <elder@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_krichai@quicinc.com, quic_akhvin@quicinc.com, 
	quic_skananth@quicinc.com, quic_vbadigan@quicinc.com, stable@vger.kernel.org, 
	Youssef Samir <quic_yabdulra@quicinc.com>
Subject: Re: [PATCH] bus: mhi: ep: Update read pointer only after buffer is
 written
Message-ID: <gq4s5je4grjjqwhrmrqrurglm4kctnsslwr4kllxdyphy4re4d@kzacgpg7k3xj>
References: <20250409-rp_fix-v1-1-8cf1fa22ed28@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250409-rp_fix-v1-1-8cf1fa22ed28@quicinc.com>

On Wed, Apr 09, 2025 at 04:17:43PM +0530, Sumit Kumar wrote:
> Inside mhi_ep_ring_add_element, the read pointer (rd_offset) is updated
> before the buffer is written, potentially causing race conditions where
> the host sees an updated read pointer before the buffer is actually
> written. Updating rd_offset prematurely can lead to the host accessing
> an uninitialized or incomplete element, resulting in data corruption.
> 
> Invoke the buffer write before updating rd_offset to ensure the element
> is fully written before signaling its availability.
> 
> Fixes: bbdcba57a1a2 ("bus: mhi: ep: Add support for ring management")
> cc: stable@vger.kernel.org
> Co-developed-by: Youssef Samir <quic_yabdulra@quicinc.com>
> Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
> Signed-off-by: Sumit Kumar <quic_sumk@quicinc.com>

Applied to mhi-fixes!

- Mani

> ---
> ---
>  drivers/bus/mhi/ep/ring.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/bus/mhi/ep/ring.c b/drivers/bus/mhi/ep/ring.c
> index aeb53b2c34a8cd859393529d0c8860462bc687ed..26357ee68dee984d70ae5bf39f8f09f2cbcafe30 100644
> --- a/drivers/bus/mhi/ep/ring.c
> +++ b/drivers/bus/mhi/ep/ring.c
> @@ -131,19 +131,23 @@ int mhi_ep_ring_add_element(struct mhi_ep_ring *ring, struct mhi_ring_element *e
>  	}
>  
>  	old_offset = ring->rd_offset;
> -	mhi_ep_ring_inc_index(ring);
>  
>  	dev_dbg(dev, "Adding an element to ring at offset (%zu)\n", ring->rd_offset);
> +	buf_info.host_addr = ring->rbase + (old_offset * sizeof(*el));
> +	buf_info.dev_addr = el;
> +	buf_info.size = sizeof(*el);
> +
> +	ret = mhi_cntrl->write_sync(mhi_cntrl, &buf_info);
> +	if (ret)
> +		return ret;
> +
> +	mhi_ep_ring_inc_index(ring);
>  
>  	/* Update rp in ring context */
>  	rp = cpu_to_le64(ring->rd_offset * sizeof(*el) + ring->rbase);
>  	memcpy_toio((void __iomem *) &ring->ring_ctx->generic.rp, &rp, sizeof(u64));
>  
> -	buf_info.host_addr = ring->rbase + (old_offset * sizeof(*el));
> -	buf_info.dev_addr = el;
> -	buf_info.size = sizeof(*el);
> -
> -	return mhi_cntrl->write_sync(mhi_cntrl, &buf_info);
> +	return ret;
>  }
>  
>  void mhi_ep_ring_init(struct mhi_ep_ring *ring, enum mhi_ep_ring_type type, u32 id)
> 
> ---
> base-commit: 1e26c5e28ca5821a824e90dd359556f5e9e7b89f
> change-id: 20250328-rp_fix-d7ebc18bc3be
> 
> Best regards,
> -- 
> Sumit Kumar <quic_sumk@quicinc.com>
> 

-- 
மணிவண்ணன் சதாசிவம்
