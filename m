Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDEC3ACEF9;
	Sat, 26 Sep 2026 10:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790418396; cv=none; b=FrjnZ8d+vVLZxbSnuTrakDyFpTS83nrr69ywCqxqgCE19xbpCstnIV6hxvQuZwN0/0TxZe3P5ciqSGSt8OdVS3QKsVCgijRBJNhGY+8EVOE8CN+/DsqeGKDL3rClucQlH2SoGO0YpcVboOEDc+OQa+GzcCzdaipOIGYN06r3ahE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790418396; c=relaxed/simple;
	bh=hIYXUXS+DwHG2WyAPGOZ6F2iA4IZkd6oJOCs5RCGVpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UiNxQef7XekSE4jSbyJyjifniUo2mn5y0J1MFst+ktFM29mgeL38LxXyJOoOckPLO3zq4KxRE44yGzM1dDYwaGkl6P8cKkxti3mYIQik1/P/cUDmjT8TzYVtrQfat+f7KMmk0jiHTJBPCfbEMrYPdTwKhM+dfEJ7G0h9lSQtjnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gIzhCMrl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gIzhCMrl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E89D61F000FF;
	Sat, 26 Sep 2026 10:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790418395;
	bh=5Y60ar9GtUqYnntHEOL3KIGlsSXGVdtEU6XNgVlCEVw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gIzhCMrlOyAEANYANWGsKHgh4c7NMsqaiKeO1nzyg9VIN69D8g5zV3eC+d39TkYhG
	 6nPpr7LhhdJd+rj8WOAQ7Sbm0+98FAn5Rl0Wbea2JTH+WyE3Wwh0coIs9buWy3OWvi
	 Ial+fdEWIHZPweQgoAzKLlz+3nSRYEnPN83JvHmn7ohCSA6gKpgJE00H9wLXvYUnXR
	 pxsi/ZZ0HS5VP6/bzUrtmoN1snyin36ae/RDZnJkwuVomSSqaqOWZTXzue9fBEgwhw
	 fLReL2RUXiFwmsgt/7xLAX7BoVkO2Xm1P+2sYwJR9H+g+sWu1SZ8O3f9EZp0KkilEf
	 U05PnUF42OvWg==
Date: Sat, 26 Sep 2026 12:26:16 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: zwq2226404116@163.com
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_vpernami@quicinc.com, krishna.chundru@oss.qualcomm.com, 
	jeff.hugo@oss.qualcomm.com, Wanquan Zhong <wanquan.zhong@fibocom.com>
Subject: Re: [PATCH v5 1/1] bus: mhi: pci_generic: add Rolling Wireless RW151
 1501/1502 PCI IDs
Message-ID: <dfwdvevwv6vyndv7uy3tsshw6vmpf3gregwxdji2n6uowrtpaw@664c3gau2nrj>
References: <20260702100013.545593-1-zwq2226404116@163.com>
 <20260904044612.6334-1-zwq2226404116@163.com>
 <36lpjhgapjitezxr32igozbwcy5vyqzcoqes644p2f5dndsm4y@kqf3f5yue6hs>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <36lpjhgapjitezxr32igozbwcy5vyqzcoqes644p2f5dndsm4y@kqf3f5yue6hs>

On Sat, Sep 26, 2026 at 12:22:55PM +0200, Manivannan Sadhasivam wrote:
> On Fri, Sep 04, 2026 at 12:42:44PM +0800, zwq2226404116@163.com wrote:
> > From: Wanquan Zhong <wanquan.zhong@fibocom.com>
> > 
> > Hi,
> > Please find v5 on top of v1/v2/v3/v4. It adds PCI_DEVICE_SUB entries for
> > RW151 sub-vendor 0x2099, sub-device 0x1501 and 0x1502 on QCOM 0x0309,
> > continuing the 1500 series.
> > If you have any comments on v4 and before, I am happy to address
> > them. Please also let me know whether you prefer incremental follow-ups
> > like this or a single squashed series before merge.
> > Thanks,
> > Wanquan Zhong
> > 
> 
> These comments should go below --- after Signed-off-by tag. I've fixed it now
> while applying, but please follow the patch guidelines next time.
> 

I replied too fast... This patch doesn't even apply on top of mhi-next branch.
There is no config for Rolling wireless devices 'mhi_rolling_rw151_info'.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
