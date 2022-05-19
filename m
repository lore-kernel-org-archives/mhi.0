Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BD728EE
	for <mhi@lists.linux.dev>; Thu, 19 May 2022 14:59:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1FB2C385AA;
	Thu, 19 May 2022 14:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1652972391;
	bh=Ncse05AeyeG8LbKqDothTn5Q6RJ3Y9c4/QPtdIOYUdk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oFqyYHTnf2q4ri1ads7c1J71xy93MeSmivuLNOMPMfRWv8jciEZJlQ2xnxwzsmErM
	 mRbkXhi1ya6KX5vj5wjirgHEvHYAqTA/h8L5Dkktp47f0BRQvUmeYWIc8KUtSGIfhM
	 3Y9hmRpDVoyRoBIWh/00qcUNvwg2eAGi1gpCZwLY=
Date: Thu, 19 May 2022 16:55:47 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: quic_hemantk@quicinc.com, slark_xiao@163.com, quic_jhugo@quicinc.com,
	Daniele.Palmas@telit.com, linux-arm-msm@vger.kernel.org,
	mhi@lists.linux.dev
Subject: Re: [GIT PULL] MHI changes for v5.19
Message-ID: <YoZac0UtQ3UJKYzw@kroah.com>
References: <20220510062120.GA9140@thinkpad>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220510062120.GA9140@thinkpad>

On Tue, May 10, 2022 at 11:51:20AM +0530, Manivannan Sadhasivam wrote:
> The following changes since commit 5d4be19cbe6aadfad0a5f40df91bd478cedd8344:
> 
>   bus: mhi: ep: Add uevent support for module autoloading (2022-04-04 10:17:51 +0530)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git tags/mhi-for-v5.19

Pulled and pushed out, thanks.

greg k-h
