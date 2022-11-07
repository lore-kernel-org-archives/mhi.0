Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5AF28E8
	for <mhi@lists.linux.dev>; Mon,  7 Nov 2022 09:02:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6004CC433D6;
	Mon,  7 Nov 2022 09:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1667811753;
	bh=ViJ+rTwa2j3DEYuVpCX6JtP/l6UkQwZqRriZXqJuLx8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hNqWuwEqwTDL+wAW3Jub1iigGSfw4ccaPv22kfWddbp0MT0Q0TOkxDXOFVjHBn0kL
	 WfDtZ2jPL7ieBwUPtKgKQ8a4tTbw5UE14j0Va2M4IAC2DrKsp6+x7mPco+Y+62J+VE
	 VDs8qoizzrBP41VAM0vbcugD/3eD8C8g0va+ytqc=
Date: Mon, 7 Nov 2022 10:02:29 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Slark Xiao <slark_xiao@163.com>
Cc: mani@kernel.org, loic.poulain@linaro.org, dnlplm@gmail.com,
	yonglin.tan@outlook.com, fabio.porcedda@gmail.com,
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] bus: mhi: host: pci_generic: Add macro for some VIDs
Message-ID: <Y2jJpT5//xBUOQMq@kroah.com>
References: <20221107084826.8888-1-slark_xiao@163.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221107084826.8888-1-slark_xiao@163.com>

On Mon, Nov 07, 2022 at 04:48:26PM +0800, Slark Xiao wrote:
> To make code neat and for convenience purpose, use macro for
> some VIDs. These macros are supposed to be added to pci_ids.h.

No, they are not supposed to be added there at all.

And they are not a "macro", it is a "#define".

> But until the macros are used in multiple places, it is not
> recommended. So adding it locally for now.

Again, these are not macros

thanks,

greg k-h
