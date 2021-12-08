Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C192CA6
	for <mhi@lists.linux.dev>; Wed,  8 Dec 2021 08:14:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC05AC00446;
	Wed,  8 Dec 2021 08:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1638951284;
	bh=KVsNWqz0LaHuOzAI9G88zVXV9PP8KjnltwvPn55ga7g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aDFbrJkHWeenBXGlHXNtkemb0nGKWN8nZh0iS2bxJm2Y8LQuK2SqoRet7/M8LrU0W
	 I1oGFBN634ZJbswhxXJ888He8WQpkjSNMw40eyGFQm/S/CbjKWA4jsZ8GynDFXWDnw
	 HqSctFX5YKeTRhgOBf1u9kEQslCSyyf+vi/2kjlE=
Date: Wed, 8 Dec 2021 09:14:40 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Yihao Han <hanyihao@vivo.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Hemant Kumar <hemantk@codeaurora.org>,
	Bhaumik Bhatt <bbhatt@codeaurora.org>,
	Loic Poulain <loic.poulain@linaro.org>,
	Carl Yin <carl.yin@quectel.com>,
	Carl Huang <cjhuang@codeaurora.org>, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel@vivo.com
Subject: Re: [PATCH] bus: mhi: core: replace snprintf with sysfs_emit
Message-ID: <YbBpcJLUQUYHygGM@kroah.com>
References: <20211208080816.43351-1-hanyihao@vivo.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211208080816.43351-1-hanyihao@vivo.com>

On Wed, Dec 08, 2021 at 12:07:53AM -0800, Yihao Han wrote:
> coccinelle report:
> ./drivers/bus/mhi/core/init.c:97:8-16:
> WARNING: use scnprintf or sprintf
> Use sysfs_emit instead of scnprintf or sprintf makes more sense.
> 
> Signed-off-by: Yihao Han <hanyihao@vivo.com>
> ---
>  drivers/bus/mhi/core/init.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index 5aaca6d0f52b..a5a5c722731e 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -94,7 +94,7 @@ static ssize_t serial_number_show(struct device *dev,
>  	struct mhi_device *mhi_dev = to_mhi_device(dev);
>  	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
>  
> -	return snprintf(buf, PAGE_SIZE, "Serial Number: %u\n",
> +	return sysfs_emit(buf, "Serial Number: %u\n",
>  			mhi_cntrl->serial_number);
>  }
>  static DEVICE_ATTR_RO(serial_number);
> -- 
> 2.17.1
> 

Why are you only changing one function in this file?  If you realyl want
to make a change like this, fix ALL sysfs show functions.

thanks,

greg k-h
