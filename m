Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8832583
	for <mhi@lists.linux.dev>; Wed,  4 May 2022 15:59:01 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id z16so1480567pfh.3
        for <mhi@lists.linux.dev>; Wed, 04 May 2022 08:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6MXHOA6YEV+X1pzZV5yr6mxYJZiQUg+iYsxOQ4L6Qts=;
        b=rmcRlDCYtHof+f5naFtDRpHjNhqxa8TBundsajn2+G4Nz1D7JZxC9Msh56avDbW5Rh
         fnnZPx8ScxN3T2a+0Y98k/hGbG83hvSvZAzw5ShQ5PXDXNVVlwcpBzMd9yCpaMey0WMC
         OrGw0AqsKuky4UVLUPTS8Gb4NIdHvCabP47b1l9JY3VAIxf3UF+LuZONcIPeJQSeuriu
         BqkWdkBVFa+zOgDs2y3k9y96UJt3cUOo3y90UBO9QX+S4vP9Cix/p/sRMpcRCUMLxYwd
         aenzCt8DZamKMpcwfm4YPOSd+si2UECR1hLY+6ePKeESS6jp5Acixls59VD9JpVnWu6H
         n0aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6MXHOA6YEV+X1pzZV5yr6mxYJZiQUg+iYsxOQ4L6Qts=;
        b=MAKAsVpi0Tv8Rjyaxe4TjOem8KUDH0M31KrHWqDGVLXRkdMfEch+x2+gGsVtEJaYld
         abAJxmN3hdTozauNo3vQLP77ybjGNI5kISgObEZyvpHTp/iZ/n5PXCcsbwWguE0AaLM3
         y2hyTUqWJp9RPdm7dyjupFzOAeEN9hHBa0/FV+4Au2M+OBrO64UXxtQ5CPUueVwgQ0Jn
         wVADyTZoxBKwoTvPPYsAGUvh7wWwm7JKX25N25fF2QWcI1lbLjZ9ZTv+EXQ6qfGzOaVT
         GfUeXJEOes5IHDKhCjyXl9uuFIWFSpF8gAFslXcUBDCqSGij73USof1fro0qX5mPgKSS
         AyEA==
X-Gm-Message-State: AOAM5325jv5DAZ+coHvwR9KWXu/xm7464rcMyDUZFuoXC3td4J2lpQTm
	t3aBUZQ/kyYRpv9vRuH/od4Q
X-Google-Smtp-Source: ABdhPJzQHpkQwPyKjz9Hax3QWh3wJy+mQ+EfH7kJTdpbz8IB5azX2uKl4/m7Q2wlOxrL6YGDHYC/qg==
X-Received: by 2002:a63:24d:0:b0:3c2:2f74:2ddb with SMTP id 74-20020a63024d000000b003c22f742ddbmr11937145pgc.83.1651679940736;
        Wed, 04 May 2022 08:59:00 -0700 (PDT)
Received: from thinkpad ([117.207.25.57])
        by smtp.gmail.com with ESMTPSA id v19-20020a17090ad59300b001da160621d1sm1925816pju.45.2022.05.04.08.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 08:59:00 -0700 (PDT)
Date: Wed, 4 May 2022 21:28:55 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Loic Poulain <loic.poulain@linaro.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_hemantk@quicinc.com,
	quic_bbhatt@quicinc.com
Subject: Re: [PATCH 5/5] bus: mhi: host: Remove redundant dma_wmb() before
 ctx wp update
Message-ID: <20220504155855.GA3507@thinkpad>
References: <20220502104144.91806-1-manivannan.sadhasivam@linaro.org>
 <20220502104144.91806-6-manivannan.sadhasivam@linaro.org>
 <CAMZdPi_i60TqszUL+=ocMn-4veyoGRQoOGD_B4YiEpz_uWE+ZQ@mail.gmail.com>
 <20220504081720.GB5446@thinkpad>
 <CAMZdPi9oA4SSYGSPw9tCmQ=GhwhCgdYz+=rQiUzu1tNbo80ceQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMZdPi9oA4SSYGSPw9tCmQ=GhwhCgdYz+=rQiUzu1tNbo80ceQ@mail.gmail.com>

On Wed, May 04, 2022 at 11:25:33AM +0200, Loic Poulain wrote:
> On Wed, 4 May 2022 at 10:17, Manivannan Sadhasivam
> <manivannan.sadhasivam@linaro.org> wrote:
> >
> > Hi Loic,
> >
> > On Wed, May 04, 2022 at 09:21:20AM +0200, Loic Poulain wrote:
> > > Hi Mani,
> > >
> > > On Mon, 2 May 2022 at 12:42, Manivannan Sadhasivam
> > > <manivannan.sadhasivam@linaro.org> wrote:
> > > >
> > > > The endpoint device will only read the context wp when the host rings
> > > > the doorbell.
> > >
> > > Are we sure about this statement? what if we update ctxt_wp while the
> > > device is still processing the previous ring? is it going to continue
> > > processing the new ctxt_wp or wait for a new doorbell interrupt? what
> > > about burst mode in which we don't ring at all (ring_db is no-op)?
> > >
> >
> > Good point. I think my statement was misleading. But still this scenario won't
> > happen as per my undestanding. Please see below.
> >
> > > > And moreover the doorbell write is using writel(). This
> > > > guarantess that the prior writes will be completed before ringing
> > > > doorbell.
> > >
> > > Yes but the barrier is to ensure that descriptor/ring content is
> > > updated before we actually pass it to device ownership, it's not about
> > > ordering with the doorbell write, but the memory coherent ones.
> > >
> >
> > I see a clear data dependency between writing the ring element and updating the
> > context pointer. For instance,
> >
> > ```
> > struct mhi_ring_element *mhi_tre;
> >
> > mhi_tre = ring->wp;
> > /* Populate mhi_tre */
> > ...
> >
> > /* Increment wp */
> > ring->wp += el_size;
> >
> > /* Update ctx wp */
> > ring->ctx_wp = ring->iommu_base + (ring->wp - ring->base);
> > ```
> >
> > This is analogous to:
> >
> > ```
> > Read PTR A;
> > Update PTR A;
> > Increment PTR A;
> > Write PTR A to PTR B;
> > ```
> 
> Interesting point, but shouldn't it be more correct to translate it as:
> 
> 1. Write PTR A to PTR B (mhi_tre);
> 2. Update PTR B DATA;
> 3. Increment PTR A;
> 4. Write PTR A to PTR C;
> 
> In that case, it looks like line 2. has no ordering constraint with 3.
> & 4? whereas the following guarantee it:
> 
> 1. Write PTR A to PTR B (mhi_tre);
> 2. Update PTR B DATA;
> 3. Increment PTR A;
> dma_wmb()
> 4. Write PTR A to PTR C;
> 
> To be honest, compiler optimization is beyond my knowledge, so I don't
> know if a specific compiler arch/version could be able to mess up the
> sequence or not. But this pattern is really close to what is described
> for dma_wmb() usage in Documentation/memory-barriers.txt. That's why I
> challenged this change and would be conservative, keeping the explicit
> barrier.
> 

Hmm. Since I was reading the memory model and going through the MHI code, I
_thought_ that this dma_wmb() is redundant. But I missed the fact that the
updating to memory pointed by "wp" happens implicitly via a pointer. So that
won't qualify as a direct dependency.

> >
> > Here, because of the data dependency due to "ring->wp", the CPU or compiler
> > won't be ordering the instructions. I think that's one of the reason we never
> > hit any issue due to this.
> 
> You may be right here about the implicit ordering guarantee... So if
> you're sure, I think it would deserve an inline comment to explain why
> we don't need a memory barrier as in the 'usual' dma descriptor update
> sequences.
> 

I think the barrier makes sense now. Sorry for the confusion and thanks for the
explanations.

Thanks,
Mani

> Loic
