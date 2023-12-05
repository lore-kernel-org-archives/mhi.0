Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5020E5E0AB
	for <mhi@lists.linux.dev>; Tue,  5 Dec 2023 14:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c1XrCk8b"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-da077db5145so3420439276.0
        for <mhi@lists.linux.dev>; Tue, 05 Dec 2023 06:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701786176; x=1702390976; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=G/Frwe5NoLiVErGGo0J2Fc9HYe79JYyuyxPi79nNvzQ=;
        b=c1XrCk8bVIwyrXdHJN0P3TSD943v+baDlchyZI1JjFtBQCyD4mwoBI2aDaqy5JFsKi
         EpcT0GVNC5JUpUJdCM4xYboSLfcaH89DaQrTXay2WfUsPoR0UtQx6QB1ICbIP8I1JE3q
         xCqyqlIMjX6Xx/nCsBf/h/uSF59HJsN0wXIWIwtYGnfeU2JLBPNzmo82LV1GsRCs8QxW
         LwnwVJsz7T8edSY0S6sIHCd3YrbVPfuzGIhKpnXSy4X2ykm33WwKpbrjbu/By0+ZIre1
         ZJJcBNsFQDEzegfwj6hm6IFvYY1SPjYMFtxaIhn7hyaE0MEyH2qOUetmmQVCdemrstDQ
         eSkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701786176; x=1702390976;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G/Frwe5NoLiVErGGo0J2Fc9HYe79JYyuyxPi79nNvzQ=;
        b=Og/i1VuAJM5h8crsAYTgLxYcJj7+Obdzi2Z5thU1U3ETzbDxD/Ia7yLnKT4PLxh0Zh
         ZTK0uJ+4L+m23mgwlrYWXU9MjAWC+ZU+QEAnkEBfliGV0aaMChZur4+E8xbPot4k3c5t
         blsQpAo6wBqk6Xu0pFGP03qhgMqI9HAKrKemMnMfvS7oWsNR5wCgpUHL0fhfz9FFrmlR
         xSxsq0Ou0SbPFa7Sk7WlWkUsHnMu6qOzHILMpegKEY6khnHqoX87HoK55CPi+bbw4RNC
         8dUW9me0jbDq66FT83mH+93ywZyjTCvn/Pi72s/7dcoi4DRDPUMLGaL3HcSyoBBdCLxT
         qdaw==
X-Gm-Message-State: AOJu0Yzs2iNOMC/ndc9ayms5arfHLtOsTkYen1daveixZPcKnQfBiooW
	WRHPsWYF5CT73gVwpzyGJ9j8jmdYO27ejYlh9V/3sw==
X-Google-Smtp-Source: AGHT+IGyrKcpMlCc6HKeOLyBPWiYuASZdAWLwG2aWAnGxzTUHOjqtc2yXhgIigkdzOlV5dwo5Ofz4JjxN6ezYXE4viE=
X-Received: by 2002:a05:6902:248:b0:db7:dad0:76b5 with SMTP id
 k8-20020a056902024800b00db7dad076b5mr3673602ybs.81.1701786176179; Tue, 05 Dec
 2023 06:22:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230607152427.108607-1-manivannan.sadhasivam@linaro.org>
 <20230607094922.43106896@kernel.org> <20230607171153.GA109456@thinkpad>
 <20230607104350.03a51711@kernel.org> <20230608123720.GC5672@thinkpad>
 <20231117070602.GA10361@thinkpad> <20231117162638.7cdb3e7d@kernel.org>
 <20231127060439.GA2505@thinkpad> <20231127084639.6be47207@kernel.org>
 <CAA8EJppL0YHHjHj=teCnAwPDkNhwR1EWYuLPnDue1QdfZ3RS_w@mail.gmail.com>
 <20231128125808.7a5f0028@kernel.org> <CAA8EJpqGAK-7be1v8VktFRPpBHhUTwKJ=6JTTrFaWh341JAQEQ@mail.gmail.com>
 <20231204081222.31bb980a@kernel.org>
In-Reply-To: <20231204081222.31bb980a@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 5 Dec 2023 16:22:45 +0200
Message-ID: <CAA8EJprrcH3T8_aA7bZhZXKiWMXjUTZkvLkQzteHUG4_7e4i8w@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add MHI Endpoint network driver
To: Jakub Kicinski <kuba@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, davem@davemloft.net, 
	edumazet@google.com, pabeni@redhat.com, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, loic.poulain@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 4 Dec 2023 at 18:12, Jakub Kicinski <kuba@kernel.org> wrote:
>
> On Mon, 4 Dec 2023 14:12:12 +0200 Dmitry Baryshkov wrote:
> > Ok, here you are talking about the control path. I can then assume
> > that you consider it to be fine to use netdev for the EP data path, if
> > the control path is kept separate and those two can not be mixed. Does
> > that sound correct?
>
> If datapath == traffic which is intended to leave the card via
> the external port, then yes.

Then I think I understand what causes the confusion.

The MHI netdev is used to deliver network traffic to the modem CPU,
but it is not the controlpath.
For the control path we have non-IP MHI channels (QMI, IPCR, etc).
This can be the traffic targeting e.g. SSH or HTTP server running on
the EP side of the link.

I probably fail to see the difference between this scenario and the
proper virtio netdev which also allows us to send the same IPv4/v6
traffic to the CPU on the EP side.

-- 
With best wishes
Dmitry
