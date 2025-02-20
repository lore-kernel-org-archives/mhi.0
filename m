Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F145B3FD4
	for <mhi@lists.linux.dev>; Thu, 20 Feb 2025 07:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740037843; cv=none; b=sTWQwRl2c4wtKKtfqvpYv1YQgRIGDbRnKp8MBtHpEJpSJlhlwkT4xKyeAD9y8aGPSThLrKSNenINiBWHZ+rJYyWXx3k3CMiAg6CoswH9J6PZtFMCcCbd4F3WSQfQX2fZcmc2h2jBAmNBKQOJNCI5VDMTsaVbokqJTLuyATOqzs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740037843; c=relaxed/simple;
	bh=8bW2YSdy1OJyn/FIkYV5qBmOPGJkHbh8jmBJ8DjbYAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hRBA2CS2VDkIchBHr7yg4xP3WFQq7NByfwRkqQwOfQBrZFnOcHBfky40YT52PseBkU2X7HDHDTja6X1ioXD7JdH73QjAr4eOTNTJpKyAqkMtOqRZ/6mELRk9ct3fZ+BPB7kJclQEKOfQzG3datjesy0HIVFQDY3pxM088tOvYVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h6saF7dq; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h6saF7dq"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-220f4dd756eso10624795ad.3
        for <mhi@lists.linux.dev>; Wed, 19 Feb 2025 23:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740037841; x=1740642641; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UV17Nt5yQKcSGgNfItNKNUGGyGE4aHh1b+X0vkMI1kU=;
        b=h6saF7dqnNP+ph9Ntl4657+fB5SuG2FQPTgTSNMP3srAd1TYKdg5ARrs14t9xBHnA6
         fbfOr32VXxNmM5C/z1S7KspxfvBcsqH45siGcfT2m+vixurxX7xdL/PZR+3/RjybnUF2
         TaRcioAMeDno8i7MxgsxjD6xUl8H2MOQOY7bNgFkuBRa5aBxN5cWhe5J1lDMeFp2su9W
         7fv7dXiwta/w2a1BenI32gK4suZeO6TvZx1zxZwL2K0zkNoWIW4Exf0NxsxyrksJ+GM7
         zOzlFIe6Q/HVZKv59XTCIAmx3lXSYnSkoheKnY47Eu6RyLQTdzTdznp1UEvgY6A/11TX
         GL/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740037841; x=1740642641;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UV17Nt5yQKcSGgNfItNKNUGGyGE4aHh1b+X0vkMI1kU=;
        b=IvPb//5RF45uTUpbmd2v7YptrlO8lcNhEI8sxWqGpGGl8xKWW0gXMHBiGAtz5T724q
         4asxaUrC/H3l3e6e+/f+xadS0JulsFMHBhtARdmQlLda4hmyjdWscnVk6Hf9jVFy83wN
         JsP1A4UZ+Dw2fpa76pDKFH9MOIyI1c2pGvM6N/IlUXPwJNL0zYIuwJ0kLqd89aFxYd+4
         Et6LGN582KkyFHXhTeSFsZgXD+OtIaPHo6WbQXcYBDrcvF+1NY/NyQnDulO+SBTAT9j9
         ytS/CeZvIwMgeQgjf0/4Fy6gBY3u0AwlGNUTVImUHhFG8nleEYe4OCPGBGSyYUsQHJoR
         /Rbw==
X-Forwarded-Encrypted: i=1; AJvYcCVetlFl8RiPObBbjdW/V1LqC5pAnrTzeCXQJSHEf0+2num1FU6sBdzMQ6O6RQ7vrjgm0yM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwTGDtv2ioootX8WJ/nUtKccLKIGHAu/eDu2llkVWzkkzfKI6fP
	0hsTK1ROTuCYNQpeEgtcRax8PS00uHry94rWhPkErvusAYzbu7QPUnsgIEuDjw==
X-Gm-Gg: ASbGncuzEct0LyFfRvVuHjT4gOm8Xsl/8Xo8NX+T6iwPnIMBFxC0AF53PYu4ze1roJX
	8AZXHAKtq6Sqvw7HWgx4JhBhGctHBb/DhkPZzshyLoPEAifdaLsUm4DkXc4N+o2+gMrW/OWrqQw
	4xHIWiQjXP1h655F72a8d/feeAt2L2BhwLUu0ZdredKsknDKUWzoGt7mwTOOL5D+W4lBgabRzcg
	SqYN39sG7p9fXxVNskIbKa1Vd/5wkQFvm5rQbQT9ylvdD3hz3o6+I7c4p41YUY08dU/1Xo6/o05
	/RaFlWTD1sQ6xeCn5NCCRB4SeA==
X-Google-Smtp-Source: AGHT+IFSN9+iiUzXPMS/UScQ00TgdpnN4eGzxEYaWLUw7fx9CjEDSYnibRHaiiO0jYuYJiu+yQKyaA==
X-Received: by 2002:a05:6a00:2e82:b0:730:9567:c3d5 with SMTP id d2e1a72fcca58-7326177cbccmr34361814b3a.4.1740037841234;
        Wed, 19 Feb 2025 23:50:41 -0800 (PST)
Received: from thinkpad ([120.60.70.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73258b985c9sm10741321b3a.84.2025.02.19.23.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 23:50:40 -0800 (PST)
Date: Thu, 20 Feb 2025 13:20:34 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Muhammad Usama Anjum <Usama.Anjum@collabora.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Johan Hovold <johan@kernel.org>,
	Loic Poulain <loic.poulain@linaro.org>,
	linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
	kernel@collabora.com, ath11k@lists.infradead.org,
	jjohnson@kernel.org
Subject: Re: [BUG REPORT] MHI's resume from hibernate is broken
Message-ID: <20250220075034.unsd5cq7xkip2by6@thinkpad>
References: <59c036b6-a3d6-403b-8bb0-566a17f72abc@collabora.com>
 <20250214070447.scs6lpytjtecz3ko@thinkpad>
 <1cd4a1ed-f4e7-4c7b-a19f-f79afddbe310@collabora.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1cd4a1ed-f4e7-4c7b-a19f-f79afddbe310@collabora.com>

On Mon, Feb 17, 2025 at 07:35:50PM +0500, Muhammad Usama Anjum wrote:
> On 2/14/25 12:04 PM, Manivannan Sadhasivam wrote:
> > Hi,
> Thank you so much for replying.
> 
> > 
> > + ath11k list and Jeff
> > 
> > On Tue, Feb 11, 2025 at 01:15:55PM +0500, Muhammad Usama Anjum wrote:
> >> Hi,
> >>
> >> I've been digging in the MHI code to find the reason behind broken
> >> resume from hibernation for MHI. The same resume function is used
> >> for both resume from suspend and resume from hibernation. The resume
> >> from suspend works fine because at resume time the state of MHI is 
> >> MHI_STATE_M3. On the other hand, the state is MHI_STATE_RESET when
> >> we resume from hibernation.
> >>
> >> It seems resume from MHI_STATE_RESET state isn't correctly supported.
> >> The channel state is MHI_CH_STATE_ENABLED at this point. We get error
> >> while switching channel state from MHI_CH_STATE_ENABLE to
> >> MHI_CH_STATE_RUNNING. Hence, channel state change fails and later mhi
> >> resume fails as well. 
> >>
> >> I've put some debug prints to understand the issue. These may be
> >> helpful:
> >>
> >> [  669.032683] mhi_update_channel_state: switch to MHI_CH_STATE_TYPE_START[2] channel state not possible cuzof channel current state[1]. mhi state: [0] Return -EINVAL
> >> [  669.032685] mhi_prepare_channel: mhi_update_channel_state to MHI_CH_STATE_TYPE_START[2] returned -22
> >> [  669.032693] qcom_mhi_qrtr mhi0_IPCR: failed to prepare for autoqueue transfer -22
> >>
> > 
> > Thanks for the report!
> > 
> > Could you please enable the MHI and ath11k debug logs and share the full dmesg
> > to help us understand the issue better?
> The ath11k debug was already enabled. CONFIG_MHI_BUS_DEBUG wasn't enabled. 

Sorry for not being clear. I asked you to enable the dev_dbg() logs in the MHI
driver. But it is not required. See below.

> I've
> enabled it and now the hibernate is working without any issue. It is very strange
> how can CONFIG_MHI_BUS_DEBUG make any difference. I don't have much background on
> how it is helping.
> 

Probably some timing issue. But enabling the MHI debug logs could also hide the
issue. So you should disable the CONFIG_MHI_BUS_DEBUG option and collect the MHI
trace logs that we recently added.

Hope it will shed some light.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
