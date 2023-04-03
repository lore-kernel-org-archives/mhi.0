Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994E6364
	for <mhi@lists.linux.dev>; Mon,  3 Apr 2023 05:18:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01D53C433EF;
	Mon,  3 Apr 2023 05:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680499109;
	bh=P8j0AzckZVYhGZrPQQ0YU21I6adlzSVHyeBkQuU1TaA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ArnlNllK5+jL5k0N6RXq6IqNSbuKSzUmT07cVkdEF+J969KZc205Y78fIj0Haa4pC
	 d9/PzbvFL3pIK1hAh79zAAyC3i6hB2gOXcCG3+bJ+82zyl3XXUV2VqzFyZxK8fsTPk
	 VBmEUPWtFi5bD/VviCpHeKLGjt2KwMIfWQjr7hSCjEXvWkII6MMSDcABWPLhx0l3v8
	 WgAtt76Co24WYzs2H75+FsJjYiuuvf0/MlOF21C5IK+fePj/F/8H9RJs2BoZS5ZTQw
	 7i789aZ47nzCCIuH1tTRZheEPmxAWMoSEjSMn3pYJtf02fMCgNRsrcXAiQ4EUvumlB
	 fV9TNf0Zc074g==
Date: Mon, 3 Apr 2023 10:48:24 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: host: Use ERANGE for BHIOFF/BHIEOFF range check
Message-ID: <20230403051824.GD4627@thinkpad>
References: <1679674860-28229-1-git-send-email-quic_jhugo@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1679674860-28229-1-git-send-email-quic_jhugo@quicinc.com>

On Fri, Mar 24, 2023 at 10:21:00AM -0600, Jeffrey Hugo wrote:
> If the BHIOFF or BHIEOFF range checks fail, they return EINVAL.  ERANGE
> is a better error code since it implies an out of range condition.
> 
> Suggested-by: Manivannan Sadhasivam <mani@kernel.org>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

Applied to mhi-next!

- Mani

> ---
> 
> This feels more like a style change than fixing a bug, so I'm being
> conservative and intentionally not listing a fixes tag.
> 
>  drivers/bus/mhi/host/init.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
> index b46a082..f72fcb6 100644
> --- a/drivers/bus/mhi/host/init.c
> +++ b/drivers/bus/mhi/host/init.c
> @@ -1112,7 +1112,7 @@ int mhi_prepare_for_power_up(struct mhi_controller *mhi_cntrl)
>  	if (bhi_off >= mhi_cntrl->reg_len) {
>  		dev_err(dev, "BHI offset: 0x%x is out of range: 0x%zx\n",
>  			bhi_off, mhi_cntrl->reg_len);
> -		ret = -EINVAL;
> +		ret = -ERANGE;
>  		goto error_reg_offset;
>  	}
>  	mhi_cntrl->bhi = mhi_cntrl->regs + bhi_off;
> @@ -1129,7 +1129,7 @@ int mhi_prepare_for_power_up(struct mhi_controller *mhi_cntrl)
>  			dev_err(dev,
>  				"BHIe offset: 0x%x is out of range: 0x%zx\n",
>  				bhie_off, mhi_cntrl->reg_len);
> -			ret = -EINVAL;
> +			ret = -ERANGE;
>  			goto error_reg_offset;
>  		}
>  		mhi_cntrl->bhie = mhi_cntrl->regs + bhie_off;
> -- 
> 2.7.4
> 

-- 
மணிவண்ணன் சதாசிவம்
