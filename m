Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D7546A7
	for <mhi@lists.linux.dev>; Thu, 21 Apr 2022 07:22:58 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id md4so4158877pjb.4
        for <mhi@lists.linux.dev>; Thu, 21 Apr 2022 00:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Cmd0E8Et4Aqh5aFcilCHXMmJJLWu1Jtl7bjaRVoAghc=;
        b=wlpnfsZ16kVfFPfp0k7Xj0f/aywbiZeLM4giSo7yBwG9EWkqD7nzRgzQ8sF933Mir5
         5J5YxRb1Sn613WSHJZqpEO1cao98as3MMx1p/h1VIRoV1NPKbuXITZTdwCBtB4w0Hvhv
         NzGU7bgDiaG0QTcoVX2PdwFTW0ISrwv8eCeKnOknh5CzqMN8fNsJnKqrH7Qbi/ATlAn9
         mc+ajMM1PLJX0m84nWKrxEhe11zMs3WDUqOwac9nZZyhtqOAZp/phrX55gcTelgupd9V
         L6Luf/Qt9k4lTI/FcV5s090CQk9HwX5H+l7eFF2QhizHRLp7sv23a5GpyZMNONzkqP1w
         mkJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Cmd0E8Et4Aqh5aFcilCHXMmJJLWu1Jtl7bjaRVoAghc=;
        b=aI1qlzA7pTQdfrhBpvtUjtgKgefsnU1s2NYo7zoABnnIkKxH8M2L0oRCXpuBQlgXyP
         Tb+bhr343H2w7yZ06loNzmByHu4hBl9QYDg70RhryMfrKAnilVKXzkPVaWIX8uupXamP
         hEx8Gl7lGuois6/42h+YYGDkOLL7vgb9RUjE27IWvwmBEBuX7g/Mxa70sEIaPIPUiTM7
         EXWP7dnFxYfqfecZux5URD4eF12hB2gpeNHWZ+lX6QsJxeIALaEHU3TIzUMYhA3QcYe1
         db8C+lz5+xnKXzQahrt/5W5oo+2BtSWE87GeROrVi/2KV0ix/hfe9eGLVIlRV8JAVdLT
         Undg==
X-Gm-Message-State: AOAM533OJxUBYO62mF2XWFBoFdJGjXd5UZPtuCv+fLurX/3s7Rra3GuF
	Y5d2QMJrbFD8HxpKXo7y7aWqUpFbkRagcIPRE5hc+Q==
X-Google-Smtp-Source: ABdhPJwJ+eJ+vATRB/XjaodcI4GTsx+t0J1D+9WNX9bPTfhZ/WJLHVyG2MdACY15rk8788iGZEzyO+B/x7DhWAjNAjI=
X-Received: by 2002:a17:902:e881:b0:158:fd34:7b28 with SMTP id
 w1-20020a170902e88100b00158fd347b28mr18501645plg.95.1650525778165; Thu, 21
 Apr 2022 00:22:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220420102811.3157-1-slark_xiao@163.com> <CAMZdPi9WJsz5nyzQB39q=Jhy8_q2=N8VAucYMUYKUf_faL5csQ@mail.gmail.com>
 <55f0b74e.25a7.1804aeeedb4.Coremail.slark_xiao@163.com>
In-Reply-To: <55f0b74e.25a7.1804aeeedb4.Coremail.slark_xiao@163.com>
From: Loic Poulain <loic.poulain@linaro.org>
Date: Thu, 21 Apr 2022 09:22:22 +0200
Message-ID: <CAMZdPi93zxGmb-ns0bNk6itcUck1=Hsh5Y9-FFCNBU2qNg248A@mail.gmail.com>
Subject: Re: Re: [PATCH] bus: mhi: host: Add support for Cinterion MV32-WA/MV32-WB
To: Slark Xiao <slark_xiao@163.com>
Cc: mani@kernel.org, quic_hemantk@quicinc.com, gregkh@linuxfoundation.org, 
	bbhatt@codeaurora.org, christophe.jaillet@wanadoo.fr, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 21 Apr 2022 at 09:04, Slark Xiao <slark_xiao@163.com> wrote:
>
>
>
> At 2022-04-20 20:00:23, "Loic Poulain" <loic.poulain@linaro.org> wrote:
> >Hi Slark,
> >
> >On Wed, 20 Apr 2022 at 12:28, Slark Xiao <slark_xiao@163.com> wrote:
> >>
> >> MV32-WA is designed based on Qualcomm SDX62, and
> >> MV32-WB is designed based on QUalcomm SDX65. Both
> >> products' enumeration would align with previous
> >> product MV31-W.
> >> Add some new items for mv32 to separate it from
> >> mv31-w, in case we need to do any changes in
> >> future.
> >
> >On the contrary, do not overly clone the structures, and re-use the
> >mv31 ones if they apply. You can rename them to mv3x if you really
> >want to.
> >
> >Regards,
> >Loic
> >
> Hi Loic,
>   Thanks for your suggestion.
>    Actually, for different chip(like previous SDX24 and SDX55), they may
> have difference behavior. For example, the item of 'sideband_wake'
> of SDX24 is true but the rest is false. It's hard to say SDX65 would
> align with SDX55 until now.

I agree, but as long as the structure's fields are the same there is
no point in duplicating them.

>    Maybe I can re-use the same item '.config' for all MV3X products and separate
> them from device info(mhi_pci_dev_info).
>    Do you agree this?

Yes.


Loic
