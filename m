Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF312B67E
	for <mhi@lists.linux.dev>; Sat,  6 Jul 2024 08:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720255884; cv=none; b=otnhgEA/WqR1tT4A0PjzKZikgI1WvZ4f6BuHfGA3zohCXGSrKSfiuI8KnG70GMooDPSee7pxaEmNcw1bIPUFbLgRR8sU/MIh9sK3IWUq0UCd2IZfd9WG4b+PlL3T5h3x8fd5Q/5WZ6gZRc4UwUqFwJCrk4NccujYHWDyd8jkETA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720255884; c=relaxed/simple;
	bh=nD8wIhpV99v/o/yaBVZkA+OhRX9XKbTQk8wls5O7J3k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A7FqZ7RYGzFup9XHphPiMvnnUE8qasFw4Re5E7VM5hGwR29U2DtoIedvs+hU73ywFqEifF54oDRHBT47CVPUjPy7tDTLt1krwEFZyQPEebkX56hOM0P8udFV9gqTw/7gnJf0C+F+7vTxYdfq+jQvcjHchs1qIG4a2Q2IYETf050=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B2HuTWma; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B2HuTWma"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-70b0d0a7a56so1064668b3a.0
        for <mhi@lists.linux.dev>; Sat, 06 Jul 2024 01:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720255882; x=1720860682; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kvr1Xt3+1htJpKQNeg4Qn5gKCppFGEBYjqSgQqzCPxE=;
        b=B2HuTWmanMuYBQsXuJBBJwswR0fxi25Josgg6wlgspHtuhbg6xiQPyJolgWmBhG0uT
         kjmHL12fX74EJFI7SbyU4Fn5EOM5yqg3OWFLWgnhqS8VcuZHBaOlQfctC21C4KAqmykL
         G/82ZaeqSDPwQ8eFMQFW4xJo+A+N3LPKwA/94BtEtXtXRIb/1UwVZWRvEF8G2Q0bqj3l
         IiYWDpPzR8vZjzvdI6oZSAd2WJx0wLjwByVTaUpnBFxivwCcWcX5ciIpQa02fTF7tDvI
         mjwzJoStle5IipCgx5YONUFmN6P+u+CZk7g+lIQaS5U5mF5nrzxFVKhyXzr3ZguLPFQi
         yD2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720255882; x=1720860682;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kvr1Xt3+1htJpKQNeg4Qn5gKCppFGEBYjqSgQqzCPxE=;
        b=rrit4RrfTJag/dm97Si1WvJzyWqII/Nbsx1j4bzVER2ZAcxHqdhRPIIgKibyy5VQK0
         sr4XqO+jWzwRecRnOBf4aJ7KbTgNsund9JNZxPkrvEtRGDmxCComPRJ5M9hBYQJ7zxqf
         rtakLQ1BBHhWijPxv+uu+yy39tRL7zbvEle/Z+zQ8c2FwAoKxPM8Ma+Zmq8t1tDsISSg
         U9PiXnh7yxDOQooCPve213gEZWr3sf3bWcYggiUaeOhY+9r7DJb+EaAlLl/tB3f47/Wh
         HZTSRrt6bOCCfNRS+ytS3lHuHOdZM31RMSuq7SEUAnp2Mlu51jvhi0gEMUti0ACzhEht
         +J0w==
X-Gm-Message-State: AOJu0Ywtl6Lh7xm6BFVTi3H5TurKCMHnbDkuKPXesd2yawVTE1NBvJxQ
	Zpe2TS85aOi6jGFqdNP0MF00EHHkNF7GSkJAndYnX7STxCfbDYbWYcU9qilxTQ==
X-Google-Smtp-Source: AGHT+IFhZwtScp0M/onD7yeasvT+zwB0nO0kE8wWwQvmHMwxoUCu0unZ+oan7LLGD7aF1aEsm/DBJQ==
X-Received: by 2002:a05:6a21:6da9:b0:1b8:d79:55f3 with SMTP id adf61e73a8af0-1c0cc8ec43bmr7314658637.54.1720255881978;
        Sat, 06 Jul 2024 01:51:21 -0700 (PDT)
Received: from thinkpad ([2409:40f4:301b:2f0f:39:4d50:dece:e7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fb261ddf1fsm53455505ad.212.2024.07.06.01.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jul 2024 01:51:21 -0700 (PDT)
Date: Sat, 6 Jul 2024 14:21:17 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: gregkh@linuxfoundation.org
Cc: mhi@lists.linux.dev, netdev@vger.kernel.org, slark_xiao@163.com
Subject: [GIT PULL] MHI changes for v6.11
Message-ID: <20240706085117.GA3954@thinkpad>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git tags/mhi-for-v6.11

for you to fetch changes up to 65bc58c3dcad0d9bd17762e22603894a2d2880d6:

  net: wwan: mhi: make default data link id configurable (2024-07-03 19:11:01 +0530)

----------------------------------------------------------------
MHI Host
========

- Used unique 'mhi_pci_dev_info' struct for product families instead of reusing
  a shared struct. This allows displaying the actual product name for the MHI
  devices during driver probe.

- Added support for Foxconn SDX72 based modems, T99W515 and DW5934E.

- Added a 'name' field to 'struct mhi_controller' for allowing the MHI client
  drivers to uniquely identify each MHI device based on its product/device name.
  This is useful in applying any device specific quirks in the client drivers.

WWAN MHI Client driver
======================

- Due to the build dependency with the MHI patch exposing 'name' field to client
  drivers, the WWAN MHI client driver patch that is making use of the 'name'
  field to apply custom data mux id for Foxconn modems is also included.
  Collected Ack from Networking maintainer for this patch.

MHI EP
======

- Fixed the MHI EP stack to not allocate memory for MHI objects from DMA zone.
  This was done accidentally while adding the slab cache support and causes the
  MHI EP stack to run out of memory while doing high bandwidth transfers.

----------------------------------------------------------------
Manivannan Sadhasivam (2):
      bus: mhi: ep: Do not allocate memory for MHI objects from DMA zone
      bus: mhi: host: pci_generic: Use unique 'mhi_pci_dev_info' for product families

Slark Xiao (3):
      bus: mhi: host: Add support for Foxconn SDX72 modems
      bus: mhi: host: Allow controller drivers to specify name for the MHI controller
      net: wwan: mhi: make default data link id configurable

 drivers/bus/mhi/ep/main.c          |  14 +++++++-------
 drivers/bus/mhi/host/pci_generic.c | 122 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-------------------
 drivers/net/wwan/mhi_wwan_mbim.c   |  18 ++++++++++++++++--
 include/linux/mhi.h                |   2 ++
 4 files changed, 128 insertions(+), 28 deletions(-)

-- 
மணிவண்ணன் சதாசிவம்
