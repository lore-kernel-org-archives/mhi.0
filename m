Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A523A5E0D0
	for <mhi@lists.linux.dev>; Tue, 28 Nov 2023 20:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pjg6MtJ6"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-58d956c8c38so1168066eaf.2
        for <mhi@lists.linux.dev>; Tue, 28 Nov 2023 12:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701203761; x=1701808561; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8QlqPdsqaKfOX4ybpeoxfRZcdk2EJ2CcgPBS+ybUncU=;
        b=pjg6MtJ6HGtt8Je3FuBQR4jqnKyk30h9s6/je1g0uqTjft+PNF3mfxdIHKaZMXl8F5
         8NIjiADtklzhaFQh++iPyZeO+dIvvFXGaRkh3pCvIFr+B+fKnx1kZklLx5Vha6HtoYH9
         CWGqHiHG/Bse/Ay5PabxT+YAgmOmLgSr2hMwRZ52RXw3/W6+vqVCRf2BtvY+ubCmV0jy
         rkCiCiqKC5N7aL3Le0R6J2ByWIoI/Cb0gBaeZT2SqY9O3EKeMZwcEiEU7rE6fAIWVutj
         z0i/mpHU/pC85mbhP2IqsISutdTY4zlu0Fls3EVyYMKkPfMDL181Otx9LIAkaA3Mcem/
         GhWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701203761; x=1701808561;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8QlqPdsqaKfOX4ybpeoxfRZcdk2EJ2CcgPBS+ybUncU=;
        b=v/DdZ6hoKCRQSYgfOfBvoig7LIol7P57bJpaMQfHE0GGRCPddKXQgrii/ZlG1dIUTP
         PsjWOocDtE5q3+2svif0wPBMFiZoIY/vda42Z+1U3itjESEmh+ePBSdzOHEvQCdkkhqN
         HMZROBTmtf+Dyoc9X2NixXsmUFAz0rvg7TkWsqGgMgbwsuU97raebReu9dm0d4lqqA5x
         9lo6iUyfUE+RJwJ+QnCbPxNJrZQZ0alwvgDpzbs3MwFECTCf3Odd6+VxB1IZkK9wsK0D
         4JBZVHevLfYGcnzTsG1ISN4yRIvX2/zkxiUeQ3WvDilU1rBrnO6yxdvPWYMIhmrkJ3oQ
         lXbA==
X-Gm-Message-State: AOJu0YzbDk/PGDQwcbHSNcy86mpLVpowM4NFAcRH62y6VZZ+cTtJh18e
	tnJXd1L57OsiBjzi0/e9cjGGBYvRFqUzyMlYqVMQsw==
X-Google-Smtp-Source: AGHT+IFzsmlB/1Q5gxxim4y4vmRNi1YzA551Xf7Btg7SG2Mt7yLBRFaDXl11rOlT2eb6ssG2GPUC+ENHaKVHfploOV4=
X-Received: by 2002:a05:6358:60cd:b0:16b:c249:9b97 with SMTP id
 i13-20020a05635860cd00b0016bc2499b97mr20105639rwi.18.1701203761477; Tue, 28
 Nov 2023 12:36:01 -0800 (PST)
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
In-Reply-To: <20231127084639.6be47207@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 28 Nov 2023 22:35:50 +0200
Message-ID: <CAA8EJppL0YHHjHj=teCnAwPDkNhwR1EWYuLPnDue1QdfZ3RS_w@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add MHI Endpoint network driver
To: Jakub Kicinski <kuba@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, davem@davemloft.net, 
	edumazet@google.com, pabeni@redhat.com, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, loic.poulain@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Nov 2023 at 18:46, Jakub Kicinski <kuba@kernel.org> wrote:
>
> On Mon, 27 Nov 2023 11:34:39 +0530 Manivannan Sadhasivam wrote:
> > I think you made up your mind that this driver is exposing the network interface
> > to the firmware on the device. I ought to clearify that the device running this
> > driver doesn't necessarily be a modem but a PCIe endpoint instance that uses the
> > netdev exposed by this driver to share data connectivity with another device.
>
> Doesn't matter how many legit use cases you can come up with.
> Using netdev as a device comm channel is something I am
> fundamentally opposed to.
>
> > This concept is not new and being supported by other protocols such as Virtio
> > etc...
>
> Yes. Use virtio, please.

We can try using virtio if we control both sides of the link. However
there are usecases of the upstream Linux running on the modem (PCIe
EP) side and other systems (Win, Android) running on the RC side. In
such cases we have to provide the interface that is expected by the
host driver, which unfortunately is MHI. Not to mention that one of
the PCIe EP regions contains registers which are targeting the MHI
protocol. I am not sure how hardware will react if we bypass this
completely and implement VirtIIO or NTB instead.

Also, please excuse me if this was already answered, just for my understanding:
- If we limit functionality to just networking channels which are used
to pass IP data between host and EP, will that be accepted?

- If we were to implement the PCIe networking card running Linux (e.g.
using Freescale PowerQUICC or Cavium Octeon chips), would you also be
opposed to implementing the EP side of the link as the netdev?

-- 
With best wishes
Dmitry
