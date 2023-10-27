Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A7A1EB21
	for <mhi@lists.linux.dev>; Fri, 27 Oct 2023 13:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G25oaFNa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34CF2C433C8;
	Fri, 27 Oct 2023 13:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698412195;
	bh=ZA9QL0wYMLCYEhOsjcHlvzJu91FPv2hS+uVz87gy3KM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G25oaFNa5d0RlVB326zTSZmQveUM9k9rlxLyOJzowBX/Pk2zKwMy/37KjYoFKaTmN
	 Nbd+y7Zhxw7kyKVYQMz4QTpybNh3JHeq+At24+qPvqLNjk9mLL7ix5HswnJjyIjKH/
	 qRl4ydtqaASZVKrBQzhLKjz57QMYi/s+/fE5jrelFPgeCxIzaGGNWHSjkgbGfm5HF3
	 XVD9+AEyg2dmWz29aq4OXwXgMJMm4jma09jMc6bbIBwfFqVTaldhvFXnwlGdJtpNPM
	 S8/e61cX9swx6N+tu8GbYp5+6NKlNHZjZkp0+Jfh3U4K+N0Q+gzKeDVp/RL+p1Rw9a
	 9p87fc5yLVw3A==
Date: Fri, 27 Oct 2023 18:39:47 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krishna chaitanya chundru <quic_krichai@quicinc.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_vbadigan@quicinc.com,
	quic_ramkri@quicinc.com, quic_skananth@quicinc.com,
	quic_parass@quicinc.com
Subject: Re: [PATCH] bus: mhi: host: Add alignment check for event ring read
 pointer
Message-ID: <20231027130947.GD17527@thinkpad>
References: <20231023-alignment_check-v1-1-2ca5716d5c15@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231023-alignment_check-v1-1-2ca5716d5c15@quicinc.com>

On Mon, Oct 23, 2023 at 03:13:06PM +0530, Krishna chaitanya chundru wrote:
> Though we do check the event ring read pointer by "is_valid_ring_ptr"
> to make sure it is in the buffer range, but there is another risk the
> pointer may be not aligned.  Since we are expecting event ring elements
> are 128 bits(struct mhi_tre) aligned, an unaligned read pointer could lead

"mhi_tre" got renamed to "mhi_ring_element"

> to multiple issues like DoS or ring buffer memory corruption.
> 
> So add a alignment check for event ring read pointer.
> 

Since this is a potential fix, you should add the fixes tag and CC stable.

> Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
> ---
>  drivers/bus/mhi/host/main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
> index 499590437e9b..c907bbb67fb2 100644
> --- a/drivers/bus/mhi/host/main.c
> +++ b/drivers/bus/mhi/host/main.c
> @@ -268,7 +268,7 @@ static void mhi_del_ring_element(struct mhi_controller *mhi_cntrl,
>  
>  static bool is_valid_ring_ptr(struct mhi_ring *ring, dma_addr_t addr)
>  {
> -	return addr >= ring->iommu_base && addr < ring->iommu_base + ring->len;
> +	return addr >= ring->iommu_base && addr < ring->iommu_base + ring->len && addr % 16 == 0;

How about,

!(addr % 16)

- Mani

>  }
>  
>  int mhi_destroy_device(struct device *dev, void *data)
> 
> ---
> base-commit: 71e68e182e382e951d6248bccc3c960dcec5a718
> change-id: 20231013-alignment_check-c013f509d24a
> 
> Best regards,
> -- 
> Krishna chaitanya chundru <quic_krichai@quicinc.com>
> 

-- 
மணிவண்ணன் சதாசிவம்
