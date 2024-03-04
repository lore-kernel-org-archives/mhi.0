Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6BCCC147
	for <mhi@lists.linux.dev>; Mon,  4 Mar 2024 06:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709533151; cv=none; b=q29d2/nFc4cAvr6qLgvEXF1LnqnksB/jtMKKZ2JXflvnb8GC3bbicN/ZnN0q29OP+MShJEgR+gBjdLhZmIAGFDHAxmCbzIn/qBisObicFDiN1eexySyiCjez84ckdCK450Fcdc6TCM1ZjqXS7vUQKF2ZCXVIOfrWHxPB1WDPBkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709533151; c=relaxed/simple;
	bh=oDnfxJ4A8v+Y+oMepOulbgQydBSN2yDgubk57DJ4nVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rYR/iTDCYepEfg+1r5Cap4jktwWtDJ7ekUbJvyuysd0j61/aYKYMIQRYt+JFMjh6MLx8wWqQa2eP9pjkLcif2Hx1OgtFgfTpZkL34QmM+WGzbKcJOOzQnCmVMSXpW8lMxlx6MKx1EqFLiGTUieZwz9PVr/pzFEXN1lR7eMmEJVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i+V2eoSn; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i+V2eoSn"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6e5c81ccfb9so1557316b3a.3
        for <mhi@lists.linux.dev>; Sun, 03 Mar 2024 22:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709533149; x=1710137949; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yY8EnFgYAlXlPqttQTMQ9X4CPIclgM7lc+6szk0vfN0=;
        b=i+V2eoSnM3HbDalfyGBqpFp19/ZOciMvTSC7VN76kaufPaTaVeIaj8oZQjWOVfumUd
         Hay5WsjhcmmRosV8HC4KGluWCJcqKjE4j9EOcoIHQ0KFaEvoKbUKdQqNRUsHaD8yuYCI
         91B3XJsaF94FIePge7F9kolzDCAFROV/zoQdZBzOtv7eJkvuGaIc/6IuhxNoTTiPqNi0
         2NjuZdZAtn0FtFfzdeHUZPRnELl1iOhQknSiyDUTknUu5kROHUsaDs25AYMyqV9B3aeK
         3WmeT6SEY0VwGRSYUAj+c2JKRwZ2xf+T8gujAA4X5oBoa5kSaln8gLuq87jpLzmkSWVS
         FjTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709533149; x=1710137949;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yY8EnFgYAlXlPqttQTMQ9X4CPIclgM7lc+6szk0vfN0=;
        b=GzTIJ30cQl90J+gE/omfwYXzzlbwSsVB/Gt5rx0+FXVMqV/0N50f0RbW9UFH1S8CFW
         NUdOK0PF2hJlbL6x5HHOs2QX024A0IVKeNor6hSXP9m9vrCYANLe01HZWU8xkOXvLzF8
         WezSJh/Z1HQcPLnhB3z/SDlii1akfK1iB2RPu4jK+LKpyN+iTlD3jXP9lUXy59WdHweR
         GOFHT0/S1NTvfTUnSrZ7dYrjP4eiw9QNoa3hR0eM9RZNLNTPPGyLL11yBeNx9w1WXq+j
         ez5OBbc4di1M9TBi1QIfALvm1QVto01D92jG8Jr6pl76M4oqs1VBQRoypKE3SNHgmUj+
         NNAA==
X-Forwarded-Encrypted: i=1; AJvYcCVHVZg0UcHwsR9nYNPzx30KvKDQScPo4cxH0hQRz9xZLkLcsGihW8uxNP1k5XQh2eQJLasf7cqQMjItDnFsJlp6gKLs
X-Gm-Message-State: AOJu0YxiA6/DfUDzjLMm+4AESl7EJWikgn30IL4wAGvV8GlbzpRYuouA
	XNUCQOk+/mi4/OjIzo+RmjWo2kyR95b9hyRVBMqxp8sg3M1XewLnWIBCZNJH9g==
X-Google-Smtp-Source: AGHT+IEGGhWfMbQLfvF9uJtsc7Y6qkosURA49AQc9jMC4u8Vp5VihTolBAdcYaH2nlvvK6/zVXQicg==
X-Received: by 2002:a05:6a00:2e26:b0:6e4:f32a:4612 with SMTP id fc38-20020a056a002e2600b006e4f32a4612mr8718386pfb.16.1709533149188;
        Sun, 03 Mar 2024 22:19:09 -0800 (PST)
Received: from thinkpad ([117.207.30.163])
        by smtp.gmail.com with ESMTPSA id k19-20020a63ff13000000b005cfb6e7b0c7sm6825218pgi.39.2024.03.03.22.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Mar 2024 22:19:08 -0800 (PST)
Date: Mon, 4 Mar 2024 11:49:00 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Jingoo Han <jingoohan1@gmail.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Serge Semin <fancer.lancer@gmail.com>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
	Siddharth Vadapalli <s-vadapalli@ti.com>
Subject: Re: [PATCH v3 3/5] PCI: dwc: Pass the eDMA mapping format flag
 directly from glue drivers
Message-ID: <20240304061900.GF2647@thinkpad>
References: <20240226-dw-hdma-v3-0-cfcb8171fc24@linaro.org>
 <20240226-dw-hdma-v3-3-cfcb8171fc24@linaro.org>
 <Zdy8lVU6r+JO6OSJ@lizhi-Precision-Tower-5810>
 <20240227074533.GH2587@thinkpad>
 <Zd4eLBXscaV1WkbV@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zd4eLBXscaV1WkbV@lizhi-Precision-Tower-5810>

On Tue, Feb 27, 2024 at 12:38:52PM -0500, Frank Li wrote:
> On Tue, Feb 27, 2024 at 01:15:33PM +0530, Manivannan Sadhasivam wrote:
> > On Mon, Feb 26, 2024 at 11:30:13AM -0500, Frank Li wrote:
> > > On Mon, Feb 26, 2024 at 05:07:28PM +0530, Manivannan Sadhasivam wrote:
> > > > Instead of maintaining a separate capability for glue drivers that cannot
> > > > support auto detection of the eDMA mapping format, let's pass the mapping
> > > > format directly from them.
> > > 
> > > Sorry, what's mapping? is it register address layout?
> > > 
> > 
> > Memory map containing the register layout for iATU, DMA etc...
> 
> the world 'map' is too general. can you use 'register map' at least at one
> place? There are bunch 'map' related DMA, such iommu map, stream id map, 
> memory page map. The reader need go though whole thread to figure out it is
> register map. 
> 

This is what used from the start and also what "mf" corresponds to. So I had to
use the same terminology.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
