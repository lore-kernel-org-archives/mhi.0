Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B012F3D
	for <mhi@lists.linux.dev>; Mon,  6 Nov 2023 05:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pzuf0q66"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EDF4C433C8;
	Mon,  6 Nov 2023 05:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699250210;
	bh=iQ8rLc2OhgNXSJULSr40kFTVSenEwezrcQ5xAm1ghiM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pzuf0q66fmANs8oRPEq0TATr2K8GV5S2G9hAs5rUeUUyb0IsLZ5NZegrZFx4GaeSN
	 etNSA2o8BQTsFeXfJNCRLUzgYASkMyjzbWSpxsGiRWpMzhUzAkXWCf+Hp8GTilIrAm
	 TtsLp5c0OPbBOUCg+HG6xoNDucS5AdVGLA1RqtwoGvMW0MERnhYo2drMhgkgr8gLhq
	 NP0v45b9BgT6pULyNyLMVoIlTHrlposHxGtj81+ZuVvhapqGKR1Sjv5uGdckOKi2jM
	 XjvUOfwJgqXmCmFhmidRqqcZYNSt6ZfCk4xDox5fUk+B/2qYkqWUS5gYGMve+SLT5L
	 PQgmMFRrxpuxA==
Date: Mon, 6 Nov 2023 11:26:45 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Tyler Stachecki <stachecki.tyler@gmail.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Add support for Sierra
 Wireless EM9291
Message-ID: <20231106055645.GF2474@thinkpad>
References: <20231105150510.96136-1-stachecki.tyler@gmail.com>
 <ZUewrgy0acOUkSAk@luigi.stachecki.net>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZUewrgy0acOUkSAk@luigi.stachecki.net>

On Sun, Nov 05, 2023 at 10:11:42AM -0500, Tyler Stachecki wrote:
> On Sun, Nov 05, 2023 at 10:05:10AM -0500, Tyler J. Stachecki wrote:
> > Add support for the Sierra Wireless EM9291 modem.
> > Empirically, it seems to use the same configuration as
> > EM9191.
> > 
> > $ lspci -vv
> > 03:00.0 Unassigned class [ff00]: Qualcomm Device 0308
> >         Subsystem: Device 18d7:0301
> > 
> >
> 
> Hi Mani,
> 
> I just want to highlight "empirically" here. I do not have
> access to the IP which confirms proper MHI configuration
> here. Given that, not sure it is appropriate for submission
> to the kernel.
> 
> However, without these changes, AT is not exposed and QMI
> submissions time out -- so better than nothing...?
> 

Yes, and that's how some other modem support is added as well. So it is totally
fine.

Thanks for the patch!

- Mani

> Regards,
> Tyler
> 

-- 
மணிவண்ணன் சதாசிவம்
