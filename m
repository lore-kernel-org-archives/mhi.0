Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9EF8BA55
	for <mhi@lists.linux.dev>; Mon,  7 Nov 2022 13:52:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4171EC433D6;
	Mon,  7 Nov 2022 13:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667829137;
	bh=J0p+5OofeNKsFF8+ygfkunKsonrzAuSonRP2UWr2fjc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nwlxcpkck+r1ayjjKuoVriYdYAvKHpzTm49y3jQ6G2uxFNbj8J91dm6z6kAT3fuAn
	 Z+bPz5ON3Exilvis5bmisz6sIsI/tane1PiDwQVFg8hkbtnH5LkhIqi1o1j1snwM6k
	 AYmTHxbYT3yd0djZRKr3oMZQtBki8j1JNbumQ6q4URjwgIS/lcRNZnqhLAqAaYiRUN
	 gQLoe+BC7/M8qny12DRV+K+dqPRgUMBwMUVnunxmAI93/5mSgI910kKT0CI+lapHnh
	 /S2aFqY8xrOrfA75xfdZVTbvmR4yqmdh4Nr3gOCJIOrXKLkhImg9y0SULMGdaCRTLq
	 KGLHP/CfrCxkQ==
Date: Mon, 7 Nov 2022 19:22:07 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Song Fuchang <song.fc@gmail.com>
Cc: mhi@lists.linux.dev
Subject: Re: [PATCH v2 RESEND rebased] bus: mhi: host: pci_generic: Add HP
 variant of T99W175
Message-ID: <20221107135207.GG2220@thinkpad>
References: <836f0bd5-0f38-dbf1-c3a0-d670cc09cb2e@gmail.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <836f0bd5-0f38-dbf1-c3a0-d670cc09cb2e@gmail.com>

On Mon, Nov 07, 2022 at 09:10:47PM +0800, Song Fuchang wrote:
> The Foxconn T99W175 modem has an HP variant, which has
> the following output from lspci:
> 
>   01:00.0 Wireless controller [0d40]: Device 03f0:0a6c
> 
> It also has some HP-specific serial numbers on the
> metal case. It works well with this driver, so add
> support for this to the pci_generic driver.
> 
> Signed-off-by: Song Fuchang <song.fc@gmail.com>
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

Still it didn't apply using git am. So I went ahead and applied manually to
mhi-next.

Next time, please try applying the patches to mhi-next before sending to see if
everything is fine about the patch.

Thanks,
Mani

> ---
> 
> 
> Changes in v2:
>   - Add more detailed commit message and rebased on mhi-next.
> 
> 
>  drivers/bus/mhi/host/pci_generic.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index fb3b050aed70..b58a30367896 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -598,6 +598,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
>         /* MV32-WB (Cinterion) */
>         { PCI_DEVICE(0x1269, 0x00bb),
>                 .driver_data = (kernel_ulong_t) &mhi_mv32_info },
> +       /* T99W175 (sdx55), HP variant */
> +       { PCI_DEVICE(0x03f0, 0x0a6c),
> +               .driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
>         {  }
>  };
>  MODULE_DEVICE_TABLE(pci, mhi_pci_id_table);
> -- 
> 2.37.3
> 
> 
> 

-- 
மணிவண்ணன் சதாசிவம்
