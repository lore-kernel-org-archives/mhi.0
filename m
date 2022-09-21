Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BCBB33D4
	for <mhi@lists.linux.dev>; Wed, 21 Sep 2022 13:44:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7117BC433C1;
	Wed, 21 Sep 2022 13:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1663767852;
	bh=hmhsHQePgD2p97l1hG73pA2cEhHyHxMvPkle5HMvCkw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V4VYN11WC98r1nAe95xaKlu2UvqUxSzDaD1mN6sVS6y3VuuMLqwngaqqVbMIbHlW1
	 /fgBSKIEjDOIiVPUhy5kQ78nn6qtqHmrY7Kj9aQxl1zfs1fenwp/BTOhJKuVFZY+6H
	 dy26nPaed1q2bZG1/PCFLHPW38kByRGKkbXbHEVo=
Date: Wed, 21 Sep 2022 15:44:09 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: quic_hemantk@quicinc.com, mhi@lists.linux.dev,
	koen.vandeputte@citymesh.com
Subject: Re: [GIT PULL] MHI changes for v6.1
Message-ID: <YysVKY/tqXYpgfGW@kroah.com>
References: <20220916081826.GA11659@workstation>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220916081826.GA11659@workstation>

On Fri, Sep 16, 2022 at 01:48:26PM +0530, Manivannan Sadhasivam wrote:
> The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:
> 
>   Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git tags/mhi-for-v6.1

Pulled and pushed out, thanks.

greg k-h
