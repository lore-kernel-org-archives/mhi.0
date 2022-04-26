Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD9E7B
	for <mhi@lists.linux.dev>; Tue, 26 Apr 2022 11:19:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35AFBC385A0;
	Tue, 26 Apr 2022 11:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1650971980;
	bh=3G+BWF2uOD2Q6bXIupAqKAltjzdSI3qx1aK7Z08dEOI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bT8lLhpLA/9KOVS3YuXUWTL27Yp+cxKk6V4wVppDcmbu3k9KVYDXJJktOqQnn0GfB
	 Y4Pohr9g7qZTd3F5peLXGTDyhnBDd5OoBE+DRZDDvRN8paaT3rx0112GIS4NFelchs
	 VRROoDuHTGR2EwVnrokRmX+IbeGcesDBwZH3KzuU=
Date: Tue, 26 Apr 2022 13:19:37 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	elder@linaro.org, mhi@lists.linux.dev, quic_hemantk@quicinc.com,
	quic_bbhatt@quicinc.com, quic_jhugo@quicinc.com,
	bjorn.andersson@linaro.org, dmitry.baryshkov@linaro.org
Subject: Re: [PATCH 00/18] Add initial support for MHI endpoint stack
Message-ID: <YmfVSe1JHbXTtZLG@kroah.com>
References: <20220405135754.6622-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220405135754.6622-1-manivannan.sadhasivam@linaro.org>

On Tue, Apr 05, 2022 at 07:27:36PM +0530, Manivannan Sadhasivam wrote:
> Hi Greg,
> 
> Here is the series for adding the initial support for the MHI bus
> implementation in Endpoint devices (EP) like PCIe based SDX55 modems from
> Qualcomm. This MHI EP stack runs on the modem itself and communicates with
> the host MHI stack [1] over a physical bus like PCIe. The usecase of this
> stack is to carry the data packets from modem DSP to provide data
> connectivity to the host machine.
> 
> All these patches were submitted to mhi-list previously and reviewed by the
> developers from Linaro and Qualcomm. Please find the summary below:

Sorry for the delay, looks good, all now queued up.

greg k-h
