Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC5A2063FF
	for <mhi@lists.linux.dev>; Sat, 22 Feb 2025 16:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740242677; cv=none; b=E2rHQ0dlVTvZfkhlbkh576E3ge4Z96sdCrQDu6nXPX6Mm8JQHJnizI5Hwf09ahw/dvUnN4n5HXFERMvf6ga9SIs0wfNL83fzjPkYd6wNiKNAt9O8YNHO3AJfEw35pzrETNAC1rB0XoE0NGe9ac39Nvwite6PPurZyWaKmuIrcJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740242677; c=relaxed/simple;
	bh=L8IhYJZqTL+VAFgPJyw5O+dgm0yXbcW4d8tIgufYAhE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lCutJnM2W35cMEItjyzOmfyAI2gU3ldKSwOEvxMa/RruBYkVJWeHm7ITJhy8vH/Prf2FkXONIwlYbDf4sxczShRdiif+iQRoNmDyxNyPtcKVfBXauRAyky+PDj/6JEJJSTfFckwHsRNuGzuc1oIv/MdLLXF5BITzmPgTi/QafMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OALcWRM1; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OALcWRM1"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-221057b6ac4so59028495ad.2
        for <mhi@lists.linux.dev>; Sat, 22 Feb 2025 08:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740242673; x=1740847473; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9f7uZjtHK+lQIbRAC4oC1UZT/44Vy8koxrXiqt6OwY8=;
        b=OALcWRM11B5QsPd5l14LrnnxnHjS6VgYieZjdZ3QlDt3KKbUWMtE5PtkPpuQA0+7v+
         PoZFdJqQZvxZsq+68JPDvA1Cp2WtDg1pA+HW/6/Xc++1AdqpEDipvEgstXLqlJnsQeId
         oFgvOyqyOyDSNi+8zo8QnZu855Brr2nV6AZUlU5MkBYp6JetNqHMlBflCNJ/R7Nu7J9q
         hgiqQVo7WRuSNNNWMbrIqV2IAqiPpZGP0f7QH7xdLkjL9fUWM60nIfmjqK7KkkBElnOr
         IkXh4HQAFZYSDHC7BjM6V4vgH/GcoobKfK/p3XkDeR/U06uTMkZQ2A2NgG06YzLhRU2c
         95RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740242673; x=1740847473;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9f7uZjtHK+lQIbRAC4oC1UZT/44Vy8koxrXiqt6OwY8=;
        b=lckaWTJsKMXGmg4++u7Umvd2XJ5nOMHerZfFhe1jxJs/MK/KwmnuQtT7JScylvTCCF
         z0xF7HfM1BkfBOC5UPSu/nynJFjQciowAEE4EqutvFXr801zUEWaiqXwjIKIGhP4dcDg
         FYptHxgWtHE3onOTYTJbFJ9CDyGXNmmf+HKfA6RGhHVWhGZlwWwpJ2uVQsFoef5dQt0h
         A+V69DY23ITYRTcVVu2GYdRQsJpQQRWUqhOmqd24ignodxx3Y9ZK1pTb/Fsfe/F8bh9I
         fbtCnM16Ff+aTD9iqlsFGPQ/MArAeviryFN4Ik1N0YKHzHOv8VJ41NSecUZBZ8qpwAQz
         E1yw==
X-Forwarded-Encrypted: i=1; AJvYcCXuyA4qKKYKsty2GDe9nKGEU6tobfQQkYSLqesEWePPwhROFVk9JNzFSg9VYmMXo+ZHnbM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/F23JEvN2ZHPljbwZ0HaEK3PeITEvPoY0DWhklKnWZCQ1+Qmx
	Vl+jr2prLBJNfUx40C+G6PZUWdUxJorkh6o9wJ5OYETdXih1ibsVK22Ryj15pQ==
X-Gm-Gg: ASbGnctkw6lxy2OtQWRjJF/jegUu7oxUtRB8nTYFLS2h1iJYGkp2qmHJ3MZ91z1NTzl
	AJAUqbwl57SJYa4XtAM+L9ZIPzC3lkxprdShf7KycD9YeBJnpPnajIk9Ef8xFKjsPmV+DVAUNdp
	FL1zuzZg6z4MMKPngYGmTogdm0RKlcYQZW+4pMR5qYyDCgTaKRf0YJY6zp+WzjqmT5o5qCVVm+n
	niVCvj7Ic+Y/+wS3MNswYMEoNm/R+iwoTksVSQowfxYeuXG3WSmdgqm3khw1x0WsujzwYlIubXA
	yKm1q8xyg7/jziISpyvVsm8HCpfsZ6I4WQMPJQ==
X-Google-Smtp-Source: AGHT+IGZNd7JbH7rVNtNivVdsM8aE1a1IdZv+AIk3ODGAEKzzGY0D6UbBx86tKJ6P8fBBfE/PVEofw==
X-Received: by 2002:a17:903:2f8f:b0:220:d7f9:9ea8 with SMTP id d9443c01a7336-221a10ee47amr93976375ad.26.1740242673342;
        Sat, 22 Feb 2025 08:44:33 -0800 (PST)
Received: from thinkpad ([120.60.135.149])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d537c921sm153046605ad.104.2025.02.22.08.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Feb 2025 08:44:32 -0800 (PST)
Date: Sat, 22 Feb 2025 22:14:26 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
	Mrinmay Sarkar <quic_msarkar@quicinc.com>,
	quic_shazhuss@quicinc.com, quic_ramkri@quicinc.com,
	quic_nayiluri@quicinc.com, quic_krichai@quicinc.com,
	quic_vbadigan@quicinc.com, quic_nitegupt@quicinc.com,
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
Message-ID: <20250222164426.5esw7aygsz6eouvz@thinkpad>
References: <20250221060522.GB1376787@rocinante>
 <20250221215445.GA363532@bhelgaas>
 <20250222075347.GC1158377@rocinante>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250222075347.GC1158377@rocinante>

On Sat, Feb 22, 2025 at 04:53:47PM +0900, Krzysztof Wilczyński wrote:
> Hello,
> 
> > > > This patch series add separate MHI host configuration to enable
> > > > only IP_SW channel for SA8775P target.
> > > > 
> > > > And also update the proper device id for SA8775P endpoint.
> > > 
> > > Applied to epf-mhi, thank you!
> > 
> > I see "[2/2] PCI: epf-mhi: Update device id for SA8775P" on
> > pci/epf-mhi, but I don't see patch [1/2].  Where did that go?
> > They seem related, so I would think we'd want to merge them together.
> 
> I asked Mani whether he would prefer for me to take the entire series via
> the PCI tree, but he said that the first patch should go via the MHI tree.
> 
> So, I assume Mani will take it, then.  Mani, thoughts?
> 

Yeah. Patch 1/2 should go via MHI tree as it is purely an MHI controller patch
(a.k.a host side patch). Whereas patch 2/2 is an endpoint side patch.

> > Also, in [2/2], I guess the .deviceid change is known not to break
> > anything that's already in the field?
> 
> Mrinmay, are you expecting any issues with this change?
> 
> Per the c670e29f5bfe ("PCI: epf-mhi: Add support for SA8775P SoC"):
> 
>   Add support for Qualcomm Snapdragon SA8775P SoC to the EPF driver.
>   SA8775P is currently reusing the PID 0x0306 (the default one hardcoded
>   in the config space header) as the unique PID is not yet allocated.
> 
> I think, we should be fine.  But would be best to confirm that.
> 

SA8775P with upstream endpoint is not used by anyone outside Qcom till now. So
changing the PID is safe.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
