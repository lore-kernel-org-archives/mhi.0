Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D307E0
	for <mhi@lists.linux.dev>; Mon, 18 Apr 2022 05:59:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14806C385A1;
	Mon, 18 Apr 2022 05:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650261547;
	bh=6XsKdeyorX8l88y4/Ai6UPJIYHjYeNK501hbArgEbg0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HuUJUAe4Dxx3vQZ2bIZLpQsRRhsB3D7L5onNmR1GgVxg0l+uNHBPo6Zlh+f9+UT2/
	 hSxyJOxWlheDbJg80vVCyZ34oxEYDkf3/Th3tlOQ/K3s+DKZ/ha98Rge/4semZRpuB
	 mV0zWw5MVpo8BzQaNJzuH8m9AE9Z4acx+5fHt7FYm98+MOXY2cQZ75JWzI8n/fUiHF
	 jNYNa7IbEsz9mHC7etmlbqXN2T4ejZf/vcfESdFbRYZxio7pnVsXvQ1fRbuOJZPuS4
	 zciYK1o3VAJuVlXFvd/BuZaz42G+Igw/YWjZ3dPAIUuB/hvjkdyr3fGscV5PKlYqTe
	 VQIdpJucRZYqA==
Date: Mon, 18 Apr 2022 11:29:00 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: quic_hemantk@quicinc.com, quic_bbhatt@quicinc.com, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jeffrey Hugo <jhugo@codeaurora.org>
Subject: Re: [PATCH v3] bus: mhi: host: Wait for ready state after reset
Message-ID: <20220418055900.GD7431@thinkpad>
References: <1649875946-32516-1-git-send-email-quic_jhugo@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1649875946-32516-1-git-send-email-quic_jhugo@quicinc.com>

On Wed, Apr 13, 2022 at 12:52:26PM -0600, Jeffrey Hugo wrote:
> From: Jeffrey Hugo <jhugo@codeaurora.org>
> 
> After the device has signaled the end of reset by clearing the reset bit,
> it will automatically reinit MHI and the internal device structures.  Once
> That is done, the device will signal it has entered the ready state.
> 
> Signaling the ready state involves sending an interrupt (MSI) to the host
> which might cause IOMMU faults if it occurs at the wrong time.
> 
> If the controller is being powered down, and possibly removed, then the
> reset flow would only wait for the end of reset.  At which point, the host
> and device would start a race.  The host may complete its reset work, and
> remove the interrupt handler, which would cause the interrupt to be
> disabled in the IOMMU.  If that occurs before the device signals the ready
> state, then the IOMMU will fault since it blocked an interrupt.  While
> harmless, the fault would appear like a serious issue has occurred so let's
> silence it by making sure the device hits the ready state before the host
> completes its reset processing.
> 
> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
> Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
> 
> v3:
> Rebase and use dev_err over dev_warn
> 
> v2: 
> Fix subject and remove use of cur_state
> 
>  drivers/bus/mhi/host/pm.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
> index a0e91bd..f46158e 100644
> --- a/drivers/bus/mhi/host/pm.c
> +++ b/drivers/bus/mhi/host/pm.c
> @@ -483,6 +483,15 @@ static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl)
>  		 * hence re-program it
>  		 */
>  		mhi_write_reg(mhi_cntrl, mhi_cntrl->bhi, BHI_INTVEC, 0);
> +
> +		if (!MHI_IN_PBL(mhi_get_exec_env(mhi_cntrl))) {
> +			/* wait for ready to be set */
> +			ret = mhi_poll_reg_field(mhi_cntrl, mhi_cntrl->regs,
> +						 MHISTATUS,
> +						 MHISTATUS_READY_MASK, 1, 25000);
> +			if (ret)
> +				dev_err(dev, "Device failed to enter READY state\n");
> +		}
>  	}
>  
>  	dev_dbg(dev,
> -- 
> 2.7.4
> 
> 
