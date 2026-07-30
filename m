Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3513120010A;
	Thu, 30 Jul 2026 05:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785388762; cv=none; b=F1CI97XY7oYOu+go2aYO9az27apnEZ7696vUitwhEGH79L6z8gZX8StQZYzpbkxpgY9A0hsfQK+oss5G0XWYEdxozxKsmdEBR+iX7vSmfZPjHIeBQAOBe1TGMTi/2MH7qMrbomxmUZXh5YGseqdJuP14sQf+umhgTfbg1VeiRKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785388762; c=relaxed/simple;
	bh=TLOEMRU738Mckgwx9s8gkGNiITn0QyUn1Rk07dQf8eY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P6hf0WQXeu4PcV7KnI3KO4mLGfgdekHqEeTGEiGQ7DYpeUZiemFvwYplOeFUCVOtKSh9cudwJQ/Hn7sONHWTiDvawvpi+0SLKoJzCE2hobzfzrUGQ/wJ70L7pZSwQ00To6/rkm2vykBEhKXhxlxLOzQ5wUOSQ72DbvI0m3SzinQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aYImDRR0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aYImDRR0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A14101F000E9;
	Thu, 30 Jul 2026 05:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785388760;
	bh=NUT2DWNE1hyMWkj42+rXH+YZ1U/NiYGnBXa+kTBBlX0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aYImDRR0Z1pa4kkKst9cOAiBzkddYHRghy0p9Q1KBV7s+MS8FrIOeGEZP7FobEsd+
	 BNfvTXcaHA0xgPMV3AVdT3vwIQFqa+FX8acQY2mY7FB5i/pEqd6pQJkfzCIqlBaXYU
	 4oc2ODwKnJZbwg92g1t5Pufm1bJY9oxYhLS4tyCEkM5Ysb5JUT3sPJDshZJL9C0Lu9
	 Oknj1sfkZFx0btKth2vaz87QLAP5JJhrTtZTWwa6evkUt/yiUexcuZqlTQj55Nt321
	 kgHqHH3Z8BWk8kzO7+iFhkCTQhDI+L2hwG+a1kgGCT35Eh++4JNM3EhOIYVNi04YRd
	 3QNCqmiyEuiEA==
Date: Thu, 30 Jul 2026 07:19:13 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alex Williamson <alex@shazbot.org>
Subject: Re: [PATCH] bus: mhi: host: Flush the posted write after writing to
 MHI_SOC_RESET_REQ_OFFSET
Message-ID: <af5gbjoe5eswhnofzsvvknt7dfqbgyfs4kjkwzt6viivb5vwte@wjs7pg54szz7>
References: <20260623145134.43976-1-manivannan.sadhasivam@oss.qualcomm.com>
 <cc4bb54c-fee1-4478-af17-8b48ed379210@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cc4bb54c-fee1-4478-af17-8b48ed379210@oss.qualcomm.com>

On Wed, Jul 29, 2026 at 03:07:00PM -0600, Jeff Hugo wrote:
> On 6/23/2026 8:51 AM, Manivannan Sadhasivam wrote:
> > mhi_soc_reset() tries to reset the device by writing to the
> > MHI_SOC_RESET_REQ_OFFSET register. But it doesn't do a read-back to ensure
> > that the write gets flushed to the device before returning to the caller.
> > 
> > This may lead to the delay (if implemented) on the caller to be
> > insufficient, if the posted write doesn't reach the device before the
> > delay.
> 
> Interesting.  Is the delay tight enough that a few ms will possibly blow it?
> Seems like a poorly defined delay.  All the devices I'm familiar with take
> multiple seconds to boot (with some variability due to ddr training and
> thermal constraints), and if the reset triggers a crash dump, then its
> easily tens of seconds.
> 

Which delay you are referring to? RDDM delay which is just 2ms? Yeah, that seems
questionable. But this function itself doesn't implement any delay. So your
comment was somewhat confusing.

> Regardless, since this reset will either kill the pcie link, or disconnect
> the SoC from the link for a time,

No, this will not reset the PCIe link AFAIK. PERST separation logic available in
the Endpoint should make sure the PCIe link is active while the SoC is
undergoing the reset. Otherwise, if the host tries to access the device config
space before the device is ready, it will blow up.

>  I've been trying to figure out how this
> change might break, but I haven't found a scenario, so I suspect this is
> good enough.
> 

This change should not break any devices as it just ensures that the posted
write gets flushed to the device before the delay.

> > So add a read-back after writing to the MHI_SOC_RESET_REQ_OFFSET register.
> > 
> > Fixes: b5a8d233a588 ("bus: mhi: core: Add device hardware reset support")
> > Reported-by: Alex Williamson <alex@shazbot.org>
> > Closes: https://lore.kernel.org/linux-pci/20260622160822.09350246@shazbot.org
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > ---
> >   drivers/bus/mhi/host/main.c | 6 ++++++
> >   1 file changed, 6 insertions(+)
> > 
> > diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
> > index 53c0ffe30070..4d458396233a 100644
> > --- a/drivers/bus/mhi/host/main.c
> > +++ b/drivers/bus/mhi/host/main.c
> > @@ -170,6 +170,9 @@ EXPORT_SYMBOL_GPL(mhi_get_mhi_state);
> >   void mhi_soc_reset(struct mhi_controller *mhi_cntrl)
> >   {
> > +	int __maybe_unused ret;
> > +	u32 tmp;
> > +
> >   	if (mhi_cntrl->reset) {
> >   		mhi_cntrl->reset(mhi_cntrl);
> >   		return;
> > @@ -178,6 +181,9 @@ void mhi_soc_reset(struct mhi_controller *mhi_cntrl)
> >   	/* Generic MHI SoC reset */
> >   	mhi_write_reg(mhi_cntrl, mhi_cntrl->regs, MHI_SOC_RESET_REQ_OFFSET,
> >   		      MHI_SOC_RESET_REQ);
> > +	/* Flush the posted write to the device (ignore return value) */
> > +	ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->regs, MHI_SOC_RESET_REQ_OFFSET,
> > +			   &tmp);
> 
> If you wanted, you could fit this all on one line.  word wrapping for a 3
> char parameter seems a bit silly to me, but I suspect this is highly
> subjective.
> 

Entire driver is still 80 column width, so I was trying to be preserve the same
pattern.

> Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
> 

Thank you!

- Mani

-- 
மணிவண்ணன் சதாசிவம்
