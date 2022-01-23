Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33637173
	for <mhi@lists.linux.dev>; Sun, 23 Jan 2022 17:52:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6371C340E2;
	Sun, 23 Jan 2022 17:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1642960327;
	bh=pmR1E/ePn4BEVhHc+x+IV9K7vuhU4+WXd+Lt77YSfFo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uDd4GrIxttG5OGwgSVQ5v1zxRFwC1n66oJiZOkWVka6HGC6MV4nrrRXDgO44bpfJO
	 +KtzUBxHuuaBZ3G/hugbmxVaM4dGrQiP6qCi3/w79CqaEHq9x/04drAfhgyWFI+5Iu
	 A9sQwuU4I+wrJjU1M6WmbuC0qV/WtVrO40ce1f7PJtg8/wU7dU98rNRYLuUEnh5J1y
	 1grIenoEQSnw0pHfCAiz4bWVkWbpsVGE2kjDvBF+Kz57UHAMuIzDwMprkZDd0r+cWq
	 Zt96+u1wJDlytRACf784XS147vG36aN7s1EILi8w5Osgka/YlSUOn+QWtaty44LgbV
	 pWmAYAHIzUP9g==
Date: Sun, 23 Jan 2022 23:22:00 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Slark Xiao <slark_xiao@163.com>
Cc: hemantk@codeaurora.org, thomas.ulrich@thalesgroup.com,
	gregkh@linuxfoundation.org, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] bus: mhi: Add mru_default for Cinterion MV31-W
Message-ID: <20220123175200.GC11636@thinkpad>
References: <20220119102519.5342-1-slark_xiao@163.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220119102519.5342-1-slark_xiao@163.com>

On Wed, Jan 19, 2022 at 06:25:19PM +0800, Slark Xiao wrote:
> For default mechanism, product would use default MRU 3500 if
> they didn't define it. But for Foxconn SDX55, there is a known
> issue which MRU 3500 would lead to data connection lost.
> So we align it with Qualcomm default MRU settings.
> We also validate it with Cinterion product and find it also
> works.
> 
> Fixes: 87693e092bd0 ("bus: mhi: pci_generic: Add Cinterion MV31-W PCIe to MHI")
> Signed-off-by: Slark Xiao <slark_xiao@163.com>

Applied to mhi-next with slight commit message change.

Thanks,
Mani

> ---
>  drivers/bus/mhi/pci_generic.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> index 3a258a677df8..79c16b2a52c7 100644
> --- a/drivers/bus/mhi/pci_generic.c
> +++ b/drivers/bus/mhi/pci_generic.c
> @@ -401,6 +401,7 @@ static const struct mhi_pci_dev_info mhi_mv31_info = {
>  	.config = &modem_mv31_config,
>  	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
>  	.dma_data_width = 32,
> +	.mru_default = 32768,
>  };
>  
>  static const struct mhi_channel_config mhi_sierra_em919x_channels[] = {
> -- 
> 2.25.1
> 
