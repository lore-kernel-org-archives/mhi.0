Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A944168A9
	for <mhi@lists.linux.dev>; Thu,  8 Jun 2023 16:05:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA251C433EF;
	Thu,  8 Jun 2023 16:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686240341;
	bh=ufp2zt1SkNF1+CL28h3jhJxRbKTEhCrr1U7fthAmGQw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d0bnkV0oagLHjzYRaPX2PqzZKS7nBPR4qX1KdX2PdROBzYMgnM8zVhuc2uv5hVviJ
	 wUoI6HmvygcU1INdhUALn2QUugPn+tEMkJRUg/MGwNFZQ7gVWu/EaFWBLAg8ewrQKz
	 0YRe40ok+z8ALAhwxLh/U5cNI2bfMVFY6Pn3oa7FqLqlEfnryEwQGhe68MrO7QYe4b
	 tgyEIRH1ZbDh8AC3vMg12/avc3Bi1yAEex1yJpeat3eUdHRyJ6NQnZczVo+0f9R5Dp
	 nRZB2o5BGRBkP1s4ZaGTWpDbK9ePGPEkWnGqj6GCxfnWzjjKPutD2ZSComs0CyGrDb
	 TpZTQCYywxtIw==
Date: Thu, 8 Jun 2023 21:35:30 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Duke =?utf-8?B?WGluKOi+m+WuieaWhyk=?= <duke_xinanwen@163.com>
Cc: loic.poulain@linaro.org, slark_xiao@163.com, fabio.porcedda@gmail.com,
	koen.vandeputte@citymesh.com, song.fc@gmail.com,
	bhelgaas@google.com, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, jerry.meng@quectel.com,
	duke.xin@quectel.com
Subject: Re: [PATCH v4] bus: mhi: host: pci_generic: Add support for
 quectel's new EM160R-GL product
Message-ID: <20230608160530.GC8632@thinkpad>
References: <20230608092927.2893-1-duke_xinanwen@163.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230608092927.2893-1-duke_xinanwen@163.com>

On Thu, Jun 08, 2023 at 02:29:27AM -0700, Duke Xin(辛安文) wrote:
> The product's would use the same config as previous EM160R-GL
> 
> Signed-off-by: Duke Xin(辛安文) <duke_xinanwen@163.com>
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> ---
> Changelog
> 
> v3 -> v4
> 
> * Update commit message to include the changelog and reviewd tag.
> 
> v2 -> v3
> 
> * Add patch CC to mhi@lists.linux.dev.
> 
> v1 -> v2
> 
> * Remove Space before */ and "for laptop" description.
> ---
>  drivers/bus/mhi/host/pci_generic.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 70e37c490150..5f204b819e95 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -591,6 +591,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
>  		.driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_QUECTEL, 0x1002), /* EM160R-GL (sdx24) */
>  		.driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
> +	/* EM160R-GL (sdx24) */
> +	{ PCI_DEVICE(PCI_VENDOR_ID_QUECTEL, 0x100d),
> +		.driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },

EM160R-GL is exactly the same name as the old modem with same chipset. What is
the difference between these two?

- Mani

>  	{ PCI_DEVICE(PCI_VENDOR_ID_QUECTEL, 0x2001), /* EM120R-GL for FCCL (sdx24) */
>  		.driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
>  	/* T99W175 (sdx55), Both for eSIM and Non-eSIM */
> -- 
> 2.25.1
> 

-- 
மணிவண்ணன் சதாசிவம்
