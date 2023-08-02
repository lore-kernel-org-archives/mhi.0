Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1DD6FC4
	for <mhi@lists.linux.dev>; Wed,  2 Aug 2023 11:07:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEA3CC433C7;
	Wed,  2 Aug 2023 11:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690974469;
	bh=wrmaodfGzLPH3aCxqHaxRauSI3aslaJU0Se3l6Z1ikQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m19LYYgozctwtVrp5E/HMLDced/XRH5+2SKUT3GOwFeGdC1HOZbB5tdmDbYHSvQlB
	 XMYQved5y0O1obGpOjD01f5ftDypuPIbRN7U2XnbA0WIMfAzhwU7MJ8cstJU5/cNIi
	 avama0J0bsMBlkTgHb/UMZmT908LqFpqEeqGrMh15IiizkLJFbLV11mzTiUJZnJvGs
	 cG/O7vbKGVxCg+f47qTq7N++u5422VwuCnn01QeUh3+RCSPASzP882Kkn58eK1k9Y6
	 +5op32Ua3EsNdXZihAeZ5MT2X0ga2C7U1QPhPLbLUYgXZ5XTAlzayOucQtcbYYjGVo
	 OqHsRZVfDRmVw==
Date: Wed, 2 Aug 2023 16:37:36 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Duke =?utf-8?B?WGluKOi+m+WuieaWhyk=?= <duke_xinanwen@163.com>
Cc: mani@kernel.org, loic.poulain@linaro.org, slark_xiao@163.com,
	fabio.porcedda@gmail.com, koen.vandeputte@citymesh.com,
	bhelgaas@google.com, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, jerry.meng@quectel.com,
	duke.xin@quectel.com
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Add support for Lenovo
 RM520N-GL
Message-ID: <20230802110736.GE57374@thinkpad>
References: <20230728014702.25775-1-duke_xinanwen@163.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230728014702.25775-1-duke_xinanwen@163.com>

On Thu, Jul 27, 2023 at 06:47:02PM -0700, Duke Xin(辛安文) wrote:

It is a Quectel modem, right? Then it should be mentioned as Quectel in subject.

> This modem is designed based on Qualcomm SDX6x and it will align with the quectel previous RM520N-GL modem settings.

s/it will align/works

s/quectel previous/Quectel's existing

> But this one is designed for lenovo laptop usecase, hence Quectel got a new PID.
> 

Also, wrap the commit message to 75 columns. And always run
./scripts/checkpatch.pl and fix warnings/errors before posting a patch.

- Mani

> Signed-off-by: Duke Xin(辛安文) <duke_xinanwen@163.com>
> ---
>  drivers/bus/mhi/host/pci_generic.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index fcd80bc92978..e4f2fb67dfaf 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -604,6 +604,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
>  	/* RM520N-GL (sdx6x), eSIM */
>  	{ PCI_DEVICE(PCI_VENDOR_ID_QUECTEL, 0x1004),
>  		.driver_data = (kernel_ulong_t) &mhi_quectel_rm5xx_info },
> +	/* RM520N-GL (sdx6x), Lenovo variant */
> +	{ PCI_DEVICE(PCI_VENDOR_ID_QUECTEL, 0x1007),
> +		.driver_data = (kernel_ulong_t) &mhi_quectel_rm5xx_info },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_QUECTEL, 0x100d), /* EM160R-GL (sdx24) */
>  		.driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_QUECTEL, 0x2001), /* EM120R-GL for FCCL (sdx24) */
> -- 
> 2.25.1
> 

-- 
மணிவண்ணன் சதாசிவம்
