Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796FE2565
	for <mhi@lists.linux.dev>; Mon,  7 Nov 2022 07:41:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 268ECC433D6;
	Mon,  7 Nov 2022 07:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667806888;
	bh=4tKWSuemmqg3Mju/0lTHA8dpidl+ZgjJ53blrJY0s9o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nwfRIPt8OYSzXLE4wgomaTDqNQJxKb1Xg3wianphQMfIRlvpmCRiPmSA61moyDXuT
	 NYrBLugm+8L1kB5VnsDhyHJ6gcLMtJMi7pf42s/TjWmIc3IMh0RaEG8WeCdkFiLYIr
	 W8KQBLgfBQR4sjpvBfsvwPdiqrR6i7bHcKTviz1pGStz9NhoQr103od9I9sr+dsT5W
	 ihsxlAhs5F21zndB/CQ98uJDmlXo4aeyaUAvx814pMXRe+Nj+pz5qs8Rtz8rHwSoVh
	 2ELaKfpVXN4ril77j6HYVaL0LpNrxEhDmSR8bPJjZeZoFwq5WaPIwNSd+dXE2hQbX6
	 vmBamAxtYjetQ==
Date: Mon, 7 Nov 2022 13:11:22 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Hemant Kumar <quic_hemantk@quicinc.com>, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mhi: pci_generic: add support for sc8280xp-crd SDX55
 variant
Message-ID: <20221107074122.GB5340@thinkpad>
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

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

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
