Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF2E53A6
	for <mhi@lists.linux.dev>; Thu, 14 Dec 2023 05:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y5qN0PEi"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-6da3a585c29so803750a34.1
        for <mhi@lists.linux.dev>; Wed, 13 Dec 2023 21:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702531301; x=1703136101; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+EpxA/oQdOsjZ3ZViQvYoAgBSxxBD7k1MJl0VMHDlZw=;
        b=y5qN0PEiZ2p+d0HgAgF+B0VQEZT+vVB9Q/sHdUCXUJ3Djiwl9toyZCXVdlpETyVss6
         Pv5xUBd0gtbP3Da9LMQe6odMldsIa5HqoDXLyMQiOWp2wR1mEru4IQoJbude6mnYnXnX
         W6AMssczgYMSRNAWioECMcelZ6bv9anukd7y2sG9s3Pzlgv+munTn3mIz3guPPQhanf+
         A8x8jZu5rI288ytqy/Y9iUglLxn9EOCN3r2dQ+HE2qW6Pq8hvOX5Qv48zlMDGXHQO6J1
         6stRRuvXnlAqI7U1aCOrFhNpIK6499F61Ci12HaV4yQuaw76vAm2VC1IFTW8HRvC/7jv
         Efbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702531301; x=1703136101;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+EpxA/oQdOsjZ3ZViQvYoAgBSxxBD7k1MJl0VMHDlZw=;
        b=R6Hq4BWcA9wtGnj5GCBVHxvoKXzjzp+i0nzhCbHhYGW9sryDRyQdwDz5s9lPqAXIb8
         AfCtjzmYw0XHr1v/ZZgZam6knptFrbYqcyV3KQiXzP2fRFTpzGfkb5vkGUhLQwiIfs50
         gvjw+vbgaCnvJb7/JRBS+LHUryOZ37eXlXASMXN7RjE97IP0K/0d7b9ogER6D5wCnnE3
         m+XY4RrrMeOap1yk/QwWcBIzZLagKTP+u328O4xBH8Zrlm7gcaUsA52CXpXHXsEEMbgo
         I7SPuMVq0xdgYPZv0XMyKUDu4KJXROpx4kuITpgK+r/4awRsYxpJEbqNIXBNWbQuuA7o
         Qp7Q==
X-Gm-Message-State: AOJu0YzG/WibJ5K+F/ckYPe6xQyq818awsPH52qRJCJKTeRwlIKbICZR
	zNm1BeL+2CJ812TA/zcbUIN3
X-Google-Smtp-Source: AGHT+IHVTBKVkd8pye6vCTczHqoOYH7dPwaMxiXCor8WD546zVln59FMabz/8e68g683gZ5DkOPHoA==
X-Received: by 2002:a05:6830:10cb:b0:6d9:e37f:5c54 with SMTP id z11-20020a05683010cb00b006d9e37f5c54mr9479978oto.9.1702531301439;
        Wed, 13 Dec 2023 21:21:41 -0800 (PST)
Received: from thinkpad ([117.213.102.12])
        by smtp.gmail.com with ESMTPSA id gu4-20020a056a004e4400b006ce4e3e2524sm10907827pfb.135.2023.12.13.21.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 21:21:41 -0800 (PST)
Date: Thu, 14 Dec 2023 10:51:33 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: lpieralisi@kernel.org, kw@linux.com, kishon@kernel.org,
	bhelgaas@google.com, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/9] bus: mhi: ep: Add async read/write support
Message-ID: <20231214052133.GF2938@thinkpad>
References: <20231127124529.78203-1-manivannan.sadhasivam@linaro.org>
 <20231213193103.GA1054774@bhelgaas>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231213193103.GA1054774@bhelgaas>

On Wed, Dec 13, 2023 at 01:31:03PM -0600, Bjorn Helgaas wrote:
> On Mon, Nov 27, 2023 at 06:15:20PM +0530, Manivannan Sadhasivam wrote:
> > Hi,
> > 
> > This series add async read/write support for the MHI endpoint stack by
> > modifying the MHI ep stack and the MHI EPF (controller) driver.
> > 
> > Currently, only sync read/write operations are supported by the stack,
> > this resulting in poor data throughput as the transfer is halted until
> > receiving the DMA completion. So this series adds async support such
> > that the MHI transfers can continue without waiting for the transfer
> > completion. And once the completion happens, host is notified by sending
> > the transfer completion event.
> > 
> > This series brings iperf throughput of ~4Gbps on SM8450 based dev platform,
> > where previously 1.6Gbps was achieved with sync operation.
> > 
> > - Mani
> > 
> > Manivannan Sadhasivam (9):
> >   bus: mhi: ep: Pass mhi_ep_buf_info struct to read/write APIs
> >   bus: mhi: ep: Rename read_from_host() and write_to_host() APIs
> >   bus: mhi: ep: Introduce async read/write callbacks
> >   PCI: epf-mhi: Simulate async read/write using iATU
> >   PCI: epf-mhi: Add support for DMA async read/write operation
> >   PCI: epf-mhi: Enable MHI async read/write support
> >   bus: mhi: ep: Add support for async DMA write operation
> >   bus: mhi: ep: Add support for async DMA read operation
> >   bus: mhi: ep: Add checks for read/write callbacks while registering
> >     controllers
> > 
> >  drivers/bus/mhi/ep/internal.h                |   1 +
> >  drivers/bus/mhi/ep/main.c                    | 256 +++++++++------
> >  drivers/bus/mhi/ep/ring.c                    |  41 +--
> >  drivers/pci/endpoint/functions/pci-epf-mhi.c | 314 ++++++++++++++++---
> >  include/linux/mhi_ep.h                       |  33 +-
> >  5 files changed, 485 insertions(+), 160 deletions(-)
> 
> Mani, do you want to merge this via your MHI tree?  If so, you can
> include Krzysztof's Reviewed-by tags and my:
> 
> Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> 
> If you think it'd be better via the PCI tree, let me know and we can
> do that, too.
> 

Thanks Bjorn! Yes, to avoid possible conflicts with other MHI patches, I need to
take this series via MHI tree.

- Mani

> Bjorn

-- 
மணிவண்ணன் சதாசிவம்
