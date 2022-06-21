Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5551DECF
	for <mhi@lists.linux.dev>; Tue, 21 Jun 2022 13:18:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48233C3411C;
	Tue, 21 Jun 2022 13:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655817484;
	bh=RtUe+YE8cUHP2cPCHPPT+9RzwFZCRXFfUKZJSO4gf7A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tY4G5uLg/ZgLvp3Rin3eVnNTL+6ffuGuM0DF/xs+uJ5AD/EgXB6yUvHHwCOv03jZs
	 xJrB171Um3I/ZrL6YgamfNN4i8iz4Bj4OUXN2mcE9cxhhhD8fCrnp7bG3MOXD9C7Dn
	 yhGEy6kzOwjzyTCLd8QOSFhop9Ww1qDkrvbzXl6baPtmNZevuFLFG6i6TU2LmK41pr
	 jGh8OfBXxdkrFg383LHvqtu+pqM2HbzoloesbLQke+xMJvfgtm3CPIu3fC7MsN9wdt
	 aHHjhRskI1C6hQ5QVqu/aOveTtJj7OlGAZGJxhyIOIrUOc7ry9eEuiqxZO4UilW5BJ
	 QJakkvvyAGAVQ==
Date: Tue, 21 Jun 2022 18:47:51 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Slark Xiao <slark_xiao@163.com>
Cc: quic_hemantk@quicinc.com, gregkh@linuxfoundation.org,
	loic.poulain@linaro.org, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	christophe.jaillet@wanadoo.fr
Subject: Re: [PATCH] bus: mhi: host: Add support for Cinterion MV31-W with
 new device ID
Message-ID: <20220621131751.GD17181@thinkpad>
References: <20220601061915.10946-1-slark_xiao@163.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220601061915.10946-1-slark_xiao@163.com>

On Wed, Jun 01, 2022 at 02:19:15PM +0800, Slark Xiao wrote:

Please use pci_generic in the subject as this change belongs to that driver:

bus: mhi: host: pci_generic: Add Cinterion MV31-W with new baseline

> As Thales would use a new baseline, so we need to add
> a new device ID to separate it from previous.
> 

Thales refers to Cinterion MV31-W, right? Better just use Cinterion MV31-W.
Like,

Cinterion MV31-W modem with a new baseline (firmware) is sold as a separate
product with different device ID. So add support for the same reusing the
config.

Thanks,
Mani

> Signed-off-by: Slark Xiao <slark_xiao@163.com>
> ---
>  drivers/bus/mhi/host/pci_generic.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 6fbc5915ea36..a2a4fd2cd13d 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -578,6 +578,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
>  	/* MV31-W (Cinterion) */
>  	{ PCI_DEVICE(0x1269, 0x00b3),
>  		.driver_data = (kernel_ulong_t) &mhi_mv31_info },
> +	/* MV31-W (Cinterion), based on new baseline */
> +	{ PCI_DEVICE(0x1269, 0x00b4),
> +		.driver_data = (kernel_ulong_t) &mhi_mv31_info },
>  	/* MV32-WA (Cinterion) */
>  	{ PCI_DEVICE(0x1269, 0x00ba),
>  		.driver_data = (kernel_ulong_t) &mhi_mv32_info },
> -- 
> 2.25.1
> 

-- 
மணிவண்ணன் சதாசிவம்
