Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1032C13BAF1
	for <mhi@lists.linux.dev>; Sat, 22 Feb 2025 17:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740243792; cv=none; b=n8Embs+PhwK9PHTrzxCz3A8KBwB+ORDjdQYGvA0VcqTNrj+MlTVctBLrZfjcFGZnDDM7JeqoJS2LRzfiDQAaeIF0RVIjzlAzRUVuh+mtRFvVy4LEBTxfRXhZ3wQfOvwkc3cJVQ0Zs13bosmHi74TCm3YoQVIMaRoEXutFywG6VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740243792; c=relaxed/simple;
	bh=FUJp/WAnAiLgR9eo+hD/VF28hg6dM78u44VF9c0HmJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kHK0MHD/KLDPkAocJZuqjytWSOgBXg91Y6AMQN+3rWR16pSI7wIkVn9WwJP0or/DUjYkqYjGlKkQpOpyn1A4uzcRfN41cSm/TaVKyBYBtjS8/WZIdaNJTO6zxuxz0ZgXsadFSN0wCu9AGJt5bHHs9XiN/Wqktrsza1lEBrELjzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Hmojh1Yn; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hmojh1Yn"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-220ca204d04so48184895ad.0
        for <mhi@lists.linux.dev>; Sat, 22 Feb 2025 09:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740243790; x=1740848590; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F8/d8NAnbtUAywCEyPXFM332P09aVBVi8dqiBukY1kc=;
        b=Hmojh1Ynsn6rWaYYUdwUxCdkOkwa1HnyF8bXvV5WjsVxQnW3nGlSxvc0DADEORvCnk
         w2MrUYL6DWFxkv+hF5kFVeWfz2xPUZRGuQkLBhg7IktWQ90dOHChgLftJUszIgeNyw/r
         OS/RtSarECX6CLGvmkPAJFmV28PBHiNRvKY1hQU1TZY/i6y9dcPFWgJJ7GW4utgW/wiQ
         /KFuLEem7lBlHTfLXjuWFsTwkMb78+DBH8lThJkhJ3cGB7KcgVES6Jl4F2P3ueBBL4zO
         a+4FtCy1ZH3r2+CGPstM6r465U+lgjhGoUblsHDWOD1H0a0ffspIixQFEDa+7T/ibUw5
         +p7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740243790; x=1740848590;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F8/d8NAnbtUAywCEyPXFM332P09aVBVi8dqiBukY1kc=;
        b=ce99/LrO/lg4t/otSAFyQ4W7k8ouecciuiq5rX6ygIBJh//WocPScBwvlrCouC8Fde
         YfdRm6y7ug9LZxYFaxslhpZ0t/yIG2uHyaaKYn/nDG2TSjTmt3G9jappAKBHDpEE7JOE
         s8dlTHivgwHQ4JECLIR242kLEfl6J9YOxpMW3c96RNV84kbn2aE7/tMfSqJVAXo9ikuX
         gIs1WVaTgTYxRqKoWAfjqsamLANPNLBbzr+OEw0kXojRlTqOhsH/s/OaYLeoZ/DyRFZk
         uuwxn98f6tbeSD7nsSXC+8MOKim4dhAyVdKeOT9Zwivm3fawkAgfRZ01VEyNHcfM5JlI
         W5dA==
X-Forwarded-Encrypted: i=1; AJvYcCUtoWHjiVAkUyJNmz9HpTivllIDXXsx3zMymSL0BMAVRHdv5zs5DDXCtSeL/IgLMlhAqxU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxQEHJvs12wC7Y5UiRyZ4aHBwR2elTIywKXWTcLCHh1Iw0b/pQf
	RS0fQLLDDt5ESJCG2+2KINKuyfUNUh55r8mwZLFGUoAvO2JhZ44E2GWaH5mu7d2NHSA/CWFpjCE
	=
X-Gm-Gg: ASbGncv/afBj1QpMDe50dBa9450SkCgXncb6LBVMGSEpEpaYYT7a/vZ4dEpDqG9uD0I
	8a644WrxkIqM3HDqb6kSGxhcWSCF/PWoRfsV9JiAbSokR2N/IvM2OktrySA9R70vN9HPSV977kH
	rA94FmtU1Iy+ggI4H4Ir1DoJVUD/B/o/dgPwQDrq9guMM3hgJ4vf7qmqIwSbDDKU4sJ8xKaJlYO
	cu2NE6AYljiKGoN7irjUcPRvV+Hs1mGwQ9Mrgnlu+qWSmpx5OJLofXMVrN9wGPdOBgEzbAI4Tny
	i6rLC0DhHg6VYGFT9jAyqRIRd69C6iDQIEAWmA==
X-Google-Smtp-Source: AGHT+IH/uHf1ov30Slxv4c/9kj5MHdTkDqkZgdS5Yptqo8wLkHd6UMxT1CC8C6DAZx5yQsrqPu5wrw==
X-Received: by 2002:a17:903:3a8d:b0:221:7e04:d791 with SMTP id d9443c01a7336-2219ff65654mr122353055ad.31.1740243790339;
        Sat, 22 Feb 2025 09:03:10 -0800 (PST)
Received: from thinkpad ([120.60.135.149])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d545d62dsm151809115ad.149.2025.02.22.09.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Feb 2025 09:03:09 -0800 (PST)
Date: Sat, 22 Feb 2025 22:33:01 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Mrinmay Sarkar <quic_msarkar@quicinc.com>
Cc: quic_shazhuss@quicinc.com, quic_ramkri@quicinc.com,
	quic_nayiluri@quicinc.com, quic_krichai@quicinc.com,
	quic_vbadigan@quicinc.com, quic_nitegupt@quicinc.com,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Slark Xiao <slark_xiao@163.com>, Qiang Yu <quic_qianyu@quicinc.com>,
	Mank Wang <mank.wang@netprisma.us>,
	Fabio Porcedda <fabio.porcedda@gmail.com>,
	Jeff Johnson <quic_jjohnson@quicinc.com>, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: Re: [PATCH v1 1/2] bus: mhi: host: pci_generic: Add supoprt for
 SA8775P target
Message-ID: <20250222170301.eflilypd4uaqbtrq@thinkpad>
References: <20241205065422.2515086-1-quic_msarkar@quicinc.com>
 <20241205065422.2515086-2-quic_msarkar@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241205065422.2515086-2-quic_msarkar@quicinc.com>

On Thu, Dec 05, 2024 at 12:24:19PM +0530, Mrinmay Sarkar wrote:
> Add generic info for SA8775P target. SA8775P supports IP_SW
> usecase only. Hence use separate configuration to enable IP_SW
> channel.
> 
> Signed-off-by: Mrinmay Sarkar <quic_msarkar@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

One comment below. But I'll fix it up while applying.

> ---
>  drivers/bus/mhi/host/pci_generic.c | 34 ++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 56ba4192c89c..b62a05e854e9 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -245,6 +245,19 @@ struct mhi_pci_dev_info {
>  		.channel = ch_num,		\
>  	}
>  
> +static const struct mhi_channel_config modem_qcom_v2_mhi_channels[] = {

I wouldn't call sa8775p as 'modem'.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
