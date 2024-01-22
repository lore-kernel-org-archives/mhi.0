Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BADE17C8B
	for <mhi@lists.linux.dev>; Mon, 22 Jan 2024 07:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705907727; cv=none; b=DRjW7qZ8pRjcqqCKWvxAcuV5vNTTLeQY5i8PfOSLetBOOh5/XK4BHGg+9in2Hc7WQ2j2FAUwbuF8Bjpudyv+ivcS40TopR24cxAgjBFXB6X+jZclDYXMx8gl1D3Op1npbXbzNq9sCtJpihB41IG7y773PgfDvjnpf7JjjS3UkYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705907727; c=relaxed/simple;
	bh=YCFZKMxT5pftMLplwAg4YBXUQE31/i4Ak24i9qQ3Vi0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qhTvpFGdzAIpVOcfLmKqfxzUEkKfE6TiJfKaOfa2gfzrjvlvC7TCZtinfTgU2p/ldYztc5Fbn+uhS218x/A3ubbhoJWmI81fbxKJBpM6tOOdtkiiDVvGEE53WEk5hzD+S+FfXG7sh6jPlkMEB8prpF1Wt98aSzlYUEpVB20aR4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lzmWQC9E; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lzmWQC9E"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40e76626170so32941525e9.2
        for <mhi@lists.linux.dev>; Sun, 21 Jan 2024 23:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705907723; x=1706512523; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lHP43ExYfIoYQZnh2Pw1TOnG0wcXeFiwfIKZwpRcOpg=;
        b=lzmWQC9EDIRdRlZL2uDbDeS6fUu6/HjxB7lTv9LsbTykTIwPB6ad9hXT5+NNxCQ23l
         Wu7SpxqOCaZdCLk4JcG8E5Oh1vL3xeMqtFDK/C3hiY4xUduv1EHHaJO036Q4LOO78ZMi
         b8Vw0ofD4si7rSOdqQ6y2dk3Zt1+eajCb5RdksYdnoUdXqH4WizhevOgHVGqrnn5qfIz
         JxhLWPQnvv4bc+Dsktid0p7i//k5+9ACEWBH59a1rkWx739lliB7wysIGgD130k7VHm4
         Zz3qULZBQ/xC1/3FTSaw9hwM+TANnEnmWIrt8diCSwpcPJ0fqXyGwjRsNfuWlJmanTmG
         h5bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705907723; x=1706512523;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lHP43ExYfIoYQZnh2Pw1TOnG0wcXeFiwfIKZwpRcOpg=;
        b=m5WWHpqcrdRw2EpyFX53pDeHsdnOr+LIFsTABs/en6x59Iamx5VAIRzrtFMV1Wgzab
         r5GR9ZPvvp4xkP9jtctFnTzJvrMm7YcLC31x+fFwXM10FNRQmXFL0F72DJ95kDs7R7Ne
         RuBE+oDTRWNhroARJF+Bk1p6oVqkhW4RWDhcxIYD/ov9pTyBJx6++igsLX2VySWOHYoc
         48KmnsKkpahcGY+5RaWcWZTBwjdQ7RRfDSkMytbjiO8E2lXAcpGQObn58z9RTKVWu4Kl
         4vIXwVwdtGP++zV8wpCXx2uZVKkkL10z7TiMkWOC1QSk1Jg9UbzSwvaBy4r6FMIHzd5+
         Plwg==
X-Gm-Message-State: AOJu0YxS0foWU+yrn03ZXCx7uQsKn1AQgi7MpZmPLKIqB8oGPLzgKB8o
	RG+adOkc3HJqsaUwOFZW1G3YXFO+5Orr7kT4gjUeOrzI+gQdFUUnyTnz16gl11g=
X-Google-Smtp-Source: AGHT+IG5Alz3MHBgjGmE6oE6CLb/yvjcodQR+lNTfG+1BAcFnW7rpEcukUwXKZxigVRf06Emw/Yw6A==
X-Received: by 2002:a05:600c:498a:b0:40e:5a80:6177 with SMTP id h10-20020a05600c498a00b0040e5a806177mr1997539wmp.69.1705907723421;
        Sun, 21 Jan 2024 23:15:23 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id w4-20020a05600c474400b0040d5ae2906esm42185282wmo.30.2024.01.21.23.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jan 2024 23:15:23 -0800 (PST)
Date: Mon, 22 Jan 2024 10:15:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Erick Archer <erick.archer@gmx.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Dan Carpenter <error27@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: ep: Use kcalloc() instead of kzalloc()
Message-ID: <43614a09-d520-4111-873a-b352bd93ea07@moroto.mountain>
References: <20240120152518.13006-1-erick.archer@gmx.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240120152518.13006-1-erick.archer@gmx.com>

This code does not have an integer overflow, but it might have a
different memory corruption bug.

On Sat, Jan 20, 2024 at 04:25:18PM +0100, Erick Archer wrote:
> As noted in the "Deprecated Interfaces, Language Features, Attributes,
> and Conventions" documentation [1], size calculations (especially
> multiplication) should not be performed in memory allocator (or similar)
> function arguments due to the risk of them overflowing. This could lead
> to values wrapping around and a smaller allocation being made than the
> caller was expecting. Using those allocations could lead to linear
> overflows of heap memory and other misbehaviors.
> 
> So, use the purpose specific kcalloc() function instead of the argument
> count * size in the kzalloc() function.
> 

This one is more complicated to analyze.  I have built a Smatch cross
function database so it's easy for me and I will help you.

$ smbd.py where mhi_ep_cntrl event_rings
drivers/pci/endpoint/functions/pci-epf-mhi.c | pci_epf_mhi_probe              | (struct mhi_ep_cntrl)->event_rings | 0
drivers/bus/mhi/ep/main.c      | mhi_ep_irq                     | (struct mhi_ep_cntrl)->event_rings | min-max
drivers/bus/mhi/ep/mmio.c      | mhi_ep_mmio_init               | (struct mhi_ep_cntrl)->event_rings | 0-255
drivers/bus/mhi/ep/mmio.c      | mhi_ep_mmio_update_ner         | (struct mhi_ep_cntrl)->event_rings | 0-255

The other way to figure this stuff out would be to do:

$ grep -Rn "event_rings = " drivers/bus/mhi/ep/
drivers/bus/mhi/ep/mmio.c:260:  mhi_cntrl->event_rings = FIELD_GET(MHICFG_NER_MASK, regval);
drivers/bus/mhi/ep/mmio.c:261:  mhi_cntrl->hw_event_rings = FIELD_GET(MHICFG_NHWER_MASK, regval);
drivers/bus/mhi/ep/mmio.c:271:  mhi_cntrl->event_rings = FIELD_GET(MHICFG_NER_MASK, regval);
drivers/bus/mhi/ep/mmio.c:272:  mhi_cntrl->hw_event_rings = FIELD_GET(MHICFG_NHWER_MASK, regval);

That means that this multiplication can never overflow so the patch
has no effect on runtime.  The patch is still useful because we don't
want every single person to have to do this analysis.  The kcalloc()
function is just safer and more obviously correct.

It's a bit concerning that ->event_rings is set multiple times, but only
allocated one time.  It's either unnecessary or there is a potential
memory corruption bug.  If it's really necessary then there should be a
check that the new size is <= the size of the original buffer that we
allocated.

I work in static analysis and I understand the struggle of trying to
understand code to see if static checker warnings are a real bug or not.
I'm not going to insist that you figure everything out, but I am asking
that you at least try.  If after spending ten minutes reading the code
you can't figure it out, then it's fine to write something like, "I
don't know whether this multiply can really overflow or not, but let's
make it safer by using kcalloc()."  You can put that sort of "I don't
know information" under the --- cut off line inf you want.

regards,
dan carpenter
