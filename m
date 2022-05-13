Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D32D2100
	for <mhi@lists.linux.dev>; Fri, 13 May 2022 07:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1A3DC34116;
	Fri, 13 May 2022 07:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1652425815;
	bh=6+kVBxTNIB4pogmCJdSNMF7MZo0K/jeFcB9BP7yAp8s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W9N1wLbZwmGeugKGhZo57izG8F2HXknko5apIOq6lsPBBxJA0XpJwtjWhb4TxOAgY
	 6+0mIJ1FkOMa0zg2T4v8THry8U8tHkyV4ghfZ9gW6/CZqcAkTN+H/abl2Q7SKgZ/sG
	 weFrryhkKLtMbv5xOOicY0Q0qzhH06pmvcmsBFYs=
Date: Fri, 13 May 2022 09:10:12 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Yonglin Tan <yonglin.tan@outlook.com>
Cc: mani@kernel.org, quic_hemantk@quicinc.com, loic.poulain@linaro.org,
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH]     bus: mhi: host: Add support for Quectel EM120 FCCL
 project.
Message-ID: <Yn4EVHr/xrgB0kom@kroah.com>
References: <MEYP282MB23742A3646D681AF27BED85EFDCA9@MEYP282MB2374.AUSP282.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MEYP282MB23742A3646D681AF27BED85EFDCA9@MEYP282MB2374.AUSP282.PROD.OUTLOOK.COM>

On Fri, May 13, 2022 at 03:00:25PM +0800, Yonglin Tan wrote:
> From: ylintan <yonglin.tan@outlook.com>
> 
>     This patch add VendorID/DeviceID definitions for EM120 FCCL project.
>     It has the same configration as Quectel EM160R-GL and EM120R-GL.
> 
>     Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>     Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
>     Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>     Signed-off-by: Yonglin Tan <yonglin.tan@outlook.com>
> ---
>  drivers/bus/mhi/host/pci_generic.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 8416267..0a6469c 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -557,6 +557,8 @@ static const struct pci_device_id mhi_pci_id_table[] = {
>  		.driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
>  	{ PCI_DEVICE(0x1eac, 0x1002), /* EM160R-GL (sdx24) */
>  		.driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
> +	{ PCI_DEVICE(0x1eac, 0x2001), /* EM120R-GL for FCCL (sdx24) */
> +		.driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
>  	/* T99W175 (sdx55), Both for eSIM and Non-eSIM */
>  	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0ab),
>  		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
> -- 
> 2.7.4
> 

Ok, please stop and take a minute and go through the basic "how do I
write a kernel patch" tutorial on kernelnewbies.org.

You are submitting a patch that has a number of obvious things wrong
with it:
	- invalid from: line that does not match the signed-off-by line
	- made up out of thin air "reviewed-by:" lines from people who
	  have OBVIOUSLY NOT REVIEWED THIS PATCH!
	- indented changelog text in an odd format
	- extra spaces in the subject line
	- no versioning in the subject line, or below the --- line as
	  the documentation requires

Please take some time off, and come back next week with this all fixed
up AFTER you have gone through the kernelnewbies tutorial AND you have
read all of the Documentation/process/submitting-patches.rst file.

thanks,

greg k-h
