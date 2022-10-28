Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C502F44
	for <mhi@lists.linux.dev>; Fri, 28 Oct 2022 17:27:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08EBFC433C1;
	Fri, 28 Oct 2022 17:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666978030;
	bh=FR2UOV00TVaJlrVIjMsfr8ubpgvjLC36unTqKa4DTTo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M3qAPpRnp80kEZA6IAyYo/nNEz3MwBQ/obEXB2AMf2ue4dvpEzzYMqKFZJZKB45XY
	 eiMaaljg7kerSUi+7FTwyv1dnaqn5paRIOcCR5u6PNtKxd9yCK0/tGF2K3bLtpW6Da
	 1EAktuVH12DtSI9f36iyXKIE6NWpFCY7kEgxbI12WPqKJ/4m7wW2a9sayPRsmOYsfz
	 G1jz/yH/UkJQ4d8P9Sbt8G8P21ctDjFPUfbDwFkrrschAHprl6kiBnTMeQ+qROeKxT
	 /bgZ3kuY1/25Ju5YrOXmnXXwIk3WPmttGA2Sq0sm5JklpZpbzmGy9CaSTbz2SvvON6
	 vKk2iUx1GgTbw==
Date: Fri, 28 Oct 2022 22:57:04 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Song Fuchang <song.fc@gmail.com>
Cc: mhi@lists.linux.dev, manivannan.sadhasivam@linaro.org,
	quic_hemantk@quicinc.com
Subject: Re: [PATCH RESEND] bus: mhi: host: pci_generic: Add HP variant of
 T99W175
Message-ID: <20221028172704.GE13880@thinkpad>
References: <676290c3-0435-d85c-99dc-084f120ee04c@gmail.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <676290c3-0435-d85c-99dc-084f120ee04c@gmail.com>

On Sun, Oct 09, 2022 at 11:34:39AM +0800, Song Fuchang wrote:
> The foxconn T99W175 has an HP variant, so add support for it to the
> pci_generic driver.
> 
> Signed-off-by: Song Fuchang<song.fc@gmail.com>
> ---
>  drivers/bus/mhi/host/pci_generic.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c
> b/drivers/bus/mhi/host/pci_generic.c
> index 9e545f2a5a26..650e8b9c26ad 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -592,6 +592,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
>      /* MV32-WB (Cinterion) */
>      { PCI_DEVICE(0x1269, 0x00bb),
>          .driver_data = (kernel_ulong_t) &mhi_mv32_info },
> +    /* T99W175 (sdx55), HP variant */
> +    { PCI_DEVICE(0x03f0, 0x0a6c),

Why a new VID for this modem? Other T99W series modems are using PCI_VENDOR_ID_FOXCONN.

Thanks,
Mani

> +        .driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
>      {  }
>  };
>  MODULE_DEVICE_TABLE(pci, mhi_pci_id_table);
> -- 2.37.3
> 

-- 
மணிவண்ணன் சதாசிவம்
