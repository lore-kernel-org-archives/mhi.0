Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918421C3A
	for <mhi@lists.linux.dev>; Wed,  7 Jun 2023 07:41:36 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-256e1d87998so5982766a91.3
        for <mhi@lists.linux.dev>; Wed, 07 Jun 2023 00:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686123696; x=1688715696;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PjfFNwe8EaTiGUc0QuU/z5HZzTxOk+LVPPYj8mjsNzM=;
        b=hS/0Qma+MSVMOmezs7ae7p8C6lqEhrJlH4f8w//ca/fANrvQFpvioDvwVaAwPHQSzE
         EL+56AyeCdS0kQd3cWCnJCzDFlyZ0NgUkjIKhc+IBMpxxfgC/UIbczsJD5rvidJWiFP9
         nsxFpkRubavOeHiiEIqmlgS/LCSdacfRd/nv2kdeFYj/T3jfPhrkGiOcxQ8TLNcAk9Mc
         NTiF2gKhlqebuJ/MTHPTamqsd29u40mFj8p5BVVapN6n6TGCmK0Q/ELwrFvNDnVn/Jw5
         JqSy0dBoTifuelcf07VOm2+g3Cg+A5XuT+aYXYH4rcXRsPuNJr31a1KxDYscNwARPcOh
         Q/FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686123696; x=1688715696;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PjfFNwe8EaTiGUc0QuU/z5HZzTxOk+LVPPYj8mjsNzM=;
        b=kj54nsmvWgvNzkTe12eEg/XTdFL0a8DtwhkHU/6pxdBrX32OSiaek8R3qPSheJ+Bjf
         1gnNvRxU0apH+QRkBp5juIAIOwK7TQWmZsTBMP+UE6YxzzGvOjWz0vNaueC3Fhw8KJ/g
         qrJccmcJEp7yXQfguzWO7Sn4Hv/BCt7XzMLN2EK4V72KtiCPYsrhw2s0K/QPou4XtDEA
         hWLb5++gUPrKIdLh9aBLe4VkD9U2Ld5Q5myT87B+DS98pJf6HZ3IZnpERWOFDyEolp/M
         +Ut1/ShLpaVYZXwUIM2pJ4o6XwlKOaFGBNfBzigpgnUjBBbvBs8lkzUvhDblamTVdgIH
         sDdA==
X-Gm-Message-State: AC+VfDy3+GnQQUZ3qGip0ZXIrg+cgeyEZX2kG7yhWL8k+6K/SEtFisS0
	vD7I4VzAM41j4LVFvv0Xt1HZ
X-Google-Smtp-Source: ACHHUZ50Fei3Zw35iH9ZCnQkZU/3FdMXz9ZIxWFCszlfvuqnYaKVV+Vt/Nyt3IqrO4RypPINYFkinw==
X-Received: by 2002:a17:90b:3846:b0:253:49d7:ce19 with SMTP id nl6-20020a17090b384600b0025349d7ce19mr3930719pjb.18.1686123695820;
        Wed, 07 Jun 2023 00:41:35 -0700 (PDT)
Received: from thinkpad ([59.92.97.244])
        by smtp.gmail.com with ESMTPSA id 8-20020a17090a1a4800b0023a84911df2sm788372pjl.7.2023.06.07.00.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 00:41:35 -0700 (PDT)
Date: Wed, 7 Jun 2023 13:11:18 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Loic Poulain <loic.poulain@linaro.org>
Cc: Andrew Lunn <andrew@lunn.ch>, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Add MHI Endpoint network driver
Message-ID: <20230607074118.GD5025@thinkpad>
References: <20230606123119.57499-1-manivannan.sadhasivam@linaro.org>
 <c769c95d-e8cb-4cf6-a41a-9bef5a786bb1@lunn.ch>
 <20230607065652.GA5025@thinkpad>
 <CAMZdPi-xJAj_eFvosVTmSzA99m3eYhrwoKPfBk-qH87yZzNupQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMZdPi-xJAj_eFvosVTmSzA99m3eYhrwoKPfBk-qH87yZzNupQ@mail.gmail.com>

On Wed, Jun 07, 2023 at 09:12:00AM +0200, Loic Poulain wrote:
> On Wed, 7 Jun 2023 at 08:56, Manivannan Sadhasivam
> <manivannan.sadhasivam@linaro.org> wrote:
> >
> > On Tue, Jun 06, 2023 at 02:59:00PM +0200, Andrew Lunn wrote:
> > > On Tue, Jun 06, 2023 at 06:01:16PM +0530, Manivannan Sadhasivam wrote:
> > > > Hi,
> > > >
> > > > This series adds a network driver for the Modem Host Interface (MHI) endpoint
> > > > devices that provides network interfaces to the PCIe based Qualcomm endpoint
> > > > devices supporting MHI bus (like Modems). This driver allows the MHI endpoint
> > > > devices to establish IP communication with the host machines (x86, ARM64) over
> > > > MHI bus.
> > > >
> > > > On the host side, the existing mhi_net driver provides the network connectivity
> > > > to the host.
> > > >
> > > > - Mani
> > > >
> > > > Manivannan Sadhasivam (3):
> > > >   net: Add MHI Endpoint network driver
> > > >   MAINTAINERS: Add entry for MHI networking drivers under MHI bus
> > > >   net: mhi: Increase the default MTU from 16K to 32K
> > > >
> > > >  MAINTAINERS              |   1 +
> > > >  drivers/net/Kconfig      |   9 ++
> > > >  drivers/net/Makefile     |   1 +
> > > >  drivers/net/mhi_ep_net.c | 331 +++++++++++++++++++++++++++++++++++++++
> > > >  drivers/net/mhi_net.c    |   2 +-
> > >
> > > Should we add a drivers/net/modem directory? Maybe modem is too
> > > generic, we want something which represents GSM, LTE, UMTS, 3G, 4G,
> > > 5G, ... XG etc.
> > >
> >
> > The generic modem hierarchy sounds good to me because most of the times a
> > single driver handles multiple technologies. The existing drivers supporting
> > modems are already under different hierarchy like usb, wwan etc... So unifying
> > them makes sense. But someone from networking community should take a call.
> 
> 
> Yes, so there is already a drivers/net/wwan directory for this, in
> which there are drivers for control and data path, that together
> represent a given 'wwan' (modem) entity. So the generic mhi_net could
> be moved there, but the point is AFAIU, that MHI, despite his name, is
> not (more) used only for modem, but as a generic memory sharing based
> transport protocol, such as virtio. It would then not be necessarily
> true that a peripheral exposing MHI net channel is actually a modem?
> 

Agree, mhi_*_net drivers can be used by non-modem devices too as long as they
support MHI protocol.

- Mani

> Regards,
> Loic

-- 
மணிவண்ணன் சதாசிவம்
