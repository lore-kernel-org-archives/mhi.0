Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B500A29CA
	for <mhi@lists.linux.dev>; Thu,  2 Dec 2021 11:37:05 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id x5so27672849pfr.0
        for <mhi@lists.linux.dev>; Thu, 02 Dec 2021 03:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zSQrFvVjHTaJzL0gVsjBGoHAOZWg6l8th+FI3kjqXKs=;
        b=bSXW428wdtdO9DwH49nfULKN1eDbS3z5aL2gUUjQsOaWe5OSNWFM/pPqtH9Q7U9Wtb
         OvL0FBuC2bVXtaZ4LFi4DVGlolMcQ3hqr/eJZPhJzczOAmHY6DxaTklwWB9N4HKz3h0i
         eTPH6k++lrzkifiwXONxsB6NYI5gz9QrzsYPfHK0QW2ddzlRLXurXAEQgvE0jVRPh7L6
         tGk2nDcztFnbYVIGdwMsBxeYgUHFJM+P/+ONv2ua1YIFjcjOqqp6d13mZae8HKqnmEML
         7dO86wb65prolayYcQQuNfiLDijmJyyybw5yzKt07qGHMKKGcJSWAit3eBsctrPUfPJ7
         RtSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zSQrFvVjHTaJzL0gVsjBGoHAOZWg6l8th+FI3kjqXKs=;
        b=qJCQRBhP7AZKEr+01Nbg+veFlPAFB2T2NEqEuO4c7UYrQ85WWuJF+AmoQOPFFmBx3Y
         lIFCMDVF1vbT0gBGj5Dl/YFHjyJ1Prn8vFiCQDwIelqofOERKq7h8Z6u1hDBY1755C+L
         XwQqYy86hJ9wvAznMNpGeM5TqRNA4T5ZRLh7Z8PDZa67h9VIqe+n4ojtzGL8g7cr1y95
         mKWzNRyvPjPV//LJMPGDFluKHrlMGM5di7mcj2CRvssL5HAEwOQICd2Oi3AP3o9bqTR2
         +YbDjkuv5ggOKaMZYrBDEJoa3hqUfLxA2SPtWkTiOGd/zD+FwHCB9uWoagI1Gv0+oQEx
         j6qQ==
X-Gm-Message-State: AOAM531TVnEts+faVTBPb0Z31DzqsKLMvnDQzpxCia72C9zmiSzggRrD
	tG65uIkyw497H8SHO9i5ATNCQnPqB5Gs
X-Google-Smtp-Source: ABdhPJwPYU/CzBLKi+m9HOdJnKuAuitwHFGyiI5pJkWdv4Kd+Rzlz4zqnY/O6TLn9G4OCyjDBG1XvA==
X-Received: by 2002:a63:e50:: with SMTP id 16mr9177720pgo.619.1638445024952;
        Thu, 02 Dec 2021 03:37:04 -0800 (PST)
Received: from localhost.localdomain ([117.202.184.5])
        by smtp.gmail.com with ESMTPSA id h5sm3602552pfi.46.2021.12.02.03.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 03:37:04 -0800 (PST)
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
Subject: [PATCH 01/20] bus: mhi: Move host MHI code to "host" directory
Date: Thu,  2 Dec 2021 17:05:33 +0530
Message-Id: <20211202113553.238011-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211202113553.238011-1-manivannan.sadhasivam@linaro.org>
References: <20211202113553.238011-1-manivannan.sadhasivam@linaro.org>
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

