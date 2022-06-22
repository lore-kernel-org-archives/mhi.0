Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E88110A
	for <mhi@lists.linux.dev>; Wed, 22 Jun 2022 08:14:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55C0CC34114;
	Wed, 22 Jun 2022 08:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655885654;
	bh=H/Z/L8MiVmpkhuhNiZ0YLz7K84HAGPmdn7jyCa4MN9A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DqcmkzqIgiPhDuCL3zs7tDTdyNhdcSW7JZxHf6IhQLOSjKp7meg0v7Z72fPP/OiGn
	 tQP3yW3HoD3vSE3x8Ieuo/O2JJJj62iRITfSm2fVE2ySUUGb3xBsbHk8dWOutDYLUD
	 +vcDU8dw/mXuzHKcw15ZcNrPN867vnR9giTeHR301feC4arHge9ZYppJVSWPQmCM1x
	 2/o45zw2zLszpOcxSi31lk2dv4VvXRNt35c/lYfqMoOIHqPuPwyGrjx+8ucBBP4XfD
	 Rwxx1ol6qnf07b/1vo9W2ijeWrtkHx1h6QBh19ISSqWbv+l9x3OMMJjFxpwwmRuBHp
	 pwF/N/wv5n2jw==
Date: Wed, 22 Jun 2022 13:44:03 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Slark Xiao <slark_xiao@163.com>
Cc: quic_hemantk@quicinc.com, gregkh@linuxfoundation.org,
	loic.poulain@linaro.org, dnlplm@gmail.com, bbhatt@codeaurora.org,
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] bus: mhi: host: pci_generic: Add Cinterion MV31-W
 with new baseline
Message-ID: <20220622081403.GA6263@thinkpad>
References: <20220622032544.17713-1-slark_xiao@163.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220622032544.17713-1-slark_xiao@163.com>

On Wed, Jun 22, 2022 at 11:25:44AM +0800, Slark Xiao wrote:
> Cinterion MV31-W modem with a new baseline (firmware) is sold as a separate
> product with different device ID. So add support for the same reusing the
> config.
> 
> Signed-off-by: Slark Xiao <slark_xiao@163.com>

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/host/pci_generic.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 841626727f6b..062662b3778b 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -578,6 +578,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
>  	/* MV31-W (Cinterion) */
>  	{ PCI_DEVICE(0x1269, 0x00b3),
>  		.driver_data = (kernel_ulong_t) &mhi_mv31_info },
> +	/* MV31-W (Cinterion), based on new baseline */
> +	{ PCI_DEVICE(0x1269, 0x00b4),
> +		.driver_data = (kernel_ulong_t) &mhi_mv31_info },
>  	/* MV32-WA (Cinterion) */
>  	{ PCI_DEVICE(0x1269, 0x00ba),
>  		.driver_data = (kernel_ulong_t) &mhi_mv32_info },
> -- 
> 2.25.1
> 

-- 
மணிவண்ணன் சதாசிவம்
