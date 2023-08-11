Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FE28468
	for <mhi@lists.linux.dev>; Fri, 11 Aug 2023 19:28:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31CCCC433C7;
	Fri, 11 Aug 2023 19:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1691782086;
	bh=3R9Yhu+z/uyEQBFvs4po5sYZd35Gq3938zLFLxd9qOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XV9AMzek6Wum/53pZscTg+0e6M5MBB+mfLtvuo/m4CbpdrcIWF1wGDySxV8WAY/w/
	 dVuT2mDhW9FcWd6eC3Z/889UUyJfcPnm7O1rDuafiVLOswdSAoNEFraQqdz9dsaGEo
	 lLkE5XEQ6QiMzV0v8vOJG1NS39WNzrr1Ye+OALAY=
Date: Fri, 11 Aug 2023 21:27:07 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev, quic_qianyu@quicinc.com, duke_xinanwen@163.com,
	slark_xiao@163.com, Julia.Lawall@inria.fr, arnd@arndb.de,
	dnlplm@gmail.com, quic_jhugo@quicinc.com
Subject: Re: [GIT PULL] MHI changes for v6.6
Message-ID: <2023081159-handstand-swarm-3b40@gregkh>
References: <20230811153120.GD5296@thinkpad>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230811153120.GD5296@thinkpad>

On Fri, Aug 11, 2023 at 09:01:20PM +0530, Manivannan Sadhasivam wrote:
> The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:
> 
>   Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git tags/mhi-for-v6.6
> 

Pulled and pushed out, thanks.

greg k-h
