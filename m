Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1492F9985
	for <mhi@lists.linux.dev>; Tue, 20 Jan 2026 09:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768900722; cv=none; b=HWLRynihtYoFwPRseStZVzYhWtSaabQWlO87m1jvaYjgjfaW/94c93OpEKRql3HOMS6XNmF57kJnb3BD1S0nSR7h7igT8UDzPN7QIQGQ/auE/yYRMbWb+cDQdSNa9hYTNpeafW/jfGiRRQQfCd/k8ncuqGdKjjhPAFu44MB+sG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768900722; c=relaxed/simple;
	bh=fzXHXDJB4dTrz33rJgw5PGVYmr+nm0IKd2soAyAieMM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DUwrn0AaK3uoK+8x39A0w1r0BCaTB29j5NBCAUAlck5xqIHGa/CFNvgy35guC05ANkCh705+BvT8UCT96irWOfnq3bNprKN6rf+q/mONKjOzRzNYQpKHPrKgOI1cfvMSux3/+8eaStAoVim+dRK2JC7s/BwYIFEyAZtev1ocqoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qmfF40bV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qmfF40bV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2833CC16AAE;
	Tue, 20 Jan 2026 09:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768900721;
	bh=fzXHXDJB4dTrz33rJgw5PGVYmr+nm0IKd2soAyAieMM=;
	h=Date:From:To:Cc:Subject:From;
	b=qmfF40bV2ZqXpML4ZPPcGIB3iIJExv+6zvn/0DCK5YH5y3rwOdVvCviD5G6aKC0mx
	 3uqlcWhG/WEEC+1LvXCoaH17HxZ3UlvXzyj3g725pGNMvQiuzf1jGuZozU1S1h0Eor
	 JvVJf1IB4XIrdDFF69CwAZDUbzkLOsZywDwTRV1OWNybfky9AIOqkkISUhCKU3j9fa
	 JWStq4lbt4e8wJnuLxEBSvXd2I0+lO6qfLxtrkTz+F3VvYQNMjNYyJfAXAQ376rYkZ
	 xowzflsilG/g/IcnDZN/uIV7nP/DjAQnoE4nbYm8O/FORSMZDE92blwOVodBsXjvs5
	 00O33bOHp+8MQ==
Date: Tue, 20 Jan 2026 14:48:34 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: gregkh@linuxfoundation.org
Cc: mhi@lists.linux.dev
Subject: [GIT PULL] MHI changes for v6.20
Message-ID: <5u37cbaldizhvdgnjq2opjvvrfkmehuvwh3ktgjqbmymqur6gz@ddnzo2sruqa4>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git tags/mhi-for-v6.20

for you to fetch changes up to 91a0b0dce350766675961892ba4431363c4e29f7:

  bus: mhi: ep: Use bus callbacks for .probe() and .remove() (2025-12-31 16:27:13 +0530)

There is a minor conflict between mhi and ath trees in
drivers/net/wireless/ath/ath12k/mhi.c file:

between commits:

  7f54938fc525 ("wifi: ath12k: Move Wi-Fi 7 MHI configuration to dedicated file")
  a72027045263 ("wifi: ath12k: Modularize driver into common and Wi-Fi 7 specific components")
  bce3b73d1ca7 ("wifi: ath12k: Rename ath12k_* symbols to ath12k_wifi7_* for clarity")

from the ath tree and commit:

  51731792a25c ("net: qrtr: Drop the MHI auto_queue feature for IPCR DL channels")

from the mhi tree.

I've pushed the resolution here for reference:
https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git/commit/?h=mhi-ath-resolution&id=a1cf17be3ba3718f1a8c70e614f4c0ee026a90fd

Please let Linus know about this conflict incase the ath tree gets merged first.
I believe ath maintainer will let the netdev maintainers know about this
conflict for the case of mhi getting merged first.

NOTE: Commit 51731792a25c has changes across netdev and accel drivers with Acks
from the respective maintainers.

----------------------------------------------------------------
MHI Host
--------

- Add support for loading dual ELF image format firmware to Qcom Trust
  Management Engine Lit (TME-L) supported devices like QCC2072, which require
  separate ELF header for SBL and WLAN firmware segments in a single firmware.

- Remove the MHI auto_queue feature support. This feature was added to offload
  the queuing of buffers from the client drivers to the MHI stack, but it caused
  a lot of race over the time. So remove this feature from the QRTR client
  driver and also from the MHI stack/controller drivers.

- Move the .probe() and .remove() callbacks from driver level to bus level.

MHI Endpoint
------------

- Move the .probe() and .remove() callbacks from driver level to bus level.

----------------------------------------------------------------
Manivannan Sadhasivam (2):
      net: qrtr: Drop the MHI auto_queue feature for IPCR DL channels
      bus: mhi: host: Drop the auto_queue support

Qiang Yu (1):
      mhi: host: Add support for loading dual ELF image format

Uwe Kleine-König (2):
      bus: mhi: host: Use bus callbacks for .probe() and .remove()
      bus: mhi: ep: Use bus callbacks for .probe() and .remove()

 drivers/accel/qaic/mhi_controller.c   | 44 --------------------------------------------
 drivers/bus/mhi/ep/main.c             | 12 +++++-------
 drivers/bus/mhi/host/boot.c           | 10 ++++++++++
 drivers/bus/mhi/host/init.c           | 22 +++++-----------------
 drivers/bus/mhi/host/internal.h       |  3 ---
 drivers/bus/mhi/host/main.c           | 81 ++-------------------------------------------------------------------------------
 drivers/bus/mhi/host/pci_generic.c    | 20 ++------------------
 drivers/net/wireless/ath/ath11k/mhi.c |  4 ----
 drivers/net/wireless/ath/ath12k/mhi.c |  4 ----
 include/linux/mhi.h                   | 14 --------------
 net/qrtr/mhi.c                        | 69 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----------
 11 files changed, 82 insertions(+), 201 deletions(-)

-- 
மணிவண்ணன் சதாசிவம்
