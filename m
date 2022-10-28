Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908012F44
	for <mhi@lists.linux.dev>; Fri, 28 Oct 2022 17:22:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6164FC433C1;
	Fri, 28 Oct 2022 17:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666977731;
	bh=RCc4qKIHtkfxg/CFdtsU8GG54g7gSd6z0PMWBWissZs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hgrFOb/4HzKUvv7KCSfPG29Jk88l8NVf52ETzbuajDpZtDpK3IkzcC1BlCOe8/TwW
	 eA7AKPRABd3nb9E6GgduXlhnBrd6xb5+tWF9S+j9TpIzsfCp2/lpBGotm9IgGMbLbF
	 VekBR/bAebefY1Sqtg7KS/PFFh9ZtBpnMSw8CkadZGLtpIPobXDQF63nPmxc+OwAmU
	 Tay8GroEAdj4NKa9yKtVZ9/0wYL5PyGC20nvJEabKlQ+pK/3IoWCRjaf7YiVovKJIH
	 WxvxkX8gt4JG0JVegYJsZWbWylcxm/V4Z7fEmkPwbBdWcrn41Z8ASSZqR9RhbtDQ2K
	 R3uDFIGMvJeFA==
Date: Fri, 28 Oct 2022 22:52:03 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Qiang Yu <quic_qianyu@quicinc.com>
Cc: quic_hemantk@quicinc.com, loic.poulain@linaro.org, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_cang@quicinc.com, mrana@quicinc.com
Subject: Re: [PATCH] bus: mhi: host: Use mhi_soc_reset() API in place of
 register write
Message-ID: <20221028172203.GD13880@thinkpad>
References: <1665376324-34258-1-git-send-email-quic_qianyu@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1665376324-34258-1-git-send-email-quic_qianyu@quicinc.com>

On Mon, Oct 10, 2022 at 12:32:04PM +0800, Qiang Yu wrote:
> Currently, a direct register write is used when ramdump collection
> in panic path occurs. Replace that with new mhi_soc_reset() API
> such that a controller defined reset() function is exercised if
> one is present and the regular SOC reset is done if it is not.
> 
> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
> Reviewed-by: Loic Poulain <loic.poulain@linaro.org>
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

Btw, this patch is supposed to be v2... Please keep the version info and also
add the changelog for future patches.

Thanks,
Mani

> ---
>  drivers/bus/mhi/host/boot.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
> index 26d0edd..1c69fee 100644
> --- a/drivers/bus/mhi/host/boot.c
> +++ b/drivers/bus/mhi/host/boot.c
> @@ -118,9 +118,7 @@ static int __mhi_download_rddm_in_panic(struct mhi_controller *mhi_cntrl)
>  			/* Hardware reset so force device to enter RDDM */
>  			dev_dbg(dev,
>  				"Did not enter RDDM, do a host req reset\n");
> -			mhi_write_reg(mhi_cntrl, mhi_cntrl->regs,
> -				      MHI_SOC_RESET_REQ_OFFSET,
> -				      MHI_SOC_RESET_REQ);
> +			mhi_soc_reset(mhi_cntrl);
>  			udelay(delayus);
>  		}
>  
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 

-- 
மணிவண்ணன் சதாசிவம்
