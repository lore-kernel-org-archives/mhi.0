Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5777F7
	for <mhi@lists.linux.dev>; Wed,  7 Jun 2023 06:56:58 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-64d44b198baso226229b3a.0
        for <mhi@lists.linux.dev>; Tue, 06 Jun 2023 23:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686121018; x=1688713018;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BbZJHWFvG7e+6T+OE9cOP6p9FlABT7Ry2hM+Lk72cDc=;
        b=AtcviKsaV0B4EF556reyoOW2LCZy7pRGbV+sJGDClAn2lPnwzATJsG5mpYhK8i8dNL
         rseOQqvTvv4WaQ9N7c9S6/LsTJ0+q2eb0aJHEySbPdL/HoZRGpPjWszxwMTEu6IJGgYg
         TbOrqzyeV99mw3VRkFrzlFP6Eh+bBw6cl00E0SMgqC2DAr13upNgOdCA2v6PYTuhdV8w
         HS6yTwT1m9EBKM9aByNiND/7HvIDN/HsEXcXcfwY88XdpTj1g29XlNCAgEpiRcPdFjmA
         DqRjQyzx3zQYZAyMm4kwEDgTdRGRhiljnDQVggkouQHgqkl/3zedF6ZIraXp78C21WsV
         +3zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686121018; x=1688713018;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BbZJHWFvG7e+6T+OE9cOP6p9FlABT7Ry2hM+Lk72cDc=;
        b=fIN7fE3kVswU+h+Eji+2nYAP8SJ3lvuV7m9JtUwuwmEvNcjrVBfCojBX2naWIwwps8
         273CRVnQeFG6OTHFI7mWLhZcB8epPlTq6CB2p/HJCcqz/D48QaNQOTGTz7ZGIdyeL8n6
         3XWdnF0oO+Qu4aBME0ouXBYr/gtWxUis/H70RiYOIp4l3vB7YIae7bxdoEWWDbJzEOCz
         q4nF7k7AlqlqJPDxQKkCO7YbKIqOC8C2UCh8MYp6EK3f9TwN1NIxJEsL8dbgG6felHiE
         suoKnV1XGwWoZzKbzQdnT7sH63u3lkDMM+m+Dc9jV/MofzgW3zwOAFku8+r0dWZE+I8Z
         KWxQ==
X-Gm-Message-State: AC+VfDyEkp0J2CLxM3kD7BDigaQnwYbc0uPZKz/SmJdcBqbPEegDAAoA
	4Qv4xJGWcluJU3k6fNgJO20i
X-Google-Smtp-Source: ACHHUZ6cWKiLSdxkl6dJrjEECAzxAPc6F+Sm5bcROs9nSVpcodcj9uJ9abskwUWFmI9Do8QHxlEdSg==
X-Received: by 2002:a05:6a00:2e0e:b0:646:6e40:b421 with SMTP id fc14-20020a056a002e0e00b006466e40b421mr5004834pfb.1.1686121018003;
        Tue, 06 Jun 2023 23:56:58 -0700 (PDT)
Received: from thinkpad ([59.92.97.244])
        by smtp.gmail.com with ESMTPSA id t17-20020a62ea11000000b0065c8c5b3a7dsm3962043pfh.13.2023.06.06.23.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 23:56:57 -0700 (PDT)
Date: Wed, 7 Jun 2023 12:26:52 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, loic.poulain@linaro.org
Subject: Re: [PATCH 0/3] Add MHI Endpoint network driver
Message-ID: <20230607065652.GA5025@thinkpad>
References: <20230606123119.57499-1-manivannan.sadhasivam@linaro.org>
 <c769c95d-e8cb-4cf6-a41a-9bef5a786bb1@lunn.ch>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c769c95d-e8cb-4cf6-a41a-9bef5a786bb1@lunn.ch>

On Tue, Jun 06, 2023 at 02:59:00PM +0200, Andrew Lunn wrote:
> On Tue, Jun 06, 2023 at 06:01:16PM +0530, Manivannan Sadhasivam wrote:
> > Hi,
> > 
> > This series adds a network driver for the Modem Host Interface (MHI) endpoint
> > devices that provides network interfaces to the PCIe based Qualcomm endpoint
> > devices supporting MHI bus (like Modems). This driver allows the MHI endpoint
> > devices to establish IP communication with the host machines (x86, ARM64) over
> > MHI bus.
> > 
> > On the host side, the existing mhi_net driver provides the network connectivity
> > to the host.
> > 
> > - Mani
> > 
> > Manivannan Sadhasivam (3):
> >   net: Add MHI Endpoint network driver
> >   MAINTAINERS: Add entry for MHI networking drivers under MHI bus
> >   net: mhi: Increase the default MTU from 16K to 32K
> > 
> >  MAINTAINERS              |   1 +
> >  drivers/net/Kconfig      |   9 ++
> >  drivers/net/Makefile     |   1 +
> >  drivers/net/mhi_ep_net.c | 331 +++++++++++++++++++++++++++++++++++++++
> >  drivers/net/mhi_net.c    |   2 +-
> 
> Should we add a drivers/net/modem directory? Maybe modem is too
> generic, we want something which represents GSM, LTE, UMTS, 3G, 4G,
> 5G, ... XG etc.
> 

The generic modem hierarchy sounds good to me because most of the times a
single driver handles multiple technologies. The existing drivers supporting
modems are already under different hierarchy like usb, wwan etc... So unifying
them makes sense. But someone from networking community should take a call.

- Mani

>     Andrew

-- 
மணிவண்ணன் சதாசிவம்
