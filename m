Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A582CAB
	for <mhi@lists.linux.dev>; Tue, 21 Jan 2025 04:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737435289; cv=none; b=kMZQql4JNjHuffZukSIKA59S0mCVescGxeeyA9zevwX7kX5QbIAC1GvlkXRXM/oJu8M+jKY4bDoqSTrf/TkWo06Si9QncyLFQNcT0hQkVpNr18uzm5REmbf2Zea9LMheoRn9L0heXsDEUFN+ULhLtF3XUkUuR25did9cj1V6Oco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737435289; c=relaxed/simple;
	bh=i/j0XrlJS7AjxwkZeapMDHhobTyZyFBbKWaqT2kyjM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ekAxn2DAxI/Z5BHoxpO+tTxtcZ99GEt2DRHyVpOIKjSfyxs28eOWy7mrMoRmsOE3PurMHRrT6qzf/ptijqBBr4YafWpZzBTxSk3fpI4T4S7RB75b/V2uySvLQuVnqJvrOELO/v5k0g2Y3mZYAuyEadLSeuu7fAdZxT+2xBeGvok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FFRXyD9z; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FFRXyD9z"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2eed82ca5b4so8884743a91.2
        for <mhi@lists.linux.dev>; Mon, 20 Jan 2025 20:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737435287; x=1738040087; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VBH9834RN47Bq9S9SwBP5IhyNvK6QPWQqQCpbU4OxwM=;
        b=FFRXyD9zFo+KtgK3OyT8EIdS1btI7IlcJGoOiQVMYYClRzUXcuzEdGHrQSLdN18lNU
         /LHdEXJgf2XTJOVXoVguev4ZcMJTZ1y4qZxDCewtbDPjBbGvnqgAebmoI1/s5dn3lr6a
         HAAU6zuPwDYdTEPT94qayzKvxrGSy5XAIHLdIXKnJjKm1XCDDzh96xgGRS+IsbBVc565
         YlWrrz51VDGdO+KdWc5ODRentK+1zfuW1fDIYNT/+mLZ4WneW1xzIbPc1c4LDH4UIqOH
         9HKidfGo28EUVEFWFiAwF15/LS/nh9u+/4m//0PfBHiL/4SURoRu0aEWNLj85oV7BOpU
         VVdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737435287; x=1738040087;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VBH9834RN47Bq9S9SwBP5IhyNvK6QPWQqQCpbU4OxwM=;
        b=wSZ5Ss10SVpiHt4rWCZw80kjNfxggikip3Dgf7xGp7SfC0wna4PxBK/sVma3Le5X2y
         GInueM/CfDeg+P0Gh4/3xBPUWKb1+PMfUVo+yIT23ZjKYdhBcQUPBUR528guJgqS/Ev5
         oaInr2K9ovSYiGPfY2utehWKbUU6xDrD9yiU32P6y8xOYLSvGMVJwaS7UToCgkxnF5VR
         t+r16bjVzmVPzcbWZqkUN8bdpoQI2upU1DaJImTwdY+tZVcEzk3lBjT4pPQYusRkI85D
         qJs9QSUqGaXYF8YUpHIOJQD6wexlPUdQjbWBNs+R/VNUHl8DQr8cVt98u/7w5hrqijao
         xeJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWez8DJTbWxWNP6/VllFHpvqf7+xfKjylFHtYhuuFIq1un/ELfYQKjaHzsj2nKvnqPBKU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxGW8kUWjqXQuaxK2vmoEc3q+iN384dSpOQqiNysTZl4Q87Eo9x
	qykaK4tOgHn8YUKgpmKUE6fq1UomhXT1d0DjmR/aISckaPB3XKmW0tWWXA+d4w==
X-Gm-Gg: ASbGnctiFMLAIylQsfnugUyzDC8khitjoBLujtU2beQyc1b9tEbG6eWFwPvEl88CdFs
	WJA8XOPs8m21ba6MNquIU9D8v1GGvDzmRwS8I+gn5R9Gyc5lOJ/Kk2a+D/hdkysA3kweZXaJVxz
	M84riffOfWKsbLElVbxdXTfrWEaRML5RVNLxezyMBrarp8yXeB7aWA119saMEPzhcmpZubCIMFH
	RlHvurcPwPmWhaNOB9UqkFkbhsgVw0JZIH2/C8H9RylrXdKY38qNWuGRNNWP4yJoS1TYLw8mP2K
	CvVuUHk=
X-Google-Smtp-Source: AGHT+IFnlPleuzWBFHah/aSvvGeXWlFEbI6Y7OXKasiHzfXSeHwzASaQloX5bR0dSIgLZ53KYGnZ/g==
X-Received: by 2002:a05:6a00:2d19:b0:72a:8bb6:2963 with SMTP id d2e1a72fcca58-72dafa44141mr22175720b3a.13.1737435286796;
        Mon, 20 Jan 2025 20:54:46 -0800 (PST)
Received: from thinkpad ([117.213.102.234])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a9bdd30d03fsm7885724a12.54.2025.01.20.20.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 20:54:46 -0800 (PST)
Date: Tue, 21 Jan 2025 10:24:39 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: quic_carlv@quicinc.com, quic_yabdulra@quicinc.com,
	quic_mattleun@quicinc.com, quic_thanson@quicinc.com,
	ogabbay@kernel.org, lizhi.hou@amd.com,
	jacek.lawrynowicz@linux.intel.com, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, mhi@lists.linux.dev
Subject: Re: [PATCH v2 2/7] bus: mhi: host: Add a policy to enable image
 transfer via BHIe in PBL
Message-ID: <20250121045439.xx6mavzwklfnlvhf@thinkpad>
References: <20250117170943.2643280-1-quic_jhugo@quicinc.com>
 <20250117170943.2643280-3-quic_jhugo@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250117170943.2643280-3-quic_jhugo@quicinc.com>

On Fri, Jan 17, 2025 at 10:09:38AM -0700, Jeffrey Hugo wrote:
> From: Matthew Leung <quic_mattleun@quicinc.com>
> 
> Currently, MHI host only performs firmware transfer via BHI in PBL and
> BHIe from SBL. To support BHIe transfer directly from PBL, a policy
> needs to be added.
> 
> With this policy, BHIe will be used to transfer firmware in PBL if the
> MHI controller has BHIe regs, sets seg_len, and does not set
> fbc_download. The intention is to transfer firmware using BHIe in PBL
> without further BHIe transfers in SBL.
> 
> Signed-off-by: Matthew Leung <quic_mattleun@quicinc.com>
> Reviewed-by: Youssef Samir <quic_yabdulra@quicinc.com>
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> ---
>  drivers/bus/mhi/host/boot.c     | 73 ++++++++++++++++++++++++++-------
>  drivers/bus/mhi/host/init.c     |  2 +-
>  drivers/bus/mhi/host/internal.h |  7 ++++
>  3 files changed, 66 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
> index 9fe13d3f09f0..a206c3f0fcfd 100644
> --- a/drivers/bus/mhi/host/boot.c
> +++ b/drivers/bus/mhi/host/boot.c
> @@ -440,12 +440,59 @@ static void mhi_firmware_copy_bhie(struct mhi_controller *mhi_cntrl,
>  	}
>  }
>  
> +static enum mhi_fw_load_type mhi_fw_load_type_get(const struct mhi_controller *mhi_cntrl)
> +{
> +	if (mhi_cntrl->fbc_download) {
> +		return MHI_FW_LOAD_FBC;
> +	} else {
> +		if (mhi_cntrl->seg_len)
> +			return MHI_FW_LOAD_BHIE;
> +		else
> +			return MHI_FW_LOAD_BHI;
> +	}
> +}
> +
> +static int mhi_load_image_bhi(struct mhi_controller *mhi_cntrl, const u8 *fw_data, size_t size)
> +{
> +	struct image_info *image;
> +	int ret;
> +
> +	ret = mhi_alloc_bhi_buffer(mhi_cntrl, &image, size);
> +	if (ret)
> +		return ret;
> +
> +	/* Load the firmware into BHI vec table */
> +	memcpy(image->mhi_buf->buf, fw_data, size);
> +
> +	ret = mhi_fw_load_bhi(mhi_cntrl, &image->mhi_buf[image->entries - 1]);
> +	mhi_free_bhi_buffer(mhi_cntrl, image);
> +
> +	return ret;
> +}
> +
> +static int mhi_load_image_bhie(struct mhi_controller *mhi_cntrl, const u8 *fw_data, size_t size)
> +{
> +	struct image_info *image;
> +	int ret;
> +
> +	ret = mhi_alloc_bhie_table(mhi_cntrl, &image, size);
> +	if (ret)
> +		return ret;
> +
> +	mhi_firmware_copy_bhie(mhi_cntrl, fw_data, size, image);
> +
> +	ret = mhi_fw_load_bhie(mhi_cntrl, &image->mhi_buf[image->entries - 1]);
> +	mhi_free_bhie_table(mhi_cntrl, image);
> +
> +	return ret;
> +}
> +
>  void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>  {
>  	const struct firmware *firmware = NULL;
>  	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> +	enum mhi_fw_load_type fw_load_type;
>  	enum mhi_pm_state new_state;
> -	struct image_info *image;
>  	const char *fw_name;
>  	const u8 *fw_data;
>  	size_t size, fw_sz;
> @@ -506,21 +553,17 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>  	fw_sz = firmware->size;
>  
>  skip_req_fw:
> -	ret = mhi_alloc_bhi_buffer(mhi_cntrl, &image, size);
> -	if (ret) {
> -		release_firmware(firmware);
> -		goto error_fw_load;
> -	}
> -	/* Load the firmware into BHI vec table */
> -	memcpy(image->mhi_buf->buf, fw_data, size);
> -
> -	/* Download image using BHI */
> -	ret = mhi_fw_load_bhi(mhi_cntrl, image->mhi_buf);
> -	mhi_free_bhi_buffer(mhi_cntrl, image);
> +	fw_load_type = mhi_fw_load_type_get(mhi_cntrl);
> +	if (fw_load_type == MHI_FW_LOAD_BHIE)
> +		ret = mhi_load_image_bhie(mhi_cntrl, fw_data, size);
> +	else
> +		ret = mhi_load_image_bhi(mhi_cntrl, fw_data, size);
>  
>  	/* Error or in EDL mode, we're done */
>  	if (ret) {
> -		dev_err(dev, "MHI did not load image over BHI, ret: %d\n", ret);
> +		dev_err(dev, "MHI did not load image over BHI%s, ret: %d\n",
> +			fw_load_type == MHI_FW_LOAD_BHIE ? "e" : "",
> +			ret);
>  		release_firmware(firmware);
>  		goto error_fw_load;
>  	}
> @@ -539,7 +582,7 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>  	 * If we're doing fbc, populate vector tables while
>  	 * device transitioning into MHI READY state
>  	 */
> -	if (mhi_cntrl->fbc_download) {
> +	if (fw_load_type == MHI_FW_LOAD_FBC) {
>  		ret = mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl->fbc_image, fw_sz);
>  		if (ret) {
>  			release_firmware(firmware);
> @@ -564,7 +607,7 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>  	return;
>  
>  error_ready_state:
> -	if (mhi_cntrl->fbc_download) {
> +	if (fw_load_type == MHI_FW_LOAD_FBC) {
>  		mhi_free_bhie_table(mhi_cntrl, mhi_cntrl->fbc_image);
>  		mhi_cntrl->fbc_image = NULL;
>  	}
> diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
> index a9b1f8beee7b..13e7a55f54ff 100644
> --- a/drivers/bus/mhi/host/init.c
> +++ b/drivers/bus/mhi/host/init.c
> @@ -1144,7 +1144,7 @@ int mhi_prepare_for_power_up(struct mhi_controller *mhi_cntrl)
>  	}
>  	mhi_cntrl->bhi = mhi_cntrl->regs + bhi_off;
>  
> -	if (mhi_cntrl->fbc_download || mhi_cntrl->rddm_size) {
> +	if (mhi_cntrl->fbc_download || mhi_cntrl->rddm_size || mhi_cntrl->seg_len) {
>  		ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->regs, BHIEOFF,
>  				   &bhie_off);
>  		if (ret) {
> diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
> index 3134f111be35..ce566f7d2e92 100644
> --- a/drivers/bus/mhi/host/internal.h
> +++ b/drivers/bus/mhi/host/internal.h
> @@ -29,6 +29,13 @@ struct bhi_vec_entry {
>  	u64 size;
>  };
>  
> +enum mhi_fw_load_type {
> +	MHI_FW_LOAD_BHI,	/* BHI only in PBL */
> +	MHI_FW_LOAD_BHIE,	/* BHIe only in PBL */
> +	MHI_FW_LOAD_FBC,	/* BHI in PBL followed by BHIe in SBL */
> +	MHI_FW_LOAD_MAX,
> +};
> +
>  enum mhi_ch_state_type {
>  	MHI_CH_STATE_TYPE_RESET,
>  	MHI_CH_STATE_TYPE_STOP,
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்
