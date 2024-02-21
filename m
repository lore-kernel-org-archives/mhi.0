Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FC23A1D4
	for <mhi@lists.linux.dev>; Wed, 21 Feb 2024 05:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708494417; cv=none; b=WkF58YoggvDNfFz/Kyy9TE1sF5KPD7qTsT/dlwy/lTTTr/XscbrpH1t9ZwbcBz5ZVozWX45N1DIj/zwpD/XOMRAqboD1mWPrVLd2cLqOWKbu1TiL1Femp30QI4/CFSzR8o3G1n60Fo3e14L2cfSGR9xaS2Nj7pfSoGcWwMZ/nlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708494417; c=relaxed/simple;
	bh=EejifAIIIqlNGTe194ZrNgu7jwOUb/6ws5PuHJXFnDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j49gZXDP8WshNQsyDCx0g7PPoe2PJ5PgXNydesRhAeRWgzlv+8K7D0AFcaJrncMKOgosvIeVr1BGlPQT15CK8EaFvu/WthaZRas0z/0lxdhNCY44FDbeXMkXDGqYD+l+CrS/WUcJdy4o7iFljkWrPs4XqmQm57y/kWSsS9169Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FU+tYUKd; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FU+tYUKd"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3c13410a319so99813b6e.3
        for <mhi@lists.linux.dev>; Tue, 20 Feb 2024 21:46:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708494414; x=1709099214; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hOHufyaUQg7qQ+PlVV++ODz0Os0md+bru9Bl+3Cp+VM=;
        b=FU+tYUKdFnY1IPBerYtQiuWscnVwCiHzPXfVVlqj3k1lpwaiAoLen05aqECX/hYSWr
         1WrzBxe75md+lBJ2DZkmtqPtxOcHp/sY+C9GCEtGARFZmz9QToAUUegnvgGOoHvsWB4J
         JT1yYnr3MtMbgiCHJ8hT7Z1fEtwr/W/jmwKI59HB44wDTUTOO95QYpusy7pkwA59xKeh
         9GIRuC7mPELt1VvH7U6yLC9QX5o5X29VHW4Vywo7xWvFv5c3tyr4eJUQhWcAVEiz2f4v
         Idkec99fGzuBTWftC8MrqnrcDgWhezUngCaRK/6+nWMfa5rI3HFMNoTPqWkBOrQSgQ6P
         xfoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708494414; x=1709099214;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hOHufyaUQg7qQ+PlVV++ODz0Os0md+bru9Bl+3Cp+VM=;
        b=ZM2rAuYxmVYhvPjaVFLMSTrOSgIZmz/kZF5mbMw0PZ03ecfSrgIhk3iMk4DVdgLx8O
         ZA1nl1DyEX1FjtrQdkIT2mg8KLTDXlTJjRUy/DFxJxw4E7xQCXUezCz5+5iAnMYzv+1K
         uph4hhooFtsQKNxRjx4VVB5xzuE6HCXfCHvpZ2LNghpKAMQX8CKC/FY/f63g64ghysM0
         PlsQdTzua3GjL8IfE3V63hGwtvKcIOWEdgEB4q/ZCmEhhWaXSp9Myeyq37wHES+ITNSX
         uq6OHVaHFjhUJc6HhvwcpU4k66BtsI2X1WdYWn5wJFSq9n7MeKYdr+xGKJZT09ddOVqr
         1l3A==
X-Gm-Message-State: AOJu0Yxovu1DghvN5/D3piBTZOWG2ggQVMCVxKCfeoqe9KhND4f+7n0Y
	MWV4q/T+BtqyKkX/aidgUBYb4aDOQCL/n50jrgKMwtffFbQ3fzcSfwjVs+RMbg==
X-Google-Smtp-Source: AGHT+IEtzxtZGC9mTzPgKJvrxQsLwBKQDo/HWMA8YLvnxJue2+Wz88g07Itfl/gdFlMl2lPsEib/Rw==
X-Received: by 2002:a05:6808:1907:b0:3c0:408f:2098 with SMTP id bf7-20020a056808190700b003c0408f2098mr24972063oib.24.1708494414424;
        Tue, 20 Feb 2024 21:46:54 -0800 (PST)
Received: from thinkpad ([117.207.28.224])
        by smtp.gmail.com with ESMTPSA id x16-20020aa79a50000000b006e471ade144sm3731002pfj.188.2024.02.20.21.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 21:46:54 -0800 (PST)
Date: Wed, 21 Feb 2024 11:16:48 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Revert "bus: mhi: core: Add support for reading MHI info
 from device"
Message-ID: <20240221054648.GD11693@thinkpad>
References: <20240219180748.1591527-1-quic_jhugo@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240219180748.1591527-1-quic_jhugo@quicinc.com>

On Mon, Feb 19, 2024 at 11:07:48AM -0700, Jeffrey Hugo wrote:
> This reverts commit 3316ab2b45f6bf4797d8d65b22fda3cc13318890.
> 
> The MHI spec owner pointed out that the SOC_HW_VERSION register is part
> of the BHIe segment, and only valid on devices which implement BHIe.
> Only a small subset of MHI devices implement BHIe so blindly accessing
> the register for all devices is not correct. Also, since the BHIe
> segment offset is not used when accessing the register, any
> implementation which moves the BHIe segment will result in accessing
> some other register.  We've seen that accessing this register on AIC100
> which does not support BHIe can result in initialization failures.
> 
> We could try to put checks into the code to address these issues, but in
> the roughly 4 years this functionality has existed, no one has used it.
> Easier to drop this dead code and address the issues if anyone comes up
> with a real world use for it.
> 
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/bus/mhi/host/init.c     | 12 ------------
>  drivers/bus/mhi/host/internal.h |  6 ------
>  include/linux/mhi.h             | 17 -----------------
>  3 files changed, 35 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
> index 944da46e6f11..44f934981de8 100644
> --- a/drivers/bus/mhi/host/init.c
> +++ b/drivers/bus/mhi/host/init.c
> @@ -914,7 +914,6 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
>  	struct mhi_chan *mhi_chan;
>  	struct mhi_cmd *mhi_cmd;
>  	struct mhi_device *mhi_dev;
> -	u32 soc_info;
>  	int ret, i;
>  
>  	if (!mhi_cntrl || !mhi_cntrl->cntrl_dev || !mhi_cntrl->regs ||
> @@ -989,17 +988,6 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
>  		mhi_cntrl->unmap_single = mhi_unmap_single_no_bb;
>  	}
>  
> -	/* Read the MHI device info */
> -	ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->regs,
> -			   SOC_HW_VERSION_OFFS, &soc_info);
> -	if (ret)
> -		goto err_destroy_wq;
> -
> -	mhi_cntrl->family_number = FIELD_GET(SOC_HW_VERSION_FAM_NUM_BMSK, soc_info);
> -	mhi_cntrl->device_number = FIELD_GET(SOC_HW_VERSION_DEV_NUM_BMSK, soc_info);
> -	mhi_cntrl->major_version = FIELD_GET(SOC_HW_VERSION_MAJOR_VER_BMSK, soc_info);
> -	mhi_cntrl->minor_version = FIELD_GET(SOC_HW_VERSION_MINOR_VER_BMSK, soc_info);
> -
>  	mhi_cntrl->index = ida_alloc(&mhi_controller_ida, GFP_KERNEL);
>  	if (mhi_cntrl->index < 0) {
>  		ret = mhi_cntrl->index;
> diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
> index 091244cf17c6..5fe49311b8eb 100644
> --- a/drivers/bus/mhi/host/internal.h
> +++ b/drivers/bus/mhi/host/internal.h
> @@ -15,12 +15,6 @@ extern struct bus_type mhi_bus_type;
>  #define MHI_SOC_RESET_REQ_OFFSET			0xb0
>  #define MHI_SOC_RESET_REQ				BIT(0)
>  
> -#define SOC_HW_VERSION_OFFS				0x224
> -#define SOC_HW_VERSION_FAM_NUM_BMSK			GENMASK(31, 28)
> -#define SOC_HW_VERSION_DEV_NUM_BMSK			GENMASK(27, 16)
> -#define SOC_HW_VERSION_MAJOR_VER_BMSK			GENMASK(15, 8)
> -#define SOC_HW_VERSION_MINOR_VER_BMSK			GENMASK(7, 0)
> -
>  struct mhi_ctxt {
>  	struct mhi_event_ctxt *er_ctxt;
>  	struct mhi_chan_ctxt *chan_ctxt;
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index 474d32cb0520..77b8c0a26674 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -320,10 +320,6 @@ struct mhi_controller_config {
>   * @hw_ev_rings: Number of hardware event rings
>   * @sw_ev_rings: Number of software event rings
>   * @nr_irqs: Number of IRQ allocated by bus master (required)
> - * @family_number: MHI controller family number
> - * @device_number: MHI controller device number
> - * @major_version: MHI controller major revision number
> - * @minor_version: MHI controller minor revision number
>   * @serial_number: MHI controller serial number obtained from BHI
>   * @mhi_event: MHI event ring configurations table
>   * @mhi_cmd: MHI command ring configurations table
> @@ -368,15 +364,6 @@ struct mhi_controller_config {
>   * Fields marked as (required) need to be populated by the controller driver
>   * before calling mhi_register_controller(). For the fields marked as (optional)
>   * they can be populated depending on the usecase.
> - *
> - * The following fields are present for the purpose of implementing any device
> - * specific quirks or customizations for specific MHI revisions used in device
> - * by the controller drivers. The MHI stack will just populate these fields
> - * during mhi_register_controller():
> - *  family_number
> - *  device_number
> - *  major_version
> - *  minor_version
>   */
>  struct mhi_controller {
>  	struct device *cntrl_dev;
> @@ -407,10 +394,6 @@ struct mhi_controller {
>  	u32 hw_ev_rings;
>  	u32 sw_ev_rings;
>  	u32 nr_irqs;
> -	u32 family_number;
> -	u32 device_number;
> -	u32 major_version;
> -	u32 minor_version;
>  	u32 serial_number;
>  
>  	struct mhi_event *mhi_event;
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்
