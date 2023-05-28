Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5369A7C
	for <mhi@lists.linux.dev>; Sun, 28 May 2023 14:57:26 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1b026657a6fso11209735ad.0
        for <mhi@lists.linux.dev>; Sun, 28 May 2023 07:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685285845; x=1687877845;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Bg4yP6JQUstw/bz5fFj0XL84ZF9tW/DTkJgQGvQnFs8=;
        b=dIWuteu9Fhf3vaicbIowU+wrrOTZL/zRcMlF/jKSKQNochrLf3vP78/5cUEgmYfa8V
         G3YQjMGayZchpuC2i+weXCmjd1RcuBm1hVZa8L5S97r06XjLz/3aSCFuoATNalUGLa43
         6bgdIu6NRfZb/yxZ1JsEJyCwnXGyro+aC2KcgO4kVib1Ps+hAzNSVJYXbYTN5bNjFQ3f
         Ys9V5oecLhPOuMBPLNaRbrk3cbkJbvSjmFavV67us8z+mwQdnzWhUhOaxBjJ/BxlGnPX
         z9ji/dXt9P9NN2mVrZpHBfjQWruESvQi4WpGJL/oH785dwK1AtDdyt5RevFUC9Ce+ZqN
         TtLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685285845; x=1687877845;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bg4yP6JQUstw/bz5fFj0XL84ZF9tW/DTkJgQGvQnFs8=;
        b=brg/D9WZ+tdRDZMMFv4Rf34i4/8SM5hU23XHUDXQEVuqrYiJ/wllbFTATln+xekXdZ
         ek4gAVu0qz/PzjRlEeDxXKUWXYVQKpCzRciiwxjgaIXdLag/G6kl7qsWh2BBJ4O31g8F
         VnEhsbqIM9bpgVRmwHIKxPw+7BgbrMsFb/gDzayswNevjlArrhoFbukiB9PRmJVYKtjY
         s61ivPWgjBiBIWyAjJ+j9nECfozz67sEWVW32SGK9JxveZglbBf6t/+Tm91GoNowaHKn
         NG5asmp2RjQ2VjUVLAhH0uIhm8SbzZa8YDx1AVJnFE8kqtqirUlkw2WcuPId2GJCY1rq
         MTeA==
X-Gm-Message-State: AC+VfDx9+wQm8+agP4GOr2zhoZrtrZwAxdqe900XQLD6RCXoJ3Ed4U8q
	AvlngVDCfROy8SDUje1obl21
X-Google-Smtp-Source: ACHHUZ6yrBb/7PjUZzsTRpSciXH9EHy45Kbam/bdUmU0L6LbzwZ1LEy+e8SNaqJrDSUo8RFhrjF78w==
X-Received: by 2002:a17:902:a50d:b0:1a2:6257:36b9 with SMTP id s13-20020a170902a50d00b001a2625736b9mr7729161plq.31.1685285845626;
        Sun, 28 May 2023 07:57:25 -0700 (PDT)
Received: from thinkpad ([117.248.1.157])
        by smtp.gmail.com with ESMTPSA id f10-20020a170902ce8a00b001ae59169f05sm6406643plg.182.2023.05.28.07.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 May 2023 07:57:25 -0700 (PDT)
Date: Sun, 28 May 2023 20:27:21 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: mhi@lists.linux.dev, ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH v2 1/3] mhi: allow MHI client drivers to provide the
 firmware via a pointer
Message-ID: <20230528145721.GE2814@thinkpad>
References: <20230308152522.6728-1-kvalo@kernel.org>
 <20230308152522.6728-2-kvalo@kernel.org>
 <20230315081820.GD25575@thinkpad>
 <87353jl3it.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87353jl3it.fsf@kernel.org>

On Fri, May 26, 2023 at 02:45:46PM +0300, Kalle Valo wrote:
> Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> writes:
> 
> > On Wed, Mar 08, 2023 at 05:25:20PM +0200, Kalle Valo wrote:
> >> From: Kalle Valo <quic_kvalo@quicinc.com>
> >> 
> >
> > Subject prefix should be: "bus: mhi: host: ..."
> 
> Will do.
> 
> >> @@ -392,9 +390,10 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
> >>  	const struct firmware *firmware = NULL;
> >>  	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> >>  	const char *fw_name;
> >> +	const u8 *fw_data;
> >>  	void *buf;
> >>  	dma_addr_t dma_addr;
> >> -	size_t size;
> >> +	size_t size, fw_sz;
> >>  	int i, ret;
> >>  
> >>  	if (MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state)) {
> >> @@ -424,6 +423,14 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
> >>  	fw_name = (mhi_cntrl->ee == MHI_EE_EDL) ?
> >>  		mhi_cntrl->edl_image : mhi_cntrl->fw_image;
> >>  
> >
> > Can you please add a comment here?
> 
> Ok.
> 
> >
> >> +	if (!fw_name && mhi_cntrl->fbc_download &&
> >> +	    mhi_cntrl->fw_data && mhi_cntrl->fw_sz) {
> >> +		size = mhi_cntrl->sbl_size;
> >
> > Don't you need to validate sbl_size?
> 
> Good point, I'll add that.
> 
> >> --- a/include/linux/mhi.h
> >> +++ b/include/linux/mhi.h
> >> @@ -299,6 +299,10 @@ struct mhi_controller_config {
> >>   * @iova_start: IOMMU starting address for data (required)
> >>   * @iova_stop: IOMMU stop address for data (required)
> >>   * @fw_image: Firmware image name for normal booting (optional)
> >> + * @fw_data: Firmware image data content for normal booting, used only
> >> + *           if fw_image is NULL (optional)
> >> + * @fw_sz: Firmware image data size for normal booting, used only if fw_image
> >> + *         is NULL and fbc_download is true (optional)
> >>   * @edl_image: Firmware image name for emergency download mode (optional)
> >>   * @rddm_size: RAM dump size that host should allocate for debugging purpose
> >>   * @sbl_size: SBL image size downloaded through BHIe (optional)
> >> @@ -384,6 +388,8 @@ struct mhi_controller {
> >>  	dma_addr_t iova_start;
> >>  	dma_addr_t iova_stop;
> >>  	const char *fw_image;
> >> +	const u8 *fw_data;
> >> +	size_t fw_sz;
> >
> > Even though these members are not creating holes now, shuffling the datatypes
> > will create holes in the future. So I always prefer to keep the struct members
> > sorted in the below order:
> >
> > pointer
> > struct/union
> > u64
> > u32
> > u16
> > u8
> > bool
> 
> I'm not sure what are suggesting here as struct mhi_controller is not
> using that style. Are you saying that fw_sz should be after reg_len? So
> something like this:
> 
> 	const u8 *fw_data;
> 	const char *edl_image;
> 	size_t rddm_size;
> 	size_t sbl_size;
> 	size_t seg_len;
> 	size_t reg_len;
> 	size_t fw_sz;
> 

Ah, I thought I already sorted them up but apparently not. Keep it as it is,
I'll sort this and other structs later.

- Mani

> -- 
> https://patchwork.kernel.org/project/linux-wireless/list/
> 
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
மணிவண்ணன் சதாசிவம்
