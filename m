Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD4F2FF643
	for <mhi@lists.linux.dev>; Fri, 19 Sep 2025 07:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758268711; cv=none; b=eV79f/2Ujunvs7qAxEwTLJ/Payr7U/AiFcjDJSHKko9hRuKFY09Kb7hWvcQzWCWrh1+0NT4EecTHQBea0I1NnWNFq8oJ2ykuIQHT+3rKrEwW6kNTcbZXz2qs/1VZ8MqRkbgx0XcFFkepSadunroWVONFSSOpsNIllrioMPZcoTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758268711; c=relaxed/simple;
	bh=8/eJjeYVWb2APeG/BScEfFaH21lzygNrztmaxvxlOVE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cFwgXNEUtW8W5sOSFS0MDrCZxFm/3P0QP6GdYuZI6dbSyjtDfQ3fhrHi/cFfPrqupyyH5lFhAouCgd2v5Ds8jwoqbybmO8sRi+4UA6eYN9d79Ui5YuCmhEanEhRzQmXzhT59CuZ6oAxafBTyAXp3h1/UFxam9BRUri9tUortcUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jTf5b0+X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jTf5b0+X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D90F3C4CEFB;
	Fri, 19 Sep 2025 07:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758268711;
	bh=8/eJjeYVWb2APeG/BScEfFaH21lzygNrztmaxvxlOVE=;
	h=Date:From:To:Cc:Subject:From;
	b=jTf5b0+XLZj2mE/7tHuccRTAvCtBSNJUbrk1kpzda59Xq2+MggrqvEwWJrcnbG/9s
	 Ec6KsIDqkGI6ldMHFWxmZx2TtKPA9nc72WEkaj81URnmtG/4XSp8btnchpWUDBhGm8
	 70MMToNTZLsgChGIUtH2VITN4Z3ITF+62bYxc887YxqiZAQBEsjvqo5LSaJe/cC/Ms
	 1ZCIB5unXcTrgDxTJcF/UB5Ng1mLoqDDuepmO3V3xZ2jd1ekaRZB67J7LK74gg7USz
	 di0wQOVbDPQa+78jrciwdgAEmTT/HGAkPU/WVdTsB2I/FtViNVL+3k0UmYCPt5ovI7
	 whRYeagU3qykg==
Date: Fri, 19 Sep 2025 13:28:25 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: gregkh@linuxfoundation.org
Cc: mhi@lists.linux.dev
Subject: [GIT PULL] MHI changes for v6.18
Message-ID: <bibfbg3463xep4novmwhu3lrazqh3iau4gp2zx73zrnnkvh4ao@73xc46h7u4ro>
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

  https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git mhi-next

for you to fetch changes up to 54c67740fff7360b6607d02b8499d09b944b3fda:

  bus: mhi: host: pci_generic: Set DMA mask for VFs (2025-09-19 13:10:49 +0530)

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
