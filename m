Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3865CAB
	for <mhi@lists.linux.dev>; Tue,  1 Mar 2022 16:03:23 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id v4so14458272pjh.2
        for <mhi@lists.linux.dev>; Tue, 01 Mar 2022 08:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yHwkQgi+o+04uNBKzumXiJug3yfB61LkqCYXhS/6Mm8=;
        b=CG2liNx4GrbajO1pKaWoIjns7dT0X92G6GauFFuVioeqgowLyFAt3AGy2TPpp/aDiG
         NQlfFENMan94k95ZSTG9WA6uDYOQrFc3AZVtfUxtayti43xbtlMKCTEB7W5REYTDI7FN
         M1GBpqttKB8isXKHVuQ2rMYDpcBe5vLJhedWEe9WNIgO0hYugzElAv/IA+soRaUwzjQ3
         1NYUGYEnwo0RphcnEkhFrz8CXQNgZjaIEFxWrCDoNISdifgVa4H3LIivdRAOpr7ahc2P
         7D8h4yvLO50q3y7Gt/1zDa0KW0Qa1WKB6hKbV2Sa32AsvoE/iSERUDsdPE3kei1zunEP
         5WkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yHwkQgi+o+04uNBKzumXiJug3yfB61LkqCYXhS/6Mm8=;
        b=wPavqttTTNPR2jc7Zs/PvZ6EPNPhYOD/QwtxpvOuijsPsyZFapj3JuZyco5Yg79htr
         z4A/miv6fxL6vGmPAYxJWJbtOWemOQ/ry/Hhm4DbVO/ylQr+kVGC219WFiJ03lIvy9W3
         JC3j8S48lGzV3r6GKE8awsJKp9v4mzsmRkAgJ3jlos/5yAe9WoCoF/2eL2wXPSaXLGXN
         e8DNypv8d+xF69wzBMGXMIRlAtNGK5gmtz8w9DVuzhGkx9gPaqVHfqz/pBgB12iSYFt0
         8ibkyWTIE7GcnZ0W4KYTkQcgRScy138EbN+g6tJ2NKUpfRLxAms0rRKoeAjD5Ms+nMPg
         9qHw==
X-Gm-Message-State: AOAM532cwaq74pc/ThLQUZIhIf+K0C+wHG0TTwaD9DsQp2zgI9TQotId
	Q7YN+CQVyglm4otMknoM/nWH
X-Google-Smtp-Source: ABdhPJzXZ7eovLLOr3LqZj+vL75ri+SGV0g+7rbwhpwhCB8U9Fc93s2bn4IacudpduywwDQenTp0EA==
X-Received: by 2002:a17:902:f549:b0:14f:a0c5:ced3 with SMTP id h9-20020a170902f54900b0014fa0c5ced3mr26269451plf.57.1646150603047;
        Tue, 01 Mar 2022 08:03:23 -0800 (PST)
Received: from localhost.localdomain ([117.207.25.80])
        by smtp.gmail.com with ESMTPSA id m17-20020a17090a859100b001bc20ddcc67sm2489530pjn.34.2022.03.01.08.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 08:03:22 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: gregkh@linuxfoundation.org
Cc: mhi@lists.linux.dev,
	quic_hemantk@quicinc.com,
	quic_bbhatt@quicinc.com,
	elder@linaro.org,
	paul.davey@alliedtelesis.co.nz,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 00/10] MHI patches for v5.18
Date: Tue,  1 Mar 2022 21:32:58 +0530
Message-Id: <20220301160308.107452-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg,

Here is the MHI patch series for v5.18 cycle. Please find the summary below:

1. Added default MRU value for the SDX55 modem from Quectel. This is based
on the firmware setting.

2. Fixes to the MHI stack to support the big endian architecture. The MHI
stack was developed and tested only on Little endian systems (x86 & ARM),
but with a couple of patches from Paul, it is working on MIPS based on Octeon 3.

3. In preparation for the MHI endpoint code (MHI stack running on the PCIe
endpoint devices like modem), the MHI host specific code is moved to the "host"
subdirectory under drivers/bus/mhi.

4. Used the bitfield operations for the register read/write. This avoids
specifying the SHIFT value.

5. Used the bitfield operations for handling the DWORDs of the ring elements.
Since most of the MHI host code is moved towards bitfield macros, this change
converts the remaining hardcoded bit operations.

6. Cleaned up the register definitions used in MHI host internal headers. This
involves using GENMASK for masks, removing unnecessary brackets, lower case for
hex, and aligning the defines on same column.

7. Renamed the "mhi_tre" structure to "mhi_ring_element" to better reflect that
it represents a MHI ring element and not a transfer ring element.

8. Moved the common MHI definitions from host directory to a "common.h" header
under drivers/bus/mhi/. These definitions will be reused by the MHI endpoint
code.

9. Moved the definition of "mhi_state_str[]" array from MHI host to "common.h"
so that it could be reused by the MHI endpoint code.

NOTE: The MHI endpoint code has been submitted to the MHI list [1] and been
reviewed. But since it is too late for v5.18, I deferred it to next cycle.

Thanks,
Mani

[1] https://lore.kernel.org/lkml/c4bcf9f6-82d7-1e35-64bb-0973ed2ceb4a@linaro.org/t/

Manivannan Sadhasivam (7):
  bus: mhi: Move host MHI code to "host" directory
  bus: mhi: Use bitfield operations for register read and write
  bus: mhi: Use bitfield operations for handling DWORDs of ring elements
  bus: mhi: Cleanup the register definitions used in headers
  bus: mhi: host: Rename "struct mhi_tre" to "struct mhi_ring_element"
  bus: mhi: Move common MHI definitions out of host directory
  bus: mhi: Make mhi_state_str[] array static inline and move to
    common.h

Paul Davey (2):
  bus: mhi: Fix pm_state conversion to string
  bus: mhi: Fix MHI DMA structure endianness

Yonglin Tan (1):
  bus: mhi: pci_generic: Add mru_default for Quectel EM1xx series

 drivers/bus/Makefile                     |   2 +-
 drivers/bus/mhi/Kconfig                  |  27 +-
 drivers/bus/mhi/Makefile                 |   8 +-
 drivers/bus/mhi/common.h                 | 304 ++++++++++
 drivers/bus/mhi/core/internal.h          | 722 -----------------------
 drivers/bus/mhi/host/Kconfig             |  31 +
 drivers/bus/mhi/{core => host}/Makefile  |   4 +-
 drivers/bus/mhi/{core => host}/boot.c    |  17 +-
 drivers/bus/mhi/{core => host}/debugfs.c |  40 +-
 drivers/bus/mhi/{core => host}/init.c    | 131 ++--
 drivers/bus/mhi/host/internal.h          | 382 ++++++++++++
 drivers/bus/mhi/{core => host}/main.c    |  66 +--
 drivers/bus/mhi/{ => host}/pci_generic.c |   1 +
 drivers/bus/mhi/{core => host}/pm.c      |  36 +-
 14 files changed, 855 insertions(+), 916 deletions(-)
 create mode 100644 drivers/bus/mhi/common.h
 delete mode 100644 drivers/bus/mhi/core/internal.h
 create mode 100644 drivers/bus/mhi/host/Kconfig
 rename drivers/bus/mhi/{core => host}/Makefile (54%)
 rename drivers/bus/mhi/{core => host}/boot.c (96%)
 rename drivers/bus/mhi/{core => host}/debugfs.c (90%)
 rename drivers/bus/mhi/{core => host}/init.c (92%)
 create mode 100644 drivers/bus/mhi/host/internal.h
 rename drivers/bus/mhi/{core => host}/main.c (97%)
 rename drivers/bus/mhi/{ => host}/pci_generic.c (99%)
 rename drivers/bus/mhi/{core => host}/pm.c (97%)

-- 
2.25.1

