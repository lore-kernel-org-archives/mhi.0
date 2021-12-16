Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DF8168
	for <mhi@lists.linux.dev>; Thu, 16 Dec 2021 08:12:48 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id u11so18848290plf.3
        for <mhi@lists.linux.dev>; Thu, 16 Dec 2021 00:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=J4t2sTur9cdYHU8TKnZYEXhAtiC9kU7TYZgtM8sv6Rw=;
        b=kbZ8GxDI9i+HZI9ASpifM7l0aRUElJris8YuH+giRnwSq6EDfXGUkagqhxuZEsCH6X
         9r4pTp7vs3bU2MES3TRlFxZOWXPB+O4rQxK3qq32ajle6uCPktn9ltWFfLFLJVTVIu6D
         f9x0cCeTMJT7jpWx1ML6xikojKG9M7saPnhud9MXrv4G8VSBGJVVjsCvxplc1wcB3R9c
         GrUJxGa+kdcDSocgtljrUWP0sYdh8P8eBlFe8s536hFG6W7zTEdMage+gWmHUqlrsuTU
         N47LoYjuMEIl95oUW9GCWg+ihbVWzCDJjMrAzrV3d1ub/rsXWNV7RYRD40UdG8Ik9mXW
         V8bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=J4t2sTur9cdYHU8TKnZYEXhAtiC9kU7TYZgtM8sv6Rw=;
        b=Jw3VJNyVCE1pqOEzGOaeP9ZJRnAWBDyicrSh4XfQAzGB43IQivAijLWmMC22GZCgnh
         nRbwV6gJF6NJsojmgK+kwRChPD5SmUmU8Gy+2s3A+jNOUCOHPAiloauVhmYl+LFP+tK4
         afFHgCi6nQEo+rMEjWkyACgN8DiZBlh9n6E+U+CRZZ63WGWF+jIZJ2HdM45hlGPlj/yS
         7MOuSqIaiyqJ49vjmL8HUwRMIswQ5fVrXaGzFs5zsnQJsWCMGnEMR+2QOTCfBFqtZY3b
         iOnggS+D1ltzktgu7JFZcEvL+zZKho/nW7ulUlDA7FyarA/98VnQp/l9emhn6a1aKSy1
         6qIQ==
X-Gm-Message-State: AOAM533XgRKAxfugEkIbq338/FxVJsbCYmkp8uYvnTw8WVDChTjby8DF
	gztRDtV2Y3eIp01wpvgArXsU
X-Google-Smtp-Source: ABdhPJyHWdGgvQkASnf5ZsiqmTjN/rK+5bFAS+5TkzGnUj9Dcl3B4b/FmP8XAbwTm0cQ0zTVsSFXYQ==
X-Received: by 2002:a17:903:1247:b0:143:b9b9:52a2 with SMTP id u7-20020a170903124700b00143b9b952a2mr15367789plh.35.1639642367470;
        Thu, 16 Dec 2021 00:12:47 -0800 (PST)
Received: from localhost.localdomain ([117.193.208.121])
        by smtp.gmail.com with ESMTPSA id u38sm326835pfg.4.2021.12.16.00.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 00:12:47 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: gregkh@linuxfoundation.org
Cc: mhi@lists.linux.dev,
	hemantk@codeaurora.org,
	bbhatt@codeaurora.org,
	loic.poulain@linaro.org,
	thomas.perrot@bootlin.com,
	aleksander@aleksander.es,
	slark_xiao@163.com,
	christophe.jaillet@wanadoo.fr,
	keescook@chromium.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 00/10] MHI patches for v5.17
Date: Thu, 16 Dec 2021 13:42:17 +0530
Message-Id: <20211216081227.237749-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg,

Here are the MHI patches for v5.17 cycle.

Patchset summary:

1. Added support for a new PCI Foxconn modem based on Qualcomm SDX55 chipset.
This device is named as "T99W175" which was already supported but this one
seems to be using a new modem build and Foxconn is selling it as a new product
with a different PID.

2. MHI PCI generic driver now gracefully shutsdown the modem during system
freeze.

3. Used macros to identify the MHI Execution Environment (EE).

4. Fixed the comment and style issues detected by checkpatch.

5. Used dma_set_mask_and_coherent() API to simplify the code in MHI PCI generic
driver.

6. Fixed reading the "wake-capable" entry while parsing the channel
configuration structure from controller drivers.

7. Fixed the SYS_ERR handling while powering up the device. This fixes the
bootup issue with Sierra Wireless EM919X modems based on SDX55.

8. Introduced a new API for automatically queueing the buffers for the DL
channel. This patch touches QRTR driver that's under networking subsystem.
Hence, collected Ack from Jakub.

9. Used the "unsigned long" argument for find_last_bit() API. This is done to
avoid the warning with "-Warray-bounds" GCC flag.

10. Finally, added support for the Sierra Wireless EM919X modems based on
Qualcomm SDX55 chipset.

Thanks,
Mani

Bhaumik Bhatt (2):
  bus: mhi: core: Use macros for execution environment features
  bus: mhi: core: Fix reading wake_capable channel configuration

Christophe JAILLET (1):
  bus: mhi: pci_generic: Simplify code and axe the use of a deprecated
    API

Kees Cook (1):
  bus: mhi: core: Use correctly sized arguments for bit field

Loic Poulain (1):
  bus: mhi: pci_generic: Graceful shutdown on freeze

Manivannan Sadhasivam (3):
  bus: mhi: core: Minor style and comment fixes
  bus: mhi: core: Fix race while handling SYS_ERR at power up
  bus: mhi: core: Add an API for auto queueing buffers for DL channel

Slark Xiao (1):
  bus: mhi: pci_generic: Add new device ID support for T99W175

Thomas Perrot (1):
  bus: mhi: pci_generic: Introduce Sierra EM919X support

 drivers/bus/mhi/core/boot.c     |  2 +-
 drivers/bus/mhi/core/init.c     |  4 ++-
 drivers/bus/mhi/core/internal.h |  9 ++++--
 drivers/bus/mhi/core/main.c     | 24 +++++++++++---
 drivers/bus/mhi/core/pm.c       | 39 +++++++++--------------
 drivers/bus/mhi/pci_generic.c   | 56 ++++++++++++++++++++++++++++-----
 include/linux/mhi.h             | 21 ++++++++++---
 net/qrtr/mhi.c                  |  2 +-
 8 files changed, 109 insertions(+), 48 deletions(-)

-- 
2.25.1

