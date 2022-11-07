Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835AE5CB4
	for <mhi@lists.linux.dev>; Mon,  7 Nov 2022 11:42:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F494C4347C;
	Mon,  7 Nov 2022 11:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667821373;
	bh=9eowJ01JpeSKROTBqHNO82UhWBEwBAPJBY2Eh1IN4WM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Llv1irvrrLGrhfTI02f2lfZjLN3cvPl/cefR2v5PXyszVGC7nvrZCGHY1TPJxtxdu
	 BvSZ3axZ8OGIYKQVaKHrg2SiAjVgcgVOYfkkIW50cuSDvPwECIczCUV1iuinKpLDdO
	 g4SVGsVdXT6e2wPiFhq5LYLWEXxOI8Xj1YiH+eCTCNXRJo7lfZR/2+TUDVf6V2YUkj
	 UNVWDJ2kldy4UigRFHZN8uvMZ5keGCC7fKQ4t+pjFFN/4o1VZN0egADZ6f+TeGC2SP
	 y9Gky7UlT8O/JvUbE5qQ8PdMppMR9wkvJpYhtZO+i5LLC0zvaybCn4Au2xjfmg4dng
	 aH49f/Fi0uQ3g==
Date: Mon, 7 Nov 2022 17:12:43 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Hemant Kumar <quic_hemantk@quicinc.com>, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mhi: pci_generic: add support for sc8280xp-crd SDX55
 variant
Message-ID: <20221107114243.GD2220@thinkpad>
References: <20221104093913.23347-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221104093913.23347-1-johan+linaro@kernel.org>

On Fri, Nov 04, 2022 at 10:39:13AM +0100, Johan Hovold wrote:
> The SC8280XP Compute Reference Design (CRD) has an on-PCB SDX55 modem
> which uses MBIM.
> 
> The exact channel configuration is not known but the Foxconn SDX55
> configuration allows the modem to be used so reuse that one for now.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Modified the subject to the format "bus: mhi: host: pci_generic" and applied
to mhi-next!

Thanks,
Mani

> ---
> 
> Changes in v2
>  - drop comment describing this variant (Mani)
> 
> 
>  drivers/bus/mhi/host/pci_generic.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index caa4ce28cf9e..7dcd0ef3184a 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -542,6 +542,8 @@ static const struct mhi_pci_dev_info mhi_telit_fn990_info = {
>  static const struct pci_device_id mhi_pci_id_table[] = {
>  	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0304),
>  		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx24_info },
> +	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0306, PCI_VENDOR_ID_QCOM, 0x010c),
> +		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
>  	/* EM919x (sdx55), use the same vid:pid as qcom-sdx55m */
>  	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0306, 0x18d7, 0x0200),
>  		.driver_data = (kernel_ulong_t) &mhi_sierra_em919x_info },
> -- 
> 2.37.3
> 
> 

-- 
மணிவண்ணன் சதாசிவம்
