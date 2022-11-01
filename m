Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76FD7E
	for <mhi@lists.linux.dev>; Tue,  1 Nov 2022 11:43:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EABCC433D6;
	Tue,  1 Nov 2022 11:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667302990;
	bh=JcTrk/RF3JsSWeq8eah3J59uSDdXRqqd/gbzuT/lHpY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a3mID94cJ3Uf66O/Er1AuJ2n2fP8Juk9Mke++TzbpWqT+GlPVBWScoFqGkUhnOGTE
	 RUxC/6WBn0mEPtil+qH7v9Rq8Q7ajYjGlkio6GdRzM+TSfad1OZ4tnZD8+j1c833Wx
	 OQIXkmKCT8LEAnF7KdpiyL2pC+jNKjukCYvXCJBa2beuQSviG0gi9/6C6WWaL72nKO
	 IkXc5zfDwBG7FVDrmG2OdAPzVXubjFbdSXiTNK28Svlwial8hUHqzojEXRgVRdHEaX
	 r3spBnNvNyoYwAMAcwgRcmD9lwbHttvagFsV5pkgU9DhwdaqqDh7473lCmpeBGPuNd
	 SHKGLDCaLHRYg==
Date: Tue, 1 Nov 2022 17:12:58 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Hemant Kumar <quic_hemantk@quicinc.com>, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mhi: pci_generic: add support for sc8280xp-crd SDX55
 variant
Message-ID: <20221101114258.GB54667@thinkpad>
References: <20221031083429.18971-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221031083429.18971-1-johan+linaro@kernel.org>

On Mon, Oct 31, 2022 at 09:34:29AM +0100, Johan Hovold wrote:
> The SC8280XP Compute Reference Design (CRD) has an on-PCB SDX55 modem
> which uses MBIM.
> 
> The exact channel configuration is not known but the Foxconn SDX55
> configuration allows the modem to be used so reuse that one for now.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/bus/mhi/host/pci_generic.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index caa4ce28cf9e..f9f4345d472d 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -542,6 +542,9 @@ static const struct mhi_pci_dev_info mhi_telit_fn990_info = {
>  static const struct pci_device_id mhi_pci_id_table[] = {
>  	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0304),
>  		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx24_info },
> +	/* SC8280XP-CRD (sdx55) */

Platform device name is not needed.

> +	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0306, PCI_VENDOR_ID_QCOM, 0x010c),

Sub ID looks wierd. Did you test with mhi_qcom_sdx55_info? If it didn't
work, what was the issue?

Thanks,
Mani

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
