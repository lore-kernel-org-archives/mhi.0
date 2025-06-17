Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6EF2135A0
	for <mhi@lists.linux.dev>; Tue, 17 Jun 2025 14:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750172328; cv=none; b=IQXiN3I/OG1YE6MBYsOC4kZPvPwQxAG28ycBGb302o6Z4znFa1ftBPl3c4udLtJquaJxYWaNLoDGds5cWFyyuolj3EngzxQd4+faa6uBeJfxpg5oczaVaTyiypVYVUZO4+CQCxZ09SvKRFmS73WME7u56oaPwo8f+iCY7YEwEGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750172328; c=relaxed/simple;
	bh=aNMSlYMqBh7TGkZwIvZm9sYZFPP2n8ZRe16P/iTVhJs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ADbc5MGNT/N6cgWdxyedadouIHpjQUdyNhHm0/ukFKpLERrUM0Bbcfp4wg1Tlr4kdFx+MrGVrUBMaGAyAhvT5bzdrTUm3k46IkUa3B/e03wIVL2mHnF2C3o9haNWn3KZ6wjJ9h9UycrFbjvbqRxb/g2MiPkCnWATm4jKY83YSHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kBntvAqh; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kBntvAqh"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-adb47e0644dso175774666b.0
        for <mhi@lists.linux.dev>; Tue, 17 Jun 2025 07:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750172325; x=1750777125; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tFMbIK8XdkubBwMqAxMT+AE6lntMwC1zhKGYkr2V1/Q=;
        b=kBntvAqhAIyu38r03ExbahBmaJHm62I/5Tj60PiVEwY8T0w/8mXEi3K/ZKxxpBZz7J
         m07oZn1Oi3SR1x34tj3H8zgUkkDSu3ev9TBaaRmJ0SJ2vFrr12D0qzTdKbVw/uwqn4WV
         ypoYDzmiwllo8BeA7crbpCZcKpXdFIr9Mvlf55ZgHF8mu3VmJ8lgq4ypzAIq4imw5Twh
         BGpEaY6s13igObq1jnIj5y1syMiJ8tjrkf22C4eVCYHT8HcZyGAc+MTYp5JRuxD5qT1g
         q+B0/n2q3iOnu/FP1bwDDcU5GlmthP7d4iABolHuCMScRKjLR4xo3GAaXkbbS8H3IRbb
         +qqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750172325; x=1750777125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tFMbIK8XdkubBwMqAxMT+AE6lntMwC1zhKGYkr2V1/Q=;
        b=chlBSPegJudNyKEQ9tgs/eWQm4t2/6So7qrzG+OS05fZD40wOXMWyZZEwqOrGoYU+u
         q6KrB9ZN4cgWNZYbWMgfxQg5p3TZ0O09BVQrn4DIIIelqckUzgEytxBZYqWwW6W2MZAg
         iNZX/uodLO09K/MvVU7vhhwWNRkt5b1nHWN10fWDkD31cFt9qrmdR3mOq6X+qiHK9qrQ
         xImRak47GCQkxpRTQbTt7K6aux7sMeB3A0v26cRRlobDmkN39PE6hWh5H1lLn8h9+tiZ
         0IYB03iMS9dwz9oKuBdsZHduFKxTgvb4vhf3k0XQfVR7lBX11/4h2zHeiUnrIPiHMhXS
         lHLw==
X-Forwarded-Encrypted: i=1; AJvYcCWj8kzLkgyuIOB9THpZ16XEThWfT1H3l3J8b6YJPLhsBZ74oxBAv2oQaFb/8/4uBO2nkHE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxPve8EMXeq1zq84kcgtGMHypDz95uswNKNjslgT0EDcDoHnImT
	jIPFbu3yXdkog1XbG9lK2XlBFsNyPd3WEa9p0LtMJpMnuGSCdPgqTNJA5pRKompyedvxHHG/sED
	TkSOAVCVqjO/jVQo+ygJwL0kx9jwzwxA=
X-Gm-Gg: ASbGncs4VoLQ8HTZY2iVnVwCBD8Iv67Xm9gBVzfIfUOg8cM4C3SXoK9EbMAh8y/XhD6
	gEF4BT7dWs1WvXD3MuFfr1+hvuqDAPTbHJPY4NFADa/aBHXi4HspTy9tVDuybNiCoIpR3rPWCZz
	w2vj+z+YPM3zSxIC9UW26rXdOadOyY4du4JeF58s7v7g==
X-Google-Smtp-Source: AGHT+IEETojlBs4zeufKnNAfPKmtN/B8jrW05fqGi8+W2dBQjH4hXvU3OfIrvlGAII9WXyCqbuomLNHiFkYPUz/b9eM=
X-Received: by 2002:a17:907:6d0a:b0:ad2:27b1:7214 with SMTP id
 a640c23a62f3a-adf9e1d7e73mr1415402966b.17.1750172324179; Tue, 17 Jun 2025
 07:58:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250528175943.12739-1-zxue@semtech.com> <gt6uyoohzyjlqsbb4wro7vjsyhgwpvca46ixmivo6ybvmejsc3@nc3syx4lk4t3>
In-Reply-To: <gt6uyoohzyjlqsbb4wro7vjsyhgwpvca46ixmivo6ybvmejsc3@nc3syx4lk4t3>
From: Aleksander Morgado <aleksander.morgado@gmail.com>
Date: Tue, 17 Jun 2025 16:58:30 +0200
X-Gm-Features: AX0GCFuY-iFnlHE8Oy6B-92n0XRHmRePA1s_4SqNR6ji4ozUguRonyfoH8Ay69c
Message-ID: <CAA3JqEfpuwn5OL6SasVGRU82+2+D5nNXk-WALzcnWnuz9384kQ@mail.gmail.com>
Subject: Re: [PATCH v1] bus: mhi: host: pci_generic: Add support for EM929x
 and set MRU to 32768 for better performance.
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Adam Xue <zxue@semtech.com>, Thomas Perrot <thomas.perrot@bootlin.com>, 
	Aleksander Morgado <aleksander@aleksander.es>, manivannan.sadhasivam@linaro.org, 
	slark_xiao@163.com, johan+linaro@kernel.org, quic_vpernami@quicinc.com, 
	tglx@linutronix.de, fabio.porcedda@gmail.com, quic_msarkar@quicinc.com, 
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imocanu@semtech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 11:27=E2=80=AFAM Manivannan Sadhasivam <mani@kernel=
.org> wrote:
>
> On Wed, May 28, 2025 at 10:59:43AM -0700, Adam Xue wrote:
>
> + Thomas and Aleksander (for EM919X related question)
>
> > Add MHI controller config for EM929x. It uses the same configuration
> > as EM919x. Also set the MRU to 32768 to improve downlink throughput.
> >
>
> This also affects the EM919X modem. So I want either Thomas or Aleksander=
 to
> confirm that it doesn't cause any regression.
>
> Rest looks good to me.
>
> - Mani
>
> > 02:00.0 Unassigned class [ff00]: Qualcomm Technologies, Inc Device 0308
> >       Subsystem: Device 18d7:0301
> >
> > Signed-off-by: Adam Xue <zxue@semtech.com>
> > ---
> >  drivers/bus/mhi/host/pci_generic.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/=
pci_generic.c
> > index 03aa88795209..9bf8e7991745 100644
> > --- a/drivers/bus/mhi/host/pci_generic.c
> > +++ b/drivers/bus/mhi/host/pci_generic.c
> > @@ -695,6 +695,7 @@ static const struct mhi_pci_dev_info mhi_sierra_em9=
19x_info =3D {
> >       .config =3D &modem_sierra_em919x_config,
> >       .bar_num =3D MHI_PCI_DEFAULT_BAR_NUM,
> >       .dma_data_width =3D 32,
> > +     .mru_default =3D 32768,

I cannot test this now, I need to look for the EM9191 that I know I
have somewhere, but this default MRU update feels right. Hopefully
Thomas can verify.
