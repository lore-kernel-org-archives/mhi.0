Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E69A1DA37
	for <mhi@lists.linux.dev>; Mon, 26 Feb 2024 11:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708948051; cv=none; b=cftufDipJ5cAGo7l3JurMgQK/PYpoT2pUbMj7pGWW825bC/K8AptyUH0otcPf5tGy91iTcf4G+cvWR1F2W+EV1Y1mlxZtC589exK7DtQpDpR9yK6+0ZiUhT5WCQO2kLlNFAubF1Jwk+95VbwZMz9EhwGKUivO7pnmD9nezPHBGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708948051; c=relaxed/simple;
	bh=xI/+JNTH1HBg6PbQe98nkhNmlv7el3dBU8j34qK8pO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u4YZcM9/GJ5JFEhX83y+rrPOMwMKZmofTThuUrIzZNB4L7FuQmNl74xXXAjDiTxApJOlCFscpkeKYjA5LQZGrPSqFcjXqfFuTx2yrOmvJJlnTRBmRKvn5Qz9/OwNe9c0N6rOQyqkK30kgmO5FSGul1yV8c4eZOwuWr3O1f56HA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NZaGtjQA; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NZaGtjQA"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-787c0f5eaa2so124528585a.2
        for <mhi@lists.linux.dev>; Mon, 26 Feb 2024 03:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708948048; x=1709552848; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QRqUlMYfT55I0mUOriv+WhNqbIIJL/CKuAFOjzZC4uk=;
        b=NZaGtjQAADUYNNP7UwUHsQHEy7Tum8CE9wTXdbarIuJJzuZoyoViHXoYMOuVsNpeBw
         YDrrgqKPwsfgQvDEdOe2UeWq4HDiSh0jROIPpuKLgKWKWjK4tg3nFhqbe0dJ27EupBIn
         GY5YzD6YJL2Txz7GCZdFzp2efutS44NE6BVuH+D2lHUWDuLRJJ5TpLYXtJQiywpx+TaW
         Vb5Y/wygDDQO3T3b10TRCBaxR3rSQH6YdlmYbiUXX6Uh7DJ1kFUkkOVI4JCVnbo53JyT
         qjnIikAX8YpD6/nWo9lI6Vmxm5YMmwjDEKyaAQlC2pMrWvh7XmX4WcHIDRZn74P9ZbjV
         U3PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708948048; x=1709552848;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QRqUlMYfT55I0mUOriv+WhNqbIIJL/CKuAFOjzZC4uk=;
        b=uoGhSN/VeIIW+sS4HXaoTGHrKwAnlXV9ZQDMTd/IyBePIlX7JiVMVbAmjq0BBgIcyt
         TIuMZUUZce0y3Bt592oFRb8xUmwuL7tNC4iYo4nhIxydB9C6i0uMDWe69zgWjHre0MxJ
         tuGbUYoAr5tfs/FFg+l5cYIL5uScEPYC9H5FIbPg4qMRz1Z9gBMc/KJ/slHiKOnI0qPc
         J6kpSIyYM+/M5ucuRKgwuZhklWauWDrhSpbxPQHjntkc2IdNcH1DPu79M6LQ9uvQGBwI
         MWzDkP0Rd76Y5hocHxkqJFGFrKbLdszFqkeiDWX1eetIRAdBgPoC8of3WHeqVdP7Yrng
         fVjQ==
X-Gm-Message-State: AOJu0YzazZssgegg9CXfSKnaea4BqLGVonRVRPZ3wBMr2arz9Cj0qKYp
	ZZ6jHf6AKWmUIv1lrE0hQgCusqNs345h21bqQ40ksd7lnZKqHfaVLKyPUH8pMQ==
X-Google-Smtp-Source: AGHT+IHi3HYOP27dsAZYTozwNq3EVHMCKBPNrZ0oYnRIkB0H+YY5YnR3Yxm0XqH2Uh4PixfVEIMWgQ==
X-Received: by 2002:a37:c209:0:b0:787:25e8:3391 with SMTP id i9-20020a37c209000000b0078725e83391mr7569722qkm.18.1708948048577;
        Mon, 26 Feb 2024 03:47:28 -0800 (PST)
Received: from thinkpad ([117.202.184.81])
        by smtp.gmail.com with ESMTPSA id u23-20020a05620a121700b00787c6703539sm2033427qkj.90.2024.02.26.03.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 03:47:28 -0800 (PST)
Date: Mon, 26 Feb 2024 17:17:23 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel@quicinc.com
Subject: Re: [PATCH] bus: mhi: host: pci_generic: constify
 modem_telit_fn980_hw_v1_config
Message-ID: <20240226114723.GC8422@thinkpad>
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

Applied to mhi-next!

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
