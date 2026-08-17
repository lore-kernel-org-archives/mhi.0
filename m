Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21B93F5BE5
	for <mhi@lists.linux.dev>; Mon, 17 Aug 2026 10:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786961687; cv=none; b=T1jnv0hNfltsgf+24RKeyR75bOB8koGE6xpZVG/2acBZOMRZVLzDg60PJvnUfULtqCasTLtk1j2hkhb4t+W5ZgoaJ4zfgJJTh7rjL7Sq6amoQ6iW0KXb6Qf3Xee7QDtyLCcT1cvgR7C2xRpQWatyXrru63cyt1TRUrwgOTVO8jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786961687; c=relaxed/simple;
	bh=6242R4pzFL7r/tqFjb1Hk8gsb/XCavnRon8/YLzIeJM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UL4UWkKh5UXxLGMFb7yBo/u6RcCTilvaDCwfGb1/KF5QdsIQOs+UrpgPa0d/iVY1+djwAM2vfQdudciOxlA2bVtLhYs3qmKROqxD99n8WlgOC5emFstCJx9SqPzJvkiW3q7VGF4Zml4twDjWkU4/09C53atJ50kRNHCBui2FGAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aJ11wiCz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OKWaX6eC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aJ11wiCz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OKWaX6eC"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67H9de4M1962556
	for <mhi@lists.linux.dev>; Mon, 17 Aug 2026 10:14:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yTbaB+z5Yseh105+ajN8GEITb3BhA9qwqXWhIlbOb/0=; b=aJ11wiCz+MS3ypke
	YupEiIf6/Rx3i0Y8H2eQXrVCJtnOo0oovjHheWjMEYu5AtWlyssIr4jV97/kvjVb
	ZaYUirrxKnIKjGYuDyFYg828t3w5tnx9sRO+n2WEbYPgaEuSRaOVgclRBq0SDWrD
	t5/RT7FCICQi/yaabjuWIqP0Fny8sDh0vQJPteVBC+sdSYQnbJFpdbkWczMovB7H
	JRdQZvLST9BRXQjKrI/y2LF9PVXbaAV+9/rKNhRxFIgj6ANmJZ3OXhnYbFLZ6Wb+
	m8YQRB6F86K165mg+YHG/G4hXvAMkSzl0jy8Wkd9F2d8vk3cYr8XZ7WCb5dsGCcj
	kKUWTA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3wregpb5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 17 Aug 2026 10:14:43 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so5429322a91.3
        for <mhi@lists.linux.dev>; Mon, 17 Aug 2026 03:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786961683; x=1787566483; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yTbaB+z5Yseh105+ajN8GEITb3BhA9qwqXWhIlbOb/0=;
        b=OKWaX6eCCM42xj8RJ6zSnkMVeQfLPE8SiZNc6KQ0QcB3fTUF9AKPAoE2AjSXkntwZc
         I13jorc8XSH27nk0UAU/aMz6RWwdUDq9Sdtkuk5giISn3C1SRXbmkbk0fDNx/xgpyYSQ
         6BWdI2Hes+xIwNeqpYNHNeSB7UDevlQaDQlJFs5IzDvdBRSAb8LQBeHODtEt+C9/qOAn
         sOTHYzGQ9xIahiAJ5M9JMOfcr6NtZfyzgmSbi6ayKSKk3EBdtGgkLFCHvz1ai5E48ezw
         Jlo85snhX5lWuGP8D/joVh9ChSPMcX4CQwi3pTLycl/utwdf5cfQMwY2g9jaBxm6QEad
         5Log==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786961683; x=1787566483;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yTbaB+z5Yseh105+ajN8GEITb3BhA9qwqXWhIlbOb/0=;
        b=VlrZG+o2nlE2vIcR7R2d+soxwjb81gBNuYkS8Tn9JRUlnlUM6c7AbZrmIyHutW5vvk
         F6cRCrFVDQ2kZvd/Kj3xRjsgXiMSlRejbMi67pzMCDuSVufsga7OBr+LgU8WtxluEeRJ
         A+7vdeSEkuuDoGjU0uiTcjNrOriCW7OqKX8V0jpZzo81bg5lAClrG54EH956V+DJCOO4
         bwCjiUehPD7x0r44TkMoUVbMtpYcGkfb9dOETjgWK9sL5ScOzwjsCF9xPBCBgKgxVg5v
         iig6mxSoiE7UBtmW7NG4/qFfRVUqqkfMJ5A+pGM7d47jXcvz1s8nBr4SjkOd2FrptU/J
         TuCg==
X-Gm-Message-State: AOJu0YwWum4Q2g6Nhx+Cmv4QJJ2Wlh29t7UaFMitB4EAzjOrqp14qhOL
	Ex4DsyFjn96G+xUHfx8I7DP1zcpAPRf09vUdXvNQLUXNF74p23z8F6fr9jOgRxsyhH6+s/Le2pm
	TDqVBXWYGGNx5GNyvrya8JqQILK+Bl0IdabDkEEzXNqmlDgAKAjl9iIs=
X-Gm-Gg: AR+sD108nRFg7LNGDQjPeJM/3yKrVfCL4yaOAQRGR0BAdN/Mcx+84srf3QwcdpbZJR6
	q5z18D7tWm4X+tdCDEpWtrZeA+CD5d/a+irXQlIod/Fc6SCfn2YvnKC+etGdhyDMDPqQSuWbqlQ
	Xt+DPP0mBQnVoOhpeqm/MKybfmp3NxT83lenlvhYAaqPMChKtQ5aCpxr4ZDzTPtZgwe4BQSOWWK
	0XS3xVE1pD1Zr7OJsTgqt/wO2Z5XQu9/9c5AnJjBVw8yNCZq+vKbpjpNCFVczcbGjEvz9pytQTY
	TIdGgIVboH6+eE2iPpSO/qQHOnI3Cv0texbzPBibWyPkU5EvlLZqdL4375mwe/dmPW2G6XCSwI2
	+wgF2z4sYsAeZehxBnI42fPQpoA==
X-Received: by 2002:a17:90b:4d08:b0:37f:c22a:c188 with SMTP id 98e67ed59e1d1-3933b6f0622mr23595400a91.4.1786961682469;
        Mon, 17 Aug 2026 03:14:42 -0700 (PDT)
X-Received: by 2002:a17:90b:4d08:b0:37f:c22a:c188 with SMTP id 98e67ed59e1d1-3933b6f0622mr23595346a91.4.1786961681828;
        Mon, 17 Aug 2026 03:14:41 -0700 (PDT)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3954d3d2adcsm1744315a91.17.2026.08.17.03.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 03:14:41 -0700 (PDT)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 15:44:34 +0530
Subject: [PATCH v5 1/3] bus: mhi: host: clients: Add loopback driver with
 sysfs interface
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260817-loopback_mhi-v5-1-50efc7360b7f@oss.qualcomm.com>
References: <20260817-loopback_mhi-v5-0-50efc7360b7f@oss.qualcomm.com>
In-Reply-To: <20260817-loopback_mhi-v5-0-50efc7360b7f@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sumit Kumar <sumit.kumar@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786961675; l=14334;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=6242R4pzFL7r/tqFjb1Hk8gsb/XCavnRon8/YLzIeJM=;
 b=8H68ii6iQDydZl4GwH7JaNP/j6O90+9yS30DEbxuL+1oqrKM//Ej7vTAUvnZGFmxxY7WF7Jgz
 Q5Zu5t6tQ3iD66SdB3YtwCKlhc3qXu5eLnIosL1tQldjobMO3YtIE5C
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Authority-Analysis: v=2.4 cv=FqI1OWrq c=1 sm=1 tr=0 ts=6a82df13 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=lEU7m922GBS3jRTx-gMA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: 8VlrRhXLJLr-O8ecAMGf-o2SHy3DX15W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA3NSBTYWx0ZWRfX03BLfsjBGm0U
 RpwoS/nTOpNp2yJWfpwxFZJr3niDHNqcheMoaS11uUhu67tNoIB3baECEnZYSV+U6JlAdCtFgjY
 Of+XPyoUBHXzWm4QgJB2AS85rhHE19rgEt9dDUBCD+NNJX9g7x4r3xmUFoYva/8NDyPZXXme+ov
 xtGy/1NJ4/CanubAsorzgyuoBJLWz47z44P2m0wat+FfdVeWUSIP2nCiGUvI9HE6YGFt8Ffv2RC
 7PHpk3jYcQFbseLX/ko2CJr1BERQbXZDJcg6MCTOebeSsUobTXNh3yIujhIjzt4o9HXDrumRqul
 rjgOyKqAQSWm7jIZHffKA9JSFkCAUdgtVZz2W1wk8UOWedQ7WaCuaDk9sbd8Qro/jkpLKVMu3R+
 cesJtUPwwoPzUck2EXkaSTQ8vZZQeN2kn8TtexDwazEyzf4IdybH3zh0lvOi29rT9gTTpuFBtrP
 7CjtawLYzfzUSktZDVw==
X-Proofpoint-GUID: 8VlrRhXLJLr-O8ecAMGf-o2SHy3DX15W
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA3NSBTYWx0ZWRfX//0MM0r7TCHw
 z+43EtQZIvl3iOp+HZGMLtSYKzofaV0cSMZ/kvm3cw5q/G2Vb6tdKvwmqJwJs3UGRBp+Naup1iq
 kRZ/fscczKHuARHlgDgKQfX8jA5U7/4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170075

The MHI specification defines a LOOPBACK channel. The endpoint firmware
echoes back whatever the host sends on this channel. Without a host-side
driver, there is no way to exercise this channel to validate MHI data path
integrity between host and endpoint.

Add a host-side loopback driver that binds to the LOOPBACK channel and
expose a sysfs interface for data path testing. The sysfs interface allows
users to configure TRE buffer size and count, trigger a loopback test, and
read the result.

Co-developed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-mhi-devices-loopback     |  39 +++
 MAINTAINERS                                        |   1 +
 drivers/bus/mhi/host/Kconfig                       |   1 +
 drivers/bus/mhi/host/Makefile                      |   1 +
 drivers/bus/mhi/host/clients/Kconfig               |  17 ++
 drivers/bus/mhi/host/clients/Makefile              |   2 +
 drivers/bus/mhi/host/clients/loopback.c            | 289 +++++++++++++++++++++
 7 files changed, 350 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-mhi-devices-loopback b/Documentation/ABI/testing/sysfs-bus-mhi-devices-loopback
new file mode 100644
index 0000000000000000000000000000000000000000..1622a146110c2069c8b51e5bdf665c882b853303
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-mhi-devices-loopback
@@ -0,0 +1,39 @@
+What:		/sys/bus/mhi/devices/mhi<N>_LOOPBACK/tre_size
+Date:		August 2026
+KernelVersion:	7.2
+Contact:	mhi@lists.linux.dev
+Description:
+		(RW) Size of each Transfer Ring Element (TRE) buffer in bytes
+		used for the loopback test. Valid range is 1 to the value
+		reported by max_tre_size. Default value is 32 bytes.
+
+What:		/sys/bus/mhi/devices/mhi<N>_LOOPBACK/max_tre_size
+Date:		August 2026
+KernelVersion:	7.2
+Contact:	mhi@lists.linux.dev
+Description:
+		(RO) Maximum allowed TRE size in bytes. Reading this file
+		returns the upper bound for the tre_size attribute.
+
+What:		/sys/bus/mhi/devices/mhi<N>_LOOPBACK/num_tre
+Date:		August 2026
+KernelVersion:	7.2
+Contact:	mhi@lists.linux.dev
+Description:
+		(RW) Number of Transfer Ring Elements (TREs) to use per
+		loopback test. Must be greater than zero and must not exceed
+		the channel ring capacity. Default value is 1.
+
+What:		/sys/bus/mhi/devices/mhi<N>_LOOPBACK/start
+Date:		August 2026
+KernelVersion:	7.2
+Contact:	mhi@lists.linux.dev
+Description:
+		(WO) Write any value to trigger a loopback test. The driver
+		sends random data to the endpoint using the configured tre_size
+		and num_tre parameters, waits for the endpoint to echo it back,
+		and verifies the received data matches what was sent.
+
+		This is a blocking write that returns when the test completes
+		or times out after 5 seconds. The write returns an error code
+		if the test fails or times out.
diff --git a/MAINTAINERS b/MAINTAINERS
index a4b89bd497ad5051c190025838e0e93d257ed061..098b12692140514da52565a3200801f5e24a43b7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17469,6 +17469,7 @@ L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git
 F:	Documentation/ABI/stable/sysfs-bus-mhi
+F:	Documentation/ABI/testing/sysfs-bus-mhi-devices-loopback
 F:	Documentation/mhi/
 F:	drivers/bus/mhi/
 F:	drivers/pci/endpoint/functions/pci-epf-mhi.c
diff --git a/drivers/bus/mhi/host/Kconfig b/drivers/bus/mhi/host/Kconfig
index da5cd0c9fc620ab595e742c422f1a22a2a84c7b9..627c57948235aa52348179ae8b2d0826ebaed01e 100644
--- a/drivers/bus/mhi/host/Kconfig
+++ b/drivers/bus/mhi/host/Kconfig
@@ -29,3 +29,4 @@ config MHI_BUS_PCI_GENERIC
 	  This driver provides MHI PCI controller driver for devices such as
 	  Qualcomm SDX55 based PCIe modems.
 
+source "drivers/bus/mhi/host/clients/Kconfig"
diff --git a/drivers/bus/mhi/host/Makefile b/drivers/bus/mhi/host/Makefile
index 859c2f38451c669b3d3014c374b2b957c99a1cfe..2a16008aeb38127494782bbff4e1656428d2b776 100644
--- a/drivers/bus/mhi/host/Makefile
+++ b/drivers/bus/mhi/host/Makefile
@@ -4,3 +4,4 @@ mhi-$(CONFIG_MHI_BUS_DEBUG) += debugfs.o
 
 obj-$(CONFIG_MHI_BUS_PCI_GENERIC) += mhi_pci_generic.o
 mhi_pci_generic-y += pci_generic.o
+obj-y += clients/
diff --git a/drivers/bus/mhi/host/clients/Kconfig b/drivers/bus/mhi/host/clients/Kconfig
new file mode 100644
index 0000000000000000000000000000000000000000..312a0b5a8e83b6ad7246453908bd552841a89188
--- /dev/null
+++ b/drivers/bus/mhi/host/clients/Kconfig
@@ -0,0 +1,17 @@
+# SPDX-License-Identifier: GPL-2.0
+
+config MHI_BUS_LOOPBACK
+	tristate "MHI LOOPBACK client driver"
+	depends on MHI_BUS
+	help
+	  MHI LOOPBACK client driver that binds to the MHI LOOPBACK channel
+	  as defined in the MHI specification. The LOOPBACK channel is
+	  implemented by MHI-based devices (modems, WLAN) in the field, where
+	  the endpoint firmware echoes back whatever the host sends.
+
+	  This driver exposes a sysfs interface for testing MHI data path
+	  integrity between host and endpoint. Users can configure the TRE
+	  size and count, and trigger a loopback test.
+
+	  To compile this driver as a module, choose M here. The module
+	  will be called mhi_loopback.
diff --git a/drivers/bus/mhi/host/clients/Makefile b/drivers/bus/mhi/host/clients/Makefile
new file mode 100644
index 0000000000000000000000000000000000000000..3811b6928f42b38f94b1167941cf3b0fe512d32b
--- /dev/null
+++ b/drivers/bus/mhi/host/clients/Makefile
@@ -0,0 +1,2 @@
+obj-$(CONFIG_MHI_BUS_LOOPBACK) += mhi_loopback.o
+mhi_loopback-y += loopback.o
diff --git a/drivers/bus/mhi/host/clients/loopback.c b/drivers/bus/mhi/host/clients/loopback.c
new file mode 100644
index 0000000000000000000000000000000000000000..02a952e8e01222cd8cb842c9f9490479df8ea2bd
--- /dev/null
+++ b/drivers/bus/mhi/host/clients/loopback.c
@@ -0,0 +1,289 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/atomic.h>
+#include <linux/cleanup.h>
+#include <linux/completion.h>
+#include <linux/errno.h>
+#include <linux/mhi.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/random.h>
+#include <linux/sizes.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/sysfs.h>
+#include <linux/types.h>
+
+#define MHI_LOOPBACK_DEFAULT_TRE_SIZE	32
+#define MHI_LOOPBACK_DEFAULT_NUM_TRE	1
+#define MHI_LOOPBACK_TIMEOUT_MS		5000
+#define MHI_LOOPBACK_MAX_TRE_SIZE	(SZ_64K - 1)
+
+struct mhi_loopback {
+	struct mhi_device *mdev;
+	/* Serializes the sysfs attributes against a running test */
+	struct mutex lb_mutex;
+	struct completion comp;
+	atomic_t tre_pending;
+	u32 num_tre;
+	u32 tre_size;
+};
+
+static ssize_t tre_size_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
+{
+	struct mhi_loopback *loopback = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%u\n", loopback->tre_size);
+}
+
+static ssize_t tre_size_store(struct device *dev,
+			      struct device_attribute *attr,
+			      const char *buf, size_t count)
+{
+	struct mhi_loopback *loopback = dev_get_drvdata(dev);
+	u32 val;
+
+	if (kstrtou32(buf, 0, &val))
+		return -EINVAL;
+
+	if (val == 0 || val > MHI_LOOPBACK_MAX_TRE_SIZE)
+		return -EINVAL;
+
+	guard(mutex)(&loopback->lb_mutex);
+	loopback->tre_size = val;
+
+	return count;
+}
+static DEVICE_ATTR_RW(tre_size);
+
+static ssize_t max_tre_size_show(struct device *dev,
+				 struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%u\n", MHI_LOOPBACK_MAX_TRE_SIZE);
+}
+static DEVICE_ATTR_RO(max_tre_size);
+
+static ssize_t num_tre_show(struct device *dev,
+			    struct device_attribute *attr, char *buf)
+{
+	struct mhi_loopback *loopback = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%u\n", loopback->num_tre);
+}
+
+static ssize_t num_tre_store(struct device *dev,
+			     struct device_attribute *attr,
+			     const char *buf, size_t count)
+{
+	struct mhi_loopback *loopback = dev_get_drvdata(dev);
+	u32 val;
+	int el_num;
+
+	if (kstrtou32(buf, 0, &val))
+		return -EINVAL;
+
+	if (val == 0)
+		return -EINVAL;
+
+	guard(mutex)(&loopback->lb_mutex);
+
+	el_num = min(mhi_get_free_desc_count(loopback->mdev, DMA_TO_DEVICE),
+		     mhi_get_free_desc_count(loopback->mdev, DMA_FROM_DEVICE));
+	if (val > el_num) {
+		dev_err(dev, "num_tre (%u) exceeds ring capacity (%d)\n", val, el_num);
+		return -EINVAL;
+	}
+
+	loopback->num_tre = val;
+
+	return count;
+}
+static DEVICE_ATTR_RW(num_tre);
+
+static ssize_t start_store(struct device *dev,
+			   struct device_attribute *attr,
+			   const char *buf, size_t count)
+{
+	struct mhi_loopback *loopback = dev_get_drvdata(dev);
+	u32 total_size, tre_count, tre_size;
+	int i, ret;
+
+	guard(mutex)(&loopback->lb_mutex);
+
+	tre_size = loopback->tre_size;
+	tre_count = loopback->num_tre;
+	total_size = size_mul(tre_count, tre_size);
+
+	if (total_size > KMALLOC_MAX_SIZE)
+		return -EINVAL;
+
+	if (tre_count > mhi_get_free_desc_count(loopback->mdev, DMA_TO_DEVICE) ||
+	    tre_count > mhi_get_free_desc_count(loopback->mdev, DMA_FROM_DEVICE)) {
+		dev_err(dev, "Not enough ring space for %u TREs\n", tre_count);
+		return -ENOSPC;
+	}
+
+	void *recv_buf __free(kfree) = kzalloc(total_size, GFP_KERNEL);
+	if (!recv_buf)
+		return -ENOMEM;
+
+	void *send_buf __free(kfree) = kzalloc(total_size, GFP_KERNEL);
+	if (!send_buf)
+		return -ENOMEM;
+
+	get_random_bytes(send_buf, total_size);
+
+	atomic_set(&loopback->tre_pending, tre_count);
+	reinit_completion(&loopback->comp);
+
+	for (i = 0; i < tre_count; i++) {
+		ret = mhi_queue_buf(loopback->mdev, DMA_FROM_DEVICE,
+				    recv_buf + (i * tre_size), tre_size, MHI_EOT);
+		if (ret) {
+			dev_err(dev, "Unable to queue read TRE %d: %d\n", i, ret);
+			if (atomic_sub_and_test(tre_count - i, &loopback->tre_pending))
+				complete(&loopback->comp);
+			return ret;
+		}
+	}
+
+	for (i = 0; i < tre_count - 1; i++) {
+		ret = mhi_queue_buf(loopback->mdev, DMA_TO_DEVICE,
+				    send_buf + (i * tre_size), tre_size, MHI_CHAIN);
+		if (ret) {
+			dev_err(dev, "Unable to queue send TRE %d: %d\n", i, ret);
+			return ret;
+		}
+	}
+
+	ret = mhi_queue_buf(loopback->mdev, DMA_TO_DEVICE,
+			    send_buf + (i * tre_size), tre_size, MHI_EOT);
+	if (ret) {
+		dev_err(dev, "Unable to queue final TRE: %d\n", ret);
+		return ret;
+	}
+
+	if (!wait_for_completion_timeout(&loopback->comp,
+					 msecs_to_jiffies(MHI_LOOPBACK_TIMEOUT_MS))) {
+		dev_err(dev, "Loopback test timed out\n");
+		/* Reset the channel to reclaim the TREs still pointing at the buffers */
+		mhi_unprepare_from_transfer(loopback->mdev);
+		ret = mhi_prepare_for_transfer(loopback->mdev);
+		if (ret)
+			dev_err(dev, "Failed to re-prepare channel for transfers: %d\n", ret);
+
+		return -ETIMEDOUT;
+	}
+
+	if (memcmp(send_buf, recv_buf, total_size)) {
+		dev_err(dev, "Loopback data mismatch\n");
+		return -EIO;
+	}
+
+	return count;
+}
+static DEVICE_ATTR_WO(start);
+
+static void mhi_loopback_dl_callback(struct mhi_device *mhi_dev,
+				     struct mhi_result *mhi_res)
+{
+	struct mhi_loopback *loopback = dev_get_drvdata(&mhi_dev->dev);
+
+	if (mhi_res->transaction_status && mhi_res->transaction_status != -ENOTCONN)
+		dev_err(&mhi_dev->dev, "DL callback error: status %d\n",
+			mhi_res->transaction_status);
+
+	if (atomic_dec_and_test(&loopback->tre_pending))
+		complete(&loopback->comp);
+}
+
+static void mhi_loopback_ul_callback(struct mhi_device *mhi_dev,
+				     struct mhi_result *mhi_res)
+{
+	if (mhi_res->transaction_status && mhi_res->transaction_status != -ENOTCONN)
+		dev_err(&mhi_dev->dev, "UL callback error: status %d\n",
+			mhi_res->transaction_status);
+}
+
+static struct attribute *mhi_loopback_attrs[] = {
+	&dev_attr_tre_size.attr,
+	&dev_attr_max_tre_size.attr,
+	&dev_attr_num_tre.attr,
+	&dev_attr_start.attr,
+	NULL,
+};
+
+static const struct attribute_group mhi_loopback_group = {
+	.attrs = mhi_loopback_attrs,
+};
+
+static int mhi_loopback_probe(struct mhi_device *mhi_dev,
+			      const struct mhi_device_id *id)
+{
+	struct mhi_loopback *loopback;
+	int ret;
+
+	loopback = devm_kzalloc(&mhi_dev->dev, sizeof(*loopback), GFP_KERNEL);
+	if (!loopback)
+		return -ENOMEM;
+
+	loopback->mdev = mhi_dev;
+	loopback->tre_size = MHI_LOOPBACK_DEFAULT_TRE_SIZE;
+	loopback->num_tre = MHI_LOOPBACK_DEFAULT_NUM_TRE;
+
+	mutex_init(&loopback->lb_mutex);
+	init_completion(&loopback->comp);
+
+	dev_set_drvdata(&mhi_dev->dev, loopback);
+
+	ret = mhi_prepare_for_transfer(mhi_dev);
+	if (ret) {
+		dev_err(&mhi_dev->dev, "Failed to prepare for transfers: %d\n", ret);
+		return ret;
+	}
+
+	ret = sysfs_create_group(&mhi_dev->dev.kobj, &mhi_loopback_group);
+	if (ret) {
+		dev_err(&mhi_dev->dev, "Failed to create sysfs attributes: %d\n", ret);
+		mhi_unprepare_from_transfer(mhi_dev);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void mhi_loopback_remove(struct mhi_device *mhi_dev)
+{
+	/* Blocks until any in-progress store() has returned */
+	sysfs_remove_group(&mhi_dev->dev.kobj, &mhi_loopback_group);
+	mhi_unprepare_from_transfer(mhi_dev);
+}
+
+static const struct mhi_device_id mhi_loopback_id_table[] = {
+	{ .chan = "LOOPBACK"},
+	{}
+};
+MODULE_DEVICE_TABLE(mhi, mhi_loopback_id_table);
+
+static struct mhi_driver mhi_loopback_driver = {
+	.probe = mhi_loopback_probe,
+	.remove = mhi_loopback_remove,
+	.dl_xfer_cb = mhi_loopback_dl_callback,
+	.ul_xfer_cb = mhi_loopback_ul_callback,
+	.id_table = mhi_loopback_id_table,
+	.driver = {
+		.name = "mhi_loopback",
+	},
+};
+
+module_mhi_driver(mhi_loopback_driver);
+
+MODULE_AUTHOR("Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>");
+MODULE_AUTHOR("Sumit Kumar <sumit.kumar@oss.qualcomm.com>");
+MODULE_DESCRIPTION("MHI Host Loopback Driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1

