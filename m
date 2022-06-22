Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D131843
	for <mhi@lists.linux.dev>; Wed, 22 Jun 2022 16:25:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B84EC34114;
	Wed, 22 Jun 2022 16:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655915132;
	bh=wr8H/XPR1kOwD16IrHY0mrY7tliBGunYubB7Rn8wDao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TN4QoDLGAx9uMTaxQ2uFd+UxxVRHlChnFWLc9tsubNyhtv5w9jlHShFr4TdWdbKZT
	 DZqw68xKfmFxTvUR74TI8TZawFBBCv2oC0hshj9Z6F9g1ws/SRaH4CpuqJbAvz1rZa
	 co6vNjgwVCGcPsweyvJF4vaoweIydbbDiY0EWDGHBQppkIC04DF0nTb/n972D6xZZO
	 R8MryKpn7U49K1jtpM3IU6Q2tod+m4xzlCW/vCpI2fRrsOD/3fiRggZBJ2tIaphREu
	 5plW3En8TyUUSNjAAMhgqQPKm8DsO/hrgPM1t4CZ82qqZIVcdAaR1mVc38dMymfqa8
	 EUZVUo4P9UP/g==
Date: Wed, 22 Jun 2022 21:55:19 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Slark Xiao <slark_xiao@163.com>
Cc: quic_hemantk@quicinc.com, gregkh@linuxfoundation.org,
	loic.poulain@linaro.org, dnlplm@gmail.com, bbhatt@codeaurora.org,
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] bus: mhi: host: pci_generic: Add Cinterion MV31-W
 with new baseline
Message-ID: <20220622162519.GD6263@thinkpad>
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

Applied to mhi-next!

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
