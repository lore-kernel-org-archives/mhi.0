Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785975CB4
	for <mhi@lists.linux.dev>; Mon,  7 Nov 2022 11:59:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38F93C433D6;
	Mon,  7 Nov 2022 11:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667822347;
	bh=QE8Fn7H4/EmMivLBMWUdLxjL/asG3QuY6BpNL6Z7yrU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=trnW9HyS8GKkvDFdYK9F+h09a+VSpzs2Fg9oE2WrZNLTAoTdhtVGyGW4HbSZkQVxw
	 BiSz6IFpRuoYKaZYUcwwexw1yUSPEDdrzWnMHEferVh8wwjgYtAsKHVRvO4fDEVwEs
	 xbtPIp9zoXM5yRxgExxNfkADEpelS8mk7A9aQxwvN5cOVs7G+u1OrdeF9ISJqjMMN3
	 nLURk5wFROOlJBgtIZmeYHokUtZPOhpSNw/M/OvgwSsXaCFp2tYhXR75rii86GoE04
	 9rQPJeZakMtE9PeMVzeFS2ikmj9YP+QNA5ugu3+/Zr5HaSlxMyMTlPMn8TVa68BLZ+
	 GR2xlKFQJ9opw==
Date: Mon, 7 Nov 2022 17:28:56 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Daniele Palmas <dnlplm@gmail.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	Network Development <netdev@vger.kernel.org>,
	loic.poulain@linaro.org
Subject: Re: MHI DTR client implementation
Message-ID: <20221107115856.GE2220@thinkpad>
References: <CAGRyCJGWQagceLhnECBcpPfG5jMPZrjbsHrio1BvgpZJhk0pbA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGRyCJGWQagceLhnECBcpPfG5jMPZrjbsHrio1BvgpZJhk0pbA@mail.gmail.com>

+ Loic

On Tue, Sep 20, 2022 at 04:23:25PM +0200, Daniele Palmas wrote:
> Hello all,
> 
> I'm looking for some guidance related to  a possible MHI client for
> serial ports signals management implementation.
> 
> Testing the AT channels with Telit modems I noted that unsolicited
> indications do not show: the root cause for this is DTR not set for
> those ports through MHI channels 18/19, something that with current
> upstream code can't be done due to the missing DTR client driver.
> 
> I currently have an hack, based on the very first mhi stack submission
> (see https://lore.kernel.org/lkml/1524795811-21399-2-git-send-email-sdias@codeaurora.org/#Z31drivers:bus:mhi:core:mhi_dtr.c),
> solving my issue, but I would like to understand which would be the
> correct way, so maybe I can contribute some code.
> 
> Should the MHI DTR client be part of the WWAN subsystem?

Yes, since WWAN is going to be the consumer of this channel, it makes sense to
host the client driver there.

> If yes, does it make sense to have an associated port exposed as a char
> device?

If the goal is to control the DTR settings from userspace, then you can use
the "AT" chardev node and handle the DTR settings in this client driver.
Because at the end of the day, user is going to read/write from AT port only.
Adding one more ctrl port and have it configured before using AT port is going
to be a pain.

Thanks,
Mani

> I guess the answer is no, since it should be used just by the AT ports
> created by mhi_wwan_ctrl, but I'm not sure if that's possible.
> 
> Or should the DTR management be somehow part of the MHI stack and
> mhi_wwan_ctrl interacts with that through exported functions?
> 
> Thanks a lot in advance,
> Daniele
> 

-- 
மணிவண்ணன் சதாசிவம்
