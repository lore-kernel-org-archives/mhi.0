Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01802625
	for <mhi@lists.linux.dev>; Tue, 22 Feb 2022 06:06:31 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id gf13-20020a17090ac7cd00b001bbfb9d760eso1368546pjb.2
        for <mhi@lists.linux.dev>; Mon, 21 Feb 2022 22:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qgHTWYmGSpSQewssga0wRsMEIRFp9xeMp+WIkFk7p5A=;
        b=nMfJb0FTo0WK1hPaiPc6ulx2U5XLhgf6QXbUiC/UwK+BnIYEeyE5ywWITJj3THcNcd
         Ule/6v2avPFqd4e4MoDxoUwmjtFOS0kkHtxSOyKgrl1Utg5rZ/mz+CRB4F4Ndy9uPLQh
         3K4tKqrfwkuqKKt26VjRgR2r1GTwiXvqcS7Q1eG9AjND+rN0LswAMzuaBgfTe7djm6n9
         KkQg/O9lFxfI9uyrpUKIzY475uqyxYdBETuvsu/A7hkR3G8Rbf5lJNGJERa4FZZpEVH+
         ykhXRlZA/xeSgh2BpzgcK+IfFfBrwfN8QahenGPLEWF4jP/toTjZdJHwchwLfRxGfBEM
         H3dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qgHTWYmGSpSQewssga0wRsMEIRFp9xeMp+WIkFk7p5A=;
        b=X11rGXz1FTO4P8nwNJfDEsemJ1Lm7itRx/vV6O2yo58XYZaPgnoxyF8EdoEoEnye1u
         cO8+l/l9R/1kQ0O3U0YQJhfqBETa4/wVX/rpS13bPnT0HmN7J7Ql7g2xXYzxzwdoB9dH
         vJXYIez+NPPFzeTWOYtGjyrySlGovX37a3IpCjrblFaXp3SbxYB7YLcDPPQoIPbfB6by
         W9wtQxACbfBdN9wsNZe9cgFMsHK8h8eHNcn9RaAq3tPFVorwUtaPCJapL9rZnQH4vPlv
         k5vg3U9eYJ+05gvkqUneSFSOoP7R8UfdjHYjZEcu0kidAk+U6DSwRZeU6Ge96IrlQyRM
         dBfg==
X-Gm-Message-State: AOAM530fRIcMam2enX8lVwfmNUkMYLWage3gHIc1r6/KRYFVXr2KXKDm
	hiXcgo4kkPIzBZJ3QzqYWw0iLTgXh6aPu0U=
X-Google-Smtp-Source: ABdhPJz4P4fmg8n8s9VjF3Evdup+GYQ2pd94Qpr1uLHIF36Jzk2LaJFZSmO+9IR63s55ftOqRh8NFg==
X-Received: by 2002:a17:902:8f8b:b0:149:6639:4b86 with SMTP id z11-20020a1709028f8b00b0014966394b86mr22081150plo.60.1645509991315;
        Mon, 21 Feb 2022 22:06:31 -0800 (PST)
Received: from thinkpad ([117.217.186.202])
        by smtp.gmail.com with ESMTPSA id g21-20020a17090a7d1500b001b968e82819sm1197687pjl.10.2022.02.21.22.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 22:06:30 -0800 (PST)
Date: Tue, 22 Feb 2022 11:36:23 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Alex Elder <elder@linaro.org>
Cc: mhi@lists.linux.dev, quic_hemantk@quicinc.com, quic_bbhatt@quicinc.com,
	quic_jhugo@quicinc.com, vinod.koul@linaro.org,
	bjorn.andersson@linaro.org, dmitry.baryshkov@linaro.org,
	quic_vbadigan@quicinc.com, quic_cang@quicinc.com,
	quic_skananth@quicinc.com, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 13/25] bus: mhi: ep: Add support for sending events to
 the host
Message-ID: <20220222060623.GA5029@thinkpad>
References: <20220212182117.49438-1-manivannan.sadhasivam@linaro.org>
 <20220212182117.49438-14-manivannan.sadhasivam@linaro.org>
 <3396cc98-8640-8f5a-fad3-c7a913faaa58@linaro.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3396cc98-8640-8f5a-fad3-c7a913faaa58@linaro.org>

On Tue, Feb 15, 2022 at 04:39:17PM -0600, Alex Elder wrote:
> On 2/12/22 12:21 PM, Manivannan Sadhasivam wrote:
> > Add support for sending the events to the host over MHI bus from the
> > endpoint. Following events are supported:
> > 
> > 1. Transfer completion event
> > 2. Command completion event
> > 3. State change event
> > 4. Execution Environment (EE) change event
> > 
> > An event is sent whenever an operation has been completed in the MHI EP
> > device. Event is sent using the MHI event ring and additionally the host
> > is notified using an IRQ if required.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> A few things can be simplified here.
> 
> 					-Alex
> 
> > ---
> >   drivers/bus/mhi/common.h      |  15 ++++
> >   drivers/bus/mhi/ep/internal.h |   8 ++-
> >   drivers/bus/mhi/ep/main.c     | 126 ++++++++++++++++++++++++++++++++++
> >   include/linux/mhi_ep.h        |   8 +++
> >   4 files changed, 155 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/bus/mhi/common.h b/drivers/bus/mhi/common.h
> > index 728c82928d8d..26d94ed52b34 100644
> > --- a/drivers/bus/mhi/common.h
> > +++ b/drivers/bus/mhi/common.h
> > @@ -176,6 +176,21 @@
> >   #define MHI_TRE_GET_EV_LINKSPEED(tre)			((MHI_TRE_GET_DWORD(tre, 1) >> 24) & 0xFF)
> >   #define MHI_TRE_GET_EV_LINKWIDTH(tre)			(MHI_TRE_GET_DWORD(tre, 0) & 0xFF)
> > +/* State change event */
> > +#define MHI_SC_EV_PTR					0
> > +#define MHI_SC_EV_DWORD0(state)				cpu_to_le32(state << 24)
> > +#define MHI_SC_EV_DWORD1(type)				cpu_to_le32(type << 16)
> > +
> > +/* EE event */
> > +#define MHI_EE_EV_PTR					0
> > +#define MHI_EE_EV_DWORD0(ee)				cpu_to_le32(ee << 24)
> > +#define MHI_EE_EV_DWORD1(type)				cpu_to_le32(type << 16)
> > +
> > +/* Command Completion event */
> > +#define MHI_CC_EV_PTR(ptr)				cpu_to_le64(ptr)
> > +#define MHI_CC_EV_DWORD0(code)				cpu_to_le32(code << 24)
> > +#define MHI_CC_EV_DWORD1(type)				cpu_to_le32(type << 16)
> > +
> >   /* Transfer descriptor macros */
> >   #define MHI_TRE_DATA_PTR(ptr)				cpu_to_le64(ptr)
> >   #define MHI_TRE_DATA_DWORD0(len)			cpu_to_le32(len & MHI_MAX_MTU)
> > diff --git a/drivers/bus/mhi/ep/internal.h b/drivers/bus/mhi/ep/internal.h
> > index 48d6e9667d55..fd63f79c6aec 100644
> > --- a/drivers/bus/mhi/ep/internal.h
> > +++ b/drivers/bus/mhi/ep/internal.h
> > @@ -131,8 +131,8 @@ enum mhi_ep_ring_type {
> >   };
> >   struct mhi_ep_ring_element {
> > -	u64 ptr;
> > -	u32 dword[2];
> > +	__le64 ptr;
> > +	__le32 dword[2];
> 
> Yay!
> 
> >   };
> >   /* Ring element */
> > @@ -227,4 +227,8 @@ void mhi_ep_mmio_get_mhi_state(struct mhi_ep_cntrl *mhi_cntrl, enum mhi_state *s
> >   void mhi_ep_mmio_init(struct mhi_ep_cntrl *mhi_cntrl);
> >   void mhi_ep_mmio_update_ner(struct mhi_ep_cntrl *mhi_cntrl);
> > +/* MHI EP core functions */
> > +int mhi_ep_send_state_change_event(struct mhi_ep_cntrl *mhi_cntrl, enum mhi_state state);
> > +int mhi_ep_send_ee_event(struct mhi_ep_cntrl *mhi_cntrl, enum mhi_ep_execenv exec_env);
> > +
> >   #endif
> > diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
> > index 2c8045766292..61f066c6286b 100644
> > --- a/drivers/bus/mhi/ep/main.c
> > +++ b/drivers/bus/mhi/ep/main.c

[...]

> > +static int mhi_ep_send_completion_event(struct mhi_ep_cntrl *mhi_cntrl,
> > +					struct mhi_ep_ring *ring, u32 len,
> > +					enum mhi_ev_ccs code)
> > +{
> > +	struct mhi_ep_ring_element event = {};
> > +	__le32 tmp;
> > +
> > +	event.ptr = le64_to_cpu(ring->ring_ctx->generic.rbase) +
> > +			ring->rd_offset * sizeof(struct mhi_ep_ring_element);
> 
> I'm not sure at the moment where this will be called.  But
> it might be easier to pass in the transfer channel pointer
> rather than compute its address here.
> 

Passing the ring element to these functions won't help. Because, the ring
element only has the address of the buffer it points to. But what we need here
is the address of the ring element itself and that can only be found in ring
context.

Thanks,
Mani
