Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20AB217E4
	for <mhi@lists.linux.dev>; Fri, 25 Apr 2025 07:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745566379; cv=none; b=CBcUomakxHV0DioLMuWHAORbzWEsnXGYSU8oEasdCmBj77L1yVvdEiU9WBhxwJKl4PEiZGZnawqiK96gaHUKAob+z0qzYbLoR1Z/yi2LP4v+JCLZ/7YC4c5KeUgGN4AKrzDio5uyim5+2CGKYWdcDhIbxefm87k2XBtRTXVuMVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745566379; c=relaxed/simple;
	bh=aA0ZrtbPTCPf+u7y5/pHP9XzFYTNwoufRKaVyQtLdHY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SFlILqu4F99Kpd2Q+kVJAoedGMjPNolt23cuXWNKLPreN7eqx3/8Px++sakOFYOXcKAp5iHmV/+mvhUPyIb3PBJf2vkhdCsJHZm+daaZ5zWNOng2IpCgBzs1FJ5ZsNADblh43Rw0Kk1pxpOG6h8yx5RQe4L9w/iPgnUSx/ZWjaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WiHlum64; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WiHlum64"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2264aefc45dso31136385ad.0
        for <mhi@lists.linux.dev>; Fri, 25 Apr 2025 00:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745566377; x=1746171177; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xJc0VC1OPnf8MGBGBVEvJ1rm1gHV5SYp4RtZ7UBjMoI=;
        b=WiHlum64JNvtXwvdLFl1ZqbWjacLF/kvdzEEZZxH0bYWlULY9K+E7e9Iy8vOcjPZ8/
         noDK4V5ukf0190oDkZG3vR65HdFflMHt0g+pc5E5yVvDWc96FtSeTVNLxzxDZH9Cbe/6
         03khdRZefgHXg4Q3LdWEDP4xNnJ0lfs6+uVVsHkF2ren402NTgVcBQGubgIFphMR2ohf
         ISYR9bPTtv9zZ6HN7bK/QH9L3UXhXOVapwvKpoNyGdv7h38pzDbtHBeyqAjpiNwsagWf
         mg6eGYRTMjyrwIFepBBUPRMDEWo+YiZU9rLIHaeXDHi1lPo9/7GMB/nAKXjUG2cjjPy8
         kMQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745566377; x=1746171177;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xJc0VC1OPnf8MGBGBVEvJ1rm1gHV5SYp4RtZ7UBjMoI=;
        b=tL6TjRQUb15eDqi97FaqV9aH2CAWb/PmzjAhPQGreD4fqhYUXEtfXl7FqzGw3heYCE
         afzr+PCP02kJ5LxxeISFVAnJjZu+rojoYMVlp0EXzkYNEEMBFsSQCW7hnMTmUiS5aVpm
         ZYkY5E8pQuIsuybqm9cn4XQsBWF7L6R1Z/BRR8y0LbGx2WzYlapSlSRX8zgpPM3M3psn
         f3lGwWHoy9ZVf1orTbP2lsi60IB3tvtsAe4QJhhqzK//bYyY479BXK7Qqyx7L5niGSgb
         /xrjOfXWVLwRK1uFh5LjGFgNdDjyPWTd4yTq3yIK8YWYcUrTWHcpX6COOc6S5PHPbJim
         cesQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1fWC+JjPvNX6xshRk14YhP2WwvyRmu6mdH+J2gVmTi8A7MokkWSS3mCH5NrK19pNtP48=@lists.linux.dev
X-Gm-Message-State: AOJu0YyJfIz9owhkSCEl2BKV1VF0i6bWj4ImVT8RZ0GFDGTHBMcZAo/T
	J7fsFAeCJdaeTQ6/rhcb7VIr3eYfI1F/SyGCJETWxx+Jd3YrjUAt0Fn1DC6a9g==
X-Gm-Gg: ASbGncvQ0xuIOTNgKM0Dq4vn5vzm25OGXIL5lqWO55J2Zb9eht41wv9Gu5bokfDcfC7
	fqs51oNU3q5JOMQp3mKwX01NEUXl+6exdJJck+txsSDdT6xUtYOWxrPctXBeMH4Vt8+5jR/3+3H
	Zhh7gGglSgwI/b9H2dUQ7s/d7ocdMnt/Yc2W8KBC8Xe34AaLyx0i3/OOLmxwiKQBjPyGlhFwv7t
	maHlCgpHtPaQ3cXicypfID6qsFw2YPL7npi3kLlzFqNlQQKs2b2q51c1LB0+d9Y03gQrgOQ9yxg
	L383rBH4swJWkAQl5RUbbu4N9afcXN0VsbhFb6byP/XX5Mz0fZ0=
X-Google-Smtp-Source: AGHT+IEaSjf7mjPyqkb9SLHl28S3KtutHrHtesFq5IWR5am6CHVSmDDpdOQGUAksLd+HiuHc9w/Ahw==
X-Received: by 2002:a17:902:f541:b0:224:a96:e39 with SMTP id d9443c01a7336-22dbf5d89bfmr18972215ad.9.1745566377452;
        Fri, 25 Apr 2025 00:32:57 -0700 (PDT)
Received: from thinkpad ([120.60.77.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4db97b3sm25701435ad.55.2025.04.25.00.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 00:32:56 -0700 (PDT)
Date: Fri, 25 Apr 2025 13:02:51 +0530
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
Message-ID: <cfb3sntvqhupyhm2m5tevpsl77r6mzl2aqzr3wtxvr22bezmp3@qjh7ftr2kdjy>
References: <20250410145704.207969-1-usama.anjum@collabora.com>
 <h2wv7drxntokziiwbzjw5xjzbctbomp6cfcba7ppfbih6o7so7@p6dazv32xfx4>
 <1136c7cb-1c7b-410b-93d2-c74aec939196@collabora.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1136c7cb-1c7b-410b-93d2-c74aec939196@collabora.com>

On Fri, Apr 25, 2025 at 12:14:39PM +0500, Muhammad Usama Anjum wrote:
> On 4/25/25 12:04 PM, Manivannan Sadhasivam wrote:
> > On Thu, Apr 10, 2025 at 07:56:54PM +0500, Muhammad Usama Anjum wrote:
> >> Fix dma_direct_alloc() failure at resume time during bhie_table
> >> allocation. There is a crash report where at resume time, the memory
> >> from the dma doesn't get allocated and MHI fails to re-initialize.
> >> There may be fragmentation of some kind which fails the allocation
> >> call.
> >>
> > 
> > If dma_direct_alloc() fails, then it is a platform limitation/issue. We cannot
> > workaround that in the device drivers. What is the guarantee that other drivers
> > will also continue to work? Will you go ahead and patch all of them which
> > release memory during suspend?
> > 
> > Please investigate why the allocation fails. Even this is not a device issue, so
> > we cannot add quirks :/
> This isn't a platform specific quirk. We are only hitting it because
> there is high memory pressure during suspend/resume. This dma allocation
> failure can happen with memory pressure on any device.
> 

Yes.

> The purpose of this patch is just to make driver more robust to memory
> pressure during resume.
> 
> I'm not sure about MHI. But other drivers already have such patches as
> dma_direct_alloc() is susceptible to failures when memory pressure is
> high. This patch was motivated from ath12k [1] and ath11k [2].
> 

Even if we patch the MHI driver, the issue is going to trip some other driver.
How does the DMA memory goes low during resume? So some other driver is
consuming more than it did during probe()?

> [1]
> https://lore.kernel.org/all/20240419034034.2842-1-quic_bqiang@quicinc.com/
> [2]
> https://lore.kernel.org/all/20220506141448.10340-1-quic_akolli@quicinc.com/
> 
> What do you think can be the way forward for this patch?
> 

Let's try first to analyze why the memory pressure happens during suspend. As I
can see, even if we fix the MHI driver, you are likely to hit this issue
somewhere else.

- Mani

> > 

[...]

> > Did you intend to leak this information? If not, please remove it from
> > stacktrace.
> The device isn't private. Its fine.
> 

Okay.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
