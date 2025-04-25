Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A3A46447
	for <mhi@lists.linux.dev>; Fri, 25 Apr 2025 16:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745597899; cv=none; b=VEqKn7781vAoWogGmSfb9pjig/7V8C5F33lbT/HkVxFXXr8cPRMvZUBpwGb6098uFjRMTIgrs8vVuyC7Wi8rZPtSUKuCR+sPrBXrotkOAXfZQuLpq4ddLZffcfJNM8f922DgTVGCIJmAAyHgYZuhYAAfF8NOqaUsUUBubxUsfhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745597899; c=relaxed/simple;
	bh=3dcytkIIOKjYNTYbCvwxv8RLp8Sf8wMdUwsN320D9Ig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nfmJKyVyK/inq7Me1XT6a/xmBpZQjx03F+tKPbyn5ieNRVEMVFtgR8ip2AySQ4hNzRJm9Bhw6TUKOx3vVZP+80PXJpUI6v6DDZItvreG+/PREVZJ11RTXZqqnQIkRPYVh9KX44gT4cJRuKbj3yZZL7mamWguHPMyFs6PHtobe08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=THcGvxEM; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="THcGvxEM"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-af52a624283so2307473a12.0
        for <mhi@lists.linux.dev>; Fri, 25 Apr 2025 09:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745597897; x=1746202697; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zZbqNinw0GvgPs1iizzcZ6AlHQrRMk2Lrby4q0n+fcU=;
        b=THcGvxEMsLMJCw+2CZ3CdOVUYyPgms3xY4MxUnf23wk9uuS9Z5z3HxxaUzmHRqBrCr
         uDA8oCs3Hr9JhfF88HFnMdcHuq5Z09C7/gdi5+pfd1V5uiSbL+HziVIpaT7T00ZO3xeK
         1h6WTMj5Ghp9WMWekKPEbR0SHUA+ds/LRBaznE3EI8HZxcRUTcWyERGzqiloRBoffHQC
         2V0NBcudsks1/wp4PkCHd4W+Smkw+swf/iB8+ygjDRsddtnbTRTRevcF+ecgH3NGF8m6
         NT9p7ZgjQW8iIk+ELTHugDlAY+xehV+6evvhuhcIsAqgzMwTjwA8Rqx5r5Af0eDUV7N9
         J5dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745597897; x=1746202697;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zZbqNinw0GvgPs1iizzcZ6AlHQrRMk2Lrby4q0n+fcU=;
        b=EcmPHnRx7hByPNmoRi8CSflSl2GgEZBov2g1eWEshR+Zl+CC2Pn6oe0Xq4ZSCrLkVt
         2Ql2CV2CJvV4y01D+gbclshK7j8D+JBb4e7sslLa7zp31r7CUd+QNAY6mp+uj6fsw5ab
         vLPwhbHEpb+hlWw0bvNdKQ5fSWDRN46DSYWzmgKdn7sImxC4YSCJ8EIB9xjCbj6McVoZ
         Okrh5Tys9E741F2Z4tD4eSrPR0LsxRRYwOiZa+37htTR/Z27oDtjAUpYb9+GAYr96Woi
         QFw80B4vK1MZB+t1EKblKywS1hI15gVkB819qMJwsIZuWF8Ye6pTA1Cw2ahQlfZ6H63R
         IDTg==
X-Forwarded-Encrypted: i=1; AJvYcCWXXS9PE7tge5lE5bxRQjOg2L/uaxT8VTEOsFNzpbaqz9Kt85kN/YZozEnV6/udVtIdnj8=@lists.linux.dev
X-Gm-Message-State: AOJu0YyNhOzlLzYvIKuTpYqkNAc32hl7v/mrDalAEr9b4BrQjN/psoVG
	x4WMxDrI459LKYmmBK9soGIJ066Ug+G7dlcb3FwoH1btV831FcLGh2HiLpMRJg==
X-Gm-Gg: ASbGncvkL/Eq/ZSjfw3WyNqrhqNAsNrM69m9b3Pxv5qANfcQFEaiWJxbBP9z7zfgVCW
	AzZgOp0q3nP/QGvutNWZci6ybc/FpDmZcGVDBPesvvbg3NftS52+toby883BKKV9KCbkUvGZXS/
	n2D5DXOhFA7FbfESo0jHMUNhGSMbgCLGq4bopOzpDds9bXBzmgI1dEQ7jmCtGu9MIZj+UVsER/o
	zSETYwdKDAx7L1hWUD4T8zUJbKvcs1zzQu1aP6CVSYrkJovt9TFWLYkjcG0DZeAJTF5/oW9cT6U
	4BLMPlvyPXdX4XVhtyMPcKtPVVV4EqiXWxLurhveHNjrgGnIunLe
X-Google-Smtp-Source: AGHT+IFJ8f+Ljs0TwETyk/DKUrALYADuqKxZ4P01us48D6R3+0qlUDjyPo+P1Thcb08Psu0HHHpIew==
X-Received: by 2002:a05:6a20:c702:b0:1f5:9cdc:54bb with SMTP id adf61e73a8af0-20445ee29a1mr8972811637.11.1745597896910;
        Fri, 25 Apr 2025 09:18:16 -0700 (PDT)
Received: from thinkpad ([120.56.201.179])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15f76f45d2sm3080986a12.11.2025.04.25.09.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 09:18:16 -0700 (PDT)
Date: Fri, 25 Apr 2025 21:48:08 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Jingoo Han <jingoohan1@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Johannes Berg <johannes@sipsolutions.net>, 
	Jeff Johnson <jjohnson@kernel.org>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev, linux-wireless@vger.kernel.org, 
	ath11k@lists.infradead.org, quic_pyarlaga@quicinc.com, quic_vbadigan@quicinc.com, 
	quic_vpernami@quicinc.com, quic_mrana@quicinc.com, 
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: Re: [PATCH v2 06/10] bus: mhi: host: Add support to read MHI
 capabilities
Message-ID: <ywqbhivo7k7jmuptueeqhirlkpk5inbfaucuvmvnpj6ppcpzd4@whdsaymdvtaf>
References: <20250313-mhi_bw_up-v2-0-869ca32170bf@oss.qualcomm.com>
 <20250313-mhi_bw_up-v2-6-869ca32170bf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250313-mhi_bw_up-v2-6-869ca32170bf@oss.qualcomm.com>

On Thu, Mar 13, 2025 at 05:10:13PM +0530, Krishna Chaitanya Chundru wrote:
> From: Vivek Pernamitta <quic_vpernami@quicinc.com>
> 
> As per MHI spec sec 6.6, MHI has capability registers which are located

Add spec version also since these capability registers are present in newer
versions only.

- Mani

> after the ERDB array. The location of this group of registers is
> indicated by the MISCOFF register. Each capability has a capability ID to
> determine which functionality is supported and each capability will point
> to the next capability supported.
> 
> Add a basic function to read those capabilities offsets.
> 
> Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/bus/mhi/common.h    |  4 ++++
>  drivers/bus/mhi/host/init.c | 29 +++++++++++++++++++++++++++++
>  2 files changed, 33 insertions(+)
> 
> diff --git a/drivers/bus/mhi/common.h b/drivers/bus/mhi/common.h
> index dda340aaed95..eedac801b800 100644
> --- a/drivers/bus/mhi/common.h
> +++ b/drivers/bus/mhi/common.h
> @@ -16,6 +16,7 @@
>  #define MHICFG				0x10
>  #define CHDBOFF				0x18
>  #define ERDBOFF				0x20
> +#define MISCOFF				0x24
>  #define BHIOFF				0x28
>  #define BHIEOFF				0x2c
>  #define DEBUGOFF			0x30
> @@ -113,6 +114,9 @@
>  #define MHISTATUS_MHISTATE_MASK		GENMASK(15, 8)
>  #define MHISTATUS_SYSERR_MASK		BIT(2)
>  #define MHISTATUS_READY_MASK		BIT(0)
> +#define MISC_CAP_MASK			GENMASK(31, 0)
> +#define CAP_CAPID_MASK			GENMASK(31, 24)
> +#define CAP_NEXT_CAP_MASK		GENMASK(23, 12)
>  
>  /* Command Ring Element macros */
>  /* No operation command */
> diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
> index a9b1f8beee7b..0b14b665ed15 100644
> --- a/drivers/bus/mhi/host/init.c
> +++ b/drivers/bus/mhi/host/init.c
> @@ -467,6 +467,35 @@ int mhi_init_dev_ctxt(struct mhi_controller *mhi_cntrl)
>  	return ret;
>  }
>  
> +static int mhi_get_capability_offset(struct mhi_controller *mhi_cntrl, u32 capability, u32 *offset)
> +{
> +	u32 val, cur_cap, next_offset;
> +	int ret;
> +
> +	/* get the 1st supported capability offset */
> +	ret = mhi_read_reg_field(mhi_cntrl, mhi_cntrl->regs, MISCOFF,
> +				 MISC_CAP_MASK, offset);
> +	if (ret)
> +		return ret;
> +	do {
> +		if (*offset >= mhi_cntrl->reg_len)
> +			return -ENXIO;
> +
> +		ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->regs, *offset, &val);
> +		if (ret)
> +			return ret;
> +
> +		cur_cap = FIELD_PREP(CAP_CAPID_MASK, val);
> +		next_offset = FIELD_PREP(CAP_NEXT_CAP_MASK, val);
> +		if (cur_cap == capability)
> +			return 0;
> +
> +		*offset = next_offset;
> +	} while (next_offset);
> +
> +	return -ENXIO;
> +}
> +
>  int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
>  {
>  	u32 val;
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்
