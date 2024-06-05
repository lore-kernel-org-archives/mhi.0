Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89815225D9
	for <mhi@lists.linux.dev>; Wed,  5 Jun 2024 06:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717567721; cv=none; b=eICP4AHm7WRF6lXry/DyAMsf04y9EcJvHCeTXf+tQ2PJ3DMEhNVAavqylrMoqFamtPU8QlaxBp+IBl/ION+SsyTm1uhXoaMSl2Aw3BzfIjuug3NKDJLztsxMNs1BauiGFQCVrJ1ihQEsLEY1hzx2EjhNU2pzghZLKkOwAkR1IMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717567721; c=relaxed/simple;
	bh=5Zcxv0ZP57kj/ckxvrLGq5oOcDSqMDlcwvRBuOq9mjA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MenE3v+zSUivw1EqUqIAX9KsThFOum3yqEbPRA8MxfLeupkPRaAQP5E4q1PNee5kwIboUjiTJkG/X2dMsgYzxWms5hj/KXedsIZ38JBmIRqdC6On3lPsY53JSV/HK/Dcj0OkBCC9OXzzGH8hmpG6Mp2B+nGZFuZS1cBzfnNJptw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sm6vv8RF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sm6vv8RF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E0C1C32781;
	Wed,  5 Jun 2024 06:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717567720;
	bh=5Zcxv0ZP57kj/ckxvrLGq5oOcDSqMDlcwvRBuOq9mjA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sm6vv8RFubKPgdNPZmEHXGf+r1G4xDa+l0aj60dTA9trWjbLDNrtJFjkAZV9XQ245
	 yC5RdTKkTQvXKXA4r+fwc+Nc/ntQik19cm7imMdXqATiZTXx7WPoPSKAyilsmmyN/r
	 vKZWB4u9Q3ZZF1nDT/QhlZ3rwlG+2H+sFgXUyDN2ZP+Qc0oeTQx8OTf4QNyfXtqlHR
	 90GRmnyavN/onCHCYPjAQReapBqUF671y22rQn0KVQNYs0viYv8z4gkn+F2M3u/GuE
	 R6s+hE2DfRkMk7MCRQShHIbe9PGiAMKjnH22fkEaF2bqRfCaP1sq0OWE2YbkOY0gxb
	 tVN5LnM2Z59+A==
Date: Wed, 5 Jun 2024 11:38:27 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Martin =?iso-8859-1?Q?F=E4cknitz?= <faecknitz@hotsplots.de>
Cc: Martin =?iso-8859-1?Q?F=E4cknitz?= <faecknitz@hotsplots.de>,
	mhi@lists.linux.dev, loic.poulain@linaro.org
Subject: Re: [PATCH v2] net: mhi: set skb mac header before entering RX path
Message-ID: <20240605060827.GF2417@thinkpad>
References: <20240517211909.27874-1-faecknitz@hotsplots.de>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240517211909.27874-1-faecknitz@hotsplots.de>

+ Loic

On Fri, May 17, 2024 at 11:19:09PM +0200, Martin Fäcknitz wrote:
> skb->mac_header must be set before passing the skb to the network stack,
> because skb->mac_len is calculated from skb->mac_header in
> __netif_receive_skb_core.
> 
> Some network stack components, like xfrm, are using skb->mac_len to
> check for an existing MAC header, which doesn't exist in this case. This
> leads to memory corruption.
> 
> Fixes: 7ffa7542eca6 ("net: mhi: Remove MBIM protocol")

Change looks good to me, but I fail to find the relationship with Fixes tag.

- Mani

> Signed-off-by: Martin Fäcknitz <faecknitz@hotsplots.de>
> ---
> v2: - add "Fixes" tag
>     - CC maintainers
> 
>  drivers/net/mhi_net.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/net/mhi_net.c b/drivers/net/mhi_net.c
> index ae169929a9d8..e432efddcb22 100644
> --- a/drivers/net/mhi_net.c
> +++ b/drivers/net/mhi_net.c
> @@ -221,6 +221,8 @@ static void mhi_net_dl_callback(struct mhi_device *mhi_dev,
>  			break;
>  		}
>  
> +		skb_reset_mac_header(skb);
> +
>  		u64_stats_update_begin(&mhi_netdev->stats.rx_syncp);
>  		u64_stats_inc(&mhi_netdev->stats.rx_packets);
>  		u64_stats_add(&mhi_netdev->stats.rx_bytes, skb->len);
> -- 
> 2.11.0
> 
> 

-- 
மணிவண்ணன் சதாசிவம்
