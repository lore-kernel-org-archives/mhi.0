Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D235F2C80
	for <mhi@lists.linux.dev>; Tue, 19 Oct 2021 16:29:30 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id t184so450182pfd.0
        for <mhi@lists.linux.dev>; Tue, 19 Oct 2021 09:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fFEh57XjcGZVMKBRwiESvTpWJiCdB5W9SosJkX+vQWA=;
        b=PDEz3QO6bizr3TeemGpmyFhZMkcbbFAno6plOYztjq61G/qJbbMmx9OUMcpCocg/IH
         n0ospFhCGFpeEx8pue3eDNfKhtC37lUIPIagl9Wduw3nU4WiM8kxdaHPJ51rH/pn2T7m
         gy6dF68XY9NFhoVBCXFihjXY9h5h2YdTKj1tkKH+8XYJhqeIy0csNKN6usIEu/U6cV1i
         v1l/Q2KuS0BV2p/XT7XZiGhGygv1FjBCqMr0fBQab1mlb2pV44hOYho8IO2/7FdoDXDo
         TCZOtkIT6AOf7sge4pArMm+IFCs9OhdJ6X69sc79tpWBpb28LRuXR09PitYj6AlXLF9s
         2+Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fFEh57XjcGZVMKBRwiESvTpWJiCdB5W9SosJkX+vQWA=;
        b=6wbcuIV9+Ls1qVPk40HakfskSi5Xa4PkUoX8kToR5x3TRYbl4hNHa4ph8HuhePk6in
         8cVMhAeIy+qAyc/060b7qBeUe/VNqT4x+xlUDC0MMotu5wExFx/RGpWOKfxofVc5DOro
         0UOUKz3MZTH9PNCpQ9a4h2H4PYBGtmJa4aw3egNlsD1QPoMnhz+bvosvnW48duiL3Cgs
         kBvDhkk2ijWwaOmiiO0k/VW6m+pvHPaLLETjAOx7SgoCpbYe9jMYIrMaXeDECGOUsH2V
         J2Oa8E6SOKl3FJenp37gNwAdQXMAGyVwNGUiDPkK5H6v9WOYeLuK3NnTkMSuNKgIEKvJ
         ILFQ==
X-Gm-Message-State: AOAM533X9yfy8NBdn8YKqhN/K8I/uOa16UMt8BhzqSIF2tGwolR4J4qD
	0ZsclFCH8yb/nnqQQ1COaGXW
X-Google-Smtp-Source: ABdhPJxg1UV9ay1tnqW4qYoObXmuV5HDK5RsbsdNduyr70lGkjBTQUW/8sVpeoD3DwtkpUdBRULl+Q==
X-Received: by 2002:a05:6a00:1484:b0:44c:de7f:30 with SMTP id v4-20020a056a00148400b0044cde7f0030mr757072pfu.62.1634660970206;
        Tue, 19 Oct 2021 09:29:30 -0700 (PDT)
Received: from thinkpad ([2409:4072:6e0a:4e8d:17f:7a74:8180:8fca])
        by smtp.gmail.com with ESMTPSA id x13sm15808132pge.37.2021.10.19.09.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 09:29:29 -0700 (PDT)
Date: Tue, 19 Oct 2021 21:59:23 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: mhi@lists.linux.dev, loic.poulain@linaro.org, hemantk@codeaurora.org,
	bbhatt@codeaurora.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] bus: mhi: Add mhi_prepare_for_transfer_autoqueue API for
 DL auto queue
Message-ID: <20211019162923.GA189099@thinkpad>
References: <20211019134451.174318-1-manivannan.sadhasivam@linaro.org>
 <20211019074918.5b498937@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211019074918.5b498937@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>

On Tue, Oct 19, 2021 at 07:49:18AM -0700, Jakub Kicinski wrote:
> On Tue, 19 Oct 2021 19:14:51 +0530 Manivannan Sadhasivam wrote:
> > Add a new API "mhi_prepare_for_transfer_autoqueue" for using with client
> > drivers like QRTR to request MHI core to autoqueue buffers for the DL
> > channel along with starting both UL and DL channels.
> > 
> > So far, the "auto_queue" flag specified by the controller drivers in
> > channel definition served this purpose but this will be removed at some
> > point in future.
> > 
> > Cc: netdev@vger.kernel.org
> > Co-developed-by: Loic Poulain <loic.poulain@linaro.org>
> > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> > 
> > Dave, Jakub: This patch should go through MHI tree. But since the QRTR driver
> > is also modified, this needs an Ack from you.
> 
> CCing us wouldn't hurt.
> 

Okay.

> Speaking of people who aren't CCed I've seen Greg nack the flags
> argument.
> 

I usually send patches to Greg during the PR time as MHI patches goes through
char-misc tree. I don't include him during the patch reviews.

And yes, Greg indeed NACK the API that had flags argument. But this one didn't.

Thanks,
Mani

> SMH
