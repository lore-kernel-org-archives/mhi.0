Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A338189B9B
	for <mhi@lists.linux.dev>; Sun,  6 Oct 2024 18:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728238323; cv=none; b=Cqh/OXpfNNRypfBi5ZwfB3+qanhnT7bG2f/ZVTjg8/BGSin0rCeAq5g7kXaRAOSODU+YxSQCaMbSG3PngWrIVcp+qkR5VQpj+L294Iq3XVIIkzb9l9VOLyEJSwLRGScLLywkC7T3Z0Id40wwWnfQWFaKZRimGRBKB2bwUgxSiZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728238323; c=relaxed/simple;
	bh=3t9+E9CkOzIKHHSuceCwjRc7U0X0Sf01y7bJoxelwWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RVGSt8gTY+h/23NGDaw3hTNANwfg5ZR9GsO3asbnwxyiucG8nIGP487qXJfm8wbZPtmZDAjn/GkuCQhDwbxOcnUAU9ok0xLRaGE1/dI4JaJIuX9ApBDE+pruZBmOkz0eCkozG/vDCPaOt2KDwV0PEd32TdeJppOsx9UX6+pYKS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E94iH0Zg; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E94iH0Zg"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-20b58f2e1f4so24417885ad.2
        for <mhi@lists.linux.dev>; Sun, 06 Oct 2024 11:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728238321; x=1728843121; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ifUrSYHSPVHdHJVoduKWjUHX04NMhaW9v3wwctCAnpY=;
        b=E94iH0ZgpEO9o7DC+WNsam1IwqY8W+NT/+WzTfQ8gnE9wlWuj+N+CAQ69lU8KGUG9X
         rqC0ld0r2GGFbstGdXgS+aqEGUPDx3WxBWZSbeDgxQs9+RBldjzJ8XasU65tCFTg6pQl
         XvDiqCBSZT02bfVuRbE36du0nH3fbZM7T3W211GY69EX2WFdWEXy+2nJZ5hNhEFBrWbp
         VUc2FJhaiNWxhmPQiy1MawH44IhykIEWXnFIj5xr7l/irk+f1DdKyMHfd5y+diJHiXrS
         AAw1TR5qHdx3Fz7c/ScU4iZrre+1dHZ7ZfGd/MCNkoJKVksj3tbHW3SVoWZirhFgIqi3
         kJOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728238321; x=1728843121;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ifUrSYHSPVHdHJVoduKWjUHX04NMhaW9v3wwctCAnpY=;
        b=V1Cc56GDZdyRi1LHdGZUVbXt5ddyOppCv7a6ckLg+ecK0e72A/eAsn7fAD4dIQEE9L
         lsbfGQlgmdM8nEHMB11m3DGRmkT0lrdCP8kFGwjK0ZqDhqz6bJsOURtVrpDsoV5ANSQ6
         AdRaXMGJLznRmmW1kQ64/yXUU5CAzQII9AJqlXXc7LDTnPvkoZnIOoNBnjX/Bti22kXb
         mG6V4yZoub2WmsKlusTwbJCcXThoWonjgODzb3/fSuHo3TCQLGh3Mf1kSk3gD8Rg37n2
         9sjJo0FoDFR9mMHTIC9fYQgL406IIwac+RRVzqgc5JiHRpx+t+v9mIHiyjAe25ggG/fu
         bI/g==
X-Forwarded-Encrypted: i=1; AJvYcCWR2S2HV8qDYMKAdUe2HHghJcsW4awjQ+9M702DSCsV/QyAkD+MxumoO8x66gApPZC8L38=@lists.linux.dev
X-Gm-Message-State: AOJu0YzN1CyLEDu8WO9nU5Pr+04cFelr5uAtQ2J1zKFbLVVyXLZPWg21
	KVTM0gt52DJFi+4W8xuhdEhmo/KL848vkrYl2KWiUewvfbIPDHiAreMUSLFOCA==
X-Google-Smtp-Source: AGHT+IGsV/4alrASeuoSgOfzTV6TQhEtk58m258R8GIYcduuYNXsWKmOLFCw4X2JUrLC+VGgGpHEMQ==
X-Received: by 2002:a17:902:cecb:b0:20b:b0c1:712b with SMTP id d9443c01a7336-20bfe05e682mr132892225ad.15.1728238321593;
        Sun, 06 Oct 2024 11:12:01 -0700 (PDT)
Received: from thinkpad ([220.158.156.57])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c139a4b50sm27426525ad.306.2024.10.06.11.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 11:12:01 -0700 (PDT)
Date: Sun, 6 Oct 2024 23:41:58 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Carl Vanderlip <quic_carlv@quicinc.com>
Cc: kernel test robot <lkp@intel.com>,
	Jeffrey Hugo <quic_jhugo@quicinc.com>, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus/mhi: Switch trace_mhi_gen_tre fields to native endian
Message-ID: <20241006181158.s6g6h2lwn6vxgv2o@thinkpad>
References: <20241004170321.4047492-1-quic_carlv@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241004170321.4047492-1-quic_carlv@quicinc.com>

On Fri, Oct 04, 2024 at 10:03:20AM -0700, Carl Vanderlip wrote:
> Each of the __field() macros were triggering sparse warnings similar to:
> trace.h:87:1: sparse: sparse: cast to restricted __le64
> trace.h:87:1: sparse: sparse: restricted __le64 degrades to integer
> trace.h:87:1: sparse: sparse: restricted __le64 degrades to integer
> 
> Change each little endian type to its similarly sized native integer.
> Convert inputs into native endian.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202402071859.8qMhgJEQ-lkp@intel.com/
> Signed-off-by: Carl Vanderlip <quic_carlv@quicinc.com>

Applied to mhi-next!

- Mani

> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> ---
>  drivers/bus/mhi/host/trace.h | 25 +++++++++++++------------
>  1 file changed, 13 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/trace.h b/drivers/bus/mhi/host/trace.h
> index 95613c8ebe06..3e0c41777429 100644
> --- a/drivers/bus/mhi/host/trace.h
> +++ b/drivers/bus/mhi/host/trace.h
> @@ -9,6 +9,7 @@
>  #if !defined(_TRACE_EVENT_MHI_HOST_H) || defined(TRACE_HEADER_MULTI_READ)
>  #define _TRACE_EVENT_MHI_HOST_H
>  
> +#include <linux/byteorder/generic.h>
>  #include <linux/tracepoint.h>
>  #include <linux/trace_seq.h>
>  #include "../common.h"
> @@ -97,18 +98,18 @@ TRACE_EVENT(mhi_gen_tre,
>  		__string(name, mhi_cntrl->mhi_dev->name)
>  		__field(int, ch_num)
>  		__field(void *, wp)
> -		__field(__le64, tre_ptr)
> -		__field(__le32, dword0)
> -		__field(__le32, dword1)
> +		__field(uint64_t, tre_ptr)
> +		__field(uint32_t, dword0)
> +		__field(uint32_t, dword1)
>  	),
>  
>  	TP_fast_assign(
>  		__assign_str(name);
>  		__entry->ch_num = mhi_chan->chan;
>  		__entry->wp = mhi_tre;
> -		__entry->tre_ptr = mhi_tre->ptr;
> -		__entry->dword0 = mhi_tre->dword[0];
> -		__entry->dword1 = mhi_tre->dword[1];
> +		__entry->tre_ptr = le64_to_cpu(mhi_tre->ptr);
> +		__entry->dword0 = le32_to_cpu(mhi_tre->dword[0]);
> +		__entry->dword1 = le32_to_cpu(mhi_tre->dword[1]);
>  	),
>  
>  	TP_printk("%s: Chan: %d TRE: 0x%p TRE buf: 0x%llx DWORD0: 0x%08x DWORD1: 0x%08x\n",
> @@ -176,19 +177,19 @@ DECLARE_EVENT_CLASS(mhi_process_event_ring,
>  
>  	TP_STRUCT__entry(
>  		__string(name, mhi_cntrl->mhi_dev->name)
> -		__field(__le32, dword0)
> -		__field(__le32, dword1)
> +		__field(uint32_t, dword0)
> +		__field(uint32_t, dword1)
>  		__field(int, state)
> -		__field(__le64, ptr)
> +		__field(uint64_t, ptr)
>  		__field(void *, rp)
>  	),
>  
>  	TP_fast_assign(
>  		__assign_str(name);
>  		__entry->rp = rp;
> -		__entry->ptr = rp->ptr;
> -		__entry->dword0 = rp->dword[0];
> -		__entry->dword1 = rp->dword[1];
> +		__entry->ptr = le64_to_cpu(rp->ptr);
> +		__entry->dword0 = le32_to_cpu(rp->dword[0]);
> +		__entry->dword1 = le32_to_cpu(rp->dword[1]);
>  		__entry->state = MHI_TRE_GET_EV_STATE(rp);
>  	),
>  
> -- 
> 2.25.1
> 

-- 
மணிவண்ணன் சதாசிவம்
