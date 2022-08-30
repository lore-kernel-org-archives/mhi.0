Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9173200
	for <mhi@lists.linux.dev>; Tue, 30 Aug 2022 14:14:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DB2BC433D6;
	Tue, 30 Aug 2022 14:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1661868853;
	bh=eZmfxn8DKm9TEyfxpCTgawLsAGxOeSx606q64xmYtyA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mC3Pe+sGNrjs3P6obmnasA/e3qaGTSS4qeqH1nz4ZAJIBP1G78sIDfpBwwLWeooEg
	 BCjp3NTiTIUt5vBrkEfo/9aJrMJT5Z13oVNg0BKtKykClpAN+JajW8c3s1QO6KscUt
	 6RiVeRM8YxpYkSwOus54IwHQMF3C0sdWTwqtgeZM=
Date: Tue, 30 Aug 2022 16:14:10 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: quic_hemantk@quicinc.com, mhi@lists.linux.dev,
	ath11k@lists.infradead.org, kvalo@kernel.org
Subject: Re: [GIT PULL] MHI fixes for v6.0
Message-ID: <Yw4bMnBxLFEzeFUF@kroah.com>
References: <20220829171746.GA84334@thinkpad>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220829171746.GA84334@thinkpad>

On Mon, Aug 29, 2022 at 10:47:46PM +0530, Manivannan Sadhasivam wrote:
> The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:
> 
>   Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git tags/mhi-fixes-for-v6.0

Pulled and pushed out, thanks.

greg k-h
