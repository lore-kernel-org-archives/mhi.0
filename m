Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9193B2C82
	for <mhi@lists.linux.dev>; Thu,  2 Dec 2021 11:37:01 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id y14-20020a17090a2b4e00b001a5824f4918so2193391pjc.4
        for <mhi@lists.linux.dev>; Thu, 02 Dec 2021 03:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SIMj35mEWO+wOa2JAV2FSBiJWvqdeYjn+C6j99cMUwA=;
        b=ODbgq4DT3+FpiLJMLcZUy7tM6hNCNhupWr/6pDcDcHJYdTdQcHvK+KrcHxN2SEt9Bq
         EGtuhfyBa9YT8EssQb/uTVf045C4fYYvM2X3J4J9jkz36YzGYdlByg8zVqicQEPcM5Ul
         LIUpWYe5rW8vhDJz0GlvaYVWvJ8UX0ihuYCYgWEnU6z5UbPk6+It43qsaOPlO4s6SYPQ
         DcQK5CpR1whoY/eza7+C0RJB5DKDaUgKm8ESPhhPmKDolBsmoBdWu+hMsfHErWDW5oPI
         0ujZ9ujxMSzHdXC7SsTmVCS7U0wyKHf+bRIMsom2WXXkyYheE/CT6WdbKQvNqKtyHkuC
         akfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SIMj35mEWO+wOa2JAV2FSBiJWvqdeYjn+C6j99cMUwA=;
        b=4+hldbtCMXRY4H+cC58VxTJTglYOTReK4kZs5DEnH5PtT72+PVaBcoDH62Dro4/WTs
         SNmyuv3I3uTG8bOl16mvspDC6wg9Krdc3T1gaAOKdLmqTGd5s/25xXE/EU6NV41Ustnh
         FYxAz9/iJoNuuBCcPWzfgjsa4jqKrFMpiKubnDhogvQf+v3c9fuxnHRF49LvGKNolXH8
         QYNZiHp9kgmOmVMA4Pbq/F3+6VbFzKJykW5cR5X8P8P77NGBTtKJYlyXybwiHSZoSkbZ
         qJNgx7pZrz6rafjko2LXvj5ZIpHSf8mFsnpTkJ3KarKxhQUlBSlwSL61RU23XyTcy184
         Zjkw==
X-Gm-Message-State: AOAM530/sRywZFiH4o5L3Vu8J6RWnikFQiLHyn1Ex39gtBltUoFb1f4n
	AbrP92G7WLHkbhtvUsw4Ehn4ZZAkLJfR
X-Google-Smtp-Source: ABdhPJwJu+G43NQKUCMzIjjZs9DXBHyWTuwZQzFOBAXtqVyrDTeyEpn25tt4B2ScX3xzQQUMruCrDA==
X-Received: by 2002:a17:90a:af94:: with SMTP id w20mr5225019pjq.223.1638445020603;
        Thu, 02 Dec 2021 03:37:00 -0800 (PST)
Received: from localhost.localdomain ([117.202.184.5])
        by smtp.gmail.com with ESMTPSA id h5sm3602552pfi.46.2021.12.02.03.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 03:36:59 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: mhi@lists.linux.dev
Cc: hemantk@codeaurora.org,
	bbhatt@codeaurora.org,
	quic_jhugo@quicinc.com,
	vinod.koul@linaro.org,
	bjorn.andersson@linaro.org,
	dmitry.baryshkov@linaro.org,
	skananth@codeaurora.org,
	vpernami@codeaurora.org,
	vbadigan@codeaurora.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 00/20] Add initial support for MHI endpoint stack
Date: Thu,  2 Dec 2021 17:05:32 +0530
Message-Id: <20211202113553.238011-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This series adds initial support for the Qualcomm specific Modem Host Interface
(MHI) bus in endpoint devices like SDX55 modems. The MHI bus in endpoint devices
communicates with the MHI bus in host machines like x86 over any physical bus
like PCIe for data connectivity. The MHI host support is already in mainline [1]
and been used by PCIe based modems and WLAN devices running vendor code
(downstream).

Overview
========

This series aims at adding the MHI support in the endpoint devices with the goal
of getting data connectivity using the mainline kernel running on the modems.
Modems here refer to the combination of an APPS processor (Cortex A grade) and
a baseband processor (DSP). The MHI bus is located in the APPS processor and it
transfers data packets from the baseband processor to the host machine.

The MHI Endpoint (MHI EP) stack proposed here is inspired by the downstream
code written by Qualcomm. But the complete stack is mostly re-written to adapt
to the "bus" framework and made it modular so that it can work with the upstream
subsystems like "PCI Endpoint". The code structure of the MHI endpoint stack
follows the MHI host stack to maintain uniformity.

With this initial MHI EP stack (along with few other drivers), we can establish
the network interface between host and endpoint over the MHI software channels
(IP_SW0) and can do things like IP forwarding, SSH, etc...

Stack Organization
==================

The MHI EP stack has the concept of controller and device drivers as like the
MHI host stack. The MHI EP controller driver can be a PCI Endpoint Function
driver and the MHI device driver can be a MHI EP Networking driver or QRTR
driver. The MHI EP controller driver is tied to the PCI Endpoint subsystem and
handles all bus related activities like mapping the host memory, raising IRQ,
passing link specific events etc... The MHI EP networking driver is tied to the
Networking stack and handles all networking related activities like
sending/receiving the SKBs from netdev, statistics collection etc...

This series only contains the MHI EP code, whereas the PCIe EPF driver and MHI
EP Networking drivers are not yet submitted and can be found here [2]. Though
the MHI EP stack doesn't have the build time dependency, it cannot function
without them.

Test setup
==========

This series has been tested on Telit FN980 TLB board powered by Qualcomm SDX55
(a.k.a X55 modem) interfaced to the 96Boards Poplar board (ARM64 host) over
PCIe.

Limitations
===========

We are not _yet_ there to get the data packets from the modem as that involves
the Qualcomm IP Accelerator (IPA) integration with MHI endpoint stack. But we
are planning to add support for it in the coming days.

References
==========

MHI bus: https://www.kernel.org/doc/html/latest/mhi/mhi.html
Linaro connect presentation around this topic: https://connect.linaro.org/resources/lvc21f/lvc21f-222/

Thanks,
Mani

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/bus/mhi
[2] https://git.linaro.org/landing-teams/working/qualcomm/kernel.git/log/?h=tracking-qcomlt-sdx55-drivers

Manivannan Sadhasivam (20):
  bus: mhi: Move host MHI code to "host" directory
  bus: mhi: Move common MHI definitions out of host directory
  bus: mhi: Make mhi_state_str[] array static const and move to common.h
  bus: mhi: Cleanup the register definitions used in headers
  bus: mhi: ep: Add support for registering MHI endpoint controllers
  bus: mhi: ep: Add support for registering MHI endpoint client drivers
  bus: mhi: ep: Add support for creating and destroying MHI EP devices
  bus: mhi: ep: Add support for managing MMIO registers
  bus: mhi: ep: Add support for ring management
  bus: mhi: ep: Add support for sending events to the host
  bus: mhi: ep: Add support for managing MHI state machine
  bus: mhi: ep: Add support for processing MHI endpoint interrupts
  bus: mhi: ep: Add support for powering up the MHI endpoint stack
  bus: mhi: ep: Add support for powering down the MHI endpoint stack
  bus: mhi: ep: Add support for handling MHI_RESET
  bus: mhi: ep: Add support for handling SYS_ERR condition
  bus: mhi: ep: Add support for processing command and TRE rings
  bus: mhi: ep: Add support for queueing SKBs over MHI bus
  bus: mhi: ep: Add support for suspending and resuming channels
  bus: mhi: ep: Add uevent support for module autoloading

 drivers/bus/Makefile                      |    2 +-
 drivers/bus/mhi/Kconfig                   |   28 +-
 drivers/bus/mhi/Makefile                  |    9 +-
 drivers/bus/mhi/common.h                  |  284 ++++
 drivers/bus/mhi/ep/Kconfig                |   10 +
 drivers/bus/mhi/ep/Makefile               |    2 +
 drivers/bus/mhi/ep/internal.h             |  237 +++
 drivers/bus/mhi/ep/main.c                 | 1674 +++++++++++++++++++++
 drivers/bus/mhi/ep/mmio.c                 |  303 ++++
 drivers/bus/mhi/ep/ring.c                 |  316 ++++
 drivers/bus/mhi/ep/sm.c                   |  181 +++
 drivers/bus/mhi/host/Kconfig              |   31 +
 drivers/bus/mhi/{core => host}/Makefile   |    4 +-
 drivers/bus/mhi/{core => host}/boot.c     |    0
 drivers/bus/mhi/{core => host}/debugfs.c  |    0
 drivers/bus/mhi/{core => host}/init.c     |   12 -
 drivers/bus/mhi/{core => host}/internal.h |  436 ++----
 drivers/bus/mhi/{core => host}/main.c     |    0
 drivers/bus/mhi/{ => host}/pci_generic.c  |    0
 drivers/bus/mhi/{core => host}/pm.c       |    0
 include/linux/mhi_ep.h                    |  289 ++++
 include/linux/mod_devicetable.h           |    2 +
 scripts/mod/file2alias.c                  |   10 +
 23 files changed, 3448 insertions(+), 382 deletions(-)
 create mode 100644 drivers/bus/mhi/common.h
 create mode 100644 drivers/bus/mhi/ep/Kconfig
 create mode 100644 drivers/bus/mhi/ep/Makefile
 create mode 100644 drivers/bus/mhi/ep/internal.h
 create mode 100644 drivers/bus/mhi/ep/main.c
 create mode 100644 drivers/bus/mhi/ep/mmio.c
 create mode 100644 drivers/bus/mhi/ep/ring.c
 create mode 100644 drivers/bus/mhi/ep/sm.c
 create mode 100644 drivers/bus/mhi/host/Kconfig
 rename drivers/bus/mhi/{core => host}/Makefile (54%)
 rename drivers/bus/mhi/{core => host}/boot.c (100%)
 rename drivers/bus/mhi/{core => host}/debugfs.c (100%)
 rename drivers/bus/mhi/{core => host}/init.c (99%)
 rename drivers/bus/mhi/{core => host}/internal.h (51%)
 rename drivers/bus/mhi/{core => host}/main.c (100%)
 rename drivers/bus/mhi/{ => host}/pci_generic.c (100%)
 rename drivers/bus/mhi/{core => host}/pm.c (100%)
 create mode 100644 include/linux/mhi_ep.h

-- 
2.25.1

