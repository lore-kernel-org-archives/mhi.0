Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00312701B8
	for <mhi@lists.linux.dev>; Wed, 14 May 2025 10:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747219052; cv=none; b=RTBGIX+VwZVgA83PWdXkeXIZvsoKYRmJVkrL2esQa8s4L0Bdv8XX4C2TA07sRZyUx0xwtAnj/k8oWDWltPjRECEPHJRae4Pabb4jmq0KqN3AUxkR/qc+/QMV7F1xm20us3KQ5RNTsRdLPIo6GlQDFuepCGHCLXQTjPk/6sCuKUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747219052; c=relaxed/simple;
	bh=csp1AED5BAbD6J0n2P1IGXAdWPwM+9UE1x0QDZ9Y5fs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NmmfuVuqbsxhkPkaFUQ42Wrf0uT1mQC2YbeGYiHHVYUAStf5wqqeVXF5qb+aCF0IQXfTvX9rgebndMpqxSW3iiuOhAXWIZwbV6FFR4rLwbxmJUfDs7azZAdGsovwfgQY5BpFE5OsN3CQFmVLeSrsmztLTJF3Oa8pduoU8+BYbFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GLYERh82; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GLYERh82"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso66028455e9.2
        for <mhi@lists.linux.dev>; Wed, 14 May 2025 03:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747219049; x=1747823849; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rZDvHaFq+MtlvBhT4F0OtESreirR59ocfKA2Kdwe+P8=;
        b=GLYERh824bjJwhaeHELLtFA28eE1rVTECnBQQdYBAz3eBva9zsIDAKXL7fnAiTUmF3
         aT7vDK/jzmO1zvEk45U90IH81ci/m5tGyC1uX/o/ttt6+kSH7C9njpkSTeYN5unwC3Z9
         qi+5UbtNuSmtXT5/m16JFWVz3A9gn8t6Fi/KZohWrFjcbQdjvGfxclMb+pcHzfgSmuqU
         ReRIkZyVCa8KRoSvwgyZaimF+dNJ9QciZmQXe5pzb8lFV8x/EQHu2/mF6XmLvopRvcx2
         6nG2hUWX8nQw5Lv8qo7wRnCEMEht9DorA/RDhjouIMG+Dtyu6geiAVF8TQh4hVTSpfVQ
         TIsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747219049; x=1747823849;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rZDvHaFq+MtlvBhT4F0OtESreirR59ocfKA2Kdwe+P8=;
        b=EA7Q7plcN4pNABnQ7z2WYqw+5l+0/ygqqkhT3duQNpoAdLqZPfaP5CWK1t48Imgr06
         GbmgTCzHA7pZcF4JMLnk90AeptGfVDP57d4asVmKZBly23WWfbl66jRXbjePilFMu5UI
         pmxppKFUtiOJZSCdhPRAJ9ligH3c1/e/YObcAuOYSXmpQVyRgH3RntdI+ECQlJp+uHYH
         quzq8EgOcRnqHmRAuPBxsJZaEJcuP9Db6sohWVeYhl3B6fsLjnqq1/KjYOwJkZI+BBTa
         /uMQvtZ/h8+KQF8CjzE0tBItTFbjNAkDCSd5FdWJ1lal23vtI244ZFyTd+fICR6HcQaU
         mryQ==
X-Gm-Message-State: AOJu0YwLpK2cWjBn6VgOOfQHZQVQ/EiL+3DCkirRtFVnUQT80jHcCZz6
	pu3I5u8vKatDyCjr5bjpQWDlHBZNSvcXKclhX+9oYDXJkEpgEMOp8gGlR6nLZg==
X-Gm-Gg: ASbGncvipeWmMbS54e8ReoknywNh68qFELetGZPMd0UN9+oVWHRxenxVYynEkqxoy6D
	J+Qrg8LCdig39Cc3BfKT00iF6/fkO+dvL2g0VIEVQUbD4BS3vd+3hNocr4fhrFozZLuDXEz7s7A
	lD1E+brvCjMr+PEP9szW0ELGc9rfjmr2E7Kpc+9/kKEAVu6TOVuy3Bhhlr4QmLnu4ERF5gh2WWg
	8L9UyQps/KJAQ673coA6Lkch7qrG85gfM/aGlPKCX2wHyuXZ5aVNQOeQys1bbhotpGUKoFTCQjl
	N79f64YwwxmAsmuvWE8EnHdwuUY3K+2t7Vchk7S6NFIiPnK3KmxFMHdlhPV+eq2vhQSGVM5us9y
	/38XdWQGORAzNsA==
X-Google-Smtp-Source: AGHT+IE1CpY565+fwHiCmCh7sUp6vBsnbi9sJkrgwLstKbQtFtC7DvysFFTGY8m7sNrUxcVWiPEmaA==
X-Received: by 2002:a05:600c:1c93:b0:43d:b85:1831 with SMTP id 5b1f17b1804b1-442f1dd30d8mr24579675e9.0.1747219049148;
        Wed, 14 May 2025 03:37:29 -0700 (PDT)
Received: from thinkpad (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f396c3f5sm23847545e9.32.2025.05.14.03.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 03:37:28 -0700 (PDT)
Date: Wed, 14 May 2025 11:37:26 +0100
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: gregkh@linuxfoundation.org
Cc: mhi@lists.linux.dev
Subject: [GIT PULL] MHI changes for v6.16
Message-ID: <bcmjaizharbnql26jevllz4trepcjiurnqidttr565kie22kci@g37cswbge5nl>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git tags/mhi-for-v6.16

for you to fetch changes up to 6348f62ef7ecc5855b710a7d4ea682425c38bb80:

  bus: mhi: host: pci_generic: Add Telit FN920C04 modem support (2025-05-14 11:30:59 +0100)

----------------------------------------------------------------
MHI Host
========

- Fix conflict between MHI power up and SYSERR state transitions by issuing MHI
  reset only if the device is in SYSERR state while in SBL/PBL EEs. The device
  won't respond to reset if it is not in SYSERR state in SBL/PBL EEs.

- Remove redundant call to pci_assign_resource() since PCI core calls this API
  internally.

- Add Telit FN920C04 modem which is based on Qcom SDX35 chipset.

----------------------------------------------------------------
Daniele Palmas (1):
      bus: mhi: host: pci_generic: Add Telit FN920C04 modem support

Jeff Hugo (1):
      bus: mhi: host: Fix conflict between power_up and SYSERR

Subramanian Ananthanarayanan (1):
      bus: mhi: host: pci_generic: Remove redundant assign resource usage

 drivers/bus/mhi/host/pci_generic.c | 43 +++++++++++++++++++++++++++++++++++++++----
 drivers/bus/mhi/host/pm.c          | 18 +++++++++++++++++-
 2 files changed, 56 insertions(+), 5 deletions(-)

-- 
மணிவண்ணன் சதாசிவம்
