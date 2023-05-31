Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905A91773E
	for <mhi@lists.linux.dev>; Wed, 31 May 2023 16:14:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9031C433D2;
	Wed, 31 May 2023 16:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685549661;
	bh=6RH4/pBgsbAC05LP8D50C+A4mu6dMzmtCl1r1xnQ+9o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=o8UlYxkR0y/HeeDOhA2GR4zI6kbSvIr4KQJu46taFUI8fxmvS+8EQbHlsHF8cloan
	 zDvP6MSsVpdAf0T/vah7OcxuCtNoG3aowmPtl4Ac+RTufXuX8n3atxHgMqOUMuKYFS
	 ovj14hKG/XsXjWQ2n9Yy9Sor4dINaGYzn3UGY1gEuD/fyzYvqmuFFOzNAQtcodudmd
	 MWvXtC56Vsc3unlyZ4kaYUtCf0G+NZlqxk+/914W09SbynYVIzyMRPZ5iO33P15pwx
	 UxtImiV8UGDy/bAp6qgiok/qdzaDdIOww4PXHr4EnQgGcGxS3MHFXv2QShUtPofK1r
	 3G7thM3FPJ/Fw==
Date: Wed, 31 May 2023 09:14:19 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, Manivannan Sadhasivam
 <mani@kernel.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, <andersson@kernel.org>,
 <daniel@ffwll.ch>, <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Pranjal Ramajor Asha Kanojiya
 <quic_pkanojiy@quicinc.com>, Kalle Valo <kvalo@kernel.org>
Subject: Re: [PATCH] bus: mhi: host: Add userspace character interface
Message-ID: <20230531091419.5373352d@kernel.org>
In-Reply-To: <31c8a9ef-bc48-138d-836b-61efd9f4128f@quicinc.com>
References: <20230522190459.13790-1-quic_jhugo@quicinc.com>
	<20230531142803.GH7968@thinkpad>
	<2023053134-unpiloted-why-0f37@gregkh>
	<31c8a9ef-bc48-138d-836b-61efd9f4128f@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 31 May 2023 09:04:10 -0600 Jeffrey Hugo wrote:
> I think Mani I looking for some "guidance" on the "architecture", and 
> frankly so am I.  An official Ack from Jakub might not be quite the 
> right thing at this stage, but at-least Jakub could come in and say he 
> isn't planning on NACKing this right off the bat, in particular because 
> this functionality can be used by WWAN devices which seems to be what 
> caused the mess the last time around.
> 
> We've gone full circle here.  This functionality was proposed as part of 
> the bus.  Jakub came in an NACKed that, which resulted in the WWAN 
> subsystem and the guidance that this functionally belongs with the 
> devices.  I tried to put it with the AIC100/QAIC device based on that, 
> and that got NACKed by Daniel (GPU) saying that this belongs with the 
> bus.  You (Greg) seemed to agree with Daniel on that.
> 
> Fixing kernel robot tests is one thing (I haven't seen any reports on 
> this iteration), but if there is no agreement on where this lives, isn't 
> it DOA?
> 
> In summary, if you don't like this, please give some clear guidance. 
> Greg, you've told me in the past that you don't discuss "architecture" 
> without seeing the code.  Here is some code.  I don't claim it is 
> perfect (you mentioned the QAIC version had some issues you were going 
> to help with), but I would like to see some input.

Nothing changed here as far as I'm concerned.

But while I have you -- you should probably discuss your broader
engagement in the upstream community with someone like Greg. The right
balance between throwing code at us and supporting maintainers. 
I mean real maintainers of shared subsystems, not your own stuff.
