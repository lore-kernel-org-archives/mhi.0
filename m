Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68583264C1
	for <mhi@lists.linux.dev>; Fri,  3 Apr 2026 12:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775217720; cv=none; b=kzBZ/ElGrQjkPXgWVn4He6SN+b4Ymb8lW/4fx5y3QjaGkFVAqzcZk+nednWmwx5fwW2XDBnaoHstZvpkTwEdVSG8JBmfwtmNm3DpBaWbUD3GCiQHv6efSNj37M7Jo7v+S8G1Otbpii3n+U/0cLx/4J6V5wspNMWXSf1QLAS6o0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775217720; c=relaxed/simple;
	bh=j0KD0TaHbC2Dfv34YxrAsLY8ECdZULmU3aZ1MpE1LYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ydm4TsV2sef1CBW9FdxdOMECsUgX4Z0iX8FHEXpnnimOL7dRy9qeIsTyUv/7Dccc06UVz3DhwVjjo+UdylbPZtTQZ4S5A8SA3w2/ZqNA3xjkghsyqZNuWNlPNqvnzNQnOGZQ3QZR4fTwwozPKugkQnhCRsRX9l5Aan5OyUitCUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=pBbKrxDm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="pBbKrxDm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41010C19423;
	Fri,  3 Apr 2026 12:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775217720;
	bh=j0KD0TaHbC2Dfv34YxrAsLY8ECdZULmU3aZ1MpE1LYo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pBbKrxDmJrBTqZN473A+jUUVGhKUrXgTcy9bL0b4f41IdRAo8X0s0GuqvzmspGcp8
	 RaySYN/uiyGAMCU/URzMwB51PMXXjNArd2Ls0wXJ28i8ZUXd+0iczb11JTvdnsrQ5K
	 RpwhS15q7xHvwjyX47bUvtMHbpTwmY/HfmT8iRGU=
Date: Fri, 3 Apr 2026 14:01:57 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev
Subject: Re: [GIT PULL] MHI changes for v7.1
Message-ID: <2026040350-revisit-autograph-58b4@gregkh>
References: <atilimjgf7mu7optkqbrn36ekyxj27dw6kyqzelqqc3rgldlco@upwkfdqb72wq>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atilimjgf7mu7optkqbrn36ekyxj27dw6kyqzelqqc3rgldlco@upwkfdqb72wq>

On Fri, Apr 03, 2026 at 03:49:02PM +0530, Manivannan Sadhasivam wrote:
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git tags/mhi-for-v7.1
> 

Pulled and pushed out, thanks.

greg k-h
