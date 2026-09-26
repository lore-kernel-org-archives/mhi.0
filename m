Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BFAE362154;
	Sat, 26 Sep 2026 11:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790420968; cv=none; b=qWC+gADuM58+Bjo7X6TYqf+4rpShNWfbbPag+VC/lOxda0htiZCMTutHegGIxPvDeLZIClXVEC02vLjACoUSDmfka+zh3XtAlZjsd7V51G/S5WXtGI2D/TdQiscU/0JF4NvkaD0hAu48eQn/wc7NYKksUckRlbD5a/NTHikdHPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790420968; c=relaxed/simple;
	bh=barWDrTXFeJSnpEvw9ZZVZsopEelhN4dWqTdlRPWsGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GMgyAjCEERwO9ye6qOz6GVcGa/ei1tXzWvQ4j8M9WDN5oEit8s6GJLrnMYiFe4AknppVaq31OageQcRXlJp2T3M8PVV5YnesbNAzbMx2Zr8WPU6DETY0Tqs4D+TD4/+wZsvPvrOulhHDtDXczTt9U/rM6WJ4p2iQPwmAHjLSatQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hhr0C64b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hhr0C64b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 662AB1F000FF;
	Sat, 26 Sep 2026 11:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790420966;
	bh=OVfhU5p/b4fqZNfOhj1NuNC/sGjphhpmiJhw1uh469Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hhr0C64bhmdtQLj7jpT+wLFpAp40Agh8hT7NU6fKD/za0Ii/9tH9iigSCicftAi1h
	 wW+AVEPFcjGY30+wv0Z9ycnscfmBNKCVphoWvWTnUEeVk4RMDG12MRm9K9ywkT2Wju
	 E8K2G47gR/8fY8imzhKQZ0/K6ZXsRtu/S9OyEa4ZisQ5SXMIDtmy0c/GIS4Dr++VS9
	 D+H2M6FOX20GEWAmqHTETo5ZZgvW/a0HFJvOkyA1eKR1Xw8mD79iC70lhAe7Lg8Od0
	 VE4iClLMSMduv+5c0qzq5gcJQDHlmMouDvCZCA2R7Zz/+I3sWh9Jd+i356QVJCWcxA
	 ZmoMDHz9zUlsQ==
Date: Sat, 26 Sep 2026 13:09:09 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/3] bus: mhi: ep: Add mhi_ep_queue_buf() API for raw
 buffer queuing
Message-ID: <paftbnpv42at7zeb2o2qrsj5bphhxykw6wi24e5rxssycd4hke@qhui3mege6wb>
References: <20260908-lb-v6-0-66755ceb16cc@oss.qualcomm.com>
 <20260908-lb-v6-2-66755ceb16cc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260908-lb-v6-2-66755ceb16cc@oss.qualcomm.com>

On Tue, Sep 08, 2026 at 02:57:23PM +0530, Sumit Kumar wrote:
> Some MHI endpoint clients do not use socket buffers and need a way to queue
> raw buffers for DL transfers. Add mhi_ep_queue_buf() to support this use
> case.
> 
> Refactor mhi_ep_queue_skb() to delegate to a new internal mhi_ep_queue()
> helper shared by both APIs, and rename mhi_ep_skb_completion() to
> mhi_ep_buf_completion() to reflect its broader use.
> 
> Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
> ---
>  drivers/bus/mhi/ep/main.c | 29 ++++++++++++++++++++---------
>  include/linux/mhi_ep.h    | 16 ++++++++++++++++
>  2 files changed, 36 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
> index db7ee6547eefa75995393f761ac3b66a6e37112d..4b8dcd0273ad94e7fbcf7ab0209f13b17deb6d0c 100644
> --- a/drivers/bus/mhi/ep/main.c
> +++ b/drivers/bus/mhi/ep/main.c
> @@ -504,7 +504,7 @@ static int mhi_ep_process_ch_ring(struct mhi_ep_ring *ring)
>  	return 0;
>  }
>  
> -static void mhi_ep_skb_completion(struct mhi_ep_buf_info *buf_info)
> +static void mhi_ep_buf_completion(struct mhi_ep_buf_info *buf_info)
>  {
>  	struct mhi_ep_device *mhi_dev = buf_info->mhi_dev;
>  	struct mhi_ep_cntrl *mhi_cntrl = mhi_dev->mhi_cntrl;
> @@ -532,22 +532,22 @@ static void mhi_ep_skb_completion(struct mhi_ep_buf_info *buf_info)
>  
>  	mhi_ep_ring_inc_index(ring);
>  }
> -

Keep the newline.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
