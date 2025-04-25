Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818A01607AC
	for <mhi@lists.linux.dev>; Fri, 25 Apr 2025 14:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745592444; cv=none; b=Q0AUlsXplXY2B6Ccjlpa1VUPw/5ypy5cturPM6cE2kJLDUVpg0AwKYwoYPuNMsDtqurFxbv15FN/0QhDiPkKtT3g1YMxM9Kitb7A/9Yk3ojSM9s/xrKq8jlN/4o7gZ8cN5unpd8fjeGJFRBm+V5kSCBSRE3OYqdXBszbJ/vdAA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745592444; c=relaxed/simple;
	bh=fPAudd0pNdvSq70SAtg2Ygg2O9zP1xgrVtnfFsN3fh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oBRCZ0mvRa1k1ytjBVldijKeSczp+PZRN7Hf4sIr2FEvhjrimYaoZeDVVbg9A5Ibhh0YtXoVdl1GVjCCqRpxN0GkepggDkRWi1tUN5qTyU53Apj2KMuuY9HFcovJExgT1dV4nWVABPd+mPKOrNktrArIMbJxIQBDR6nP+vnuSjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WQMMUQ0S; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WQMMUQ0S"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-223fd89d036so30555925ad.1
        for <mhi@lists.linux.dev>; Fri, 25 Apr 2025 07:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745592442; x=1746197242; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tMds6CmcdH779xJQucw6BprWPQmeQRUV0l1L2HM0TV4=;
        b=WQMMUQ0Sc8pfcUAwKjKX2FWB2/cgSOqZwu3gskO66iQRRhHpaAAgDO/LMxJ696kchy
         kZH7zIJ1udOM+GMuK+GXXAzL3O6xavwY+wbfyNBG/oFGNvGAHokyevBdpt/kioX/XHLJ
         yAY0KMYKkXrYhbVbmIktIKEypUv2hCEV/tJRNTygg9pjkYgS0JUvpdn+Y1R99WXBWV5x
         eKmYch6LLM/XszH9E81yNkOKuX9CmowcjZc8H80TYvcgfMzDGJwJ6mDEAamAuz9HwqbC
         4aXSbkuFeX52ZRkBIXJC7YZ3QpNc20eEkX9zZ8R9L3hvs0d0Omi3U9jpVIbwHh399jD/
         VoaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745592442; x=1746197242;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tMds6CmcdH779xJQucw6BprWPQmeQRUV0l1L2HM0TV4=;
        b=MD/5ZOnX+R/Klq5S5+qN4rwgkQ1oQok4fj8lVgwZdjqN8ecc2f5l49YgyYqhl2kTmw
         HnnTRAyDeoh7nquO26ARVidd/Ef5sFvpC1JSeEs6iH4l03ZFKjiHOpHLlKLD0u0Cj0om
         3Q8sXML6B4PYqGuhADNBgRDcjJdjt38fLOBoXz3EHJxgax3w9wTUrnNNTJjG+FHxfedn
         dg8t2zXav1rzYvNuh71wh/UgB48BIHDAgUVNuZaEcQplb0m688HSrREvqeF8xgQToY50
         SokW7OAjRPalB9uJLYa7CaWmf8ai/opcWtqyj/A4af6JOK/tPC07WcBvBot7WSma9Uud
         hm2w==
X-Forwarded-Encrypted: i=1; AJvYcCUjuIykfWKFwriYeMvkTKbufJrtbVUCG+824drswTsVukhR8GnaJrjbbZrcKHLhjgBzJqk=@lists.linux.dev
X-Gm-Message-State: AOJu0YyeNf686+2T2ltsMrGnuNd+h8/5qILD+nrXzuvI4GrxGdEL6Cue
	0U1zl7fpSlZ9d8Tp6gyjgv94bBLxbmdhoDKt3qHwZdOZ79ZOP+7YHVtzqNG9jQ==
X-Gm-Gg: ASbGncsCMJi4M56yTVdVP4cQ3xO8dqoaSiffDXggLj0VuQ//6EBXaiMKMGY09AsJGCa
	lq+qI6nzAkC/g1JZqjl7TTmMDss3o8xyq0NxiHpH9N/Yr2JzGFZUsaWGpRgR+KAsiUi3YCjv4/F
	r2lSB7XpSWyfB2yJCd5sZK8zMhAqfnFHmlubumoKAmVQSRUSgVlEZtXlkkUl23noGePltaboJ2t
	NDjv5CZFenRbsoWSp/AElIBUjQ+t7J54lXgc9VNyczq9R9REmK4rbdrkBdbryy5dnLiou1tp7IR
	e+SJtCz/RWa49Fmu56AdOYCW27PWq0aY7wMXKxu+5F0TjA2oWZ+L
X-Google-Smtp-Source: AGHT+IGlccZ19AfD3jdnufZp8LMe8Yz57J7vptNmjyBiI0lLh+m+16U65auA9epwL1IrRm+aNvHWgg==
X-Received: by 2002:a17:902:e805:b0:223:5de7:6c81 with SMTP id d9443c01a7336-22dbf5f34f9mr38226475ad.27.1745592441695;
        Fri, 25 Apr 2025 07:47:21 -0700 (PDT)
Received: from thinkpad ([120.56.201.179])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db521614dsm32962505ad.215.2025.04.25.07.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 07:47:21 -0700 (PDT)
Date: Fri, 25 Apr 2025 20:17:14 +0530
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
Message-ID: <eypd4xigl3yydfj47usazm7ca3kplz5w7bkk7qf6piks4vtaa4@rmecjnlfix66>
References: <20250410145704.207969-1-usama.anjum@collabora.com>
 <h2wv7drxntokziiwbzjw5xjzbctbomp6cfcba7ppfbih6o7so7@p6dazv32xfx4>
 <1136c7cb-1c7b-410b-93d2-c74aec939196@collabora.com>
 <cfb3sntvqhupyhm2m5tevpsl77r6mzl2aqzr3wtxvr22bezmp3@qjh7ftr2kdjy>
 <4d87ef88-3533-4255-adc6-6c268818fe25@collabora.com>
 <y5odcxzms6mwpz5bdxhbjxo7p6whsdgwm772usmmzqobhf6nam@p4ul7vn7d3an>
 <a403eb91-c90d-444c-b508-c428a8ef1447@collabora.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a403eb91-c90d-444c-b508-c428a8ef1447@collabora.com>

On Fri, Apr 25, 2025 at 04:41:43PM +0500, Muhammad Usama Anjum wrote:
> On 4/25/25 1:59 PM, Manivannan Sadhasivam wrote:
> > On Fri, Apr 25, 2025 at 12:42:38PM +0500, Muhammad Usama Anjum wrote:
> >> On 4/25/25 12:32 PM, Manivannan Sadhasivam wrote:
> >>> On Fri, Apr 25, 2025 at 12:14:39PM +0500, Muhammad Usama Anjum wrote:
> >>>> On 4/25/25 12:04 PM, Manivannan Sadhasivam wrote:
> >>>>> On Thu, Apr 10, 2025 at 07:56:54PM +0500, Muhammad Usama Anjum wrote:
> >>>>>> Fix dma_direct_alloc() failure at resume time during bhie_table
> >>>>>> allocation. There is a crash report where at resume time, the memory
> >>>>>> from the dma doesn't get allocated and MHI fails to re-initialize.
> >>>>>> There may be fragmentation of some kind which fails the allocation
> >>>>>> call.
> >>>>>>
> >>>>>
> >>>>> If dma_direct_alloc() fails, then it is a platform limitation/issue. We cannot
> >>>>> workaround that in the device drivers. What is the guarantee that other drivers
> >>>>> will also continue to work? Will you go ahead and patch all of them which
> >>>>> release memory during suspend?
> >>>>>
> >>>>> Please investigate why the allocation fails. Even this is not a device issue, so
> >>>>> we cannot add quirks :/
> >>>> This isn't a platform specific quirk. We are only hitting it because
> >>>> there is high memory pressure during suspend/resume. This dma allocation
> >>>> failure can happen with memory pressure on any device.
> >>>>
> >>>
> >>> Yes.
> >> Thanks for understanding.
> >>
> >>>
> >>>> The purpose of this patch is just to make driver more robust to memory
> >>>> pressure during resume.
> >>>>
> >>>> I'm not sure about MHI. But other drivers already have such patches as
> >>>> dma_direct_alloc() is susceptible to failures when memory pressure is
> >>>> high. This patch was motivated from ath12k [1] and ath11k [2].
> >>>>
> >>>
> >>> Even if we patch the MHI driver, the issue is going to trip some other driver.
> >>> How does the DMA memory goes low during resume? So some other driver is
> >>> consuming more than it did during probe()?
> >> Think it like this. The first probe happens just after boot. Most of the
> >> RAM was empty. Then let's say user launches applications which not only
> >> consume entire RAM but also the Swap. The DMA memory area is the first
> >> ~4GB on x86_64 (if I'm not mistaken). Now at resume time when we want to
> >> allocate memory from dma, it may not be available entirely or because of
> >> fragmentation we cannot allocate that much contiguous memory.
> >>
> > 
> > Looks like you have a workload that consumes the limited DMA coherent memory.
> > Most likely the GPU applications I think.
> > 
> >> In our testing and real world cases, right now only wifi driver is
> >> misbehaving. Wifi is also very important. So we are hoping to make wifi
> >> driver robust.
> >>
> > 
> > Sounds fair. If you want to move forward, please modify the exisiting
> > mhi_power_down_keep_dev() to include this partial unprepare as well:
> > 
> > mhi_power_down_unprepare_keep_dev()
> > 
> > Since both APIs are anyway going to be used together, I don't see a need to
> > introduce yet another API.
> I've looked at usages of mhi_power_down_keep_dev(). Its getting used by
> ath12k and ath11k both. We would have to look at ath12k as well before
> we can change mhi_power_down_keep_dev(). Unfortunately, I don't have
> device using ath12k at hand.
> 

ath12k conversion looks trivial. So please go ahead with this new API conversion
for that driver as well.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
