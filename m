Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B9EECF
	for <mhi@lists.linux.dev>; Tue, 21 Jun 2022 12:46:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4B66C3411D;
	Tue, 21 Jun 2022 12:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655815597;
	bh=/lJf1g6k/vLlYyh34H6cKOQDaBIETGFyt/Fw9AGyS8o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QxKixXtz2oKY9+H1+w1iZ4YVxk07FG8wnR1oEGHhNg0aYKv573urCmtVPnYilqOPq
	 tRx+0RuJykPGgGWsDIrBJggd3BfCjb6Zsuo7D64qKC/ZD2kEjwM5FAuPaOPc+oQHFx
	 9XIV39rI7wQSRlVhhomKct+53id9oZ4UIbke2vxkQyRYHNewBBnSo9vYmsXk9Qo+gM
	 brv5gWxxMzb0o7XKV8rrEhMuwHZ7ARgA61HSf9dw4CFNR6Jm2TZiwjJPrmOQv/WD/3
	 ub8oJ5RAmQ0sj6nFMuxDy3C6iM8NukqetVUt/okXMqZId5DjMHOGz7EYz8omkMNHpP
	 Nz5I/vgUrip2g==
Date: Tue, 21 Jun 2022 18:16:24 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Yonglin Tan <yonglin.tan@outlook.com>
Cc: loic.poulain@linaro.org, gregkh@linuxfoundation.org,
	quic_hemantk@quicinc.com, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, mhi@lists.linux.dev
Subject: Re: [PATCH v2] bus: mhi: host: Add support for Quectel EM120 FCCL.
Message-ID: <20220621124624.GA17181@thinkpad>
References: <MEYP282MB2374837FFCB18B12BFDEDE80FDCF9@MEYP282MB2374.AUSP282.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <MEYP282MB2374837FFCB18B12BFDEDE80FDCF9@MEYP282MB2374.AUSP282.PROD.OUTLOOK.COM>

On Mon, May 16, 2022 at 02:38:29PM +0800, Yonglin Tan wrote:
> The product's enumeration align with previous 
> Quectel EM120R-GL, so the EM120 FCCL would use 
> the same config as Quectel EM120R-GL. 
> 
> Signed-off-by: Yonglin Tan <yonglin.tan@outlook.com>

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

Thanks,
Mani

> ---
> 
> V2:
> Fixed the format errors in the patch description.
> 
>  drivers/bus/mhi/host/pci_generic.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 8416267..0a6469c 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -557,6 +557,8 @@ static const struct pci_device_id mhi_pci_id_table[] = {
>  		.driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
>  	{ PCI_DEVICE(0x1eac, 0x1002), /* EM160R-GL (sdx24) */
>  		.driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
> +	{ PCI_DEVICE(0x1eac, 0x2001), /* EM120R-GL for FCCL (sdx24) */
> +		.driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
>  	/* T99W175 (sdx55), Both for eSIM and Non-eSIM */
>  	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0ab),
>  		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
> -- 
> 2.7.4
> 

-- 
மணிவண்ணன் சதாசிவம்
