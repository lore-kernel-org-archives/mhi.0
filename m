Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21BDD156653
	for <mhi@lists.linux.dev>; Wed,  8 Jan 2025 05:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736313866; cv=none; b=LRuLz4pMtL6VYg1Ile/UthEOtgvdCBi+Y/JR9gn+roacRm+SfDFofnyJqcUOP0OT/vtF6UPKsidht1BQrqsUgX3f5B6lJg0h3xpaD46nb0cWuEc4Eoc4Lr2wjaWFnpDiiwIQRt6dnQahYQ/PZR5DqAYPLvjO7WSm4KGuZy9Ji3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736313866; c=relaxed/simple;
	bh=T3XUWs5B2XgRnR4N9N20WoY0iCbEWAwD7wx377rIgHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O5xnhIQHstVERzVlE7e1Kjzy6VVxo4aJYT8J2wqObicwWYNquEZKPN/h50s6raH3KgNRxzzz3KNSbdAYikGtoFH1ub1VMXXuQ5x+bAnp3Rp3NarxUjpjHmz8cl4vPN4LyCUky0EBv+2S1U6/l8Z9jyqyQZaJ9mTmU7MfgW5qvjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=erh6NPlv; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="erh6NPlv"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2ef87d24c2dso19460871a91.1
        for <mhi@lists.linux.dev>; Tue, 07 Jan 2025 21:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736313864; x=1736918664; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QD6L0ujpzaRC/L59NoO6Z/+6+/oZeKQ9pKbwkOhBz1U=;
        b=erh6NPlvbPtrfD6xRI1gGjRfGczlWTQVoryLg1ZdHaRGp9YY9+dx5zgPiMk9wkDsG1
         rIw4eXDK1qQuSap5qO2I18svHmutm30pFIa/jS1pXPNRL/lWyhRsgYWtiQHeOoSFvheL
         Y3mr39gnD6yRQF2e0eFkfK2g9P3oRmJL1Zf+ynsNdJOw55+TJJxY6NzXy7YEEG5sCfEE
         nMrD4nGGMmoKE80RERqu895yYHy2757kK6VtpQdmMeBP4uEl9Ubxi7QdK5uoIIyCHgAC
         FcYXUoHEFh83oixXSu5tx0aCq6gKduDCA8zZP/jTyqXJlJfMlprpvEG6HqYjq+2Fau1W
         6Omg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736313864; x=1736918664;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QD6L0ujpzaRC/L59NoO6Z/+6+/oZeKQ9pKbwkOhBz1U=;
        b=X1iaPmAItkPimmsavdNEka1ezMo4bZOba8XlS1UrfSVbenpY5/KyDD3P0OG0n1Ct8R
         CX/qa5PPsHGi2AVdgfw1Jdq+R1sMNoF0cOfW3aJ8EnOvHKIz0sQ7/tOBHp8GztmM6ATl
         lgt3mxIuL2RFfCTohcZuX1pagv39WILQKgqS2j/KUfjkG/2Fs2yJQNY1EQqZ6cavzIgL
         DEUP/QIwmWJe+S3eyOn257+SP+OU9R5mqUvZS3kkkhpbjxO5IxSItQls5ZSgoeJY5HS9
         tMWgzIo6/N/pVpsjsYEKgMjTZMNvEiZozYDzkFQRGcfw7bj5qdzNpnsjWiaWaIGyDuTz
         9j5g==
X-Forwarded-Encrypted: i=1; AJvYcCUwwh7nD1Hb/R3yvUojrnpkFvAwPjNJKrGNxXWSBhJ8gsRPcSjUbTmM+ILT4N5O2mK8Lig=@lists.linux.dev
X-Gm-Message-State: AOJu0YzK91NO11ONiMDq8YtQ1hPa7Zamp+cP612A2tKKOjYOFKNC8e9w
	1esdQyMEtq9iK7YMH6Q8GImc1XlJzFanLZpDL+648TbwoVJuS/5OyFKLqdIVpw==
X-Gm-Gg: ASbGncsgZFpOj3NaZtlTxfREv2ZkcrrWokn+pqUkKAMIaCNVsN8HWpUYlAlgIzDVsh+
	gTPRONhr0Bg41kuyJEtg/WVmCcaUX5HxP4nSArKqEwncchggO/dM3y8ZDpmyJLHfCx02gtWCXLX
	NDd+1DKUKiqY5gR4WPQyCQ9yr7cf3k/yULDqxof9S7Gfw7pxqva4gVGbjGdDMYA4iw3D7S8juMR
	W6fFuhFhnWIlHmk3iBFsy3Z0rOkZ30La9N6MQfrMf9eKPCKu57PDuI2HLpshHTCwm4K
X-Google-Smtp-Source: AGHT+IFeyo2aY47f/bHnipeLkhHuGpmxHpg269EGkKbkJq3egoRjBog7l1tF3IalKZ3HcujkOf6x+Q==
X-Received: by 2002:a17:90b:2cc7:b0:2ee:5edc:4b2 with SMTP id 98e67ed59e1d1-2f548f6a952mr2289084a91.20.1736313864340;
        Tue, 07 Jan 2025 21:24:24 -0800 (PST)
Received: from thinkpad ([117.213.100.67])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f5195sm317147125ad.194.2025.01.07.21.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 21:24:23 -0800 (PST)
Date: Wed, 8 Jan 2025 10:54:16 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: quic_carlv@quicinc.com, quic_yabdulra@quicinc.com,
	quic_mattleun@quicinc.com, quic_thanson@quicinc.com,
	ogabbay@kernel.org, lizhi.hou@amd.com,
	jacek.lawrynowicz@linux.intel.com, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, mhi@lists.linux.dev
Subject: Re: [PATCH 1/7] bus: mhi: host: Refactor BHI/BHIe based firmware
 loading
Message-ID: <20250108052416.cqfoxzvw42me2kub@thinkpad>
References: <20241213213340.2551697-1-quic_jhugo@quicinc.com>
 <20241213213340.2551697-2-quic_jhugo@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241213213340.2551697-2-quic_jhugo@quicinc.com>

On Fri, Dec 13, 2024 at 02:33:34PM -0700, Jeffrey Hugo wrote:
> From: Matthew Leung <quic_mattleun@quicinc.com>
> 
> Refactor the firmware loading code to have distinct helper functions for
> BHI and BHIe operations. This lays the foundation for separating the
> firmware loading protocol from the firmware being loaded and the EE it
> is loaded in.
> 
> Signed-off-by: Matthew Leung <quic_mattleun@quicinc.com>
> Reviewed-by: Youssef Samir <quic_yabdulra@quicinc.com>
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> ---
>  drivers/bus/mhi/host/boot.c | 155 +++++++++++++++++++++++++-----------
>  1 file changed, 110 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
> index e8c92972f9df..e3f3c07166ad 100644
> --- a/drivers/bus/mhi/host/boot.c
> +++ b/drivers/bus/mhi/host/boot.c
> @@ -177,6 +177,37 @@ int mhi_download_rddm_image(struct mhi_controller *mhi_cntrl, bool in_panic)
>  }
>  EXPORT_SYMBOL_GPL(mhi_download_rddm_image);
>  
> +static inline void mhi_fw_load_error_dump(struct mhi_controller *mhi_cntrl)

No need to add 'inline' keyword in c files. You can trust the compiler.

> +{
> +	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> +	rwlock_t *pm_lock = &mhi_cntrl->pm_lock;
> +	void __iomem *base = mhi_cntrl->bhi;
> +	int ret;
> +	u32 val;
> +	int i;

int ret, i?

> +	struct {
> +		char *name;
> +		u32 offset;
> +	} error_reg[] = {
> +		{ "ERROR_CODE", BHI_ERRCODE },
> +		{ "ERROR_DBG1", BHI_ERRDBG1 },
> +		{ "ERROR_DBG2", BHI_ERRDBG2 },
> +		{ "ERROR_DBG3", BHI_ERRDBG3 },
> +		{ NULL },
> +	};
> +
> +	read_lock_bh(pm_lock);
> +	if (MHI_REG_ACCESS_VALID(mhi_cntrl->pm_state)) {
> +		for (i = 0; error_reg[i].name; i++) {
> +			ret = mhi_read_reg(mhi_cntrl, base, error_reg[i].offset, &val);
> +			if (ret)
> +				break;
> +			dev_err(dev, "Reg: %s value: 0x%x\n", error_reg[i].name, val);
> +		}
> +	}
> +	read_unlock_bh(pm_lock);
> +}
> +

[...]

> +static int mhi_alloc_bhi_buffer(struct mhi_controller *mhi_cntrl,
> +				struct image_info **image_info,
> +				size_t alloc_size)
> +{
> +	struct image_info *img_info;
> +	struct mhi_buf *mhi_buf;
> +	int segments = 1;
> +
> +	img_info = kzalloc(sizeof(*img_info), GFP_KERNEL);
> +	if (!img_info)
> +		return -ENOMEM;
> +
> +	/* Allocate memory for entry */
> +	img_info->mhi_buf = kcalloc(segments, sizeof(*img_info->mhi_buf),
> +				    GFP_KERNEL);

Why do you need kcalloc for only 1 segment?

> +	if (!img_info->mhi_buf)
> +		goto error_alloc_mhi_buf;
> +
> +	/* Allocate and populate vector table */
> +	mhi_buf = img_info->mhi_buf;
> +
> +	mhi_buf->len = alloc_size;
> +	mhi_buf->buf = dma_alloc_coherent(mhi_cntrl->cntrl_dev, mhi_buf->len,
> +					  &mhi_buf->dma_addr, GFP_KERNEL);
> +	if (!mhi_buf->buf)
> +		goto error_alloc_segment;
> +
> +	img_info->bhi_vec = NULL;
> +	img_info->entries = segments;
> +	*image_info = img_info;
> +
> +	return 0;
> +
> +error_alloc_segment:
> +	kfree(mhi_buf);
> +error_alloc_mhi_buf:
> +	kfree(img_info);
> +
> +	return -ENOMEM;
> +}
> +
>  int mhi_alloc_bhie_table(struct mhi_controller *mhi_cntrl,
>  			 struct image_info **image_info,
>  			 size_t alloc_size)
> @@ -364,9 +422,18 @@ int mhi_alloc_bhie_table(struct mhi_controller *mhi_cntrl,
>  	return -ENOMEM;
>  }
>  
> -static void mhi_firmware_copy(struct mhi_controller *mhi_cntrl,
> -			      const u8 *buf, size_t remainder,
> -			      struct image_info *img_info)
> +static void mhi_firmware_copy_bhi(struct mhi_controller *mhi_cntrl,
> +				  const u8 *buf, size_t size,
> +				  struct image_info *img_info)
> +{
> +	struct mhi_buf *mhi_buf = img_info->mhi_buf;
> +
> +	memcpy(mhi_buf->buf, buf, size);
> +}
> +
> +static void mhi_firmware_copy_bhie(struct mhi_controller *mhi_cntrl,
> +				   const u8 *buf, size_t remainder,
> +				   struct image_info *img_info)
>  {
>  	size_t to_cpy;
>  	struct mhi_buf *mhi_buf = img_info->mhi_buf;
> @@ -390,10 +457,9 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>  	const struct firmware *firmware = NULL;
>  	struct device *dev = &mhi_cntrl->mhi_dev->dev;
>  	enum mhi_pm_state new_state;
> +	struct image_info *image;
>  	const char *fw_name;
>  	const u8 *fw_data;
> -	void *buf;
> -	dma_addr_t dma_addr;
>  	size_t size, fw_sz;
>  	int ret;
>  
> @@ -452,17 +518,16 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>  	fw_sz = firmware->size;
>  
>  skip_req_fw:
> -	buf = dma_alloc_coherent(mhi_cntrl->cntrl_dev, size, &dma_addr,
> -				 GFP_KERNEL);
> -	if (!buf) {
> +	ret = mhi_alloc_bhi_buffer(mhi_cntrl, &image, size);
> +	if (ret) {
>  		release_firmware(firmware);
>  		goto error_fw_load;
>  	}
> +	mhi_firmware_copy_bhi(mhi_cntrl, fw_data, size, image);

Why can't you directly use memcpy here? I know what you want to keep symmetry
with mhi_firmware_copy_bhie(), but it seems unnecessary to me.

Adding a comment like "Load the firmware into BHI vec table" is enough.

- Mani


-- 
மணிவண்ணன் சதாசிவம்
