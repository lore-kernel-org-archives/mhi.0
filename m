Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9B72CA0
	for <mhi@lists.linux.dev>; Tue,  7 Dec 2021 15:59:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63153C341C3;
	Tue,  7 Dec 2021 15:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1638892791;
	bh=jXPELv0o2jpQFlhHf8mOp3vr/2KfUVmH5k+AGH8oqas=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=P1SHtTcPedW9bZhHNJtQt46bAJLPlvrIsAGRGkbfeJtYlFnmzaPAVev7rvsSOSvae
	 V5NKnebwOmakTfN1Cpag7YSpydo49rg3bimXTFdYUOOgP3WtH2PIEILs9HSEZCd2pk
	 3n9V2D8jVWZyhQFmLnNeUcRcNG1pu4bQElxFzI+smujwnHpU4Phxqck0HiyFWaKyAg
	 AaqO+gSGz7gXYurDe9Fd4s+6BPk78+QBvUT/+b6/SsVAFEILETsu5wlNKyP8QYSEdn
	 5hgwhQrh/E7k/Bn3YzXCD2lJaXE8VxKVkb8NGFeKsg6ny+2w6pDvJRWg519xZJtON9
	 f7k86qgHx9Qeg==
Date: Tue, 7 Dec 2021 07:59:50 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: "David S . Miller" <davem@davemloft.net>, loic.poulain@linaro.org,
 hemantk@codeaurora.org, bbhatt@codeaurora.org,
 linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, mhi@lists.linux.dev
Subject: Re: [PATCH v2] bus: mhi: core: Add an API for auto queueing buffers
 for DL channel
Message-ID: <20211207075950.243a5099@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20211207071939.GA70121@thinkpad>
References: <20211207071339.123794-1-manivannan.sadhasivam@linaro.org>
	<20211207071939.GA70121@thinkpad>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 7 Dec 2021 12:49:39 +0530 Manivannan Sadhasivam wrote:
> On Tue, Dec 07, 2021 at 12:43:39PM +0530, Manivannan Sadhasivam wrote:
> > Add a new API "mhi_prepare_for_transfer_autoqueue" for using with client
> > drivers like QRTR to request MHI core to autoqueue buffers for the DL
> > channel along with starting both UL and DL channels.
> > 
> > So far, the "auto_queue" flag specified by the controller drivers in
> > channel definition served this purpose but this will be removed at some
> > point in future.
> > 
> > Cc: netdev@vger.kernel.org
> > Cc: Jakub Kicinski <kuba@kernel.org>
> > Cc: David S. Miller <davem@davemloft.net>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Co-developed-by: Loic Poulain <loic.poulain@linaro.org>
> > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> > 
> > Changes in v2:
> > 
> > * Rebased on top of 5.16-rc1
> > * Fixed an issue reported by kernel test bot
> > * CCed netdev folks and Greg  
> 
> Dave, Jakub, this patch should go through the MHI tree. Since it touches the
> QRTR driver, can you please give an ACK?

Acked-by: Jakub Kicinski <kuba@kernel.org>
