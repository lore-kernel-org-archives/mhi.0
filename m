Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716BE3624DE;
	Sat, 20 Jun 2026 16:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781971465; cv=none; b=fecJ1YO0v5ziEJYg1AjY4o39uUqtFSoTsqDbshTPEn4ZlKxjYFT7vXJqIXxt3vLmKENXOt7OdsWEq52LnoAFMXAMwoLhFuzyO7l+mtrV8UO3cGvyRk//kxIV/9fQMff/OVKtlMczjq7NHZ7thmfM6QNiF1xyXL0/UattdnteClU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781971465; c=relaxed/simple;
	bh=2iZzv/1fYva/AZdgYbG7gCiSoB7JuVhRezIGKd2beoc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j0bbNoJ4WSPUQ3Zvx8PaPOmEn60ZfdFxQHzwTjhvfWXyiGUbVUkmpIw/zeO+yvKnQfdLd3jK0UbnuvimtmbVObSXD6l8pVxfw2v11E6D3e1O+hO1jNiNaa8cvUHfJlSZf9KyWjJpWEQfY9Ch9y5Xvjr8Rc80dq5C/iWUkxnbEsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Li+DzDS/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Li+DzDS/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAED31F000E9;
	Sat, 20 Jun 2026 16:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781971464;
	bh=Hh7OSwRTVc6l4OVwmHCQbDiJnjdOucc4W6n20ChEWww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Li+DzDS/etGW8QXQG9nuyT33Op3sJZ2QYd2GIp1g1H6DP9cnD4kuPuOAMmLhh1fYq
	 Hc5nlNZpo9CjW82YkB9I0NoOhEdFFZ8k1Xmqn3JrUHT2jtWP7Oy94ppxA8JkmKMEHE
	 8W7Hb2sEuW90GVwgPLPNgXhoXgKYq9tbOedCPskE75jdYLPgNWGE4Qn28s/nkllIUj
	 aXih7DCG3+IMlYxPMPk2tFiCxy87EyVld5PLtZ7OIfyEoX5CIuoTkHg5oOW5oWCq1E
	 +27azeLcM1kiM3EMq8r9H76RHrjkzqwoYK8iD4Pp+fbFeDIqjK4CX6xv7nkaWLnl+B
	 +Wo5BJjpaUa6A==
Date: Sat, 20 Jun 2026 21:34:15 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Yuho Choi <dbgh9129@gmail.com>
Cc: Kees Cook <kees@kernel.org>, 
	Akhil Vinod <akhil.vinod@oss.qualcomm.com>, Sumit Kumar <sumit.kumar@oss.qualcomm.com>, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, Adrian =?utf-8?Q?Barna=C5=9B?= <abarnas@google.com>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] bus: mhi: ep: Fix device refcount leak on create
 failure
Message-ID: <7fxkftqor7i2cfa24ihrafkqz7gspwzqj5q3xavakksrb7lcq6@y3br6tovcell>
References: <20260603195142.2189386-1-dbgh9129@gmail.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260603195142.2189386-1-dbgh9129@gmail.com>

On Wed, Jun 03, 2026 at 03:51:42PM -0400, Yuho Choi wrote:
> mhi_ep_create_device() takes one device reference for the UL channel and
> another for the DL channel after allocating the transfer device. These
> references are normally released by mhi_ep_destroy_device() before the
> device itself is removed.
> 
> If dev_set_name() or device_add() fails, the error path currently drops
> only one reference. The remaining channel references keep the device
> from being released and leave the channels associated with a device that
> was never registered.
> 
> Route both failures through a common unwind path that drops the DL
> channel reference, the UL channel reference, and the initial reference
> from device_initialize().
> 
> Fixes: 297c77a0f273 ("bus: mhi: ep: Add support for creating and destroying MHI EP devices")
> Signed-off-by: Yuho Choi <dbgh9129@gmail.com>

LGTM! But this patch can only be applied when v7.2-rc1 is released.

- Mani

> ---
>  drivers/bus/mhi/ep/main.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
> index 0277e1ab1198..34d3662eb091 100644
> --- a/drivers/bus/mhi/ep/main.c
> +++ b/drivers/bus/mhi/ep/main.c
> @@ -1338,15 +1338,19 @@ static int mhi_ep_create_device(struct mhi_ep_cntrl *mhi_cntrl, u32 ch_id)
>  	ret = dev_set_name(&mhi_dev->dev, "%s_%s",
>  		     dev_name(&mhi_cntrl->mhi_dev->dev),
>  		     mhi_dev->name);
> -	if (ret) {
> -		put_device(&mhi_dev->dev);
> -		return ret;
> -	}
> +	if (ret)
> +		goto err_put_channels;
>  
>  	ret = device_add(&mhi_dev->dev);
>  	if (ret)
> -		put_device(&mhi_dev->dev);
> +		goto err_put_channels;
> +
> +	return 0;
>  
> +err_put_channels:
> +	put_device(&mhi_dev->dev); /* DL channel reference */
> +	put_device(&mhi_dev->dev); /* UL channel reference */
> +	put_device(&mhi_dev->dev); /* device_initialize() reference */
>  	return ret;
>  }
>  
> -- 
> 2.43.0
> 

-- 
மணிவண்ணன் சதாசிவம்
