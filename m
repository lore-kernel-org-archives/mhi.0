Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3CC513AD05
	for <mhi@lists.linux.dev>; Tue, 23 Sep 2025 13:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758633978; cv=none; b=GsglSzvaSFN3ITRzUGrT0DsAAHGSWl9y90i8L4OWPmN1Z16a5VsdiFZetvB1AGDHDqOSWoTvJ95p3RQLmxaZN01GHtVZfYOK1suYg90Ey9Q1mO19VTUYSkdopqSMoHhM5QrClPCOZwVIlsVtrGt9bNvP9mEdFeMaAPgknCry9lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758633978; c=relaxed/simple;
	bh=W92Hoj5ek21tHgh1BJrDw7zIgYFdbmsPkxHJnJlJ8s4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DBWSdfZMRUTYjR+qoePTzHhha3IFj4Pen70rICWpC7qBcDI7pjgqwSLYoZ+uCuRBVcP8TxFy8QGny4OYepCb+vWhZwcl8i4KxtRoSFNuyzFIyqqon3vlOnHdIk1mN8gzRSYNN6Bcw1DBO+O6wUbSWTnIjNkgPYXpHIk4cqXGCOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JUT9z0kB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JUT9z0kB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24284C113D0;
	Tue, 23 Sep 2025 13:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758633978;
	bh=W92Hoj5ek21tHgh1BJrDw7zIgYFdbmsPkxHJnJlJ8s4=;
	h=Date:From:To:Cc:Subject:From;
	b=JUT9z0kBx0+GTPmWiktH8I8tMWK8VMp0vuEioZRf+xZJvSJdvn4kokuPtyaNGHkKT
	 O9bu9HJDt3EOYfnKIWCblJtYTF67wA+rWtbgyGy9FDou7kyWtK1hpeV4OlpzltFnJH
	 81kMNVKtNlgHSSMw3xcbaTulDUBrgYznn1YNodFXNULieZYFF6IcqpYwNRUZ8ln6tv
	 55fIWcQV+eOzFaUMY4g+RMxAsSEfj5n1eGnNFzwXOPDp1XpGO2o8x/AYBowFtjqfGA
	 maM8EDseM1+bHkz8pIflSus/qjx0mfEdBIoHzEllSlsQE52L7zxqp1wTd2f0QwGbgl
	 b22MXv7SM6VLw==
Date: Tue, 23 Sep 2025 18:56:13 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: gregkh@linuxfoundation.org
Cc: mhi@lists.linux.dev
Subject: [GIT PULL v2] MHI changes for v6.18
Message-ID: <rveh6tfb3ahoibrz6atfveb7xwoup3d5stdsfs66kl4hgq6eyi@iwmax7kfbngs>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git tags/mhi-for-v6.18

for you to fetch changes up to 54c67740fff7360b6607d02b8499d09b944b3fda:

  bus: mhi: host: pci_generic: Set DMA mask for VFs (2025-09-19 13:10:49 +0530)

----------------------------------------------------------------
MHI Host
========

- Add support for all Foxconn T99W696 SKU variants

- Fix accessing the uninitialized 'dev' pointer in mhi_init_irq_setup()

- Notify the MHI Execution Environment (EE) change to userspace using uevent

- Add support for Virtual Functions (VFs) in SR-IOV capable QDU100 device from
  Qualcomm. For adding SR-IOV support, MHI pci_generic driver has been modified
  to apply different configurations for PFs and VFs.

MHI Endpoint
============

- Fix the handling of chained transfers in EP MHI driver that leads to reading
  past the host transfer buffers causing IOMMU faults in the host and other
  issues.

----------------------------------------------------------------
Adam Xue (1):
      bus: mhi: host: Do not use uninitialized 'dev' pointer in mhi_init_irq_setup()

Slark Xiao (1):
      bus: mhi: host: pci_generic: Add support for all Foxconn T99W696 SKU variants

Sumit Kumar (1):
      bus: mhi: ep: Fix chained transfer handling in read path

Vivek Pernamitta (7):
      bus: mhi: host: Notify EE change via uevent
      bus: mhi: host: Add support for separate controller configurations for VF and PF
      bus: mhi: host: pci_generic: Read SUBSYSTEM_VENDOR_ID for VF's to check status
      bus: mhi: host: pci_generic: Add SRIOV support
      bus: mhi: host: pci_generic: Reset QDU100 while the MHI driver is removed
      bus: mhi: core: Improve mhi_sync_power_up handling for SYS_ERR state
      bus: mhi: host: pci_generic: Set DMA mask for VFs

 drivers/bus/mhi/ep/main.c          | 37 ++++++++++++-------------------------
 drivers/bus/mhi/host/init.c        |  5 ++---
 drivers/bus/mhi/host/internal.h    |  3 +++
 drivers/bus/mhi/host/main.c        |  1 +
 drivers/bus/mhi/host/pci_generic.c | 85 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------------------------
 drivers/bus/mhi/host/pm.c          | 29 ++++++++++++++++++++++++++++-
 6 files changed, 103 insertions(+), 57 deletions(-)

-- 
மணிவண்ணன் சதாசிவம்
