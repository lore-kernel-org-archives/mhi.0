Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A357138DC8
	for <mhi@lists.linux.dev>; Fri,  8 Nov 2024 12:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731067382; cv=none; b=DbHq4bgAEy0tN4gR00Z8ZCXnEZgX+5uOFFxVHPiaYh8yLv0WGIgHS3KZ285TJiv94agJkDOLg6/fSK9nkEFvypnosfo6PZ58A3kMg7fZP7Nq0qrdk6qxJSSD8Cxs+Gq0ImO6+ipho331EL8ifgM62TVwh9J4UyS/KCnPsJufXis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731067382; c=relaxed/simple;
	bh=cfqzgZe2mrrECgtpPInoahr3Fmn1D6nVAvKqs3Z3phI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Eix6o4VVafG1G8ISaeCP1FH7tlRhIt0ElU7TvNeP9Ecz6Z0dcf4E4lxck+rUS3c+XAKSxWppzdiS+h+QdJVPw/xY4DtqinE+bJO00tgD8bzwDfMqTpSs4HGJcgGU0aMbpUy5kvtfTR/KYgIbloJGK3FTKpTft3GCi2hfu1MuTA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S8sawRLC; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S8sawRLC"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a9a6b4ca29bso275257266b.3
        for <mhi@lists.linux.dev>; Fri, 08 Nov 2024 04:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731067379; x=1731672179; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4gHrVo4ZOzheVZVTTfNE0mncBRRWA81aL+FydUpkVXE=;
        b=S8sawRLCvQkC1MACB1W6FjyHiN+dRaA/NjNSPS7mcVUTIobCVR/W5tHJYoOps3EyGs
         eyh9R2oVM4QkAbX0bgw+ym82nCVoG6zaC/Z+YiQwAIqgn17BQioZEFNwFshlW+eRne3a
         SLNSXi5f41MY7HJ5AQLS3JBUWqPh+4T810eHkgeiF3k2j2UE4sC0iYbdGMXYDUcOOE/8
         rvHg7wPhFkqWTyWxA3K0GKaU3004wxIYpXoyz3L13HYO79I9UEz4uESJRZFs+jZo2ur8
         AJqR5gsvOBtrAPjvLSa4znSNB25lzXZNeWRDaz5EmyvAGuobhU7p8MQr3Ytqt1QK9+bh
         4cxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731067379; x=1731672179;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4gHrVo4ZOzheVZVTTfNE0mncBRRWA81aL+FydUpkVXE=;
        b=sLjeUjgYVL3FebcLdLk4XOx59lO+Y4Xf8LDXPwtXXeAbmvBnvrNmejWY5niKp58qxS
         VRST4HA0dR5olU40xLgDfDAcEGFB6Qg6deHHk/0d2pwjw9idr4fcn6ekrlUcbvsERvtu
         O9lqhSww6ADOI+2FEK75rsaOy3zR9Twg3PjG4UjubXLI/XeyGGDSHcbpoUK6E4a18j6l
         G52lNFwBAbGEc+qBSvTpto2y/CtWCaeuE2HRz+V6/zQoNAj4Zprt0mHrWHEigkGkCDHH
         6wAeXCWxQXZ1ZFId10YkYB5L23+QVksxaSmWZAmXeJLuk0z6pVf5NwbW4gnKv6y+to3B
         W7kQ==
X-Gm-Message-State: AOJu0Yz9/XYGABSc0yjZvfAWlVr8N7pMS0P9Qs+9tzlMLbeAK84P1Ssz
	JD6S1Q5OjtUvkCGXMGCo/Ussa0agmP6te5Ulw6d1kde0D398od8d18YaVLqkeOegtTb4Ora/jKc
	=
X-Google-Smtp-Source: AGHT+IE7zekpgyY/PQI1AIBoKK18WwwmcB3FfqaGSGkOey4LXL4ru3cnbqZqFx47qhihmKnDEGN9mg==
X-Received: by 2002:a17:907:842:b0:a9a:345a:6873 with SMTP id a640c23a62f3a-a9eeff0dd85mr225046566b.24.1731067378928;
        Fri, 08 Nov 2024 04:02:58 -0800 (PST)
Received: from thinkpad ([89.101.134.25])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0a18872sm226386166b.11.2024.11.08.04.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 04:02:58 -0800 (PST)
Date: Fri, 8 Nov 2024 12:02:59 +0000
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: gregkh@linuxfoundation.org
Cc: mhi@lists.linux.dev
Subject: [GIT PULL] MHI changes for v6.13
Message-ID: <20241108120259.q6yyxrx3v63cv6su@thinkpad>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git tags/mhi-for-v6.13

for you to fetch changes up to bd23e836423ea3968d539d4f0d5722a3a824b99e:

  bus: mhi: host: pci_generic: Use pcim_iomap_region() to request and map MHI BAR (2024-11-08 11:52:06 +0000)

----------------------------------------------------------------
MHI Host
========

- Fixed typo in the comments section

- Fixed the sparse warning in MHI trace by converting the inputs to native
  endian instead of passing little endian fields.

- Used pcim_iomap_region() API to request and map the MHI BAR. This removes the
  usage of deprecated pcim_iomap_regions() and pcim_iomap_table() APIs.

----------------------------------------------------------------
Carl Vanderlip (1):
      bus: mhi: host: Switch trace_mhi_gen_tre fields to native endian

Manivannan Sadhasivam (1):
      bus: mhi: host: pci_generic: Use pcim_iomap_region() to request and map MHI BAR

Yan Zhen (1):
      bus: mhi: host: Fix typos in the comments

 drivers/bus/mhi/host/boot.c        |  4 ++--
 drivers/bus/mhi/host/internal.h    |  2 +-
 drivers/bus/mhi/host/pci_generic.c |  6 +++---
 drivers/bus/mhi/host/trace.h       | 25 +++++++++++++------------
 4 files changed, 19 insertions(+), 18 deletions(-)
-- 
மணிவண்ணன் சதாசிவம்
