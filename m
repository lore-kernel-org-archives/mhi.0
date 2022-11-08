Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E682F3B
	for <mhi@lists.linux.dev>; Tue,  8 Nov 2022 14:39:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B52BC433C1;
	Tue,  8 Nov 2022 14:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667918353;
	bh=QDT9Wu4zEFDcxLcdx7d/dXKLdqiB/K//jCIvPU3NFT0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mA8SdYBiws4RwfX3pw+HDu71QxJ47TkBw8iFWE6PfgLU90VpZILvMDaJ6EciTQCD6
	 BFjaqXHFvbBq1B08uyEYSdqWiVJLu/D3n79PT0MpqmfRA9W/ToMQyInlRTy8kmyNqo
	 8dmTK88zuI32ru8IW6TkbT966xUBht9W5X87yNQc84zPoxXAxXOpqal+aU+RIuvnOe
	 icM96eHuDmrVMX91xQqtDmZdYgA4KkYfFrzbRgK2osPpnYIs0at4z2EWvEmUoV7v9m
	 GLnH2qkr9v7gHeRY9zY9M37xD9CCKGIjHuM89HM5otXJsDL00+g8HeiauYuNBslxxe
	 XYnCQgNUx3zzQ==
Date: Tue, 8 Nov 2022 20:09:02 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,
	Hemant Kumar <quic_hemantk@quicinc.com>,
	linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev
Subject: Re: [PATCH v5] bus: mhi: host: make mhi_controller_config::event_cfg
 const
Message-ID: <20221108143902.GA88842@thinkpad>
References: <20220829205112.12036-1-quic_jjohnson@quicinc.com>
 <20220830171147.24338-1-quic_jjohnson@quicinc.com>
 <20220907080016.GA22505@workstation>
 <87fsettvtc.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87fsettvtc.fsf@kernel.org>

On Tue, Nov 08, 2022 at 03:33:35PM +0200, Kalle Valo wrote:
> Manivannan Sadhasivam <mani@kernel.org> writes:
> 
> > On Tue, Aug 30, 2022 at 10:11:47AM -0700, Jeff Johnson wrote:
> >> Currently the event_cfg pointer in struct mhi_controller_config is not
> >> defined as a const pointer. This prevents clients from registering a
> >> read-only configuration unless they use a typecast. Since the
> >> event_cfg should not be modified once registered, add the const
> >> qualifier to event_cfg. This is aligned with the definition of ch_cfg.
> >> 
> >> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> >
> > Applied to mhi-next!
> 
> BTW what happened to this patch? I cannot find it anywhere.
> 

Sorry! I did apply this patch earlier locally but didn't push it to
remote. So it got lost.

Now pushed! Thanks for spotting.

> -- 
> https://patchwork.kernel.org/project/linux-wireless/list/
> 
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
> 

-- 
மணிவண்ணன் சதாசிவம்
