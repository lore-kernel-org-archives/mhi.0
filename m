Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C094684
	for <mhi@lists.linux.dev>; Mon,  9 May 2022 06:47:41 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id 7so11214959pga.12
        for <mhi@lists.linux.dev>; Sun, 08 May 2022 23:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9+O2wWIYtSN6v7D3S7HE43AVtnFz4Fs9gpTHjGdIAXw=;
        b=CUJD3MGxQAYTxanRS7RRy74vpVXIeCRYmEdhWDRMPZvHt5RsJQJ9hSjWBYftdA6WYo
         XHgX/WXibp+3rMcavpaO63pgoqCAtpvnI4pSinQ1hQw9iEDB12co5iR8TDckzT+1Ir2i
         MdEOUh7N3Ufhy0Se3m+kBvF4a8A8ZvYTP68yMvOd4u5+1XNJlAYcpY3CTQFZMzB6NlN0
         onh14jDg3iHYft88hVA5HzlZkvVxYt6j1pFXj92Cjxlx8/Tk47p/dF3Hhb2tCc2Dvupv
         KOL0wWCFFCleYu0k6KRIqYb2uFHl1YvedkWiWbb2Nr2Uy5fJClzoLSSfg5KC5R8QFdbx
         M2Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9+O2wWIYtSN6v7D3S7HE43AVtnFz4Fs9gpTHjGdIAXw=;
        b=WvU1qRptK+iONzdmLB1abQ7tZBEPIqC5FfSD8oaRjQVulaFaAnoUQPOsFiJG2j6ZMp
         YrFXKGVVqllD3mD4GAuXKY0Q0Y4opl+bzYAbYZ9rjymCs9BCERh3ccmO9WOEer3lX+u3
         hioIGQs4DArIyXExQpZQEs0zcWUYTSOyY0Ibc/S80K/9UMjlq41zBgJQOEVIchW7YxB3
         ngPLE3WM+C+cf3jbQ3VwWHnb8Mrn2SNddylH4U9j7Oe3aJQIJl3jIWsdLXqeIzOP2V58
         gqYOYodaXopHwuSVmC8j2+PPdQUplDDsZBO7EbfkMx02L+DE5/z7VHe7G888+SyxcXKe
         kmQQ==
X-Gm-Message-State: AOAM5320Q9cQbwOjeH69NzAg6nuEGV93+QubfWJdVzlAN3YVfZHAEMWA
	4MmzEYLbt+6CRqWXU43gqbAUJkzZ8gPTIPQxRP3z/w==
X-Google-Smtp-Source: ABdhPJzeywHjNPgQ2e8+81H3HxjJ5160+Mo9DrU73UpmHrLc0o39xzUzzFM8Zj7+8U49t8aaXxSFYLrk6xvGEzi9l8g=
X-Received: by 2002:a63:f4e:0:b0:382:1e31:79e8 with SMTP id
 14-20020a630f4e000000b003821e3179e8mr12395833pgp.167.1652078860816; Sun, 08
 May 2022 23:47:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220502104144.91806-1-manivannan.sadhasivam@linaro.org>
 <20220502104144.91806-6-manivannan.sadhasivam@linaro.org> <CAMZdPi_i60TqszUL+=ocMn-4veyoGRQoOGD_B4YiEpz_uWE+ZQ@mail.gmail.com>
 <20220504081720.GB5446@thinkpad> <CAMZdPi9oA4SSYGSPw9tCmQ=GhwhCgdYz+=rQiUzu1tNbo80ceQ@mail.gmail.com>
 <20220504155855.GA3507@thinkpad> <514326aa-49eb-2b07-b99e-53899722c7e2@quicinc.com>
 <c9ac9fbf-d94e-feea-e762-95eeae8f5a74@quicinc.com>
In-Reply-To: <c9ac9fbf-d94e-feea-e762-95eeae8f5a74@quicinc.com>
From: Loic Poulain <loic.poulain@linaro.org>
Date: Mon, 9 May 2022 08:47:06 +0200
Message-ID: <CAMZdPi_NwN_y7AQMu47NoFDFtgxoV8TPdRdxqm5+GmT0uUZh+g@mail.gmail.com>
Subject: Re: [PATCH 5/5] bus: mhi: host: Remove redundant dma_wmb() before ctx
 wp update
To: Hemant Kumar <quic_hemantk@quicinc.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_bbhatt@quicinc.com
Content-Type: text/plain; charset="UTF-8"

Hi Hemant,

On Fri, 6 May 2022 at 20:02, Hemant Kumar <quic_hemantk@quicinc.com> wrote:
>
> Hi Loic,
>
> On 5/6/2022 10:41 AM, Hemant Kumar wrote:
> > Hi Loic,
> >
> > On 5/4/2022 8:58 AM, Manivannan Sadhasivam wrote:
> >> On Wed, May 04, 2022 at 11:25:33AM +0200, Loic Poulain wrote:
> >>> On Wed, 4 May 2022 at 10:17, Manivannan Sadhasivam
> >>> <manivannan.sadhasivam@linaro.org>  wrote:
> >>>> Hi Loic,
> >>>>
> >>>> On Wed, May 04, 2022 at 09:21:20AM +0200, Loic Poulain wrote:
> >>>>> Hi Mani,
> >>>>>
> >>>>> On Mon, 2 May 2022 at 12:42, Manivannan Sadhasivam
> >>>>> <manivannan.sadhasivam@linaro.org>  wrote:
> >>>>>> The endpoint device will only read the context wp when the host rings
> >>>>>> the doorbell.
> >>>>> Are we sure about this statement? what if we update ctxt_wp while the
> >>>>> device is still processing the previous ring? is it going to continue
> >>>>> processing the new ctxt_wp or wait for a new doorbell interrupt? what
> >>>>> about burst mode in which we don't ring at all (ring_db is no-op)?
> >>>>>
> >>>> Good point. I think my statement was misleading. But still this scenario won't
> >>>> happen as per my undestanding. Please see below.
> >>>>
> >>>>>> And moreover the doorbell write is using writel(). This
> >>>>>> guarantess that the prior writes will be completed before ringing
> >>>>>> doorbell.
> >>>>> Yes but the barrier is to ensure that descriptor/ring content is
> >>>>> updated before we actually pass it to device ownership, it's not about
> >>>>> ordering with the doorbell write, but the memory coherent ones.
> >>>>>
> >>>> I see a clear data dependency between writing the ring element and updating the
> >>>> context pointer. For instance,
> >>>>
> >>>> ```
> >>>> struct mhi_ring_element *mhi_tre;
> >>>>
> >>>> mhi_tre = ring->wp;
> >>>> /* Populate mhi_tre */
> >>>> ...
> >>>>
> >>>> /* Increment wp */
> >>>> ring->wp += el_size;
> >>>>
> >>>> /* Update ctx wp */
> >>>> ring->ctx_wp = ring->iommu_base + (ring->wp - ring->base);
> >>>> ```
> >>>>
> >>>> This is analogous to:
> >>>>
> >>>> ```
> >>>> Read PTR A;
> >>>> Update PTR A;
> >>>> Increment PTR A;
> >>>> Write PTR A to PTR B;
> >>>> ```
> >>> Interesting point, but shouldn't it be more correct to translate it as:
> >>>
> >>> 1. Write PTR A to PTR B (mhi_tre);
> >>> 2. Update PTR B DATA;
> >>> 3. Increment PTR A;
> >>> 4. Write PTR A to PTR C;
> >>>
> >>> In that case, it looks like line 2. has no ordering constraint with 3.
> >>> & 4? whereas the following guarantee it:
> >>>
> >>> 1. Write PTR A to PTR B (mhi_tre);
> >>> 2. Update PTR B DATA;
> >>> 3. Increment PTR A;
> >>> dma_wmb()
> >>> 4. Write PTR A to PTR C;
> >>>
> >>> To be honest, compiler optimization is beyond my knowledge, so I don't
> >>> know if a specific compiler arch/version could be able to mess up the
> >>> sequence or not. But this pattern is really close to what is described
> >>> for dma_wmb() usage in Documentation/memory-barriers.txt. That's why I
> >>> challenged this change and would be conservative, keeping the explicit
> >>> barrier.
> >>>
> >> Hmm. Since I was reading the memory model and going through the MHI code, I
> >> _thought_ that this dma_wmb() is redundant. But I missed the fact that the
> >> updating to memory pointed by "wp" happens implicitly via a pointer. So that
> >> won't qualify as a direct dependency.
> >>
> >>>> Here, because of the data dependency due to "ring->wp", the CPU or compiler
> >>>> won't be ordering the instructions. I think that's one of the reason we never
> >>>> hit any issue due to this.
> >>> You may be right here about the implicit ordering guarantee... So if
> >>> you're sure, I think it would deserve an inline comment to explain why
> >>> we don't need a memory barrier as in the 'usual' dma descriptor update
> >>> sequences.
> >>>
> >> I think the barrier makes sense now. Sorry for the confusion and thanks for the
> >> explanations.
> >>
> >> Thanks,
> >> Mani
> >>
> >>> Loic
> >
> > You made a good point. After following your conversation, in case of
> > burst mode is enabled and currently
> >
> > we are in polling mode, does it make sense to move dma_wmb after
> > updating channel WP context ?
> >
> > DB ring is going to get skipped when we are in pilling mode.
> >
> > instead of dma_wmb();
> > *ring->ctxt_wp  =  cpu_to_le64(db);
> >
> > *ring->ctxt_wp  =  cpu_to_le64(db); dma_wmb();
> >
> > Thanks,
> > Hemant
> >
> i think i spoke too fast. I think we dont need to worry about the
> polling mode as the context_wp update would happen at some point of time
> and that does not require dma_wmb after update context wp.

Exactly. It's also important to remember that a barrier only ensures
operations ordering and not committing.

Regards,
Loic
