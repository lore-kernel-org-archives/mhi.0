Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CAF859163
	for <mhi@lists.linux.dev>; Tue, 30 Jan 2024 08:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706604498; cv=none; b=BYfx6qrtvY13G9x0wdYrOM3Sb5/AVUjhu/PctO06m0g6/0xdACfgbPtUPx9tiK9girFlqziz77LmtihBcM+goZRcbZvNoQcbd2BtDvhNwocm5/rJG+hmnbFwzdVis7Yyd9qjGuUwcP5DaDAO2v7xyEiADKS/zuagEkAkfjznHjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706604498; c=relaxed/simple;
	bh=OTwo8h1r/HNa/CiLlIhtm61CfaQXTQtYUzvR2httRas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PqdTx7jVDYy5OjlqELqKtOLWOi44yUOe4opuaMwOR1A6UImIgvaSJCc4zwQe1kaCMUHwY0nYNWsynsRiJCJoxkhpIO81DRcZMBi9ITEA9UJ8FLlsfepLGRyYLFeHte2CxjyQdgP0+h8w/1YNYfdKNZhDLgIxzChgohVlR1vm+r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SsGsfcDL; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SsGsfcDL"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3bb9b28acb4so2647779b6e.2
        for <mhi@lists.linux.dev>; Tue, 30 Jan 2024 00:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706604495; x=1707209295; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZYqm9+PdfliMcUPhu/XhOrYgIKmn3e//lFHUo82Q1J0=;
        b=SsGsfcDLfWsPlmRS364shqUHQJREk1OGbfrs2ZhR08OXZDJbP4yIAey+9aukvv+TN5
         RAXfsNTxTHYtpbiV2Ef06pCLrijRNFdOLpJ1rlgqJwd5H/bb22ecX80gVn9AZ9iud2h2
         jBqGuaeiXIVyHsuhXuCJWfhKbGEkQT0V6X0f5A5N+VjnjmARkdU2dyfli0ZzHj4VKVX8
         o8cRqm+aLobXNizB8b6nykS2EKDflIQgWOWK3eAitp6yQdoW4kl1AeBGFNYnwkxASN6y
         BMiVVZ5DYf3vcQZxSzDqvv4JOVnAYvcj07XbqnoocBRint7SWn5r4ZP9snio+7DNmhrh
         /m7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706604495; x=1707209295;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZYqm9+PdfliMcUPhu/XhOrYgIKmn3e//lFHUo82Q1J0=;
        b=LGyRtjsCCqiAYI2aA4mlvxBod+odLTOzIHvD6vmoPnuaufuuDZEvGmRDX8gFWJ1ZRH
         +ee8HEPTAYM31PrmgZxb+oBGuiZTSA2GYctPDsHFbmxvAFF0m9Iq9os0XQ1iMFlJxEVz
         LSZM5wtyfYSIhJ6/6ccpUDiaH1kY4jYS9BYLBX5uD97Czu2w7PXZSVuAWaOlXplJ5R2v
         PZQssokeyGGwfYV8vv0cLTvvXc8WJRryl0VsvEJNMms2zYDZs03WpLhZER54bmHwgi/i
         gUpZPwHZFtZK0d6RVjpTX1wtVoutXvSLKT5iCUFu5uYol88RiFjW9eO9Jew9L9kH+1wO
         lqZg==
X-Gm-Message-State: AOJu0Yw6p/j2B2r8Oj640iCEpw4YOaar2mvEJoD6whhHRaIhY+bPGt5n
	pnkBd+Bbd6A0iSrZnns3eH+O1xU62aCBUVXFMzFt9o6M07tVp9IJrQksgwSx+g==
X-Google-Smtp-Source: AGHT+IH71sIX/2pyKvffdPLMRveRZzkZyOEOtO+a5eNkPZVGWZQUlduVZZ+zglJ0uCa6g/1z9Tuwng==
X-Received: by 2002:a05:6808:1144:b0:3bd:c710:760 with SMTP id u4-20020a056808114400b003bdc7100760mr6316837oiu.51.1706604495567;
        Tue, 30 Jan 2024 00:48:15 -0800 (PST)
Received: from thinkpad ([117.202.188.6])
        by smtp.gmail.com with ESMTPSA id e7-20020aa79807000000b006da96503d9fsm7207700pfl.109.2024.01.30.00.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 00:48:15 -0800 (PST)
Date: Tue, 30 Jan 2024 14:18:03 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Mrinmay Sarkar <quic_msarkar@quicinc.com>, vkoul@kernel.org,
	jingoohan1@gmail.com, conor+dt@kernel.org, konrad.dybcio@linaro.org,
	robh+dt@kernel.org, quic_shazhuss@quicinc.com,
	quic_nitegupt@quicinc.com, quic_ramkri@quicinc.com,
	quic_nayiluri@quicinc.com, quic_krichai@quicinc.com,
	quic_vbadigan@quicinc.com, quic_parass@quicinc.com,
	quic_schintav@quicinc.com, quic_shijjose@quicinc.com,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	mhi@lists.linux.dev
Subject: Re: [PATCH v1 2/6] dmaengine: dw-edma: Introduce helpers for getting
 the eDMA/HDMA max channel count
Message-ID: <20240130084803.GA83288@thinkpad>
References: <1705669223-5655-1-git-send-email-quic_msarkar@quicinc.com>
 <1705669223-5655-3-git-send-email-quic_msarkar@quicinc.com>
 <CAA8EJprWHiShFpZdb+pWsCoxNvNEoP+3By2x4u8rq+ek37hJXw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAA8EJprWHiShFpZdb+pWsCoxNvNEoP+3By2x4u8rq+ek37hJXw@mail.gmail.com>

On Fri, Jan 19, 2024 at 03:26:56PM +0200, Dmitry Baryshkov wrote:
> On Fri, 19 Jan 2024 at 15:00, Mrinmay Sarkar <quic_msarkar@quicinc.com> wrote:
> >
> > From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> >
> > Add common helpers for getting the eDMA/HDMA max channel count.
> >
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > Signed-off-by: Mrinmay Sarkar <quic_msarkar@quicinc.com>
> > ---
> >  drivers/dma/dw-edma/dw-edma-core.c           | 18 ++++++++++++++++++
> >  drivers/pci/controller/dwc/pcie-designware.c |  6 +++---
> >  include/linux/dma/edma.h                     | 14 ++++++++++++++
> >  3 files changed, 35 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
> > index 7fe1c19..2bd6e43 100644
> > --- a/drivers/dma/dw-edma/dw-edma-core.c
> > +++ b/drivers/dma/dw-edma/dw-edma-core.c
> > @@ -902,6 +902,24 @@ static int dw_edma_irq_request(struct dw_edma *dw,
> >         return err;
> >  }
> >
> > +static u32 dw_edma_get_max_ch(enum dw_edma_map_format mf, enum dw_edma_dir dir)
> > +{
> > +       if (mf == EDMA_MF_HDMA_NATIVE)
> > +               return HDMA_MAX_NR_CH;
> 
> This will break unless patch 5 is applied.

I believe you are referring to patch 4.

> Please move the
> corresponding definition to this path.
>

Right. But it can be fixed by reordering the patches.

Mrinmay, please move patch 4/6 ahead of this one.

- Mani
 
-- 
மணிவண்ணன் சதாசிவம்
