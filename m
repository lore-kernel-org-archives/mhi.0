Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4194163B6
	for <mhi@lists.linux.dev>; Fri, 11 Aug 2023 15:31:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C719AC433C7;
	Fri, 11 Aug 2023 15:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691767887;
	bh=4fINvp1fMlxymPYcSJ11VRKaakmt2qZZZKNqNNpNYtk=;
	h=Date:From:To:Cc:Subject:From;
	b=LlT0veM3IgC2zzxDDsuAclFmsproPGkQJALVeKjPgk9O24YVCRAYH99iD0FWNgmh/
	 PLGlYpYGaztMOSEN/wTW/b5y83L1QNzpcN6LAARl78EXBYokLj37TXe5ItBLccxzxY
	 qZ0DIUiaRMsAzPC8qIUyQyihXFWahRIH5IsgI8Hf5bAjfMHFpDF9+1ydQPEv4n6pXs
	 SYz5PBs+oNs+cW1xnGSSlp6meY5lmEWm6Re40LXbXbBsfXzSR3sE9ddsl+3L3iFc9T
	 pkF9GI913wV3mrA8y382zGx4GWVvCamgKPe6BrktrrzLl42Pw2Lm22Npvx2V7YisxO
	 2zVPJt4nqbK6w==
Date: Fri, 11 Aug 2023 21:01:20 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: gregkh@linuxfoundation.org
Cc: mhi@lists.linux.dev, quic_qianyu@quicinc.com, duke_xinanwen@163.com,
	slark_xiao@163.com, Julia.Lawall@inria.fr, arnd@arndb.de,
	dnlplm@gmail.com, quic_jhugo@quicinc.com
Subject: [GIT PULL] MHI changes for v6.6
Message-ID: <20230811153120.GD5296@thinkpad>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git tags/mhi-for-v6.6

for you to fetch changes up to 0724869ede9c169429bb622e2d28f97995a95656:

  bus: mhi: host: pci_generic: add support for Telit FE990 modem (2023-08-11 20:39:26 +0530)

----------------------------------------------------------------
MHI Host
========

Core
----

- Skipped MHI reset if the device is in RDDM EE (Ramdump mode) since the device
  cannot process reset request.

- Updated the sysfs contact details to use MHI list instead of bouncing
  codeaurora email ids.

- Added support to allow MHI client drivers to provide the device firmware via
  a pointer. This is required to support new firmware format to be used by
  ath11k drivers.

- Used vcalloc instead of vzalloc to protect against multiplication overflows.

- Removed decrementing one unused parameter.

pci_generic
-----------

- Added support for MHI SW channels (IP_SW0) so that the host can transfer data
  from devices over networking interface through this specific channel.

- Added support for a clone of Quectel RM520N-GL modem which uses a different
  PID as it is targeted for laptop usecase.

- Added support for a clone of Quectel EM160R-GL modem which uses a different
  PID as it is targeted for laptop usecase.

- Added support for another clone of Quectel RM520N-GL modem which uses a
  different PID as it is targeted for Lenovo laptop usecase.

- Added support for Dell DW5932e modem (both eSIM and non-eSIM variants).

- Added support for Telit FE990 modem.

----------------------------------------------------------------
Arnd Bergmann (1):
      bus: mhi: host: remove unused-but-set parameter

Daniele Palmas (1):
      bus: mhi: host: pci_generic: add support for Telit FE990 modem

Duke Xin (辛安文) (3):
      bus: mhi: host: pci_generic: Add support for Quectel EM160R-GL modem
      bus: mhi: host: pci_generic: Add support for Quectel RM520N-GL modem
      bus: mhi: host: pci_generic: Add support for Quectel RM520N-GL Lenovo variant

Jeffrey Hugo (1):
      docs: ABI: sysfs-bus-mhi: Update contact info

Julia Lawall (1):
      bus: mhi: host: use vmalloc_array and vcalloc

Kalle Valo (1):
      bus: mhi: host: allow MHI client drivers to provide the firmware via a pointer

Manivannan Sadhasivam (1):
      bus: mhi: host: pci_generic: Add support for IP_SW0 channels

Qiang Yu (1):
      bus: mhi: host: Skip MHI reset if device is in RDDM

Slark Xiao (1):
      bus: mhi: host: pci_generic: Add support for Dell DW5932e

 Documentation/ABI/stable/sysfs-bus-mhi |  4 ++--
 drivers/bus/mhi/host/boot.c            | 34 +++++++++++++++++++++++++---------
 drivers/bus/mhi/host/init.c            |  2 +-
 drivers/bus/mhi/host/main.c            |  1 -
 drivers/bus/mhi/host/pci_generic.c     | 53 +++++++++++++++++++++++++++++++++++++++++++++++++----
 drivers/bus/mhi/host/pm.c              |  5 +++++
 include/linux/mhi.h                    |  6 ++++++
 7 files changed, 88 insertions(+), 17 deletions(-)

-- 
மணிவண்ணன் சதாசிவம்
