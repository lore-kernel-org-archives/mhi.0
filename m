Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459A116DC3C
	for <mhi@lists.linux.dev>; Sun,  6 Oct 2024 20:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728247238; cv=none; b=EsdSvvePERCTMEN4MDqnK6JUYCqhbWjMtwSGyFxRjwPtiNf8E7/O/Fh3sZwAWZe3ApUChqo15ed7UN2VrYdmvXd1AouVlsivCRbWaU6CvV3J+e3tvrS80mtc8t9LcFWufcsBcryapi+l/FfR6MR/4xZBzCrys2t4zs1wyppdwTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728247238; c=relaxed/simple;
	bh=cxOlSWd/pMPWbXwReS/2MiMfoBkulsEZnMbKBU/u82Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=civCcwqXNpFUiRwJpsps5Aog/pG6dlPoky90evnVbJ4WM7rnOOxYBkaLwmfzUbB8pfsV8PN1Pqn/60ygGC3RMZmWal1XY1v9i+Et3l/bjOVrTVIqyA0pfiacw7ZrIe8HkuAE5g3LDTzOVobZuPnBQIpURrbSanIfPmqFY0Zs3kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aqSP29T8; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aqSP29T8"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2fabd2c4ac0so39824871fa.1
        for <mhi@lists.linux.dev>; Sun, 06 Oct 2024 13:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728247234; x=1728852034; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NCcSKpIJUe3fTkwhqSrgq/Evqsh66fYibnGWceFXfJg=;
        b=aqSP29T81np0Uqvw6We8kEFf6pbxugcEtUfu08JG014z6gnBHX9J5w3Zz2xbS2bHDg
         ho7IVg3pKwS1UyxOf/T837KbY1LNJ6Dq5TeiuJDXoVJm4ZDL+rmrjfM4cjlGGsCtpbvr
         uI4QkXGLxHFm4COtCYWP/IN9qVb69mEiBCgBxXEMMUd0p/iu5vWxJVHd6JFrYQG/2xI0
         51NpUxiSYB1l6jEptHyEY+6ZH5iWlGaDezxd3qlfp40hHAbNSmgcTrQ6Wq1AkVWnTpwQ
         StHiQ1X5zyg37278bnodajy3+HePIXhsS/mKnJYHk6zc0VMI5jdwKFHU9Sgv79iSur50
         lxsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728247234; x=1728852034;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NCcSKpIJUe3fTkwhqSrgq/Evqsh66fYibnGWceFXfJg=;
        b=kdkp0kiMQRMPQk97FEfYALi7VcujqFgZh1a4STETnICeA8V5uw4Ojflv1YmgUVoBQl
         mHhmrwGnRbdB1+7fwpfSW6EkvbUxlz9sbXY+8T+QOzNblOEhS+2JlbZqWp/Orze96VOY
         I9cj4hpjYwkLLhNNgjZe+uRUSPz9RdYU0vkin4SFyAFr2wsm7bKdsLPMvXOo3jUG7eC3
         fIt8BWROriYGaEz+T8qUO/3vqhti9+XUIxMlU0+vwHWrp6XBbXa4qhC8L7JIIbG0jH7j
         ajz932nsT/2+2mZ8NZ6LFTiOIjZO35yH+mVxx2KwfzWZD/J6kSdlDDFmL9/4v0MmzcKn
         wjTQ==
X-Gm-Message-State: AOJu0YyFmf4IKRMWszlAwKC6JgXliZi2bIQVges6P0T2AK9/+v62Mt7N
	HRloZNhcS0f+EGxlINgOXPnb7enW+nCjoMpvlLsXWO+fdqXOAI0Lccl1djz2nS0=
X-Google-Smtp-Source: AGHT+IG8+kDD0E+S6aGBtT3ny/KHoHxXGLgb2vxwOg52Amd380qwmfcHnszuMs5rLO7D/6TrycwfpQ==
X-Received: by 2002:a05:6512:6c6:b0:535:6aa9:9855 with SMTP id 2adb3069b0e04-539ab6d9bdfmr4233900e87.0.1728247234296;
        Sun, 06 Oct 2024 13:40:34 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539aff23e0bsm621231e87.243.2024.10.06.13.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 13:40:33 -0700 (PDT)
Date: Sun, 6 Oct 2024 23:40:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vivek Pernamitta <quic_vpernami@quicinc.com>
Cc: mhi@lists.linux.dev, quic_qianyu@quicinc.com, 
	manivannan.sadhasivam@linaro.org, quic_vbadigan@quicinc.com, quic_krichai@quicinc.com, 
	quic_skananth@quicinc.com, mrana@quicinc.com, Slark Xiao <slark_xiao@163.com>, 
	Fabio Porcedda <fabio.porcedda@gmail.com>, Mank Wang <mank.wang@netprisma.us>, 
	"open list:MHI BUS" <linux-arm-msm@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Add support for QDU100
 device
Message-ID: <ya22me5qxy4vhqcfwu6hfctxthog3vpj5dxee45vmdctat7hrv@swoquk2audro>
References: <20241001113738.152467-1-quic_vpernami@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241001113738.152467-1-quic_vpernami@quicinc.com>

On Tue, Oct 01, 2024 at 05:07:35PM GMT, Vivek Pernamitta wrote:
> Add MHI controller configuration for QDU100 device.
> 
> This Qualcomm QDU100 device is inline accelerator card
> which is an extension to QRU100 5G RAN platform.
> which is designed to simplify 5G deployments by offering
> a turnkey solution for ease of deployment with O-RAN
> fronthaul and 5G NR layer 1 High (L1 High) processing,
> and to accelerate operator and infrastructure vendor
> adoption of virtualized RAN platforms.

Please replace marketing text with a sensible description.

> 
> https://docs.qualcomm.com/bundle/publicresource/87-79371-1_REV_A_Qualcomm_X100_5G_RAN_Accelerator_Card_Product_Brief.pdf

There is a tag for this, it's even called 'Link:'

> Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
> ---
>  drivers/bus/mhi/host/pci_generic.c | 49 ++++++++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
> 

-- 
With best wishes
Dmitry
