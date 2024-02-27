Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE5F53E2D
	for <mhi@lists.linux.dev>; Tue, 27 Feb 2024 07:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709018138; cv=none; b=LXzCRIJU/YXMAZKoJJCOqyCbOUQmRUA9soi8QU+N5CYAi4BFaV/liDmvova168LP0vCH8mWbUDfLmtFJw4vEjJWiHXRhZLzAFveGe1z0LXmHYJ14CV+ok35+5SibOkp6qRKDM/adLm4buZ84SQrXG1+uv8gtsktpEXlZebypfhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709018138; c=relaxed/simple;
	bh=xdj2tmp5ZSTgv8RxX6+UK1ZIo0D0A5lr94dBSBt32Tk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ATNmfLl8qUlnrEiEjAmhxHynkQElA4luguss7sCIBYBse4J7vErzeLlQZXglqh57hDD3tcdMyQxIGF9doC80rXiSOCu4jgpEUt0qgkKyymGpXfaJ0zo1qL0J+AhAquyThKYiZL/5TkhGRsef4BNkd1N9JnazM4atxBewUGBQKeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gx6entiU; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gx6entiU"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1dcafff3c50so10606925ad.0
        for <mhi@lists.linux.dev>; Mon, 26 Feb 2024 23:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709018136; x=1709622936; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uZsei3QWNYjEWHv4rj1KYROyeU0O84dua5Y6JN0udQc=;
        b=gx6entiUYWtEmNUsYzGzDYnCZ5Ad1JWRbAk20ypnXq1xzYiV/hrp+ErwDYTVVoBvkq
         LmQYoQnG8lx1V0nY/pTBtYiArRBSxCMr1niVrBH/4ZsDq64SOC9yhBky9p4j+AuS0fb0
         mKocF8JY+34bpHO5kSnqpj39lfIljwMhmBDMgBvFsdoW8kcmuQTuz6q3v3BcWuxp3mnV
         J5ScUPDi2B+QwcIHSm+1mioqA/9sUVhiZJF0vHdODviW76EWcxruzXzc9jUg+tySekEO
         qbB2FQAgQBNayWJb47o2GFTmRjXPrOkPzuxIBHI5hG8v5YKXByNzYKAQaQ+pwZ958cjG
         Ps1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709018136; x=1709622936;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uZsei3QWNYjEWHv4rj1KYROyeU0O84dua5Y6JN0udQc=;
        b=uaEYJ/pz8El0EmDpHy1ni2aoUCV86j2K8w9kr9/uU6rRhj1EKAwVODzl3MwI+0bQ0U
         3Lg8VYb9wzGMDrVsa2kSzXeWshavFFgiIc3PfTIwH7e2s/ev8VwfWsfc5Y3AR/6hUxvZ
         VwA/Bgaf7UXtGbLyK1jsJMfCwyXqM/sgLG7Qkl1c4JP/GAI+qb1jHDLq1EDWywPQWZ9H
         mogoGs1SzK0QYkBQctjLQg9Oqt7w9Wq15mOUig71j/srVXS5C/0O5/G0eVHQiZaKfLOL
         K+CKhDmJnX9SrpO1u19oMVZeQ6Rc7ThsSaZ72AbPVAlMvZivroEhUUce6uTdGHRpwhp3
         5/ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9J/hZmpfshiELXXDlb4n+UUsoXGmBy7c6L+0BtOu96LFXBNPtj+4gqUoQeZPsMlA1vgHrLQyfxrjGuS9Ey2aOhniY
X-Gm-Message-State: AOJu0YyfTThXx5P8HYCdxbdAjIrn80Er1KiKYAFeacqLtzSTeDUh1fGR
	YaLZ5uk+Ys/q4fj26X17a00yx4nD0tdF1NSnre4i4aXSGIy9ey2l82Ez75bZow==
X-Google-Smtp-Source: AGHT+IFibjJl0nFMxkStNH2v97+irfnxX0GXGBgtTqgJL/pFmNgfMwh9TcBG1L8V21fOgN6jL/Y6fQ==
X-Received: by 2002:a17:902:7ec8:b0:1db:cb54:5e77 with SMTP id p8-20020a1709027ec800b001dbcb545e77mr10479462plb.22.1709018136598;
        Mon, 26 Feb 2024 23:15:36 -0800 (PST)
Received: from thinkpad ([117.213.97.177])
        by smtp.gmail.com with ESMTPSA id k22-20020a170902ba9600b001dcabf123c9sm813379pls.155.2024.02.26.23.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 23:15:36 -0800 (PST)
Date: Tue, 27 Feb 2024 12:45:31 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev
Subject: Re: [PATCH v2 2/3] net: qrtr: support suspend/hibernation
Message-ID: <20240227071531.GD2587@thinkpad>
References: <20240227063613.4478-1-quic_bqiang@quicinc.com>
 <20240227063613.4478-3-quic_bqiang@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240227063613.4478-3-quic_bqiang@quicinc.com>

On Tue, Feb 27, 2024 at 02:36:12PM +0800, Baochen Qiang wrote:
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
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Could you please confirm if this patch can be applied separately and won't cause
regression?

- Mani

> ---
>  net/qrtr/mhi.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/net/qrtr/mhi.c b/net/qrtr/mhi.c
> index 9ced13c0627a..e96b82a6742c 100644
> --- a/net/qrtr/mhi.c
> +++ b/net/qrtr/mhi.c
> @@ -118,6 +118,32 @@ static const struct mhi_device_id qcom_mhi_qrtr_id_table[] = {
>  };
>  MODULE_DEVICE_TABLE(mhi, qcom_mhi_qrtr_id_table);
>  
> +static int __maybe_unused qcom_mhi_qrtr_pm_suspend_late(struct device *dev)
> +{
> +	struct mhi_device *mhi_dev = container_of(dev, struct mhi_device, dev);
> +
> +	mhi_unprepare_from_transfer(mhi_dev);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused qcom_mhi_qrtr_pm_resume_early(struct device *dev)
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
> +static const struct dev_pm_ops qcom_mhi_qrtr_pm_ops = {
> +	SET_LATE_SYSTEM_SLEEP_PM_OPS(qcom_mhi_qrtr_pm_suspend_late,
> +				     qcom_mhi_qrtr_pm_resume_early)
> +};
> +
>  static struct mhi_driver qcom_mhi_qrtr_driver = {
>  	.probe = qcom_mhi_qrtr_probe,
>  	.remove = qcom_mhi_qrtr_remove,
> @@ -126,6 +152,7 @@ static struct mhi_driver qcom_mhi_qrtr_driver = {
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
