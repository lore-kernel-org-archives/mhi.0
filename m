Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D1863DC
	for <mhi@lists.linux.dev>; Wed,  2 Aug 2023 11:09:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2A6CC433C7;
	Wed,  2 Aug 2023 11:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690974580;
	bh=l9URWfypITde4XfMVtO0pwwP4I0eVYQJzyv3cQfWoIE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mr2695BSo51LY+CTqPPoD5Z0CrYWTZfw6DIY0oenF/q/W9XUNedxwnn29i8UDEPWx
	 /+a8/eSESRw3mBJnWJJxnhyHcB0csm4fd7uUDSWTPgqaF+cdTPZ9Y83sl83Ysb8Hil
	 MyYDLe7wzQUvnHEbR0K7rZ239r7DZvw61vTySckR0d4tcw/Y7LqRCGT3PDSem0K7Pe
	 h82CHQeuydevuzhsE8UUxT7ib3vovqy+QqknwQimRsGvkey9iYlLcOrfe9utUd3Ng8
	 4Hqa1VmscTLDrBthOuSv6jwsNb3X0yspKKNBdYablDqTGKSMgliiWStwQGnE0KHopi
	 vZF4+IbUJL2yA==
Date: Wed, 2 Aug 2023 16:39:28 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: andersson@kernel.org, mhi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: ABI: sysfs-bus-mhi: Update contact info
Message-ID: <20230802110928.GF57374@thinkpad>
References: <20230628182346.3855-1-quic_jhugo@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230628182346.3855-1-quic_jhugo@quicinc.com>

On Wed, Jun 28, 2023 at 12:23:46PM -0600, Jeffrey Hugo wrote:
> @codeaurora.org email addresses are no longer valid and will bounce to
> sender.  Also, Bhaumik has previously indicated he is no longer interested
> in participating in MHI bus discussions.
> 
> Update contact info from Bhaumik to the mhi mail list so that mails will
> be routed to the MHI maintainers and interested parties.
> 
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

> ---
>  Documentation/ABI/stable/sysfs-bus-mhi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/ABI/stable/sysfs-bus-mhi b/Documentation/ABI/stable/sysfs-bus-mhi
> index 96ccc3385a2b..1a47f9e0cc84 100644
> --- a/Documentation/ABI/stable/sysfs-bus-mhi
> +++ b/Documentation/ABI/stable/sysfs-bus-mhi
> @@ -1,7 +1,7 @@
>  What:		/sys/bus/mhi/devices/.../serialnumber
>  Date:		Sept 2020
>  KernelVersion:	5.10
> -Contact:	Bhaumik Bhatt <bbhatt@codeaurora.org>
> +Contact:	mhi@lists.linux.dev
>  Description:	The file holds the serial number of the client device obtained
>  		using a BHI (Boot Host Interface) register read after at least
>  		one attempt to power up the device has been done. If read
> @@ -12,7 +12,7 @@ Users:		Any userspace application or clients interested in device info.
>  What:		/sys/bus/mhi/devices/.../oem_pk_hash
>  Date:		Sept 2020
>  KernelVersion:	5.10
> -Contact:	Bhaumik Bhatt <bbhatt@codeaurora.org>
> +Contact:	mhi@lists.linux.dev
>  Description:	The file holds the OEM PK Hash value of the endpoint device
>  		obtained using a BHI (Boot Host Interface) register read after
>  		at least one attempt to power up the device has been done. If
> -- 
> 2.40.1
> 
> 

-- 
மணிவண்ணன் சதாசிவம்
