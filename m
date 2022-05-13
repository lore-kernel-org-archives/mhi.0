Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B8D20F3
	for <mhi@lists.linux.dev>; Fri, 13 May 2022 06:05:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FA62C34100;
	Fri, 13 May 2022 06:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1652421910;
	bh=05TDIcrSRouSVVg0LE7Qt2qs9UfyFi0Y3KQPeMWX/1E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uQhVVudblIX45ryI2VqOBKEmGom3ZuBUiWodG8e9njvegID+E3q4ztW87XIW0z7zX
	 cvfB8wWSGb1gVlpmY1ei/Y7Q3Fb4+ryWdNB1zcCfOUggLuj+pN11YA9MrBj+ykNXkS
	 L04gYD953Am0+Jq7GssSqQwceVfiuUF9GgtbCaao=
Date: Fri, 13 May 2022 08:05:05 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Yonglin Tan <yonglin.tan@outlook.com>
Cc: mani@kernel.org, quic_hemantk@quicinc.com, loic.poulain@linaro.org,
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH]     bus: mhi: host: Add support for Quectel EM120 FCCL
 project.
Message-ID: <Yn31EYLyfrHaTe6S@kroah.com>
References: <MEYP282MB2374B995796DE1B2D23FFA02FDCA9@MEYP282MB2374.AUSP282.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MEYP282MB2374B995796DE1B2D23FFA02FDCA9@MEYP282MB2374.AUSP282.PROD.OUTLOOK.COM>

On Fri, May 13, 2022 at 01:59:11PM +0800, Yonglin Tan wrote:
> From: ylintan <yonglin.tan@outlook.com>
> 
>     This patch add VendorID/DeviceID definitions for EM120 FCCL project.
>     It has the same configration as Quectel EM160R-GL and EM120R-GL.
> 
>     Signed-off-by: Yonglin Tan <yonglin.tan@outlook.com>
>     Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

I signed off on this commit?
Please NEVER add these lines from someone else.  THat is a legal
statement you are making there, and I do not remember making it.

>     Link: https://lore.kernel.org/all/YnzRcFy1zwhdSP5D@kroah.com/

That points to a response from me, not the original commit.

Something went really wrong with this submission, please try again.

greg k-h
