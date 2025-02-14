Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCF1186E26
	for <mhi@lists.linux.dev>; Fri, 14 Feb 2025 07:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739516697; cv=none; b=L3x5BkE0tnRplpfTpQEnWW+gqK+L3EhohWD2rX4yy6k1PnHm3ONCINMe0cer+waEtMxW/rBo2+DPdRlK9N5eI6kqc/AfCBMSe/1oo4y/cvvSlCeu/1S24akHRVARqKXduQZs7E76EsjxRG1ySj2mb7NHRBJYwXEBUjwXeXozu00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739516697; c=relaxed/simple;
	bh=inoYxAUSZL0MSsh61jRPAz7Xi/ChSIhVE59oDoIvQIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BUBdGSyYp+2nXJh0hnPG15UEAJB1v56D+bJG2UrBZBCT6Q+kz6RBT996R3MEyfXEd/a8SCtPcwPXutvo7dZiI0y9KQtlFq5CG65R4FoLhUPYlc9FNFzBKLhKV/OvcMY3IcydGtH3dBaP4lEUsiYIV2E6+fQwad+Be2XE86YfVpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lfjD+vzs; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lfjD+vzs"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-21f44e7eae4so31627545ad.2
        for <mhi@lists.linux.dev>; Thu, 13 Feb 2025 23:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739516695; x=1740121495; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P0N0X3RdIUpKTp5bovKhP0i6D22WIPGqOlaqXbJdgtw=;
        b=lfjD+vzswz8Ltrm7VfhxR/iZ3qIx6iQ623ezyX1724smBLoiB9/aFhkFFcx5AUhYEL
         x9R9w+lpwxZussgPunzR7trIKXpJP7Q5oRZ0NBxfN/cCbD3+qEiVo+qPJH00hRLXkDcZ
         pls7bTnKOzTnkqJmLWPf2yQDPPwXOOI4gsdpbwMiSJ1RwocgnBU/38cgnezXXugjyEuC
         3RtrmzJQbWWDbBlvXaSojYVYypTG7eu3mvEzz9ORuBu33jmym1Tq/EdHlM+ho8o9ftk6
         0VVGkH9D4ylQ1Ars1tralzQjA5UJN4TUoB5jCZioVdlLA2uoPypREX8V49kixWXOSnWh
         14JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739516695; x=1740121495;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P0N0X3RdIUpKTp5bovKhP0i6D22WIPGqOlaqXbJdgtw=;
        b=rrdlh6xgsRJMARmhv+fCU95Sv7zXT3s7PX9mNa0lntWFhwLeJ39Zjt+WYJzzF1NeBv
         5penNxxMKfQ2PF5It/6fhVyyd+HdIyaSElVgGSw/74hBem6zpqTQ+Yj8zuQvymf0HIxV
         2PGoh4ph+N4BAx6lFn0RF8exywmieZx1pPnblNG/ytLP3MbkNTPx/Z+aaK4h2wea5UPU
         RPUkGSoKMpLfU/uwoAHnpmdcsBCiDg3Xl7zJGJJOvzjehuyFxIKbwOVI+tXnhvfByh1w
         sF/YIa1+DZTDzF4ggDvup/K5e7+w9GzALc7nOrl+KvDXyPrBHW/hjg4cKwCxzaAaGJK5
         55Sg==
X-Forwarded-Encrypted: i=1; AJvYcCUNPV/JVzxzBrhvtc6Zcss3FhbtDD3pLFu9cd2+gK38ZjkHu+D+ReFKXCYrDnGq8Tltaeg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxufbsvfGL2fCdjytG4VmKPVI9aWPejxko2YiWE0AUs0Ynx+MlS
	j5vsILAeXwijE75rJ3Oig5PeAgy1JQXpDgGIPbOqgFdY4WAudNkTIX5WCWK3Hw==
X-Gm-Gg: ASbGnctyh+4iDFdjSvRvGQMaPFD5fqbTQrHcCvg4U7p9C2l+KH0A9UYvo/VEheWUz5a
	IsDX1URa4ZTvgEXoUEywhD/+7jatsxD630YjDg03mDPyZfbvpSydkd2GwFdi94B7ugFe8vcCw9G
	Nmnmth6S8fp7ULyzciQBtbSZjpImBzlZTkqDt6POW5GDSR2wWskJqpKCuWjiH/RIeBDdy2+QYj9
	jKVBIvkCwhmVBzy8nd0phdMYpitf9GMhmuwnJLi6RUBI2MVXEm9T+yK1Ca3CRi+1lvXM/OTYOOp
	B2HLGFZfI+ukTaTcGApiDk+5FbgBeAk=
X-Google-Smtp-Source: AGHT+IGuqMZgZlagRCyTIKxDvOSsuvPGqcUxE8dosYx3w84r1nGN21q6LfaA+OlbApLZ3lRcHCSUbA==
X-Received: by 2002:a17:903:950:b0:220:e63c:5b08 with SMTP id d9443c01a7336-220e63c5e07mr59800745ad.11.1739516694826;
        Thu, 13 Feb 2025 23:04:54 -0800 (PST)
Received: from thinkpad ([2409:40f4:304f:ad8a:8cb7:72db:3a5e:1287])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d537ca99sm22711205ad.106.2025.02.13.23.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 23:04:54 -0800 (PST)
Date: Fri, 14 Feb 2025 12:34:47 +0530
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
Message-ID: <20250214070447.scs6lpytjtecz3ko@thinkpad>
References: <59c036b6-a3d6-403b-8bb0-566a17f72abc@collabora.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <59c036b6-a3d6-403b-8bb0-566a17f72abc@collabora.com>

Hi,

+ ath11k list and Jeff

On Tue, Feb 11, 2025 at 01:15:55PM +0500, Muhammad Usama Anjum wrote:
> Hi,
> 
> I've been digging in the MHI code to find the reason behind broken
> resume from hibernation for MHI. The same resume function is used
> for both resume from suspend and resume from hibernation. The resume
> from suspend works fine because at resume time the state of MHI is 
> MHI_STATE_M3. On the other hand, the state is MHI_STATE_RESET when
> we resume from hibernation.
> 
> It seems resume from MHI_STATE_RESET state isn't correctly supported.
> The channel state is MHI_CH_STATE_ENABLED at this point. We get error
> while switching channel state from MHI_CH_STATE_ENABLE to
> MHI_CH_STATE_RUNNING. Hence, channel state change fails and later mhi
> resume fails as well. 
> 
> I've put some debug prints to understand the issue. These may be
> helpful:
> 
> [  669.032683] mhi_update_channel_state: switch to MHI_CH_STATE_TYPE_START[2] channel state not possible cuzof channel current state[1]. mhi state: [0] Return -EINVAL
> [  669.032685] mhi_prepare_channel: mhi_update_channel_state to MHI_CH_STATE_TYPE_START[2] returned -22
> [  669.032693] qcom_mhi_qrtr mhi0_IPCR: failed to prepare for autoqueue transfer -22
> 

Thanks for the report!

Could you please enable the MHI and ath11k debug logs and share the full dmesg
to help us understand the issue better?

> This same error has been reported on some fix patches [1] [2]. Are there
> any patches which I should test? 
> 
> Is officially hibernation use case supported at all?
> 

Yes. The hibernation support was tested with x86 host machine for both MHI
modems and WLAN chipsets (especially ath11k devices).

> In my view, this path may not have gotten tested and can be fixed easily
> as we need to perform, more or less the same steps which were performed
> at init time. But I've not found much documentation around MHI protocol
> and its state machine, how is mhi state related to mhi channels support.
> 

During hibernation, the power to the device could be lost. But it should be
handled by the ath11k driver. Maybe the debug logs could help us know what is
going wrong.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
