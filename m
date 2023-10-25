Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C8414ABC
	for <mhi@lists.linux.dev>; Wed, 25 Oct 2023 09:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m+tu1xFn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B126FC433C8;
	Wed, 25 Oct 2023 09:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698227686;
	bh=yaAsiujagvZOvQ/PZwj5xUzfTRKtOWgXCQg/2408jBA=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=m+tu1xFnEA69yPdgsePYfRs0i3vP7Lxr6ub4xdGpFSPPKNu1iDZBP6N7rXG83tZvL
	 Zq2sgl/rpQvJu8qk7ABR0hNPAyCpr5ENBTkezMMwgEUXHflTeVfZYyb5iGtSUCMt06
	 x/h76Ylb+so3oF9ZZV9AarumiUad/KPDN2F6C8jojq8UX4C3cWJ3d/wSKxQcLWTKdA
	 R87jTfWBF54nB3ufllxIoWKUogEsSJ6/WPtSUXTJ5ROCbM7NDqw2vo8DDe942TLise
	 W1OLTG0+UI+J3D8daZkfnQQB2um5XRP8qs9dwViO+J01sbwds7qmH7kPamzBWp/okK
	 gR/Sq9vjVtOEQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 2/3] wifi: ath11k: qmi: refactor ath11k_qmi_m3_load()
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230727100430.3603551-3-kvalo@kernel.org>
References: <20230727100430.3603551-3-kvalo@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: mhi@lists.linux.dev, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169822768265.891844.9494809896760074747.kvalo@kernel.org>
Date: Wed, 25 Oct 2023 09:54:45 +0000 (UTC)

Kalle Valo <kvalo@kernel.org> wrote:

> Simple refactoring to make it easier to add firmware-2.bin support in the
> following patch.
> 
> Earlier ath11k_qmi_m3_load() supported changing m3.bin contents while ath11k is
> running. But that's not going to actually work, m3.bin is supposed to be the
> same during the lifetime of ath11k, for example we don't support changing the
> firmware capabilities on the fly. Due to this ath11k requests m3.bin firmware
> file first and only then checks m3_mem->vaddr, so we are basically requesting
> the firmware file even if it's not needed. Reverse the code so that m3_mem
> buffer is checked first, and only if it doesn't exist, then m3.bin is requested
> from user space.
> 
> Checking for m3_mem->size is redundant when m3_mem->vaddr is NULL, we would
> not be able to use the buffer in that case. So remove the check for size.
> 
> Simplify the exit handling and use 'goto out'.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.9
> 
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
> Reviewed-by: Jeff Johnson <quic_jjohnson@quicinc.com>

2 patches applied to ath-next branch of ath.git, thanks.

b49381d3de3a wifi: ath11k: qmi: refactor ath11k_qmi_m3_load()
7db88b962f06 wifi: ath11k: add firmware-2.bin support

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230727100430.3603551-3-kvalo@kernel.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

