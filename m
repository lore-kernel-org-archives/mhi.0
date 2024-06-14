Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634D4192B6E
	for <mhi@lists.linux.dev>; Fri, 14 Jun 2024 10:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718360265; cv=none; b=e4LkmoKwC2HVyqv56F2x9lBPhJEGuXs5UlhaQJSn95Jx4dh2erUoEMFq8vYCvUVjwx/+e2u6UQxnuX7xpCx5YD4NQfON45xLTFKT5RJ4glq+VrfAZjCfvBj715QWD2WlZsdWdy8GMANkKcZhSW+PWs8ghw8aunKapYZKiutum6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718360265; c=relaxed/simple;
	bh=wSEX76SS6fr4CDgB3qB9MkXvsfcJcUf7uUd5yTj+ct4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AN19kP9WjfEEBbZWCDpWlyabYasMm3XgY2bwHZL9RLkRvdEG1uD9/xC5Maze+V7glhRiG9hLRGwsE7rRTh5Qmz/p/9xdm8z6WlZJylVQ0AugmUp0q3EI57nr49IsUcFlPthQhAYAICEIs4mfIzvdRAO2IETbW5cc6s6AlbvRk2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jCO1IsIO; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jCO1IsIO"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-5b9a35a0901so707994eaf.0
        for <mhi@lists.linux.dev>; Fri, 14 Jun 2024 03:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718360263; x=1718965063; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=w/H/2d9XdF3obF+3FNTmlJL8KCsBJeWugy5QKBKiwJA=;
        b=jCO1IsIONc84M87Y+yL3lYj8n1F4cEHyuCKC1/JywztyoT8EU6XXJJldLw0UnMBabT
         Ve26qoKRxadZpgMeRBibfUcwMkJIUtVgBhjaA9DErlnssWtRZorwZE16JFaSDmvHxGp3
         1cDOGEdBJv+hoEdHLtT11JFRDJcgU6+0+EHiFOzySvJjUq8JFYuNti64mB0TA/Jr3HJ4
         RQXJi58qIOYrF3dO+k//jtxWzZOBZRkY+9MCQVFBfkmfOhVjSQzQOeRAOF7WlQLWjUC/
         kQ/BnUgkU5FeKbcf+PS3J6D8tM1+9QpPd5hdy3Xl7rqatu/oSsp1lrtofQCCyJSOVlYX
         kUEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718360263; x=1718965063;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w/H/2d9XdF3obF+3FNTmlJL8KCsBJeWugy5QKBKiwJA=;
        b=s2oJalJOvLqifh9iZk+95bOiOyC3txC0InNAOOEZOrWblyHkfyAJeC+4sC4y00KaHw
         qkiGZe85UsA2KA/dWa/2QD2Y5l3zTLLRD6rmJXGW7UEY8pNOj7XezC1hXlBwEhZe47Hi
         OQiP6YSktvd6Ra1A3r3ic20ruE8SW6z6IfKT2x/geGCAeLaLqN0wjUwQht/mw0y51gd9
         Ur2N3X2/7eL6+Xs0ArzSTm6LTf+lcBwDTt67V8ZqJbZLyBZobL8L1sskmWXZLtWVJDT2
         C++0iZ6QpsLATDihSKlHOJjsv1fKO251yNaxcIEHszyvIC+BFg7H3mO+SFDswvWoYcI6
         +CvA==
X-Forwarded-Encrypted: i=1; AJvYcCUqaEpnEaL0q7xWj08eHCZniRkqCU5ZgdTe6Y/o2oti0ENihr9/PrOsfYDuNTF+zXAnEe9uBnqyTnqDCzCFP/PTwpul
X-Gm-Message-State: AOJu0Yyf820owHMep7Klo0xNK3w+06+NDvlLaSdDKlAWgaKmkmzC1Jfr
	RJTdiT/M5q2vLIOamWZG4E914XBbzU8B65KcN2fTEuoZ4FFRLykSHgAT9mm9CvkBYhYZ7d2Fv0+
	qJ1jhFfUDJ85RADdK3KJqi0Nf/h/T/E8em946rw==
X-Google-Smtp-Source: AGHT+IGjZ+65LUQrBnv8lhF18GcfEKIQ5gp2Oitdnmye2HNUG8xMl8axcOZl5cgC1rBHopBtEPP+rSZngRbKTncQV48=
X-Received: by 2002:a05:6820:22a0:b0:5ba:e995:3f00 with SMTP id
 006d021491bc7-5bdadbb6681mr2135431eaf.1.1718360263117; Fri, 14 Jun 2024
 03:17:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240612093842.359805-1-slark_xiao@163.com> <20240612094609.GA58302@thinkpad>
 <87aecf24-cdbb-70d2-a3d1-8d1cacf18401@quicinc.com> <20240612145147.GB58302@thinkpad>
In-Reply-To: <20240612145147.GB58302@thinkpad>
From: Loic Poulain <loic.poulain@linaro.org>
Date: Fri, 14 Jun 2024 12:17:06 +0200
Message-ID: <CAMZdPi-6GPWkj-wu4_mRucRBWXR03eYXu4vgbjtcns6mr0Yk9A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] bus: mhi: host: Import mux_id item
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>, Slark Xiao <slark_xiao@163.com>, ryazanov.s.a@gmail.com, 
	johannes@sipsolutions.net, netdev@vger.kernel.org, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 12 Jun 2024 at 16:51, Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
>
> On Wed, Jun 12, 2024 at 08:19:13AM -0600, Jeffrey Hugo wrote:
> > On 6/12/2024 3:46 AM, Manivannan Sadhasivam wrote:
> > > On Wed, Jun 12, 2024 at 05:38:42PM +0800, Slark Xiao wrote:
> > >
> > > Subject could be improved:
> > >
> > > bus: mhi: host: Add configurable mux_id for MBIM mode
> > >
> > > > For SDX72 MBIM mode, it starts data mux id from 112 instead of 0.
> > > > This would lead to device can't ping outside successfully.
> > > > Also MBIM side would report "bad packet session (112)".
> > > > So we add a default mux_id value for SDX72. And this value
> > > > would be transferred to wwan mbim side.
> > > >
> > > > Signed-off-by: Slark Xiao <slark_xiao@163.com>
> > > > ---
> > > >   drivers/bus/mhi/host/pci_generic.c | 3 +++
> > > >   include/linux/mhi.h                | 2 ++
> > > >   2 files changed, 5 insertions(+)
> > > >
> > > > diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> > > > index 0b483c7c76a1..9e9adf8320d2 100644
> > > > --- a/drivers/bus/mhi/host/pci_generic.c
> > > > +++ b/drivers/bus/mhi/host/pci_generic.c
> > > > @@ -53,6 +53,7 @@ struct mhi_pci_dev_info {
> > > >           unsigned int dma_data_width;
> > > >           unsigned int mru_default;
> > > >           bool sideband_wake;
> > > > + unsigned int mux_id;
> > > >   };
> > > >   #define MHI_CHANNEL_CONFIG_UL(ch_num, ch_name, el_count, ev_ring) \
> > > > @@ -469,6 +470,7 @@ static const struct mhi_pci_dev_info mhi_foxconn_sdx72_info = {
> > > >           .dma_data_width = 32,
> > > >           .mru_default = 32768,
> > > >           .sideband_wake = false,
> > > > + .mux_id = 112,
> > > >   };
> > > >   static const struct mhi_channel_config mhi_mv3x_channels[] = {
> > > > @@ -1035,6 +1037,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> > > >           mhi_cntrl->runtime_get = mhi_pci_runtime_get;
> > > >           mhi_cntrl->runtime_put = mhi_pci_runtime_put;
> > > >           mhi_cntrl->mru = info->mru_default;
> > > > + mhi_cntrl->link_id = info->mux_id;
> > >
> > > Again, 'link_id' is just a WWAN term. Use 'mux_id' here also.
> >
> > Does this really belong in MHI?  If this was DT, I don't think we would put
> > this value in DT, but rather have the driver (MBIM) detect the device and
> > code in the required value.
> >
>
> I believe this is a modem value rather than MHI. But I was OK with keeping it in
> MHI driver since we kind of keep modem specific config.
>
> But if WWAN can detect the device and apply the config, I'm all over it.

That would require at least some information from the MHI bus for the
MBIM driver
to make a decision, such as a generic device ID, or quirk flags...

Regards,
Loic
