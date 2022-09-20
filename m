Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0D82570
	for <mhi@lists.linux.dev>; Tue, 20 Sep 2022 23:20:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4C5A9C433C1;
	Tue, 20 Sep 2022 23:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663716018;
	bh=cwJ91/WCrSqTfzYkTEPlmknGrSqqPyLSdr6saopSYNw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Q4ayZyunP0HUG3GLBjwhmug6rWwQZlpQfj6bJl2tSKCkkeOP0JZSSZ1rvyUN7tjUT
	 VPYjwAb7MDLAzlJtbu+0zkg2np0VcHDiKIqTAmBzwccC3eQX6eOWPCfjOlUx1oLMsT
	 JGWnHa0/HZHv1uT/nvPw+vUgvp3ot5pl1CElRcFYyYo+2k/q8Y2rJsRD6QgE4aGzGw
	 CeN4A6HD4scY1qw6L6YELy8KbzqFqqqvcf9xKlJB2JDaKN+umqweEOkbsQhXRVEmPx
	 Gf7kezX49uGNr7gmuTu+IY/ZTt2xf1lDSVt3d10e20sWXFJ4LNaxNj2voBm9mpRfdN
	 EFtZImUcSjSvQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2B081E21EE0;
	Tue, 20 Sep 2022 23:20:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/2] Add a secondary AT port to the Telit FN990
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <166371601817.30252.999968040305837655.git-patchwork-notify@kernel.org>
Date: Tue, 20 Sep 2022 23:20:18 +0000
References: <20220916144329.243368-1-fabio.porcedda@gmail.com>
In-Reply-To: <20220916144329.243368-1-fabio.porcedda@gmail.com>
To: Fabio Porcedda <fabio.porcedda@gmail.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 netdev@vger.kernel.org, mani@kernel.org, loic.poulain@linaro.org,
 ryazanov.s.a@gmail.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, dnlplm@gmail.com

Hello:

This series was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 16 Sep 2022 16:43:27 +0200 you wrote:
> In order to add a secondary AT port to the Telit FN990 first add "DUN2"
> to mhi_wwan_ctrl.c, after that add a seconday AT port to the
> Telit FN990 in pci_generic.c
> 
> Fabio Porcedda (2):
>   net: wwan: mhi_wwan_ctrl: Add DUN2 to have a secondary AT port
>   bus: mhi: host: pci_generic: Add a secondary AT port to Telit FN990
> 
> [...]

Here is the summary with links:
  - [1/2] net: wwan: mhi_wwan_ctrl: Add DUN2 to have a secondary AT port
    https://git.kernel.org/netdev/net-next/c/0c60d1657d3d
  - [2/2] bus: mhi: host: pci_generic: Add a secondary AT port to Telit FN990
    https://git.kernel.org/netdev/net-next/c/479aa3b0ec2e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


