Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5138463B6
	for <mhi@lists.linux.dev>; Fri, 11 Aug 2023 15:05:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D85C0C433C9;
	Fri, 11 Aug 2023 15:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691766348;
	bh=bBxkPlDqdNXoq1XK4aNK7kOyy2+7zN1Bvu6UATeTQ3s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D5gOPV2ulNqQa/98acxDTxFaUxK112AYYF7xuDSVnTZQVULIQPOY9HPaN7esyJVHe
	 OFCNsUzJIEu0+1PTD1v38At0jvgP0u/ha0MNztvUedHWTCl3dZakgSYkQWixGn1W3f
	 A5uNl68ea8xYg1a3Ig/n4BbYucS5GBjDDCvnoEFFR9Aw0INIOVQiz/XHimBtnHP7Kl
	 HMf/PVOhZ2nzxICqDirveqWILgN95km0SZvcezEAehSKQTxQbdqkPOG91ZRU0KnRQ2
	 0nCDlfXkz4VK+9A16gRqC5uCPi+QssQEvfb/JOMppTGvKb2/2UF0epxm+iAQN1zAz/
	 gQ/traOTy7B4Q==
Date: Fri, 11 Aug 2023 20:35:36 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Daniele Palmas <dnlplm@gmail.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/1] bus: mhi: host: pci_generic: add support for Telit
 FE990
Message-ID: <20230811150536.GA5296@thinkpad>
References: <20230804094039.365102-1-dnlplm@gmail.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230804094039.365102-1-dnlplm@gmail.com>

On Fri, Aug 04, 2023 at 11:40:39AM +0200, Daniele Palmas wrote:
> Add support for Telit FE990 that has the same configuration than FN990:

s/than/as

> 
> $ lspci -vv
> 04:00.0 Unassigned class [ff00]: Qualcomm Device 0308
>     Subsystem: Device 1c5d:2015
> 
> Signed-off-by: Daniele Palmas <dnlplm@gmail.com>

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

> ---
>  drivers/bus/mhi/host/pci_generic.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index fcd80bc92978..676f3ae33ae9 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -595,6 +595,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
>  	/* Telit FN990 */
>  	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, 0x1c5d, 0x2010),
>  		.driver_data = (kernel_ulong_t) &mhi_telit_fn990_info },
> +	/* Telit FE990, same configuration than FN990 */

No need to mention configuration here.

- Mani

> +	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, 0x1c5d, 0x2015),
> +		.driver_data = (kernel_ulong_t) &mhi_telit_fn990_info },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0308),
>  		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx65_info },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_QUECTEL, 0x1001), /* EM120R-GL (sdx24) */
> -- 
> 2.37.1
> 
> 

-- 
மணிவண்ணன் சதாசிவம்
