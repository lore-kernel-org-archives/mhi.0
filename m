Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5048F78
	for <mhi@lists.linux.dev>; Tue, 22 Aug 2023 11:50:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B784EC433C7;
	Tue, 22 Aug 2023 11:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692705037;
	bh=K6qHsHNv+YaJ8gAyRbjPMOoeo0yAFJvWTILnD6NXzrE=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=BYLhxbdeFsyimUU8GJSdxRrKPCK6Gd07fV1royD5DhJEqaBUYAbh7bKX0+oGhxcy6
	 17M/uHiscpfnpBqHsRMxJyXlBxuz1idjNnUzaAJuWL63sBDrs81MavnaslSZ0695oe
	 12nDHMLoqoxANE9UsgMX/a/xJ7ANCprbT900470mZBoHiAo0XoyzoMO09P7vWboUv9
	 pdWz+TXROq7UDq55fpVk/1fdtVGFJ1NAv+lwVfyl4IfT04BYZkXJ8iBtTxP2EyQVsD
	 WvcC9PyM8/F0DS0ss7x0b7qZQshyB/G3twsl04XTcf49Mf17CE4rrLrGR8GGUEPH1q
	 OqtNtkRD2adYA==
From: Kalle Valo <kvalo@kernel.org>
To: Qiang Yu <quic_qianyu@quicinc.com>
Cc: mani@kernel.org,  quic_jhugo@quicinc.com,  mhi@lists.linux.dev,
  linux-arm-msm@vger.kernel.org,  linux-kernel@vger.kernel.org,
  quic_cang@quicinc.com,  quic_mrana@quicinc.com
Subject: Re: [PATCH v2] mhi: host: Add standard ELF header image download
 functionality
References: <1691395192-16090-1-git-send-email-quic_qianyu@quicinc.com>
Date: Tue, 22 Aug 2023 14:51:33 +0300
In-Reply-To: <1691395192-16090-1-git-send-email-quic_qianyu@quicinc.com>
	(Qiang Yu's message of "Mon, 7 Aug 2023 15:59:52 +0800")
Message-ID: <87edjvwb0a.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Qiang Yu <quic_qianyu@quicinc.com> writes:

> From: Mayank Rana <quic_mrana@quicinc.com>
>
> Some devices (e.g. WLAN chips) are unable to handle the non-standard ELF
> format of the FBC image and thus need special handling of the FBC image.
>
> Add standard_elf_image flag which makes decision in terms of how FBC image
> based AMSS image is being downloaded with connected endpoint.
> FBC image is having two image combine: SBL image + AMSS image.
> 1. FBC image download using legacy single ELF header image format:
> - SBL image: 512KB of FBC image is downloaded using BHI.
> - AMSS image: full FBC image is downloaded using BHIe.
> 2. FBC image download using separate ELF header image format:
> - SBL image: 512 KB of FBC image is downloaded using BHI.
> - AMSS image: 512 KB onward FBC image is downloaded using BHIe.
> There is no change for SBL image download. Although AMSS image start
> address is end address of SBL image while using separate ELF header format.
>
> Signed-off-by: Mayank Rana <quic_mrana@quicinc.com>
> [quic_qianyu@quicinc.com: Update commit message, minor updates]
> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>

I guess this is for an out-of-tree driver? I haven't heard any such
requirements for ath11k or ath12k.

> --- a/drivers/bus/mhi/host/boot.c
> +++ b/drivers/bus/mhi/host/boot.c
> @@ -495,6 +495,13 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>  	 * device transitioning into MHI READY state
>  	 */
>  	if (mhi_cntrl->fbc_download) {
> +		dev_dbg(dev, "standard_elf_image: %s\n",
> +				(mhi_cntrl->standard_elf_image ? "True" : "False"));
> +		if (mhi_cntrl->standard_elf_image) {
> +			fw_data = firmware->data + mhi_cntrl->sbl_size;
> +			fw_sz = fw_sz - mhi_cntrl->sbl_size;
> +		}

So you are basically skipping the first sbl_size bytes of the firmware
file? Why not just fix the firmware file in userspace? Or maybe you can
use the recently added[1] mhi_cntrl->fw_data pointer and handle this in
your driver instead?

[1] https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git/commit/?h=mhi-next&id=efe47a18e43f59f063a82ccaa464a3b4844bb8a8

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
