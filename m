Received: from cdw.me.uk (cdw.me.uk [91.203.57.136])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7925830F81E;
	Mon, 18 Aug 2025 09:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.203.57.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755510883; cv=none; b=bkLEWSsxS+32gv4Z2svTHPm7FIPVPAPsduY2cpUPmAJmhxiI5Co4WMW5IUwIPXBmUmzG5P8wmzOZYCmJ5Idjd6d6yjuCe8OXhznz/+G6f1OGXz8y0ItkjwJVA2ikpJsqeGqM2fC7xhv1si94Rkn/QfXXB2OzRfEQ6E/Q91uHDUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755510883; c=relaxed/simple;
	bh=I8lfaokORzYRA+TsnF4mKU3HU5Wu654aIFxE/eI4YNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TI97ipk5gxfPTIEvWsigFn8AxAwSh4rMuagjKXvV8Ya7mBR/4a0Io/WN2paJq0u9y9qfiQ+O56yXZRkzXUVzjEJi+P+x+B60k4l/1AsSGgaxZO4iemr7VlljhEJ48L7FPwRTIRzvVtShT6KhwtR2BO53lcTjBojmEqvXhxTNDZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=arachsys.com; spf=pass smtp.mailfrom=arachsys.com; arc=none smtp.client-ip=91.203.57.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=arachsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arachsys.com
Received: from chris by delta.arachsys.com with local (Exim 4.80)
	(envelope-from <chris@arachsys.com>)
	id 1unw8D-0001lh-0x; Mon, 18 Aug 2025 10:26:21 +0100
Date: Mon, 18 Aug 2025 10:26:21 +0100
From: Chris Webb <chris@arachsys.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Petr =?utf-8?Q?=C5=A0tetiar?= <ynezz@true.cz>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Duke Xin =?utf-8?B?KOi+m+WuieaWhyk=?= <duke_xinanwen@163.com>,
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: host: pci_generic: add support for Quectel
 RM520N-GL 0x5201 variant
Message-ID: <aKLxvZDBhoEKujI1@arachsys.com>
References: <20250512112631.2477075-1-ynezz@true.cz>
 <aJ7SMWSWw5l8rS4I@meh.true.cz>
 <ywase3lkm5iimrzyin5grb3hr36zedsvzs3p2z6z2q6532g3cq@25ibqnpmanvo>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ywase3lkm5iimrzyin5grb3hr36zedsvzs3p2z6z2q6532g3cq@25ibqnpmanvo>

Manivannan Sadhasivam <mani@kernel.org> writes:

> @Duke Xin: Could you please let us know why the Quectel modems are using the
> QCOM Vendor IDs?

In particular, I wonder if there's a way to reconfigure the modem to
permanently set the correct IDs so it doesn't need a patch at all? That
would be a nicer fix than adding to the giant list of variants.

PS While the tiny diff here is mine, the commit message isn't, so it
probably should be attributed as From: Petr rather than From: me. But
this doesn't matter if my hack is not correct anyway! ;-)

Best wishes,

Chris.
