Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AAF76358
	for <mhi@lists.linux.dev>; Tue, 22 Feb 2022 09:08:24 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id b8so17783183pjb.4
        for <mhi@lists.linux.dev>; Tue, 22 Feb 2022 01:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=af9x/iegOnzu5T2S6phAlZvFgtZ2vic5jnoB8poxuNA=;
        b=uttqi5ZtIkEXO03MMiUYjXfqkAjqzO0eww1Znl2a8Q06a9qnXJRIvUyNAqvDBtKB/B
         KI0ahffuMQOCgTctB2BbGp7F4Z6K9okSgtkzVo1n7avVTKNIu03MjdNRDtSEpzfhOG7U
         UllAM5Q7aAmk+9W5N8pP/hmmPRbXT1RltgGGeRmMFKp10QsvgnVeKf0lULSPbDLGZCbB
         StT+ZDFSyxtSBDvrO3iljCpcEZu1eANBCcOSxjtT3voBCrSc9dVYWk+C+vB9V6+BK507
         2ge0BE6HSNhCtLzoyPjJt8A3yKIn82B6Pd5EX5Q4xhdPjQgSn/56vKWknuK2jrYDWKzg
         u4Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=af9x/iegOnzu5T2S6phAlZvFgtZ2vic5jnoB8poxuNA=;
        b=KS3nN9FVFPtCw0GTdu7RTbhxiW8KLZVr6EEv3hcC9KtJ1fez11+ummMzbed2GLcdtG
         jXnEmZ4ZNWCLbJQ5J5jNNboGb0dmQoTmoFkjXOa6iphYyE0UOI1aYLvlxuKHCuo/+i/y
         o/89FLsvXzCHObhryJxcJDQSr+Lfp3YhQOhdHI5n6t6yJzTZgUx6wtlQTblEDd1VnY6/
         Ih4tzP4v3KLdLe6YE6Q4yi0Wi3JcNXb6bG3bn+ccrKsLZmc5NnbyyS+eHvN0Gk8t4bcR
         7kuLRBn3TjwFn1uc7Z1F1NtskfxEcbD+wy0idN16Eza7INUQU8BPErOAQvg6jwECwUUE
         fbqg==
X-Gm-Message-State: AOAM532EqQKqmiOc7kQKclf1aCTguRtdf2njHcKYMKzwIoJh7pOXNzra
	iBcnMDZC2pdbXec4/Rlorrn+
X-Google-Smtp-Source: ABdhPJzcuwVH2RJUO8mXSf6vNqztfRVbk2nH2oB8Nt+hqfXKApKQnjzMsXNWHWnhnRqK8+jaNbVd5Q==
X-Received: by 2002:a17:902:9898:b0:14f:18b7:f04a with SMTP id s24-20020a170902989800b0014f18b7f04amr22208787plp.127.1645520904007;
        Tue, 22 Feb 2022 01:08:24 -0800 (PST)
Received: from thinkpad ([117.217.186.202])
        by smtp.gmail.com with ESMTPSA id b6sm16543351pfv.5.2022.02.22.01.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 01:08:23 -0800 (PST)
Date: Tue, 22 Feb 2022 14:38:16 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Alex Elder <elder@linaro.org>
Cc: mhi@lists.linux.dev, quic_hemantk@quicinc.com, quic_bbhatt@quicinc.com,
	quic_jhugo@quicinc.com, vinod.koul@linaro.org,
	bjorn.andersson@linaro.org, dmitry.baryshkov@linaro.org,
	quic_vbadigan@quicinc.com, quic_cang@quicinc.com,
	quic_skananth@quicinc.com, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 16/25] bus: mhi: ep: Add support for powering up the
 MHI endpoint stack
Message-ID: <20220222090816.GD5029@thinkpad>
References: <20220212182117.49438-1-manivannan.sadhasivam@linaro.org>
 <20220212182117.49438-17-manivannan.sadhasivam@linaro.org>
 <10240bc5-ef9f-7555-402e-57ca2b0b0a14@linaro.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10240bc5-ef9f-7555-402e-57ca2b0b0a14@linaro.org>

On Tue, Feb 15, 2022 at 04:39:37PM -0600, Alex Elder wrote:
> On 2/12/22 12:21 PM, Manivannan Sadhasivam wrote:
> > Add support for MHI endpoint power_up that includes initializing the MMIO
> > and rings, caching the host MHI registers, and setting the MHI state to M0.
> > After registering the MHI EP controller, the stack has to be powered up
> > for usage.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> Very little to say on this one.		-Alex
> 
> > ---
> >   drivers/bus/mhi/ep/internal.h |   6 +
> >   drivers/bus/mhi/ep/main.c     | 229 ++++++++++++++++++++++++++++++++++
> >   include/linux/mhi_ep.h        |  22 ++++
> >   3 files changed, 257 insertions(+)
> > 
> > diff --git a/drivers/bus/mhi/ep/internal.h b/drivers/bus/mhi/ep/internal.h
> > index e4e8f06c2898..ee8c5974f0c0 100644
> > --- a/drivers/bus/mhi/ep/internal.h
> > +++ b/drivers/bus/mhi/ep/internal.h
> > @@ -242,4 +242,10 @@ int mhi_ep_set_m0_state(struct mhi_ep_cntrl *mhi_cntrl);
> >   int mhi_ep_set_m3_state(struct mhi_ep_cntrl *mhi_cntrl);
> >   int mhi_ep_set_ready_state(struct mhi_ep_cntrl *mhi_cntrl);
> > +/* MHI EP memory management functions */
> > +int mhi_ep_alloc_map(struct mhi_ep_cntrl *mhi_cntrl, u64 pci_addr, size_t size,
> > +		     phys_addr_t *phys_ptr, void __iomem **virt);
> > +void mhi_ep_unmap_free(struct mhi_ep_cntrl *mhi_cntrl, u64 pci_addr, phys_addr_t phys,
> > +		       void __iomem *virt, size_t size);
> > +
> >   #endif
> > diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c

[...]

> > +
> > +static void mhi_ep_enable_int(struct mhi_ep_cntrl *mhi_cntrl)
> > +{
> 
> Are channel doorbell interrupts enabled separately now?
> (There was previously an enable_chdb_interrupts() call.)
> 

Doorbell interrupts are enabled when the corresponding channel gets started.
Enabling all interrupts here triggers spurious irqs as some of the interrupts
associated with hw channels always get triggered.

Thanks,
Mani
