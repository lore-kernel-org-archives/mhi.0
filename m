Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62F110FF
	for <mhi@lists.linux.dev>; Fri,  3 Feb 2023 06:01:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3311DC433D2;
	Fri,  3 Feb 2023 06:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1675404113;
	bh=CXLLgaMNhOK4Rqa6fGucfVWnNO/Xel7uSctFnOis6YU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AWQmPbqTydg9rf3hyLD8gik85NhncjGg1drff4ZJ/PI+RS2GJOgy0BsKAlDLSGEY8
	 DSYfutMeeboxhk+CX6jXEHEpBIUzl5AcmPbZmEQaWo7ad/kxphG5V6VdcMWP4Rj2j7
	 Igmwej1iRnQf0ttFlTyHjcGIlvL8CdC3GaYUzlxc=
Date: Fri, 3 Feb 2023 07:01:43 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev, quic_carlv@quicinc.com, slark_xiao@163.com,
	error27@gmail.com
Subject: Re: [GIT PULL v2] MHI changes for v6.3
Message-ID: <Y9yjR8QLQZGE5C5I@kroah.com>
References: <20230202172638.GA257939@thinkpad>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230202172638.GA257939@thinkpad>

On Thu, Feb 02, 2023 at 10:56:38PM +0530, Manivannan Sadhasivam wrote:
> The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:
> 
>   Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git tags/mhi-for-v6.3

Pulled and pushed out, thanks.

greg k-h
