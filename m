Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BAE524DD
	for <mhi@lists.linux.dev>; Fri, 19 Jan 2024 13:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705670631; cv=none; b=aSDqOz5YEy54uQWV1rrhC77AjhXpZ7XGXJrdo0eqpEZZv6IoLjmqXziERgQHDXkRRWidsSqJMdeZrvv8NfgH4i2hpoDW3pZHXvbJArhSNvA8s8lBxHt9g8Z4FB2t1kwaLjoUXnqIHxKCNz4i3/4LUVOsk5GfWguf9ikyPlUPba4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705670631; c=relaxed/simple;
	bh=jT1o+1fCLAVLwXFrrOA+eYd/Esf8c1zGpOV8XzCPnlQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=refPH6Ihw1NQYTa2WR6q0djcXap11cZK67vpaekAfc4bG0q9EDr0Kn8SI4Wa/S9Dslb44w7Lk3UtXlbjM6jr5vhKH19lAHenDgo/rOlbexRXS1NTt4G4o5f7MIX9XqSKjSbyiyVSuuUVudQfwqZeakTC9pY9YQeGG8+n7VcvLy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JB/OEsas; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JB/OEsas"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5f15a1052b3so7780347b3.1
        for <mhi@lists.linux.dev>; Fri, 19 Jan 2024 05:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705670628; x=1706275428; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wYjGRonmxWAwRkUotTTDya9Rp8c+PP7p+UBBXWqIeDY=;
        b=JB/OEsasbgUrcfJ1V6NfA5DjwFgAi14bRfBKM/wVeq73xundUT4QlhL4TZaDttMOHp
         026fH/7E4eyQbQs6pkl3cBBFtTobZF7eD6L7Y6vCUBVyBFLL/h+zzTfMvF/urUWvRDc7
         Bvu7StD01b5Z1ayUCFQgeicwRG7Dtob73sQqdYk5HTkmk4R8B18lM1m3cV5y/9BfOjxr
         lppMQoBZLKulXuDLWmoEWA55UoF0LlbfAfxnHcY1dKQ1U1rAgDMfU01+R5zJgNM+ZA/s
         dkqrr2DQQR9q5a7Cx2El558nMp0PmY3QVHxoBLbpYXspQbLTPVwq+ZU97Ed/qsfTnQXw
         ykAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705670628; x=1706275428;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wYjGRonmxWAwRkUotTTDya9Rp8c+PP7p+UBBXWqIeDY=;
        b=LwA3IwLnMv8+ByL0lbF2PcxvBdPyobh4lC0AxMfQQ1fvAaCHX68EjbxKdGJuRD70+O
         MFBemg/JIGYp39JhwUJJs2BYvI+pK+ivP6pygJgI07vm7reLKiIqF1fUNiEJEObWx6B2
         zcNZUFxNnLHhZMwupBINnczqHWoXbxWIXb+Pgj7gV0yGrHfsWpIrcb2tF2HIumuC5wFj
         MSmj2SHjdWEKPq5k2LzTIIqzlcGSFJbVJZh4FAkD18kZF8HrVWtx+YhYO6TWLXHlY876
         vCTJXymJG2ICGS1tPRe8fRZCHUTjBdcAFJOWU72URy4O/XKzuSOJO5txACfg4dgKlhki
         v4Cw==
X-Gm-Message-State: AOJu0YxXe1aotaxheBdNiUoh7cIkbDqrG95iDms9/mvkHwvfrJZlyfLq
	N4jv2ZHSVk0+SGB6n1uiwPjG8RbV8WVOZkkpw5teTG1h9piMG+sSxOa03MDhUkwWFhsE4GMa4kH
	oAYvbtpcuPzFKvgsp/wXdVaXIN6XhsULZY4KhsQ==
X-Google-Smtp-Source: AGHT+IE24O4oHX+Znek8EKmxAo69mROS6r2o4oW+offeuwEJNv5nK9E27XqRcTnwBG8RF9BP82f09XLq4Sz7Hw8ZCgs=
X-Received: by 2002:a81:6d10:0:b0:5ee:66b0:5960 with SMTP id
 i16-20020a816d10000000b005ee66b05960mr2136607ywc.10.1705670627269; Fri, 19
 Jan 2024 05:23:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1705669223-5655-1-git-send-email-quic_msarkar@quicinc.com> <1705669223-5655-2-git-send-email-quic_msarkar@quicinc.com>
In-Reply-To: <1705669223-5655-2-git-send-email-quic_msarkar@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 19 Jan 2024 15:23:36 +0200
Message-ID: <CAA8EJprFo+ujC2VqEtxbrEn_Dn23qfQAcc6WtMm4JWquth=Xgw@mail.gmail.com>
Subject: Re: [PATCH v1 1/6] dmaengine: dw-edma: Pass 'struct dw_edma_chip' to irq_vector()
To: Mrinmay Sarkar <quic_msarkar@quicinc.com>
Cc: vkoul@kernel.org, jingoohan1@gmail.com, conor+dt@kernel.org, 
	konrad.dybcio@linaro.org, manivannan.sadhasivam@linaro.org, 
	robh+dt@kernel.org, quic_shazhuss@quicinc.com, quic_nitegupt@quicinc.com, 
	quic_ramkri@quicinc.com, quic_nayiluri@quicinc.com, quic_krichai@quicinc.com, 
	quic_vbadigan@quicinc.com, quic_parass@quicinc.com, quic_schintav@quicinc.com, 
	quic_shijjose@quicinc.com, Gustavo Pimentel <gustavo.pimentel@synopsys.com>, 
	Serge Semin <fancer.lancer@gmail.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 19 Jan 2024 at 15:00, Mrinmay Sarkar <quic_msarkar@quicinc.com> wrote:
>
> From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>
> eDMA client drivers defining the irq_vector() callback need to access the
> members of dw_edma_chip structure. So let's pass that pointer instead.

Nit: 'will need'. They do not need to do that at this point, but will
need it at the next commit. I'd rephrase it to something like 'In
preparation to ...'

Other than that:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Mrinmay Sarkar <quic_msarkar@quicinc.com>
> ---
>  drivers/dma/dw-edma/dw-edma-core.c           | 11 +++++------
>  drivers/dma/dw-edma/dw-edma-pcie.c           |  4 ++--
>  drivers/pci/controller/dwc/pcie-designware.c |  4 ++--
>  include/linux/dma/edma.h                     |  3 ++-
>  4 files changed, 11 insertions(+), 11 deletions(-)

-- 
With best wishes
Dmitry
