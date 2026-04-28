Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72EC82BDC23
	for <mhi@lists.linux.dev>; Tue, 28 Apr 2026 08:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777363981; cv=none; b=nWN7ZapTl20dBU8BjLfrYCyoOIbUWxG7XxT7xvCZ1bUy2p5gOiRB/7Wa6Gi2g6+CIfbW8OxNVo9Boj65G2EoNzbD+T7aiIzD6P8MbLbVhtPun8LTHZwjWNXXk2GmB/pofKsJDOiefR9UpGqZAcE5OkeH8tk/JSSZdFJnoOI2fk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777363981; c=relaxed/simple;
	bh=SGG7Ff3RaokvCjzMJu7vqAaWA2ByWhRdtYJYNLZpt5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L/bVo9EAsRKRbk4Z2uYZRayt+sPX5HXymNDcNKqkTJYoKesIra2YurILtsQZq+Uxrg1Y4PlWTjHN+6vKd3b1Z5X/frqdTr5YUlJzN0boHwvncfCUrRNdwcBdDe2pWgAqbuNA1/nh72CiBZC1Mes1OOT+x/eUIu52JuGYLR8s9c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YnQWSXgk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YnQWSXgk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B90FC2BCB5;
	Tue, 28 Apr 2026 08:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777363981;
	bh=SGG7Ff3RaokvCjzMJu7vqAaWA2ByWhRdtYJYNLZpt5Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YnQWSXgkcwauAgN1tkzdTBMLciAmVBsIBsVnnREV22ld254K2P+j7hMvq+vG1b/04
	 w1deBlESIYPQdaV5rNMcT5FrhKBtmrEOj1UjL19VnDpQM3enBsMvqPuLADPkizsW41
	 GLeLzezpmAnOMwnFqLfZBNcWbfL5jHbmXOX/x9HkRohApEBM27dBiWBQVfSKlHI0ai
	 rBq3abJ3Jn1Omh/S8Z+iewyc9MnhsaVAtTgLLjz9nvtXy5XnP+Fw4f9fe1QUHpzEDV
	 qRhmaxtHSVy2f8NRTjKQsucP2yVxF08Wni+yBUfi2VNTnw0ZjkCUsvSS0lYJDn+Fra
	 gNcHFAx682hxw==
Date: Tue, 28 Apr 2026 13:42:52 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Ludovic.Desroches@microchip.com
Cc: mhi@lists.linux.dev, manivannan.sadhasivam@linaro.org, 
	Nicolas.Ferre@microchip.com, Cyrille.Pitchen@microchip.com
Subject: Re: [QUESTION] Public availability of the MHI specification
Message-ID: <lxx5zfhequqedinh5vlmqmfucaeo3ltp5yypn4dhlw2mkw4roc@digcn3fue7ph>
References: <013437b9-e12f-488b-838e-5144026458b2@microchip.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <013437b9-e12f-488b-838e-5144026458b2@microchip.com>

Hi,

On Tue, Apr 28, 2026 at 06:32:08AM +0000, Ludovic.Desroches@microchip.com wrote:
> Hi,
> 
> I am looking into the MHI bus subsystem (drivers/bus/mhi/) to better 
> understand the protocol and the semantics behind the MMIO register 
> layout defined in drivers/bus/mhi/common.h. My motivation is that I 
> would like to use MHI to communicate with a PCIe device rather than 
> reinventing a similar protocol from scratch.
> 
> The in-tree documentation (Documentation/mhi/) gives a good 
> architectural overview, and several comments in the code refer to the 
> MHI specification by section number (e.g. drivers/bus/mhi/ep/main.c:57 
> mentions "section 4.3, Interrupt moderation") and by version (commit 
> 48f98496b1de mentions "MHI spec v1.2"). However, I could not find a 
> pointer to the specification document itself.
> 
> Could you tell me:
> 1. Is the MHI specification publicly available? If so, where can it be 
> downloaded (Qualcomm developer portal, elsewhere)?
> 2. Is MHI intended/suitable for use with non-Qualcomm devices, or would 
> you recommend against going down that path?
> 

MHI is a Qualcomm's proprietary, patented [1] protocol. So you cannot use it in
non-Qcom products without getting prior approval from Qualcomm. Also, the spec
is not open as it is not meant to be developed outside of Qualcomm products.

If you just want a protocol that works on top of physical transport like PCIe on
all platforms, I'd suggest using an opensource transport like VirtIO.

- Mani

[1] https://patents.google.com/patent/US20140207991A1/en

-- 
மணிவண்ணன் சதாசிவம்
