Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7971DA21
	for <mhi@lists.linux.dev>; Mon, 26 Feb 2024 11:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708947907; cv=none; b=chxHFdCQ0moayoUzR3JUkWsJPb1OEjU7v3Zb2dteA5sX1/OfmeSDj+KSxN7VhC38x4rKIPO+d/DCCqrmdxcDsXV5b9cf+F5yUn/NNPZ5Vh6ptNhZKRC3SpgdEVtb1edhlrx6+3gRAIYBmlOzZG43aaDlZ/jyMe7RGZqJFwf4RNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708947907; c=relaxed/simple;
	bh=prNgVbePwRcKo0ldZvLmcT9NEprnyubS2n4dPuEAQS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A8MP6XrEWLxG3/d91D/LR7GUjTyM05C5v5C+b3/KLWJz9Hg9TBy5J9Kn1Ya4sk1aRDdKWymeOqcGdhjgl5w8+boKvl80IddUnRDiPDfTw3K9HiktAYWI+LBiOaCIa23i7UbsXQRB0YZb7tsTUKQJHFQEoo2MgOQLCWCLhGY3EXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LlHWt5VO; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LlHWt5VO"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-787bc61cb69so190928785a.1
        for <mhi@lists.linux.dev>; Mon, 26 Feb 2024 03:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708947904; x=1709552704; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CSKU6X8Qwf8AFWfUlivJ0Qu0nT+8oAq4LKU9650PhEY=;
        b=LlHWt5VO6BjOFJk96HHvF7863UqggDkh317JxddXlYivCgtynFlTRmpG8nc4OlOwpA
         TcAFgOGZlBZJEXLtIlrkoMmEG/SM5EQWt8bzpmWooFdpV7u0EahCHWcoJykOKvSy10Mo
         T7fYDC7aqq/P1TY4bqqAu2MzZ/wP5pA2Ge1XrObjvjFlEq5Dk48q7sgF+2kf6IFMImyD
         q9A333YDmxdziCKJUMP4XDhFFF3owhNH1L8WkHmf55Tx16LYXY04yap3ueSdW80kRj++
         qiVA/fXQrQXf3mGZ/KF60NIMGOl6ZIynVZd5WIYnKn6w1T83eETFt8x4SFfT8ePTcStn
         SJLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708947904; x=1709552704;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CSKU6X8Qwf8AFWfUlivJ0Qu0nT+8oAq4LKU9650PhEY=;
        b=jB/vV0WRXvISCVhvp6xLkbTG20vUlYAuNS+bh16xPhIMv+m+1aekibgVaKtotrLHZy
         8rDyTQ6XWqoHqGzhqJjsxhVovncb9xB/ER14m5jm/W34Ly5GGFZSy989CxuRmW678rXu
         25NAmozz0fhlAQEvXp+CWX/AuYtcX3akPVRdLR3olHnfDbgdds/W1BpkHwZmeVa2Nyrl
         P0eYAQm+n8KQI5Dotrdr50FbVvpfJKHdAWAv0cU6WWUnUuNaBn7XdSJCCcIPa8KSuaAP
         X683jttq/Gwi6ZU9OKScf+4fmillx6cvytpy9dLOktVLWPJdzaDzkygCLeK8SCiX49t+
         B8QA==
X-Gm-Message-State: AOJu0Yyt+LNdK6NAb7aY6Jkfigu7j9W1UkLea9UCHyektMw5GXtTOPDQ
	BbE7q6cn5SNaziTjly82kT5QVh3Ec10F1cLSKLnolOpT67pkGtaoJ/JSsuJecQ==
X-Google-Smtp-Source: AGHT+IGpa5Q2fHBV5USsuqQLitp7DsDSNKdukrxekBdLBW00T7uhMM/LdUvMDcnQPH4wSebMQTN4JA==
X-Received: by 2002:a0c:f0d3:0:b0:68f:e821:ed43 with SMTP id d19-20020a0cf0d3000000b0068fe821ed43mr5600040qvl.42.1708947904574;
        Mon, 26 Feb 2024 03:45:04 -0800 (PST)
Received: from thinkpad ([117.202.184.81])
        by smtp.gmail.com with ESMTPSA id bd3-20020ad45683000000b0068fa52f5f7esm2811461qvb.7.2024.02.26.03.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 03:45:04 -0800 (PST)
Date: Mon, 26 Feb 2024 17:14:59 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel@quicinc.com
Subject: Re: [PATCH] bus: mhi: host: pci_generic: constify
 modem_telit_fn980_hw_v1_config
Message-ID: <20240226114459.GB8422@thinkpad>
References: <20240222-mhi-const-bus-mhi-host-pci_generic-v1-1-d4c9b0b0a7a5@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240222-mhi-const-bus-mhi-host-pci_generic-v1-1-d4c9b0b0a7a5@quicinc.com>

On Thu, Feb 22, 2024 at 06:00:23PM -0800, Jeff Johnson wrote:
> MHI expects the controller configs to be const, and all of the other ones
> in this file already are, so constify modem_telit_fn980_hw_v1_config.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/bus/mhi/host/pci_generic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index cd6cd14b3d29..51639bfcfec7 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -538,7 +538,7 @@ static struct mhi_event_config mhi_telit_fn980_hw_v1_events[] = {
>  	MHI_EVENT_CONFIG_HW_DATA(2, 2048, 101)
>  };
>  
> -static struct mhi_controller_config modem_telit_fn980_hw_v1_config = {
> +static const struct mhi_controller_config modem_telit_fn980_hw_v1_config = {
>  	.max_channels = 128,
>  	.timeout_ms = 20000,
>  	.num_channels = ARRAY_SIZE(mhi_telit_fn980_hw_v1_channels),
> 
> ---
> base-commit: 3ab6aff5793c3c7bdf6535d9b0024544a4abbdd5
> change-id: 20240222-mhi-const-bus-mhi-host-pci_generic-5ddf8f13d35c
> 

-- 
மணிவண்ணன் சதாசிவம்
