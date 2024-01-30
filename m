Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81EE31272DA
	for <mhi@lists.linux.dev>; Tue, 30 Jan 2024 18:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706638786; cv=none; b=Hfw47sF5OoDLgL0NTjrjN2rYpaFyyvq303OKhswER9bNProLSZHGS1ObO76ORgcSi3xkw9xK1l+lreO8BC9i9HdQ8Fui2IXpcoP+gWukRlEQM2gT51Dgemv2YHly7Xt/ZdXN3/9yPrAiJVtjYpGt5l+XnQIvlr4o2GJJDm5V43E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706638786; c=relaxed/simple;
	bh=cdOih/wU/pXVY+QsZtco3oT5nc7lz0kEKPuFmKVvi2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JQR5boMJSr09G5nhf0YhHQAad2n6UIUHXOKGiWHzDL+q2ae48qyS687oAZt7jJGaKz4OSxxqbD54ou9mUSFqxI9r/aC9wN51FchwJP/87XAo7X9BCQFZ8rDiL0ighUt8geEPmQp8HtL0JNR+X7VakFlqSaXjAfZxNBBVFZNLCXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E3jAlhS7; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E3jAlhS7"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-29041f26e28so2083234a91.0
        for <mhi@lists.linux.dev>; Tue, 30 Jan 2024 10:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706638784; x=1707243584; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ls3Uxxmz3c0sy8qMsZbIkIULGPjOGrI0Jt4YUuIFoRc=;
        b=E3jAlhS742NlEsVMVKqJp7QhfOogX1R9JeeLdPi4lxpro8TMtfi1H9LbcfRyt4dLyi
         VnuG3KXh6t9fUj779XiEEjIa3Ahwj4wyQcrdjrwyX/h1qijDMIlt6DVo7fAx8YLdqj5g
         beUOMqUEJNkrjzxxidD1ai75Gb+uERNEO01DgWMSxplJg2vGfqguFzWVftBJfPju7+le
         /aOSMWkIwxglgVuaUJm0vCGLi+rBI4RZKe50tkPyS6o8LmVh7tXs+cx9DLOW588uPi4i
         BBbUz+1RgOrlFdVQhKumGw3pdhbCNiYiCxLofpzxCvgCht0kE4Ycui8WlU8sYwcJdXWx
         zU1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706638784; x=1707243584;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ls3Uxxmz3c0sy8qMsZbIkIULGPjOGrI0Jt4YUuIFoRc=;
        b=XNnfdz0/XvKDrzcC0ADNF5DRx2hTPxtdenbmp4uMI7WDBi24UeQHzE8h0gERFSCZr/
         WWMAvX+ZAOBY2FYrTERhrhCM0+haQMimj0y4TSSmE8U5MovxQEs3NRMwmBAMkuS+4q3g
         ce7gy+kp+9nOwrgxQwT/gwnz+FiQmQbZ8Ws8fRzGz5nP8MjGtTv4E3J06xvHgZrOJ1bF
         9r49RP067lEE+G9FXYQTOr1CdUx9m4ZZdjhGKnrPjxuubTWsRR9PZXZdMlPCTV1n7H6J
         Ae/OHybiWWYMbxy0vkFqit/mfCL/fapxl5nH/73H0CepqZ/if1Jbs8F3jzvRTdgNzY6p
         9BDA==
X-Gm-Message-State: AOJu0YyGB/YonvjGWl3sJR9nPmlgwo4P7bSY7zc9eUOaD6Zd/ctDi2aU
	HAI8Ng06z2a8IBjeK6JaSE8Zq5ePwJ2s/lWl116i+L7cXoCl8/5H+U3O2RW6DA==
X-Google-Smtp-Source: AGHT+IHPCu9lOnMlNxGLncAZdAs1JmBBA5bFyb0DGbrnwdgYHqOhB65j9rmpGNCxIyUIwU86J74MtA==
X-Received: by 2002:a05:6a20:9c8e:b0:19c:9fe9:d6b6 with SMTP id mj14-20020a056a209c8e00b0019c9fe9d6b6mr5409977pzb.46.1706638783739;
        Tue, 30 Jan 2024 10:19:43 -0800 (PST)
Received: from thinkpad ([103.28.246.123])
        by smtp.gmail.com with ESMTPSA id s10-20020a63e80a000000b005cf5bf78b74sm8464001pgh.17.2024.01.30.10.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 10:19:42 -0800 (PST)
Date: Tue, 30 Jan 2024 23:49:38 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: mhi@lists.linux.dev, ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH RFC v2 2/8] bus: mhi: host: add new interfaces to handle
 MHI channels directly
Message-ID: <20240130181938.GB4218@thinkpad>
References: <20231127162022.518834-1-kvalo@kernel.org>
 <20231127162022.518834-3-kvalo@kernel.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231127162022.518834-3-kvalo@kernel.org>

On Mon, Nov 27, 2023 at 06:20:16PM +0200, Kalle Valo wrote:
> From: Baochen Qiang <quic_bqiang@quicinc.com>
> 
> When using mhi_power_down_no_destroy() MHI hosts need to unprepare MHI channels
> by themselves.  Similarly, MHI stack will also not create new MHI device since
> old devices were not destroyed, so MHI hosts need to prepare channels as well.
> Hence add these two interfaces to make that possible.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
> ---
>  drivers/bus/mhi/host/main.c | 107 ++++++++++++++++++++++++++++++++++++
>  include/linux/mhi.h         |  20 ++++++-
>  2 files changed, 126 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
> index d80975f4bba8..3f677fc628ad 100644
> --- a/drivers/bus/mhi/host/main.c
> +++ b/drivers/bus/mhi/host/main.c
> @@ -1669,6 +1669,58 @@ int mhi_prepare_for_transfer_autoqueue(struct mhi_device *mhi_dev)
>  }
>  EXPORT_SYMBOL_GPL(mhi_prepare_for_transfer_autoqueue);
>  
> +static int ____mhi_prepare_for_transfer(struct device *dev, void *data)

"__mhi_prepare_all_for_transfer"

> +{
> +	struct mhi_device *mhi_dev;
> +	struct mhi_chan *ul_chan, *dl_chan;
> +	enum mhi_ee_type ee = MHI_EE_MAX;

Reverse Xmas order, please.

> +
> +	if (dev->bus != &mhi_bus_type)
> +		return 0;
> +
> +	mhi_dev = to_mhi_device(dev);
> +
> +	/* Only prepare virtual devices that are attached to bus */

"Only prepare virtual devices for the channels". Here and below.

> +	if (mhi_dev->dev_type == MHI_DEVICE_CONTROLLER)
> +		return 0;
> +
> +	/* There are cases where there is no MHI client driver matches
> +	 * this device, we are not allowed to do prepare for it.
> +	 */

Use the preferred style for comment:

	/*
	 * ...
	 */

> +	if (!mhi_dev->id)
> +		return 0;
> +
> +	ul_chan = mhi_dev->ul_chan;
> +	dl_chan = mhi_dev->dl_chan;
> +
> +	/*
> +	 * If execution environment is specified, remove only those devices that
> +	 * started in them based on ee_mask for the channels as we move on to a
> +	 * different execution environment
> +	 */
> +	if (data)
> +		ee = *(enum mhi_ee_type *)data;
> +
> +	if (ul_chan && ee != MHI_EE_MAX && !(ul_chan->ee_mask & BIT(ee)))
> +		return 0;
> +
> +

Remove extra newline.

> +	if (dl_chan && ee != MHI_EE_MAX && !(dl_chan->ee_mask & BIT(ee)))
> +		return 0;
> +
> +	if (dl_chan->pre_alloc)
> +		return mhi_prepare_for_transfer_autoqueue(mhi_dev);
> +	else
> +		return mhi_prepare_for_transfer(mhi_dev);
> +}
> +
> +int mhi_prepare_all_for_transfer(struct mhi_controller *mhi_cntrl)
> +{
> +	return device_for_each_child(&mhi_cntrl->mhi_dev->dev, NULL,
> +				     ____mhi_prepare_for_transfer);
> +}
> +EXPORT_SYMBOL_GPL(mhi_prepare_all_for_transfer);
> +
>  void mhi_unprepare_from_transfer(struct mhi_device *mhi_dev)
>  {
>  	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
> @@ -1684,3 +1736,58 @@ void mhi_unprepare_from_transfer(struct mhi_device *mhi_dev)
>  	}
>  }
>  EXPORT_SYMBOL_GPL(mhi_unprepare_from_transfer);
> +
> +static int ____mhi_unprepare_from_transfer(struct device *dev, void *data)

__mhi_unprepare_all_from_transfer

> +{
> +	struct mhi_device *mhi_dev;
> +	struct mhi_chan *ul_chan, *dl_chan;
> +	enum mhi_ee_type ee = MHI_EE_MAX;
> +
> +	if (dev->bus != &mhi_bus_type)
> +		return 0;
> +
> +	mhi_dev = to_mhi_device(dev);
> +
> +	/* Only unprepare virtual devices that are attached to bus */
> +	if (mhi_dev->dev_type == MHI_DEVICE_CONTROLLER)
> +		return 0;
> +
> +	/* There are cases where there is no MHI client driver matches
> +	 * this device, so it is not probed or prepared, no need to
> +	 * do unprepare for it.
> +	 */
> +	if (!mhi_dev->id)
> +		return 0;
> +
> +	ul_chan = mhi_dev->ul_chan;
> +	dl_chan = mhi_dev->dl_chan;
> +
> +	/*
> +	 * If execution environment is specified, remove only those devices that
> +	 * started in them based on ee_mask for the channels as we move on to a
> +	 * different execution environment
> +	 */
> +	if (data)
> +		ee = *(enum mhi_ee_type *)data;
> +
> +	if (ul_chan) {
> +		if (ee != MHI_EE_MAX && !(ul_chan->ee_mask & BIT(ee)))
> +			return 0;
> +	}
> +
> +	if (dl_chan) {
> +		if (ee != MHI_EE_MAX && !(dl_chan->ee_mask & BIT(ee)))
> +			return 0;
> +	}
> +
> +	mhi_unprepare_from_transfer(mhi_dev);
> +
> +	return 0;
> +}
> +
> +int mhi_unprepare_all_from_transfer(struct mhi_controller *mhi_cntrl)
> +{
> +	return device_for_each_child(&mhi_cntrl->mhi_dev->dev, NULL,
> +				     ____mhi_unprepare_from_transfer);
> +}
> +EXPORT_SYMBOL_GPL(mhi_unprepare_all_from_transfer);
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index ae092bc8b97e..dcf62a57056a 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -668,7 +668,7 @@ static inline void mhi_power_down(struct mhi_controller *mhi_cntrl, bool gracefu
>   * destroy struct devices. This is a variant for mhi_power_down() and is a
>   * workaround to make it possible to use mhi_power_up() in a resume
>   * handler. When using this variant the caller must also call
> - * mhi_prepare_all_for_transfer_autoqueue() and
> + * mhi_prepare_all_for_transfer() and

This change belongs to previous patch.

>   * mhi_unprepare_all_from_transfer().
>   *
>   * @mhi_cntrl: MHI controller
> @@ -842,4 +842,22 @@ int mhi_queue_skb(struct mhi_device *mhi_dev, enum dma_data_direction dir,
>   */
>  bool mhi_queue_is_full(struct mhi_device *mhi_dev, enum dma_data_direction dir);
>  
> +/**
> + * mhi_prepare_all_for_transfer - if you are using
> + * mhi_power_down_no_destroy() variant this needs to be called after
> + * calling mhi_power_up().

Add info about what this API does also.

> + *
> + * @mhi_cntrl: MHI controller
> + */
> +int mhi_prepare_all_for_transfer(struct mhi_controller *mhi_cntrl);
> +
> +/**
> + * mhi_unprepare_all_from_transfer - if you are using
> + * mhi_power_down_no_destroy() variant this function needs to be called
> + * before calling mhi_power_down_no_destroy().

Same as above.

- Mani

> + *
> + * @mhi_cntrl: MHI controller
> + */
> +int mhi_unprepare_all_from_transfer(struct mhi_controller *mhi_cntrl);
> +
>  #endif /* _MHI_H_ */
> -- 
> 2.39.2
> 
> 

-- 
மணிவண்ணன் சதாசிவம்
