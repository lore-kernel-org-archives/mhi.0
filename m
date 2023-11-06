Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965FE15E9B
	for <mhi@lists.linux.dev>; Mon,  6 Nov 2023 09:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iKXispDR"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-5a7af52ee31so49444117b3.2
        for <mhi@lists.linux.dev>; Mon, 06 Nov 2023 01:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699263610; x=1699868410; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FpIVvXMECFRktQ4IhefFOl0oiCPkgte0mG50ImpQsdk=;
        b=iKXispDRrLQY+nfxBRpeqn/MgP85mFmEJQBVcyqoxR9zVSrcSLalQtVhStho8Q77Cc
         SEL10CMHaKwNoVzbznxlBAKuDI+P1kX9VTT80ulwcsURgnRBdUq1el9uWxjjpq7g67S1
         embp/i3DLutneyZ5luCwXJ7urho66dnA39tcUlUXGv2TRzG+Ch81vuubi9QGt7OYkolo
         /698O+/cEOt0YrQUldJ76J1T2c+dYTC1q1iTSGHEZkNW/s9Jjk6WX1oFlD8XQCF1X9K8
         D47bE2otpT12rk2XNY4ybveDQITKj5GYh7M7E1Gvqa8UvEHozoKGecmap8Hhg4SyW+f/
         R+zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699263610; x=1699868410;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FpIVvXMECFRktQ4IhefFOl0oiCPkgte0mG50ImpQsdk=;
        b=mhWntfkynOX1VUvDLlgUnceofVWLVv4jfIk6L9ckGZxiO1EzEIDZC0dh7RXxL8ooHa
         JtKLDLtQ/PL0D2C051osf0igaWxLlAnvHODOcbGFw9+p4ZXY/AvVvX9iXRn1dPGVv/TJ
         C7mLsYb2X691UJrNx76O35mqaQEz0WBidx5TCT98qZuS6OUA3WdHEsCq+2na8a5MtREq
         2EtAQBBE0A2WeHAY3B8Qh/6Kk0Det7V9WTH1V72Zd3Sqw3D7jSmkfaTI9jkDs8IPpy64
         HSm2+j/N+DbcncNgMTQtQcPTXiyeTZOOHe61cEUYtkPWa1/IaOMUeJ5VtAvY/f8E2rVe
         kOwQ==
X-Gm-Message-State: AOJu0YzpIhgARsb2XU83hjnuoL0yQruG+pSto5GS/zBEPvJIkatQ2jeh
	r98AkTCPZ2/XvqcLcGuxARulQI7p/TRyR+a2KUCowg==
X-Google-Smtp-Source: AGHT+IEteHXH+5R7EEOi7azE/STUcVaeWLwtpXheOcC2xH4yrT14fOb22Bk4vXiIohltgkr9GmLf/SVrlHYf6RmNdkI=
X-Received: by 2002:a05:690c:dc6:b0:5a7:b682:7929 with SMTP id
 db6-20020a05690c0dc600b005a7b6827929mr12178727ywb.17.1699263610498; Mon, 06
 Nov 2023 01:40:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1699242172-79472-1-git-send-email-quic_qianyu@quicinc.com>
In-Reply-To: <1699242172-79472-1-git-send-email-quic_qianyu@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 6 Nov 2023 11:39:58 +0200
Message-ID: <CAA8EJppfo94PWYK3Q=ChUBC05PZ5zCguaiB28AHxMNhpRp-tDA@mail.gmail.com>
Subject: Re: [PATCH 0/2] Add SDX75 support and its dependency
To: Qiang Yu <quic_qianyu@quicinc.com>
Cc: mani@kernel.org, quic_jhugo@quicinc.com, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_cang@quicinc.com, quic_mrana@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 6 Nov 2023 at 05:43, Qiang Yu <quic_qianyu@quicinc.com> wrote:
>
> This series add new configuration for SDX75 and new parameter

Qualcomm SDX75.

> ready_timeout_ms for waiting ready state.

Please follow the same subject style for the cover letter subjects.
This cover letter looks as if it was adding support for the SDX75
platform to the whole kernel.

>
> Qiang Yu (2):
>   bus: mhi: host: Add a separate timeout parameter for waiting ready
>   bus: mhi: host: pci_generic: Add SDX75 based modem support
>
>  drivers/bus/mhi/host/init.c        |  1 +
>  drivers/bus/mhi/host/internal.h    |  2 +-
>  drivers/bus/mhi/host/main.c        |  5 +++--
>  drivers/bus/mhi/host/pci_generic.c | 22 ++++++++++++++++++++++
>  drivers/bus/mhi/host/pm.c          | 24 +++++++++++++++++-------
>  include/linux/mhi.h                |  4 ++++
>  6 files changed, 48 insertions(+), 10 deletions(-)
>
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
