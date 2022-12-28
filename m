Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E4C1C08
	for <mhi@lists.linux.dev>; Wed, 28 Dec 2022 16:30:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDB8AC433F1;
	Wed, 28 Dec 2022 16:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672245027;
	bh=iGjvJo5vRjcbgBQp34y2hybXCH+JoUYSL42xqvXPfvw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UQrCsr/RZHU8WhGxbbMw5kQXQ8pbfiGMj50E9vQrHbeAa51eX9FMvWp8Z+huZOvj+
	 BTDjzbUqzkM1N3CfmhZyZmc7qVGVR9oOh1kMtYJRlb7FGgWC0Ahh3HWmV5BsYe+rGJ
	 eQHI+gCElnv37QkT0RnzrZzC3kRVMAUDdwD2MlS+XwcooP7459FkXY3ud/bRlq0xCH
	 S8aJR0uXHAt2zgkk+gg4Kh0JUacFDylKYH+MFBS+HEcnc6b9Tmqjs3WzuV7NPiEe//
	 ooqIfFmpEB3TMqNps1WCA7kbqOpZ8KHNmHeNXIbdl7rhhVf03lIq+ph0D3NwqPPpuO
	 Cs32X27bfI3BA==
Date: Wed, 28 Dec 2022 22:00:15 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Carl Vanderlip <quic_carlv@quicinc.com>
Cc: Hemant Kumar <quic_hemantk@quicinc.com>,
	Jeffrey Hugo <quic_jhugo@quicinc.com>, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mhi: Update Makefile to used Kconfig flags
Message-ID: <20221228163015.GE30143@thinkpad>
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

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

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
