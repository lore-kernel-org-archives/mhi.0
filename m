Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80B14699
	for <mhi@lists.linux.dev>; Mon, 29 Aug 2022 17:27:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1C3FC433C1;
	Mon, 29 Aug 2022 17:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661794026;
	bh=LngYf8P+LI6UrANiDYF1odyCTinChzauYVwqE9jZYEk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JnRPX5hGG/m2kiEPTmqWQY6QvgVVXyPU+eqjZ5agyPQQsKK/io9g7B/AvQtz+lCWz
	 WVq2GV+8lgaASRcL9+bJx3+eLbPu577683lRTJblVXNFKm5HMT3ClCSrLxO8bSsMg/
	 qZ4enOxWahqgcMobW+Wg1Q6JelWe1Fc+bsUMKPC8ikwv4y7RMdAW0cS7gBxVQivfLd
	 TkBudKMcPDibwIOgu0m2d6ccR8x3vxTuTvTWhJjpCqpiI+qDh+/6VfzGzdtUJEjXDq
	 yz4Et2enr5+rLrzo8WH75UqHVmRGgebfu9NXqI+JYY0zBMnYLXtYkVgzbB1PowQSbe
	 yKAdGB86SAeCQ==
Date: Mon, 29 Aug 2022 22:56:54 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: Qiang Yu <quic_qianyu@quicinc.com>, quic_hemantk@quicinc.com,
	loic.poulain@linaro.org, quic_jhugo@quicinc.com,
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_cang@quicinc.com,
	ath11k@lists.infradead.org
Subject: Re: [PATCH v3 1/1] bus: mhi: host: Fix up null pointer access in
 mhi_irq_handler
Message-ID: <20220829172654.GA84762@thinkpad>
References: <1658459838-30802-1-git-send-email-quic_qianyu@quicinc.com>
 <20220726080636.GE5522@workstation>
 <87czdrrc95.fsf@kernel.org>
 <20220729142221.GA9937@thinkpad>
 <87h71vc98l.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87h71vc98l.fsf@kernel.org>

On Mon, Aug 29, 2022 at 07:20:10PM +0300, Kalle Valo wrote:
> Manivannan Sadhasivam <mani@kernel.org> writes:
> 
> > On Tue, Jul 26, 2022 at 08:53:58PM +0300, Kalle Valo wrote:
> >> Manivannan Sadhasivam <mani@kernel.org> writes:
> >> 
> >> > +ath11k, Kalle
> >> >
> >> > On Fri, Jul 22, 2022 at 11:17:18AM +0800, Qiang Yu wrote:
> >> >> The irq handler for a shared IRQ ought to be prepared for running
> >> >> even now it's being freed. So let's check the pointer used by
> >> >> mhi_irq_handler to avoid null pointer access since it is probably
> >> >> released before freeing IRQ.
> >> >> 
> >> >> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
> >> >
> >> > Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> >> 
> >> This fixes the crash and my regression tests pass now, thanks. But
> >> please see my question below.
> >> 
> >> Tested-by: Kalle Valo <kvalo@kernel.org>
> >> 
> >
> > Thanks Kalle!
> 
> I just tested v6.0-rc3 and it's still crashing. What's the plan to get
> this fix to Linus?

Sorry for the delay. Just sent the PR to Greg for including it as a fix for
v6.0.

Thanks,
Mani

> 
> -- 
> https://patchwork.kernel.org/project/linux-wireless/list/
> 
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
மணிவண்ணன் சதாசிவம்
