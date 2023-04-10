Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04738322B
	for <mhi@lists.linux.dev>; Mon, 10 Apr 2023 13:14:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E30CC433EF;
	Mon, 10 Apr 2023 13:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681132495;
	bh=W7rc4tAnnkDF+jqiSqVFhUih0Hb85Hq/IAnA8/Fl6wc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uwds1kNB3HtTwdCpSbG1OP3oAWrx/VpYSONB6hkkKPKVnV9NrYMq824H8Hqj2rD2m
	 J7bWBbhsKRXjJ/zoku+2fFKlg9gwgHM3t00M0KU2ymXCNWEh52CFt6BOYz14O0idRx
	 zXqA6u5LLoUv/kk+42jVMuoKPVBnuW4V29S18sBZh88eYZFcpS30CvOORrOguiOStn
	 utw2eQMkOma7h98QuDvWMJgKcVbPKhQE99B5ie6RMEYMyT/YP1ccPXLnzCnDOyZgGA
	 FY/MqIVx2FwsLreNY9jNIVYSPOPWlxaaFSEG+aIwHpf9nJPvqlTTGSlDE2KZSzuvMc
	 quvgenwnZv47g==
Date: Mon, 10 Apr 2023 18:44:46 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Vivek Pernamitta <quic_vpernami@quicinc.com>
Cc: mhi@lists.linux.dev, quic_qianyu@quicinc.com,
	manivannan.sadhasivam@linaro.org, quic_vbadigan@quicinc.com,
	quic_krichai@quicinc.com, quic_skananth@quicinc.com,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Hemant Kumar <hemantk@codeaurora.org>,
	Bhaumik Bhatt <bbhatt@codeaurora.org>,
	"open list:MHI BUS" <linux-arm-msm@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V6] bus: mhi: host: Avoid ringing EV DB if there is no
 elements to process
Message-ID: <20230410131446.GA4630@thinkpad>
References: <1680601458-9105-1-git-send-email-quic_vpernami@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1680601458-9105-1-git-send-email-quic_vpernami@quicinc.com>

On Tue, Apr 04, 2023 at 03:14:16PM +0530, Vivek Pernamitta wrote:
> currently mhi_process_data_event_ring()/mhi_process_ctrl_ev_ring()
> will ring DB even if there no ring elements to process.
> This could cause doorbell event to be processed by MHI device
> to check for any ring elements even it is none.
> So ring event DB only if any event ring elements are processed.
> 
> Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>

Slightly reworded the commit message and applied to mhi-next!

- Mani

> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
> changes since v6:
> 	updating the commit text.
> changes since v5:
> 	updating the commit text.
> changes since v4:
> 	updating the commit text with more information.
> changes since v3:
> 	- Updating commit text for multiple versions of patches.
> changes since v2:
> 	- Updated comments in code.
> changes since v1:
> 	- Add an check to avoid ringing EV DB in mhi_process_ctrl_ev_ring().
> ---
>  drivers/bus/mhi/host/main.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
> index df0fbfe..1bbdb75 100644
> --- a/drivers/bus/mhi/host/main.c
> +++ b/drivers/bus/mhi/host/main.c
> @@ -961,7 +961,9 @@ int mhi_process_ctrl_ev_ring(struct mhi_controller *mhi_cntrl,
>  	}
>  
>  	read_lock_bh(&mhi_cntrl->pm_lock);
> -	if (likely(MHI_DB_ACCESS_VALID(mhi_cntrl)))
> +
> +	/* Ring EV DB only if there is any pending element to process */
> +	if (likely(MHI_DB_ACCESS_VALID(mhi_cntrl)) && count)
>  		mhi_ring_er_db(mhi_event);
>  	read_unlock_bh(&mhi_cntrl->pm_lock);
>  
> @@ -1031,7 +1033,9 @@ int mhi_process_data_event_ring(struct mhi_controller *mhi_cntrl,
>  		count++;
>  	}
>  	read_lock_bh(&mhi_cntrl->pm_lock);
> -	if (likely(MHI_DB_ACCESS_VALID(mhi_cntrl)))
> +
> +	/* Ring EV DB only if there is any pending element to process */
> +	if (likely(MHI_DB_ACCESS_VALID(mhi_cntrl)) && count)
>  		mhi_ring_er_db(mhi_event);
>  	read_unlock_bh(&mhi_cntrl->pm_lock);
>  
> -- 
> 2.7.4
> 

-- 
மணிவண்ணன் சதாசிவம்
