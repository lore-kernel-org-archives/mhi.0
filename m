Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76255199B4
	for <mhi@lists.linux.dev>; Tue, 27 Feb 2024 05:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709012846; cv=none; b=m+BOeCx//aRZlXKubnjVm61YlBTG9IrkyjzL9sp8zdUKPDUDF7mOWWjmWoE4Z3GORgt/sbu3aRhvaXbqerUNVaC3fbLmlgpg1OxBQ8g0Ue1uLDz8Du2GrrmypTX9wrP5Y2L8hNXnG2y8P3RJRpjuOwXjtOjO+ZcHMj/JtmRWoHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709012846; c=relaxed/simple;
	bh=8HRuS+hvlQA6iSzvP/WBaOYbG3r938rLEna2X47kSHk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z4zhnCKRjzOf/bkljvZp3mJs2LuWjah1mIgfM5w05YYBirEe6LPb/j8ozIOFbEN+XjOLauz4609hAbNvd3e3MTbDl3D6kmwzvwNF9Qap+IX6BPFvGRw3wSuMdDl5ewIn68+MGVPdIPY0zjF2qhK4n0HiQbxiPja1APE4xLbJ2Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VPnZrP7B; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VPnZrP7B"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1dc9222b337so20334445ad.2
        for <mhi@lists.linux.dev>; Mon, 26 Feb 2024 21:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709012844; x=1709617644; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r8jXbRkSQmJxBEDan8I3/Dh3Dps5pGSI/SfFRoKMcOA=;
        b=VPnZrP7Bmw2kZ6pobBZiAFVy8S3ODtq4O7PSskznGMWCF18MBejDin97qkqfaoi/Vu
         olWYTkosefOj/E11/r81PEZoeuUJB4NJ+JsPEvTR9Fc+RRX6UjgZet6sczYM5lVU3cUe
         MKXZRWks2uBKd1gOHhPEM10j5+FCOmoq61uo0HcR0d/0wqcPgG/G4FPwBLVXNe45ELHt
         BiarHXK+OOygN+K2JCvlRlFtrwi+hm0jUV+ue3c9sEUohfmTNUBEPZwlBWw66DLJtEZN
         aHi7F4N56POt2l6fGG/3vOBFuDd77D46iVSq7jYUfzB2KrIbB3OFxaAu9Ou6qm7UHa9k
         b+Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709012844; x=1709617644;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r8jXbRkSQmJxBEDan8I3/Dh3Dps5pGSI/SfFRoKMcOA=;
        b=QUvlTufxVLaJscyMmc0XnOCgrC2gHW16exxw0HJMaVZ7N450ojteJWliEJ8p9GetjJ
         RU6Ht0Y9Jkfdgp541qyXdDhBsrjVcMC5DdFy/Mtt28lCrqJ5JZnaNkIZS3eRZfP30IKJ
         WKGVrvJi5nrGdF0WnoCStCpWISOLGPH94AL/qaqLOXRDPd3S9i2KwzgV0J3Wq81NFP/6
         pzX/SrbX0JYfY6WgZzk7spnXU9mP0Tv8R04OLaJYr4avv5rLt0AWoEaJ8uj9ojDVxuEJ
         4UA+kx/ZVX8N3hov0zFjVPkEg5TKgD6TgP7qEMiOBVpe4Isy0wFv6BYQ3ntU0Oro5+gT
         flVw==
X-Gm-Message-State: AOJu0YxIvRXtX6NsmzMHeMVGBpPTCN23IhSmLzLI1KueZd2caRzy03Yb
	WSUQ52Ug1aqGA8/d8P1kXrQr+ljxXQsyEwRpsdAJrwqYgCACQHFqedNA+nfqwA==
X-Google-Smtp-Source: AGHT+IH+6DC1sUP1moOOBieeBP4dAFtyTSgmYaj6V7O/0vMrfYvzVfNSsKU4a323mKyAbnvc/1vsrw==
X-Received: by 2002:a17:903:11c9:b0:1dc:7887:7723 with SMTP id q9-20020a17090311c900b001dc78877723mr12537383plh.61.1709012843553;
        Mon, 26 Feb 2024 21:47:23 -0800 (PST)
Received: from thinkpad ([117.202.184.81])
        by smtp.gmail.com with ESMTPSA id mn4-20020a1709030a4400b001dcb4a4e461sm626144plb.163.2024.02.26.21.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 21:47:22 -0800 (PST)
Date: Tue, 27 Feb 2024 11:17:18 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: gregkh@linuxfoundation.org
Cc: mhi@lists.linux.dev, quic_jhugo@quicinc.com, erick.archer@gmx.com,
	quic_krichai@quicinc.com, dan.carpenter@linaro.org,
	quic_jjohnson@quicinc.com
Subject: [GIT PULL] MHI changes for v6.9
Message-ID: <20240227054718.GB2587@thinkpad>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git tags/mhi-for-v6.9

for you to fetch changes up to 2ec11b5d6d900b17c7d001fbee4751fd2aa58917:

  bus: mhi: host: pci_generic: constify modem_telit_fn980_hw_v1_config (2024-02-26 17:16:21 +0530)

----------------------------------------------------------------
MHI Host
========

- Added new MHI_PM_SYS_ERR_FAIL state to the MHI state machine to properly
  cleanup the channel state if the device fails to respond to the MHI reset
  during SYS_ERR handling. This issue was discovered with the Qualcomm AIC100 AI
  accelerator device.

- Modified the code that reads and exposes the OEM_PK_HASH registers through
  sysfs to read them on-demand instead of reading once during boot. Qualcomm
  AIC100 devices support provisioning the keys dynamically, so this allows the
  users to know the upto date information.

- Added tracepoint support to expose the debug information over tracefs.

- Reverted the commit that reads the MHI device revision from the device during
  boot. This is done because the read info was not used anywhere (dead code) and
  also it is not possible to read the revision info from all the devices.

- Constified the modem config for Telit FN980 modem as required by the MHI core.

MHI Endpoint
============

- Replaced kzalloc() with kcalloc() in an effort to avoid integer overflows
  during multiplication. Even though there is no potential overflow in the
  endpoint code, this is done for the sake of uniformity and best practice.

- Fixed the kmem_cache_create() failure check to use the correct variable.

----------------------------------------------------------------
Dan Carpenter (1):
      bus: mhi: ep: check the correct variable in mhi_ep_register_controller()

Erick Archer (1):
      bus: mhi: ep: Use kcalloc() instead of kzalloc()

Jeff Johnson (1):
      bus: mhi: host: pci_generic: constify modem_telit_fn980_hw_v1_config

Jeffrey Hugo (3):
      bus: mhi: host: Add MHI_PM_SYS_ERR_FAIL state
      bus: mhi: host: Read PK HASH dynamically
      Revert "bus: mhi: core: Add support for reading MHI info from device"

Krishna chaitanya chundru (2):
      bus: mhi: host: Add tracing support
      bus: mhi: host: Change the trace string for the userspace tools mapping

 drivers/bus/mhi/common.h           |  38 +++++++++++------------
 drivers/bus/mhi/ep/main.c          |   7 +++--
 drivers/bus/mhi/host/boot.c        |  11 +------
 drivers/bus/mhi/host/init.c        |  91 ++++++++++++++++++++++++++----------------------------
 drivers/bus/mhi/host/internal.h    |  56 ++++++++++++++++++++++++++++------
 drivers/bus/mhi/host/main.c        |  19 ++++++------
 drivers/bus/mhi/host/pci_generic.c |   2 +-
 drivers/bus/mhi/host/pm.c          |  27 ++++++++++++----
 drivers/bus/mhi/host/trace.h       | 282 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/mhi.h                |  19 ------------
 10 files changed, 427 insertions(+), 125 deletions(-)
 create mode 100644 drivers/bus/mhi/host/trace.h

-- 
மணிவண்ணன் சதாசிவம்
