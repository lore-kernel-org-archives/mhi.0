Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2114613B2AC
	for <mhi@lists.linux.dev>; Tue, 27 Feb 2024 12:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709036172; cv=none; b=JX0ZqApi/sYd+zblo6PHgU/yAp19qLqqYjnQtz7R/lJtn+FKWNyK2mZHV0qTHhphFbmP93XLJ9MPijKbYoONHrGZ6Ir0NOuQ6GZA+XOO69g2NYKwALU485rkZlm33DyV5jBpvxgXuH34qRRirQwYrlAuHu5O/YVHhmjurqk2nw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709036172; c=relaxed/simple;
	bh=tzPFWddcLinFLpylocZ1/c9Pw+LLiJOMXtoyrSnUv84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mAygvyY22Uw1adCa/atfOLD6yimTdOzvYpTykhRvMUu9KjQBRkETKpcc9J0cidPhpK0QzokUGb1GBgbRv2hXsqkAddtUczigGnVwgE6HqVRslQinHhT6x+PPanedSJO/Oq/zRqp0Ds2Fdj6z633SeRJRquG0yHxBQFNqmjq/lCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ahjL4iFj; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ahjL4iFj"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1d918008b99so32836165ad.3
        for <mhi@lists.linux.dev>; Tue, 27 Feb 2024 04:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709036168; x=1709640968; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uSLLi43HACJeFnFP6SO2dnx7por0WBtfnRzS4Kl+dFE=;
        b=ahjL4iFjxcQtEjg62AQAk8FdeK+bE/8jJ/fLf09chtaPzh5VhzEAm8W8gLpUgnbxTv
         g6HY1Fn75Ux3N0MWneYj3GIlRZrGNAg/vw+dHhPyyWxMqakjQC3APcrTWD3rgYtrutXV
         nQD3gmzY8fs1EGI6708/iM7ITmoLHZ5ebW16caFWAoIFAUHtceNFclj7hSW69uZBYVj/
         0Jf3Q4DghCi0uj3rp61F9P3EHxFQQfxrH9+p1khOL7la30W1MvjkfkNA17QXW1eD0wCk
         EKBHEHXdWKobbGfZeefuXftVWjfWpeZ9jz1vzPpNDAHTKfZjWwPnP/R7Eus8PMYlOuDd
         6R7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709036168; x=1709640968;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uSLLi43HACJeFnFP6SO2dnx7por0WBtfnRzS4Kl+dFE=;
        b=LYzyX22DBia6ES1/cA8IHIqJFHoaIbokaFqe2lo3yxdU7sHWu9wBSJUuzVPPeiCALR
         jLhjlxTvFq21c1WcFZk/4hTOP6kIzNy3kdqaM834g0jvVNOEH1W3ACH+H/dN+J97uDLz
         0lrWnxpXshVCSOYfnEEXm/9QQBfolpH8HN7l8w4ha3QMEoRxkNqHYWofyhQpnkDgDsYt
         uv7yi4pBxd2P2Vl4fXaTwTNQocM8F7WEr90X+QuB5PlDdDH3TUI4yqpdqrP0u8ySrLRr
         +dDekg/QpNAp2OeRxtpmIe60SK6vQg7GWiBcxyz+s8GLpIVe8wi0jF7UqgHG2e80X6Hx
         1f5g==
X-Forwarded-Encrypted: i=1; AJvYcCVFYaHPSOEwqupuas2SshSkYDTfzyNL4ZyLf4kkjKDB6ruP3IxZp2bz99zTsE1H9KOGEpz6UCvv/ntoaCIPBuLAysEB
X-Gm-Message-State: AOJu0Yy1ppk2SZna4aVBnOmSHleJgHmdxC2Q84+c47Qva1nQoe5qB4ge
	X4798ogcUEeOML+8pgzBAUR+tHGfe5jgGUht+l3ghaGxuZXfasRHozeUbWvWnQ==
X-Google-Smtp-Source: AGHT+IH3s4jVwUk0+mZ0PnkQjYfLsEztotgFamFw6AI38DUq7t0+HX+BXSCN6Z/P0Ih71C7CE+4/+g==
X-Received: by 2002:a17:902:7c92:b0:1db:c3cb:b088 with SMTP id y18-20020a1709027c9200b001dbc3cbb088mr9769914pll.35.1709036168326;
        Tue, 27 Feb 2024 04:16:08 -0800 (PST)
Received: from thinkpad ([117.213.97.177])
        by smtp.gmail.com with ESMTPSA id o9-20020a1709026b0900b001db693d89fdsm1405598plk.179.2024.02.27.04.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 04:16:08 -0800 (PST)
Date: Tue, 27 Feb 2024 17:46:02 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev
Subject: Re: [PATCH v3 2/3] net: qrtr: support suspend/hibernation
Message-ID: <20240227121602.GM2587@thinkpad>
References: <20240227104427.7505-1-quic_bqiang@quicinc.com>
 <20240227104427.7505-3-quic_bqiang@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240227104427.7505-3-quic_bqiang@quicinc.com>

On Tue, Feb 27, 2024 at 06:44:26PM +0800, Baochen Qiang wrote:
> MHI devices may not be destroyed during suspend/hibernation, so need
> to unprepare/prepare MHI channels throughout the transition, this is
> done by adding suspend/resume callbacks.
> 
> The suspend callback is called in the late suspend stage, this means
> MHI channels are still alive at suspend stage, and that makes it
> possible for an MHI controller driver to communicate with others over
> those channels at suspend stage. While the resume callback is called
> in the early resume stage, for a similar reason.
> 
> Also note that we won't do unprepare/prepare when MHI device is in
> suspend state because it's pointless if MHI is only meant to go through
> a suspend/resume transition, instead of a complete power cycle.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>

Btw, you forgot to CC netdev folks. Here is the list that get_maintainer.pl
returns:

"David S. Miller" <davem@davemloft.net> (maintainer:NETWORKING [GENERAL])
Eric Dumazet <edumazet@google.com> (maintainer:NETWORKING [GENERAL])
Jakub Kicinski <kuba@kernel.org> (maintainer:NETWORKING [GENERAL])
Paolo Abeni <pabeni@redhat.com> (maintainer:NETWORKING [GENERAL])
netdev@vger.kernel.org (open list:NETWORKING [GENERAL])

- Mani

> ---
>  net/qrtr/mhi.c | 46 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
> 
> diff --git a/net/qrtr/mhi.c b/net/qrtr/mhi.c
> index 9ced13c0627a..69f53625a049 100644
> --- a/net/qrtr/mhi.c
> +++ b/net/qrtr/mhi.c
> @@ -118,6 +118,51 @@ static const struct mhi_device_id qcom_mhi_qrtr_id_table[] = {
>  };
>  MODULE_DEVICE_TABLE(mhi, qcom_mhi_qrtr_id_table);
>  
> +static int __maybe_unused qcom_mhi_qrtr_pm_suspend_late(struct device *dev)
> +{
> +	struct mhi_device *mhi_dev = container_of(dev, struct mhi_device, dev);
> +	enum mhi_state state;
> +
> +	state = mhi_get_mhi_state(mhi_dev->mhi_cntrl);
> +	/*
> +	 * If the device is in suspend state, then no need for the
> +	 * client driver to unprepare the channels.
> +	 */
> +	if (state == MHI_STATE_M3)
> +		return 0;
> +
> +	mhi_unprepare_from_transfer(mhi_dev);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused qcom_mhi_qrtr_pm_resume_early(struct device *dev)
> +{
> +	struct mhi_device *mhi_dev = container_of(dev, struct mhi_device, dev);
> +	enum mhi_state state;
> +	int rc;
> +
> +	state = mhi_get_mhi_state(mhi_dev->mhi_cntrl);
> +	/*
> +	 * If the device is in suspend state, we won't unprepare channels
> +	 * in suspend callback, therefore no need to prepare channels when
> +	 * resume.
> +	 */
> +	if (state == MHI_STATE_M3)
> +		return 0;
> +
> +	rc = mhi_prepare_for_transfer_autoqueue(mhi_dev);
> +	if (rc)
> +		dev_err(dev, "failed to prepare for autoqueue transfer %d\n", rc);
> +
> +	return rc;
> +}
> +
> +static const struct dev_pm_ops qcom_mhi_qrtr_pm_ops = {
> +	SET_LATE_SYSTEM_SLEEP_PM_OPS(qcom_mhi_qrtr_pm_suspend_late,
> +				     qcom_mhi_qrtr_pm_resume_early)
> +};
> +
>  static struct mhi_driver qcom_mhi_qrtr_driver = {
>  	.probe = qcom_mhi_qrtr_probe,
>  	.remove = qcom_mhi_qrtr_remove,
> @@ -126,6 +171,7 @@ static struct mhi_driver qcom_mhi_qrtr_driver = {
>  	.id_table = qcom_mhi_qrtr_id_table,
>  	.driver = {
>  		.name = "qcom_mhi_qrtr",
> +		.pm = &qcom_mhi_qrtr_pm_ops,
>  	},
>  };
>  
> -- 
> 2.25.1
> 

-- 
மணிவண்ணன் சதாசிவம்
