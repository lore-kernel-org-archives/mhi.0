Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692ED3C34
	for <mhi@lists.linux.dev>; Wed, 19 Apr 2023 13:07:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B53CEC433EF;
	Wed, 19 Apr 2023 13:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1681909631;
	bh=YmLLNnooYKJ+kjvndVyQn+zFBfXlr6gSe3EhJVjlMPQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YyY74T7Cj4Mq22xTjzvW3qcNNXYUZsylNY7MqkX12WaERE1nfxl79vgIYzwLGolTS
	 ppSAie5ltVQKu5Nl9/ZMrTQrW1KGBr4IIojYJP7xrihRuL4jgynHi6YllLp6y6kJCd
	 XDR2YJAg/EuF37/g4QupoCl6vTiSgrEQGSetBkoM=
Date: Wed, 19 Apr 2023 15:06:49 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev, slark_xiao@163.com, bhelgaas@google.com,
	quic_jhugo@quicinc.com, quic_vpernami@quicinc.com
Subject: Re: [GIT PULL] MHI changes for v6.4
Message-ID: <2023041941-curfew-clamp-5144@gregkh>
References: <20230417085357.GB2874@thinkpad>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230417085357.GB2874@thinkpad>

On Mon, Apr 17, 2023 at 02:23:57PM +0530, Manivannan Sadhasivam wrote:
> The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:
> 
>   Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git tags/mhi-for-v6.4

Pulled and pushed out, thanks.

greg k-h
