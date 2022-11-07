Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B955BA55
	for <mhi@lists.linux.dev>; Mon,  7 Nov 2022 13:47:07 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id g12so16247356wrs.10
        for <mhi@lists.linux.dev>; Mon, 07 Nov 2022 05:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1AC3YGIaP9V1NcYduZ2gjnjW3VyF2paTalXWaqNImmI=;
        b=KLK3MEHraVuw0BOWHmqR+3FnxAOspxOavkgD/w0ogGrKoqK4J7grUD3vCU9UiMvvkk
         anTuvcA3puB2XEMmJccwxTgT0KnO3dgE0uqJSlw7oM7gYjxHgaRLPtvZClknXpDBz7N0
         Igz22I5YxH7BOclDKEKmpw3QZl2IThI/e9XBuNEbcwmszPnk/fQXie5HQP1tnTp51d2K
         139rhA+cd8yjFyCN8JYf0sEnJsQSAKriyxORFpdJZTzFyXtgv3NmoaCZ5yGD0JPa/OG8
         MscUMDNjE+skdsVGX00144TF9odadea0kL6mqWhSW7pZbzxrt4OtPjEmkOBQKX9W5Zpg
         pRbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1AC3YGIaP9V1NcYduZ2gjnjW3VyF2paTalXWaqNImmI=;
        b=7F0FQO6ByF4yvip1tsKqZ/nyxvobiFaMy3+xdl/S+GG1K///ogYXZJl8UFX9p2Kl82
         2qAJhXlheG5RNfUG72IVlIk+kQzbHeQMitB+rqG4TlKU/k10DbNcUTQmPsevvg2UGsGJ
         Ba7w6IihV9c9wghkFd+o69XUQdI/oYEJiHLpr5Xx7OaWIK2X6nyWQHxAZNyFLKU3B27y
         DPSnECR11zDXY/r9sEaTdoGuvLvuG5FgGTdf/rLfMIyU7j9x9ag5kNfgL+OqR6ZqBn4h
         2SDgvMcRMjYQAvR25QPSHChXXNGzqSbP01Kyk9b2ghQN+KWAxE8Zq/SwtNjGB1QXmtbJ
         yGbw==
X-Gm-Message-State: ACrzQf0O4ig+7WpAiV1Lh3XTmjFLznElVfsDYsRzs6eUmcf+YjjmDUSF
	5ryebsIcOGAq1kFCw4H1alPfWN27uZ/Q6yZKjyzExg==
X-Google-Smtp-Source: AMsMyM6VsyV3GUEU7A+sgU0cqpAT4MmNpY2dA52ocj/n4oPUEh0wtdHEKdSgxjNFgVTLvmgUnIE9aPQF/edsvVebtCA=
X-Received: by 2002:adf:e84a:0:b0:236:5f2d:9027 with SMTP id
 d10-20020adfe84a000000b002365f2d9027mr31265063wrn.89.1667828825558; Mon, 07
 Nov 2022 05:47:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAGRyCJGWQagceLhnECBcpPfG5jMPZrjbsHrio1BvgpZJhk0pbA@mail.gmail.com>
 <20221107115856.GE2220@thinkpad>
In-Reply-To: <20221107115856.GE2220@thinkpad>
From: Loic Poulain <loic.poulain@linaro.org>
Date: Mon, 7 Nov 2022 14:46:29 +0100
Message-ID: <CAMZdPi-=AkfKnyPRBgV-7RxczePnB4shLq2bdj+q3kh+7Web3w@mail.gmail.com>
Subject: Re: MHI DTR client implementation
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Daniele Palmas <dnlplm@gmail.com>, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	Network Development <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 7 Nov 2022 at 12:59, Manivannan Sadhasivam <mani@kernel.org> wrote:
>
> + Loic
>
> On Tue, Sep 20, 2022 at 04:23:25PM +0200, Daniele Palmas wrote:
> > Hello all,
> >
> > I'm looking for some guidance related to  a possible MHI client for
> > serial ports signals management implementation.
> >
> > Testing the AT channels with Telit modems I noted that unsolicited
> > indications do not show: the root cause for this is DTR not set for
> > those ports through MHI channels 18/19, something that with current
> > upstream code can't be done due to the missing DTR client driver.
> >
> > I currently have an hack, based on the very first mhi stack submission
> > (see https://lore.kernel.org/lkml/1524795811-21399-2-git-send-email-sdias@codeaurora.org/#Z31drivers:bus:mhi:core:mhi_dtr.c),
> > solving my issue, but I would like to understand which would be the
> > correct way, so maybe I can contribute some code.
> >
> > Should the MHI DTR client be part of the WWAN subsystem?
>
> Yes, since WWAN is going to be the consumer of this channel, it makes sense to
> host the client driver there.

Agree.

>
> > If yes, does it make sense to have an associated port exposed as a char
> > device?
>
> If the goal is to control the DTR settings from userspace, then you can use
> the "AT" chardev node and handle the DTR settings in this client driver.
> Because at the end of the day, user is going to read/write from AT port only.
> Adding one more ctrl port and have it configured before using AT port is going
> to be a pain.
>
> Thanks,
> Mani
>
> > I guess the answer is no, since it should be used just by the AT ports
> > created by mhi_wwan_ctrl, but I'm not sure if that's possible.
> >
> > Or should the DTR management be somehow part of the MHI stack and
> > mhi_wwan_ctrl interacts with that through exported functions?

Is this DTR thing Telit specific?

Noticed you're using the IP_CTRL channel for this, do you have more
information about the protocol to use?

At first glance, I would say you can create a simple driver for
IP_CTRL channel (that could be part of mhi_wwan_ctrl), but instead of
exposing it rawly to the user, simply enable DTR unconditionally at
probe time?

Regards,
Loic
