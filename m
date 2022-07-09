Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC307A
	for <mhi@lists.linux.dev>; Sat,  9 Jul 2022 06:09:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E04EC3411C;
	Sat,  9 Jul 2022 06:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657346949;
	bh=A0VrllQFD/OTuASUh884+Oug040m4y5tVS+QhLk4yuw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mCRwV1ubPYHVGUQbwNXFhYtjLWwJ66M+lBUhVKUXGpiVAVVB+xTsYfzqc5v/JwKe8
	 H5S1z/d+jHvn4gWkBXmUUQpHxLImInNsGhzfYEsdZBzYCIlwvObcIpRr4K/vxiqvnY
	 dfas9gBLJ4tdi8WRyUDCBPwArElIvJi5BKD/sjZQcSwmWcSwEahGkv/1aGn6N9y1U9
	 BRunYmoowxxJaKuM9OLPsOuJAkjeK2Ur0N48Dg06+kQHNv0prjK7wA1HW3r/GMPfeX
	 JkVKH79xuHEvNllaVqXudbztp85sEwYkEcLQ9DHLbzITxuhIAODO4OoiUFG2XYZXZP
	 QDnLOTSpE5uEw==
Date: Sat, 9 Jul 2022 11:38:57 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: mhi@lists.linux.dev, manivannan.sadhasivam@linaro.org,
	quic_hemantk@quicinc.com, bbhatt@codeaurora.org,
	Maxim Kochetkov <mkochetkov@airspan.com>
Subject: Re: [PATCH] net: qrtr: start MHI channel after endpoit creation
Message-ID: <20220709060857.GC5063@thinkpad>
References: <20220430103430.37349-1-fido_max@inbox.ru>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220430103430.37349-1-fido_max@inbox.ru>

On Sat, Apr 30, 2022 at 01:34:30PM +0300, Maxim Kochetkov wrote:
> From: Maxim Kochetkov <mkochetkov@airspan.com>
> 
> MHI channel may generates event/interrupt right after enabling.
> It may leads to 2 race conditions issues.
> 
> 1)
> Such event may be dropped by qcom_mhi_qrtr_dl_callback() at check:
> 
> 	if (!qdev || mhi_res->transaction_status)
> 		return;
> 
> Because dev_set_drvdata(&mhi_dev->dev, qdev) may be not performed at
> this moment. In this situation qrtr-ns will be unable to enumerate
> services in device.
> ---------------------------------------------------------------
> 
> 2)
> Such event may come at the moment after dev_set_drvdata() and
> before qrtr_endpoint_register(). In this case kernel will panic with
> accessing wrong pointer at qcom_mhi_qrtr_dl_callback():
> 
> 	rc = qrtr_endpoint_post(&qdev->ep, mhi_res->buf_addr,
> 				mhi_res->bytes_xferd);
> 
> Because endpoint is not created yet.
> --------------------------------------------------------------
> So move mhi_prepare_for_transfer_autoqueue after endpoint creation
> to fix it.
> 
> Fixes: a2e2cc0dbb11 ("net: qrtr: Start MHI channels during init")
> Signed-off-by: Maxim Kochetkov <mkochetkov@airspan.com>

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

Thanks,
Mani

> ---
>  net/qrtr/mhi.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/net/qrtr/mhi.c b/net/qrtr/mhi.c
> index 18196e1c8c2f..17520d9e7a51 100644
> --- a/net/qrtr/mhi.c
> +++ b/net/qrtr/mhi.c
> @@ -78,11 +78,6 @@ static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
>  	struct qrtr_mhi_dev *qdev;
>  	int rc;
>  
> -	/* start channels */
> -	rc = mhi_prepare_for_transfer_autoqueue(mhi_dev);
> -	if (rc)
> -		return rc;
> -
>  	qdev = devm_kzalloc(&mhi_dev->dev, sizeof(*qdev), GFP_KERNEL);
>  	if (!qdev)
>  		return -ENOMEM;
> @@ -96,6 +91,11 @@ static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
>  	if (rc)
>  		return rc;
>  
> +	/* start channels */
> +	rc = mhi_prepare_for_transfer_autoqueue(mhi_dev);
> +	if (rc)
> +		return rc;
> +
>  	dev_dbg(qdev->dev, "Qualcomm MHI QRTR driver probed\n");
>  
>  	return 0;
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்
