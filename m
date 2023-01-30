Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805881378
	for <mhi@lists.linux.dev>; Mon, 30 Jan 2023 08:21:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34597C433EF;
	Mon, 30 Jan 2023 08:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675066898;
	bh=WwkPXZGkPyDpbHWPA0xmbqcsk0ksZyd2XYAxiGvBPlI=;
	h=Date:From:To:Cc:Subject:From;
	b=sjKVgil5HxEdEqovCL6qPmTaLNGYh/2sxOrLZwYbsjWCVRJqhrlS29TBtcqK6Fk/3
	 Gfo7VlQVoKkh9IaKli8iE6RLpdoHT2gsg1cL4qwhgOz9biroqqc6jC2OpeCoCR/zQi
	 JE70Oo3WsPaczCmpNTMFqZJYvu7kTF2LmPBeGyUq5dQoJ6VAZ8u/dStS635nwVhLVT
	 fldIyaYWId/duF+UVpfln0jyQ5MRHkEZDzrblrSj33t8OK/0g52l8xBp5yF5/28112
	 5GOdFB4h1Oez/lSFdqiU6tT6mvVcat27lz2fU+1+SHvuQmHkjCdxOhK7m4hjqjrQ+d
	 bqYfa4EYE1VJQ==
Date: Mon, 30 Jan 2023 13:51:31 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: gregkh@linuxfoundation.org
Cc: mhi@lists.linux.dev, quic_carlv@quicinc.com, slark_xiao@163.com,
	error27@gmail.com
Subject: [GIT PULL] MHI changes for v6.3
Message-ID: <20230130082131.GB12687@thinkpad>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git tags/mhi-for-v6.3

for you to fetch changes up to 62c0f48fa940d5c9f96b55b79c6c1b9cec6d0d45:

  bus: mhi: ep: Fix off by one in mhi_ep_process_cmd_ring() (2023-01-27 12:31:42 +0530)

----------------------------------------------------------------
MHI Host
========

- Fixed the module description

MHI Endpoint
============

- Powered down the MHI EP stack completely during MHI RESET instead of just
  doing transfer abort as the MMIO register access will be prohibited
  afterwards. EP stack will also be powered on again in case the RESET
  happened due to SYS_ERR.

- Added a sanity check before processing the command ring to make sure that
  the channel is supported by the controller.

- Added a check to make sure the xfer_cb is available for the channel
  before trying to send the error status to the client drivers. This
  helps in avoiding a potential null pointer dereference.

- Fixed the debug log of RESET command

- Modified the channel ring handler lock to protect the whole handler
  instead of locking it partially. This helps in avoiding a race that may
  happen if a channel STOP/RESET command is issued by the host parallely.

- Saved the MHI state locally during suspend and resume. Otherwise, the MHI
  EP stack will not be aware of a channel that got disabled and may try to
  access it later.

- Changed the MHI state_lock to mutex instead of spinlock. This helps in
  avoiding the sleeping in atomic bug reported by Dan Carpenter and also
  allows the lock to be held throughout the state change.

- Fixed the off by one error while doing the MHI channel check during
  command ring processing.

MHI Generic
===========

- Updated the MHI toplevel Makefile to use Kconfig flags for building the
  host and endpoint sub-directories conditionally.

----------------------------------------------------------------
Carl Vanderlip (1):
      bus: mhi: Update Makefile to used Kconfig flags

Dan Carpenter (1):
      bus: mhi: ep: Fix off by one in mhi_ep_process_cmd_ring()

Manivannan Sadhasivam (7):
      bus: mhi: ep: Power up/down MHI stack during MHI RESET
      bus: mhi: ep: Check if the channel is supported by the controller
      bus: mhi: ep: Only send -ENOTCONN status if client driver is available
      bus: mhi: ep: Fix the debug message for MHI_PKT_TYPE_RESET_CHAN_CMD cmd
      bus: mhi: ep: Move chan->lock to the start of processing queued ch ring
      bus: mhi: ep: Save channel state locally during suspend and resume
      bus: mhi: ep: Change state_lock to mutex

Slark Xiao (1):
      bus: mhi: host: Update mhi driver description

 drivers/bus/mhi/Makefile    |  4 ++--
 drivers/bus/mhi/ep/main.c   | 85 ++++++++++++++++++++++++++++++++++++++++++++++---------------------------------------
 drivers/bus/mhi/ep/sm.c     | 42 ++++++++++++++++++++++++------------------
 drivers/bus/mhi/host/init.c |  2 +-
 include/linux/mhi_ep.h      |  4 ++--
 5 files changed, 75 insertions(+), 62 deletions(-)

-- 
மணிவண்ணன் சதாசிவம்
