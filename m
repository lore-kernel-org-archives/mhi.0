Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BA62F24
	for <mhi@lists.linux.dev>; Thu,  3 Feb 2022 10:34:51 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id 133so1984107pgb.0
        for <mhi@lists.linux.dev>; Thu, 03 Feb 2022 02:34:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YUz06pZnKz52lqRpYNAE/X72JjI+Vf6k4/BCrzBH3FU=;
        b=UiyejmSz8yF32Lluhet7PwBZMrAziRCNepEXHIRQlOebPKYaQ8xt4lol4zyxxQHa/Q
         CNWjJSte15D181ytzgj3PLcj5+ELoliMZD89UtGx38yFcahG0MiDDJA1doOLInEAr8ah
         LsRKIOE+IfpQfIHa+RxnrPufXugbm5olIQbixPUcEQX7WZtpSoYxj73GznqwAW+gNCdc
         Dd2IVudc1Nzg56St5hqWcSKMmDMGlEyuZgxCHwqAeA+4sxNcuS+sftySZMFJraqZCuOC
         8ruvRCgfz9JW22ScJNYrirO4KHyEi988ltI9VsZdp6UdpD62mZ9QRBjiHNawA3Gh65Uf
         xQBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YUz06pZnKz52lqRpYNAE/X72JjI+Vf6k4/BCrzBH3FU=;
        b=xA5taPOzfujHzZ43vu/5izkLsJkO1f6KJthGYw9uD/xCt8G2JLaM3nob1CdntpSjSV
         91bFZGmPC4LT7lEnaClQ7WCuexjUKZnLEH1CecC4Tlop9XVeentQy5MjDc3ew34e8sWK
         7B3iJS377kyHMT3sdGOgiRSZEJeRcpmpuF8mUZBkWnddYGOjEqsstS+8hRBe73ctX4+x
         r3iqBP6kDc3Wmp5HeNba7ooFymTVi7sKNg03Lw4lKFzVY9a/UmN8DyhjJW7SHZ3wO54l
         nWpcwxCrtRtDJmw7U0jAIUg13miIbnyBGLmJFzQKYFV1izIpCYo/6J8Or3FNgOzJeezF
         V2sQ==
X-Gm-Message-State: AOAM530gXz2hTcxpd/d+hVKyU1YRY/xmPy4kQNdXi8aHkls+4iVkWaJ2
	zsX13UCq9OLXK9j+DLuyTzhE
X-Google-Smtp-Source: ABdhPJzrwgJPFeeQitXNGNkm/WAGb5B3nYHnSFQ8Z1cdKI47rjuG824pm5t6p2DPKTjVrvwLezE0Fw==
X-Received: by 2002:a63:5460:: with SMTP id e32mr27756006pgm.330.1643884490874;
        Thu, 03 Feb 2022 02:34:50 -0800 (PST)
Received: from thinkpad ([117.217.179.179])
        by smtp.gmail.com with ESMTPSA id m21sm29694312pfk.26.2022.02.03.02.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 02:34:50 -0800 (PST)
Date: Thu, 3 Feb 2022 16:04:44 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Alex Elder <elder@ieee.org>
Cc: mhi@lists.linux.dev, hemantk@codeaurora.org, bbhatt@codeaurora.org,
	quic_jhugo@quicinc.com, vinod.koul@linaro.org,
	bjorn.andersson@linaro.org, dmitry.baryshkov@linaro.org,
	skananth@codeaurora.org, vpernami@codeaurora.org,
	vbadigan@codeaurora.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/20] bus: mhi: Make mhi_state_str[] array static const
 and move to common.h
Message-ID: <20220203103444.GB6298@thinkpad>
References: <20211202113553.238011-1-manivannan.sadhasivam@linaro.org>
 <20211202113553.238011-4-manivannan.sadhasivam@linaro.org>
 <0d850b27-5684-2ecf-fc96-3258c0462d3d@ieee.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d850b27-5684-2ecf-fc96-3258c0462d3d@ieee.org>

On Wed, Jan 05, 2022 at 06:22:59PM -0600, Alex Elder wrote:
> On 12/2/21 5:35 AM, Manivannan Sadhasivam wrote:
> > mhi_state_str[] array could be used by MHI endpoint stack also. So let's
> > make the array as "static const" and move it inside the "common.h" header
> > so that the endpoint stack could also make use of it. Otherwise, the
> > structure definition should be present in both host and endpoint stack and
> > that'll result in duplication.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> This result in common source code (which is good), but it will be
> duplicated in everything that includes this file.
> 
> Do you have no common code, available to both the endpoint and host?
> You could (in drivers/bus/mhi/common.c, for example).
> 
> If you don't, I have a different suggestion, below.  It does
> basically the same thing you're doing here, but I much prefer
> duplicating an inline function than a data structure.
> 
> > ---
> >   drivers/bus/mhi/common.h    | 13 ++++++++++++-
> >   drivers/bus/mhi/host/init.c | 12 ------------
> >   2 files changed, 12 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/bus/mhi/common.h b/drivers/bus/mhi/common.h
> > index 0f4f3b9f3027..2ea438205617 100644
> > --- a/drivers/bus/mhi/common.h
> > +++ b/drivers/bus/mhi/common.h
> > @@ -174,7 +174,18 @@ struct mhi_cmd_ctxt {
> >   	__u64 wp __packed __aligned(4);
> >   };
> > -extern const char * const mhi_state_str[MHI_STATE_MAX];
> > +static const char * const mhi_state_str[MHI_STATE_MAX] = {
> > +	[MHI_STATE_RESET] = "RESET",
> > +	[MHI_STATE_READY] = "READY",
> > +	[MHI_STATE_M0] = "M0",
> > +	[MHI_STATE_M1] = "M1",
> > +	[MHI_STATE_M2] = "M2",
> > +	[MHI_STATE_M3] = "M3",
> > +	[MHI_STATE_M3_FAST] = "M3 FAST",
> > +	[MHI_STATE_BHI] = "BHI",
> > +	[MHI_STATE_SYS_ERR] = "SYS ERROR",
> > +};
> > +
> >   #define TO_MHI_STATE_STR(state) ((state >= MHI_STATE_MAX || \
> >   				  !mhi_state_str[state]) ? \
> >   				"INVALID_STATE" : mhi_state_str[state])
> 
> You could easily and safely define this as an inline function instead.
> 

Sounds good!

> #define MHI_STATE_CASE(x)	case MHI_STATE_ ## x: return #x
> static inline const char *mhi_state_string(enum mhi_state state)
> {
> 	switch(state) {
> 	MHI_STATE_CASE(RESET);
> 	MHI_STATE_CASE(READY);
> 	MHI_STATE_CASE(M0);
> 	MHI_STATE_CASE(M1);
> 	MHI_STATE_CASE(M2);
> 	MHI_STATE_CASE(M3_FAST);
> 	MHI_STATE_CASE(BHI);
> 	MHI_STATE_CASE(SYS_ERR);
> 	default: return "(unrecognized MHI state)";
> 	}
> }
> #undef MHI_STATE_CASE

I've used the below one:

static inline const char * const mhi_state_str(enum mhi_state state)
{
        switch(state) {
        case MHI_STATE_RESET:
                return "RESET";
        case MHI_STATE_READY:
                return "READY";
        case MHI_STATE_M0:
                return "M0";
        case MHI_STATE_M1:
                return "M1";
        case MHI_STATE_M2:
                return"M2";
        case MHI_STATE_M3:
                return"M3";
        case MHI_STATE_M3_FAST:
                return"M3 FAST";
        case MHI_STATE_BHI:
                return"BHI";
        case MHI_STATE_SYS_ERR:
                return "SYS ERROR";
        default:
                return "Unknown state";
        }
};

Thanks,
Mani

> 
> 					-Alex
> 
> > diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
> > index 5aaca6d0f52b..fa904e7468d8 100644
> > --- a/drivers/bus/mhi/host/init.c
> > +++ b/drivers/bus/mhi/host/init.c
> > @@ -44,18 +44,6 @@ const char * const dev_state_tran_str[DEV_ST_TRANSITION_MAX] = {
> >   	[DEV_ST_TRANSITION_DISABLE] = "DISABLE",
> >   };
> > -const char * const mhi_state_str[MHI_STATE_MAX] = {
> > -	[MHI_STATE_RESET] = "RESET",
> > -	[MHI_STATE_READY] = "READY",
> > -	[MHI_STATE_M0] = "M0",
> > -	[MHI_STATE_M1] = "M1",
> > -	[MHI_STATE_M2] = "M2",
> > -	[MHI_STATE_M3] = "M3",
> > -	[MHI_STATE_M3_FAST] = "M3 FAST",
> > -	[MHI_STATE_BHI] = "BHI",
> > -	[MHI_STATE_SYS_ERR] = "SYS ERROR",
> > -};
> > -
> >   const char * const mhi_ch_state_type_str[MHI_CH_STATE_TYPE_MAX] = {
> >   	[MHI_CH_STATE_TYPE_RESET] = "RESET",
> >   	[MHI_CH_STATE_TYPE_STOP] = "STOP",
> > 
> 
