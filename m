Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739A08F49;
	Thu, 21 Sep 2023 08:11:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA915C116B1;
	Thu, 21 Sep 2023 08:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695283900;
	bh=Gewh+X/afwnYE29YDMBBSxcYouKp+J6pI9o/VDPi61s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OOA97oSA87QUXG8tkGzL4e+OSoo31vbKdlGVmS82Rki1F6e6aK/ISRu3oFg3WttHU
	 hzASotkvmkEWgGL97btIXv1zY0ngfxmtdLZBbCPkYelDLUT7JFSaLbzD4C9di3BSRa
	 15TTx1vPfe5HUOO2e6VENo6GqHKp4RgPcCW6zSDK69bYfQrPm02bNtZZapQMWRCw7b
	 c5yYrG9EmjRXx3OWJ5D/VwlH3ZO4UVCOC7E/R9M6WC78qrfh1h9I4vP47H1w9YT55m
	 9fy/q6WY3fczWq9OLQN+8Dqyxfk6PWf12G6xLK69kEifZm3iUQR1hZ7HflCin9DRbO
	 NLGEIL3TcplMw==
Date: Thu, 21 Sep 2023 10:11:32 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Mrinmay Sarkar <quic_msarkar@quicinc.com>
Cc: agross@kernel.org, andersson@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	konrad.dybcio@linaro.org, mani@kernel.org,
	quic_shazhuss@quicinc.com, quic_nitegupt@quicinc.com,
	quic_ramkri@quicinc.com, quic_nayiluri@quicinc.com,
	quic_krichai@quicinc.com, quic_vbadigan@quicinc.com,
	quic_parass@quicinc.com, Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Vinod Koul <vkoul@kernel.org>, linux-pci@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v1 1/5] dt-bindings: PCI: qcom-ep: Add support for
 SA8775P SoC
Message-ID: <20230921081132.GA2891@thinkpad>
References: <1695218113-31198-1-git-send-email-quic_msarkar@quicinc.com>
 <1695218113-31198-2-git-send-email-quic_msarkar@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1695218113-31198-2-git-send-email-quic_msarkar@quicinc.com>

On Wed, Sep 20, 2023 at 07:25:08PM +0530, Mrinmay Sarkar wrote:
> Add devicetree bindings support for SA8775P SoC.
> Define reg and interrupt per platform.
> 
> Signed-off-by: Mrinmay Sarkar <quic_msarkar@quicinc.com>
> ---
>  .../devicetree/bindings/pci/qcom,pcie-ep.yaml      | 130 +++++++++++++++++----
>  1 file changed, 108 insertions(+), 22 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
> index a223ce0..e860e8f 100644
> --- a/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
> +++ b/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
> @@ -13,6 +13,7 @@ properties:
>    compatible:
>      oneOf:
>        - enum:
> +          - qcom,sa8775p-pcie-ep
>            - qcom,sdx55-pcie-ep
>            - qcom,sm8450-pcie-ep
>        - items:
> @@ -20,29 +21,19 @@ properties:
>            - const: qcom,sdx55-pcie-ep
>  
>    reg:
> -    items:
> -      - description: Qualcomm-specific PARF configuration registers
> -      - description: DesignWare PCIe registers
> -      - description: External local bus interface registers
> -      - description: Address Translation Unit (ATU) registers
> -      - description: Memory region used to map remote RC address space
> -      - description: BAR memory region
> +    minItems: 6
> +    maxItems: 7
>  
>    reg-names:
> -    items:
> -      - const: parf
> -      - const: dbi
> -      - const: elbi
> -      - const: atu
> -      - const: addr_space
> -      - const: mmio
> +    minItems: 6
> +    maxItems: 7
>  
>    clocks:
> -    minItems: 7
> +    minItems: 5
>      maxItems: 8
>  
>    clock-names:
> -    minItems: 7
> +    minItems: 5
>      maxItems: 8
>  
>    qcom,perst-regs:
> @@ -57,14 +48,12 @@ properties:
>            - description: Perst separation enable offset
>  
>    interrupts:
> -    items:
> -      - description: PCIe Global interrupt
> -      - description: PCIe Doorbell interrupt
> +    minItems: 2
> +    maxItems: 3
>  
>    interrupt-names:
> -    items:
> -      - const: global
> -      - const: doorbell
> +    minItems: 2
> +    maxItems: 3
>  
>    reset-gpios:
>      description: GPIO used as PERST# input signal
> @@ -122,6 +111,51 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - qcom,sa8775p-pcie-ep
> +    then:
> +      properties:
> +        reg:
> +          items:
> +            - description: Qualcomm-specific PARF configuration registers
> +            - description: DesignWare PCIe registers
> +            - description: External local bus interface registers
> +            - description: Address Translation Unit (ATU) registers
> +            - description: Memory region used to map remote RC address space
> +            - description: BAR memory region
> +            - description: DMA memory region

It should be described as "DMA register space" or something, because this could
be misinterpreted as memory region for doing DMA.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
