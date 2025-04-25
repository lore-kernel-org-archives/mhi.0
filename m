Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E6922CBEE
	for <mhi@lists.linux.dev>; Fri, 25 Apr 2025 07:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745564659; cv=none; b=TohELjKKUV9Cg4KMOmgAY5siz6wdRq/9RNze/aH8jmVx3Y5yCosNgNHO2uOgvZd/qcgba0fWFVRkzdpPBTsGCBVZfn/d/ZeBl3dtiL0yLpuH3xEGp7/ecBWCLmI4Ybe3oc1EKT02PblsuQX72+nzYs2mnDB4RCihg/GFLxrO8aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745564659; c=relaxed/simple;
	bh=kiVsHOtAUvNtO6KMgCqWAVEF+ip5WZJK6X2lYcCFLyg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F9Fsk/wVfL9aE405z3nUY0gXIvzfeFZLZ9MYHIPJaTBMWNYe5xKLgnGiBUV6WrZP3D3vES0mZYABAd4Sfbff72nDBtRPqjWHhHgnhnI4Idv8ic2zT3/Av8hZb4MZLxJlIuWKI//sXxXNPcYtrhnSvxxZrJ5Naj4FjuADxTk3JZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=anYWsTCj; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="anYWsTCj"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-301cda78d48so2330794a91.0
        for <mhi@lists.linux.dev>; Fri, 25 Apr 2025 00:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745564657; x=1746169457; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8Te3ksqRJ+7OlpUSNfGlJHaCjELIs2UO0MQxGmKigXE=;
        b=anYWsTCj57GPrEv87Fnf6/HGTdKBQe/Zld+UpJu6mVILJkWOB+ZWY734CnBB0nbrSc
         DpsrszWAg381sO86mH0uTfRjFfm7rnWarFltyi1HJpVqrz62GHDRch9awtFPyd+GUNj5
         1+xMGsBDPIqL+xKxVcQ1pbPmF1BXPdDXZp3MMNh99Ka+BTLS0Ud9tNZELsSeWqKen0UR
         L47U/NNDHeZtXnloxRErvjH30G/hU5xFg5zC+3gFsEc4EuJwRK/4yWpymK6qtphjXR6c
         0Myl1Etz2MBIQd9w9NztDhu8aHWlaM08+XDVFkAxLMxB3fOvKzm3SMq24tDTWCq0VhT9
         6Nxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745564657; x=1746169457;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8Te3ksqRJ+7OlpUSNfGlJHaCjELIs2UO0MQxGmKigXE=;
        b=uqlYi4gLvHQgnurtzmpi25YMAZGARlEI8X2VxWzkv2+2o01iBIw4S1SS9kA4FsVlyL
         DsXAPMbCYVr/nzgOFHgQyvmwlLVAXq7v7I1GqJwotqbQCSfurK+8pm1MMAr0J61iffpw
         9Eiu9cseRn6LEJYIY+mkVf/feSduPY7XVvIEJ2iK3akX86vYBT9SajIhUxhydw6BdIQx
         pwy8wKf09Oy2qEVhcJpc7R6N0z2+GWRFSmvs6mzDFG24fOzRGDRwuXit1uwVpfMGvvuu
         IV8WRhuit2s8iBnpzr/9a0fNzW2FybhThwj5FnMCg6xDh+zCT96KGgnwK54FbXHLD41m
         +8tw==
X-Forwarded-Encrypted: i=1; AJvYcCUnbv3sgKgly55jPxClyinwXKkz978yDZqlz2w28Hiiz9ref6fstxuwD21vKGPlSdw8URU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwwEuHeSnde5G8j5DFTKcSHMJvk1m0I/lhjiY3rzlJl6sYNXBk+
	7JbeSmUoap/giALjrYDG7k1HqT8lHUPZ+C0Wg/uRsjtKb9wZXtP9TAmHtLevwg==
X-Gm-Gg: ASbGncsgxOVDT/UOH3yrXVNc+IJSam4YkHLMpA7jQbrSIoQtvLlClqMyP0RwLU1RSSy
	RmDou9YxzuSLyd9w6Gm7ACtXLM5xtl9macc7OhrkFORlWaKY4FhHfG2pph6dgl0LPy1Wg3TKtfI
	sI1sWAVkI6+kcRyxv1gmsSAKrsif317wToTN0iBsPc1IkMPRIgx8ifj/WFpDobOkqlWFINTSxgX
	07fbUs2nhELYB+LYcrb1deky9CjPJY5hS2PDYxqVk0wYK1r6CH1AnidQiya88fa5IfN1onP0EXV
	N9lNiQmrIEGzZa0xhcblVszGq4hYvY03GuIL3f0+UAncV9q+gHQ=
X-Google-Smtp-Source: AGHT+IFprbi4xKoK9kQYGafLrF0iV6P6sf27aP6lhIQIfke7L6VaLDQhys8cFeKJ/FRwTwPktrq5xA==
X-Received: by 2002:a17:90b:2f4c:b0:2ee:53b3:3f1c with SMTP id 98e67ed59e1d1-309f7d99200mr2192871a91.5.1745564656964;
        Fri, 25 Apr 2025 00:04:16 -0700 (PDT)
Received: from thinkpad ([120.60.77.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5102ddcsm25163355ad.190.2025.04.25.00.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 00:04:16 -0700 (PDT)
Date: Fri, 25 Apr 2025 12:34:10 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, 
	Jeff Johnson <jjohnson@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>, 
	Yan Zhen <yanzhen@vivo.com>, Youssef Samir <quic_yabdulra@quicinc.com>, 
	Qiang Yu <quic_qianyu@quicinc.com>, Alex Elder <elder@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kunwu Chan <chentao@kylinos.cn>, kernel@collabora.com, 
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Subject: Re: [PATCH v2] bus: mhi: host: don't free bhie tables during
 suspend/hibernation
Message-ID: <h2wv7drxntokziiwbzjw5xjzbctbomp6cfcba7ppfbih6o7so7@p6dazv32xfx4>
References: <20250410145704.207969-1-usama.anjum@collabora.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250410145704.207969-1-usama.anjum@collabora.com>

On Thu, Apr 10, 2025 at 07:56:54PM +0500, Muhammad Usama Anjum wrote:
> Fix dma_direct_alloc() failure at resume time during bhie_table
> allocation. There is a crash report where at resume time, the memory
> from the dma doesn't get allocated and MHI fails to re-initialize.
> There may be fragmentation of some kind which fails the allocation
> call.
> 

If dma_direct_alloc() fails, then it is a platform limitation/issue. We cannot
workaround that in the device drivers. What is the guarantee that other drivers
will also continue to work? Will you go ahead and patch all of them which
release memory during suspend?

Please investigate why the allocation fails. Even this is not a device issue, so
we cannot add quirks :/

> To fix it, don't free the memory at power down during suspend /
> hibernation. Instead, use the same allocated memory again after every
> resume / hibernation. This patch has been tested with resume and
> hibernation both.
> 
> The rddm is of constant size for a given hardware. While the fbc_image
> size depends on the firmware. If the firmware changes, we'll free and
> allocate new memory for it.
> 
> Here are the crash logs:
> 
> [ 3029.338587] mhi mhi0: Requested to power ON
> [ 3029.338621] mhi mhi0: Power on setup success
> [ 3029.668654] kworker/u33:8: page allocation failure: order:7, mode:0xc04(GFP_NOIO|GFP_DMA32), nodemask=(null),cpuset=/,mems_allowed=0
> [ 3029.668682] CPU: 4 UID: 0 PID: 2744 Comm: kworker/u33:8 Not tainted 6.11.11-valve10-1-neptune-611-gb69e902b4338 #1ed779c892334112fb968aaa3facf9686b5ff0bd7
> [ 3029.668690] Hardware name: Valve Galileo/Galileo, BIOS F7G0112 08/01/2024

Did you intend to leak this information? If not, please remove it from
stacktrace.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
