Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4CFF39FC3
	for <mhi@lists.linux.dev>; Wed, 21 Feb 2024 06:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708496426; cv=none; b=C2l+SQJUJDx+rAcWZcqnH+QLtJnRhV5+2rnwPMrMum9GadNcYuGkb+qXM4uY16rZUkczntpAuQdV6a7UfeKNuAmlZfJ9sA8miUZldS71ReDUl7MPRxHUwfkm77lnpn1vJYRwuOLuaSDf3tYyuDJLojkgM+OGJpWBbs3V6zZ6+Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708496426; c=relaxed/simple;
	bh=Aa84HSv1+2OvUetKNGlbuxpski5nWr6VCsHSEhRtETY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DL3rf3Z7Ec/O+X6nMRGPVj8PTHOxEj0FYBFfudXNbMRTUFvMNqqdml80nIRKfv5CFCN5jy5MtwIbQPd/Xh1VeUt78Qqeq6W0rMZipf4IUCsq3OOLRZCDGVrn90TREpt20qAKbcOTSFBwYACKijwPE6100eBdzv2mlLFMqVocxBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v5C3Y7+H; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v5C3Y7+H"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-563d32ee33aso6891827a12.2
        for <mhi@lists.linux.dev>; Tue, 20 Feb 2024 22:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708496423; x=1709101223; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z7BDvVnOFI8EfULdSJBhx0Uoarr0dwLKho4DFLKCbPE=;
        b=v5C3Y7+H6qMfbGO132fcZGNViMN8G/koqEqpJefIYrlEmKsrRH+ZVqFADTD+slnjZW
         XFqs7Y5a7fa1ycgiJ+CXmfzcI5SjZJ6s7lOi5Nngr4qfDkxdL9hKssG6W2kWENSQYIcB
         dLCkaDaIjuF02/8cbPh8HcYQDSoJ7cUBpOCm6Wx19XU0T4lIRk3NlnWMv+Mur6l8mR9/
         w4Frq/iNmqJYKJu41tqtZ9/PS5HrCYIjDK1REZtD5COp86hkINa0Q7LLwq/0ZR+m9CZz
         MKuku6BqEwQrBlCvzBB5hPWPpCx37Tgy5qewYE04VMiwRqiMhbJZbZH/qhMIVNPIf5Vm
         RW+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708496423; x=1709101223;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z7BDvVnOFI8EfULdSJBhx0Uoarr0dwLKho4DFLKCbPE=;
        b=gW3BEHJeIn/tsA/mroe8dAKq1QBJeJBxMZ+IZG0H0wh+I5u73lVbVa6/0RpOzpkFd3
         BY+ZuoatrntSXUUBYbY5CbDze+NnXkkjvek3iZFgDgaGeeIZMagqqhqZH8N+d7//Scnq
         /YXYLXNc6Dw9WFq3kQs1S60o5NMXpNFVBxIBbP9z1GdGu2SV2EXdnV2yAFeb0NhYJvyu
         hky/rhVkwoQcuRJVgcPbSQEAiHd3RMe9OalzMn1ij/EjlJUN5cqtso0+zYLhLbSSFB1I
         Y6lZ4U1drwo1OVzYkiP51h3ejOD4IlWE5XVAqi185uGd/g+HFK+JrhurjMYosyDSC/Cs
         8HUw==
X-Forwarded-Encrypted: i=1; AJvYcCXpbghptTGJTIS0/6Gn8W/TmwZil0LIO5FAPZbE0n3ZWDPWnRbBVduxl+Eyf6jQcWLP6tJUYwQ0FJg+8t3Tp6Emf0UY
X-Gm-Message-State: AOJu0YxHplSky1Uy1MXxw6tskmUJ2y+m0baal5VbY4sFXVfZI/wSBSuj
	zU3AGS5ndl+GGzo0WeDggjIL9G7D8lGiwPVlsyMSBxvIO5PEHN4Pvi7ckYbfSrRdYUyEQq8E6Sw
	4
X-Google-Smtp-Source: AGHT+IEo1seUMFO75qlMhw5YgJjVl6BOsKnCUA2331SaQXoJuA959myuBNCXTpBpJJToej8dHPipIg==
X-Received: by 2002:a05:6402:17c4:b0:563:ccd1:26bd with SMTP id s4-20020a05640217c400b00563ccd126bdmr9951812edy.2.1708496422990;
        Tue, 20 Feb 2024 22:20:22 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id c1-20020a056402100100b0056486eaa669sm2266459edu.50.2024.02.20.22.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 22:20:22 -0800 (PST)
Date: Wed, 21 Feb 2024 09:20:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Alex Elder <elder@linaro.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Erick Archer <erick.archer@gmx.com>, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] bus: mhi: ep: check the correct variable in
 mhi_ep_register_controller()
Message-ID: <bebcd822-d465-45da-adae-5435ec93e6d4@moroto.mountain>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

There is a copy and paste bug here so it checks "ev_ring_el_cache" instead
of "ring_item_cache".

Fixes: 62210a26cd4f ("bus: mhi: ep: Use slab allocator where applicable")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/bus/mhi/ep/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index 8d7a4102bdb7..f8f674adf1d4 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -1497,7 +1497,7 @@ int mhi_ep_register_controller(struct mhi_ep_cntrl *mhi_cntrl,
 	mhi_cntrl->ring_item_cache = kmem_cache_create("mhi_ep_ring_item",
 							sizeof(struct mhi_ep_ring_item), 0,
 							0, NULL);
-	if (!mhi_cntrl->ev_ring_el_cache) {
+	if (!mhi_cntrl->ring_item_cache) {
 		ret = -ENOMEM;
 		goto err_destroy_tre_buf_cache;
 	}
-- 
2.43.0

