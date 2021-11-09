Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC422C83
	for <mhi@lists.linux.dev>; Tue,  9 Nov 2021 06:09:47 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id t21so19017636plr.6
        for <mhi@lists.linux.dev>; Mon, 08 Nov 2021 22:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3UMQ+IMa+soVBoyYN64G/6OyoEqBBdIjr60HkQKpNx8=;
        b=KZaPR85qHnb2yKJr4Zb3HksFeFbhp9G5ogo/MdQMtO2WH0hekoook0Vt4487LMv3DI
         EZ0IKoPmpz97Jb1XZ4sLl3X7/CAkjjsXH2vl5hzq6NE9fJDEPnlKhvOa7B3kiDVm6oxW
         EBstH3kSpqCyMwchR7NYBfno3q91DaVpBmKgc9HrHV8U9liDb+9Sz8Nvg/etv3fB0J82
         J62zQAeQDIJuNE/w/tCzN41cPMRJGyxZGWn6tp4GSsf3Zs/fa33GTpD4LdPiEnwVbgzR
         1PnxMKpiC510UXvkja82txpR8AqL0dO2xA1tZ/jotq5gaVtCGLxD0jKI7sv+7lc0W0EY
         suzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3UMQ+IMa+soVBoyYN64G/6OyoEqBBdIjr60HkQKpNx8=;
        b=qP0m/C92bKef3FIm3srXN7U5EfDK5qtYPeLvN0OR6uU5SVwRRsI5LAtSE+w8ilcCO6
         iWfsyMi0WM0ctX7lfz6r2+8JiIfaNDCNVqGJIVi4IUymCmnISocrX1FIW/FCPGlQFp5R
         twfP7qWJNkNIwqhEhd5jJMJGO8J3moyeUPslkMjjS6sPGRHcLuMWcZ/VBy/oB9XUPIWL
         tASin10dc7xZJHaOZGJiG4ISUVVnNMMc9fne4HS7eA/As5aSTQEiU6sVLn37pSjy4J7B
         IggVYUrFzP0YtTRVIRg2eVaMs4GdBynGZ2DtUj6jtRra5TdHiBKCLwD/CI2GXTbtrcti
         OrXg==
X-Gm-Message-State: AOAM532bYfeX6Hv4QBMNBqEcmPTIB63t14n6N6eheYKlMxPJhg5aiUfO
	8An0d6YhCBoxTEicD56XDn/8y4kg/DXH6Ks=
X-Google-Smtp-Source: ABdhPJwNKVQwXClKhZuDD23mjW/GMmAAsVvWIADqtgxcYdFWepoXh4uyRFP3LuTv+g5FdbftBBcsaw==
X-Received: by 2002:a17:903:2093:b0:142:7dff:f7de with SMTP id d19-20020a170903209300b001427dfff7demr4995953plc.75.1636438186599;
        Mon, 08 Nov 2021 22:09:46 -0800 (PST)
Received: from thinkpad ([117.217.177.76])
        by smtp.gmail.com with ESMTPSA id l11sm18755948pfu.129.2021.11.08.22.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 22:09:46 -0800 (PST)
Date: Tue, 9 Nov 2021 11:39:38 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Anilkumar Kolli <akolli@codeaurora.org>
Cc: Rob Herring <robh@kernel.org>, ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
	mhi@lists.linux.dev
Subject: Re: [PATCH 1/2] dt: bindings: add new DT entry for ath11k PCI device
 support
Message-ID: <20211109060938.GA5235@thinkpad>
References: <1635175648-23491-1-git-send-email-akolli@codeaurora.org>
 <YYBPd+Z/dA/pTReo@robh.at.kernel.org>
 <b142a4850d9cbc3bb451a78b488688cc@codeaurora.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b142a4850d9cbc3bb451a78b488688cc@codeaurora.org>

On Tue, Nov 09, 2021 at 10:33:58AM +0530, Anilkumar Kolli wrote:
> On 2021-11-02 02:05, Rob Herring wrote:
> > On Mon, Oct 25, 2021 at 08:57:27PM +0530, Anilkumar Kolli wrote:
> > > Ath11k driver supports PCI devices such as QCN9074/QCA6390.
> > > Ath11k firmware uses host DDR memory, DT entry is used to reserve
> > > these host DDR memory regions, send these memory base
> > > addresses using DT entries.
> > > 
> > > Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
> > > ---
> > >  .../bindings/net/wireless/qcom,ath11k.yaml         | 38
> > > ++++++++++++++++++++++
> > >  1 file changed, 38 insertions(+)
> > > 
> > > diff --git
> > > a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
> > > b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
> > > index 5ac9616c9239..c7e6612e949c 100644
> > > --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
> > > +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
> > > @@ -19,6 +19,10 @@ description: |
> > >    These devices use HOST DDR memory, HOST DDR memory can be reserved
> > >    and send to ath11k driver from DT.
> > > 
> > > +  ATH11K supports PCI devices like QCA6390,QCN9074.
> > > +  These devices use host DDR memory, host DDR memory can be reserved
> > > +  and send to ath11k driver from DT.
> > > +
> > >  properties:
> > >    compatible:
> > >      enum:
> > > @@ -177,6 +181,29 @@ properties:
> > >      description:
> > >        HOST DDR end address.
> > > 
> > > +  qcom,base-addr:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    description:
> > > +      Host DDR base address for firmware. QCN9074 firmware uses 45
> > > MB of host
> > > +      DDR memory in mode-0 and 15 MB of host DDR memory in mode-2.
> > > +
> > > +  qcom,caldb-addr:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    description:
> > > +      Host DDR address to store CALDB. CALDB is calibration data base
> > > +      for WLAN channel and tx power.
> > > +
> > 
> > Use /reserved-memory entries for these.
> > 
> 
> Sure.
> 
> > > +  qcom,start-addr:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    description:
> > > +      Host DDR start address. For example on x86 it is 0x0,
> > > +      on IPQ8074 it is 0x41000000.
> > > +
> > > +  qcom,end-addr:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    description:
> > > +      Host DDR end address.
> > 
> > Nak. I don't know what you are doing with these 2, but it's wrong.
> > 
> 
> The DDR start address and end address are sent to MHI control bus,
> For x86 platform code snip in ath11k/mhi.c
> 
>         mhi_ctrl->iova_start = 0;
>         mhi_ctrl->iova_stop = 0xffffffff;
> 
> Similarly for ARM platfroms, send DDR addresses from DT entry.
> 

You can use the reserved memory node for ddr address also. In the ath11k driver,
use devicetree APIs for fetching the start and end addresses.

Thanks,
Mani

> Thanks
> Anil
