Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F48E29B8C7;
	Mon, 18 Aug 2025 08:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755504876; cv=none; b=fICjHZMxf6NyNPF0B65k+/OXiMGVO3k3xKm9blbIg1ZGAia0M2rElcRSPeIvay/5fLX4DnEj7o00KQuTJpG/2hVJg+uXW6E+omk+f5qUOojbENS2wDNGA7U+O1j5dpdPnw+u8FEF8e0eP3gKiNkzrJtXw9ZWNM9OYv+XnsWSGxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755504876; c=relaxed/simple;
	bh=KvZQZv9nSeMhMC+WLocbJbELHHUMhySmf4NucpEpZDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tl/FYZnYFJFSKp29jbWZ+dtR7hdS0o/ieQ0+iWTROTOeK5FzVbJqJJqr3+aSIeWPWaP8WBBpjpfvTx6jSEa/ynteUdXpJDwjpT/Z6ToPnFfmGoz76V+Om955Lt5wDgEmHSG836RiKsogbNjG1AzGyboxvLMWvojxVUa92TXarKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZMlIXmsk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZMlIXmsk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3123AC4CEEB;
	Mon, 18 Aug 2025 08:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755504875;
	bh=KvZQZv9nSeMhMC+WLocbJbELHHUMhySmf4NucpEpZDk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZMlIXmskkGUoInlwuI1I1SNEbQ77pfX9HElgGLo8NtHs7v0mTdXarcHHO0EEJhHAI
	 oMl7lY1QB2zoXKBmY28OTZ6vbAkdrlbHjMQ02MWQlS9DAYJvBtmwlzBlTOaduED2VF
	 8VQXcLnqvC96laDXOqVWTLzraQMlreQAzWUmVDKxTNbjZ78M0l4ZRtcEWeZwfQc6AK
	 opAuyenDh+wZ8wH5NAz5RaR8YNglSQJKGXVGIZVi3Y140hhpkhCcmXsjOAcQQmePrX
	 Y0SUo38rOJ521UPs5QCeyZMwrdyoERVECRwL6/ONOm9hKniXcAvZ/SRza7vkh/8pZb
	 O3XeaqKiK/2WA==
Date: Mon, 18 Aug 2025 13:44:28 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Slark Xiao <slark_xiao@163.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Add more Foxconn T99W696
 modem
Message-ID: <ma7am34lifhb3avqyiodtbsfmlmi6s5tsw7kqf2rp2eyiq3uqw@ty57xdfbe5ao>
References: <20250729085726.106807-1-slark_xiao@163.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250729085726.106807-1-slark_xiao@163.com>

On Tue, Jul 29, 2025 at 04:57:26PM GMT, Slark Xiao wrote:
> There are more platforms need support Foxconn T99W696 modem.
> This requirement comes from Lenovo side since they want 1 platform
> to correspond to 1 modem SKU.
> 
> Signed-off-by: Slark Xiao <slark_xiao@163.com>
> ---
>  drivers/bus/mhi/host/pci_generic.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 4edb5bb476ba..1fc43f1b86be 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -932,6 +932,24 @@ static const struct pci_device_id mhi_pci_id_table[] = {
>  	/* Foxconn T99W696.00, Foxconn SKU */
>  	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, PCI_VENDOR_ID_FOXCONN, 0xe146),
>  		.driver_data = (kernel_ulong_t) &mhi_foxconn_t99w696_info },
> +	/* Foxconn T99W696.05, Lenovo T14 */
> +	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, PCI_VENDOR_ID_FOXCONN, 0xe150),
> +		.driver_data = (kernel_ulong_t) &mhi_foxconn_t99w696_info },
> +	/* Foxconn T99W696.06, Lenovo T15 */
> +	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, PCI_VENDOR_ID_FOXCONN, 0xe151),
> +		.driver_data = (kernel_ulong_t) &mhi_foxconn_t99w696_info },
> +	/* Foxconn T99W696.07, Lenovo T16 */
> +	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, PCI_VENDOR_ID_FOXCONN, 0xe152),
> +		.driver_data = (kernel_ulong_t) &mhi_foxconn_t99w696_info },
> +	/* Foxconn T99W696.08, Lenovo P14s */
> +	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, PCI_VENDOR_ID_FOXCONN, 0xe153),
> +		.driver_data = (kernel_ulong_t) &mhi_foxconn_t99w696_info },
> +	/* Foxconn T99W696.09, Lenovo P16s */
> +	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, PCI_VENDOR_ID_FOXCONN, 0xe154),
> +		.driver_data = (kernel_ulong_t) &mhi_foxconn_t99w696_info },
> +	/* Foxconn T99W696.10, Lenovo P1 */
> +	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, PCI_VENDOR_ID_FOXCONN, 0xe155),
> +		.driver_data = (kernel_ulong_t) &mhi_foxconn_t99w696_info },

Since all T99W696 derivatives are using the same config, can't you use below?

	PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, PCI_VENDOR_ID_FOXCONN, PCI_ANY_ID),
		.driver_data = (kernel_ulong_t) &mhi_foxconn_t99w696_info },

I'm presumed that all 0x0308 based modems are T99W696 derivatives.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
