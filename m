Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A16D15481
	for <mhi@lists.linux.dev>; Wed, 11 Oct 2023 11:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m8H/dzMa"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-9b27bc8b65eso1130226466b.0
        for <mhi@lists.linux.dev>; Wed, 11 Oct 2023 04:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697024598; x=1697629398; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZgxFWFlqtNB9y2KoDFsWngJ4vKWBFSBMlRLjDq6FqUA=;
        b=m8H/dzManrtgCTVlEYwe2MuM1M/rB8WNbm0w3BZdjbkNgS0zUwJ+9AJMGTkpdqSsGc
         hagCxfXuHYIRb9xUGgiFCLIGipv5K1IR7du9C/1oL/IV0URRgbvcb0UH562z+rT204NP
         Rlglcpm6WOF2sV21OhkoINXYeY6Z+YLjIIVAeGF3oe6muhAYUJwNQkuVUEmhn8A2TAt7
         aXMbslMSFj45ZTeAVpIllFpKXMqO37acaDnH4veEJViay20kF5yHGrmSJ3UEilYQHG6H
         7b8hfpM/a+onB7A8dc5vu74/RFWn4zz0KUtKAgM94vl3rxI9X/6VhiannSo2fUKQVhXx
         gCgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697024598; x=1697629398;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZgxFWFlqtNB9y2KoDFsWngJ4vKWBFSBMlRLjDq6FqUA=;
        b=B2iE2AKUWuu8U7mEUs2lScuNoNwy/52zrJBFdAN/pERq9GlVm7sGprrkpb1OKppV82
         kQOkEoswCoZ82Y2Y0hrx8e8EKB/z2xtNLNtP0DWWQkMQBAuFv3ax9cRz6XFSsKJG4cz7
         yFKh+FVfOc6/X+YpY1Bwp7Oc2MzUxP7uo54rPkInd3WWi7Tq+w0y75YnE3G4H0Y1dV32
         nKcW4h+u6qxeh14s47wuljHwqcBsCnXKGTkV0nA+fOgpuU7gj9PKBJSULmM6TxdQQaWu
         rbAPXPwBmlbpmmBeicTdOU4OPeR8arsUqhZxZRf5a+osW0ZkIQIJJeroEKZ2KhTEo7HU
         HKQg==
X-Gm-Message-State: AOJu0YzH7JYxcRm1eVQFDdWcag9uiGOSw0QzKW9Va7oDiVCWjZK0Td3l
	jdvhvJSOgnY8xp4AvAxWMDaYxE9lfGqCynJ94M8DVA==
X-Google-Smtp-Source: AGHT+IF+0sYBl6h4x+B0Hh3LisaV7RDJ/W7t5rpHpMiyWZMWhMOJ9yAdGZnDXCwDAWqrX82dofTUxKy7oUeA7d1TUFg=
X-Received: by 2002:a17:906:8a73:b0:9a1:e758:fc73 with SMTP id
 hy19-20020a1709068a7300b009a1e758fc73mr17381841ejc.67.1697024598423; Wed, 11
 Oct 2023 04:43:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1695218113-31198-1-git-send-email-quic_msarkar@quicinc.com>
 <1695218113-31198-2-git-send-email-quic_msarkar@quicinc.com>
 <20230921183850.GA762694-robh@kernel.org> <28bf111f-b965-4d38-884b-bc3a0b68a6cc@quicinc.com>
 <8effa7e5-a223-081b-75b8-7b94400d42e6@quicinc.com>
In-Reply-To: <8effa7e5-a223-081b-75b8-7b94400d42e6@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 11 Oct 2023 14:43:05 +0300
Message-ID: <CAA8EJpp+3_A-9YXF1yOKdFweVKqrpTxvxKoJcUH6qiDHfCQ-dQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/5] dt-bindings: PCI: qcom-ep: Add support for SA8775P SoC
To: Mrinmay Sarkar <quic_msarkar@quicinc.com>
Cc: Shazad Hussain <quic_shazhuss@quicinc.com>, Rob Herring <robh@kernel.org>, agross@kernel.org, 
	andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	konrad.dybcio@linaro.org, mani@kernel.org, quic_nitegupt@quicinc.com, 
	quic_ramkri@quicinc.com, quic_nayiluri@quicinc.com, quic_krichai@quicinc.com, 
	quic_vbadigan@quicinc.com, quic_parass@quicinc.com, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Vinod Koul <vkoul@kernel.org>, linux-pci@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mhi@lists.linux.dev, 
	linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Oct 2023 at 14:14, Mrinmay Sarkar <quic_msarkar@quicinc.com> wrote:
>
>
> On 10/6/2023 4:24 PM, Shazad Hussain wrote:
> >
> >
> > On 9/22/2023 12:08 AM, Rob Herring wrote:
> >> On Wed, Sep 20, 2023 at 07:25:08PM +0530, Mrinmay Sarkar wrote:
> >>> Add devicetree bindings support for SA8775P SoC.
> >>> Define reg and interrupt per platform.
> >>>
> >>> Signed-off-by: Mrinmay Sarkar <quic_msarkar@quicinc.com>
> >>> ---
> >>>   .../devicetree/bindings/pci/qcom,pcie-ep.yaml      | 130
> >>> +++++++++++++++++----
> >>>   1 file changed, 108 insertions(+), 22 deletions(-)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
> >>> b/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
> >>> index a223ce0..e860e8f 100644
> >>> --- a/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
> >>> +++ b/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
> >>> @@ -13,6 +13,7 @@ properties:
> >>>     compatible:
> >>>       oneOf:
> >>>         - enum:
> >>> +          - qcom,sa8775p-pcie-ep
> >>>             - qcom,sdx55-pcie-ep
> >>>             - qcom,sm8450-pcie-ep
> >>>         - items:
> >>> @@ -20,29 +21,19 @@ properties:
> >>>             - const: qcom,sdx55-pcie-ep
> >>>       reg:
> >>> -    items:
> >>> -      - description: Qualcomm-specific PARF configuration registers
> >>> -      - description: DesignWare PCIe registers
> >>> -      - description: External local bus interface registers
> >>> -      - description: Address Translation Unit (ATU) registers
> >>> -      - description: Memory region used to map remote RC address space
> >>> -      - description: BAR memory region
> >>> +    minItems: 6
> >>> +    maxItems: 7
> >>>       reg-names:
> >>> -    items:
> >>> -      - const: parf
> >>> -      - const: dbi
> >>> -      - const: elbi
> >>> -      - const: atu
> >>> -      - const: addr_space
> >>> -      - const: mmio
> >>> +    minItems: 6
> >>> +    maxItems: 7
> >>
> >> Don't move these into if/then schemas. Then we are duplicating the
> >> names, and there is no reason to keep them aligned for new compatibles.
> >>
> >> Rob
> >
> > Hi Rob,
> > As we have one extra reg property (dma) required for sa8775p-pcie-ep,
> > isn't it expected to be moved in if/then as per number of regs
> > required. Anyways we would have duplication of some properties for new
> > compatibles where the member numbers differs for a property.
> >
> > Are you suggesting to add the extra reg property (dma) in the existing
> > reg and reg-names list, and add minItems/maxItems for all compatibles
> > present in this file ?

This is what we have been doing in other cases: if the list is an
extension of the current list, there is no need to duplicate it. One
can use min/maxItems instead.

> >
> > -Shazad
>
> Here we have defined reg and interrupt per platform as clocks is defined.
>
> -Mrinmay
>


-- 
With best wishes
Dmitry
