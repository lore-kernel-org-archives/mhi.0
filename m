Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A98D7440B
	for <mhi@lists.linux.dev>; Fri, 19 Apr 2024 09:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713518799; cv=none; b=H1REAi6D+k82gHzBGTKsPu7SQ/kMn34+oCTGJYBwMtkLqtLYylKegl4RjyLIJvn6UBvTm/krRE01SyrmmrIQmRplRrahetYa3HZF94eKXsQAS740XR1YlJ8FUparepHjQ314BT2zy2CaemteXy0aaarsrVLiDhZbEtE4fHa660c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713518799; c=relaxed/simple;
	bh=nEQE1bgcahfGAeEROm4nIOqoBwmVPoodJbRFX+eJFiA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J5dL08F+gydH1B0I6sS5mWSvw0l+QvBzFE8EcSm8QmgHMolHoYNQBkuef0yES6dBrCkCpZu+PMR6lHcVCE95N8pZT3kgKW3E6J/gotYjnCTIG8GZoiEZHVi6PcjE/eiFnkvxxHIxdn9/Mzr8tAUmiVEj/FA5b8LsIDXX/ldXFWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Glqnyy6X; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Glqnyy6X"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-6eb82af305dso982800a34.1
        for <mhi@lists.linux.dev>; Fri, 19 Apr 2024 02:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713518796; x=1714123596; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f2k6wBjEwpSJIIcZ8MPn1YroTKsxMSXWDSsv1Yc3sRE=;
        b=Glqnyy6XQ1GZiZbzzpnYGVugihqGD+8Z1i0I3sm9To9/oDgNf6UT3zw5CuObYClY6/
         vnVsDiVAA3DAmqkwssWSv6IgDcyDrICp0pd6BrlpaD3ycH6J666PKXhvv6yo0WazsqYK
         bXnBK6XacwBhua1/fo1cIwfzai2bL8SaHtgHGe7IPwyOCPbG/loq/7BHaf9xWs0SmrT7
         9tkYDg19fkc7WS6EgnCA4pu7nHdAOrwM4E/SGWD3TZBks5TN4ZNFsm7LLE73GCcnnWFg
         1mTtL/TsyGsoGns4OeKtoaPeaSb/mLqzdIrTnQLUY+XW6rb9QbCHav/lQTT1idD3uoej
         myhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713518796; x=1714123596;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f2k6wBjEwpSJIIcZ8MPn1YroTKsxMSXWDSsv1Yc3sRE=;
        b=vtmfJxY4S41ZvMyzo98dILJWs4N+zZxcpnvHb/+U5dHzg9YKVXClwlrsCkbaXdgZru
         sEWxMsGJZxKZDBWLb+z0oz12YJyFiV5ZdqhFAr/HXlip62u1UmP3RQkuIzI5xiz1W3+8
         WzZkwiWVew3MVFK0tr9WMnv0nnybFyCqT80+Wd3M/nKTYqwJ2o0Bp1EENiUejjejWT+T
         EpAO9MuClWpy1uzHO8XEqRd9SFgOwnhO+kK7KRAlCDO6cLCsgbJTlzpToflrvoF95HOr
         ZKZ9WTZLYkz8NLnld1MnD5yREmiHeiumPB4t0fs3+TEJSfNofyjXyS6/39cZk1buiVWL
         enNQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1x6yA15Wg3HXdNft3UQYDPd7zkNEuzkGj9aEVgIGxhcSdi+M6aN8K/QEDENk4eSnXIB8zISlRG6q6jv6SEmRzNZeh
X-Gm-Message-State: AOJu0YwVG3hiXuSKUJnfQPpGUMYlXJ9yPUZBn8PwYJQhKuuT+9UGNP2J
	g4v5k+6RlO5yG5M7Dts/5tBLKQY/udZxeTZnGrHC0fTmA1zzYjyfqCQNt24MRA==
X-Google-Smtp-Source: AGHT+IGPIPPIitXX4Yw0hrulDjF2tnglO0Qdegfb3hKjRqYEF4E5wtIteUhkJR61YJc1aF7VAjq+9A==
X-Received: by 2002:a05:6870:12d9:b0:22e:c37c:453d with SMTP id 25-20020a05687012d900b0022ec37c453dmr1625314oam.30.1713518796449;
        Fri, 19 Apr 2024 02:26:36 -0700 (PDT)
Received: from thinkpad ([220.158.156.51])
        by smtp.gmail.com with ESMTPSA id z17-20020a634c11000000b005f0793db2ebsm2715872pga.74.2024.04.19.02.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 02:26:35 -0700 (PDT)
Date: Fri, 19 Apr 2024 14:56:29 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jingoo Han <jingoohan1@gmail.com>, linux-pci@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	mhi@lists.linux.dev, linux-tegra@vger.kernel.org,
	Damien Le Moal <dlemoal@kernel.org>
Subject: Re: [PATCH v3 3/9] PCI: endpoint: Rename BME to Bus Master Enable
Message-ID: <20240419092629.GA3636@thinkpad>
References: <20240418-pci-epf-rework-v3-0-222a5d1ed2e5@linaro.org>
 <20240418-pci-epf-rework-v3-3-222a5d1ed2e5@linaro.org>
 <ZiEy4EVcVpUry9qn@ryzen>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZiEy4EVcVpUry9qn@ryzen>

On Thu, Apr 18, 2024 at 04:49:04PM +0200, Niklas Cassel wrote:
> On Thu, Apr 18, 2024 at 05:28:31PM +0530, Manivannan Sadhasivam wrote:
> > BME which stands for 'Bus Master Enable' is not defined in the PCIe base
> > spec even though it is commonly referred in many places (vendor docs). But
> > to align with the spec, let's rename it to its expansion 'Bus Master
> > Enable'.
> > 
> > Suggested-by: Damien Le Moal <dlemoal@kernel.org>
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> 
> Reviewed-by: Niklas Cassel <cassel@kernel.org>
> 
> 
> Outside the scope of this patch/series:
> Do we perhaps want to add a bus_master_enable() callback also for the
> pci-epf-test driver?
> 

Makes sense to me.

> In my opinion, the test driver should be "the driver" that tests that
> all the EPF features/callbacks work, at least a basic test "does it
> work at all". Other EPF drivers can implement the callbacks, and do
> more intelligent things, i.e. more than just seeing that "it works".
> 

Agree. Feel free to send a patch :)

- Mani

-- 
மணிவண்ணன் சதாசிவம்
