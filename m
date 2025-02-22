Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9B146434
	for <mhi@lists.linux.dev>; Sat, 22 Feb 2025 07:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740210832; cv=none; b=Og0DHz+4khIynnpcAF9zULro9WYjFGE7ctfu6OErS5gPm34+8XBbi04helMX+esmfC7tfm9TKsmT9e6npKf9wpHuG4BI2AKSeemJZhMhApFwwZ3GT2IHgx5IgkXImVXK6wCwHYF8b8Vi5VcrcJcnr7B/68pKZUrGphiROmTXEc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740210832; c=relaxed/simple;
	bh=3PI9LZ/oRJ5/z4xPX/rDQSoMv39x7OHyntDEUSyHW6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ma2cR/iOOchlDrzR49HKuT69mdIaqkHk72RAk/y3asuFS/dSsxQlSgATwfFl66FJy3koQvUB8dWv+xJdS4aC0nV6RByDNzZTFcHYuFM91Eqh2bAp+6uBJZJKyZ4EDg69RDB6DQcTinhbAzTwgZLCxvI3Kqqt17mm4BSrFmXH0ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2f83a8afcbbso5048653a91.1
        for <mhi@lists.linux.dev>; Fri, 21 Feb 2025 23:53:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740210830; x=1740815630;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XgOwBKeJIC++w2hXb/vSOONHow+D0phrb0BF5CSn77Q=;
        b=HYSFvBJUX1cEeVmBrfFWQxFXBYpr0ysDHfWsi0cXMfGb7rXH2uJnH2RB+d6UT4ljC4
         uST9SFpPZSVY4AKgenv4HmbPfxR7PoWc2sZzV5nsQvqjVXz2uE7koxKfJB8CwI/3mp6I
         iuAuzSEshiPRRXGxTZeJpkNr9eUUmX+XRupMjnTWzQj1Ms3fzxlgPAKyoRuO/pSsLzxE
         MqSsnXi0jUwZziBotj4Zx1hPlYA/mRaPeglX+bIJznRwWkkTSMVgxT+5+qGC5CejtUJx
         MqkDAqRcL+MYc52n+OLsNLpeeb+NaVq4tlGNpfbB87uAxDBIR7T/KYf9os2NgjOQgKgU
         pc8A==
X-Forwarded-Encrypted: i=1; AJvYcCWPsFp+rj8PDwC5Mfve1U70Cf40FbGu+aChoVgN0auTH8c1eiFVi42Gn+oldVwT4du3f/k=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxh9uJsaSVW9Aq+iPeytsGosAYIrIrfuljKZwg+XJWBRrf/JPs3
	HcSIIQ7WUxYapVJ55FoiSe/Vqr4A+PbMewldegKeNoBe24Pmcvf+
X-Gm-Gg: ASbGncsBl+2dsEObKRjXKCNxwPkTrabioPYp+CnBKZce/ckWBA6WlRrGQKoAsCVN/YI
	I9DYCHO10VMefNG/ubjfumGT5NpewVLkXsnUj6HqHqpJPR0u5gN2pzxxUMf4HS4/2+1TyFN1GsC
	aXXeTd6eeH9hlVNQoJQXCKE2gNAe2ecsxiRZG3/ojauQavjj1DrJm+sD4xlVIk+zczPIJGvo1ku
	hXWt0UeznA1+FAQXdrPMWJYUbFXkqmSG0Kt9Ig305wZqV6zl/FUuDf/MtdZPDyt8s+/+xAPYJyn
	4DK1rcwLyJVmRY3QW//lAeBN6QyrwmSRTfhJbJ3BoRIBjCur+GyozPgUfX+h
X-Google-Smtp-Source: AGHT+IGBa2sUv3RRiY4KoSYaepkpXMCwBkVIcmu8mOMY6NF2khmYEc5MAiG7hTleu61bz7O7mg4ASQ==
X-Received: by 2002:a17:90b:3dc3:b0:2fa:1d9f:c80 with SMTP id 98e67ed59e1d1-2fcccc92715mr17441423a91.17.1740210829827;
        Fri, 21 Feb 2025 23:53:49 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-220d55b6ab7sm147107975ad.132.2025.02.21.23.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 23:53:49 -0800 (PST)
Date: Sat, 22 Feb 2025 16:53:47 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Mrinmay Sarkar <quic_msarkar@quicinc.com>,
	manivannan.sadhasivam@linaro.org, quic_shazhuss@quicinc.com,
	quic_ramkri@quicinc.com, quic_nayiluri@quicinc.com,
	quic_krichai@quicinc.com, quic_vbadigan@quicinc.com,
	quic_nitegupt@quicinc.com,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Slark Xiao <slark_xiao@163.com>, Qiang Yu <quic_qianyu@quicinc.com>,
	Mank Wang <mank.wang@netprisma.us>,
	Johan Hovold <johan+linaro@kernel.org>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Fabio Porcedda <fabio.porcedda@gmail.com>, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: Re: [PATCH v1 0/2] pci_generic: Add supoprt for SA8775P target
Message-ID: <20250222075347.GC1158377@rocinante>
References: <20250221060522.GB1376787@rocinante>
 <20250221215445.GA363532@bhelgaas>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221215445.GA363532@bhelgaas>

Hello,

> > > This patch series add separate MHI host configuration to enable
> > > only IP_SW channel for SA8775P target.
> > > 
> > > And also update the proper device id for SA8775P endpoint.
> > 
> > Applied to epf-mhi, thank you!
> 
> I see "[2/2] PCI: epf-mhi: Update device id for SA8775P" on
> pci/epf-mhi, but I don't see patch [1/2].  Where did that go?
> They seem related, so I would think we'd want to merge them together.

I asked Mani whether he would prefer for me to take the entire series via
the PCI tree, but he said that the first patch should go via the MHI tree.

So, I assume Mani will take it, then.  Mani, thoughts?

> Also, in [2/2], I guess the .deviceid change is known not to break
> anything that's already in the field?

Mrinmay, are you expecting any issues with this change?

Per the c670e29f5bfe ("PCI: epf-mhi: Add support for SA8775P SoC"):

  Add support for Qualcomm Snapdragon SA8775P SoC to the EPF driver.
  SA8775P is currently reusing the PID 0x0306 (the default one hardcoded
  in the config space header) as the unique PID is not yet allocated.

I think, we should be fine.  But would be best to confirm that.

	Krzysztof
