Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729E0440D
	for <mhi@lists.linux.dev>; Fri, 28 Jul 2023 04:10:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0FB2C433C7;
	Fri, 28 Jul 2023 04:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690517399;
	bh=F8nIXDxD0F3z4YhoSjTSX8IFJ05consSO36yJuwugAk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BZcyH9CUFjVD/kmcWvRjY26aS/D4op8pp77H84DWIpJv94e0GEPw7+uOCdDMXqGf0
	 39nobliSYFMMRLTA596u1qX1uyANoihapqb2WoSIFakLzMNBivxEwCz9BD3/GpBN5C
	 wqYmdrJnnMj88neGR3PSdGMuQDmkyEyxLKfgfSizvai3Z++n1UXSGcgFDhC7W4BQYW
	 t0uHufHuesfAcKZu/NEArkrvJg04VwQngW3LMZPKUHjWCv1YXUlBNwgQ7KRvuxV0wh
	 jsWDeUDUJnqIZkSYnq8vxrIrAgDaOywLaYEBQwcBLAX+5R2tbRmoJ1bVnGbU54nard
	 quTxyiI2FKFzA==
Date: Fri, 28 Jul 2023 09:39:49 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krishna chaitanya chundru <quic_krichai@quicinc.com>
Cc: manivannan.sadhasivam@linaro.org, helgaas@kernel.org,
	linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_vbadigan@quicinc.com,
	quic_nitegupt@quicinc.com, quic_skananth@quicinc.com,
	quic_ramkri@quicinc.com, krzysztof.kozlowski@linaro.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	"open list:MHI BUS" <mhi@lists.linux.dev>
Subject: Re: [PATCH v4 3/9] PCI: epf-mhi: Add support for handling D-state
 notify from EPC
Message-ID: <20230728040949.GF4433@thinkpad>
References: <1689232218-28265-1-git-send-email-quic_krichai@quicinc.com>
 <1689232218-28265-4-git-send-email-quic_krichai@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1689232218-28265-4-git-send-email-quic_krichai@quicinc.com>

On Thu, Jul 13, 2023 at 12:40:12PM +0530, Krishna chaitanya chundru wrote:
> Add support for handling D-state notify for MHI EPF.
> 
> Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
> ---
>  drivers/pci/endpoint/functions/pci-epf-mhi.c | 11 +++++++++++
>  include/linux/mhi_ep.h                       |  3 +++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/drivers/pci/endpoint/functions/pci-epf-mhi.c b/drivers/pci/endpoint/functions/pci-epf-mhi.c
> index 9c1f5a1..ee91bfc 100644
> --- a/drivers/pci/endpoint/functions/pci-epf-mhi.c
> +++ b/drivers/pci/endpoint/functions/pci-epf-mhi.c
> @@ -339,6 +339,16 @@ static int pci_epf_mhi_bme(struct pci_epf *epf)
>  	return 0;
>  }
>  
> +static int pci_epf_mhi_dstate_notify(struct pci_epf *epf, pci_power_t state)
> +{
> +	struct pci_epf_mhi *epf_mhi = epf_get_drvdata(epf);
> +	struct mhi_ep_cntrl *mhi_cntrl = &epf_mhi->mhi_cntrl;
> +
> +	mhi_cntrl->dstate = state;

Where is this variable being used? Also, don't we need any locking?

- Mani

> +
> +	return 0;
> +}
> +
>  static int pci_epf_mhi_bind(struct pci_epf *epf)
>  {
>  	struct pci_epf_mhi *epf_mhi = epf_get_drvdata(epf);
> @@ -394,6 +404,7 @@ static struct pci_epc_event_ops pci_epf_mhi_event_ops = {
>  	.link_up = pci_epf_mhi_link_up,
>  	.link_down = pci_epf_mhi_link_down,
>  	.bme = pci_epf_mhi_bme,
> +	.dstate_notify = pci_epf_mhi_dstate_notify,
>  };
>  
>  static int pci_epf_mhi_probe(struct pci_epf *epf,
> diff --git a/include/linux/mhi_ep.h b/include/linux/mhi_ep.h
> index f198a8a..c3a0685 100644
> --- a/include/linux/mhi_ep.h
> +++ b/include/linux/mhi_ep.h
> @@ -8,6 +8,7 @@
>  
>  #include <linux/dma-direction.h>
>  #include <linux/mhi.h>
> +#include <linux/pci.h>
>  
>  #define MHI_EP_DEFAULT_MTU 0x8000
>  
> @@ -139,6 +140,8 @@ struct mhi_ep_cntrl {
>  
>  	enum mhi_state mhi_state;
>  
> +	pci_power_t dstate;
> +
>  	u32 max_chan;
>  	u32 mru;
>  	u32 event_rings;
> -- 
> 2.7.4
> 

-- 
மணிவண்ணன் சதாசிவம்
