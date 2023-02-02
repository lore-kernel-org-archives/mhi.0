Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D4D8F43
	for <mhi@lists.linux.dev>; Thu,  2 Feb 2023 17:26:44 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id cl23-20020a17090af69700b0022c745bfdc3so2489030pjb.3
        for <mhi@lists.linux.dev>; Thu, 02 Feb 2023 09:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8KHe92XFBSlx1XiTVSe/UGJMno4JNfyRnrxzMifDLSc=;
        b=tlXgH++aHm+NsmuI9HYQtX1usDnEoApnfKdZRVEhBUgLz/QyTX8o9g/xR9kYHBsmwF
         NIUPDw9fQMUYfKcy44/mI64gS2Yttjssp/SIUBrEKh6ZS17dW8um7jn4VKGLjtE4HxE9
         XwGf4ybgs+FVSsnaLIBAUzHtN65HDyEghAYSwlfIsrW8lg8vC+FRwg5OkNCVScuO9xSs
         x1RymALmV+CFGW6Pu7pPpBSR6MiRaoU4CE7SZlT/4kCwj7aqEcnv5ZEETAZEVUgNROQ1
         QQs0nb4PhBT6x6/oyfRVduqYiZoqYT+RlmlJaH3e133IFn6WVZEulILhnMTjWwgfE8ZH
         1fhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8KHe92XFBSlx1XiTVSe/UGJMno4JNfyRnrxzMifDLSc=;
        b=TV7a7bh3441PWjzdDlJU6haCAfCdtWu4qGmHoV7qPmoYS/gA6hJ4LSw0JGon4ST1Io
         JlFtYtnTYVEeeOEBxItDgtQhLSZ1NwQKCy1zc09N7DAI1swB5+7MnY9sUB+vdyv3exFv
         0NmjsITLTP8pCbCgOlNMhef5X27zRuUa+QkZt1kZ98U7BanRKxKA4zJQ6k2fYppxB136
         67V8HJo96xUu3dulevHjpcwugPUB+rXWW84SZXcAZbZeRWkhHeu5DNkuNdMNcVui5+G6
         rIIpOVHm9pS80NIedeKOzVVPWye5Bg6fV3K6sNxdWCtARoor5ZkSVVganNrtcwZ1hZj+
         cLRg==
X-Gm-Message-State: AO0yUKVChJFjhSghLABvZ/i0wfDtckl++qLsqGHBV5Upccl2kzLLkkbO
	VnWtlE0t6kLyRTRLBFFhyVSFMWv9WhjgqYA=
X-Google-Smtp-Source: AK7set/w5aOfqbjQhLEjDJCol72R6dkwm3IFu5H7T0uOCRpEeAR0kGSKS6jpZLrpSdaCi/KjQrCmfw==
X-Received: by 2002:a17:90b:1bc7:b0:230:1acb:54c1 with SMTP id oa7-20020a17090b1bc700b002301acb54c1mr7708913pjb.1.1675358803917;
        Thu, 02 Feb 2023 09:26:43 -0800 (PST)
Received: from thinkpad ([59.97.55.122])
        by smtp.gmail.com with ESMTPSA id j19-20020a633c13000000b00478162d9923sm68335pga.13.2023.02.02.09.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 09:26:42 -0800 (PST)
Date: Thu, 2 Feb 2023 22:56:38 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: gregkh@linuxfoundation.org
Cc: mhi@lists.linux.dev, quic_carlv@quicinc.com, slark_xiao@163.com,
	error27@gmail.com
Subject: [GIT PULL v2] MHI changes for v6.3
Message-ID: <20230202172638.GA257939@thinkpad>
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

for you to fetch changes up to 3c54a3ff0a2cdcd902482a62fef813f1d46e5eaf:

  bus: mhi: ep: Fix off by one in mhi_ep_process_cmd_ring() (2023-02-02 22:52:24 +0530)

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
