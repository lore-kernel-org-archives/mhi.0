Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE8F5465B
	for <mhi@lists.linux.dev>; Fri, 19 Jan 2024 13:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705670829; cv=none; b=iLAqInQq6JJW0AICrVfFWdv3AbbcjIXfV7us9gEAApbn8+STzA7QfimfFlDMBy+9xxvp5tNbtgiJr+yQhsBMfaYl1kC4wWo9zkNlRScozEpVOOKd16ScAFNE4qjDMrfPmykgqgpAlN7zEnMGAskFz5YtNjSPc6/AZcncVx1TiGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705670829; c=relaxed/simple;
	bh=tkNP5hdtLMLmdRU6kGCnnq1HZvK5vqTcSU7Mp+tbZQE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q2G3xei8UvhvMtYRcmJLFSGkSwMZ9m6pH8rsiZcqkLtb/ZGvM6DPzK+hUan54EoJrteCLcrZvhKl1l171QMhPIGhjpf9z35TNqUa4BkX2otS/FbYaN/waq+ikQPvIXI+s/0LlgnfNKh4UFErUKgVD5KZxyzktvgaQ8l9a6Fmnbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Rn6USq2S; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rn6USq2S"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dc223463ee4so771195276.2
        for <mhi@lists.linux.dev>; Fri, 19 Jan 2024 05:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705670827; x=1706275627; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=42jWvBuWK7I9LjSS4bPIwTmo8OJpE10eZpVzP5bii30=;
        b=Rn6USq2S9fN5caNeUThwjLPedEFm4fEIy0uZdGoxfPivt5cJl/8SPLGAkdNZY8zKrC
         uzg+2D1yqqBJGZPWmxlCsum+pdG3s9Pvs+TEeb8zAXf3CGBxJmXQI440+eJ6SQInnY1W
         6yFJ9R+bYCV2E9Ce5KavbO4u2ytDCTED/PM4eOQXV+VQOa9D3fEUR6FzHpcqsuVZSwpc
         MUPeWm/4K3/6cddYHgGspWGCyNT/vqPBhTkg1EkyzhLpu9WgGgk/FR0iJ/M2sOruhd4H
         GgC/lKWT440ffC0rBFx7Pw5zDd0PWTi+3Ud2a89sPzrYFQIHkmXUoU1vEix2qFmq7IP9
         3yJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705670827; x=1706275627;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=42jWvBuWK7I9LjSS4bPIwTmo8OJpE10eZpVzP5bii30=;
        b=c5zk5KW5X32JBCmRMIDcY85hTGdj8j7YKeJeJjcBPYqBCO/rdXke2+RLLKjUtu5NWh
         bxTRdVPpmtKITYNe3BfiDwkNRZcHIVik5yx/oXCHIEddYFvkJs0SGDNtC9qfp7h+2ONW
         WVH5CuIko55CQbjMCwt3Crh1oeWtWvxK890ueEi0RxOKMjKUt7TDKrKx9wuHz9RvrXFW
         QEfkU/6j3UgdHaiclMfhR9Zc4iFrHmVpIZ/tGqOBLPQny5CIBMjHjax4jaVj22B7SlSH
         JifjelVW54Fk+hegaNE8dSncM9Hta56HtgITyynW5uMYQOtmXdYGBDra85ApxUTGviSv
         g7lg==
X-Gm-Message-State: AOJu0YxNf17usjLw0OARMt2JJsVMV4G4zGAFPiC19E5R4s65IZW9ZJQr
	BXeXwE2xrJdZxM+3gheHMby8FtXMJeX8I+7cIQ1gak+u6O2dwJRu3cN+N0Tuc4DFFP8pG8hR3b2
	98aYf65Mf/RsUrnCsuTHNgFKQDHuQvDKsSA51iw==
X-Google-Smtp-Source: AGHT+IHcNZ3z0a6KFk4Azj3BQtD3k/0SlfNc1gxTnmWDbYZDfxsy/+8Zo5qiZ4T2sE8zVUc9JU70wOEc2pwAJXP0ECs=
X-Received: by 2002:a25:c583:0:b0:dc2:46d7:d8d5 with SMTP id
 v125-20020a25c583000000b00dc246d7d8d5mr1960765ybe.65.1705670827062; Fri, 19
 Jan 2024 05:27:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1705669223-5655-1-git-send-email-quic_msarkar@quicinc.com> <1705669223-5655-3-git-send-email-quic_msarkar@quicinc.com>
In-Reply-To: <1705669223-5655-3-git-send-email-quic_msarkar@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 19 Jan 2024 15:26:56 +0200
Message-ID: <CAA8EJprWHiShFpZdb+pWsCoxNvNEoP+3By2x4u8rq+ek37hJXw@mail.gmail.com>
Subject: Re: [PATCH v1 2/6] dmaengine: dw-edma: Introduce helpers for getting
 the eDMA/HDMA max channel count
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
> Add common helpers for getting the eDMA/HDMA max channel count.
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Mrinmay Sarkar <quic_msarkar@quicinc.com>
> ---
>  drivers/dma/dw-edma/dw-edma-core.c           | 18 ++++++++++++++++++
>  drivers/pci/controller/dwc/pcie-designware.c |  6 +++---
>  include/linux/dma/edma.h                     | 14 ++++++++++++++
>  3 files changed, 35 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
> index 7fe1c19..2bd6e43 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c
> @@ -902,6 +902,24 @@ static int dw_edma_irq_request(struct dw_edma *dw,
>         return err;
>  }
>
> +static u32 dw_edma_get_max_ch(enum dw_edma_map_format mf, enum dw_edma_dir dir)
> +{
> +       if (mf == EDMA_MF_HDMA_NATIVE)
> +               return HDMA_MAX_NR_CH;

This will break unless patch 5 is applied. Please move the
corresponding definition to this path.

> +
> +       return dir == EDMA_DIR_WRITE ? EDMA_MAX_WR_CH : EDMA_MAX_RD_CH;
> +}
> +
> +u32 dw_edma_get_max_rd_ch(enum dw_edma_map_format mf)
> +{
> +       return dw_edma_get_max_ch(mf, EDMA_DIR_READ);
> +}
> +
> +u32 dw_edma_get_max_wr_ch(enum dw_edma_map_format mf)
> +{
> +       return dw_edma_get_max_ch(mf, EDMA_DIR_WRITE);
> +}
> +
>  int dw_edma_probe(struct dw_edma_chip *chip)
>  {
>         struct device *dev;


-- 
With best wishes
Dmitry
