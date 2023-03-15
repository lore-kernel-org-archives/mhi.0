Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E81728E2
	for <mhi@lists.linux.dev>; Wed, 15 Mar 2023 08:18:28 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id h8so19188025plf.10
        for <mhi@lists.linux.dev>; Wed, 15 Mar 2023 01:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678868307;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vLfoTlbAo5jcQ6X2/SF0xxvTQO4Wt5qY3k91cC+sQqw=;
        b=B5a0eNeX40LWPowEKVW/CluA5to6/jpRTgi/jhL/2R0tt+l/NxJmJorqsKCvsSXjBY
         OOZW+9YWYzU1Gs+yqeRVpblxh8+13Yfb3NkRdsBGXSS2DBvpfc0+TI0kJG0OcFWRSCFS
         E9ohaHCOyFlNYtygRmShZWEUfO3q0SJGHhkAyelZe6nbkeda5Phlhf6PvTo9unLHv2L0
         zdYKYhCGif0BwYj36Z9r7axxO2gyUkVy13V+8oUUQvgrNiTuOB4h/hg1dIXOCq0jAU1N
         oEF+ueFxH9ZY4CUkEUWIVRrpVtbdbqBgFBDK+T/fDhzKcjJtKH2BwWOaP88tkYrQ8fDE
         q+4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678868307;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vLfoTlbAo5jcQ6X2/SF0xxvTQO4Wt5qY3k91cC+sQqw=;
        b=NH9QSpz5DQKpIBHm5K5hZOL28XKa1WlsWulDMwy12DK7O9ljYL6972HNNKW92iEZAe
         Lbs1saGOFL9OarkmI5Zob6aDxq9jivGZVFQ+xjDko0SRqHF+RNds260m9nQDPxTs03LL
         +hHl2ecoxGXfJQjDKCLqRaS4+QnWu99HJ7q8NueKvh3xj3FgNQf73RVD1Qr4/5yMXVYj
         hn1fLUua49RawXGtcQJRCtkrEckXsTMBiSU5J6uHAk9ARHBMynnHOPe45TWdgvRDG4ko
         ri6D3ntvw9+FoCudQ/iCYbwuKbCoxPvaRJ4tfPRNA6rithoZ4f9sd8lvDmvotjN/v9qW
         ta9g==
X-Gm-Message-State: AO0yUKX6ElVfeBCQSo8LwgCQS/AN8eGi+EzGKQbkE34zCkJOmxBSMgMR
	5q6ObpD+yqr6eMu47T/Orx8+
X-Google-Smtp-Source: AK7set9nq0rU9SIcIZvJnGD3+aES4Bd8l19cmFTdbVWu5f5V8XZe07f2/PJcfSHIS1E+7Gn+w9O1jA==
X-Received: by 2002:a17:90a:cb8e:b0:23d:35cf:44be with SMTP id a14-20020a17090acb8e00b0023d35cf44bemr5027663pju.6.1678868307439;
        Wed, 15 Mar 2023 01:18:27 -0700 (PDT)
Received: from thinkpad ([117.217.182.35])
        by smtp.gmail.com with ESMTPSA id o10-20020a17090a678a00b00230b8402760sm759365pjj.38.2023.03.15.01.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 01:18:26 -0700 (PDT)
Date: Wed, 15 Mar 2023 13:48:20 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: mhi@lists.linux.dev, ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH v2 1/3] mhi: allow MHI client drivers to provide the
 firmware via a pointer
Message-ID: <20230315081820.GD25575@thinkpad>
References: <20230308152522.6728-1-kvalo@kernel.org>
 <20230308152522.6728-2-kvalo@kernel.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230308152522.6728-2-kvalo@kernel.org>

On Wed, Mar 08, 2023 at 05:25:20PM +0200, Kalle Valo wrote:
> From: Kalle Valo <quic_kvalo@quicinc.com>
> 

Subject prefix should be: "bus: mhi: host: ..."

> Currently MHI loads the firmware image from the path provided by client
> devices. ath11k needs to support firmware image embedded along with meta data
> (named as firmware-2.bin). So allow the client driver to request the firmware
> file from user space on it's own and provide the firmware image data and size
> to MHI via a pointer struct mhi_controller::fw_data.
> 
> This is an optional feature, if fw_data is NULL MHI load the firmware using the
> name from struct mhi_controller::fw_image string as before.
> 
> Tested with ath11k and WCN6855 hw2.0.
> 
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
> ---
>  drivers/bus/mhi/host/boot.c | 28 +++++++++++++++++++---------
>  include/linux/mhi.h         |  6 ++++++
>  2 files changed, 25 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
> index 1c69feee1703..5e6e1e340057 100644
> --- a/drivers/bus/mhi/host/boot.c
> +++ b/drivers/bus/mhi/host/boot.c
> @@ -365,12 +365,10 @@ int mhi_alloc_bhie_table(struct mhi_controller *mhi_cntrl,
>  }
>  
>  static void mhi_firmware_copy(struct mhi_controller *mhi_cntrl,
> -			      const struct firmware *firmware,
> +			      const u8 *buf, size_t remainder,
>  			      struct image_info *img_info)
>  {
> -	size_t remainder = firmware->size;
>  	size_t to_cpy;
> -	const u8 *buf = firmware->data;
>  	struct mhi_buf *mhi_buf = img_info->mhi_buf;
>  	struct bhi_vec_entry *bhi_vec = img_info->bhi_vec;
>  
> @@ -392,9 +390,10 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>  	const struct firmware *firmware = NULL;
>  	struct device *dev = &mhi_cntrl->mhi_dev->dev;
>  	const char *fw_name;
> +	const u8 *fw_data;
>  	void *buf;
>  	dma_addr_t dma_addr;
> -	size_t size;
> +	size_t size, fw_sz;
>  	int i, ret;
>  
>  	if (MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state)) {
> @@ -424,6 +423,14 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>  	fw_name = (mhi_cntrl->ee == MHI_EE_EDL) ?
>  		mhi_cntrl->edl_image : mhi_cntrl->fw_image;
>  

Can you please add a comment here?

> +	if (!fw_name && mhi_cntrl->fbc_download &&
> +	    mhi_cntrl->fw_data && mhi_cntrl->fw_sz) {
> +		size = mhi_cntrl->sbl_size;

Don't you need to validate sbl_size?

> +		fw_data = mhi_cntrl->fw_data;
> +		fw_sz = mhi_cntrl->fw_sz;
> +		goto skip_req_fw;
> +	}
> +
>  	if (!fw_name || (mhi_cntrl->fbc_download && (!mhi_cntrl->sbl_size ||
>  						     !mhi_cntrl->seg_len))) {
>  		dev_err(dev,
> @@ -443,6 +450,10 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>  	if (size > firmware->size)
>  		size = firmware->size;
>  
> +	fw_data = firmware->data;
> +	fw_sz = firmware->size;
> +
> +skip_req_fw:
>  	buf = dma_alloc_coherent(mhi_cntrl->cntrl_dev, size, &dma_addr,
>  				 GFP_KERNEL);
>  	if (!buf) {
> @@ -451,7 +462,7 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>  	}
>  
>  	/* Download image using BHI */
> -	memcpy(buf, firmware->data, size);
> +	memcpy(buf, fw_data, size);
>  	ret = mhi_fw_load_bhi(mhi_cntrl, dma_addr, size);
>  	dma_free_coherent(mhi_cntrl->cntrl_dev, size, buf, dma_addr);
>  
> @@ -463,7 +474,7 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>  	}
>  
>  	/* Wait for ready since EDL image was loaded */
> -	if (fw_name == mhi_cntrl->edl_image) {
> +	if (fw_name && fw_name == mhi_cntrl->edl_image) {
>  		release_firmware(firmware);
>  		goto fw_load_ready_state;
>  	}
> @@ -477,15 +488,14 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>  	 * device transitioning into MHI READY state
>  	 */
>  	if (mhi_cntrl->fbc_download) {
> -		ret = mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl->fbc_image,
> -					   firmware->size);
> +		ret = mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl->fbc_image, fw_sz);
>  		if (ret) {
>  			release_firmware(firmware);
>  			goto error_fw_load;
>  		}
>  
>  		/* Load the firmware into BHIE vec table */
> -		mhi_firmware_copy(mhi_cntrl, firmware, mhi_cntrl->fbc_image);
> +		mhi_firmware_copy(mhi_cntrl, fw_data, fw_sz, mhi_cntrl->fbc_image);
>  	}
>  
>  	release_firmware(firmware);
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index a5441ad33c74..72eef7309736 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -299,6 +299,10 @@ struct mhi_controller_config {
>   * @iova_start: IOMMU starting address for data (required)
>   * @iova_stop: IOMMU stop address for data (required)
>   * @fw_image: Firmware image name for normal booting (optional)
> + * @fw_data: Firmware image data content for normal booting, used only
> + *           if fw_image is NULL (optional)
> + * @fw_sz: Firmware image data size for normal booting, used only if fw_image
> + *         is NULL and fbc_download is true (optional)
>   * @edl_image: Firmware image name for emergency download mode (optional)
>   * @rddm_size: RAM dump size that host should allocate for debugging purpose
>   * @sbl_size: SBL image size downloaded through BHIe (optional)
> @@ -384,6 +388,8 @@ struct mhi_controller {
>  	dma_addr_t iova_start;
>  	dma_addr_t iova_stop;
>  	const char *fw_image;
> +	const u8 *fw_data;
> +	size_t fw_sz;

Even though these members are not creating holes now, shuffling the datatypes
will create holes in the future. So I always prefer to keep the struct members
sorted in the below order:

pointer
struct/union
u64
u32
u16
u8
bool

Thanks,
Mani

>  	const char *edl_image;
>  	size_t rddm_size;
>  	size_t sbl_size;
> -- 
> 2.30.2
> 
> 

-- 
மணிவண்ணன் சதாசிவம்
