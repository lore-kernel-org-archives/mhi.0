Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B603C8E8;
	Thu, 26 Oct 2023 06:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ghHdAM8Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95790C433C8;
	Thu, 26 Oct 2023 06:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698300648;
	bh=pONAWio6zJ23+IB5xTKsENcO0zHAOwL4Ssws6dVkctU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ghHdAM8Yw67mW/v49+wCyoB3v0iHYLZQt7oo4DPi4IOn1M8jHRYFzw412ERpsbPET
	 YDAI+hdjPJqAMrRujJXd061m36/S8fy3oCfbEZ1QK+qvoFcx6JtqvsVQD7KY8v7kJR
	 1q8erIOul0k8/s6sycMl3X8DWYZNv337rT7fPRWudJH4SIuE3282GFp6JccZwbn7Rj
	 /P6eiKYtVWGHcvb2PaPfa3h9Y9Pf2l+IlVCi7A/MEVbb/D1d1jHmJkMneKvFG0DPrG
	 CJG42MEzHSUmY47ykiJhzdSM78CtHIkY5WvpDvAvj2z5W3cg8teWWYFhddbpf5ct88
	 VZzKG2EE6MeTA==
Date: Thu, 26 Oct 2023 11:40:35 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Mrinmay Sarkar <quic_msarkar@quicinc.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, agross@kernel.org,
	andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, konrad.dybcio@linaro.org,
	quic_shazhuss@quicinc.com, quic_nitegupt@quicinc.com,
	quic_ramkri@quicinc.com, quic_nayiluri@quicinc.com,
	dmitry.baryshkov@linaro.org, robh@kernel.org,
	quic_krichai@quicinc.com, quic_vbadigan@quicinc.com,
	quic_parass@quicinc.com, Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v3 2/5] PCI: qcom-ep: Add support for SA8775P SOC
Message-ID: <20231026061035.GA4915@thinkpad>
References: <1697715430-30820-1-git-send-email-quic_msarkar@quicinc.com>
 <1697715430-30820-3-git-send-email-quic_msarkar@quicinc.com>
 <20231025075317.GC3648@thinkpad>
 <adbca084-a74b-51be-67b5-a3b9e45da506@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <adbca084-a74b-51be-67b5-a3b9e45da506@quicinc.com>

On Thu, Oct 26, 2023 at 11:08:03AM +0530, Mrinmay Sarkar wrote:
> 
> On 10/25/2023 1:23 PM, Manivannan Sadhasivam wrote:
> > On Thu, Oct 19, 2023 at 05:07:07PM +0530, Mrinmay Sarkar wrote:
> > > Add support for SA8775P SoC to the Qualcomm PCIe Endpoint Controller
> > > driver. There will be some change specific to SA8775P so adding new
> > > compatible string.
> > > 
> > What are those specific changes?
> > 
> > - Mani
> 
> Need to enable cache snooping logic for SA8775P only.
> 

Then you can add the compatible to the driver at that time and use the fallback
till then i.e., just document the SA8775P compatible in bindings and use both
SA8775P and SM8450 compatibles in the dts where the latter will act as a
fallback.

- Mani

> --Mrinmay
> 
> > > Signed-off-by: Mrinmay Sarkar <quic_msarkar@quicinc.com>
> > > ---
> > >   drivers/pci/controller/dwc/pcie-qcom-ep.c | 1 +
> > >   1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> > > index 32c8d9e..4c01c34 100644
> > > --- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
> > > +++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> > > @@ -858,6 +858,7 @@ static void qcom_pcie_ep_remove(struct platform_device *pdev)
> > >   }
> > >   static const struct of_device_id qcom_pcie_ep_match[] = {
> > > +	{ .compatible = "qcom,sa8775p-pcie-ep", },
> > >   	{ .compatible = "qcom,sdx55-pcie-ep", },
> > >   	{ .compatible = "qcom,sm8450-pcie-ep", },
> > >   	{ }
> > > -- 
> > > 2.7.4
> > > 

-- 
மணிவண்ணன் சதாசிவம்
