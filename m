Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452AB1FECCD
	for <mhi@lists.linux.dev>; Mon, 28 Apr 2025 16:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745856284; cv=none; b=MUmYgbNcczMa+Mz78mc3nA1evP7dJDxNrRLanOjYH3anOz91wWU6mysJlH95DBLco4Kd01E1t0xKVyvSng0EfiPEAhVDlzG4RBq9o7CkyJ+Gzpkkri59Qw1VVa7yLahJmG0z/f1IOZHUBdqnsalmQiwr5Kxx6hr0RLNneofgqCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745856284; c=relaxed/simple;
	bh=FrNZmLg/x/OPcRg9cTyCP5WYONcAgeedx2GB1nezExY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P3HjIGMcXYG5vPV9hzsQI7M8CvF/hG8KUAJrMCGNLz2y89MHBuEYAbyfDGujGxzmm/onIBbaWjHcB1co2ZOkEYqru14KBwpyAPBgExhDCYShFioJwfyAvytsU94zhoWY3UNSGFrxmdL1c8U5ABw1o8397k9YufDXn4t7ou6KnEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=thlMDbsO; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="thlMDbsO"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-73bb647eb23so4158707b3a.0
        for <mhi@lists.linux.dev>; Mon, 28 Apr 2025 09:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745856282; x=1746461082; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/X7DF9Ew1Agm7nnrSqqFaK71CHWZV0baQc/jIlR9xZ4=;
        b=thlMDbsOiEzitavxZn4IuRXBH4enF0CoPEFZQU33rUIPUIbNXL9Ze/niXLNvmYnoSR
         mBup5DMNr2xKUlxXX+dyUk8qP5JsW4aZ3Rbw8oC1SabKgssfN398DkndLnfwiBYJtL5V
         ExVH9dbG39/EvA/LVoKzlspmCbBFmmq/Uzg5B9jPi8sdaoCZ/XZxHm504lnTDOf2InDg
         Vyk5Vzk/kH4xCMY1cfvYSIS9ElodPMEpw9hngnH9LJdjTeG29cMPzZhs1tagtYAU45ag
         fZ+szJ3kZ0BZtYKA7LLsZvPehDO3B8q4I8r4Ep6Pv/idiFhlxZJoSEbuxcigLWmRvbLV
         oGNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745856282; x=1746461082;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/X7DF9Ew1Agm7nnrSqqFaK71CHWZV0baQc/jIlR9xZ4=;
        b=NZ6GyjH9qcteRaL5FDfwrwLZVo68aajQqlvoVcanusstOWrCEgESwK9Fvwqu55/cg7
         dcCJaCvZJCJA9F5rJEcNFcrP9s++laQYwU/iZp8mfJ1etZXKyoMkQ/aPCDno6Ud9yI9C
         kMda2nCwfIVWoA4FNSIIxD0pTNPlHp4mpHPv3SSs3tKH7WxXGgzphz1dPdleNs8kd3Sj
         Y3gvzsmgahC2GmocVnF0EHBgvWDZ5GFWdBjacnfgPV+a1h1+h9+L01oha1O1jgWW2B2E
         v6fOn/xFixcF8vF5FGiK+oWnb9M1bLAbfsZ14Zg5w8RGuutQbw/qCK74cNG1SL6+QgTP
         8sfA==
X-Forwarded-Encrypted: i=1; AJvYcCU+AQvsvoLdlid+otJNjV5HLvWtHeK4WVQFYkDLkT6EIOFEOdcOMtU75SwKvl8a7+NI1uY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyqn4yYrbjTjD43PDr76t/vWu11dETEG7RCcTcujM8Wqu41z8g4
	v/cr2dTJJyN8aMTEGTZAOh0P8T34Wtduhy9RFuMAvwaQHAIYNyQ6gYS9A6U8TA==
X-Gm-Gg: ASbGncv3McXCPm9dem7zNOX9GiYXjHeQvG8jt2gZe40pu+RDTbTeLg6gqqaE2w3b+hs
	xyzRmJ0pgWdai1MEByxGUUp3eNBvTOLAQAk56a3TKevr+sQQtpW2eS2PpL8c1BcVLvDvArKwrff
	VDT6NhpBkrCFyyKbD2LwpmIdNNnP7NEVPs1cfvG9Ba6VJogePabiPzAImq09rCIVQEdBe/RdJZe
	nYjFoXsNWVO01SsBEK/lVBzeeaWTzMhgkSgugRLPDgUc5TPgZl+1zKgfcS4ccxbp6d7+HyZ1uyV
	/dmaGLjolJrda/PnHLl/FwgPTcQGLAPY5pjldUhTQSk3ECrWoA==
X-Google-Smtp-Source: AGHT+IGKCxoXxJthszuaQ0YIvxIpdqYl5iZVD54zK+MbWjkRhDGpgNCqL+JAneA3KnXAx0zTvsqeuQ==
X-Received: by 2002:a05:6a21:9984:b0:1f5:8d3b:e272 with SMTP id adf61e73a8af0-2046a404462mr11666596637.1.1745856282535;
        Mon, 28 Apr 2025 09:04:42 -0700 (PDT)
Received: from thinkpad ([120.60.72.74])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74002791fb3sm3928077b3a.70.2025.04.28.09.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 09:04:42 -0700 (PDT)
Date: Mon, 28 Apr 2025 21:34:37 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, quic_carlv@quicinc.com, 
	quic_thanson@quicinc.com, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>, ath11k@lists.infradead.org, jjohnson@kernel.org, 
	quic_bqiang@quicinc.com
Subject: Re: [PATCH] bus: mhi: host: Allocate entire MHI control config once
Message-ID: <szphluirfkwx2na7o5y4wax6icezxv5scnwofma7la7v4kz2kg@bgplpwnsabkt>
References: <20250328165913.3380933-1-jeff.hugo@oss.qualcomm.com>
 <pgr6u3onrlf4mvldqn7cxlqkh3krduv542jqgjcy5c535ys6hm@dujbvax4b56s>
 <07cc4ee2-4a13-495c-bc4d-8837d6b54414@oss.qualcomm.com>
 <qhoirbfx5p23542hhi3kk7ftwtptsnoxgtewddbh322d74rgb2@xbupxi3ix7sx>
 <ea4d081c-185b-4715-9b64-da1347dab28b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ea4d081c-185b-4715-9b64-da1347dab28b@oss.qualcomm.com>

On Fri, Apr 25, 2025 at 09:56:05AM -0700, Jeff Johnson wrote:
> On 4/24/2025 10:37 PM, Manivannan Sadhasivam wrote:
> > I was confused by the fact that ath11k driver adds an offset of 0x1000000 to the
> > reserved region for the iova_start:
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/wireless/ath/ath11k/mhi.c?h=v6.15-rc3#n331
> 
> This predates my role as maintainer.
> I was an internal reviewer, but in internal review (as well as the public v1)
> the code was using dedicated 'qcom' DT entries and did not have an offset.
> 
> So I looked at the entire patch history:
> https://lore.kernel.org/linux-wireless/?q=s%3A%22ath11k%3A+Use+reserved+host+DDR+addresses+from+DT+for+PCI+devices%22
> 
> The offset was added in v2.
> 
> There is nothing that describes why the offset was added, and nobody
> questioned it.
> 

Hmm. I'm not sure how this works in the firmware. If firmware uses iova_start as
the start address for the ATU mapping of the MHI data structures, then it won't
be able to access the structures allocated prior to this offset (which would be
very likely).

So the fact that the firmware still works with this offset means it doesn't use
iova at all. But it would be good to remove this offset from the code anyway.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
