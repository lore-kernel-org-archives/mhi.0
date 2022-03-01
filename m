Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA3A5CAB
	for <mhi@lists.linux.dev>; Tue,  1 Mar 2022 16:03:39 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id 15-20020a17090a098f00b001bef0376d5cso121792pjo.5
        for <mhi@lists.linux.dev>; Tue, 01 Mar 2022 08:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=37H2SCIcd0NGgB8HVqt8l3vRUxyFXtyBqdC2/L2gdR4=;
        b=NRc4ZB5BupUSPQc61wwXQY0vZF0dWXJhbfdsaTV4MypsD72aOXPMLyQrstqokY1MZo
         RiC/AxniymUaoj0pYlEEz1HpdeR45b19GIecnIfxFDnGEPRV6HtVMOm1SWrA8xuvIJX/
         GE1CAEhUuqQeeozaMmWcwfxdkBpTkyjhcEXj0I1NzQq6KlFvcmofvkt5TWf+BeZBf5Vb
         oYEWGn6Fz6ekcySYqaxxhCNNoO3V4ywMI2uA2FgGRVZu8JFDv3ehBVXYe+/WnsYuo+KU
         unyt9ZWa0d/kA++jcVksreuon5vvhgRNMlGCz84YzeFiL1QJtLgT2mPHrEo42nXSkQyE
         36iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=37H2SCIcd0NGgB8HVqt8l3vRUxyFXtyBqdC2/L2gdR4=;
        b=AWR6CM2/ZmsWf8U1L8ip6+9W9EJwYsuW9ND8nt7nnN5s7DsDMjqnJDpF2D/XPhgSHz
         Rz+FUk4pkJz423n81ak9AHLOMfBo8U+YDuqlAPJ7J1R0s7I+thQit4wZkzOPStTBL/Xl
         3YVY2bjkyPZ7ZWI8JrRpfs4eybMCsbiDWrMHOjdcVFgml9UzT4tx+i8BjVD8qTn8/k4H
         +M4/WvzCvNq0+8plJMJCQyGxF+97qqBTmf4141zr5k4a4kyjNP100EUTLR58vn3oWie0
         SmAyBQ+OPGe/zJ1P+OXgEzoqaNmEsovC04vOdpZHeCD03MtN0KTuf1kMyvwqZgWDElSH
         X9rQ==
X-Gm-Message-State: AOAM5313rcDXu0Yj1PFnkxVI3YHb8cM8NTRZzgwNUFPmH2hDChbI4vC9
	YQiuhVdiFQWaBYik6wo+JBQO
X-Google-Smtp-Source: ABdhPJzv6LHBu35KQ0u9lyvLRrRL7BAKiiARtocwCQcXTPiUB6twtjyk94EIKmCyzeOvbr4dFINuGg==
X-Received: by 2002:a17:90a:9517:b0:1bc:81ef:79cd with SMTP id t23-20020a17090a951700b001bc81ef79cdmr22229860pjo.164.1646150618733;
        Tue, 01 Mar 2022 08:03:38 -0800 (PST)
Received: from localhost.localdomain ([117.207.25.80])
        by smtp.gmail.com with ESMTPSA id m17-20020a17090a859100b001bc20ddcc67sm2489530pjn.34.2022.03.01.08.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 08:03:38 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: gregkh@linuxfoundation.org
Cc: mhi@lists.linux.dev,
	quic_hemantk@quicinc.com,
	quic_bbhatt@quicinc.com,
	elder@linaro.org,
	paul.davey@alliedtelesis.co.nz,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Hemant Kumar <hemantk@codeaurora.org>
Subject: [PATCH 04/10] bus: mhi: Move host MHI code to "host" directory
Date: Tue,  1 Mar 2022 21:33:02 +0530
Message-Id: <20220301160308.107452-5-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301160308.107452-1-manivannan.sadhasivam@linaro.org>
References: <20220301160308.107452-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation of the endpoint MHI support, let's move the host MHI code
to its own "host" directory and adjust the toplevel MHI Kconfig & Makefile.

While at it, let's also move the "pci_generic" driver to "host" directory
as it is a host MHI controller driver.

Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
Reviewed-by: Alex Elder <elder@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/Makefile                      |  2 +-
 drivers/bus/mhi/Kconfig                   | 27 ++------------------
 drivers/bus/mhi/Makefile                  |  8 ++----
 drivers/bus/mhi/host/Kconfig              | 31 +++++++++++++++++++++++
 drivers/bus/mhi/{core => host}/Makefile   |  4 ++-
 drivers/bus/mhi/{core => host}/boot.c     |  0
 drivers/bus/mhi/{core => host}/debugfs.c  |  0
 drivers/bus/mhi/{core => host}/init.c     |  0
 drivers/bus/mhi/{core => host}/internal.h |  0
 drivers/bus/mhi/{core => host}/main.c     |  0
 drivers/bus/mhi/{ => host}/pci_generic.c  |  0
 drivers/bus/mhi/{core => host}/pm.c       |  0
 12 files changed, 39 insertions(+), 33 deletions(-)
 create mode 100644 drivers/bus/mhi/host/Kconfig
 rename drivers/bus/mhi/{core => host}/Makefile (54%)
 rename drivers/bus/mhi/{core => host}/boot.c (100%)
 rename drivers/bus/mhi/{core => host}/debugfs.c (100%)
 rename drivers/bus/mhi/{core => host}/init.c (100%)
 rename drivers/bus/mhi/{core => host}/internal.h (100%)
 rename drivers/bus/mhi/{core => host}/main.c (100%)
 rename drivers/bus/mhi/{ => host}/pci_generic.c (100%)
 rename drivers/bus/mhi/{core => host}/pm.c (100%)

diff --git a/drivers/bus/Makefile b/drivers/bus/Makefile
index 52c2f35a26a9..16da51130d1a 100644
--- a/drivers/bus/Makefile
+++ b/drivers/bus/Makefile
@@ -39,4 +39,4 @@ obj-$(CONFIG_VEXPRESS_CONFIG)	+= vexpress-config.o
 obj-$(CONFIG_DA8XX_MSTPRI)	+= da8xx-mstpri.o
 
 # MHI
-obj-$(CONFIG_MHI_BUS)		+= mhi/
+obj-y				+= mhi/
diff --git a/drivers/bus/mhi/Kconfig b/drivers/bus/mhi/Kconfig
index da5cd0c9fc62..4748df7f9cd5 100644
--- a/drivers/bus/mhi/Kconfig
+++ b/drivers/bus/mhi/Kconfig
@@ -2,30 +2,7 @@
 #
 # MHI bus
 #
-# Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
+# Copyright (c) 2021, Linaro Ltd.
 #
 
-config MHI_BUS
-	tristate "Modem Host Interface (MHI) bus"
-	help
-	  Bus driver for MHI protocol. Modem Host Interface (MHI) is a
-	  communication protocol used by the host processors to control
-	  and communicate with modem devices over a high speed peripheral
-	  bus or shared memory.
-
-config MHI_BUS_DEBUG
-	bool "Debugfs support for the MHI bus"
-	depends on MHI_BUS && DEBUG_FS
-	help
-	  Enable debugfs support for use with the MHI transport. Allows
-	  reading and/or modifying some values within the MHI controller
-	  for debug and test purposes.
-
-config MHI_BUS_PCI_GENERIC
-	tristate "MHI PCI controller driver"
-	depends on MHI_BUS
-	depends on PCI
-	help
-	  This driver provides MHI PCI controller driver for devices such as
-	  Qualcomm SDX55 based PCIe modems.
-
+source "drivers/bus/mhi/host/Kconfig"
diff --git a/drivers/bus/mhi/Makefile b/drivers/bus/mhi/Makefile
index 0a2d778d6fb4..5f5708a249f5 100644
--- a/drivers/bus/mhi/Makefile
+++ b/drivers/bus/mhi/Makefile
@@ -1,6 +1,2 @@
-# core layer
-obj-y += core/
-
-obj-$(CONFIG_MHI_BUS_PCI_GENERIC) += mhi_pci_generic.o
-mhi_pci_generic-y += pci_generic.o
-
+# Host MHI stack
+obj-y += host/
diff --git a/drivers/bus/mhi/host/Kconfig b/drivers/bus/mhi/host/Kconfig
new file mode 100644
index 000000000000..da5cd0c9fc62
--- /dev/null
+++ b/drivers/bus/mhi/host/Kconfig
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# MHI bus
+#
+# Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
+#
+
+config MHI_BUS
+	tristate "Modem Host Interface (MHI) bus"
+	help
+	  Bus driver for MHI protocol. Modem Host Interface (MHI) is a
+	  communication protocol used by the host processors to control
+	  and communicate with modem devices over a high speed peripheral
+	  bus or shared memory.
+
+config MHI_BUS_DEBUG
+	bool "Debugfs support for the MHI bus"
+	depends on MHI_BUS && DEBUG_FS
+	help
+	  Enable debugfs support for use with the MHI transport. Allows
+	  reading and/or modifying some values within the MHI controller
+	  for debug and test purposes.
+
+config MHI_BUS_PCI_GENERIC
+	tristate "MHI PCI controller driver"
+	depends on MHI_BUS
+	depends on PCI
+	help
+	  This driver provides MHI PCI controller driver for devices such as
+	  Qualcomm SDX55 based PCIe modems.
+
diff --git a/drivers/bus/mhi/core/Makefile b/drivers/bus/mhi/host/Makefile
similarity index 54%
rename from drivers/bus/mhi/core/Makefile
rename to drivers/bus/mhi/host/Makefile
index c3feb4130aa3..859c2f38451c 100644
--- a/drivers/bus/mhi/core/Makefile
+++ b/drivers/bus/mhi/host/Makefile
@@ -1,4 +1,6 @@
 obj-$(CONFIG_MHI_BUS) += mhi.o
-
 mhi-y := init.o main.o pm.o boot.o
 mhi-$(CONFIG_MHI_BUS_DEBUG) += debugfs.o
+
+obj-$(CONFIG_MHI_BUS_PCI_GENERIC) += mhi_pci_generic.o
+mhi_pci_generic-y += pci_generic.o
diff --git a/drivers/bus/mhi/core/boot.c b/drivers/bus/mhi/host/boot.c
similarity index 100%
rename from drivers/bus/mhi/core/boot.c
rename to drivers/bus/mhi/host/boot.c
diff --git a/drivers/bus/mhi/core/debugfs.c b/drivers/bus/mhi/host/debugfs.c
similarity index 100%
rename from drivers/bus/mhi/core/debugfs.c
rename to drivers/bus/mhi/host/debugfs.c
diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/host/init.c
similarity index 100%
rename from drivers/bus/mhi/core/init.c
rename to drivers/bus/mhi/host/init.c
diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/host/internal.h
similarity index 100%
rename from drivers/bus/mhi/core/internal.h
rename to drivers/bus/mhi/host/internal.h
diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/host/main.c
similarity index 100%
rename from drivers/bus/mhi/core/main.c
rename to drivers/bus/mhi/host/main.c
diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
similarity index 100%
rename from drivers/bus/mhi/pci_generic.c
rename to drivers/bus/mhi/host/pci_generic.c
diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/host/pm.c
similarity index 100%
rename from drivers/bus/mhi/core/pm.c
rename to drivers/bus/mhi/host/pm.c
-- 
2.25.1

