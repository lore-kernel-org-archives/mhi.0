Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A94111CB8
	for <mhi@lists.linux.dev>; Wed,  1 May 2024 04:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714538097; cv=none; b=jVkKqyI/PcD7AyQ0UpfU0QoU6/z50LTHRQm2O8WkNG7XJIsA16MdWaC/AxKEWllZtDHUR+WdZmaqTInr6Z4L9vZni5xFwwEc+6rz8wJlEscC9rL6Npxd1p1H2RfTKTtjFkTLOqvaSBT3USZCvdKIYgpaPUx2amn1xKKbEHMBU3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714538097; c=relaxed/simple;
	bh=GyxenWljCNUelToG6vJ1Nz1JxS5+MFbJtEqJ1L8j3Ho=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Eo3/8GrMEPmD6SMvCi6AjpZ4BomGfSczTFuj/VWfjDaXD/alQz2JWHm4Zk9174kvMdG2odA7sY2rIWPb/Z6yU3hczpTMR6dlIxizx838Pk2wZwn6bfH6LHXLBq7/KOtDe/X6adXqUEZqPndh1vuqwNvKTUn//KtPCMJcyEwCv7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=af13ixH8; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="af13ixH8"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-5d8b887bb0cso5368363a12.2
        for <mhi@lists.linux.dev>; Tue, 30 Apr 2024 21:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714538095; x=1715142895; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nP0d9ZPQBQsFSlVx/oy1BB3GWNuBWXEjTH9+lDRSSeE=;
        b=af13ixH8cZqeV/3rdae8rW7QMpT+iQr4DSasDfrUA3x62f4N6SLY3KpLMkZfJKuoXk
         SzwXSyOo8EMRJUoqnHL7/ne2DJdxWL506Ihf2pa7g1kpYbkMnMDh5DRvAJiuPqaFLpT3
         qDtfEp/8DZornolcxNum7pVlsETHytg5LyjDAiSuNDZ3+Ad6mX8ZaRJjGNm3q0p4UxBI
         U+iA/KL5yXmv3076Mgr9KFbNIG3GkrnVxcFnjVRxLLhsZRDjRV5aE97q/sIKDkIjJopA
         XnJgCjiz8o2dm5rtsEV1xDMLo9+r1MQCQe/u4/MXQqHiodSUjUdTvfDViYpKP+kM4iGF
         dfRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714538095; x=1715142895;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nP0d9ZPQBQsFSlVx/oy1BB3GWNuBWXEjTH9+lDRSSeE=;
        b=K+lNnGSV9dHvez1ue3DLtNN2ERuYste9b5IXW9JDub/9rIhydlmJJTpFADQobCoM0p
         S/POkjqjxFRkzMCbWGOkWZUUiEQdtQAsxNejV31+8UBw5SgQdq2dX2jAf1VRkVPaf3pi
         nSE3kSz5REwX2ZdAasEyTdPu4tvG5/e3Z55HtW6lDyfgr244hJB6rZ+cQ5O4BVi4wfUq
         84Z3pPdRIhHLA6mNjH/dp9g3v0Z1Gb0HoR+7nI2UOmIx3mvidc7+iHUVq5bFklEjBirg
         575IyWMLNxuayN3il0ZtS8QA2xz/iSLHBJty6btVHL5fgBlKyNVy9aFpXvoF160lbj6Z
         9qAg==
X-Gm-Message-State: AOJu0YwG30ZIMM7yiFz+E6SOr8Ts5nFpU8nuvB8YaiL9o2XseXt/HWPO
	EfhxL8HYZK1igusFs81UwJ58II6MWnj/ektj/06vfx4iGStH1CkBER9kfMzEIA==
X-Google-Smtp-Source: AGHT+IFIWjgfOTINbS43h+bnyH5Hd0IRYKA3jbzKN8xbSIfBpy3Z/8d64GAs6wucSVbhak2mJn+3yg==
X-Received: by 2002:a05:6a20:a12a:b0:1a7:2e17:efd3 with SMTP id q42-20020a056a20a12a00b001a72e17efd3mr2413924pzk.5.1714538095242;
        Tue, 30 Apr 2024 21:34:55 -0700 (PDT)
Received: from thinkpad ([220.158.156.193])
        by smtp.gmail.com with ESMTPSA id ha24-20020a17090af3d800b002b1b1a3611dsm474389pjb.43.2024.04.30.21.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 21:34:54 -0700 (PDT)
Date: Wed, 1 May 2024 10:04:50 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: gregkh@linuxfoundation.org
Cc: mhi@lists.linux.dev, quic_bqiang@quicinc.com,
	ath11k@lists.infradead.org, quic_qianyu@quicinc.com
Subject: [GIT PULL] MHI changes for v6.10
Message-ID: <20240501043450.GA5218@thinkpad>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git tags/mhi-for-6.10

for you to fetch changes up to 48f98496b1de132f2e056605b5330209136066dc:

  bus: mhi: host: pci_generic: Add generic edl_trigger to allow devices to enter EDL mode (2024-04-25 20:25:45 +0530)

----------------------------------------------------------------
MHI Host
========

- Added a new API mhi_power_down_keep_dev() to not destroy the struct dev
  associated with the MHI channels during MHI power down. This is useful in
  scenarios such as system suspend/hibernation where the probability of
  channels coming back is very high. So the PM maintainer suggested not to
  destroy the struct dev in those cases.

  This API is introduced for fixing the failure reported in the ath11k driver
  during resume from system suspend.

  NOTE: Due to the API dependency, the patch adding the API is pushed to an
  immutable branch (mhi-immutable) and merged into both mhi and ath trees. But
  the merge commit is not visible in mhi tree due to git being smart with
  'fast-forward'.

- Added an optional sysfs entry to force the MHI devices to enter the Emergency
  Download (EDL) mode to download the firmware from host.

- Added EDL mode support for Qcom SDX75/65/55 modems as per the MHI spec v1.2,
  Chapter 13.2. This involves writing a cookie to the EDL doorbell registers and
  then triggering the device reset from host.

----------------------------------------------------------------
Baochen Qiang (1):
      bus: mhi: host: Add mhi_power_down_keep_dev() API to support system suspend/hibernation

Qiang Yu (3):
      bus: mhi: host: Add sysfs entry to force device to enter EDL
      bus: mhi: host: Add a new API for getting channel doorbell offset
      bus: mhi: host: pci_generic: Add generic edl_trigger to allow devices to enter EDL mode

 Documentation/ABI/stable/sysfs-bus-mhi | 13 +++++++++++++
 drivers/bus/mhi/host/init.c            | 41 ++++++++++++++++++++++++++++++++++++-----
 drivers/bus/mhi/host/internal.h        |  4 +++-
 drivers/bus/mhi/host/main.c            | 16 ++++++++++++++++
 drivers/bus/mhi/host/pci_generic.c     | 45 +++++++++++++++++++++++++++++++++++++++++++++
 drivers/bus/mhi/host/pm.c              | 42 ++++++++++++++++++++++++++++++++++++------
 include/linux/mhi.h                    | 29 ++++++++++++++++++++++++++++-
 7 files changed, 177 insertions(+), 13 deletions(-)

-- 
மணிவண்ணன் சதாசிவம்
