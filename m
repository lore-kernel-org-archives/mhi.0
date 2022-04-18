Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BED180F
	for <mhi@lists.linux.dev>; Mon, 18 Apr 2022 14:01:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7EAFC385A1;
	Mon, 18 Apr 2022 14:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650290460;
	bh=t87kTP2ANlN2kxQbIJv5pHweOFSoXgwk/LXZka654+E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EA5vOwPbhjFFZ1nx+L1Ezu86daVyQ8GUzOk0G5mh3/VA7csw1eeXv63QnuYK62Q4m
	 oXCCLsJhU0rv+quy4Ofa2T+vNYZAqK6e7fVM6VlTalRWNJA07eIIZoz7MSPT75Hf4T
	 1n1s+5U78hCKKtUE5l9Gu6hh5BhxR6KMG5ZX4o6SEh+J7dJbCmyERuFvmiIj3phm+k
	 bI++9L8aJsZ2NS+EjjEACSOC6YcQGxw1fIb2/FnbzfqzB4IeitrlipS95zIN5H1vHF
	 1V2560VTepO6t+GJqmgeylX/Voa6okmbRNviM4x4rC7HkoVWnh6p9nBv74GGOZl76F
	 d95bf+CZPDMCw==
Date: Mon, 18 Apr 2022 19:30:53 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: quic_hemantk@quicinc.com, quic_bbhatt@quicinc.com, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] bus: mhi: host: Add soc_reset sysfs
Message-ID: <20220418140053.GB161722@thinkpad>
References: <1649883619-17609-1-git-send-email-quic_jhugo@quicinc.com>
 <20220418054649.GB7431@thinkpad>
 <2c776c00-5742-516f-06e3-80db9f572cb4@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c776c00-5742-516f-06e3-80db9f572cb4@quicinc.com>

On Mon, Apr 18, 2022 at 07:45:06AM -0600, Jeffrey Hugo wrote:
> On 4/17/2022 11:46 PM, Manivannan Sadhasivam wrote:
> > On Wed, Apr 13, 2022 at 03:00:19PM -0600, Jeffrey Hugo wrote:
> > > From: Jeffrey Hugo <jhugo@codeaurora.org>
> > > 
> > > The MHI bus supports a standardized hardware reset, which is known as the
> > > "SoC Reset".  This reset is similar to the reset sysfs for PCI devices -
> > > a hardware mechanism to reset the state back to square one.
> > > 
> > > The MHI SoC Reset is described in the spec as a reset of last resort.  If
> > > some unrecoverable error has occurred where other resets have failed, SoC
> > > Reset is the "big hammer" that ungracefully resets the device.  This is
> > > effectivly the same as yanking the power on the device, and reapplying it.
> > > However, depending on the nature of the particular issue, the underlying
> > > transport link may remain active and configured.  If the link remains up,
> > > the device will flag a MHI system error early in the boot process after
> > > the reset is executed, which allows the MHI bus to process a fatal error
> > > event, and clean up appropiately.
> > > 
> > > While the SoC Reset is generally intended as a means of recovery when all
> > > else has failed, it can be useful in non-error scenarios.  For example,
> > > if the device loads firmware from the host filesystem, the device may need
> > > to be fully rebooted inorder to pick up the new firmware.  In this
> > > scenario, the system administrator may use the soc_reset sysfs to cause
> > > the device to pick up the new firmware that the admin placed on the
> > > filesystem.
> > > 
> > > Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
> > > Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> > 
> > Do you need double signed-off because of change in domain?
> > 
> > Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> That seems to be the convention that I see in the community.  As I
> understand it, the SoB is linked to the Developers Certificate of Origin.
> This version of the change is coming from "quic_jhugo@quicinc.com" and that
> entity needs to certify they can share the code under the Cert of Origin.
> 
> In theory, I could have avoided this by sending this version under the
> codeaurora address.  The problem is that the codeaurora domain no longer
> exists, so sending/receiving email from that id is not possible.
> 
> If I'm not understanding things correctly, please educate me.

IANAL, but since you are the sole developer (and with the same employer) I think
it is fine to change the DCO. Moreover, if codeaurora is used, it will get CCed
and will bounce.

But if you have a strong desire to keep the two tags, please let me know.

Thanks,
Mani
