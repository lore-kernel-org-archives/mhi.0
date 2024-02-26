Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D79604BA
	for <mhi@lists.linux.dev>; Mon, 26 Feb 2024 12:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708950061; cv=none; b=Kw0A/b2h+n4XbgInYrtQLJcFG+ghBgeMgtHYAZwSfKpMgY1/nGkWZBDR/dMbCU9ZNEU1h1vihNpohIIugyqmT1X4Nl+Ni/XtF+07GO/ch3ryR7rA9EuLrfIODRSpVVh4w03hifVm4vDKLb7tUiXrvGh0RQrKjekj4xP9sCs8eyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708950061; c=relaxed/simple;
	bh=ryPozF+ZEiZQv5gU9znIhxNGg250XVTfuostgCQKxvU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bmTe+G0V2IVklr7PvP+lXI3gwi8zHC8BsV9aMj3X15oNfw0el7g8S+knh+ywQ+aOFWPsq+1YmH6Xd9bl1naz/v2Zhlr0UXDUMSY2rJnLnopgsZ+ROHuQuZUJOUTnWziiOPoq9JgTpfJgFqRaTMcC9xbnDGGx5YvDYr7I9nOxOfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ISFpcg6v; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ISFpcg6v"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1dc0e5b223eso24104605ad.1
        for <mhi@lists.linux.dev>; Mon, 26 Feb 2024 04:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708950059; x=1709554859; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kvYVirxxYrcEoYPYhVtajEjzNx9trrhQLd3ahVDvBX0=;
        b=ISFpcg6vZK+LptcTgtoRSZQygR2b9XvscuKEPnARYMnR9R0MUJuikA9bM4sauWNvU3
         c03S/BolMcIBjnKOR492McMmsWvElrbaS3xzDd24NVHmKDLpLdpWqUZWSsVdDSIK1vAq
         teFeD646IG0U1abxWP7lcm1ucGgLyFg+qZmb+GLJADzBmeeHP7/fNIQvkPQ1NIEfayX8
         6X1UYm49MKhn7z7x5wcAesFUnuI+tfqiUHkJ8IB0C/aAF/JX7fnqqbwGoV6rtJ11ZQzi
         2BKCAbLzUQuBE1sw/CBQ2bOVTozZL1QFRoqciipGGnRZo0zLyLZYozvXOQ85Qw5du3Wh
         CQmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708950059; x=1709554859;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kvYVirxxYrcEoYPYhVtajEjzNx9trrhQLd3ahVDvBX0=;
        b=TM67x9yvwoYXhSRyvT1nCpJTzRaC5coyv49tKN1x9bXIPdDxm4Yav9SjIB1pJ+oASw
         YarvKOFllVy21I1GdjO6PSve2soBl1xyxJYe/Kbh0Jd3av2xHc7RgoFzPJdiI7X0Ue0Z
         WMIj/cwEoj/DV07QTuZE6KONwtfSY4A0tZhdnFTolzUd/D2jxBlYQH19uwrBdyfFGNaB
         EroOOR0zCMipn2mK113a9hewtxJOfT2WmE0ZR7qhED39m8onm17YTyMEXwyiOb7nwdWW
         1SQuSvOvTuc8svgkooROrglyTfpFTv3DT4b/6uqintWQbHfxi0jyQH4e7Zkb/CxN8tpJ
         hhTA==
X-Forwarded-Encrypted: i=1; AJvYcCWjdIjn5bTDU0UwVDkX6BYiZTCOCxvUtxZv2PT4Iq0gBbOVPp9XPvOlpLpFlF9THBjnr9cjXfjbFiAseNRgaFkcXj1S
X-Gm-Message-State: AOJu0Yw30xmSGnLVCxoO6ZeJgsemeXAQGV397FQwNTGiVjRalq/ugJpJ
	voRiLTG+MAy1thLJ/Fp5wgwRcoyneMjCrhi4aAzI3jjJiEcJrKwF6FI1o7Mb47473X6bCQxwz1A
	=
X-Google-Smtp-Source: AGHT+IFNO0EvqpSlsp90jIMoKkSHpuCVgm2eQEtRszipPHoVaXKCILn8GEKj9H06BqJROE7zrz5L0w==
X-Received: by 2002:a17:902:ba88:b0:1dc:266e:a7e2 with SMTP id k8-20020a170902ba8800b001dc266ea7e2mr6036261pls.11.1708950059447;
        Mon, 26 Feb 2024 04:20:59 -0800 (PST)
Received: from thinkpad ([117.202.184.81])
        by smtp.gmail.com with ESMTPSA id jh5-20020a170903328500b001dcada71593sm888333plb.273.2024.02.26.04.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 04:20:59 -0800 (PST)
Date: Mon, 26 Feb 2024 17:50:55 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: ath11k@lists.infradead.org, mhi@lists.linux.dev,
	linux-wireless@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/3] net: qrtr: support suspend/hibernation
Message-ID: <20240226122055.GE8422@thinkpad>
References: <20240221030026.10553-1-quic_bqiang@quicinc.com>
 <20240221030026.10553-3-quic_bqiang@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240221030026.10553-3-quic_bqiang@quicinc.com>

On Wed, Feb 21, 2024 at 11:00:25AM +0800, Baochen Qiang wrote:
> MHI devices may not be destroyed during suspend/hibernation, so need
> to unprepare/prepare MHI channels throughout the transition.
> 

Again, below content should go to the comment section, not in the commit
message.

Please add only relevant content in the commit message.

- Mani

> The RFC version adds new API to MHI stack with which an MHI controller
> driver can do unprepare/prepare directly by itself, see
> 
> https://patchwork.kernel.org/project/linux-wireless/patch/20231127162022.518834-3-kvalo@kernel.org/
> 
> Although it works well Mani pointed out that the design is not good
> because MHI channels are managed by MHI client driver thus should not
> be touched by others. See the discussion
> 
> https://lore.kernel.org/mhi/20231127162022.518834-1-kvalo@kernel.org/
> 
> This version changes to add suspend/resume callbacks to achieve the
> same purpose. The suspend callback is called in the late suspend stage,
> this means MHI channels are still alive at suspend stage, and that makes
> it possible for an MHI controller driver to communicate with others over
> those channels at suspend stage. While the resume callback is called in
> the early resume stage, for a similar reason.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> ---
>  net/qrtr/mhi.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/net/qrtr/mhi.c b/net/qrtr/mhi.c
> index 9ced13c0627a..b54a6c2113e9 100644
> --- a/net/qrtr/mhi.c
> +++ b/net/qrtr/mhi.c
> @@ -118,6 +118,32 @@ static const struct mhi_device_id qcom_mhi_qrtr_id_table[] = {
>  };
>  MODULE_DEVICE_TABLE(mhi, qcom_mhi_qrtr_id_table);
>  
> +static int qcom_mhi_qrtr_pm_suspend_late(struct device *dev)
> +{
> +	struct mhi_device *mhi_dev = container_of(dev, struct mhi_device, dev);
> +
> +	mhi_unprepare_from_transfer(mhi_dev);
> +
> +	return 0;
> +}
> +
> +static int qcom_mhi_qrtr_pm_resume_early(struct device *dev)
> +{
> +	struct mhi_device *mhi_dev = container_of(dev, struct mhi_device, dev);
> +	int rc;
> +
> +	rc = mhi_prepare_for_transfer_autoqueue(mhi_dev);
> +	if (rc)
> +		dev_err(dev, "failed to prepare for autoqueue transfer %d\n", rc);
> +
> +	return rc;
> +}
> +
> +static const struct dev_pm_ops __maybe_unused qcom_mhi_qrtr_pm_ops = {
> +	SET_LATE_SYSTEM_SLEEP_PM_OPS(qcom_mhi_qrtr_pm_suspend_late,
> +				     qcom_mhi_qrtr_pm_resume_early)
> +};
> +
>  static struct mhi_driver qcom_mhi_qrtr_driver = {
>  	.probe = qcom_mhi_qrtr_probe,
>  	.remove = qcom_mhi_qrtr_remove,
> @@ -126,6 +152,9 @@ static struct mhi_driver qcom_mhi_qrtr_driver = {
>  	.id_table = qcom_mhi_qrtr_id_table,
>  	.driver = {
>  		.name = "qcom_mhi_qrtr",
> +#ifdef CONFIG_PM
> +		.pm = &qcom_mhi_qrtr_pm_ops,
> +#endif
>  	},
>  };
>  
> -- 
> 2.25.1
> 
> 

-- 
மணிவண்ணன் சதாசிவம்
