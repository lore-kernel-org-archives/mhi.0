Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7548C808
	for <mhi@lists.linux.dev>; Tue, 31 Jan 2023 09:11:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91805C433EF;
	Tue, 31 Jan 2023 09:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1675156315;
	bh=yJVHgqwGId2skoAAD78DqGDVu+8DH7ETH1b8xfZxrOw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=w/sH1GvJbeb3/rQsaiy6Cd0WEGrKjEKX0ekQUA5hBE+cOenoViAqBiSVlV51xdEUr
	 uUCGLPA+4GAaZu5KGDs0cBvR7koKXD1deJMvQvcP0qLtnIsZx4+SX//6S3NlrcqRXQ
	 3jJuKRiwtq07m8dfBl8TTDiPwocJG218jCZaBMRs=
Date: Tue, 31 Jan 2023 10:11:52 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Duke =?utf-8?B?WGluKOi+m+WuieaWhyk=?= <duke_xinanwen@163.com>
Cc: mani@kernel.org, slark_xiao@163.com, loic.poulain@linaro.org,
	dnlplm@gmail.com, yonglin.tan@outlook.com, fabio.porcedda@gmail.com,
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	inux-kernel@vger.kernel.org, jerry.meng@quectel.com,
	duke.xin@quectel.com
Subject: Re: [PATCH v3] bus: mhi: host: pci_generic: Add support for Quectel
 RM520N-GL modem
Message-ID: <Y9jbWEcx4frG/V7F@kroah.com>
References: <20230128024754.2562-1-duke_xinanwen@163.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230128024754.2562-1-duke_xinanwen@163.com>

On Fri, Jan 27, 2023 at 06:47:54PM -0800, Duke Xin(辛安文) wrote:
> The project is based on Qualcomm's sdx6x chips for laptop,so the mhi interface definition and
> enumeration align with previous Quectel sdx24 configuration
> 
> Signed-off-by: Duke Xin(辛安文) <duke_xinanwen@163.com>
> ---
>  drivers/bus/mhi/host/pci_generic.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
