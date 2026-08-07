Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88AC743C067;
	Fri,  7 Aug 2026 05:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786081027; cv=none; b=KQFfZLnvQIJh0i81d01FKlz9tker/eOya1MvgM8AFo4mwQoP1NLYOZ/mC5IPs1+o3x0uCfxd775TJCGGe8f+JH1fkprdqAVYZEW9P5B/Nrtp5E+5d+2nIGXG25MWoPuKZD/HYOfW0msOX344oOanl3tzvgVGfJ5eHEZ85R0hFbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786081027; c=relaxed/simple;
	bh=Ez/5K7/jrJggiY0/EKwPUVkvWoPb5Itr2Aurgjqhwlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=empF4jwj20FgTu6GSLfCOHUYIck5KvyZEvp48uJNDL5u3OFKO5z9Ct5Uf/GX0FN+sLrDwpdyEB7eEJWl1hyUs6Bv62nznDiXJiOXaxaH+lEhV8bF90jJf5RxWG70FE4rC4OmVoL0HYEcz4zgfMa4Utmc894yr8x4BbEw5uYl304=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jf/0HPJ0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jf/0HPJ0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A70E1F000E9;
	Fri,  7 Aug 2026 05:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786081026;
	bh=HB5aqcmGd7vTTi3lCtzE6edzs6AuoLjdUxI6PXwVmys=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jf/0HPJ0l3zEoezvTQlZrfBoN01AY5ac9/ScqiwhLItZleoc1PxKMDiU7ESwrxYOq
	 0IyQXBjUGHt5fB7yo5PRBesED7AY9IQ4pTcKR9XWcvFPzI9qDtmgT7QLJqIyPb1H0P
	 Qi76Vm0GX7DYJrP7dh6s5t48WiGz1Ogc2gm+Ei9RCmbrHg7GHyqdMBUUr91zGfDFof
	 v1s5q+/tpvfFU3hdqfWuYkAht0lC37eI7DPIpbTV0B07SvthsIpFceXrZcQ+H66vEl
	 KMK3BNC/sKTvQwfiZ6yjjlSOXcRpn5VxTtEtbzDFOArJukWMQgYcEpa1huYMxav+rn
	 /I4Q4jLPYgkjw==
Date: Fri, 7 Aug 2026 07:36:54 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alex Williamson <alex@shazbot.org>
Subject: Re: [PATCH] bus: mhi: host: Flush the posted write after writing to
 MHI_SOC_RESET_REQ_OFFSET
Message-ID: <csu2b6vatruvk2x6s6besbh3xy4icchivhxh4c7pef3ia4wwba@5yrilfeghx7m>
References: <20260623145134.43976-1-manivannan.sadhasivam@oss.qualcomm.com>
 <cc4bb54c-fee1-4478-af17-8b48ed379210@oss.qualcomm.com>
 <af5gbjoe5eswhnofzsvvknt7dfqbgyfs4kjkwzt6viivb5vwte@wjs7pg54szz7>
 <6e2fda2f-ce14-4f81-b848-9fee4e6a221a@oss.qualcomm.com>
 <jmyr2afsiqml7pkz6jcty6gsgq6kchfkwebj4dkqtkutd2zafk@iifzpmhngrrf>
 <3ce8f794-3582-4d69-8b7d-1f7c10689a0b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3ce8f794-3582-4d69-8b7d-1f7c10689a0b@oss.qualcomm.com>

On Tue, Aug 04, 2026 at 10:51:35AM -0600, Jeff Hugo wrote:
> On 8/3/2026 10:57 AM, Manivannan Sadhasivam wrote:
> > On Mon, Aug 03, 2026 at 09:57:47AM -0600, Jeff Hugo wrote:
> > > On 7/29/2026 11:19 PM, Manivannan Sadhasivam wrote:
> > > > On Wed, Jul 29, 2026 at 03:07:00PM -0600, Jeff Hugo wrote:
> > > > > On 6/23/2026 8:51 AM, Manivannan Sadhasivam wrote:
> > > > > > mhi_soc_reset() tries to reset the device by writing to the
> > > > > > MHI_SOC_RESET_REQ_OFFSET register. But it doesn't do a read-back to ensure
> > > > > > that the write gets flushed to the device before returning to the caller.
> > > > > > 
> > > > > > This may lead to the delay (if implemented) on the caller to be
> > > > > > insufficient, if the posted write doesn't reach the device before the
> > > > > > delay.
> > > > > 
> > > > > Interesting.  Is the delay tight enough that a few ms will possibly blow it?
> > > > > Seems like a poorly defined delay.  All the devices I'm familiar with take
> > > > > multiple seconds to boot (with some variability due to ddr training and
> > > > > thermal constraints), and if the reset triggers a crash dump, then its
> > > > > easily tens of seconds.
> > > > > 
> > > > 
> > > > Which delay you are referring to? RDDM delay which is just 2ms? Yeah, that seems
> > > > questionable. But this function itself doesn't implement any delay. So your
> > > > comment was somewhat confusing.
> > > 
> > > The delay at the caller of the API referenced by the commit text - "This may
> > > lead to the delay on the caller to be insufficient"
> > > 
> > > I looked at the thread referenced by this patch via the closes tag, and
> > > while I can follow the virtualization flow, I didn't get a good view on the
> > > specifics.
> > > 
> > > > > Regardless, since this reset will either kill the pcie link, or disconnect
> > > > > the SoC from the link for a time,
> > > > 
> > > > No, this will not reset the PCIe link AFAIK. PERST separation logic available in
> > > > the Endpoint should make sure the PCIe link is active while the SoC is
> > > > undergoing the reset. Otherwise, if the host tries to access the device config
> > > > space before the device is ready, it will blow up.
> > > 
> > > Reset separation (PERST separation is one part of) is not always enabled.
> > > PBL won't enable it as it requires loading the reset sequences to the PMIC,
> > > which is outside the scope of ROM.  So, if you have a non-flash boot device,
> > > or a flash boot device that has a non-provisioned/otherwise corrupt flash,
> > > the EP may be sitting in PBL from cold boot without reset separation
> > > enabled.  If the EP is then passed to a VM per the related thread, a reset
> > > will occur, which will take the link down.
> > > 
> > > Also, if I recall correctly, automotive products do not enable reset
> > > separation at all for ASIL reasons.
> > > 
> > 
> > Ok, I was not aware of these scenarios.
> > 
> > > If the link is down, the upstream component of the EP should complete the
> > > read with an error, not cause the host to blow up.
> > 
> > If the PCIe link is down and if the host tries to read the Endpoint config
> > space or BAR, most of the PCIe RC integrations in ARM64 platforms return AXI
> > error instead of the typical 'all-one' response and that causes 'Synchronous
> > Abort' on the host. And that's what I meant as 'blow up' as it will crash the
> > host kernel.
> 
> This feels like a PCIe spec violation, or at-least undesired behavior from
> the user perspective.  Maybe a DoS attack vector?  I assume you are
> specifically talking about Qualcomm MSM Arm64 platforms, and not the entire
> Arm64 ecosystem?  I don't recall seeing this in the Arm64 server space.
> 

This is commonly seen in ARM platforms, mostly in Embedded space, but it is not
an ARM problem though. On these platforms, they don't properly synthesize the
completion timeout and end up triggering Synchronous External Abort (SError),
which the kernel treats it as a panic condition.

There are drivers that try to mitigate this condition, but rather in a racy way
as there is no proper solution available in the kernel:

$ git grep -rl SError drivers/pci
drivers/pci/controller/dwc/pci-keystone.c
drivers/pci/controller/dwc/pcie-designware-host.c
drivers/pci/controller/dwc/pcie-rcar-gen4.c
drivers/pci/controller/pci-aardvark.c

> Do we need to talk to Joe about this?
> 

This is a known limitation and he should be knowing this by now.

> > Anyhow, the motivation of this patch is to ensure that the posted write gets
> > flashed to the device before the delay. But I'm not sure on how one should
> > address the concern you raised on waiting till the Endpoint reboots.
> 
> Sadly I think the user implementing the delay will need to be aware of the
> specific device they are using, and the likely required delay to account for
> the various scenarios that device implements.  I don't think we really have
> the infrastructure to make this universal, and if we did, I'm not sure a
> blanket "all MHI devices reboot in X time" is going to work in the long
> term.

Hmm, then let's just keep things as is and increase the timeout when someone
complains :/

- Mani

-- 
மணிவண்ணன் சதாசிவம்
