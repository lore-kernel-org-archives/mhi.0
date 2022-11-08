Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BDB28EE
	for <mhi@lists.linux.dev>; Tue,  8 Nov 2022 13:33:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C9A6C433D6;
	Tue,  8 Nov 2022 13:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667914420;
	bh=7XY63BVNkDFf8XNi82/PutUfKJA6hYvAAgkd8WIXW3o=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=YcKIrks8T6BZ3a2ieJjFEyPCR56ZLq/aKIYJdZxdCIcWRLdX4BsI5rv4d1EkNjo20
	 HqC+9lRqeRJ380eIVwEHXQezcPy4Gt9Y1IhtGexYSN1yTwmRxwJUIxkpOxwjonti3M
	 ixtx+bi2XxxEp+oxHisVX2IJnRcGH3sPlPuUhMXIrxyei0l8G7e7dzepmvTt2fUlCC
	 6FaoFTVKm1DPaa30pN2TvPKHwDUsRdbHVqvast1h+cnYDhfeznCuAsP9Y7RK+gizlP
	 NXWydNDHDz/bG9fnLzlbYLFWYVwwCD8CrEsSyN/+WL98LMMTjN6qLOyT8F9nFwSd9i
	 CqOCpbRKfC9og==
From: Kalle Valo <kvalo@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,  Hemant Kumar <quic_hemantk@quicinc.com>,  linux-arm-msm@vger.kernel.org,  mhi@lists.linux.dev
Subject: Re: [PATCH v5] bus: mhi: host: make mhi_controller_config::event_cfg const
References: <20220829205112.12036-1-quic_jjohnson@quicinc.com>
	<20220830171147.24338-1-quic_jjohnson@quicinc.com>
	<20220907080016.GA22505@workstation>
Date: Tue, 08 Nov 2022 15:33:35 +0200
In-Reply-To: <20220907080016.GA22505@workstation> (Manivannan Sadhasivam's
	message of "Wed, 7 Sep 2022 13:30:16 +0530")
Message-ID: <87fsettvtc.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Manivannan Sadhasivam <mani@kernel.org> writes:

> On Tue, Aug 30, 2022 at 10:11:47AM -0700, Jeff Johnson wrote:
>> Currently the event_cfg pointer in struct mhi_controller_config is not
>> defined as a const pointer. This prevents clients from registering a
>> read-only configuration unless they use a typecast. Since the
>> event_cfg should not be modified once registered, add the const
>> qualifier to event_cfg. This is aligned with the definition of ch_cfg.
>> 
>> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
>
> Applied to mhi-next!

BTW what happened to this patch? I cannot find it anywhere.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
