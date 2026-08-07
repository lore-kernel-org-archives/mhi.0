Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B3C368D55
	for <mhi@lists.linux.dev>; Fri,  7 Aug 2026 05:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786082363; cv=none; b=IH8PdnAd6A630w/P0eeKtpjre8lcBfeKtATJRo25MJcdtHaVYGwCVFBdxsrThyz2zBl1HxV0cwGbbjk1O5ZLlo1FNAR1OwHT/VfvHv8xJNpLk77eWBgOKvP5dbvcVMh1I09F2Pe7CYU5TjLrIJXfS+Ev0glPP511gJHAZHTK+zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786082363; c=relaxed/simple;
	bh=ve3Y5UMms1kPa1GgWkQ+P1N+PqF+T06TLlCNmFBHt0U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kaf+NAigqinhmYEtnpuFK/uAd48uSpuGXayUrmBoXTi4ZERNbRd7yxoJbXX/lUEUwe7W/bXM0VfAuAgIvbEj8MNvCEmMVHJc2/x5xrU9hA/tvFQ32ECcSWENmjeIp45TRNr/AuMxSdMmApPffoPUUELaHvfGiwB6kUp5PZSeQaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HwdhBkHB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HwdhBkHB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEB181F000E9;
	Fri,  7 Aug 2026 05:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786082362;
	bh=rQ+mtq/s4F5b5vYILgZAGF0N1+ykBKf+MTjRZh2pAjw=;
	h=Date:From:To:Cc:Subject;
	b=HwdhBkHB2Q3cYvWQDHgSEqg7QA5KfGD3cBUUubS2JyllZVwywqqCxzW288xTVgXnu
	 V0W8AXzTNEwqy6O0lhIfpBC/CszZywctB9+ZZj/strXYy1RdiVPdizZrL4OEFkqCKe
	 Q/28orPkv36+lLwGrgoUzuv0JXst9vTqX3hoAHiKIL740ZyqrAYxm6YV6uW83VMLDV
	 Y8uQrVp/C76VVvy2KUNk4wxs1dm15HpO130k+p6ebt7KCs+BK3vLW3Ach5YSmn6G1f
	 RchyhhJTcpBHOVYy8fA3wfGzqX8tkMD1CM20YtNVtJIjyj2NLPGTdj6i1A9VeHK79K
	 ue58ncpIFl6cQ==
Date: Fri, 7 Aug 2026 07:59:11 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: gregkh@linuxfoundation.org
Cc: mhi@lists.linux.dev
Subject: [GIT PULL] MHI changes for v7.3
Message-ID: <wtodnwcia2tjuftfkmnyb3hor2z246ivmulbz3frphemsa27ma@ku3tdgjucyyv>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git tags/mhi-for-v7.3

for you to fetch changes up to 9656bcd4c321a799148d00dd830ce7ebf20011da:

  PCI: epf-mhi: Implement mhi_cntrl->flush_async() to flush DMA read/write (2026-07-30 07:19:51 +0200)

----------------------------------------------------------------
MHI Host
--------

- Add SAHARA channel support in the pci_generic driver for Foxconn products.
  This allows capturing crashdump (ramdump) using the in-kernel sahara client
  driver.

- Add support for devices with no M3 state. Some devices do not support the
  M3 power state due to hardware issues. For those devices, MHI bus will now
  run the full host-side suspend/resume sequence but skip the device-side
  M3/M0 handshake, so any transfer queued by clients during suspend is
  deferred until resume.

- Set 'mhi_cntrl->no_m3' flag in the pci_generic driver for the QDU100 device
  so that the MHI bus also skips the M3 transition during system suspend.
  Earlier, the flag was only used to disable runtime PM, but the system
  suspend path was still transitioning the device to M3.

- Fix sys error transition latency by polling for the state transition in
  mhi_pm_sys_error_transition() instead of waiting up to 24 seconds for an
  interrupt from the device. Since a device that has been reset (e.g., via
  AT!RESET) is not guaranteed to raise one.

- Flush the posted write after writing to MHI_SOC_RESET_REQ_OFFSET in
  mhi_soc_reset() so that the reset actually reaches the device before the
  caller's post-reset delay begins.

- Fix controller cleanup on EDL sysfs failure in mhi_register_controller().
  The error path was leaving the device registered when sysfs_create_file()
  failed.

MHI Endpoint
------------

- Add mhi_cntrl->flush_async() callback to drain the in-flight async DMA
  read/write operations issued through the MHI controller driver. This is
  used by the MHI EP stack before disconnect to avoid UAF where a late DMA
  completion could invoke a now-invalid xfer_cb().

- Implement the flush_async() callback in the PCI EPF MHI controller driver
  by waiting for the in-flight DMA operations to complete and then flushing
  the DMA workqueue. Since I'm the maintainer for this PCI EPF driver, I'm
  taking this patch through MHI tree due to dependency.

- Flush the in-flight async transfers before notifying disconnect in
  mhi_ep_abort_transfer() to fix a UAF, where a success callback delivered
  after the -ENOTCONN notification could reference resources already freed
  by the client.

- Fix device refcount leak in the error path of mhi_ep_create_device() when
  dev_set_name() or device_add() fails.

Common
------

- Clean up kernel-doc warnings in include/linux/mhi.h.

- Add Jeff Hugo as the Reviewer of MHI bus.

----------------------------------------------------------------
Manivannan Sadhasivam (7):
      MAINTAINERS: Add Jeff Hugo as the Reviewer of MHI bus
      bus: mhi: host: Flush the posted write after writing to MHI_SOC_RESET_REQ_OFFSET
      bus: mhi: host: Add support for devices with no M3 state
      bus: mhi: host: pci_generic: Set 'mhi_cntrl->no_m3' flag
      bus: mhi: ep: Add mhi_cntrl->flush_async() callback to flush the async read/write
      bus: mhi: ep: Flush async transfers before notifying disconnect in mhi_ep_abort_transfer()
      PCI: epf-mhi: Implement mhi_cntrl->flush_async() to flush DMA read/write

Qingtao Cao (1):
      bus: mhi: core: Fix sys error transition latency

Randy Dunlap (1):
      bus: mhi: Clean up some kernel-doc warnings

Slark Xiao (1):
      bus: mhi: pci_generic: Add SAHARA channel support for Foxconn products

Yuho Choi (2):
      bus: mhi: ep: Fix device refcount leak in the error path of MHI device creation
      bus: mhi: host: Fix controller cleanup on EDL sysfs failure

 MAINTAINERS                                  |  1 +
 drivers/bus/mhi/ep/main.c                    | 56 ++++++++++++++++++++++++++++++++++++++++++++------------
 drivers/bus/mhi/host/init.c                  |  4 +++-
 drivers/bus/mhi/host/main.c                  |  6 ++++++
 drivers/bus/mhi/host/pci_generic.c           |  5 +++++
 drivers/bus/mhi/host/pm.c                    | 73 ++++++++++++++++++++++++++++++++++++++++++++++---------------------------
 drivers/pci/endpoint/functions/pci-epf-mhi.c | 10 ++++++++++
 include/linux/mhi.h                          | 17 ++++++++++++-----
 include/linux/mhi_ep.h                       |  2 ++
 9 files changed, 129 insertions(+), 45 deletions(-)

-- 
மணிவண்ணன் சதாசிவம்
