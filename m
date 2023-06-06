Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B4615AD1
	for <mhi@lists.linux.dev>; Tue,  6 Jun 2023 13:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=JBzFOAQ3XIEwIfPf6gzDHs3g12s3r3/k8QYv78kFr9Q=; b=iJ1GBZU7395iT/S0hTb4/CFA8+
	epY/qHDWZSXzrOrO2QucaB9FHlqgHXvlVh3wnykYMiF7GZ+5Bx/xn13fNR+b062vjpD6k2Hn7VLXo
	4bmiea3UoRMbpk7VOeT4HDObgGm1M/qcW9jR+6HIE46xmOGsfwP8qqCD5Uwu1xYx22ms=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1q6WH6-00F1Mf-AK; Tue, 06 Jun 2023 14:59:00 +0200
Date: Tue, 6 Jun 2023 14:59:00 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, loic.poulain@linaro.org
Subject: Re: [PATCH 0/3] Add MHI Endpoint network driver
Message-ID: <c769c95d-e8cb-4cf6-a41a-9bef5a786bb1@lunn.ch>
References: <20230606123119.57499-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230606123119.57499-1-manivannan.sadhasivam@linaro.org>

On Tue, Jun 06, 2023 at 06:01:16PM +0530, Manivannan Sadhasivam wrote:
> Hi,
> 
> This series adds a network driver for the Modem Host Interface (MHI) endpoint
> devices that provides network interfaces to the PCIe based Qualcomm endpoint
> devices supporting MHI bus (like Modems). This driver allows the MHI endpoint
> devices to establish IP communication with the host machines (x86, ARM64) over
> MHI bus.
> 
> On the host side, the existing mhi_net driver provides the network connectivity
> to the host.
> 
> - Mani
> 
> Manivannan Sadhasivam (3):
>   net: Add MHI Endpoint network driver
>   MAINTAINERS: Add entry for MHI networking drivers under MHI bus
>   net: mhi: Increase the default MTU from 16K to 32K
> 
>  MAINTAINERS              |   1 +
>  drivers/net/Kconfig      |   9 ++
>  drivers/net/Makefile     |   1 +
>  drivers/net/mhi_ep_net.c | 331 +++++++++++++++++++++++++++++++++++++++
>  drivers/net/mhi_net.c    |   2 +-

Should we add a drivers/net/modem directory? Maybe modem is too
generic, we want something which represents GSM, LTE, UMTS, 3G, 4G,
5G, ... XG etc.

    Andrew
