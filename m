Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533CE944C;
	Thu, 21 Sep 2023 09:48:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BD34C32783;
	Thu, 21 Sep 2023 09:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695289713;
	bh=J91xLLYh3063mIz8vTCj0EDjswezy2qXl2KyxMg3RQI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fU057suNKQbihbsVL2RWa98mU6/opeEGInjY7XwbSg83INDcPahdBga23HxJVedq6
	 1940hb8sDpd52ueZhRszkTZGjQTbKIVk45BC9C0Oiz4+XQSj4k7iZwPlFgY6B2Wg71
	 6JhA70Ulb3ae4S/VLNazQq97Bv4IvAJzX9bqjQOi1hIRY5/L7HK1mo1T1fQCWIJ9Q7
	 bpSlWHVeppCYURvyle4n7VWHn7jZX31tJIU3/sR3VXwGM7f3BNWLdsH7FZUP8jb/4D
	 qYASDzCHLGqEop9vHSeG6kbvvHySj4zYKY2VnfAkaBRhm/eQwBHOejreG5Xor6mwtI
	 UUo9yEKkxigmA==
Date: Thu, 21 Sep 2023 11:48:23 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Mrinmay Sarkar <quic_msarkar@quicinc.com>
Cc: agross@kernel.org, andersson@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	konrad.dybcio@linaro.org, quic_shazhuss@quicinc.com,
	quic_nitegupt@quicinc.com, quic_ramkri@quicinc.com,
	quic_nayiluri@quicinc.com, quic_krichai@quicinc.com,
	quic_vbadigan@quicinc.com, quic_parass@quicinc.com,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v1 5/5] arm64: dts: qcom: sa8775p: Add ep pcie0
 controller node
Message-ID: <20230921094823.GE2891@thinkpad>
References: <1695218113-31198-1-git-send-email-quic_msarkar@quicinc.com>
 <1695218113-31198-6-git-send-email-quic_msarkar@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1695218113-31198-6-git-send-email-quic_msarkar@quicinc.com>

On Wed, Sep 20, 2023 at 07:25:12PM +0530, Mrinmay Sarkar wrote:
> Add ep pcie dtsi node for pcie0 controller found on sa8775p platform.
> 

It would be good to add more info in the commit message, like PCIe Gen, lane
info, IP revision etc...

> Signed-off-by: Mrinmay Sarkar <quic_msarkar@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 45 +++++++++++++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> index 9f4f58e8..5571131 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> @@ -2600,4 +2600,49 @@
>  
>  		status = "disabled";
>  	};
> +
> +	pcie0_ep: pcie-ep@1c00000 {
> +		compatible = "qcom,sa8775p-pcie-ep";
> +		reg = <0x0 0x01c00000 0x0 0x3000>,
> +		      <0x0 0x40000000 0x0 0xf20>,
> +		      <0x0 0x40000f20 0x0 0xa8>,
> +		      <0x0 0x40001000 0x0 0x4000>,
> +		      <0x0 0x40200000 0x0 0x100000>,
> +		      <0x0 0x01c03000 0x0 0x1000>,
> +		      <0x0 0x40005000 0x0 0x2000>;
> +		reg-names = "parf", "dbi", "elbi", "atu", "addr_space",
> +			    "mmio", "dma";
> +
> +		clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
> +			<&gcc GCC_PCIE_0_CFG_AHB_CLK>,
> +			<&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
> +			<&gcc GCC_PCIE_0_SLV_AXI_CLK>,
> +			<&gcc GCC_PCIE_0_SLV_Q2A_AXI_CLK>;
> +
> +		clock-names = "aux",
> +			      "cfg",
> +			      "bus_master",
> +			      "bus_slave",
> +			      "slave_q2a";
> +
> +		interrupts = <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 630 IRQ_TYPE_LEVEL_HIGH>;
> +
> +		interrupt-names = "global", "doorbell", "dma";
> +
> +		interconnects = <&pcie_anoc MASTER_PCIE_0 0 &mc_virt SLAVE_EBI1 0>,
> +				<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_PCIE_0 0>;
> +		interconnect-names = "pcie-mem", "cpu-pcie";
> +

Don't you need iommu property?

> +		resets = <&gcc GCC_PCIE_0_BCR>;
> +		reset-names = "core";
> +		power-domains = <&gcc PCIE_0_GDSC>;
> +		phys = <&pcie0_phy>;
> +		phy-names = "pciephy";
> +		max-link-speed = <3>;

Gen 3?

> +		num-lanes = <2>;

Only 2 lanes? Or the other one has 4 lanes?

- Mani

> +
> +		status = "disabled";
> +	};
>  };
> -- 
> 2.7.4
> 

-- 
மணிவண்ணன் சதாசிவம்
