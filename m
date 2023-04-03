Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD85631
	for <mhi@lists.linux.dev>; Mon,  3 Apr 2023 05:45:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1739C433D2;
	Mon,  3 Apr 2023 05:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680500736;
	bh=HF4zXr7YlZTAcnD2hGh5dmkIZO641Z6Jw2n7nFuw+/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KRRtHJ1LxxNmiVh6nQBuwS5XkdYIGrtMLp4wLAGxhaPHMOUQOTY1qIarZ0tY9nGxC
	 H8pwkIKvZBvdavczazPcSCvMXVHiaWhPuCDO0CiNcRHW/gGnScNvup/Q+QpyPviMCj
	 U9KVxJjBmzTghdAJdyiCLFVbmcIEIk0LZSLhtK7L1KIURbb5FjqTpv4h1yJDFstG7B
	 g8uyzHhgbIh7zeSNi5kbCIJttjDHJTlfAz66JIAnJWBSnQiij1J64ARJZoBwl6cNsI
	 tqfPidIoWE70yjAxegmojGsxoKWmTAh1nF13vdWA5Jr5MxZlF09OICpi2xQtpj8Pps
	 gjg4pS7yw1sgw==
Date: Mon, 3 Apr 2023 11:15:31 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] bus: mhi: host: Remove duplicate ee check for syserr
Message-ID: <20230403054531.GK4627@thinkpad>
References: <1674597444-24543-1-git-send-email-quic_jhugo@quicinc.com>
 <1674597444-24543-2-git-send-email-quic_jhugo@quicinc.com>
 <20230403053730.GI4627@thinkpad>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230403053730.GI4627@thinkpad>

On Mon, Apr 03, 2023 at 11:07:35AM +0530, Manivannan Sadhasivam wrote:
> On Tue, Jan 24, 2023 at 02:57:23PM -0700, Jeffrey Hugo wrote:
> > If we detect a system error via intvec, we only process the syserr if the
> > current ee is different than the last observed ee.  The reason for this
> > check is to prevent bhie from running multiple times, but with the single
> > queue handling syserr, that is not possible.
> > 
> > The check can cause an issue with device recovery.  If PBL loads a bad SBL
> > via BHI, but that SBL hangs before notifying the host of an ee change,
> > then issuing soc_reset to crash the device and retry (after supplying a
> > fixed SBL) will not recover the device as the host will observe a PBL->PBL
> > transition and not process the syserr.  The device will be stuck until
> > either the driver is reloaded, or the host is rebooted.  Instead, remove
> > the check so that we can attempt to recover the device.
> > 
> > Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> 
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> 

Forgot to add that, this patch also needs a fixes tag and backporting.

- Mani

> - Mani
> 
> > Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
> > ---
> >  drivers/bus/mhi/host/main.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
> > index df0fbfe..0c3a009 100644
> > --- a/drivers/bus/mhi/host/main.c
> > +++ b/drivers/bus/mhi/host/main.c
> > @@ -503,7 +503,7 @@ irqreturn_t mhi_intvec_threaded_handler(int irq_number, void *priv)
> >  	}
> >  	write_unlock_irq(&mhi_cntrl->pm_lock);
> >  
> > -	if (pm_state != MHI_PM_SYS_ERR_DETECT || ee == mhi_cntrl->ee)
> > +	if (pm_state != MHI_PM_SYS_ERR_DETECT)
> >  		goto exit_intvec;
> >  
> >  	switch (ee) {
> > -- 
> > 2.7.4
> > 
> 
> -- 
> மணிவண்ணன் சதாசிவம்

-- 
மணிவண்ணன் சதாசிவம்
