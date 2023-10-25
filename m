Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 713EE1C684
	for <mhi@lists.linux.dev>; Wed, 25 Oct 2023 07:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PjQoYfWq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3A1FC433C9;
	Wed, 25 Oct 2023 07:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698220698;
	bh=GUlN9Bi4G76bChK5FRQncDZVmEHwC4XhEnOh4TaUt3o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PjQoYfWqVVQXPgT8rqFrpcE6xWQZEfd6i4TrxdZCN6oYTvWa1CF16ZAdnp0mjtrs+
	 i53/Zsuf1O1W5xmIMjlN7o+0/WGTFWHUhv97mkmsGHDffZqINg6OfafBjzYpMNWXXG
	 +SE3xY+17l+5FvUkXpfK0UoofARoJVyq1UkqSVN1PFyn3YUqCIx2baXVjM4YOu9Gxw
	 dGK8yztR5D9N84QE1OXkchVnSvZJS2e67kRSNPI/HhUR4VdcEZhSsWBiFMytsAEI45
	 bTPeJIm9z6hGHJTyQB4RhezalBHcCoY/0eLcVikcAnlDTWBCc8rUGb9f/kVMOhSbBH
	 arysCpBHA+3wQ==
Date: Wed, 25 Oct 2023 13:28:14 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: mhi@lists.linux.dev
Subject: Re: [bug report] bus: mhi: ep: Do not allocate event ring element on
 stack
Message-ID: <20231025075814.GE3648@thinkpad>
References: <e7d05eeb-2b28-477d-be3f-7f6e9ad7aec5@moroto.mountain>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e7d05eeb-2b28-477d-be3f-7f6e9ad7aec5@moroto.mountain>

On Fri, Oct 20, 2023 at 04:54:33PM +0300, Dan Carpenter wrote:
> Hello Manivannan Sadhasivam,
> 
> The patch b910ee376ab3: "bus: mhi: ep: Do not allocate event ring
> element on stack" from Sep 1, 2023 (linux-next), leads to the
> following Smatch static checker warning:
> 
> drivers/bus/mhi/ep/main.c:106 mhi_ep_send_ee_event() error: potential null dereference 'event'.  (kzalloc returns null)
> drivers/bus/mhi/ep/main.c:121 mhi_ep_send_cmd_comp_event() error: potential null dereference 'event'.  (kzalloc returns null)
> drivers/bus/mhi/ep/main.c:77 mhi_ep_send_completion_event() error: potential null dereference 'event'.  (kzalloc returns null)
> drivers/bus/mhi/ep/main.c:92 mhi_ep_send_state_change_event() error: potential null dereference 'event'.  (kzalloc returns null)
> 
> drivers/bus/mhi/ep/main.c
>     101 int mhi_ep_send_ee_event(struct mhi_ep_cntrl *mhi_cntrl, enum mhi_ee_type exec_env)
>     102 {
>     103         struct mhi_ring_element *event = kzalloc(sizeof(struct mhi_ring_element), GFP_KERNEL);
> 
> No checks for NULL.  Some people have a rule that functions which can
> fail should not be in the declaration block.  From a static analysis
> perspective code in the declaration block is buggier than code in the
> code area.
> 

Thanks Dan for the report. Yes, it is indeed a bad idea to have the allocation
inside declaration. I will move it outside and add the error check.

- Mani

>     104         int ret;
>     105 
> --> 106         event->dword[0] = MHI_EE_EV_DWORD0(exec_env);
>     107         event->dword[1] = MHI_SC_EV_DWORD1(MHI_PKT_TYPE_EE_EVENT);
>     108 
>     109         ret = mhi_ep_send_event(mhi_cntrl, 0, event, 0);
>     110         kfree(event);
>     111 
>     112         return ret;
>     113 }
> 
> regards,
> dan carpenter

-- 
மணிவண்ணன் சதாசிவம்
