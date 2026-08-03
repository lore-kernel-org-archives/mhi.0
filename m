Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0446A38E8A2;
	Mon,  3 Aug 2026 16:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785776261; cv=none; b=IAJHMhbQPw0GG8zsEbY6yvNVkqPnqnf4ZG7AAFvnEX0ZVjHJLwLo48CDmuLHiSi9DZYe7qa6JJBog8PZoihOP4SrRSI713Q96fo77R4wVZ45wIEh1dP9T2yV9m8APFSU1Qx68Uf6OHoeVkDUAgzesNUTbgXHBjrWE3V8QqEOSdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785776261; c=relaxed/simple;
	bh=p83KCcGlqrSZ6TAfvpx0xnzbnf19LnjgCAwU4BJ/6F8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oqiW0CuOcKVsDdiNhvXS+dFl2oVJH64/3vMt68nB8sDhNr2VEV4+QaLf/FP7ahfBD1vk7iwhbQHCyKFz7nMvX0Ytp15/30Pa3zm9che+ZiOjsfc3zrqiFjLXMr5GWTU+9uh+X/ed4KN0lRlcg60TYEXToXRkOEkrsT8jbIFbhlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U1WmvbFK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U1WmvbFK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FE241F000E9;
	Mon,  3 Aug 2026 16:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785776259;
	bh=Kzp1wDI4Ft+HNrcOhdI199+a/zt3J7X4Q3lNYoFOsf0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=U1WmvbFKmuxyAmMI6Ti89etboDXPqZSpSJ5xJvXlFP6ouq8YDHzAYJK79Q1XdLM+s
	 6xqUFftwe/C6/kSyURrm3JzI26qGch3ukrE1tQ4mxTKw9+P8FpOP9PkUe7l/0uvALk
	 DW0Q3ZY6CH9+gH3VV4aApm4CwnYqLLJKL6pYThAiy8XTrtGn3y4HRKwLNyTx9ybL7l
	 pbk9LwwZxyyBnjyylDqk4SSHiaAZbHrYMNReGRBo+NiFVu2RtAfAobyyoTO5i1ayOk
	 H+S8NDGcJvW2faMm9vTH+HwEvhjeCdh210p9Op5t7jSHL4uo1yJlUqUbEZ+srCFZar
	 svaxr+3H4O/0Q==
Date: Mon, 3 Aug 2026 18:57:32 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alex Williamson <alex@shazbot.org>
Subject: Re: [PATCH] bus: mhi: host: Flush the posted write after writing to
 MHI_SOC_RESET_REQ_OFFSET
Message-ID: <jmyr2afsiqml7pkz6jcty6gsgq6kchfkwebj4dkqtkutd2zafk@iifzpmhngrrf>
References: <20260623145134.43976-1-manivannan.sadhasivam@oss.qualcomm.com>
 <cc4bb54c-fee1-4478-af17-8b48ed379210@oss.qualcomm.com>
 <af5gbjoe5eswhnofzsvvknt7dfqbgyfs4kjkwzt6viivb5vwte@wjs7pg54szz7>
 <6e2fda2f-ce14-4f81-b848-9fee4e6a221a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6e2fda2f-ce14-4f81-b848-9fee4e6a221a@oss.qualcomm.com>

On Mon, Aug 03, 2026 at 09:57:47AM -0600, Jeff Hugo wrote:
> On 7/29/2026 11:19 PM, Manivannan Sadhasivam wrote:
> > On Wed, Jul 29, 2026 at 03:07:00PM -0600, Jeff Hugo wrote:
> > > On 6/23/2026 8:51 AM, Manivannan Sadhasivam wrote:
> > > > mhi_soc_reset() tries to reset the device by writing to the
> > > > MHI_SOC_RESET_REQ_OFFSET register. But it doesn't do a read-back to ensure
> > > > that the write gets flushed to the device before returning to the caller.
> > > > 
> > > > This may lead to the delay (if implemented) on the caller to be
> > > > insufficient, if the posted write doesn't reach the device before the
> > > > delay.
> > > 
> > > Interesting.  Is the delay tight enough that a few ms will possibly blow it?
> > > Seems like a poorly defined delay.  All the devices I'm familiar with take
> > > multiple seconds to boot (with some variability due to ddr training and
> > > thermal constraints), and if the reset triggers a crash dump, then its
> > > easily tens of seconds.
> > > 
> > 
> > Which delay you are referring to? RDDM delay which is just 2ms? Yeah, that seems
> > questionable. But this function itself doesn't implement any delay. So your
> > comment was somewhat confusing.
> 
> The delay at the caller of the API referenced by the commit text - "This may
> lead to the delay on the caller to be insufficient"
> 
> I looked at the thread referenced by this patch via the closes tag, and
> while I can follow the virtualization flow, I didn't get a good view on the
> specifics.
> 
> > > Regardless, since this reset will either kill the pcie link, or disconnect
> > > the SoC from the link for a time,
> > 
> > No, this will not reset the PCIe link AFAIK. PERST separation logic available in
> > the Endpoint should make sure the PCIe link is active while the SoC is
> > undergoing the reset. Otherwise, if the host tries to access the device config
> > space before the device is ready, it will blow up.
> 
> Reset separation (PERST separation is one part of) is not always enabled.
> PBL won't enable it as it requires loading the reset sequences to the PMIC,
> which is outside the scope of ROM.  So, if you have a non-flash boot device,
> or a flash boot device that has a non-provisioned/otherwise corrupt flash,
> the EP may be sitting in PBL from cold boot without reset separation
> enabled.  If the EP is then passed to a VM per the related thread, a reset
> will occur, which will take the link down.
> 
> Also, if I recall correctly, automotive products do not enable reset
> separation at all for ASIL reasons.
> 

Ok, I was not aware of these scenarios.

> If the link is down, the upstream component of the EP should complete the
> read with an error, not cause the host to blow up.

If the PCIe link is down and if the host tries to read the Endpoint config
space or BAR, most of the PCIe RC integrations in ARM64 platforms return AXI
error instead of the typical 'all-one' response and that causes 'Synchronous
Abort' on the host. And that's what I meant as 'blow up' as it will crash the
host kernel.

Anyhow, the motivation of this patch is to ensure that the posted write gets
flashed to the device before the delay. But I'm not sure on how one should
address the concern you raised on waiting till the Endpoint reboots.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
