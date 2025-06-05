Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA7827703A
	for <mhi@lists.linux.dev>; Thu,  5 Jun 2025 17:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749143100; cv=none; b=FjT/uY9BMgex8BbagDFRLTdas3/7Q82hqMbAGEJBzWGFeTt95wfjmMa1+XRMcTD1/BG0BJdM5VqPggyPwJjYiy2JDXZcWgcyPQuecDv/VUTb0OJv0brMSoyigs7EOW7zeSXOB+OWq5ypbWpXqwIG3pzjF8jjvp0DNmTrJAdMTjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749143100; c=relaxed/simple;
	bh=+ztx+saxdpo8WjLXWjfvlFkWk9/y7B6T3vhKNHZol2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SswNaKtoe2TiaUacFiBIDpZYUvYrBmS/kRWRCv6Dzly7nG+IzY0ZcMpaxQRg1bNxKkvDOBRns5iaYZ8STpvzpG24vLH3Zg4yp1d0pu7ygm+DxmUHWN6z7eD0TnbThe/s3H/+Eg8kHBlmkZnEtNW+ZaqqtFHbzTdfwv/MtknsZXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PE1/VfjF; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PE1/VfjF"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-74264d1832eso1530576b3a.0
        for <mhi@lists.linux.dev>; Thu, 05 Jun 2025 10:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749143098; x=1749747898; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SbbUkUUtWYP7VuElEDtlyDh5ofC9gH6hUBqQUj6UZLM=;
        b=PE1/VfjFOvGUgbaEx6CtM0Mxgbrf9NYJ1svsATQHjjMepHd3h74fexyzigdYUKt2oJ
         tnOwqupfuTWa5U05AN0+LIZy8nNWLzVf1vON/ExlMhv4TxRlM76ra1Tdu6VGkF5zbZhW
         IVOJgDVLr5OD66hrRAnJW1WH5FJQV9iTu1LdlcARjAo3vG88hRpMRz4QQLJQvWvcpIUX
         5af6ZM6HsCxHx6LzPDEpheSNvkIaz3IQHKEJOSDivsQreBqUP2rJbpYKg8h1NwDg7rFX
         3U8hxAA3R0U2SRzoMKDJNZqqh2cfUbtWwxDtAaDWUOjb2DXoiaDS8XQ8irQf+MV06Wiz
         kWNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749143098; x=1749747898;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SbbUkUUtWYP7VuElEDtlyDh5ofC9gH6hUBqQUj6UZLM=;
        b=m7VKksGh1r4KpkQWgkNeFO+e0PLwzDqeGuCq7RcqhcKZ9+Xw5xDwQK+sp71soTBm/p
         u4CJuGVqk4dXEn1fcliRHtRlUaDO9BegUsKWvV8a+csoTCETd0s0GSTTl/7dB9/8TNG0
         HKKMRRu7poDTM3pvZRyCBMvxOs+tuEH1Edh2FP2gl0PlIzJ/cuMWoYRtAe1elbDnvn7/
         NNWuGaWSA3ITby6uJedFef6emgrWGQctrX1PEds4PEAOlAchywC87G7gUpUa8tqJdyAa
         AA/RwoODqwCuoV4Q5QbX4Fko4gqoZlnHz72Jnp+ZInwnB/0QMsS9e6uHEpwXLjkAa5kg
         SdVw==
X-Forwarded-Encrypted: i=1; AJvYcCV4AoYVcXxmdrciI3pQD6Yi1/BwdeSm8+OaILBh08G8adnKQcuUj43HRoI49MTk5LcvvzY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8qOgxg19o/LxmUh9W+KaqxJPGyp8A28/Wrra5Ts+29zVBMgta
	YmLc5rYqjE9M/Rrr7QU1SDi771imVPf4vfLDB1hYQcy5znbeev8t4eWORLX/efKb/Q==
X-Gm-Gg: ASbGncv0hqCix/cbj5znhe/RAxbSu65wj5riwQkiOEw42ALz7dW69S07gIx8MYTW6W5
	GkekyR8KbJlmmEK4OuHZzAdpywRnpUBYAMF+l9ERbj9NOMExSEO0p70+JkEfhSeKP/vHjKQNz4Y
	4Ig/TGTNDqAVyHX6j+QxpCvuBuQfkF14NrEd+77jl0Tsf2jTbFlpHwfhgSwBguZBNpwKsuzhMip
	2GUd4F8LELQgTrTY9Mepb2boViCBHyZa+cSrZsLPZMtQSHB9lkYYTY+OG+uaQFqkc+xcJQQBZGb
	3xgZFCd5FFKuBi6qfgKfX5121g3laEagDhyHM832bYGZtITHfXZeqrckOXiF
X-Google-Smtp-Source: AGHT+IGUk6E7tZs4jvxQ/2qMmPkdZRrWLxZE7gyBNwvHo8bKeonXU/fKOmrVEc9T6w5FAgWfrpOsnw==
X-Received: by 2002:a05:6a00:2e24:b0:740:aa33:c6f8 with SMTP id d2e1a72fcca58-74827e73bb6mr648718b3a.7.1749143097742;
        Thu, 05 Jun 2025 10:04:57 -0700 (PDT)
Received: from thinkpad ([120.60.50.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afed4bafsm13054775b3a.79.2025.06.05.10.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 10:04:57 -0700 (PDT)
Date: Thu, 5 Jun 2025 22:34:50 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: jeff.hugo@oss.qualcomm.com, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, quic_bqiang@quicinc.com, 
	can.guo@oss.qualcomm.com, Mayank Rana <mayank.rana@oss.qualcomm.com>
Subject: Re: [PATCH v2] mhi: host: Add standard elf image download
 functionality
Message-ID: <sdhop6vyvt4y63tbbtorqfd5xa4ckbiwxdad5g6zzwlljqvd6q@eoaqmairdeey>
References: <20250603-standard_elf_image_load_support-v2-1-cce97644e99e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250603-standard_elf_image_load_support-v2-1-cce97644e99e@oss.qualcomm.com>

On Tue, Jun 03, 2025 at 02:05:44AM -0700, Qiang Yu wrote:
> From: Mayank Rana <mayank.rana@oss.qualcomm.com>
> 
> Currently, the FBC image is a non-standard ELF file that contains a single
> ELF header, followed by segments for SBL, RDDM, and AMSS. Some devices are
> unable to process this non-standard ELF format and therefore require
> special handling during image loading.
> 

What are those "some devices"? Why are they not able to process this format
which is used across the rest of the Qcom devices?

> Add standard_elf_image flag to determine whether the device can process
> the non-standard ELF format. If this flag is set, a standard ELF image
> must be loaded, meaning the first 512 KB of the FBC image should be
> skipped when loading the AMSS image over the BHIe interface.

Please explain what is present in the first 512KiB and why skipping that is
required.

> Note that
> this flag does not affect the SBL image download process.
> 
> Signed-off-by: Mayank Rana <mayank.rana@oss.qualcomm.com>
> Co-developed-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---
> Changes in v2:
> - V1 patch is paused because of no user. WLAN team plan to add support for
>   new WLAN chip that requires this patch, so send v2.
> - Change author and SOB with new mail address.
> - Reword commit message.
> - Place standard_elf_image flag after wake_set in struct mhi_controller
> - Link to v1: https://lore.kernel.org/mhi/1689907189-21844-1-git-send-email-quic_qianyu@quicinc.com/
> ---
>  drivers/bus/mhi/host/boot.c | 7 +++++++
>  include/linux/mhi.h         | 4 ++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
> index efa3b6dddf4d2f937535243bd8e8ed32109150a4..f1686a8e0681d49f778838820b44f4c845ddbd1f 100644
> --- a/drivers/bus/mhi/host/boot.c
> +++ b/drivers/bus/mhi/host/boot.c
> @@ -584,6 +584,13 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>  	 * device transitioning into MHI READY state
>  	 */
>  	if (fw_load_type == MHI_FW_LOAD_FBC) {
> +		dev_dbg(dev, "standard_elf_image:%s\n",
> +			(mhi_cntrl->standard_elf_image ? "True" : "False"));

This print is just a noise even for debug.

> +		if (mhi_cntrl->standard_elf_image) {
> +			fw_data += mhi_cntrl->sbl_size;
> +			fw_sz -= mhi_cntrl->sbl_size;

Is it possible to detect the image type during runtime instead of using a flag?
Also, the flag is currently unused. So it should come along an user.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
