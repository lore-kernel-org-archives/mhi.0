Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E3214373A
	for <mhi@lists.linux.dev>; Fri, 28 Jun 2024 07:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719561121; cv=none; b=Bm51/iWy5MNKpvDn7U2p636X75hlPAp0PNdnAnecBn0ijYcyRk/dWPgPy6VnBAzsiPK/alT4iEIgZptLEjfbUgzgzsNNnX986Arc0do9KE5E5mEJQIL1xRh2BewUvE9KTzR3VS4PUTw4W1nBUidYmU1XJj7G9GaN8ZCrikaHV3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719561121; c=relaxed/simple;
	bh=+zNoKDZQ/xkNOYt+gvFW7KoW2kO58MHXV4zEnjjIi4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HNXDlWSkeljfwCZuI1/ABhzDGOn9//BK03SVTUwt8VDJ5vewkpCak98L2uma37aIoei+neCe6BO0A0hIu+bi0K+niy1O4XmlHnm1k2D0h40DNHfaYc391daJXIxBjU7rGuejoLJhmvIpQW2ZtcdA00x5wFwZagrP+yuAJZSfF1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MBAQgq/W; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MBAQgq/W"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2ec002caeb3so3356751fa.2
        for <mhi@lists.linux.dev>; Fri, 28 Jun 2024 00:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719561116; x=1720165916; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F0Lhq2VrmyZAPS9Zt2InQGHVgI0lvcCDAnX2v0350pI=;
        b=MBAQgq/W30OHt/wuOkPHgMAo5iK3Rslh2Vo/SnZ379UxlwgRZfaolbdOqZdy88Qxsq
         frMtqky8Ndwt1YCnTFA0DD23VP1G/e5CVp0/Aix6kRu1fToSbzxF6OmDPMJYixBfjxfi
         cHJKvJlrDH0Y/blL1c06SRbSleZgwILjxJFRXNQfvIHWmxHx7qcjk0J7VboDkQWO9BM5
         fFKeRNR6xENXAodndi/NtXJpHIrmp0K7j62qjFxGuv0Pw2JHwQSDKneHTvPlMAn/dSPN
         c6fmJFL3GOXnwREM4fIlH+nLaTcXYp5Byig/cq8vYFCNOU/hz76VvNQA+vIGZLDDL/B0
         tEyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719561116; x=1720165916;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F0Lhq2VrmyZAPS9Zt2InQGHVgI0lvcCDAnX2v0350pI=;
        b=UsSYFMDXyRqcLLwQy7OrYLCjxdErbIsfTBf/VaRPpRF6jetHyjx9+96iGTO+FaAUB/
         4JZRFXaPQ8wO9e9j48es8Y0dvMijq0OpZFMs/u7N8t/saTaV8sOlXUA/9yAG9ebhVguu
         j62J4X1FNudebIihgU8AeJ5+4+5uZiEk8t82vb+hdLOERJzWee2UfMCcK7+8qmnf6zYQ
         I7xAd+alpXra42YINHmw9yz1GvZ+h7WlmP9BwrcKoxdb91w2cVHW3Fw+62CgxSt4rb8o
         2v6LXQ+xapA97+8eE20ZIrqWRQE03UWF30PDKoOsiEub6KjohYfvG/AibiERDzsKgXCM
         gQLg==
X-Forwarded-Encrypted: i=1; AJvYcCVVCe0PIXpym712FxWDiZTu2FeKAUtxoYx+9jYm4rb4qnbKnriwzXgG92xnno8GHICOFVhYza2T9oekZAVuK2d/u0na
X-Gm-Message-State: AOJu0YwEI1+JjRdSCuITx/l/DdWMOdp0/MBD9l/0AiVj1GC3AI1muEAz
	3HBd69r5PQHUo+Y1iL30PJqdinkP4vUd0D+AOfmoDvBilgzP84+mrGotNWmjWbc=
X-Google-Smtp-Source: AGHT+IH+g2S686TRu2qwo6Fx8tMGYY1LUnHUqaOm29KoLuznrr5f/PC/tBh0PHvmbSQVGbLqGcVTKQ==
X-Received: by 2002:a05:651c:1988:b0:2ec:637a:c212 with SMTP id 38308e7fff4ca-2ec637ac2b5mr108100831fa.39.1719561116558;
        Fri, 28 Jun 2024 00:51:56 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ee5160d26dsm2123151fa.25.2024.06.28.00.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 00:51:56 -0700 (PDT)
Date: Fri, 28 Jun 2024 10:51:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Slark Xiao <slark_xiao@163.com>
Cc: manivannan.sadhasivam@linaro.org, loic.poulain@linaro.org, 
	ryazanov.s.a@gmail.com, johannes@sipsolutions.net, quic_jhugo@quicinc.com, 
	netdev@vger.kernel.org, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] bus: mhi: host: Add Foxconn SDX72 related support
Message-ID: <2xbnsvtzh23al43njugtqpihocyo5gtyuzu4wbd5gmizhs2utf@d2x2gxust3w5>
References: <20240628073605.1447218-1-slark_xiao@163.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240628073605.1447218-1-slark_xiao@163.com>

On Fri, Jun 28, 2024 at 03:36:05PM GMT, Slark Xiao wrote:
> Align with Qcom SDX72, add ready timeout item for Foxconn SDX72.
> And also, add firehose support since SDX72.
> 
> Signed-off-by: Slark Xiao <slark_xiao@163.com>
> ---
> v2: (1). Update the edl file path and name (2). Set SDX72 support
> trigger edl mode by default
> v3: Divide into 2 parts for Foxconn sdx72 platform

Generic comment: please send all the patches using a single
git-send-email command. This way it will thread them properly, so that
they form a single patchseries in developers's mail clients. Or you can
just use 'b4' tool to manage and send the patchset.

> ---
>  drivers/bus/mhi/host/pci_generic.c | 43 ++++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 


-- 
With best wishes
Dmitry
