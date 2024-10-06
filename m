Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2526B189B9B
	for <mhi@lists.linux.dev>; Sun,  6 Oct 2024 18:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728238220; cv=none; b=ZBobQDNAOw/FrfEHNd5YHNNMI+eM2PEbBQMSZ8Yjc/n29NZB3StwibsD7ahiGHKHiZDeJj8hpOUusHSK7+fZOmDUOxl9L4zOv9zGWDEwM7MGliWowM/bbGw+HiyIiHdXylLEDfGET/tOK8EqTK4rpQU+hYF/RDJEfZN2C5r2dFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728238220; c=relaxed/simple;
	bh=tyvbxifwMWiy/Z8kVkxRv1YDq9D+HXqbj1Klfr5PUKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uVp7eJdpyndATqrFOLICOV1svforTME1k6fxt/YzSIqblzK7iGPKpYr13r74fS2PNQB0aH0Hzk8pS4mVk/VIEhbVxqEytgVEO94SUY67k8v5p7CA3K5IivGjIZNa6ArfhvAJwuPYUEj8Ez/yK9c/l2o7/BleUKVmE6kTFNJ/Krk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K67Qz39A; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K67Qz39A"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2e0a5088777so2938247a91.2
        for <mhi@lists.linux.dev>; Sun, 06 Oct 2024 11:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728238218; x=1728843018; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=alq0/ty9V5DVTsQSf1CXAvLnpMyiTYdYqWaJUsZhyXU=;
        b=K67Qz39AMGKs4EGV/adWU88iCN4bG7kV8pqRkIeoOfutCSjR1II5IdnN/Z+lI920iJ
         yBw3LTnt0HBGyDAw9XPflBgndDGNgoRGb6k0H7xbYbUm3TZGeG1kL+GDOFcpsmtofQ/F
         31zroyQt9v73HUsVSkLWHyH1m66Jt15gimk7hRUO6KZR8KsovuWGAShqrXA0lSuLGsx1
         ePBQKgRUHHHN9olZk9Vb2V39vWkba+2Ra2IoPBsHRnm5XKK1CFfKrX+8ERheM3wQ/XQP
         Nj9GNCJDCnL+eYxX64DZ5JUy/ElKIWayDNctKfxNK+UD9rCK/xHKC1gac3BO7pV203wS
         ZWWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728238218; x=1728843018;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=alq0/ty9V5DVTsQSf1CXAvLnpMyiTYdYqWaJUsZhyXU=;
        b=JOvBlIL3sVA0RZXTzH9pvzsDPEkx9dz/ufKTSxzr5MRw3OqTpSaXyrm8qEj7A+Z94H
         DwcOeICtdUwKEmvGZt/qm49OikOrYn236ZZLQ8VY7VHUatSoQ661Ywd1uV43Q9H/RYvp
         lCE50SXkHLyu1bxLw6zcKAYj67RcAFkNqj5MJwvYwG5AWCW50HHEsb28CWPEsAnTHAMl
         CmGYwYctt29EunGGRzGQb/+GlocL+qbnJHtI5E1cC9Uh2LyKdjzt0qzDxDHQrKlNT/hi
         8IMcCSpwK3Nos5YiJjKKkkdMSYCZgakKRq/NM7ZDajpKzCllLrXXMo2JEVSK1QykxVWC
         6BFg==
X-Forwarded-Encrypted: i=1; AJvYcCVyPLVBTNP1N2OhKlGeLPzHGJiTHy1imv+LZoQZnwC3j42StaHGLGpyt3K+6lcWXWbkbfM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxK3JPHNi3Ulvswt9LOootwKgL/qSnka2osPFLlaPqPmKspUkaw
	1214LANfhyJjh63QYlg+ugOVEtakynvES/N2uTxSa0dPC5UcDwbwuEdgDCxCPg==
X-Google-Smtp-Source: AGHT+IGfiCjzJAhy3bQXncwCGgkKpHGA83Ya5LKYMrS0hnZoyIhokJpWAT35sCLFFIws5D/GysAuJA==
X-Received: by 2002:a17:90b:118c:b0:2d8:8d34:5b8 with SMTP id 98e67ed59e1d1-2e1e621da2dmr12182260a91.10.1728238218512;
        Sun, 06 Oct 2024 11:10:18 -0700 (PDT)
Received: from thinkpad ([220.158.156.57])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e1e86ac41csm5376102a91.55.2024.10.06.11.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 11:10:18 -0700 (PDT)
Date: Sun, 6 Oct 2024 23:40:13 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Carl Vanderlip <quic_carlv@quicinc.com>
Cc: kernel test robot <lkp@intel.com>,
	Jeffrey Hugo <quic_jhugo@quicinc.com>, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus/mhi: Switch trace_mhi_gen_tre fields to native endian
Message-ID: <20241006181013.2hd2b7clb6nmpeb2@thinkpad>
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

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

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
