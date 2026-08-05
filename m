Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D1E371D11;
	Wed,  5 Aug 2026 14:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785939445; cv=none; b=DjG1sV81SGC1yyx4gF6SOR1UHdT+Vdm0eUlEXd3FZz1A+iHc9cxW6c8kc1kvTAB4rnWzeKdPL7JAVm7ew27pL/qhtdIlhN2nE8EfxRuQaFdF0JHKtxPEtFoK8oL1RrtmM6HP3GHkoGrzjtDpOwIfcuk+QCgaGrQsi7VMZweeZtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785939445; c=relaxed/simple;
	bh=EXdyCvGaIqEzH5oeDSrAeE1+Zf1rM4JWhMSqnm2qvF4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Niqpkms9iG0ohhS+xPxE3ss9DzrBTgHpr64bVcHFVhxVzjtmvV2/3Aga3PQHnhT1PhMmYAlKRUXjYnef6DCSfMoPovVT6xSAx2Co3X/YUEb2e4nAoezlO8uti06ydeP8W9wkeFqmz1LpjQDhoCrHAe0m4OrB36mfWUHDIakDYJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kq+6pXca; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kq+6pXca"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D33B41F000E9;
	Wed,  5 Aug 2026 14:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785939444;
	bh=Ie2+JKjK5jN8rCNlPmOOTYA98VwSXNO2xvxS/jOwNVs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kq+6pXcaaPrqVLc5soYMW1m65VFTvtvIgGY5SoNUH+Mds7hitLT7s3dh4WeufVUjE
	 bY9ZmhtQLwBl+a7/ZUzf17fL8KbXTm9gFKV8P8JdovIREqds3+Kbk06n3u5xKRIg40
	 KlJyJ2rzDrmPHUzVgdMtEZU8FPyVz7OAY5TLXAzhx4iV1WhKfKfQrVyWd96uNcLOTU
	 gwkT/WScZT0fBb4aqu+tqxg9R57hKiv5DcE5vkO2tlwc6fhfNsldEV0du1UqHgUHdv
	 vNhmsXubXvRPu2tMAdhczVfRPfe2nhLNxrJMUWNBjrjejZjnlfhSVbhsDZ8HquCOlp
	 QCpBLMbRJxXYg==
Date: Wed, 5 Aug 2026 16:17:07 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: "Alexandra Lu (Nokia)" <alexandra.lu@nokia.com>
Cc: "mhi@lists.linux.dev" <mhi@lists.linux.dev>, 
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Vivek Pernamitta <quic_vpernami@quicinc.com>, Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: Re: [BUG] bus: mhi: host: pci_generic: runtime PM usage count leaked
 on
Message-ID: <mu6miayldnuesdqq2g62cbmvkoljjytuo3uw2vpo5fzwgf4aqw@gjeddbsekhfs>
References: <DS4PR08MB110616F286C62E19C2C94314188D32@DS4PR08MB11061.namprd08.prod.outlook.com>
 <LV2PR08MB11057B554648B1B262EAE4ADE88D32@LV2PR08MB11057.namprd08.prod.outlook.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <LV2PR08MB11057B554648B1B262EAE4ADE88D32@LV2PR08MB11057.namprd08.prod.outlook.com>

On Wed, Aug 05, 2026 at 01:57:15PM +0000, Alexandra Lu (Nokia) wrote:
> Resend in plain text as previous email in HTML format was rejected by the list servers.
> 
> 
> Hi Mani,
> 
> The following was discovered by AI while I was working PCIe device managed by Linux kernel. There appears to be an unbalanced runtime PM reference in pci_generic.c
> affecting devices that set .no_m3. It checked against v7.1 and it is still present there.
> 
> mhi_pci_probe() only releases the reference taken by local_pci_probe() when both PME from D3hot and M3 are supported:
> 
>                /* Allow runtime suspend only if both PME from D3Hot and M3 are supported */
>                if (pci_pme_capable(pdev, PCI_D3hot) && !(info->no_m3)) {
>                               pm_runtime_set_autosuspend_delay(&pdev->dev, 2000);
>                               pm_runtime_use_autosuspend(&pdev->dev);
>                               pm_runtime_mark_last_busy(&pdev->dev);
>                               pm_runtime_put_noidle(&pdev->dev);
>                }
> 
> but mhi_pci_remove() re-takes that reference based on PME capability alone:
> 
>                /* balancing probe put_noidle */
>                if (pci_pme_capable(pdev, PCI_D3hot))
>                               pm_runtime_get_noresume(&pdev->dev);
> 
> Commit 0494cf9793b7 ("bus: mhi: host: pci_generic: Disable runtime PM for QDU100") added the !(info->no_m3) term to the probe-side condition but left the removal-side condition unchanged, so the two no longer mirror each other. For a device that is PME capable and sets .no_m3, probe never performs the put that this get is documented to balance, and one usage count is leaked per bind/unbind cycle. Tracing it through, with the baseline of count=1 / runtime_auto=false that pci_pm_init() establishes via pm_runtime_forbid():
> 
>                                                                            M3 supported               no_m3
>   bind:                 core get_sync                              2                           2
>                      probe put_noidle                       1                           (skipped) 2
>                               mission-mode allow                0 auto=true     1 auto=true
>   unbind:            core get_sync                              1                           2
>                                remove forbid                             2 auto=false   3 auto=false
>                               remove get_noresume             3                          4
>                                core put_noidle                          2                          3
>                               core put_sync                               1                          2
>   final                                                                               1 (baseline)    2 (baseline + 1)
> 
> It derived this after f227b246307e ("bus: mhi: host: pci_generic: Add pm_runtime_forbid() in remove callback"), since that commit also touches runtime PM balance in mhi_pci_remove(). It correctly balances the pm_runtime_allow() performed on the Mission Mode transition, but that is a separate pair from the put_noidle/get_noresume pair above, so the leak survives it unchanged. The only in-tree device setting .no_m3 today is qcom-qdu100, so whether this is currently observable in the field depends on that part advertising PME from D3hot. If it does not, the leak is latent rather than active. Either way the two conditions are intended to mirror each other and no longer do, and the practical impact has likely gone unnoticed because the PCI core forces unbound devices to D0 regardless of their runtime PM state. Reproducing on a .no_m3 device is just repeated bind/unbind:
> 
>   for i in $(seq 5); do
>       echo $BDF > /sys/bus/pci/drivers/mhi-pci-generic/unbind
>       echo $BDF > /sys/bus/pci/drivers/mhi-pci-generic/bind
>   done
> 

Thanks for the report! This indeed is a legitimate bug that should be fixed.
Please send the patch as per the Linux Kernel patch submission guidelines [1]
and I'll be happy to take it.

- Mani

[1] Documentation/process/submitting-patches.rst

-- 
மணிவண்ணன் சதாசிவம்
