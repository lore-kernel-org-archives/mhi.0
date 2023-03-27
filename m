Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11226A29
	for <mhi@lists.linux.dev>; Mon, 27 Mar 2023 10:23:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A426CC433EF;
	Mon, 27 Mar 2023 10:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679912589;
	bh=cznD+cbBiom3mZdOBAF5neKKYMVd/kyzeOHaPpGn7q0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hv7zuAqo1uTMOAoGK5/bleBXMR0ApJAVGiiL3r15iEu4vABCjfjxLfp+Wyc8alcg+
	 DzgDI/cvMlvkBPKSSIVXGYNE9+DVx3ok757cNQ3OKCl4YDw8nAKt6yOA+E0B1sJx8/
	 v3CzvwlwTCffJ08BMVtmbohIHChkqijE2kEeArCaW7m6qAXFuswJ6XjsGQccRY6qaR
	 EHl1JPR86iO8Ct0Z8QlhqlQ/+8IpvrbmHWocOLnW/cjlzzs2nYDAsKqycwmN9svEIu
	 BwHAMWa8hhZLHIyaBVYxIEPLVOykH6VoP7FPJsIAs4UbiTYUqCMvcaSQd5Nl00Lndw
	 SJDx+NYf3filg==
Date: Mon, 27 Mar 2023 15:52:57 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: mani@kernel.org, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] bus: mhi: host: Range check CHDBOFF and ERDBOFF
Message-ID: <20230327102257.GC16424@thinkpad>
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

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

Thanks,
Mani

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
> 

-- 
மணிவண்ணன் சதாசிவம்
