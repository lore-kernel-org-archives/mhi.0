Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951552C81
	for <mhi@lists.linux.dev>; Tue, 19 Oct 2021 12:24:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D0B486137B;
	Tue, 19 Oct 2021 12:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1634646274;
	bh=4IrO+sXfnK8xpkI3TCB8EnCCEAY7jnrvePIPQfW4Juo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jx5N/lB97Eleqd/09I9fldRnoVPLx9Xpba9Jtaagtq17H0V9re10EGEueul3r1YUC
	 7R4UVAEnjUuPh7W1lG4gfSIIkf9p7CA22wmYfYIX7j277r9dH3IL7eghXyFAJB1lYS
	 jdFdLgyFWOi/tU9yuiQbMGgLrXZi3nnysOMFGxfs=
Date: Tue, 19 Oct 2021 14:24:30 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Hemant Kumar <hemantk@codeaurora.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	bbhatt@codeaurora.org, loic.poulain@linaro.org, wangqing@vivo.com,
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] MAINTAINERS: Update the entry for MHI bus
Message-ID: <YW64/hzKom7MiVDV@kroah.com>
References: <20211016065734.28802-1-manivannan.sadhasivam@linaro.org>
 <20211016065734.28802-2-manivannan.sadhasivam@linaro.org>
 <661c564c-e6cd-cbd4-0b17-a7c230d911b2@codeaurora.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <661c564c-e6cd-cbd4-0b17-a7c230d911b2@codeaurora.org>

On Mon, Oct 18, 2021 at 09:19:16PM -0700, Hemant Kumar wrote:
> 
> 
> On 10/15/2021 11:57 PM, Manivannan Sadhasivam wrote:
> > Since Hemant is not carrying out any maintainership duties let's make
> > him as a dedicated reviewer. Also add the new mailing lists dedicated
> > for MHI in subspace mailing list server.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>

Great, Manivannan, can you resend just this patch with this reviewed-by
so that I can apply it?

thanks,

greg k-h
