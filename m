Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE59F2115
	for <mhi@lists.linux.dev>; Sun, 29 Oct 2023 07:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TQ2qONwg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05E23C433C7;
	Sun, 29 Oct 2023 07:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698564414;
	bh=uYZ0ZTecbwG9eZxtH41/AOqKfSgaKhCo5Mf8mjz6D7c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TQ2qONwgXKKqTsrSV/Hb9SIWytl+57ZMdLKhC/qP3XC/8gezHNGgPCW6+kJGfmdNL
	 Ap/GnDmuLvLME+a4cz9N5hVm9wZlv5T0wEfREm1C4zAqUIfMid0L+M79BfBJFT2TP8
	 FPZ5zmtaYWnZ0dqcmk0W5h26hYC93HrJ6/DooKy+yXNmDJHaeRhPJ8pHux+m7VFbG+
	 Rt7uqIN2DijuOlCIfQPYXLDeGKGvOk1Z0xqxKQoePYQWVcTt0vLuUjW5a7jYw0gAE7
	 +7vz1tu+y5Bw5//2CTMw4Nd/2O9KIPAnkGNLf17ow+wfAgtToEWcJjxSwYvETZdnuT
	 Pdiv52w/cyHWQ==
Date: Sun, 29 Oct 2023 12:56:45 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: Krishna chaitanya chundru <quic_krichai@quicinc.com>,
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_vbadigan@quicinc.com,
	quic_ramkri@quicinc.com, quic_skananth@quicinc.com,
	quic_parass@quicinc.com
Subject: Re: [PATCH] bus: mhi: host: Add alignment check for event ring read
 pointer
Message-ID: <20231029072645.GA2481@thinkpad>
References: <20231023-alignment_check-v1-1-2ca5716d5c15@quicinc.com>
 <20231027130947.GD17527@thinkpad>
 <27609135-af23-68b3-0c2c-b4f0c40963d0@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <27609135-af23-68b3-0c2c-b4f0c40963d0@quicinc.com>

On Fri, Oct 27, 2023 at 08:19:44AM -0600, Jeffrey Hugo wrote:
> On 10/27/2023 7:09 AM, Manivannan Sadhasivam wrote:
> > On Mon, Oct 23, 2023 at 03:13:06PM +0530, Krishna chaitanya chundru wrote:
> > > Though we do check the event ring read pointer by "is_valid_ring_ptr"
> > > to make sure it is in the buffer range, but there is another risk the
> > > pointer may be not aligned.  Since we are expecting event ring elements
> > > are 128 bits(struct mhi_tre) aligned, an unaligned read pointer could lead
> > 
> > "mhi_tre" got renamed to "mhi_ring_element"
> > 
> > > to multiple issues like DoS or ring buffer memory corruption.
> > > 
> > > So add a alignment check for event ring read pointer.
> > > 
> > 
> > Since this is a potential fix, you should add the fixes tag and CC stable.
> > 
> > > Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
> > > ---
> > >   drivers/bus/mhi/host/main.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
> > > index 499590437e9b..c907bbb67fb2 100644
> > > --- a/drivers/bus/mhi/host/main.c
> > > +++ b/drivers/bus/mhi/host/main.c
> > > @@ -268,7 +268,7 @@ static void mhi_del_ring_element(struct mhi_controller *mhi_cntrl,
> > >   static bool is_valid_ring_ptr(struct mhi_ring *ring, dma_addr_t addr)
> > >   {
> > > -	return addr >= ring->iommu_base && addr < ring->iommu_base + ring->len;
> > > +	return addr >= ring->iommu_base && addr < ring->iommu_base + ring->len && addr % 16 == 0;
> > 
> > How about,
> > 
> > !(addr % 16)
> 
> We are guaranteed that the ring allocation is 16 byte aligned, right?
> 
> I think using "struct mhi_ring_element" instead of "16" would be better.
> 
> I'm also thinking that perhaps doing a bit-wise & with a mask would be
> better than the % operator.  Not only is that how these alignment checks
> seem to normally be done elsewhere, but this check is in a critical patch
> for the MHI stack.
> 

Yes, both of your suggestions sounds good to me.

Chaitanya, please use below check:

	!(addr & (sizeof(struct mhi_ring_element) - 1))

- Mani

> -Jeff
> 

-- 
மணிவண்ணன் சதாசிவம்
