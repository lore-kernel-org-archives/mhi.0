Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8F7107AD
	for <mhi@lists.linux.dev>; Thu, 27 Jul 2023 10:04:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B92DC433C7;
	Thu, 27 Jul 2023 10:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690452273;
	bh=VvxorfFjHb3zIR2wfuiAdZuvChNDahN8yMlJek4Epsk=;
	h=From:To:Cc:Subject:Date:From;
	b=qNO+jbEsjthVmwiMqTqCKzykRbuabYL2IjAnuiyzhya934fbR1Cub3t6Gp6vD8vbp
	 4gIFCoM+ZBsYefFlvfBQcfIMCtO5E0yAyM4ocQhu/LUkb84Viagt7Wju3tm7aYZL9G
	 1ghd5Cl0xSlkOO2kttbFSXPVR/DR93VAcYMf1jQMu6VS47mP4NB7kTtD3fQtYfCD62
	 NPXHJ7wM7jsRPcfXaboRlogQcitmrByEm/1oSDyTmi8nUN7xATmbklcaOgzTBi/Vk/
	 497TNl8W76tOBoSIRztvszlTg5ovPld7pRDwhaV04g6JnwW7OjBAGkkPnlX66jAeCl
	 5ekAK5lhDJHLA==
From: Kalle Valo <kvalo@kernel.org>
To: mhi@lists.linux.dev
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: [PATCH v4 0/3] wifi: ath11k: support firmware-2.bin
Date: Thu, 27 Jul 2023 13:04:27 +0300
Message-Id: <20230727100430.3603551-1-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kalle Valo <quic_kvalo@quicinc.com>

We need firmware-2.bin support in ath11k so that we can add ath11k specific meta
data to firmware releases, for example feature flags so that ath11k can
automatically detect what features the firmware release supports.  Also makes
it easier and more reliable to update the firmware for PCI devices as it's not
possible to mix firmware files, everything will be in one file.

Please review and comment.

v4:

* patch 1: document in struct struct mhi_controller_config::fw_data the
           fbc_download requirement (Jeffrey)

v3: https://patchwork.kernel.org/project/linux-wireless/list/?series=752266&state=*&order=date

* patch 1: add "bus: mhi: host: ..." to title

* patch 1: add a comment to mhi_fw_load_handler()

* patch 1: check sbl_size

* patch 3: for smooth backwards compatibility don't print an error "failed to
  load firmware-2.bin: -2"

v2: https://patchwork.kernel.org/project/linux-wireless/list/?series=727935&state=*&order=date

* mhi_fw_load_handler(): fold two lines into one

* struct mhi_controller_config: document that fbc_download needs to be set

* run pahole struct mhi_controller_config

v1: https://patchwork.kernel.org/project/linux-wireless/list/?series=710862&state=*&order=date

Anilkumar Kolli (1):
  wifi: ath11k: add firmware-2.bin support

Kalle Valo (2):
  bus: mhi: host: allow MHI client drivers to provide the firmware via a
    pointer
  wifi: ath11k: qmi: refactor ath11k_qmi_m3_load()

 drivers/bus/mhi/host/boot.c              |  34 +++--
 drivers/net/wireless/ath/ath11k/Makefile |   3 +-
 drivers/net/wireless/ath/ath11k/core.c   |   8 ++
 drivers/net/wireless/ath/ath11k/core.h   |  15 +++
 drivers/net/wireless/ath/ath11k/fw.c     | 157 +++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/fw.h     |  27 ++++
 drivers/net/wireless/ath/ath11k/mhi.c    |  18 ++-
 drivers/net/wireless/ath/ath11k/qmi.c    |  54 +++++---
 include/linux/mhi.h                      |   6 +
 9 files changed, 289 insertions(+), 33 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath11k/fw.c
 create mode 100644 drivers/net/wireless/ath/ath11k/fw.h


base-commit: 9102ee8eaa6d29624ed2068396502ad8545f2ff0
-- 
2.39.2

