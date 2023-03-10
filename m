Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A821063B5
	for <mhi@lists.linux.dev>; Fri, 10 Mar 2023 12:13:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D07DC433EF;
	Fri, 10 Mar 2023 12:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678450411;
	bh=oU5OEZvXKEFLgb8KBH5P7/3BY/Zj7SlC5INYNHEWOaQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fcqr27r3ochfS0LGW5/4bCEkaWZNVzxH3nj3+K59MhV5jCdydLHXILP7xPzhHFUqd
	 5TmDBbHpNAIahof79gfIFYn/h+RxXB+Ce5onZorhaHpifvQgc2tuMNEvakipHoRmjQ
	 /YP0qB3tJiVKhSxdKfHh8VwnzuS9GSiV76jp3W+3KEXcdfWEbDbc5nlCa7lAIweVDg
	 j8vp9H4FQEleUQAh/y852RNfzi0sS/Ezg5ZaNuyhbyvZ0uW71Z/GVfq2idimQ/UdAS
	 /NHYRL0UU5PZoMOl6RDw/eG9esW3rpVBjESSKOkHNr7FD67zBNG+J1JrdOxTtkeH6f
	 B3loXSYpyWlwQ==
Date: Fri, 10 Mar 2023 17:43:25 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Slark Xiao <slark_xiao@163.com>
Cc: loic.poulain@linaro.org, fabio.porcedda@gmail.com, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Revert "Add a secondary AT
 port to Telit FN990"
Message-ID: <20230310121325.GC6838@thinkpad>
References: <20230310101715.69209-1-slark_xiao@163.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230310101715.69209-1-slark_xiao@163.com>

On Fri, Mar 10, 2023 at 06:17:15PM +0800, Slark Xiao wrote:
> This reverts commit 2d5253a096c6057bbf7caa5520856dcdf7eca8bb.
> There are 2 commits with commit message "Add a secondary AT
> port to Telit FN990". But the last one 2d5253a096 was added
> on Foxconn devices. Actually the second AT port of Foxconn
> devices doesn't work in PCIe mode. And the commit message
> mismatch with the changes. So we need to remove it.
> 
> Signed-off-by: Slark Xiao <slark_xiao@163.com>

Applied to mhi-next after ammending the commit message to reflect the bad
merge.

Thanks,
Mani

> ---
>  drivers/bus/mhi/host/pci_generic.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 6e13c43a84d1..91d02f84ba21 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -343,8 +343,6 @@ static const struct mhi_channel_config mhi_foxconn_sdx55_channels[] = {
>  	MHI_CHANNEL_CONFIG_DL(13, "MBIM", 32, 0),
>  	MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
>  	MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
> -	MHI_CHANNEL_CONFIG_UL(92, "DUN2", 32, 1),
> -	MHI_CHANNEL_CONFIG_DL(93, "DUN2", 32, 1),
>  	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0_MBIM", 128, 2),
>  	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0_MBIM", 128, 3),
>  };
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்
