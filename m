Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6B5D531
	for <mhi@lists.linux.dev>; Mon,  7 Nov 2022 16:18:13 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id x2so18404211edd.2
        for <mhi@lists.linux.dev>; Mon, 07 Nov 2022 08:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Obh3So++S0fpgr60eFX+LcdWNZ85UuWk3LNhFvn6Ric=;
        b=aZyvP3vyQq7FjjM5qE8gq/ZSNDgYJL2so29zcraAB6Ttr5+wRHNTa5vMzZ8YA87Fkf
         9EsURtvv5ouHYlPh7pyDmlctj4BkWdBfRphCBSRCdxjW3US3UVgmReBCvwP2PVS/SPiv
         jjymQsN468vq67SyHQ+l/mXnTl449TEZHCjDk6Bm6ugHkUCYFQW1Qc182+95TSIU26tl
         23pQ18Lt57o40AfHgMY60KAZjazYLUmWSrk8Mnms6NGMngBBilTBnaoIImrWPpHFIjVo
         JhKcXM0Zf7alD4oAKrSB1f5pKeUb+PfDJqekBkzY/tatx497SKjYQjmtK751D1CfKvAK
         LFBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Obh3So++S0fpgr60eFX+LcdWNZ85UuWk3LNhFvn6Ric=;
        b=L3ekEyi9Xloak6ra9rDp+i3OpUHxajMG4ZjsiacYggt2wIi0d424kVhSrvxe/VrTI1
         wkQ+OHQTE1eu4guLt0hyk1kN10KzvqMHXdwLqjjFN4rnkVw+yyvmy1UOzvzJteMNAAUz
         sS7dtbh2J1dn4MTugxEqzedk5T4zipU6qLJ63vbtWTbqgAq09YKhIzNx0/Tu91dTVqWO
         L0Y3yErdGQ+09HpphTAl0FSyrB0cRbOB2SQvMTAyzuiV8eRn2qywp42iRTF2gbcEijdH
         3xqjGTqjV9NKZ1+OLr1Ow0OudSSiICWuV/yuAEY1hYOz0QGPRJnWkdzqTze30CDrPGoh
         yC4Q==
X-Gm-Message-State: ACrzQf1Dd5Iy47slB5ShOk2h1OfEKnC3v6a0LLpMjFa4gABBy0nY3+je
	3xx6cKaT4BXduyaSmr7cY7AFgNebX9P3uGQuTFfhU3mEHAI=
X-Google-Smtp-Source: AMsMyM7nfUtm1fP+3JtrVzafVqmqKFeuCBrpVsLmHiKVUSAJcyhqTY7pkLP6krC6L/RH3xW0HIHHVTSZXjyMXloDn5w=
X-Received: by 2002:aa7:cad5:0:b0:454:88dc:2c22 with SMTP id
 l21-20020aa7cad5000000b0045488dc2c22mr51406050edt.352.1667837891699; Mon, 07
 Nov 2022 08:18:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAGRyCJGWQagceLhnECBcpPfG5jMPZrjbsHrio1BvgpZJhk0pbA@mail.gmail.com>
 <20221107115856.GE2220@thinkpad>
In-Reply-To: <20221107115856.GE2220@thinkpad>
From: Daniele Palmas <dnlplm@gmail.com>
Date: Mon, 7 Nov 2022 17:18:00 +0100
Message-ID: <CAGRyCJF+EodvRNK6T7KrBP_WKyETPYmz537M6hF6ZDD0RQVvkA@mail.gmail.com>
Subject: Re: MHI DTR client implementation
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	Network Development <netdev@vger.kernel.org>, loic.poulain@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mani,

Il giorno lun 7 nov 2022 alle ore 12:59 Manivannan Sadhasivam
<mani@kernel.org> ha scritto:
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
> > (see https://lore.kernel.org/lkml/1524795811-21399-2-git-send-email-sdi=
as@codeaurora.org/#Z31drivers:bus:mhi:core:mhi_dtr.c),
> > solving my issue, but I would like to understand which would be the
> > correct way, so maybe I can contribute some code.
> >
> > Should the MHI DTR client be part of the WWAN subsystem?
>
> Yes, since WWAN is going to be the consumer of this channel, it makes sen=
se to
> host the client driver there.
>
> > If yes, does it make sense to have an associated port exposed as a char
> > device?
>
> If the goal is to control the DTR settings from userspace, then you can u=
se
> the "AT" chardev node and handle the DTR settings in this client driver.
> Because at the end of the day, user is going to read/write from AT port o=
nly.
> Adding one more ctrl port and have it configured before using AT port is =
going
> to be a pain.
>

ok.

Meanwhile, I've found the following
https://git.codelinaro.org/clo/le/platform/mhi-host/-/commit/17a10f4c879c9f=
504a0d279f03e924553bcf2420
and https://git.codelinaro.org/clo/le/platform/mhi-host/-/commit/8a87038021=
d4f39e435e035124acade1eb168749
that is very similar to the approach I was thinking about.

I guess this could be probably the best starting point for mainline integra=
tion.

Thanks,
Daniele

> Thanks,
> Mani
>
> > I guess the answer is no, since it should be used just by the AT ports
> > created by mhi_wwan_ctrl, but I'm not sure if that's possible.
> >
> > Or should the DTR management be somehow part of the MHI stack and
> > mhi_wwan_ctrl interacts with that through exported functions?
> >
> > Thanks a lot in advance,
> > Daniele
> >
>
> --
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D
