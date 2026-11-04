Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793781022;
	b=lImWyvFomCyto7qPLr3DUizO93RDjffsiovatZPOvp6rByf+IdVxtdWWbyI30KvxExKC
	 vFikIvGkyVKRAkCOB0PYKh+Km9UmwRqNC9garRxVM/JaVhsX4wdmzb4NePAOVZb+jmDQY
	 kmTB2tAFe7/6VBV3oA+WCN0R3loWWQ7f4naHCmPCXzBlZoUfPyiNt0SnulatXkzfLR1bO
	 z36nnGJi9/f5D6+J0Hr4zx9lkBdcGMItQvr+iWMO3/t6hQ9nbBOjQQReEgOC4pXIHV9yi
	 SyObLmKn61eMqcrGfNsd9j9772wJq9AzctE7yQ9NFHsOT2cuTR5Q1x5FL+whniY+3Qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793781022;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=kSkN+y8opL5CBs5M/ciD6De9QJtjpJLB5HYNs+Lgc/o=;
	b=xDNa/qKlCGNqrxZRlvcIBan78Ywrwbhbo1rfsBEcr4RVU4daONdJGr9rgOoLFytMl+S0
	 +4yWesYf/utSXARxSOdIbONCjsOgYE3xO0CkUIeiuHX7QGnyweBWjM+giv4gVSV6aoYFB
	 9k5/HK857K0elMHuqRINzsE1ggW0M84v4XKX2X8Ihd+EDD3B8f56k5ErkmpZcYfkVJsht
	 xofdvDv0SrOy/uWxA1z6CWXBJjubhybe2A8M9AElWjt7mTHheUSsON+haVX3TDlTgsJ89
	 COtfNNHrgHbUacEuhKLPynpAnRd6mYlJJaLnu1CUU26OZbT1rRQVYlYzouNKBMd4S0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=A9hySeRX;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B1F606A31B;
	Wed,  4 Nov 2026 08:30:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7B1F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=A9hySeRX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793781022; x=1825317022;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lItRH7Z12dB6U4PsmR4/sPVPKYSFiWRTUv3Y5oFAozw=;
  b=A9hySeRXZAdDOZ4UTlSXRvh8mYvZoyP5DSZKykn9A+j+o19PoHLzKVBa
   3/PdWGD61CllYklqXK0G2WGZ1j8eyOgPApG6oJIFxUcBHWq1J0az+3I5A
   E8RDkPtmw3q5nFflZEnTgsrYq75NVv2h/aIK2GavdTeD7MDPWpkBkJHiB
   9Sy7iqXoRK7/EIK/bFNorkIy4ZhuQJ1hzH9DD5bETUR71f9Oz5IuyAKly
   9wwoYxUGWjZaK/FM2+UmkNqk+kYSoYxdIkKECvcYYp1tD/F65uOdeSAXX
   F9qAN+JiZuFqCDc4LyiprS7OGN3r6AkPrCey2qDnagyeWXiTgO2wZlv4q
   g==;
X-CSE-ConnectionGUID: 3ZByIvFPSHSg3BAsbxSymw==
X-CSE-MsgGUID: hEwyDi+CRrys41dB9Xzphw==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2524953"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2524953"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 00:30:21 -0800
X-CSE-ConnectionGUID: XmIZj721Sp63rCxB6AtQ1w==
X-CSE-MsgGUID: dOoOk3kdQ5ytHJ1HQFa2Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="6561184"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 00:30:17 -0800
Date: Wed, 4 Nov 2026 10:30:14 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Frank.Li@oss.nxp.com
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Frank Li <Frank.Li@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Niklas Cassel <cassel@kernel.org>, Koichiro Den <den@valinux.co.jp>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	"open list:MHI BUS" <mhi@lists.linux.dev>,
	"open list:MHI BUS" <linux-arm-msm@vger.kernel.org>,
	"open list:PCI ENDPOINT SUBSYSTEM" <linux-pci@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev,
	vkoul@kernel.org, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 1/1] PCI: replace chan->device->dev with
 dmaengine_get_provider_device()
Message-ID: <aurtFju8dyFbRROh@ashevche-desk.local>
References: <20261103212924.1780217-1-Frank.Li@oss.nxp.com>
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Post: <mailto:mhi@lists.linux.dev>
List-Help: <mailto:mhi+help@lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mhi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103212924.1780217-1-Frank.Li@oss.nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Nov 03, 2026 at 04:29:20PM -0500, Frank.Li@oss.nxp.com wrote:
> 
> Use the dmaengine_get_provider_device() API instead of directly
> accessing chan->device->dev to get the DMA provider device.
> 
> No functional change. Prepare make to struct dma_device private to the DMA
> engine.

...

>  Assisted-by: LLM

It's an obsolete tag. Please, replace it in a free-form explanation how AI was
used in the comment block, below '---' line.

> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---

...

> static bool pci_epf_mhi_filter(struct dma_chan *chan, void *node)

>  	memset(&caps, 0, sizeof(caps));
>  	dma_get_slave_caps(chan, &caps);
>  
> -	return chan->device->dev == filter->dev && filter->dma_mask &
> +	return dmaengine_get_provider_device(chan) == filter->dev && filter->dma_mask &
>  					caps.directions;

While at it, fix indentation:

	return dmaengine_get_provider_device(chan) == filter->dev &&
	       (filter->dma_mask & caps.directions);

...

> static bool epf_dma_filter_fn(struct dma_chan *chan, void *node)

>  	memset(&caps, 0, sizeof(caps));
>  	dma_get_slave_caps(chan, &caps);
>  
> -	return chan->device->dev == filter->dev
> +	return dmaengine_get_provider_device(chan) == filter->dev
>  		&& (filter->dma_mask & caps.directions);

Ditto.

	return dmaengine_get_provider_device(chan) == filter->dev &&
	       (filter->dma_mask & caps.directions);

...

Looking more at it, you probably want to deduplicate this code at some point.


-- 
With Best Regards,
Andy Shevchenko


