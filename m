Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A5863502
	for <mhi@lists.linux.dev>; Thu, 29 Feb 2024 10:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709201588; cv=none; b=ZamaPRwmS9dIv+qrqGmSFZF2/qUkiDaeB5wG7jEgrNDGuHBdA4X3oziQ5s6Q7WUums/E3PKJhpGsLFG8ys6oieJQl2VKjoc1jiL+CEd0tgb6ZH5gImSifFuo+tHiZIYT1eUBJYkfR4Gs7kAIHL/nw9ha8s/iZHgx/vy8VfRW460=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709201588; c=relaxed/simple;
	bh=JvJIOXpLW0YZXDe6zPWZQWdWHZCOjK+ofAJQOD+9kLU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AuxV7HLrKogzdereEutK1C2GhofpWyMXnBxqnIJyqrrdaOFpz4/RZtJD0GRWpRpMNvcxOOsFxP4DpBahYtOqvmYGSB6bWjgrTvo1Wt8j6FXr9pYgKwde+lVQ1oCwA2L0P/06mmDvcFXwbAFhZvnDsqI3fhbgip7XjNLQZ2Rdd7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wqGCrpJL; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wqGCrpJL"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6da202aa138so456250b3a.2
        for <mhi@lists.linux.dev>; Thu, 29 Feb 2024 02:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709201586; x=1709806386; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FTSeHl4t56ihFRBLYPjJvNh39suZY1xPljTjFaZyy/Y=;
        b=wqGCrpJLClDyEpxr49ISD6SgzcLM6Pvq9uv7c4AIbz37znMgBmQ2q2SECeztwYQE28
         HEFLaA7C5rduC26LdsigyC3ips5O8OIci49MyqwJkL/zH4oCLIJHShn0FkFE8Zj0c5hA
         VZFrQF0zAmFoe6MEu8++O20Z4BQOqRcpSkw5ic3yzGWViAr5y6z/Gf5TdIRpAnUgtbsv
         iMFFt6+VTdux73h0FAt3KteTYmP2AjfaOFL7Sq8et6NbDMYuNSicrkoXyxNY4IXbVWa5
         R3q1y6nfE4HLLVIC20wRfz8m2S1Q0ymzVRRpRUEsnb5PDDi7sAdso3mhN7Ly31qFixSK
         2qkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709201586; x=1709806386;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FTSeHl4t56ihFRBLYPjJvNh39suZY1xPljTjFaZyy/Y=;
        b=m6ELKWPg7lL4ihvTqHAmvJ7DX2Z6A/7YbOK2LAr2vlCtKD07d6pIVW51NYzO/oFnZd
         WnESmL8JWtJGk3lkFjtmM2BGEUm7dgCQG1d3QfiIMtZiT1EBvj6ZVZ5p6EiQ5K36qd7P
         8Pj7eJ5sbMCP6yZCtD3u3VrOxupcTUmf2aT4R7YOnXqPHOvau7XRjNB/IX8YCHgIv8yh
         Is5oPcxFhJFoXQVoBBWKfv1kK6WlwX+r0g/VIvWiqAAKK2lDmALQNO3uHxTiRylb7gJQ
         g2JhOl7n3N58t6RlFJeEKoGOlfiEF7sIGjI0GvMdviJIvtFi8RNoLAFlLfTbdMybrwkD
         d8eQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPgfXHFz09kKcrcK3q66X3kRDTYDZUsS9+Rr8EQzqxEgC6cFZSXS1iI7Py5eeKrKCOPzK0cASW66jiWHXLJ8F74P3Y
X-Gm-Message-State: AOJu0YxeBNSdC910iPquMikms4LvcMf4umXbiFcUZZUIvU6T0E2hE1jS
	6JmMNbrNcz7awhEnW8kxd2shzE8GAGRQITGBZa5o+Rz8p9g4O4T1zxcWgGruIs6wNUTRjbvYatU
	=
X-Google-Smtp-Source: AGHT+IGygXML0wQBkJwD/GAHTQBBip4QFRiWJxFBsL4N97u47bRPEOg2GIwnNaxsGTOu/S/paGqlYw==
X-Received: by 2002:a05:6a20:9f09:b0:1a0:e17c:d771 with SMTP id mk9-20020a056a209f0900b001a0e17cd771mr2366560pzb.7.1709201585776;
        Thu, 29 Feb 2024 02:13:05 -0800 (PST)
Received: from thinkpad ([120.138.12.68])
        by smtp.gmail.com with ESMTPSA id x15-20020a170902ec8f00b001dcb654d1a5sm1069127plg.21.2024.02.29.02.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 02:13:05 -0800 (PST)
Date: Thu, 29 Feb 2024 15:42:54 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, netdev@vger.kernel.org
Subject: Re: [PATCH v4 2/3] net: qrtr: support suspend/hibernation
Message-ID: <20240229101254.GC2999@thinkpad>
References: <20240228022243.17762-1-quic_bqiang@quicinc.com>
 <20240228022243.17762-3-quic_bqiang@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240228022243.17762-3-quic_bqiang@quicinc.com>

On Wed, Feb 28, 2024 at 10:22:42AM +0800, Baochen Qiang wrote:
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

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

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
