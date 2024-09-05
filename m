Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C4319DF5B
	for <mhi@lists.linux.dev>; Thu,  5 Sep 2024 14:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725545593; cv=none; b=sJNMM7U4DvefHVKvinIQvN1g95iiM/FXsGWzQxYnQYsYHKU+JdInRJRdP2LJwm1c5nrXcBe3nLFUqpyPjS5MsmQzWifHImRRzfnm+qEKMQ5nXJ2MtcF6fc0/8R2oPVVEL1LJugAUEQeNjbcqUTtW52CoU5qeocIiEGbEGgYXohU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725545593; c=relaxed/simple;
	bh=sfezUiVaNw1L9VtKCP6yB5GMjZKur63Zoezg6d1LtMw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Oi3CFFed1JZi2eYIY1eqVLMnjd1D5PjSwREhUf4cXhb/qpI0xAxDcsqowIbo0Dc1zzrO+62gqbSNZl7EPw0d4t5COPWLB7Wpdr0Tc998WolxmpoispMIXSnjsjvWgBBIIypo0MP8D95XoZmj4hwcpfD6odj2l8Y6kgdM++EgVRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WOZ4r5aw; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WOZ4r5aw"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-20688fbaeafso8780595ad.0
        for <mhi@lists.linux.dev>; Thu, 05 Sep 2024 07:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725545591; x=1726150391; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rpMIayd5/bB+ULJai4ZKEPetgBwEo5iuwVvI5Okqf9s=;
        b=WOZ4r5awgiL649XBEZCpkeBVdiNjbrMz7m6tn2tesL+PngpkELFreDLu0e75d8tDT5
         EtaFfF1cPLZKSuHkbqV5wKatZJjiZvaiOrdiY7NRO2UdIJYeXPLwqR6GB+7n4dHawLu5
         5g3K8RIJm2ovIyDrbg1pwRzaIbodgQYbeyuOi3zGZY4sFhWuOofCQYfgfFjPIiNQl3Z4
         rgtS7+5bbMjqVhHefpgNjA4vkKTv/o5HwLQD35kdvXY+Vn3xH/QDIEZF+VmnDmQCyEiy
         chMKySzOF5u0dcpEr1d1jrfFj+1NPrwHF6MRQ/sKOjL3BN9Q3tmgItA63mvlLiKlGZvx
         kKUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725545591; x=1726150391;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rpMIayd5/bB+ULJai4ZKEPetgBwEo5iuwVvI5Okqf9s=;
        b=Y4wk7Bn/7d+5nq3FKG8EGLEUJNTSnOXveFjFfqJ3k93efKUVmLvuauc3m0MOxpqes5
         7ciOmSYHpPZ/E6k9sNEhP8gRVQcFSMvVYAY4N/iM1QAh41ScGt996bCOFt1PVpVEH1fL
         2cCBZ0gE49u1yVM9gT6SD5Miko7BQeBK4ElIhDPAMrkxwTkhI11bYVqLJYPy8Gpesvyi
         qLUdED6TpiEuJU7GZAKqthI4gs0c6jrcdbvIZQMGhJght2pes5OaEphmyWhOBaPfs7h/
         foIt3AbKt5/G9mBvlZ0c97WLMBlUPtuSEhS34o1fs5ZGZy64vNu3DHdaHCPDGwZKqjC4
         LpJQ==
X-Gm-Message-State: AOJu0Yy/u7lWm2Otg7f1BP2xR6UjCgczghngDVL7MpOHy3BboasRYjXS
	PpEC0zB6ZMIiMIH2aocVvt1oB909/kFCKjcIvUMkj4BgqGQBqo5pNCXk12xYww5Ewbpu38K9nzA
	=
X-Google-Smtp-Source: AGHT+IGmIn3XtRjXpZcenxWl9Kv0yT62lhlreBUOO8y1HzDtRGpm6CABPFkGRKpE5J4wsFojDm/Ixg==
X-Received: by 2002:a17:902:d2d0:b0:205:5544:bad6 with SMTP id d9443c01a7336-20584230d75mr147022485ad.55.1725545590939;
        Thu, 05 Sep 2024 07:13:10 -0700 (PDT)
Received: from thinkpad ([120.60.52.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206ae955918sm29332335ad.86.2024.09.05.07.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 07:13:10 -0700 (PDT)
Date: Thu, 5 Sep 2024 19:43:02 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: gregkh@linuxfoundation.org
Cc: mhi@lists.linux.dev
Subject: [GIT PULL] MHI changes for v6.12
Message-ID: <20240905141302.c6plpsxn2slkcuc7@thinkpad>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git tags/mhi-for-v6.12

for you to fetch changes up to 84a5ae5b23ba6320bbdfeccfe9a3ad31b2cc41d9:

  bus: mhi: host: pci_generic: Enable EDL trigger for Foxconn modems (2024-09-05 19:38:01 +0530)

----------------------------------------------------------------
MHI Host
========

core
----

- Used const qualifier for 'mhi_bus_type' to place it onto the read-only memory
  segment.

pci_generic
-----------

- Fixed the Telit FE990A modem name as it was advertising the wrong product
  name, thereby confusing the users.

- Added Netprisma LCUR57 and FCUN69 modems based on Qcom SDX24 and SDX6X SoCs.

- Updated the EDL (Emergency Download) firmware path for the Foxconn modems.
  The patch that added the modem support mistakenly specified the generic EDL
  firmware path common for Qcom based modems. But they won't work.

- Enabled the EDL trigger for all Foxconn modems to update the modem firmware.

----------------------------------------------------------------
Fabio Porcedda (1):
      bus: mhi: host: pci_generic: Fix the name for the Telit FE990A

Kunwu Chan (1):
      bus: mhi: host: make mhi_bus_type const

Mank Wang (1):
      bus: mhi: host: pci_generic: Add support for Netprisma LCUR57 and FCUN69

Slark Xiao (2):
      bus: mhi: host: pci_generic: Update EDL firmware path for Foxconn modems
      bus: mhi: host: pci_generic: Enable EDL trigger for Foxconn modems

 drivers/bus/mhi/host/init.c        |  2 +-
 drivers/bus/mhi/host/internal.h    |  2 +-
 drivers/bus/mhi/host/pci_generic.c | 64 ++++++++++++++++++++++++++++++++++++++++++++++++++++++----------
 3 files changed, 56 insertions(+), 12 deletions(-)

-- 
மணிவண்ணன் சதாசிவம்
