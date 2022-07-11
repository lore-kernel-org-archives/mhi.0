Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664201365
	for <mhi@lists.linux.dev>; Mon, 11 Jul 2022 10:30:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCAFCC34115;
	Mon, 11 Jul 2022 10:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1657535412;
	bh=ZbfEGyOBZZpKOmypM6nUKM6rU6LyOqfZFRimTTSUg9Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PyIEsmMFXfwEsLjjcJUcEVKQceg710vl/zAerUe3urJFYb6CXSHSK3YxHi9/0/ZkA
	 QkgtyxIDTJiTWmQhPnIn/2jLfCThZ3uwmlcJwb+EVI2zbZJqNsxR7H9bLF1a92alTo
	 oI3nqt9jL6ZlQDLpJSYpn/OLTN+2Ptvjz5oX+zso=
Date: Mon, 11 Jul 2022 12:29:58 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: quic_hemantk@quicinc.com, slark_xiao@163.com, quic_jhugo@quicinc.com,
	bjorn.andersson@linaro.org, yonglin.tan@outlook.com,
	loic.poulain@linaro.org, mhi@lists.linux.dev,
	quic_qianyu@quicinc.com
Subject: Re: [GIT PULL] MHI changes for v5.20
Message-ID: <Ysv7pqNgbJOqhVD2@kroah.com>
References: <20220711062636.GS5063@thinkpad>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220711062636.GS5063@thinkpad>

On Mon, Jul 11, 2022 at 11:56:36AM +0530, Manivannan Sadhasivam wrote:
> The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:
> 
>   Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git tags/mhi-for-v5.20

Pulled and pushed out, thanks.

greg k-h
