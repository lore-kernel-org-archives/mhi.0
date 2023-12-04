Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2378822F1E
	for <mhi@lists.linux.dev>; Mon,  4 Dec 2023 12:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jt6FB6oO"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-5d7b1a8ec90so7362877b3.2
        for <mhi@lists.linux.dev>; Mon, 04 Dec 2023 04:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701691943; x=1702296743; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YCGwGXRc8AWPbM6p5oU9fh3ewd5Eki7b3LIN2iWwphM=;
        b=Jt6FB6oOY3K38L7PfcsE3qU1CWmUJa6go2QXzxl/i1M6UTySKMeogMEbFjGU/+GVSW
         Spq487VWrvhW2vW2wPTpNxOgsXpXzV+O8E7p4Y7cnsL1xtzWwSU882fWV0FwArm9GJPx
         /xpW4XuFazGdUf5N1XfTX05bnM8VN6pTE4K38350/GDSEw3WTydFWyf9VIDrEoE+P3E6
         E5BXku35z+bNDfh935dwqSNERmx3b5wfQU0a5X/FPLCyBMaCg8C6bWN7jAKvfOS/wLKm
         V8qGg/RbQIZj6vQumIfxGgrrOl7LL5G380HRuAbXRqpX1RjGsSBfzkq4elQm/ROISH28
         PdfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701691943; x=1702296743;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YCGwGXRc8AWPbM6p5oU9fh3ewd5Eki7b3LIN2iWwphM=;
        b=JmIa7AqAIg7RgNu9lCNm+49EBCN/rvU++FibM2VpXhWI/mkSU4MpzUjOM2Ex2awbJ+
         h9pLf+V21HUExOVX5jNAuuuuYZXNSITMuJ8hiNX+zTDU9qxLZGk1BlKaJjqoD1m6r0s9
         MJFsNrEfQ+y///PBmZ4t8u442V849hq5DuwI0bwY0lDklSBMQyKhx0ANV8vbhSV05E9Q
         x1GvgPFMdyD8Z5/a0B94wUmIVwiSytiEd1DptL+Ol11XfPRCkVNCkFYF8DZEI0tzYNpx
         1GVFUVfIRnDXGfV4Ej5LzV+zLokSU1L3g5Q1ULNw/2NXtqW4HDyLXNQBehdBCwkIq2Le
         H1rw==
X-Gm-Message-State: AOJu0YzhFHoMHF13T81Pdx/4UzSUsRoqm5b9PII1FnnCduykH+h2bYgB
	vnvAe+XTAFNA8TsIJV3guSHeQvViulttej0Y1PvIWQ==
X-Google-Smtp-Source: AGHT+IEw0iO9X3qjmZ7kps5wExLi/tS9iX/64k7HmK4DPPUnZWl2yEZ04CtiVtXmEBn8yIjNBUovtUz3Q9RNKgEifaA=
X-Received: by 2002:a81:c84c:0:b0:5ca:61c7:4ac4 with SMTP id
 k12-20020a81c84c000000b005ca61c74ac4mr1278078ywl.51.1701691942997; Mon, 04
 Dec 2023 04:12:22 -0800 (PST)
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
 <CAA8EJppL0YHHjHj=teCnAwPDkNhwR1EWYuLPnDue1QdfZ3RS_w@mail.gmail.com> <20231128125808.7a5f0028@kernel.org>
In-Reply-To: <20231128125808.7a5f0028@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 4 Dec 2023 14:12:12 +0200
Message-ID: <CAA8EJpqGAK-7be1v8VktFRPpBHhUTwKJ=6JTTrFaWh341JAQEQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add MHI Endpoint network driver
To: Jakub Kicinski <kuba@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, davem@davemloft.net, 
	edumazet@google.com, pabeni@redhat.com, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, loic.poulain@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 28 Nov 2023 at 22:58, Jakub Kicinski <kuba@kernel.org> wrote:
>
> On Tue, 28 Nov 2023 22:35:50 +0200 Dmitry Baryshkov wrote:
> > Also, please excuse me if this was already answered, just for my understanding:
> > - If we limit functionality to just networking channels which are used
> > to pass IP data between host and EP, will that be accepted?
>
> That's too hard to enforce. We have 200+ drivers, we can't carefully
> review every single line of code to make sure you stick to the "just
> networking" promise you make us. Plus the next guy will come and tell
> us "but you let the company X do it".
>
> > - If we were to implement the PCIe networking card running Linux (e.g.
> > using Freescale PowerQUICC or Cavium Octeon chips), would you also be
> > opposed to implementing the EP side of the link as the netdev?
>
> Yes.
>
> It's very tempting to reuse existing code, written for traffic to build
> a control channel. This becomes painful because:
>  - the lifetime rules for interfaces to configure vs to pass traffic
>    are different, which inevitably leads to bugs in common code,
>  - the use cases are different, which leads to hacks / abuse,
>    and then it's a lot harder for us to refactor and optimize core
>    code / data structures,
>  - IDK how "channel to talk to FW" fits with the normal IP stack...

Ok, here you are talking about the control path. I can then assume
that you consider it to be fine to use netdev for the EP data path, if
the control path is kept separate and those two can not be mixed. Does
that sound correct?

>
> The "FW channel netdevs" exist for decades now, and are very popular
> with middle box SDKs, I know. Your choices are:
>  - keep the code out of tree,
>  - use a generic interface with a strong standard definition, like
>    virtio, and expect that no customizations will be allowed.

-- 
With best wishes
Dmitry
