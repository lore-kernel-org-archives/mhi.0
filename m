Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB666AAE
	for <mhi@lists.linux.dev>; Wed,  7 Jun 2023 07:12:37 +0000 (UTC)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-1a28de15c8aso6403297fac.2
        for <mhi@lists.linux.dev>; Wed, 07 Jun 2023 00:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686121957; x=1688713957;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=448kJfx0P49/QlavcytCAcn+ROp1DkOsc8XIkFFDohc=;
        b=F4oCDwUyfoV1OdJR1wEXY3toanGZYTwTSZswGSkG/Qk6fd1zE55rZr4c58azMzm844
         I0Iyd9o5eUgpi4wLOR/kTe9lQlS6Rdg0MJ+OyO/KSHJUKULWL9Xy6HDNS8wxHDuRFLDT
         bfwv8xOxwhwhWi1Ui064vvYaLTFtFPleGOaH/QblFoGPkux8tCXQESii4DXcKMTf3UDs
         7f0eqMcZ6wDQoe5LLjKvQi/aTm2OZYw3nIixdJ8uwbPaB7fDRNxdpvfoJIUF//8i7x+U
         wfKBVlC2yExFlZsV/W9Refc8oN0rmqLSOJ1joDYQzBaEq4oX0n5e3PC2m/3fg/x0s2nR
         0pPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686121957; x=1688713957;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=448kJfx0P49/QlavcytCAcn+ROp1DkOsc8XIkFFDohc=;
        b=OX3E7k7bhKr08WIPm7Kf93yHfdYokYJBWdUOa3zg0bsKHYySEpicW0KaTgDYCASWGn
         I+B3b+ETXMZkAOJ/DmwFPTtnD5nPbwNceZ7jH3QiFfJCkpOm7lqNpmDQlBow2HTtUGwJ
         /K7BYv3fIZG52zgYRFuO7csKlgco1Z8gKJHAj8eKa78CG/W4dQz+SyWO40Pscth7+YdP
         MxMcHgteSbW5m1mi1oUzqbOZgBONE8qfteI80oNp7acf/R1FRbSRH1ZeB50L8DqeUW/o
         r2+Vnobvu7/v7MNQed1F6y+wRgmyi4Z40PpixYj+lRVSlQZ9TwXWm6zn+mQ3uITs7U9q
         6sQw==
X-Gm-Message-State: AC+VfDwJFTiQRiU+lAJrBNSc2RwhaZil/o0X5SPlmPT75tdqvuuYIim6
	s2G3qYMJVt6BDiRkZ4Wsn1mJiks/MaHBbfKijYpZ0w==
X-Google-Smtp-Source: ACHHUZ55XZ8n6rPguTjh4Pc2NQCXjiTAWuZ8fsxM5qyf71DyztoixFdpPmuzGD5p5MAGNLXWEijL56kaTVb4VPpr7as=
X-Received: by 2002:a05:6870:44c5:b0:19f:698f:56a1 with SMTP id
 t5-20020a05687044c500b0019f698f56a1mr4397617oai.15.1686121956816; Wed, 07 Jun
 2023 00:12:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230606123119.57499-1-manivannan.sadhasivam@linaro.org>
 <c769c95d-e8cb-4cf6-a41a-9bef5a786bb1@lunn.ch> <20230607065652.GA5025@thinkpad>
In-Reply-To: <20230607065652.GA5025@thinkpad>
From: Loic Poulain <loic.poulain@linaro.org>
Date: Wed, 7 Jun 2023 09:12:00 +0200
Message-ID: <CAMZdPi-xJAj_eFvosVTmSzA99m3eYhrwoKPfBk-qH87yZzNupQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] Add MHI Endpoint network driver
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Andrew Lunn <andrew@lunn.ch>, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 7 Jun 2023 at 08:56, Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
>
> On Tue, Jun 06, 2023 at 02:59:00PM +0200, Andrew Lunn wrote:
> > On Tue, Jun 06, 2023 at 06:01:16PM +0530, Manivannan Sadhasivam wrote:
> > > Hi,
> > >
> > > This series adds a network driver for the Modem Host Interface (MHI) endpoint
> > > devices that provides network interfaces to the PCIe based Qualcomm endpoint
> > > devices supporting MHI bus (like Modems). This driver allows the MHI endpoint
> > > devices to establish IP communication with the host machines (x86, ARM64) over
> > > MHI bus.
> > >
> > > On the host side, the existing mhi_net driver provides the network connectivity
> > > to the host.
> > >
> > > - Mani
> > >
> > > Manivannan Sadhasivam (3):
> > >   net: Add MHI Endpoint network driver
> > >   MAINTAINERS: Add entry for MHI networking drivers under MHI bus
> > >   net: mhi: Increase the default MTU from 16K to 32K
> > >
> > >  MAINTAINERS              |   1 +
> > >  drivers/net/Kconfig      |   9 ++
> > >  drivers/net/Makefile     |   1 +
> > >  drivers/net/mhi_ep_net.c | 331 +++++++++++++++++++++++++++++++++++++++
> > >  drivers/net/mhi_net.c    |   2 +-
> >
> > Should we add a drivers/net/modem directory? Maybe modem is too
> > generic, we want something which represents GSM, LTE, UMTS, 3G, 4G,
> > 5G, ... XG etc.
> >
>
> The generic modem hierarchy sounds good to me because most of the times a
> single driver handles multiple technologies. The existing drivers supporting
> modems are already under different hierarchy like usb, wwan etc... So unifying
> them makes sense. But someone from networking community should take a call.


Yes, so there is already a drivers/net/wwan directory for this, in
which there are drivers for control and data path, that together
represent a given 'wwan' (modem) entity. So the generic mhi_net could
be moved there, but the point is AFAIU, that MHI, despite his name, is
not (more) used only for modem, but as a generic memory sharing based
transport protocol, such as virtio. It would then not be necessarily
true that a peripheral exposing MHI net channel is actually a modem?

Regards,
Loic
