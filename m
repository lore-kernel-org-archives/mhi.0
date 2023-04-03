Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0619E364
	for <mhi@lists.linux.dev>; Mon,  3 Apr 2023 05:17:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0495FC433D2;
	Mon,  3 Apr 2023 05:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680499040;
	bh=g2TSS6m0UMtjThk7tJNAadrmxBfJBuYpYI2CML4irS0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j/QRGMOcuaDDa2RhAQeD9MHMeuqXNqS23ZE/TWoO2ArLqF+WKfeWlC3RzppXrS9fo
	 sm8AFyrw7xyv7HCHp8+vdvZ2J+Dx8P/7XNYrS9wa/otAv8huW2YSVQw88p0A1tOgt7
	 U1uYv35/CqW77ve5hwCzb/0Gt/5sfqXQ0/2qBe1nvTYyJ+sshEcyMHl3IkOFe5/gbd
	 lagS1wWq/xYZvi1B2Xl8bc/QfdR+nYTcVjkitsLCqRPDm8W0kQyXmYqGksa4OvF5Ir
	 EoPJZ+U9DD+4n+h54TzHSVSoqMpo8k+SaYAA1GMiNSlJd2ZrpVh9q3KIqzRrnZb0JP
	 p2AQ0PXp5lqJw==
Date: Mon, 3 Apr 2023 10:47:15 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] bus: mhi: host: Range check CHDBOFF and ERDBOFF
Message-ID: <20230403051715.GB4627@thinkpad>
References: <1679674384-27209-1-git-send-email-quic_jhugo@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1679674384-27209-1-git-send-email-quic_jhugo@quicinc.com>

On Fri, Mar 24, 2023 at 10:13:04AM -0600, Jeffrey Hugo wrote:
> If the value read from the CHDBOFF and ERDBOFF registers is outside the
> range of the MHI register space then an invalid address might be computed
> which later causes a kernel panic.  Range check the read value to prevent
> a crash due to bad data from the device.
> 
> Fixes: 6cd330ae76ff ("bus: mhi: core: Add support for ringing channel/event ring doorbells")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

Applied to mhi-next!

- Mani

> Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> ---
> 
> v2:
> -CC stable
> -Use ERANGE for the error code
> 
>  drivers/bus/mhi/host/init.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
> index 3d779ee..b46a082 100644
> --- a/drivers/bus/mhi/host/init.c
> +++ b/drivers/bus/mhi/host/init.c
> @@ -516,6 +516,12 @@ int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
>  		return -EIO;
>  	}
>  
> +	if (val >= mhi_cntrl->reg_len - (8 * MHI_DEV_WAKE_DB)) {
> +		dev_err(dev, "CHDB offset: 0x%x is out of range: 0x%zx\n",
> +			val, mhi_cntrl->reg_len - (8 * MHI_DEV_WAKE_DB));
> +		return -ERANGE;
> +	}
> +
>  	/* Setup wake db */
>  	mhi_cntrl->wake_db = base + val + (8 * MHI_DEV_WAKE_DB);
>  	mhi_cntrl->wake_set = false;
> @@ -532,6 +538,12 @@ int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
>  		return -EIO;
>  	}
>  
> +	if (val >= mhi_cntrl->reg_len - (8 * mhi_cntrl->total_ev_rings)) {
> +		dev_err(dev, "ERDB offset: 0x%x is out of range: 0x%zx\n",
> +			val, mhi_cntrl->reg_len - (8 * mhi_cntrl->total_ev_rings));
> +		return -ERANGE;
> +	}
> +
>  	/* Setup event db address for each ev_ring */
>  	mhi_event = mhi_cntrl->mhi_event;
>  	for (i = 0; i < mhi_cntrl->total_ev_rings; i++, val += 8, mhi_event++) {
> -- 
> 2.7.4
> 

-- 
மணிவண்ணன் சதாசிவம்
