Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2B92F44
	for <mhi@lists.linux.dev>; Fri, 28 Oct 2022 17:36:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19706C433D6;
	Fri, 28 Oct 2022 17:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666978581;
	bh=0uMe61d6zyaKp7YWkRXjRVSGPdk5XS0AglSp0I6eYSs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dsMGWwxAQ+fIfu3qeGDr9BEbLlJtAIUI1drl+VMNqAF6OEvnwBSOsydN3JELxJ0p2
	 cRNmz+eP4QiO+IjKkFf8dNSu+l8F9HEAmdjPbqkEYOXODBaGKpayO6V7RfIVAWtxxE
	 w7QMfcuvtuJWuNPUEi5al4bxWmJox24v1MLUNK88C+0JWg/AFHTECOOYB/8/08+BkH
	 NAXgSLlkmILWmgzNRFqRqQVpFfxm88i99oeBgwxrLAO8yNDDewLWYAtFH2erZCZSZE
	 SwE/dgSh90yF0Mu3ahHWJeLIvbtpRG+v3dVab8Vi26jrCDjkgkslDc1krIVlS40Q5p
	 OV77u0QGc6WuA==
Date: Fri, 28 Oct 2022 23:06:14 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Fabio Porcedda <fabio.porcedda@gmail.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org, loic.poulain@linaro.org,
	ryazanov.s.a@gmail.com, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, dnlplm@gmail.com
Subject: Re: [PATCH 2/2] bus: mhi: host: pci_generic: Add a secondary AT port
 to Telit FN990
Message-ID: <20221028173614.GH13880@thinkpad>
References: <20220916144329.243368-1-fabio.porcedda@gmail.com>
 <20220916144329.243368-3-fabio.porcedda@gmail.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220916144329.243368-3-fabio.porcedda@gmail.com>

On Fri, Sep 16, 2022 at 04:43:29PM +0200, Fabio Porcedda wrote:
> Add a secondary AT port using one of OEM reserved channel.
> 
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/host/pci_generic.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 51e2b901bae0..caa4ce28cf9e 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -507,6 +507,8 @@ static const struct mhi_channel_config mhi_telit_fn990_channels[] = {
>  	MHI_CHANNEL_CONFIG_DL(13, "MBIM", 32, 0),
>  	MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
>  	MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
> +	MHI_CHANNEL_CONFIG_UL(92, "DUN2", 32, 1),
> +	MHI_CHANNEL_CONFIG_DL(93, "DUN2", 32, 1),
>  	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0_MBIM", 128, 2),
>  	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0_MBIM", 128, 3),
>  };
> -- 
> 2.37.3
> 
> 

-- 
மணிவண்ணன் சதாசிவம்
