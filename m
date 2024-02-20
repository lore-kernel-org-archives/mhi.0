Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBC85674E
	for <mhi@lists.linux.dev>; Tue, 20 Feb 2024 12:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708432741; cv=none; b=Wmim4s3fkqf8j7j9ieTWrv8ewc/71JFGqmZ7Kiaw13hvEXXTBrxy2UJJX9two1VQVLP+O4fr2qa3jUK76NiVW7KSTpkqCY6W4hxOkyARxBNgGEZtmZdHAH5a4m0cRZQenKEcrCWKfwYIT3/IE+Vu3SYKkTuvbjZqGQj/RBAGx5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708432741; c=relaxed/simple;
	bh=rmJz9L1aMyqe1TFVpwpkVJML0wDploXGJH+3/bcrmRQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ojJtl4QPcKl7fnRAxJcB+2zZQ2R96G97uPmIppcZuU8M6cwtfEPq+smvzVpjPLueEH3+cH5hDIu4cf9OeIUy1xDxfz7JuazNbbTK1joL9h24gNLlPJ0yh3jzw/UHmrBC3AGc2frSmRwRBylKFrRPS+foickWVw6B1aVZA2c9PP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=XXzNh132; arc=none smtp.client-ip=198.47.19.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="XXzNh132"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41KCcr6G094669;
	Tue, 20 Feb 2024 06:38:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1708432733;
	bh=M6ic/FwxrMoRrJ1uWSsIK77gJf/9b0I4Y/5sr5Kv/2I=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=XXzNh132GM3SRdfTkpnaXbNN/tgfNSXrozN4nTokIbnSta+2LT8Mdbw+wSKTdRsag
	 Ru15iE390Et01q6reUUZNkmbr8b0T5NNEGI5WZwJRFalaIfqyAFeCacj+wNsGy1krK
	 kSzzN7gKSkH7N4xmgTAkzpmMggnq95hLyTg77ccY=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41KCcrbv128215
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 20 Feb 2024 06:38:53 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 20
 Feb 2024 06:38:51 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 20 Feb 2024 06:38:51 -0600
Received: from localhost (uda0492258.dhcp.ti.com [172.24.227.9])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41KCco9F108974;
	Tue, 20 Feb 2024 06:38:51 -0600
Date: Tue, 20 Feb 2024 18:08:50 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: Jingoo Han <jingoohan1@gmail.com>,
        Gustavo Pimentel
	<gustavo.pimentel@synopsys.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
        Rob Herring
	<robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Marek Vasut
	<marek.vasut+renesas@gmail.com>,
        Yoshihiro Shimoda
	<yoshihiro.shimoda.uh@renesas.com>,
        Kishon Vijay Abraham I
	<kishon@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>, <linux-pci@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <mhi@lists.linux.dev>,
        Mrinmay Sarkar <quic_msarkar@quicinc.com>, <s-vadapalli@ti.com>
Subject: Re: [PATCH v2 5/5] PCI: epf-mhi: Enable HDMA for SA8775P SoC
Message-ID: <3fccfa32-9bc8-4817-8115-b805206f5d3b@ti.com>
References: <20240216-dw-hdma-v2-0-b42329003f43@linaro.org>
 <20240216-dw-hdma-v2-5-b42329003f43@linaro.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240216-dw-hdma-v2-5-b42329003f43@linaro.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

On 24/02/16 11:04PM, Manivannan Sadhasivam wrote:
> From: Mrinmay Sarkar <quic_msarkar@quicinc.com>
> 
> SA8775P SoC supports Hyper DMA (HDMA) DMA Engine present in the DWC IP. So,
> let's enable it in the EPF driver so that the DMA Engine APIs can be used
> for data transfer.
> 
> Signed-off-by: Mrinmay Sarkar <quic_msarkar@quicinc.com>
> [mani: reworded commit message]
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>

Regards,
Siddharth.
> ---
>  drivers/pci/endpoint/functions/pci-epf-mhi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pci/endpoint/functions/pci-epf-mhi.c b/drivers/pci/endpoint/functions/pci-epf-mhi.c
> index 2c54d80107cf..570c1d1fb12e 100644
> --- a/drivers/pci/endpoint/functions/pci-epf-mhi.c
> +++ b/drivers/pci/endpoint/functions/pci-epf-mhi.c
> @@ -137,6 +137,7 @@ static const struct pci_epf_mhi_ep_info sa8775p_info = {
>  	.epf_flags = PCI_BASE_ADDRESS_MEM_TYPE_32,
>  	.msi_count = 32,
>  	.mru = 0x8000,
> +	.flags = MHI_EPF_USE_DMA,
>  };
>  
>  struct pci_epf_mhi {
> 
> -- 
> 2.25.1
> 
> 
