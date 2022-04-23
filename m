Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3977C
	for <mhi@lists.linux.dev>; Sat, 23 Apr 2022 13:14:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87D7CC385A5;
	Sat, 23 Apr 2022 13:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650719676;
	bh=EhGNChbTex4daXC/4M0L+MFTZGt5iVXyh5mOH6CzWeM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WEmbry3swwcKTDm+Y+ygHIERtUNF07Xpg8tZ0fNPrw3SURPGXJCuDUSlWatSz4NzS
	 J7WRYJHTHP1LG048fDCbUzh0D8pR1so2Tb81e1ggWtWQW5vKmUM8ts5CYeTJmRmcue
	 nEQQZR189UIYCpuyXDhZjJ03PaRJJg1kUJEMY/QDNjpxl3ij7XOCjeJ71k+HsgWREE
	 rFVNuLh8oQ8v9npLTz7zopnpRp/wOnZL+8kp6tZcF6/g5ut7lNG7dASJC0YpwHVE7X
	 R4FX+Izd/8WE7NmavgLgGwHE0LDpZO0bIbmbQN2OkA4PnLPWQS04z2sAF1Vq0IIe6d
	 /RnyZwKr6/Z+w==
Date: Sat, 23 Apr 2022 18:44:29 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: quic_hemantk@quicinc.com, quic_bbhatt@quicinc.com, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] bus: mhi: host: Wait for ready state after reset
Message-ID: <20220423131429.GN374560@thinkpad>
References: <1650302562-30964-1-git-send-email-quic_jhugo@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1650302562-30964-1-git-send-email-quic_jhugo@quicinc.com>

On Mon, Apr 18, 2022 at 11:22:42AM -0600, Jeffrey Hugo wrote:
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
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Reviewed-by: Hemant Kumar <quic_hemantk@quicinc.com>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Applied to mhi-next!

Thanks,
Mani

> ---
> 
> v4:
> Cleanup email domain change
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
> index 3d90b8e..c000a92 100644
> --- a/drivers/bus/mhi/host/pm.c
> +++ b/drivers/bus/mhi/host/pm.c
> @@ -476,6 +476,15 @@ static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl)
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
