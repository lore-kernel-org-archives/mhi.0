Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFFD2C80
	for <mhi@lists.linux.dev>; Tue, 19 Oct 2021 14:49:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 381D16113B;
	Tue, 19 Oct 2021 14:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634654959;
	bh=0OS/s46lR2Awtpfj/hGOc+R4Sdkv5+rXnzDTg/BRwB4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Vd6Ha4tQXrNveT4bc4ySYtTHLpDHyp4KWSiBuSGBwtkb2cRuusgz8vMLpE8aHplzt
	 XC1AuDiPvpom4Harma8qtZejy3AKvzWmVj0PfIFOHsqnP8kXc2ErU27NNI3hM2TEWZ
	 WaXz60eWi7Yg0KtVtq8Ag3cHmOrcDO5AhJ8LoIC3rgXVKzNRQKuOPKJb9aSjiEUOYD
	 s8xxQ4vLfpHIJhOzqgIS1blMuJifg9umxCJib2mAub7xGbAkrdJ+F32W+inBVTajbD
	 YmZq2HxgMF7RYriNxzazyYmSiQUoiUVHTLP7qr1shgz0aA1JURpZcNf8sWuHtmKXz5
	 G9STamV6ZS/sg==
Date: Tue, 19 Oct 2021 07:49:18 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev, loic.poulain@linaro.org, hemantk@codeaurora.org,
 bbhatt@codeaurora.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, Greg KH
 <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] bus: mhi: Add mhi_prepare_for_transfer_autoqueue API
 for DL auto queue
Message-ID: <20211019074918.5b498937@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20211019134451.174318-1-manivannan.sadhasivam@linaro.org>
References: <20211019134451.174318-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 19 Oct 2021 19:14:51 +0530 Manivannan Sadhasivam wrote:
> Add a new API "mhi_prepare_for_transfer_autoqueue" for using with client
> drivers like QRTR to request MHI core to autoqueue buffers for the DL
> channel along with starting both UL and DL channels.
> 
> So far, the "auto_queue" flag specified by the controller drivers in
> channel definition served this purpose but this will be removed at some
> point in future.
> 
> Cc: netdev@vger.kernel.org
> Co-developed-by: Loic Poulain <loic.poulain@linaro.org>
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
> 
> Dave, Jakub: This patch should go through MHI tree. But since the QRTR driver
> is also modified, this needs an Ack from you.

CCing us wouldn't hurt.

Speaking of people who aren't CCed I've seen Greg nack the flags
argument.

SMH
