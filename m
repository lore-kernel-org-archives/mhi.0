Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B71DDC1
	for <mhi@lists.linux.dev>; Fri, 19 May 2023 13:51:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08C1FC433D2;
	Fri, 19 May 2023 13:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684504302;
	bh=WKlnm8UtxT+qYnvDF9i2Qq122VqGCiN1FomPmbhIJpk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vG18ZPOeNSniciRdpye/diDQF7VE35xTBCVDzW3Dk9q83g/Innsdha1pyX3aj3e5W
	 n0JHvJGpJb+JR8RnuiKBZB5MUpqYO+Zpmjg8URHAamzLMGms3uarbdAQq7aN7QtgzE
	 /RvqHV0ofuyLa4lGKila6YWQcV5Gpab6PAdpp90l1AEOWCe5vSwciWGrLN/z8COhyt
	 gpPAVDiOYwkFvMi/n02Bi44t0aeeIF0NOClOSc0Z3BOVI39a7H9yLn0qQ5BwGf7FWW
	 pI9hRwRZ99lKSMFSLyJAam8AxMDYdcxVKwMN6a8OjdLWWS4faWes5zHTPYKi3AeOHs
	 l9ijf36zoOq3g==
Date: Fri, 19 May 2023 19:21:29 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Qiang Yu <quic_qianyu@quicinc.com>
Cc: mani@kernel.org, quic_jhugo@quicinc.com, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_cang@quicinc.com, quic_mrana@quicinc.com,
	stable@vger.kernel.org
Subject: Re: [PATCH v4] bus: mhi: host: Skip MHI reset if device is in RDDM
Message-ID: <20230519135129.GA4843@thinkpad>
References: <1684390959-17836-1-git-send-email-quic_qianyu@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1684390959-17836-1-git-send-email-quic_qianyu@quicinc.com>

On Thu, May 18, 2023 at 02:22:39PM +0800, Qiang Yu wrote:
> In RDDM EE, device can not process MHI reset issued by host. In case of MHI
> power off, host is issuing MHI reset and polls for it to get cleared until
> it times out. Since this timeout can not be avoided in case of RDDM, skip
> the MHI reset in this scenarios.
> 
> Cc: <stable@vger.kernel.org>
> Fixes: a6e2e3522f29 ("bus: mhi: core: Add support for PM state transitions")
> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> ---
> v1->v2: use ~75 columns in commit text, add Fixes tag
> v2->v3: update Fixes tag
> v3->v4: add review tag and CC stable
> 
>  drivers/bus/mhi/host/pm.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
> index 0834590..8a4362d 100644
> --- a/drivers/bus/mhi/host/pm.c
> +++ b/drivers/bus/mhi/host/pm.c
> @@ -470,6 +470,10 @@ static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl)
>  
>  	/* Trigger MHI RESET so that the device will not access host memory */
>  	if (!MHI_PM_IN_FATAL_STATE(mhi_cntrl->pm_state)) {
> +		/* Skip MHI RESET if in RDDM state */
> +		if (mhi_cntrl->rddm_image && mhi_get_exec_env(mhi_cntrl) == MHI_EE_RDDM)

Do we really need to check for rddm_image? Wouldn't the EE check sufficient
enough?

In that case, the check can be moved to the prior if condition.

- Mani

> +			goto skip_mhi_reset;
> +
>  		dev_dbg(dev, "Triggering MHI Reset in device\n");
>  		mhi_set_mhi_state(mhi_cntrl, MHI_STATE_RESET);
>  
> @@ -495,6 +499,7 @@ static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl)
>  		}
>  	}
>  
> +skip_mhi_reset:
>  	dev_dbg(dev,
>  		 "Waiting for all pending event ring processing to complete\n");
>  	mhi_event = mhi_cntrl->mhi_event;
> -- 
> 2.7.4
> 
> 

-- 
மணிவண்ணன் சதாசிவம்
