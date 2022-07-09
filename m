Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB107A
	for <mhi@lists.linux.dev>; Sat,  9 Jul 2022 06:10:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E3DAC3411C;
	Sat,  9 Jul 2022 06:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657347024;
	bh=Snyjm1MUwVdQMrW1b0CDDFR/HpDNy+Rgf4YvfU0y9Jg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ilzI/yfbjXOAO408ytiwHpxT4dgwXFlhPVWFYaYeUAQ4fYPaYp2w26hVa5TaPTdab
	 oM6QJAfc4sJwOg6kfp8g2aYMZyZRRmVUNKYhAlM+5eIkEZG0wFB+yD/Em4vMSmCi30
	 5x9dYot9nlIgxSLttA5IqetdLV1RbGw54nwCy55RAzQQTBP/Y9mLh3tNarsP09jU/G
	 d1VahhXnY32M40zjttMobSr0jt8qCvRYMveKKsasK8xcQOLTSsdqYC686NfPNWAFbC
	 NZWNIJDI9LmKcUQ2L6mtzkWM7UVBexuylGdI2EzcmFfb7Jij12MgsyU6NQbhDyFwGh
	 uXU6T5OmczFKw==
Date: Sat, 9 Jul 2022 11:40:11 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: Hemant Kumar <quic_hemantk@quicinc.com>, mhi@lists.linux.dev,
	manivannan.sadhasivam@linaro.org, bbhatt@codeaurora.org,
	Maxim Kochetkov <mkochetkov@airspan.com>
Subject: Re: [PATCH] net: qrtr: start MHI channel after endpoit creation
Message-ID: <20220709061011.GD5063@thinkpad>
References: <20220430103430.37349-1-fido_max@inbox.ru>
 <642cccfd-6e70-9024-1a05-6df48a740156@quicinc.com>
 <263b1524-c6f9-4a50-b03a-4abd3379695d@inbox.ru>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <263b1524-c6f9-4a50-b03a-4abd3379695d@inbox.ru>

On Thu, Jul 07, 2022 at 09:20:11AM +0300, Maxim Kochetkov wrote:
> 
> 
> On 03.05.2022 05:35, Hemant Kumar wrote:
> > 
> > On 4/30/2022 3:34 AM, Maxim Kochetkov wrote:
> > > From: Maxim Kochetkov <mkochetkov@airspan.com>
> > > 
> > > Fixes: a2e2cc0dbb11 ("net: qrtr: Start MHI channels during init")
> > > Signed-off-by: Maxim Kochetkov <mkochetkov@airspan.com>
> > Reviewed-by: Hemant Kumar <quic_hemantk@quicinc.com>
> 
> Will it be merged?

QRTR belongs to netdev. So you need to CC netdev list and their maintainers.
Please keep the review tags while sending out next revision.

Thanks,
Mani

-- 
மணிவண்ணன் சதாசிவம்
