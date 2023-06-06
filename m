Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D9E15ADB
	for <mhi@lists.linux.dev>; Tue,  6 Jun 2023 11:31:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0CEEC433EF;
	Tue,  6 Jun 2023 11:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686051114;
	bh=5v4WI3/F9V4dqC2ddLTWuvSdEbfree8SoWIO5OWaj/Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a2rFcdwq0Zmec8NiUkYM5qyQ0a67uqEtJTj2gs197u65ROhalwZJor703bG5UKxKe
	 5cjgA7sOciUBJBCSWVxwG/o1hC/qhxTy+08x+9GdgA9gJGo7C3p81pox9gHF0q2hgR
	 WEPHWMN0Fa9ntpF0JvMO4a7BOdJwlnq85nB0kLD+3YRTFqfuM2/D4Zppj2N0tfQdqv
	 qsBdP2LD+EXoJD/N8xZf20cfi4WIfYlYpdACe3OFwZYzoPayWdJ6bnf2lDdjBOdifZ
	 g9Kutm9l+QSupNirYwpMQ/9rdO53NTO7wab50V5ZX7pQL+I82+AxSXwOZhDV4O2Efr
	 zm0W1vmiOzbfw==
Date: Tue, 6 Jun 2023 17:01:45 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Duke =?utf-8?B?WGluKOi+m+WuieaWhyk=?= <duke_xinanwen@163.com>
Cc: loic.poulain@linaro.org, slark_xiao@163.com, fabio.porcedda@gmail.com,
	koen.vandeputte@citymesh.com, quic_jhugo@quicinc.com,
	johan+linaro@kernel.org, bhelgaas@google.com, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, jerry.meng@quectel.com,
	duke.xin@quectel.com
Subject: Re: [PATCH v6] bus: mhi: host: pci_generic: Add support for Quectel
 RM520N-GL modem
Message-ID: <20230606113145.GB51623@thinkpad>
References: <20230606103932.2790-1-duke_xinanwen@163.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230606103932.2790-1-duke_xinanwen@163.com>

On Tue, Jun 06, 2023 at 03:39:32AM -0700, Duke Xin(辛安文) wrote:
> Add MHI interface definition for RM520 product based on Qualcomm SDX6X chip
> 
> Signed-off-by: Duke Xin(辛安文) <duke_xinanwen@163.com>
> ---

What has changed since v1? Where is the changelog? I clearly mentioned that you
need to add changelog and also keep the review tags given for earlier revisions.

I cannot repeat this message for every iteration. You are wasting everyone's
time by not adhering to patch submissioon guidelines:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/5.Posting.rst

- Mani

>  drivers/bus/mhi/host/pci_generic.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index db0a0b062d8e..69be969672f1 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -334,6 +334,16 @@ static const struct mhi_pci_dev_info mhi_quectel_em1xx_info = {
>  	.sideband_wake = true,
>  };
>  
> +static const struct mhi_pci_dev_info mhi_quectel_rm5xx_info = {
> +	.name = "quectel-rm5xx",
> +	.edl = "qcom/prog_firehose_sdx6x.elf",
> +	.config = &modem_quectel_em1xx_config,
> +	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> +	.dma_data_width = 32,
> +	.mru_default = 32768,
> +	.sideband_wake = true,
> +};
> +
>  static const struct mhi_channel_config mhi_foxconn_sdx55_channels[] = {
>  	MHI_CHANNEL_CONFIG_UL(0, "LOOPBACK", 32, 0),
>  	MHI_CHANNEL_CONFIG_DL(1, "LOOPBACK", 32, 0),
> @@ -573,6 +583,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
>  		.driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_QUECTEL, 0x1002), /* EM160R-GL (sdx24) */
>  		.driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
> +	/* RM520N-GL (sdx6x), eSIM */
> +	{ PCI_DEVICE(PCI_VENDOR_ID_QUECTEL, 0x1004),
> +		.driver_data = (kernel_ulong_t) &mhi_quectel_rm5xx_info },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_QUECTEL, 0x2001), /* EM120R-GL for FCCL (sdx24) */
>  		.driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
>  	/* T99W175 (sdx55), Both for eSIM and Non-eSIM */
> -- 
> 2.25.1
> 

-- 
மணிவண்ணன் சதாசிவம்
