Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8AF377009;
	Wed, 27 May 2026 08:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779871438; cv=none; b=dSzH67GYcmkSLPkVuFz92Hn6ZiA2IoisrEVIFWXKZ1j7iN0MSv774X6RrahMwvdeKYUgmK9fFhgSQrVtgrGOIufrY5J5wPpXwrl0LVg0wb7rOPnhRwFsyxvGtnarM22kjKl/oUaWJguvYdL3VKWnRJnuvl+LKBkOC6Bpw4Wv9bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779871438; c=relaxed/simple;
	bh=xM6pn0UC9+sOiDUQppprjDUfEvnLXNVq9kDqk7p9l+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sINKeCj/9HTbFVMkO5NsyBJd/U1R86XLcRYS/5qzjdZGgTQAF5BcfaEHp496C81quaFCNtu8QFHHrCr50hHkqVZGK8fWssKcn/6JOhP77K3q+Fnqs48LGmyhOoofIrDsRyG/6mYmQV6BSDM1ef2Hqsp7E7SUqv76vSre4el+4vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QhtrgpfG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QhtrgpfG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21B321F000E9;
	Wed, 27 May 2026 08:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779871437;
	bh=apMDLFVE20VYz0VOe6++2k+xxLMIVv62QQ00GL6rdw8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QhtrgpfGElMe7XH6RzsqwL8wS7nMq1YuAHuFicfSjU9uu7y9YBTEgIR4NECmdAU0H
	 OpA/9u6xHow23ELrdx6rW4M0vZIGBTWxa8EO1SKLl7TZrlQzzot9okOcSQwT1o7hYA
	 9Y314ArgfzR/adle0nyvCyW5zUUUMpF27OGsrCOjPYPfv4cZVW2HvgWoaIkTHZtPGK
	 /IGrrDnNV/c4+tWPxMgD15qu4QBPYiGGwco12bptgSz86ShwNNVEcglFobL+cfjNUf
	 dEYwkeZkpxMwO+V9JzZyYfv86V0ZQUrYrrGvETkWZErav3KHJS/o/QxKOcTH7UpKxT
	 EhHyWC/dnU16Q==
Date: Wed, 27 May 2026 10:43:53 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Slark Xiao <slark_xiao@163.com>
Cc: "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>, 
	"mhi@lists.linux.dev" <mhi@lists.linux.dev>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Subject: Re: Concern about commit bus: mhi: host: pci_generic: Read
 SUBSYSTEM_VENDOR_ID for VF's to check status
Message-ID: <mqnxszftflkzm34risvyrkfwy226e5gycllw2fpgexcg5ejdat@nzqnzczcwfqj>
References: <2441e0c7.6edc.19e6887e64f.Coremail.slark_xiao@163.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2441e0c7.6edc.19e6887e64f.Coremail.slark_xiao@163.com>

On Wed, May 27, 2026 at 04:23:17PM +0800, Slark Xiao wrote:
> Hi Mani,
> I got a problem recently about the health_check function. It's disabled in my Thinkpad X1 Gen14.
> After checking, this feature was disbaled because the commit bus: mhi: host: pci_generic: Read SUBSYSTEM_VENDOR_ID for VF's to check status.
> 
> 
> This commit only allows the device that the value "pdev->is_physfn" is true to enable health check.
> But I don't know why my PC and WWAN device would get a false result. Test result as below:
> 
> 
> [    3.920101] mhi-pci-generic 0000:08:00.0: MHI PCI device found: foxconn-t99w696
> [    3.920113] mhi-pci-generic 0000:08:00.0: ##debug## mhi_cntrl_config is assign
> [    3.920114] mhi-pci-generic 0000:08:00.0: ##debug## mhi_pci_claim ..
> [    3.920127] mhi-pci-generic 0000:08:00.0: enabling device (0000 -> 0002)
> [    3.920179] mhi-pci-generic 0000:08:00.0: ##debug## mhi_pci_get_irqs ..
> [    3.930223] mhi-pci-generic 0000:08:00.0: ##debug## mhi_register_controller ..
> [    3.935268] mhi-pci-generic 0000:08:00.0: ##debug## mhi_prepare_for_power_up ..
> [    3.935373] mhi-pci-generic 0000:08:00.0: ##debug## mhi_sync_power_up ..
> [    3.935375] mhi mhi0: Requested to power ON
> [    3.935388] mhi mhi0: Power on setup success
> [    3.971342] mhi-pci-generic 0000:08:00.0: pdev->is_physfn is 0
> [    3.971346] mhi-pci-generic 0000:08:00.0: pdev->is_virtfn is 0
> 
> 
> For my situation, both pdev->is_virtfn and pdev->is_physfn are false.
> And I also checked the requirement for pdev->is_physf, seems it will only be 1 if the device has SR-IOV capbility and the function is recognized as a PF. If your device is just
> a regular PCIe function or the kernel does not recognize the SR-IOV capability, it will be 0.
> 
> 
> So for mhi_pci_generic side, I suggest that we should modify it by using "!pdev->is_virtfn" instead of "pdev->is_physfn".
> 

Sorry for the breakage! Yeah, that was a mistake. It should've been
"!pdev->is_virtfn". Let me fix it right away.

Thanks for reporting. Please share your tested-by tag for the patch after
testing it.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
