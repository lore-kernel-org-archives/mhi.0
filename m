Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0FDE747B
	for <mhi@lists.linux.dev>; Mon, 26 Jun 2023 11:46:41 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-3f9bdb01ec0so39275715e9.2
        for <mhi@lists.linux.dev>; Mon, 26 Jun 2023 04:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687780000; x=1690372000;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8uLRq7795u4+vU/HBiNzObZsPTqHBcq4PBCGfIyiv8U=;
        b=tfenV3K/5msWzUWIJDSY0OWhthXuDD3ucDJAjhgFk0dR+QhiGUeDxYgKxmgxYaldI9
         o4b32YKaZ40pFe6w6XBfOz9qF5oFP9Qcu+yvjxCdKH50ZBrODL1jcuWUnKGF6VOaW9ON
         uDCc4/2ZhSQAlVDHx0/jqkIdm3xGlE8h6cKoUMloFmwbICvo9/hMw2zTwy4NmoZXPEpV
         0TPVIpFmHOxwgR18a4d9ggAreHiCxAMRKZJteekdudKdgilHhS5hvVlPqQxX9oCFNzvN
         84SOjJDzPr7y6EC962FNUpm9y0ksFAAMgji5AO3UO8pWcM2s7jd8V5p6HAwoQspNzgb6
         OYQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687780000; x=1690372000;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8uLRq7795u4+vU/HBiNzObZsPTqHBcq4PBCGfIyiv8U=;
        b=DXVUtRTNnf2vzylSWtvouXGEdaXt635jI+o07NS4IL8RX3Rwcdsam++ov6L1mdL5Vz
         CegJWXRN14nCZrbZQD8F5McIB5sckYW1yLVKG/tBzBEmYLfVvMuxh++g2yjQfMx9m2QK
         lo+4msOXJeSmoBnL+IJm4iNZW7XToXWnXUfCorrDtM0QO1WR19wypIJI8983mKRPC9iq
         MMXbMOPUeSckz2O0oxGmOUxvG4kS+AemvJnwufQgL7q1NtT3PtZv8I8ZfDdutK3NoktI
         IAP0a0AHZjkkAbbB4QaRLCM1LI35jpcRYLrg4kO2Vf1YPpEVv8p18Ac5cv64+w5tAYAt
         kcaw==
X-Gm-Message-State: AC+VfDxBOFZzmT97YY8e4xu7KWi9R5DiNyqspU/ddrzYgBNNQltQ4Dqf
	KsFfwiuglrwUcRbMcR6evPLsRw==
X-Google-Smtp-Source: ACHHUZ7WNyF3ul5N2txN+WskY9mQAIhRpA72QramL2D9DR0QWsJ4McpAL8WrYx1uZQVXdo3iQz4lgQ==
X-Received: by 2002:a05:600c:2152:b0:3f9:a6f3:8a53 with SMTP id v18-20020a05600c215200b003f9a6f38a53mr18239381wml.20.1687779999962;
        Mon, 26 Jun 2023 04:46:39 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id h15-20020a05600004cf00b0030e52d4c1bcsm7221461wri.71.2023.06.26.04.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 04:46:38 -0700 (PDT)
Date: Mon, 26 Jun 2023 14:46:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: Julia Lawall <Julia.Lawall@inria.fr>,
	Manivannan Sadhasivam <mani@kernel.org>, keescook@chromium.org,
	kernel-janitors@vger.kernel.org, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/26] bus: mhi: host: use array_size
Message-ID: <aaa1bf4b-c546-402f-8ad2-667fd35caa74@kadam.mountain>
References: <20230623211457.102544-1-Julia.Lawall@inria.fr>
 <20230623211457.102544-11-Julia.Lawall@inria.fr>
 <3b4ff79b-93b4-cf56-1488-113905b3981d@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3b4ff79b-93b4-cf56-1488-113905b3981d@quicinc.com>

On Fri, Jun 23, 2023 at 03:30:36PM -0600, Jeffrey Hugo wrote:
> On 6/23/2023 3:14 PM, Julia Lawall wrote:
> > Use array_size to protect against multiplication overflows.
> > 
> > The changes were done using the following Coccinelle semantic patch:
> > 
> > // <smpl>
> > @@
> >      expression E1, E2;
> >      constant C1, C2;
> >      identifier alloc = {vmalloc,vzalloc};
> > @@
> > (
> >        alloc(C1 * C2,...)
> > |
> >        alloc(
> > -           (E1) * (E2)
> > +           array_size(E1, E2)
> >        ,...)
> > )
> > // </smpl>
> > 
> > Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> > 
> > ---
> >   drivers/bus/mhi/host/init.c |    4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
> > index f72fcb66f408..34a543a67068 100644
> > --- a/drivers/bus/mhi/host/init.c
> > +++ b/drivers/bus/mhi/host/init.c
> > @@ -759,8 +759,8 @@ static int parse_ch_cfg(struct mhi_controller *mhi_cntrl,
> >   	 * so to avoid any memory possible allocation failures, vzalloc is
> >   	 * used here
> >   	 */
> > -	mhi_cntrl->mhi_chan = vzalloc(mhi_cntrl->max_chan *
> > -				      sizeof(*mhi_cntrl->mhi_chan));
> > +	mhi_cntrl->mhi_chan = vzalloc(array_size(mhi_cntrl->max_chan,
> > +				      sizeof(*mhi_cntrl->mhi_chan)));
> >   	if (!mhi_cntrl->mhi_chan)
> >   		return -ENOMEM;
> > 
> > 
> 
> This doesn't seem like a good fix.
> 
> If we've overflowed the multiplication, I don't think we should continue,
> and the function should return an error.  array_size() is going to return
> SIZE_MAX, and it looks like it is possible that vzalloc() may be able to
> allocate that successfully in some scenarios.

Nope.  You can never allocate more that size_t because that's the
highest number that the kernel allocation functions can accept.

Obviously on 64bit size_t is unbelievably large.  If I remember right,
on 32bit you didn't used to be able to allocate more than 2GB without
doing all sorts of tricks.  And everyone deleted those tricks when 64bit
machines became super common.

regards,
dan carpenter

