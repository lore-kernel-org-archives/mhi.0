Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D642C88
	for <mhi@lists.linux.dev>; Tue, 19 Oct 2021 13:26:17 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id np13so14709367pjb.4
        for <mhi@lists.linux.dev>; Tue, 19 Oct 2021 06:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=or8Ipmp1IuPITyJB/TiRcaMpJVnR5kcP60YFXBqqS1I=;
        b=cu6g7VaBRgn01oP0CdKLJmYNPxNd3Kgi5L/EcqgU37OBmWA6eLNW6m+Hv2oFmpDtEI
         QzJip+Zu7fpPjUg0tXw6yDHZR17UqSfXF/VjmfkKwnqSuTcxjk0RPYAAnR/6Hi+PR+7+
         tQQhIBBQ2J361Hnz9a34IoNxzNymtOBG+reymAWl5Etqw9xkykMNIz4Pze26IiYw0XZJ
         mhA+HLRXSBP3POw44j0ljWh1dTo1wZq++P1MxrOIj0m66pOvQxnb4g5JhYLqj7d17A2y
         McT1ftuwiGB4jzdSxCkafEB4uR4d6KC5GOdarnP7MmgJg88hxgcRadJdHvwAM5NULrwt
         TGng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=or8Ipmp1IuPITyJB/TiRcaMpJVnR5kcP60YFXBqqS1I=;
        b=15Fu4rv/s/pzGYVf9gmRvWKafCFywyXH3EhoYWV5YyAYEqaZws8TnwLndxqctyW/4Q
         c6F45URNiw3OZaesdUblhkvbgYGWNvl2hqzdfN5WYcvwBhkZnj7iCETyFdesv04qzwEF
         tn9ieeUPZXzb3N7oTlSJAA5LVOpeS6kKdjR3dnEDXjjuMrvYZ6Oj+tGVGfuxwqZSvjwL
         8rsdxpqiSSyV//BQCYzjnemf0kxfYVnMbpwHvYHT4YWa+cIUKhWQfsB6SdijwRtUG0Vf
         QlHxf+1MgRlrUXd3GSglzgTy2fUZoSC2UfssombMVBHuo5hze+djKpLuraCit0Jv6gH7
         ywtQ==
X-Gm-Message-State: AOAM5322y8GfiKoLb0Rko/AsJDu0H1wbZ6WmQ234bjbu2EvWMc2YLGKn
	stXadtWBTw5hkPetqhZ194mc
X-Google-Smtp-Source: ABdhPJyt+9QxKogVBYcrXpPsn8dfe3yEg3R/m+Q+od/qJUlqh62gci/1z6OjYVgpks85+cnyqHC6UQ==
X-Received: by 2002:a17:90b:4c8d:: with SMTP id my13mr6687112pjb.101.1634649976785;
        Tue, 19 Oct 2021 06:26:16 -0700 (PDT)
Received: from workstation ([202.21.43.8])
        by smtp.gmail.com with ESMTPSA id g11sm15993807pgn.41.2021.10.19.06.26.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Oct 2021 06:26:16 -0700 (PDT)
Date: Tue, 19 Oct 2021 18:56:12 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Hemant Kumar <hemantk@codeaurora.org>, bbhatt@codeaurora.org,
	loic.poulain@linaro.org, wangqing@vivo.com, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] MAINTAINERS: Update the entry for MHI bus
Message-ID: <20211019132612.GA4851@workstation>
References: <20211016065734.28802-1-manivannan.sadhasivam@linaro.org>
 <20211016065734.28802-2-manivannan.sadhasivam@linaro.org>
 <661c564c-e6cd-cbd4-0b17-a7c230d911b2@codeaurora.org>
 <YW64/hzKom7MiVDV@kroah.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YW64/hzKom7MiVDV@kroah.com>
User-Agent: Mutt/1.9.4 (2018-02-28)

On Tue, Oct 19, 2021 at 02:24:30PM +0200, Greg KH wrote:
> On Mon, Oct 18, 2021 at 09:19:16PM -0700, Hemant Kumar wrote:
> > 
> > 
> > On 10/15/2021 11:57 PM, Manivannan Sadhasivam wrote:
> > > Since Hemant is not carrying out any maintainership duties let's make
> > > him as a dedicated reviewer. Also add the new mailing lists dedicated
> > > for MHI in subspace mailing list server.
> > > 
> > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > 
> > Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
> 
> Great, Manivannan, can you resend just this patch with this reviewed-by
> so that I can apply it?
> 

Sure, will do. I thought I could also send the modified version of patch 2 of
this series but we ran out of time :/

Thanks,
Mani

> thanks,
> 
> greg k-h
