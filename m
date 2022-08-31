Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58EB97E1
	for <mhi@lists.linux.dev>; Wed, 31 Aug 2022 08:15:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 866FBC433D6;
	Wed, 31 Aug 2022 08:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661933754;
	bh=fcsIil4Aq0DZT0l8Li8b5kEiBjhku19a5Rj5/36udYU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jz5TH+WncR9XCdfmnaWNGsB6MDyFy1ZSm+3J9UZBqAb/DnZPeGCQjjIi8p2sttQBF
	 sDGrIt3i108bVSdL1lhX+nDaK7xt1IQjO2T7+D3urEfCvfNddaeXrautmHHlbIiGYm
	 /3ei6JztMQgQ24uEBMKvAaqwKX8zRTy1CY60Su4oDnQPCIANS0P/+yJUY2v91F4vdG
	 Jm63I+gSXan7v/2QpHWcDHpL6Q5idU9ZqqRSzQrrd1OdRK2X933NIinKI7eu2jarCP
	 KLaWQiQvGAgZGey8hM2n1hW3/f5/pWmbd/z3TIxgtuFZf3GGW8eQIVdPLzoDTr6g10
	 A/CfXz8dSx0Vw==
Date: Wed, 31 Aug 2022 13:45:44 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Koen Vandeputte <koen.vandeputte@citymesh.com>
Cc: mhi@lists.linux.dev, Koen Vandeputte <koen.vandeputte@ncentric.com>
Subject: Re: [PATCH] bus: mhi: host: always print detected modem name
Message-ID: <20220831081544.GB5076@thinkpad>
References: <20220819083615.251960-1-koen.vandeputte@ncentric.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220819083615.251960-1-koen.vandeputte@ncentric.com>

On Fri, Aug 19, 2022 at 10:36:15AM +0200, Koen Vandeputte wrote:
> This harmless print provides a very easy way of knowing
> if the modem is detected properly during probing.
> 
> Promote it to an informational print so no hassle is required
> enabling kernel debugging info to obtain it.
> 
> The rationale here is that:
> On a lot of low-storage embedded devices, extensive kernel
> debugging info is not always present as this would
> increase it's size to much causing partition size issues.
> 
> Signed-off-by: Koen Vandeputte <koen.vandeputte@ncentric.com>

While applying this patch, checkpatch.pl complains that the email addresses
mismatch.

From:/Signed-off-by: email address mismatch: 'From: Koen Vandeputte <koen.vandeputte@citymesh.com>'
!= 'Signed-off-by: Koen Vandeputte <koen.vandeputte@ncentric.com>'

Can you please fix it and resend?

Thanks,
Mani


> ---
>  drivers/bus/mhi/host/pci_generic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 9e545f2a5a26..51e2b901bae0 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -841,7 +841,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  	struct mhi_controller *mhi_cntrl;
>  	int err;
>  
> -	dev_dbg(&pdev->dev, "MHI PCI device found: %s\n", info->name);
> +	dev_info(&pdev->dev, "MHI PCI device found: %s\n", info->name);
>  
>  	/* mhi_pdev.mhi_cntrl must be zero-initialized */
>  	mhi_pdev = devm_kzalloc(&pdev->dev, sizeof(*mhi_pdev), GFP_KERNEL);
> -- 
> 2.34.1
> 
> 

-- 
மணிவண்ணன் சதாசிவம்
