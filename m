Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469AC22A1F1
	for <mhi@lists.linux.dev>; Fri, 25 Apr 2025 05:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745559436; cv=none; b=YQHgyWNy/LZvP/DoTyraTxvZ8mqTntkg7c0NlVFEtpENNkge0y/shxzc07xSLnkOU+tf1MZztGjXusvNKlmWyMxav1M6JkxbmRB0OGpEVC3qWtszGlb4wSph7CzHnYXkfWsFuiREDMFhOmocqMyTeDTPZFg30qEbTsFCOXiwcjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745559436; c=relaxed/simple;
	bh=9oNTXG3PnUqLy2ZCkPQnR80hdVQIyQFuYc7MoYL2GNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qnt+It6rgG92uOCYUHj0agsqzlGHzc02izquWdi9m9ggzhY+hEDGGp9SSLG0NXDlwJeC9IqNQsJ7mtqWakKaFwliU1kk8//2y2Mm+apv4f5DEaxWYvWI40bW5OEvsRm4GmZE2FzTjlQovYCRimmKWhivUNpg1Rqb4P9B8cMiYjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OqYR1FSt; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OqYR1FSt"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-73bf5aa95e7so1662252b3a.1
        for <mhi@lists.linux.dev>; Thu, 24 Apr 2025 22:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745559433; x=1746164233; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f8A3cjy377Xq8M/J5lIds8iTR3Oz7LnaNIlKAmosVk0=;
        b=OqYR1FStfZeZAIZfsUVMRYXdAPv38I+qayi20bPbEc/GT6h3aQGNusdcroCsxEL0Sb
         xXVAas45nim04F4/GkxFK2Mr9FYcdyF8QTjqdmXh0qAhc2cQvDqxV0CMboPRSUmgVQX1
         GWd16DlOm9HQ6uhaW/EZQzcdBeWVmQdI14cmWzlDkqF4LpSDzKe/BrRFf2FaVCzVbvkM
         wk7MGGpeZb3/2nVlwuGaIjTO2arT06h7GfPeVqJFj5YoDUhXldPmk+McqQ1yv6jY1IOZ
         RVr4MH5hZPP/OqWXLQCfrmLXDDxGc+9xMC8IhluarBnuXVbST5vMv7h3dzAQQg4jMJyg
         Jl7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745559433; x=1746164233;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f8A3cjy377Xq8M/J5lIds8iTR3Oz7LnaNIlKAmosVk0=;
        b=WeeO8m5tiWKJCyYjfkFkmJpQgbH8UF1wuPTdOrglOln63WKi5m0x5yOKqlliHMtc0i
         VpKoLQrBPXjqZDPWm0W6DFfiHSIbMotzvBsvzA5KHdfYUSnKunT1Z1Y5J71tyhLsZHiH
         5DsO2P8AY4gDnTMel8cKWutt4TdRTcsdlnR6zENM5xqhJBxuagEDyVH/agiDKur+VImh
         mxgDslMjjXYYl8mS1vDxETc8UMFzElK24cipfJXfVnu38dnWDMbk3107Elz62gtwignZ
         fFxKXLyHTSO5PcvEGd6sHBlACKdaCD1/zThn2a1HYRPxWTcV11HN65olaCmB6Ze4ko1o
         lM2g==
X-Forwarded-Encrypted: i=1; AJvYcCUZR69ulhqdUWLxAksBq+lgt56JDup6DHZr/bPtN/EuWN3hE0bTg8CMYVUapA6Ap00L/UQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwBMsLWAozt/HLydGy7TTGbnYGi/2H2MhVFN56ASfiLAqPln5qm
	RbPE08XeUyg7oYTj6Gkdu4IKOV+d1OrppaZJhDjFxiWzVwiZukOWAH0r9fDxn18CaWu1KbPMahg
	=
X-Gm-Gg: ASbGncsmnD28wp0NOXDjMFjYeLOt9VJzw8/GVtiqQNBK4ACcCR5XLflhMVDKDKK2+C0
	Y1d/NOGAIFv6cQ0mKUJRhfU3GlOj6fme3e44AtHOqJJHp8K88vl6/+SmwoRJ+Wi5G0tyZ5GUuak
	m5CA44s+i4SvqgUQ8T84I+B3MojwloFDzW4EFD/if0+ZriSkvhf/QcLeHuEXidgmpXf3vqex6qE
	HSTyOUJi15qy2wTAnRHHJWZwkHHNS+ZLnUC3zGxEXWP3pI/T5J47MelYcxd4fb03qO88CBe4BY5
	wrLDVTOQMMAt+aymy2LQ7VPcEvAUWyOWccuGySNig7yvF9ACbUQ=
X-Google-Smtp-Source: AGHT+IGcoqrCxQ/PlAvuIQ3GNQhMlOAxNWlv8vOGFLV8g7pv3hl+e+Uba/O0SiwZcqMn3LRnx3eY/Q==
X-Received: by 2002:a05:6a00:b4a:b0:73e:10ea:b1e9 with SMTP id d2e1a72fcca58-73fd6defd3emr1305557b3a.6.1745559433403;
        Thu, 24 Apr 2025 22:37:13 -0700 (PDT)
Received: from thinkpad ([120.60.77.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25accfc9sm2436701b3a.176.2025.04.24.22.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 22:37:12 -0700 (PDT)
Date: Fri, 25 Apr 2025 11:07:06 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: quic_carlv@quicinc.com, quic_thanson@quicinc.com, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>, 
	ath11k@lists.infradead.org, jjohnson@kernel.org, quic_bqiang@quicinc.com
Subject: Re: [PATCH] bus: mhi: host: Allocate entire MHI control config once
Message-ID: <qhoirbfx5p23542hhi3kk7ftwtptsnoxgtewddbh322d74rgb2@xbupxi3ix7sx>
References: <20250328165913.3380933-1-jeff.hugo@oss.qualcomm.com>
 <pgr6u3onrlf4mvldqn7cxlqkh3krduv542jqgjcy5c535ys6hm@dujbvax4b56s>
 <07cc4ee2-4a13-495c-bc4d-8837d6b54414@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <07cc4ee2-4a13-495c-bc4d-8837d6b54414@oss.qualcomm.com>

+ ath11k list, Jeff and Baochen (for question regarding the use of reserved
memory for allocating the MHI data structures in host)

On Tue, Apr 08, 2025 at 08:56:43AM -0600, Jeff Hugo wrote:
> On 4/8/2025 1:01 AM, Manivannan Sadhasivam wrote:
> > On Fri, Mar 28, 2025 at 10:59:13AM -0600, Jeff Hugo wrote:
> > > From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> > > 
> > > MHI control configurations such as channel context, event context, command
> > > context and rings, are currently allocated individually. During MHI
> > > initialization MHI bus driver needs to configure the address space in
> > > which this control configuration resides. Since different component of the
> > > config is being allocated separately, only logical solution is to give the
> > > entire RAM address space, as they could be anywhere.
> > > 
> > 
> > This is fine...
> 
> We tripped over this when experimenting with an automotive market product.
> The FW for that product had a rather strict interpretation of the spec,
> which we confirmed with the spec owner.
> 
> In the specific FW implementation, the device maps the entire MHI space of
> shared structures in a single ATU entry. The device cannot map an entire
> 64-bit address space, and it expects all of the shared structures in a
> single compact range.
> 
> This applies to the control structures, not the data buffers per the device
> implementation.
> 
> This restriction seems backed by the spec.  I can't find a reason why the
> device is invalid, if limited.  I don't think this should break anything,
> but more on that below.
> 

Yes, atleast I have heard about that limitation before.

> > 
> > > As per MHI specification the MHI control configuration address space should
> > > not be more them 4GB.
> > > 
> > 
> > Where exactly this limitation is specified in the spec? The spec supports full
> > 64 bit address space for the MHI control/data structures. But due to the device
> > DMA limitations, MHI controller drivers often use 32 bit address space. But
> > that's not a spec limitation.
> 
> Its not the clearest thing, sadly.
> 
> Document 80-NF223-11 Rev AB "MHI spec v1.2" Section 6.2 "MHI Registers"
> table 6-19 (page 106) -
> 
> Describing MHICTRLLIMIT: "The most significant 32 bits of MHICTRLBASE and
> MHICTRLLIMIT registers must be equal."
> 
> This means we have a 4GB range (32-bit) to play with in a 64-bit address
> space.  If the upper 32-bits of the 64-bit address for both the base and the
> limit must be the same, then the range of addresses from the base to the
> limit can only vary the lower 32-bits.
> 
> Invalid:
> BASE: 0x0
> LIMIT: 0xffffffff_ffffffff
> 
> Valid:
> BASE: 0x0f_00000000
> LIMIT: 0x0f_ffffffff
> 

Ah. Didn't spot this before, thanks for explaining!

> > > Since the current implementation is in violation of MHI specification.
> 
> For example mhi_init_dev_ctxt()
> 
> We allocate the chan_ctxt with dma_alloc_coherent() as an individual
> allocation.  In the case of AIC100, the device can access the full 64-bit
> address space, but the DMA engine is limited to a 32-bit transfer size.  The
> chan_ctxt probably won't be larger than 4GB, so the size is rather
> irrelevant.  Can be allocated anywhere.  Lets say that it gets put in the
> lower 32-bit address space - 0x0_XXXXXXXX
> 
> Then a little bit later we allocate er_ctxt with a different
> dma_alloc_coherent() instance.  Being a unique allocation, it is not tied to
> the chan_ctxt and can exist anywhere.  Lets assume that it gets put
> somewhere in the non-lower 32-bits - 0x1000_XXXXXXXX
> 
> Now we have a problem because we cannot describe a single range covering
> both of these allocations via MHICTRLBASE/MHICTRLLIMIT where the upper
> 32-bits of both registers is the same.
> 

Yes, I get it. I do not have issues in allocating all the structures in one go.
But the problem is with MHICTRL_BASE/LIMIT. More below.

> > > Allocate a single giant DMA buffer for MHI control configurations and
> > > limit the configuration address space to that buffer.
> > > 
> > 
> > I don't think this could work for all devices. For instance, some ath11k devices
> > use a fixed reserved region in host address space for MHICTRL/BASE.
> 
> Why would we be unable to allocate all of the control structures in a single
> allocation out of that reserved region?  Is it larger than 4GB in size?
> 

I was confused by the fact that ath11k driver adds an offset of 0x1000000 to the
reserved region for the iova_start:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/wireless/ath/ath11k/mhi.c?h=v6.15-rc3#n331

So this means the firmware will only map the memory from reserved + 0x1000000
for MHI data structures. But even with current implementation, the MHI stack
doesn't know anything about the offset, because it just relies on
dma_alloc_coherent() API which will only honor the reserved region pointed by
'memory' property in the node (without the offset).

So I'm not sure how the firmware makes sure that the data structures lives
within the offset region. This is more of a question to ath11k folks.

But your series is not going to make it any worse. Sorry about the confusion.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
