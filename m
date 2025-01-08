Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4069419B586
	for <mhi@lists.linux.dev>; Wed,  8 Jan 2025 05:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736314933; cv=none; b=Ipw9Y+lyJPpiCPh7EEco5ZjRnIfsoOVwO9vbJhuYEIvbGc2VAAjVCCGwMyrdOkSACEonAOjm7Vu9Q8J+10aFM7M/CUWCStPggJ8yMXrrlUmwr/lPaJUqMpueP//3WqU2W7r/hqH9YCPusQdsx2tiGsULxN35iUA4gCv4qRmw3ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736314933; c=relaxed/simple;
	bh=V1/eCskG0EEA3jK4/+w1sWmTTp3nj57YncqG93zlAl4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FFIXDWRR2xoiFgNwCNp77RecfxmzFifhfBUwP1cKPmGS3jGuiGtEFLP7YyDa4II+duuBMIQc/03dBsNnGpIkOdIDoNuDUS+JsvvMzZ7CG4H7esupIY9SsBjdMvj6H2ZoioOFV3xEOB4fbwzabt72v+Ese2KHBMeXqKrJGfOamxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RwjVf7Yg; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RwjVf7Yg"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2163b0c09afso239996145ad.0
        for <mhi@lists.linux.dev>; Tue, 07 Jan 2025 21:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736314930; x=1736919730; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VRf3KLf8/gL60sYLc56uaXjwgEUxVqDlLqbN/+vh4pU=;
        b=RwjVf7Yg837riwlGREy88uwdxxYyHGMpvWB7r00MNzowPJEk2Kt2qX5z3T8ucoLpmS
         P6Dk/WfeQUZqcEH7aRcShHbz1ItxHUNEb+UMlB9JOaK5yEQC4UOoQStNqMfR6BHiEsxc
         U2jw0b8faAtfAoAsyRuzXQDH/eYexLG6BGWIR/Dhmg+Zb6D4s8e+puB5QcAUI8wsGBOH
         PflLmzvEONufH6ePOE8mvjioklM9ISx0zhQ3usCdOePOX5g43B5ifPt1O2yuENWiKIFu
         W368Ip8+IYdXtN8A+24jdq0MlvVoRTCxo3SKupifunSqofOk/JQ2e/8UFQ8ifSlsDLWN
         VgoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736314930; x=1736919730;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VRf3KLf8/gL60sYLc56uaXjwgEUxVqDlLqbN/+vh4pU=;
        b=FxTppMwh2Trse/ZIqctZBYtTf3bJbv/llHdCKe/1XGICQ79pEP5alwpx0B6rgB1Doj
         r0AOsHdJoEYwTyKFpVPJO/0OAMmJ116IoLmWFwkNNteGCkCrKvrRdy6ASv4JCwYkkYXU
         pRyGpoEbyxX8EyOdPa6oFFMzynvhFsZZDBO/UtDtEHGlSLmvQ4nnlP2WDdALcSlg65h/
         YNfg4viiShagrq2kNoY/zEunaFmzXo0zzie4CXxU1AHiVNPpTm1HOTarzf7rfTAS/KbP
         g0nLH3sLQ3mf9qBkRy44320bC5l21je95ar5kTLUZfsiwxwJ7gzn5g7dv1jEPn542XRa
         cWoA==
X-Forwarded-Encrypted: i=1; AJvYcCWk98jwQ123BTiXDYLcRMrN5Ksb+GpSIG2mNCvUalfU0TOu468p97wn4Yci/sVgTewyR7E=@lists.linux.dev
X-Gm-Message-State: AOJu0YxvWr3hHqhMCgCkdjxS/RcvxwoL2EcXl36NjHY1MA9ztnGJvuKX
	Va52M7thP4hnWJy30xqp1bLHrmKnDf9GIYD95G7ZLlfQYgmRkQrGD7yY3MGfmg==
X-Gm-Gg: ASbGnctSwa+thBCl/sm9/7GLbatkN/jdbef2otmd8vD21dYvobY4hNxFEXYYWmZqvnx
	0clxDO1NHmSmL1OSQNxj4M/l1dds84qcv2W/cOLweE2J4ATSITq5NhWsTPz3c8ANbGd1jyEq3CC
	aiutStqg24v+AS5rlL6bfWUncmRvpnEgpqdygPM44oOkB+kn3oBcjW3KRgvAjFes41NSOAHsP+C
	PUr/QV7VN8CIOMFKZ6RzfJOBgvzHI9Ix2jsWrs8MqJlM2VCspKS6NkmJI04Llsxnj4k
X-Google-Smtp-Source: AGHT+IHfb7DiJvfS8v29jxsUziZRhFKDaY9dPzRiz3np6wV51MwuSsfBjIEy6SOqBmGKPG5YDPPdEQ==
X-Received: by 2002:a17:902:d491:b0:215:54a1:8584 with SMTP id d9443c01a7336-21a83f4c070mr21127315ad.17.1736314930490;
        Tue, 07 Jan 2025 21:42:10 -0800 (PST)
Received: from thinkpad ([117.213.100.67])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f4429sm318970325ad.173.2025.01.07.21.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 21:42:09 -0800 (PST)
Date: Wed, 8 Jan 2025 11:12:02 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: quic_carlv@quicinc.com, quic_yabdulra@quicinc.com,
	quic_mattleun@quicinc.com, quic_thanson@quicinc.com,
	ogabbay@kernel.org, lizhi.hou@amd.com,
	jacek.lawrynowicz@linux.intel.com, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, mhi@lists.linux.dev
Subject: Re: [PATCH 2/7] bus: mhi: host: Add a policy to enable image
 transfer via BHIe in PBL
Message-ID: <20250108054202.r4bqxduuhpcvpqm4@thinkpad>
References: <20241213213340.2551697-1-quic_jhugo@quicinc.com>
 <20241213213340.2551697-3-quic_jhugo@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241213213340.2551697-3-quic_jhugo@quicinc.com>

On Fri, Dec 13, 2024 at 02:33:35PM -0700, Jeffrey Hugo wrote:
> From: Matthew Leung <quic_mattleun@quicinc.com>
> 
> Currently, mhi host only performs firmware transfer via BHI in PBL and

s/mhi/MHI here and below.

> BHIe from SBL. To support BHIe transfer directly from PBL, a policy
> needs to be added.
> 
> With this policy, BHIe will be used to transfer firmware in PBL if the
> mhi controller has bhie regs, sets seg_len, and does not set

s/bhie/BHIe

> fbc_download. The intention is to transfer firmware using BHIe in PBL
> without further BHIe transfers in SBL.
> 
> Signed-off-by: Matthew Leung <quic_mattleun@quicinc.com>
> Reviewed-by: Youssef Samir <quic_yabdulra@quicinc.com>
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> ---
>  drivers/bus/mhi/host/boot.c     | 80 +++++++++++++++++++++++++++------
>  drivers/bus/mhi/host/init.c     |  2 +-
>  drivers/bus/mhi/host/internal.h |  8 ++++
>  3 files changed, 75 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
> index e3f3c07166ad..c9ecb6427209 100644
> --- a/drivers/bus/mhi/host/boot.c
> +++ b/drivers/bus/mhi/host/boot.c
> @@ -452,12 +452,62 @@ static void mhi_firmware_copy_bhie(struct mhi_controller *mhi_cntrl,
>  	}
>  }
>  
> +static enum mhi_fw_load_type mhi_fw_load_type_get(const struct mhi_controller *mhi_cntrl)
> +{
> +	enum mhi_fw_load_type ret = MHI_FW_LOAD_UNKNOWN;

You can directly return the enum without a local variable.

> +
> +	if (mhi_cntrl->fbc_download) {
> +		if (mhi_cntrl->bhie && mhi_cntrl->seg_len)

I don't think this condition can fail. If 'mhi_cntrl->bhie' is NULL,
mhi_prepare_for_power_up() will fail. So I think MHI_FW_LOAD_UNKNOWN is not
needed.

Also, all the validation should be performed early, not while loading fw.

> +			ret = MHI_FW_LOAD_FBC;
> +	} else {
> +		if (mhi_cntrl->bhie && mhi_cntrl->seg_len)
> +			ret = MHI_FW_LOAD_BHIE;
> +		else
> +			ret = MHI_FW_LOAD_BHI;
> +	}
> +	return ret;
> +}
> +
> +static int mhi_send_image_bhi(struct mhi_controller *mhi_cntrl, const u8 *fw_data, size_t size)

mhi_load_image_bhi?

> +{
> +	struct image_info *image;
> +	int ret;
> +
> +	ret = mhi_alloc_bhi_buffer(mhi_cntrl, &image, size);
> +	if (ret)
> +		return ret;
> +
> +	mhi_firmware_copy_bhi(mhi_cntrl, fw_data, size, image);
> +
> +	ret = mhi_fw_load_bhi(mhi_cntrl, &image->mhi_buf[image->entries - 1]);
> +	mhi_free_bhi_buffer(mhi_cntrl, image);
> +
> +	return ret;
> +}
> +
> +static int mhi_send_image_bhie(struct mhi_controller *mhi_cntrl, const u8 *fw_data, size_t size)

mhi_load_image_bhie?

- Mani

-- 
மணிவண்ணன் சதாசிவம்
