Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D6F10F2
	for <mhi@lists.linux.dev>; Tue, 15 Apr 2025 07:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744701872; cv=none; b=G35y/+NcK8JP4wcCfm79a/fJNP94uIBjA/6CZbrG0xYPoFf00ugshiip2bOjkB/bf7DSQC8glHCa36EVsB+gA0oXBICN9VrR9wCaG5SIQHgnU7gmKq8lq6ScpYI0bG1YW+/bQRtcx3xa7gi2W+LPPl/LoRXRNRRAj7AlAhjt0Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744701872; c=relaxed/simple;
	bh=au6q9Tu2dUAZ4s8DofqOWQ5I3CRvyrypPI+uPHden64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ScIFdB6H7iN1s8tg4qiyen9uUM6ziuBPUBPmcsw7BkfcYMXAXDVvMXma71lE31jvQD6u+VPWmMS3qfULHkl6Fol9Zelx3/j/c5J1eQYpPyNIa+rbhP3bi0Cbq9HDWnuFJ2iDVxNQn0TA9w+/B+aO4H8BkA+WLSF55W+WCpQmoVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WuuJHTYe; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WuuJHTYe"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2295d78b433so54071985ad.2
        for <mhi@lists.linux.dev>; Tue, 15 Apr 2025 00:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744701871; x=1745306671; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qu8kD86AXuKJZy4HIshJdpK/xBfLXn4kgIsnyKTrc7I=;
        b=WuuJHTYet5deYxkAW7xxgB3/1VZ/zvoRWYCUmyQFZKfFoqEHrc76F8zELUErmiZ5IN
         tplXBE3AOWONrV3YNf0PBuMbxQIEpVH3Gnj6W+Kc3l7jgLbjVvCnmvMNOHdjSrQcB4lv
         NGYxuOjBC8vTUV/8l6KJ58DuDR5peDnHCvJ+w8sX3MEabEq5BW3SB/RgjxT1yeYtWOLu
         IA+AKDUuNw/b3Ie+Nn6eRmHaobRGVEhLPin6DhEVPVxZWPxH7KJlIr3phrY9CkRXGzDv
         D7e0QPED2zg8H1aAHGi6193P7jazrqwT1gzBGt10Lx/kB7V/CRaf/1Xf2sLJk1nyU4s4
         7r5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744701871; x=1745306671;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qu8kD86AXuKJZy4HIshJdpK/xBfLXn4kgIsnyKTrc7I=;
        b=LTNEyCsJqULrJCrcdTC4iZ0syODags3cB/dwxJgvV/gohOy48UoIq/Zx3ffGNqF3LD
         qHrObmJ+hGW2mE9JHtM1X92Sa6z7k45ho6w9cweuMjIBDvUJ9MB0Oym2HULoxPFfhvMu
         h/fBRH//UPNpJ3Kwv+7eobT7l5Vj6ygT7vKz/bb1GV5jRs5vp326vhJ8evgK9F6PGJDk
         //BY9O7iki3yKBGr7DeXgA5qlJeRvCvHL+Z3hvPIUsQL3P9OwAqsph98tgO1+EmLOMkU
         v1eLS0ttvHX/9+oHzV9TLuCIlMr+XLJVIYJhpfQOugd+DJN0w0PtF4p30uX3tTWDsOmN
         FTew==
X-Forwarded-Encrypted: i=1; AJvYcCX7//4r+KpWBGYsPECowe+m4GkXvi3SKLOfqsIhovZIZnl0hOejGG2E7Eo4CNOEc1YSNec=@lists.linux.dev
X-Gm-Message-State: AOJu0YwinOalk0pR221136A2RPuyHM/jLeOyLWRu9wYqdLSTJe4ZceGh
	sHHZGcDupi33wk2NLhjkJIUvrYtLAi7z9Ee1dHWDTR6T9WVKDNraVN9Lq+qQDA==
X-Gm-Gg: ASbGncuJU0cCg7JviL5ZHO98aD7dEENE6c28PYt4ChJALzR7OnsJhkl8RaCTUbkNGSq
	/hgi9GdLyK/C06yoB6hSesqNr1zYjYI408OLIY7M3rUZJlG6BhodcCpkzkrw9LEcxmgIKsy5DW7
	styND8gqRNGnH9teIGTSFz+jwYwRIYTiZA5u/a2IV9ivmmZImxlDts3mDJZ1Ov00aX2zDGrAMRr
	EqgtfG/lhPwIB+pXTw7BfTD3MIhrUIXGa+BZQhfbIHbZtrdTxzuz1T7uzXJ3EqPaUFSPx9IhLib
	59gqVkaUhG8eahrzqsAYoWf3nvVDIXJ/BFE0t6DQqtq237UxfQ==
X-Google-Smtp-Source: AGHT+IGdiWkQMkaHTsiVcI4z3x+X4VzKPfKH5y/vEQa4WjmVHEMVpLvUUGLit5iWi2cXVeIM/nOIpA==
X-Received: by 2002:a17:903:41c2:b0:224:3db:a296 with SMTP id d9443c01a7336-22bea49e9e4mr204502495ad.2.1744701870704;
        Tue, 15 Apr 2025 00:24:30 -0700 (PDT)
Received: from thinkpad ([120.60.71.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c993a7sm110714665ad.146.2025.04.15.00.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 00:24:30 -0700 (PDT)
Date: Tue, 15 Apr 2025 12:54:24 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Sumit Kumar <quic_sumk@quicinc.com>
Cc: Alex Elder <elder@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_krichai@quicinc.com, quic_akhvin@quicinc.com, 
	quic_skananth@quicinc.com, quic_vbadigan@quicinc.com, stable@vger.kernel.org, 
	Youssef Samir <quic_yabdulra@quicinc.com>
Subject: Re: [PATCH] bus: mhi: ep: Update read pointer only after buffer is
 written
Message-ID: <74azjehrnf57ruhrkcqonuakm2iro5ehdvtudolcbrlrcjfvj4@ylqmug3wqdhs>
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

Hmm. I was under assumption that the host wouldn't access the rd_offset before
raising the interrupt.

But anyway, the fix looks legitimate irrespective of that.

> Fixes: bbdcba57a1a2 ("bus: mhi: ep: Add support for ring management")
> cc: stable@vger.kernel.org
> Co-developed-by: Youssef Samir <quic_yabdulra@quicinc.com>
> Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
> Signed-off-by: Sumit Kumar <quic_sumk@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

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
