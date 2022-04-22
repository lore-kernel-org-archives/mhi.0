Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF367A
	for <mhi@lists.linux.dev>; Fri, 22 Apr 2022 13:46:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0F67C385A4;
	Fri, 22 Apr 2022 13:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1650635194;
	bh=I7N7mXlIeYjI5hIjBZo40RuqRK7Suv5Air/qzKkySa4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pp2PCell+RYwCpfxPYhwQv5mwF241mC6CTMWu452Ndmn1D1DIPUzjmRGUy/EUj4sf
	 NsL9Se8+rQ8I889Uq5G3ji1e+DUyrCFAzQFjyhsIXmIreVEq76AUD/ubNrWXnG1HX9
	 WEE0WSM/lfUIEdbHAIoGnfbHO9Tm0QTExDStP6Wo=
Date: Fri, 22 Apr 2022 15:46:23 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev, quic_hemantk@quicinc.com, quic_bbhatt@quicinc.com,
	loic.poulain@linaro.org, linux-arm-msm@vger.kernel.org
Subject: Re: [GIT PULL] MHI fixes for v5.18
Message-ID: <YmKxr5TswPhLGo2d@kroah.com>
References: <20220413085954.GE2015@thinkpad>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220413085954.GE2015@thinkpad>

On Wed, Apr 13, 2022 at 02:29:54PM +0530, Manivannan Sadhasivam wrote:
> The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:
> 
>   Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git tags/mhi-fixes-v5.18

Now pulled and pushed out,t hanks.

greg k-h
