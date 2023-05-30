Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8991E17AAA
	for <mhi@lists.linux.dev>; Tue, 30 May 2023 10:31:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EC48C4339B;
	Tue, 30 May 2023 10:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685442675;
	bh=isNg8G9UAkzkCfwz0fquUKYOKQOroneXLwlqoTJcDjk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qi5Wf+FJR7bJyG9rMnZeEQi/LREtl2OPSa/0q9FSGvFNh17vUwEpv3exaWi5SRwoM
	 qkx4kW13vxi/gG8Nmn/3IhAvHke6LH9bU2YG61Ky0CEcp7NQ83MAddkS3ygq895nnE
	 Rz+D4nVpaRJZL3rLwple4z8imHZ8FC2pWZUht03lXnjvE3xhOXNreZj+fUo6Loduby
	 xPk/sKK7SKE/9A4BPD/cgCeL8hBjYasCpOYXD+/8F8S2zFcPoHPfwdgl1+TRE8jsyb
	 TZk56TbBK0MFc20jWVZN1TOk3BKNdyVWyJQsUg7iKTiHvxBpzwvgcNghuTOsC9Ucxe
	 Bl4lLw4cXap4g==
Date: Tue, 30 May 2023 16:01:03 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Daniele Palmas <dnlplm@gmail.com>
Cc: Siddartha Mohanadoss <smohanad@codeaurora.org>,
	Sujeev Dias <sdias@codeaurora.org>,
	Jeffrey Hugo <quic_jhugo@quicinc.com>, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/1] bus: mhi: host: allow SBL as initial EE
Message-ID: <20230530103103.GB6379@thinkpad>
References: <20230530091340.3513141-1-dnlplm@gmail.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230530091340.3513141-1-dnlplm@gmail.com>

On Tue, May 30, 2023 at 11:13:40AM +0200, Daniele Palmas wrote:
> There are situations in which SBL is a legitimate initial execution
> environment (e.g. modem stuck in SBL due to a firmware failure...), but
> mhi refuses to start:
> 
> mhi-pci-generic 0000:01:00.0: MHI PCI device found: foxconn-sdx55
> mhi-pci-generic 0000:01:00.0: BAR 0: assigned
> mhi-pci-generic 0000:01:00.0: enabling device (0000 -> 0002)
> mhi mhi0: Requested to power ON
> mhi mhi0: SECONDARY BOOTLOADER is not a valid EE for power on
> mhi-pci-generic 0000:01:00.0: failed to power up MHI controller
> mhi-pci-generic: probe of 0000:01:00.0 failed with error -5
> 
> Fix this by adding SBL as an allowed initial execution environment.
> 

What can you do with the modem when firmware failure happens? If there is a
usecase, please explain.

- Mani

> Fixes: 3000f85b8f47 ("bus: mhi: core: Add support for basic PM operations")
> Signed-off-by: Daniele Palmas <dnlplm@gmail.com>
> ---
>  drivers/bus/mhi/host/internal.h | 2 +-
>  drivers/bus/mhi/host/pm.c       | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
> index 2e139e76de4c..3bdcd2321aa5 100644
> --- a/drivers/bus/mhi/host/internal.h
> +++ b/drivers/bus/mhi/host/internal.h
> @@ -56,7 +56,7 @@ extern const char * const mhi_ee_str[MHI_EE_MAX];
>  
>  #define MHI_IN_PBL(ee) (ee == MHI_EE_PBL || ee == MHI_EE_PTHRU || \
>  			ee == MHI_EE_EDL)
> -#define MHI_POWER_UP_CAPABLE(ee) (MHI_IN_PBL(ee) || ee == MHI_EE_AMSS)
> +#define MHI_POWER_UP_CAPABLE(ee) (MHI_IN_PBL(ee) || ee == MHI_EE_AMSS || ee == MHI_EE_SBL)
>  #define MHI_FW_LOAD_CAPABLE(ee) (ee == MHI_EE_PBL || ee == MHI_EE_EDL)
>  #define MHI_IN_MISSION_MODE(ee) (ee == MHI_EE_AMSS || ee == MHI_EE_WFW || \
>  				 ee == MHI_EE_FP)
> diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
> index 083459028a4b..18872c5017be 100644
> --- a/drivers/bus/mhi/host/pm.c
> +++ b/drivers/bus/mhi/host/pm.c
> @@ -1203,10 +1203,11 @@ int mhi_sync_power_up(struct mhi_controller *mhi_cntrl)
>  
>  	wait_event_timeout(mhi_cntrl->state_event,
>  			   MHI_IN_MISSION_MODE(mhi_cntrl->ee) ||
> +			   mhi_cntrl->ee == MHI_EE_SBL ||
>  			   MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state),
>  			   msecs_to_jiffies(mhi_cntrl->timeout_ms));
>  
> -	ret = (MHI_IN_MISSION_MODE(mhi_cntrl->ee)) ? 0 : -ETIMEDOUT;
> +	ret = (MHI_IN_MISSION_MODE(mhi_cntrl->ee) || mhi_cntrl->ee == MHI_EE_SBL) ? 0 : -ETIMEDOUT;
>  	if (ret)
>  		mhi_power_down(mhi_cntrl, false);
>  
> -- 
> 2.37.1
> 

-- 
மணிவண்ணன் சதாசிவம்
