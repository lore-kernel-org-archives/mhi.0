Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7522F28
	for <mhi@lists.linux.dev>; Thu, 10 Feb 2022 04:20:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C1B1C004E1;
	Thu, 10 Feb 2022 04:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644466802;
	bh=iCjxYGA0ByQSX+YK1mDlq2Ao5AztFRWI3R1tZW1U2lE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b0Sp8rgyXSb4m6CrFH7EQjb1od3uhZHWaMY9RJvKWfsUkkKrW1i9nuraFoxINzoxv
	 SAxPLF0FVCf7O2mPBUBTI+THUjV02SYr2Zmc+CZ0mF3SLadZHgFSmSW6xpP9RKNLdP
	 CDP8Yg10rT+donvsL39cwWNZBVbXgH4ukx+W0F/vhWzv/oodPram8P+fjW0zWyCikL
	 E5C0sNRp3BFPajbqI5pXR8Bql5YeqZJWoIknI7dX3uwC6Umjibzbrml1+HfriRt/RF
	 hHn76b1SCZZHvrvRR4eADSMgMWjzIvqlFNcehAjfUI9lgw+JJQUKXNeftoTMXuVlbG
	 pcM1v6U79atRA==
Date: Thu, 10 Feb 2022 09:49:54 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Yonglin Tan <yonglin.tan@outlook.com>
Cc: mani@kernel.org, hemantk@codeaurora.org, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: pci_generic: Add mru_default for Quectel EM1xx
 series
Message-ID: <20220210041954.GA5294@thinkpad>
References: <MEYP282MB2374EE345DADDB591AFDA6AFFD2E9@MEYP282MB2374.AUSP282.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MEYP282MB2374EE345DADDB591AFDA6AFFD2E9@MEYP282MB2374.AUSP282.PROD.OUTLOOK.COM>

On Wed, Feb 09, 2022 at 09:57:52PM +0800, Yonglin Tan wrote:
> For default mechanism, the driver uses default MRU 3500 if mru_default
> is not initialized. The Qualcomm configured the MRU size to 32768 in the
> WWAN device FW. So, we align the driver setting with Qualcomm FW setting.
> 
> Fixes: ac4bf60bbaa0 ("bus: mhi: pci_generic: Introduce quectel EM1XXGR-L support")
> Cc: stable@vger.kernel.org
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> Signed-off-by: Yonglin Tan <yonglin.tan@outlook.com>

Applied to mhi-fixes!

Thanks,
Mani

> ---
>  drivers/bus/mhi/pci_generic.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> index b79895810c52..9527b7d63840 100644
> --- a/drivers/bus/mhi/pci_generic.c
> +++ b/drivers/bus/mhi/pci_generic.c
> @@ -327,6 +327,7 @@ static const struct mhi_pci_dev_info mhi_quectel_em1xx_info = {
>  	.config = &modem_quectel_em1xx_config,
>  	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
>  	.dma_data_width = 32,
> +	.mru_default = 32768,
>  	.sideband_wake = true,
>  };
>  
> -- 
> 2.7.4
> 
> 
