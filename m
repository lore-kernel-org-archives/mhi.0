Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12BC348445
	for <mhi@lists.linux.dev>; Sun, 11 Oct 2026 16:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791737656; cv=none; b=OkNNTxrQxq+QnPdoNpMGiPgt7HKZF9BUDG5L+EKUJ9TfWoGcaD5ZMXeRgKRvc/lgvTb186dUs8sLbC8wP+YqIK+QUX6s61/Q/Bd6XUrejxadKjbJgI5MjLIczTrPAeIXtCMhlqtYGQ31TLmexFBg+Tu9kwa6DllrgMPCgwpRICY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791737656; c=relaxed/simple;
	bh=ZYiknsB8yr3RkIM8nk1ATMsexu1nqMhdw27oO0LiEs4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XX321kuHweQc6R5FWxbqCY82VDWPFOkZOatX9O4LRKMZYIhcOogg7jeFuoToc0Hoe3qVz84NUYmW0I5vB3xXZE9o2rPN1rmgvszRouIZS39PUIP2b3EURMSOXLUyVQywwmfmdwZob5z67t8s6m1ZzviR6H9Oyve7WeINob7Kk00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NFjyQfxF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NFjyQfxF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAD821F0089B;
	Sun, 11 Oct 2026 16:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791737655;
	bh=EoNzE1KLH2Ctp6eoMxYJ6hzaEscid99wlAtG72raK60=;
	h=Date:From:To:Cc:Subject;
	b=NFjyQfxFmCEE5wr5accKkiJSF0aBHiLcGiQMgaCWsSv2vA1EvLZVtp+v6hBjTqTal
	 NjyKQTpqCSkJC+ozyx6KQftEDReEAMoZ3a1iNQ1FyKSNSEO2Qjyn2Of+v0SCBx8wLl
	 ybAn3x0fOPNNMv+DruG2UBY59zqIIRYCFH4UesuCuJtmud75CAtJgTvl1FBd47DG71
	 moKoviwI0ijj7sEQM2alXrOti8+pZM1Mg4du2mc2cFxq1cDdxX7GEPIAM99uGwHAJp
	 gwfPUfdRlIZZtZ/le+JKa9OxdXfh6MDA1F2rOnOi+Syzla5KYLQe4AMfGnXIrZqZrS
	 1t9TSiZtD2XRg==
Date: Sun, 11 Oct 2026 18:54:09 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: gregkh@linuxfoundation.org
Cc: mhi@lists.linux.dev, Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Subject: [GIT PULL] MHI changes for v7.4
Message-ID: <ctnmebhstfosmpc2togw2xeiqrcj2f2ffdmfqgragsuizlftmk@krdvivv7lqjv>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git tags/mhi-for-v7.4

for you to fetch changes up to 0b1883ca75c0005ab5ca52c7bc1a26329bc39746:

  bus: mhi: ep: clients: Add loopback driver for data path testing (2026-10-11 21:52:48 +0530)

----------------------------------------------------------------
MHI Host
--------

- Add a host-side loopback client driver that binds to the standard MHI
  LOOPBACK channel and exposes a sysfs interface for data path testing. The
  interface lets users configure the TRE buffer size and count, trigger a
  loopback test, and read back the result to validate the MHI data path
  between host and endpoint.

- Add the IP_CTRL channel (18/19) to the Sierra EM919x/EM929x channel
  configuration. IP_CTRL is a standard Qualcomm MHI control channel that
  carries the host serial control lines (DTR/RTS) to the modem, which the
  host previously had no way to drive for these devices.

- Add the DUN uplink (32) and downlink (33) channels to the Qualcomm modem
  channel configuration. These channels transport AT commands over MHI and
  let userspace reach the modem AT interface through the MHI WWAN client
  driver.

- Add support for the Quectel RM500Q-AE (SDX55) module. It provides MBIM
  control on channels 12/13, not the QMI setup that the generic SDX55 entry
  assumes, so QMI requests over the control channel were timing out. Add an
  entry matched by its subsystem ID that reuses the Quectel MBIM channel
  configuration, so no out-of-tree driver is needed.

- Fix a runtime PM usage count imbalance for no_m3 devices in the pci_generic
  driver. Probe only dropped the reference taken by the PCI core when the
  device supported both PME from D3hot and M3, while remove re-took it based
  on PME capability alone. The count therefore crept up on every bind/unbind
  cycle and could end up preventing runtime suspend. QDU100 is the only
  affected device today.

- Convert the %pK pointer format specifier to %p. Pointers are hashed by
  default now, so %pK is no longer needed to prevent address leaks, and %p
  keeps the value available for debugging.

- Fix a spelling typo ("intented") in a comment.

MHI Endpoint
------------

- Add the mhi_ep_queue_buf() API for queuing raw buffers on downlink
  transfers, for endpoint clients that do not use socket buffers. The
  existing mhi_ep_queue_skb() is refactored to share a common internal
  helper with the new API.

- Add an endpoint-side loopback client driver that binds to the LOOPBACK
  channel and echoes received data back to the host. On a Linux-based
  endpoint there is no modem firmware to provide the echo, so this driver
  acts as the software echo partner for the host loopback driver and
  completes the end-to-end MHI data path test.

- Pass IRQF_NO_AUTOEN to request_irq() for the doorbell IRQ instead of
  setting IRQ_NOAUTOEN on the descriptor by hand. The manual flag was never
  cleared on the error paths or at unregister, so it leaked onto the
  descriptor after the IRQ was freed.

----------------------------------------------------------------
Alexandra Lu (1):
      bus: mhi: host: pci_generic: Fix runtime PM imbalance for no_m3 devices

Hemanth Selam (1):
      bus: mhi: host: Fix typo "intented" in comment

Krishna Chaitanya Chundru (1):
      bus: mhi: host: pci_generic: Add DUN channel configuration

Peter Hunt (1):
      bus: mhi: host: pci_generic: Add IP_CTRL channel for Sierra EM919x/EM929x

Sebastian Andrzej Siewior (1):
      bus: mhi: host: Use %p for pointer formatting

Steve Meek (1):
      bus: mhi: host: pci_generic: Add Quectel RM500Q-AE support

Sumit Kumar (3):
      bus: mhi: host: clients: Add loopback driver with sysfs interface
      bus: mhi: ep: Add mhi_ep_queue_buf() API for raw buffer queuing
      bus: mhi: ep: clients: Add loopback driver for data path testing

Yuho Choi (1):
      bus: mhi: ep: Use IRQF_NO_AUTOEN flag in request_irq()

 .../ABI/testing/sysfs-bus-mhi-devices-loopback     |  49 ++++
 MAINTAINERS                                        |   1 +
 drivers/bus/mhi/ep/Kconfig                         |   2 +
 drivers/bus/mhi/ep/Makefile                        |   1 +
 drivers/bus/mhi/ep/clients/Kconfig                 |  16 ++
 drivers/bus/mhi/ep/clients/Makefile                |   2 +
 drivers/bus/mhi/ep/clients/loopback.c              | 126 +++++++++
 drivers/bus/mhi/ep/main.c                          |  32 ++-
 drivers/bus/mhi/host/Kconfig                       |   1 +
 drivers/bus/mhi/host/Makefile                      |   1 +
 drivers/bus/mhi/host/clients/Kconfig               |  17 ++
 drivers/bus/mhi/host/clients/Makefile              |   2 +
 drivers/bus/mhi/host/clients/loopback.c            | 312 +++++++++++++++++++++
 drivers/bus/mhi/host/debugfs.c                     |   4 +-
 drivers/bus/mhi/host/pci_generic.c                 |  22 +-
 include/linux/mhi.h                                |   2 +-
 include/linux/mhi_ep.h                             |  16 ++
 17 files changed, 592 insertions(+), 14 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-mhi-devices-loopback
 create mode 100644 drivers/bus/mhi/ep/clients/Kconfig
 create mode 100644 drivers/bus/mhi/ep/clients/Makefile
 create mode 100644 drivers/bus/mhi/ep/clients/loopback.c
 create mode 100644 drivers/bus/mhi/host/clients/Kconfig
 create mode 100644 drivers/bus/mhi/host/clients/Makefile
 create mode 100644 drivers/bus/mhi/host/clients/loopback.c

-- 
மணிவண்ணன் சதாசிவம்
