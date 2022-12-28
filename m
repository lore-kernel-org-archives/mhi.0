Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67E81C15
	for <mhi@lists.linux.dev>; Wed, 28 Dec 2022 16:38:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B62CC433EF;
	Wed, 28 Dec 2022 16:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672245529;
	bh=dDnY3wRztTKr0OcgKmHKxVAcVtt3OZXQNLc3H5C1ETU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZBF+xW8BhVcek8aX5aFPlH++CFTn2oEXi/sNH1fnFl7Ub7Dbo9utFn9ro6Ho2Y/Cn
	 314+J1gbOq7PCz17KxLzhKsrc/zXsxQRmzuD30jTmC2Ouoh0U5/PeT3MeRaLZPZMoL
	 VNwwQi4wwkTeCBtIgLk/Cdn9QlozmGG9jhZR9A364K+6dLXnImx1IR5d4hCze+TnoY
	 GpvjK0oE2bxUxrooqAMGKMoy1blPKz5j5i+xeilh9NJfBDbfCzXHJXMwGH3V3VhJAU
	 QTGMaXJZeyqld5uGZhLMCHJWKzdwnBTLxuWymGQZ2qMlFxQ+tZS4D4biE4Mkhhru6w
	 kpy84LqRKcpKg==
Date: Wed, 28 Dec 2022 22:08:34 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Carl Vanderlip <quic_carlv@quicinc.com>
Cc: Hemant Kumar <quic_hemantk@quicinc.com>,
	Jeffrey Hugo <quic_jhugo@quicinc.com>, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mhi: Update Makefile to used Kconfig flags
Message-ID: <20221228163834.GA256211@thinkpad>
References: <20221207192613.2098614-1-quic_carlv@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221207192613.2098614-1-quic_carlv@quicinc.com>

On Wed, Dec 07, 2022 at 11:26:13AM -0800, Carl Vanderlip wrote:
> Makefile was always suggesting to build subdirectories regardless of
> Kconfig. Use the Kconfig flags as intended.
> 
> Signed-off-by: Carl Vanderlip <quic_carlv@quicinc.com>

Applied to mhi-next!

Thanks,
Mani

> ---
>  drivers/bus/mhi/Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bus/mhi/Makefile b/drivers/bus/mhi/Makefile
> index 46981331b38f..354204b0ef3a 100644
> --- a/drivers/bus/mhi/Makefile
> +++ b/drivers/bus/mhi/Makefile
> @@ -1,5 +1,5 @@
>  # Host MHI stack
> -obj-y += host/
> +obj-$(CONFIG_MHI_BUS) += host/
>  
>  # Endpoint MHI stack
> -obj-y += ep/
> +obj-$(CONFIG_MHI_BUS_EP) += ep/
> -- 
> 2.25.1
> 

-- 
மணிவண்ணன் சதாசிவம்
