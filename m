Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995E517EF
	for <mhi@lists.linux.dev>; Wed, 11 Jan 2023 09:25:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A360C433F1;
	Wed, 11 Jan 2023 09:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673429152;
	bh=bQOjgYMu84xfkGdNoPs9j41dDKTO/R86agsQSXtGGI8=;
	h=From:To:Cc:Subject:Date:From;
	b=idx/o2r8x5QvqPzYLMhp/fNKhZPkU76m6maMNot+/pnenMK9NzLlIQpTZ7hYrzHJk
	 eGWfTo08omRGbBKZeb/U3aXSRA9jmhhiHBZCtm5p22JWhirw+wifN46NPILnoVNWGv
	 ZuDfjWPSgb2IhDz/AQy1e1d0MnKWyX4X1MxI2hzLD1PdFG8K8U7umyz4BbkMF/hrhX
	 D58foXWv1a07tg4KgjZ5mWoGDekgoCAuHebrLq67Zl9XyP85XoDXgweA9AJ8pBLbPT
	 ZmqKTeavSLshu3KkOdHq3kWAcGVIwi/MTZDMRrRbza2QpmmHrOmKeKAd637mAoTKO/
	 G56rado9lYJSQ==
From: Kalle Valo <kvalo@kernel.org>
To: mhi@lists.linux.dev
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: [PATCH 0/3] ath11k: support firmware-2.bin
Date: Wed, 11 Jan 2023 11:25:44 +0200
Message-Id: <20230111092547.21425-1-kvalo@kernel.org>
X-Mailer: git-send-email 2.30.2
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

Please review and comment. It would be easier if I could take the MHI patch
(patch 1) to my ath.git tree along with the rest of the patches but let's
discuss that separately.

Anilkumar Kolli (1):
  ath11k: add firmware-2.bin support

Kalle Valo (2):
  mhi: allow MHI client drivers to provide the firmware via a pointer
  ath11k: qmi: refactor ath11k_qmi_m3_load()

 drivers/bus/mhi/host/boot.c              |  27 ++--
 drivers/net/wireless/ath/ath11k/Makefile |   3 +-
 drivers/net/wireless/ath/ath11k/core.c   |   8 ++
 drivers/net/wireless/ath/ath11k/core.h   |  15 +++
 drivers/net/wireless/ath/ath11k/fw.c     | 157 +++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/fw.h     |  27 ++++
 drivers/net/wireless/ath/ath11k/mhi.c    |  18 ++-
 drivers/net/wireless/ath/ath11k/qmi.c    |  54 +++++---
 include/linux/mhi.h                      |   6 +
 9 files changed, 283 insertions(+), 32 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath11k/fw.c
 create mode 100644 drivers/net/wireless/ath/ath11k/fw.h


base-commit: e51980bf88c65f6ad4916baf720ad1234de01791
-- 
2.30.2

