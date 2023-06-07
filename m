Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9094F34443
	for <mhi@lists.linux.dev>; Wed,  7 Jun 2023 12:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=vxfTgYTvjR4vsAsLPKP9hbUFFvdO+Zok6LWfAdaicIg=; b=SSAAPddHZLuJBrekKRW6gfcc6u
	kOxdHDKm/ctCPmObxy9qDVRIXmnYXyvn8H0v8svQKEP8biL+dtKir/K0APW0DagJ84EiaEAR/MAYu
	5WaGRZUaATym8UIazJyEDaiqgh97HJ7WOvjXn97ECYkKzjhRvisGMSPuXlGpyQdDkH74=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1q6sH6-00F90C-Ul; Wed, 07 Jun 2023 14:28:28 +0200
Date: Wed, 7 Jun 2023 14:28:28 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Loic Poulain <loic.poulain@linaro.org>, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Add MHI Endpoint network driver
Message-ID: <15c88e23-9a7f-4a8f-8337-8ab9d2485a18@lunn.ch>
References: <20230606123119.57499-1-manivannan.sadhasivam@linaro.org>
 <c769c95d-e8cb-4cf6-a41a-9bef5a786bb1@lunn.ch>
 <20230607065652.GA5025@thinkpad>
 <CAMZdPi-xJAj_eFvosVTmSzA99m3eYhrwoKPfBk-qH87yZzNupQ@mail.gmail.com>
 <20230607074118.GD5025@thinkpad>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230607074118.GD5025@thinkpad>

> > Yes, so there is already a drivers/net/wwan directory for this, in
> > which there are drivers for control and data path, that together
> > represent a given 'wwan' (modem) entity. So the generic mhi_net could
> > be moved there, but the point is AFAIU, that MHI, despite his name, is
> > not (more) used only for modem, but as a generic memory sharing based
> > transport protocol, such as virtio. It would then not be necessarily
> > true that a peripheral exposing MHI net channel is actually a modem?
> > 
> 
> Agree, mhi_*_net drivers can be used by non-modem devices too as long as they
> support MHI protocol.

O.K. I was just trying to avoid cluttering up the directory. But if
this is shared code, not actual drivers, this is fine.

Are there more features yet to be implemented? Would it make sense to
create a mhi directory?

       Andrew
