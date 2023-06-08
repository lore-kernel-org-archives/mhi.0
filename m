Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55AA5947B
	for <mhi@lists.linux.dev>; Thu,  8 Jun 2023 12:41:03 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-5440e98616cso1218705a12.0
        for <mhi@lists.linux.dev>; Thu, 08 Jun 2023 05:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686228062; x=1688820062;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o6uvPLwieY5RkBOZk+PD7M8YvflhokrnPtugOrS3QNE=;
        b=Mx3sJVE2F1ORzjGqe3xy6X7wsCEApK1+VCCgRvjXycaGUApi2Tp0szjSn8M0PPbOrY
         L6ZT2JbB809hrtAlSMLtJWgI0nHKoi/twmYAH9M+c9GMxpGAo8IGutngAyddmrMKefPf
         RCBU4mnCL8+y9Yt8bpiSs2ZXdu8RQpYfL+zv2Gdo/ZaxOJSXFBTVqBrjamKKAnk98XpL
         A7o0ukDCFy0RxCHOvs0/9rVuq8Zu9N2PmEmZ1tpwMEr4hiD84QamxF/SauHaF9MhLS8B
         H5kQh9NyXsLSH3lUag3Ko/bg3fjlMsun8spM10a3OnrUJn+QiGsJ/VHlyT4g7Qu0l+ww
         rEGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686228062; x=1688820062;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o6uvPLwieY5RkBOZk+PD7M8YvflhokrnPtugOrS3QNE=;
        b=j38F6u+XZ+LAsY4lrhvXJCfm0eyvivMv2AHihyGaLWfOcR9DpM0EmMVqxnWFQABJTe
         5Z7CemkMs873i4yOw4b3wUwJEVjAo1aaTfvGKdXfnsiAnhGi7X3XVr2bUMSW0JIjzgug
         n7lTdlf7+IqvJ3b1XanVWxnRLsNK8KJQXSBKwiU9WhFK5tFU9zT2aRjKG0Od4SkuouH2
         oOuiCrPz3WlelSPnzbVwASvMic3jeYcjrFqeTe0GgSDIbyRDRrOGXvwP3xgkwrSBRp0s
         UfX+qNFnRnANz69nTK6z9aEZBYMGJS4zVM9isKkGOdFFylZXuVSJxZX4obN35v9VYHAa
         6GwQ==
X-Gm-Message-State: AC+VfDzrDDMNzVeZ6TundUZJE0aSLEJ23kmnQYxY6UkyJRcEnvToM7Mh
	hLcaT+V/LuwBrQQinpGKCyFY
X-Google-Smtp-Source: ACHHUZ5poAB/V7RXQ3dOzoAJckBX+G4y1Bj7UJT9KsKdnWi22t9GzGjV2GyemH6S7dwhra7PXiL1qQ==
X-Received: by 2002:a17:90b:314c:b0:25b:83ca:2b75 with SMTP id ip12-20020a17090b314c00b0025b83ca2b75mr176896pjb.3.1686228062475;
        Thu, 08 Jun 2023 05:41:02 -0700 (PDT)
Received: from thinkpad ([117.202.186.138])
        by smtp.gmail.com with ESMTPSA id 30-20020a17090a01de00b00259a3c99978sm1285622pjd.17.2023.06.08.05.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 05:41:02 -0700 (PDT)
Date: Thu, 8 Jun 2023 18:10:57 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net,
	edumazet@google.com, pabeni@redhat.com, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, loic.poulain@linaro.org
Subject: Re: [PATCH v2 0/2] Add MHI Endpoint network driver
Message-ID: <20230608124057.GD5672@thinkpad>
References: <20230607152427.108607-1-manivannan.sadhasivam@linaro.org>
 <20230607094922.43106896@kernel.org>
 <eb4b45ab-1f51-47e9-a286-a9e26461ebed@lunn.ch>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eb4b45ab-1f51-47e9-a286-a9e26461ebed@lunn.ch>

On Wed, Jun 07, 2023 at 08:13:32PM +0200, Andrew Lunn wrote:
> On Wed, Jun 07, 2023 at 09:49:22AM -0700, Jakub Kicinski wrote:
> > On Wed,  7 Jun 2023 20:54:25 +0530 Manivannan Sadhasivam wrote:
> > > This series adds a network driver for the Modem Host Interface (MHI) endpoint
> > > devices that provides network interfaces to the PCIe based Qualcomm endpoint
> > > devices supporting MHI bus (like Modems). This driver allows the MHI endpoint
> > > devices to establish IP communication with the host machines (x86, ARM64) over
> > > MHI bus.
> > > 
> > > On the host side, the existing mhi_net driver provides the network connectivity
> > > to the host.
> > 
> > Why are you posting the next version before the discussion on the
> > previous one concluded? :|
> > 
> > In any case, I'm opposed to reuse of the networking stack to talk
> > to firmware. It's a local device. The networking subsystem doesn't
> > have to cater to fake networks. Please carry:
> > 
> > Nacked-by: Jakub Kicinski <kuba@kernel.org>
> 
> Remote Processor Messaging (rpmsg) Framework does seem to be what is
> supposed to be used for these sorts of situations. Not that i know
> much about it.
> 

Rpmsg is another messaging protocol used for talking to the remote processor.
MHI is somewhat similar in terms of usecase but it is a proprietary protocol
used by Qcom for their devices.

- Mani

>      Andrew

-- 
மணிவண்ணன் சதாசிவம்
