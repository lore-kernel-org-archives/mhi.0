Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84200413D9C
	for <mhi@lists.linux.dev>; Wed,  1 Jul 2026 10:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782902281; cv=none; b=WiKBwRUaR5Tqd8qyOOcZLsIlMde2xo3jsL2CHBT6ig7ibmnsZvlbiuOIOGRNCce+gpIGa3oCRqgoHQw5puhnIVQvAqtfXUnKwMmk6zNGahU3DbbWH2c+8V0fhbaiOT1Ncs884YhJRL1mxouajIVWOsER8kCPjvD1pjJpRmCs8zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782902281; c=relaxed/simple;
	bh=wxmxFNTxmH1BxvnW9OL8EFs3pxurc8AKng1CYfcu7cA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ERIWIhTLaPOVQLwXixgNvufeHxXg59MF0hzdx4QxgE7beFyjnJozCxtPxms82hA1SXpnRdIS62+XcX2HSvn7dnyWR4JPZJbrmNccyYds1obQEmK8gGHq0jGNLGfMHD+BBUVSifA80HvyZocy4+/C+BrW/HoEtEfasD1d7aTHnsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hPeLipzv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bypijE7f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hPeLipzv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bypijE7f"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A9hmn723400
	for <mhi@lists.linux.dev>; Wed, 1 Jul 2026 10:37:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9CGLii7+KdkxqW5GSTDgBYsnFCYt35AgEJQIXwVb6iw=; b=hPeLipzvwIxeQ6Iw
	I/v/aqXy1ukYmM6DwRcvC0nWDXL+G36WeNNdwXnRCEmJrDJa19wNZtVRsm2AYOsS
	9HsX6lO9ycs1nJpbAc5HiE/sFWQcc00UNWeh8bpHzJWAXJDstv+1ZeGj//PNss12
	jp90/9V/vi3axFOCRKe8NlxV4mqeYT/QV4xuh2PjP6t1CbSUGISNhSGGlJz2/bVl
	+2RbAZPYU0IxzJ5wBerzXfll1LX//KhnjbWoIl+clc1pGTgnKlXT00AJ4N7khEfk
	H84FzcC5h7s69iNzadyQqM7VblPhzFt/Qb/NHPiEyB7W84Ef3OnldCB+r2XO4S9f
	8zJf8Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jvwbjun-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Wed, 01 Jul 2026 10:37:58 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-37fb51faa63so601218a91.0
        for <mhi@lists.linux.dev>; Wed, 01 Jul 2026 03:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782902277; x=1783507077; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9CGLii7+KdkxqW5GSTDgBYsnFCYt35AgEJQIXwVb6iw=;
        b=bypijE7f5UBaA02wgKNKkW+GlYTuQURrKOO1m/n8eE15phQGeds89OZrlY0M/epQgC
         msXWCo5pO+CyFEM9yvrEbLkT2tW9IuYwdzuyRPx97MwkWBPE28yFSoysikVx8b8GWnvY
         xh9R5gv1CTEai+SrbuOTpffcnFWNv00om9AcP4vfyQibhCspiG7lRU9oGatuF2jIt4si
         I++WbHAOd8cEWYQpabJmVVGn1fwSDHPPj3a2jjEX2v0ieLnE/lrvHGmwIgoSO3u/ypfB
         AYylC9/Nlpj6zJxF5eNTpcmZVu/2alpIPJtomE51vtOuy8e192HCHG7Fw8rhJ6Qdms5x
         QMdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782902277; x=1783507077;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9CGLii7+KdkxqW5GSTDgBYsnFCYt35AgEJQIXwVb6iw=;
        b=jWhusgSUJcokcd0EJWZ/pHMrakePjmKHrRp/KSNtfL/TwbRYrVqYqLTjTbO6VJANbA
         m1xR6bKFsRZyvUkzNJ4nvJsxb/2UfhTtxhGBuYOfEuOBNenBi9vEI/3JhdIIBYD4DWPP
         p0Tx/avgilkwY/VqmcmuLV7uTSJ70Xi6kdnd7PeJ5ZWdYDqc8rBIkgJe/SQgWOaeKH+E
         4+7sdVGtnb4k1tNaw+2ZbrDQAVcPsOdQoATwuggTKbCjPo/dz5Zk3Qv9jCm0FlIVlFQv
         1Z6bO679HS08CBQp6WD2EfC+h4+e2QeMUr7FsqOPlz3DLdJ/ac1IsAwn9mGW05bD+3gF
         Fwkw==
X-Forwarded-Encrypted: i=1; AHgh+Rrfp1z5Mru4mE5gAfyN+fjlotozbGzXeQUOnesGF6qIso0p8mPZCp1YNqDm9Q6bJuYSHUI=@lists.linux.dev
X-Gm-Message-State: AOJu0YyX8eb3nFl5IjKFVjIHlHBf0i3FuUTbuXIoCJyjsWb84VFj93KR
	lzLqDT3jmbdt3zlNI/5M3lYj/ZzG+mM78fUnSHCogWG0hzFxjGMFy6qpBxGc2Mdgq+Th6x481kF
	/7OGNsIl106ti+0pt1NyD4/nifzCAYn5fxqDWvN2HkChQ4WTsWKb1G8960EToCdo=
X-Gm-Gg: AfdE7cm9q3auV/+0jQgzNLv6bujqPL/xWMmWa/0oDpzP+9KntW3l5iEspHbt0Xy7d6M
	QDibFGNQJ4R+Bze4JRBONsrwVywp91TdfVRfIvsBUOEIsmVLvuRronhkwonXDSsxU8/glDa33nJ
	cj9oLowSIy44f6pqm1QrLby8IHjjfBKBE2Izv6pug8fhKCMe3wIU/m3zEa1MFMP6exbZ64bHVsM
	mxkBBKaPQEj2w0W1H3pi/uQ4MOturpELM1CiMH0FzQH2Uxp2gWKGmBf3vvdpYEAef/oYW7nL1VD
	xxbAhmZu4RTHXGqF7QCSx3NKbuXvtuPZlt7KRVuJlUyEuxy8CpPziPihT1CX1AqvDm+FHeI3JY2
	GX2xlsDOx8A3HkmA6t19OTAAU4YJCX0NRB3Gs3oQp
X-Received: by 2002:a17:90b:3e8b:b0:36a:caf2:3815 with SMTP id 98e67ed59e1d1-38069c56f8dmr4794479a91.15.1782902277373;
        Wed, 01 Jul 2026 03:37:57 -0700 (PDT)
X-Received: by 2002:a17:90b:3e8b:b0:36a:caf2:3815 with SMTP id 98e67ed59e1d1-38069c56f8dmr4794461a91.15.1782902276872;
        Wed, 01 Jul 2026 03:37:56 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38095bc8a2asm765251a91.0.2026.07.01.03.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 03:37:56 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 16:07:36 +0530
Subject: [PATCH v6 2/7] bus: mhi: Move Sahara protocol driver under MHI
 host client drivers
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-sahara_protocol_new_v2-v6-2-3a78362c4741@oss.qualcomm.com>
References: <20260701-sahara_protocol_new_v2-v6-0-3a78362c4741@oss.qualcomm.com>
In-Reply-To: <20260701-sahara_protocol_new_v2-v6-0-3a78362c4741@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782902263; l=8314;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=wxmxFNTxmH1BxvnW9OL8EFs3pxurc8AKng1CYfcu7cA=;
 b=32s35dE7TBGTdrUbkA5pWw9MVuhVZXZRIBb0AuTgB/dRjIjFnBAHX+KGwqCippedoqNKayW/w
 aJ9QaySeN5lBfhwZqJcp629lFPZM/xhN0waoYPP3rmxgoQvgrTZBNCg
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-ORIG-GUID: 0BJSCSphHc_5_Hef-PFXMaOmihT0Itwo
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDExMCBTYWx0ZWRfXxL4Bf+LRSn5X
 3Wf/c7ZD3PQ3OSEvKZ6MRoRgyGbZ7WKgY3XWqa1rqEqFX/C6fanR4yVWIuY+AYHCYIkUavc3Wq5
 HNiBmnPZfOk7qcUvB8IfadLAC3LTeFE=
X-Authority-Analysis: v=2.4 cv=JKgLdcKb c=1 sm=1 tr=0 ts=6a44ee06 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=h4jUYMdnt1ASHzOZM6YA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 0BJSCSphHc_5_Hef-PFXMaOmihT0Itwo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDExMCBTYWx0ZWRfX5VlKUZrz+UZm
 LqYB4b7/j0fQwK7Pq+GHu08LLiSLu05T2Qs2QyIZqNE8vGmuK6OlYbh6hAKKQBA6D8c6cqAj4a1
 TCxRBrGEbBcnjqwJyU+xT9jbnJ4LctzzjvhT8xAXG4KGM/A3sgotEX2H4yRwoB14zPJY2J6aRIf
 LxTxTnEnMvjYwJm50JNiaxgdZ+5atFlh9J9uBqJW+UEv2FD9y0LOQZUptf2j9mFj2lxen8Zgz55
 B/s3g/U0ZNJMaHAj3vmVQ23D7NlbbcWqrq0kRFRFlmTWnO2e3G+t6mCQ5oJOMjCe8PN7Aw+EIvS
 rWrWPlYtCMaysbYaKO5c5E11fui07L1LR9y4ey+xHFAhuW7IcH8L1Fl9HYnYCDaCk9CjRGpkEF+
 /+tvGX539u0MwER9/iSTAGSn3ZvOMcco/nihfkjl334T8k2ozXlhMJVITzmqLkyWeoVAmwhXBBz
 TNi4E7GMWdbJG+ofheA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1011
 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010110

The Sahara protocol driver currently lives under the QAIC accelerator
subsystem even though the protocol is transported over MHI and is used by
multiple Qualcomm flashless devices. This makes Sahara appear QAIC specific
and complicates reuse by other MHI based devices.

Move the Sahara protocol driver under drivers/bus/mhi as a host client
driver and build it as an independent MHI protocol driver. This keeps the
QAIC driver focused on the accelerator device while allowing other MHI
users to enable Sahara without depending on QAIC.

As part of the move, add a dedicated Kconfig/Makefile hierarchy under the
MHI host client drivers and convert the driver to use module_mhi_driver()
instead of register/unregister hooks.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 drivers/accel/qaic/Kconfig                           |  1 +
 drivers/accel/qaic/Makefile                          |  3 +--
 drivers/accel/qaic/qaic_drv.c                        |  9 ---------
 drivers/accel/qaic/sahara.h                          | 10 ----------
 drivers/bus/mhi/Kconfig                              |  1 +
 drivers/bus/mhi/host/Makefile                        |  1 +
 drivers/bus/mhi/host/clients/Kconfig                 |  5 +++++
 drivers/bus/mhi/host/clients/Makefile                |  1 +
 drivers/bus/mhi/host/clients/sahara/Kconfig          | 15 +++++++++++++++
 drivers/bus/mhi/host/clients/sahara/Makefile         |  2 ++
 .../qaic => bus/mhi/host/clients/sahara}/sahara.c    | 20 +++++++-------------
 11 files changed, 34 insertions(+), 34 deletions(-)

diff --git a/drivers/accel/qaic/Kconfig b/drivers/accel/qaic/Kconfig
index 116e42d152ca885b8c59e33c7a87519a0abc6bb3..af90fdfcf77eeb6dd5ad309b33d793d4fdc91b1e 100644
--- a/drivers/accel/qaic/Kconfig
+++ b/drivers/accel/qaic/Kconfig
@@ -8,6 +8,7 @@ config DRM_ACCEL_QAIC
 	depends on DRM_ACCEL
 	depends on PCI && HAS_IOMEM
 	depends on MHI_BUS
+	depends on MHI_SAHARA
 	select CRC32
 	select WANT_DEV_COREDUMP
 	help
diff --git a/drivers/accel/qaic/Makefile b/drivers/accel/qaic/Makefile
index 71f727b74da3bb4478324689f02a7cea24a05c2d..e7b8458800072aa627f7f36c3257883aa56f4ce4 100644
--- a/drivers/accel/qaic/Makefile
+++ b/drivers/accel/qaic/Makefile
@@ -13,7 +13,6 @@ qaic-y := \
 	qaic_ras.o \
 	qaic_ssr.o \
 	qaic_sysfs.o \
-	qaic_timesync.o \
-	sahara.o
+	qaic_timesync.o
 
 qaic-$(CONFIG_DEBUG_FS) += qaic_debugfs.o
diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
index 63fb8c7b4abcbe4f1b76c32106f4e8b9ea5e2c8e..3907b13e426064f4fa069e803cc44462feea4063 100644
--- a/drivers/accel/qaic/qaic_drv.c
+++ b/drivers/accel/qaic/qaic_drv.c
@@ -32,7 +32,6 @@
 #include "qaic_ras.h"
 #include "qaic_ssr.h"
 #include "qaic_timesync.h"
-#include "sahara.h"
 
 MODULE_IMPORT_NS("DMA_BUF");
 
@@ -791,12 +790,6 @@ static int __init qaic_init(void)
 		goto free_pci;
 	}
 
-	ret = sahara_register();
-	if (ret) {
-		pr_debug("qaic: sahara_register failed %d\n", ret);
-		goto free_mhi;
-	}
-
 	ret = qaic_timesync_init();
 	if (ret)
 		pr_debug("qaic: qaic_timesync_init failed %d\n", ret);
@@ -818,7 +811,6 @@ static int __init qaic_init(void)
 
 free_bootlog:
 	qaic_bootlog_unregister();
-free_mhi:
 	mhi_driver_unregister(&qaic_mhi_driver);
 free_pci:
 	pci_unregister_driver(&qaic_pci_driver);
@@ -847,7 +839,6 @@ static void __exit qaic_exit(void)
 	qaic_ras_unregister();
 	qaic_bootlog_unregister();
 	qaic_timesync_deinit();
-	sahara_unregister();
 	mhi_driver_unregister(&qaic_mhi_driver);
 	pci_unregister_driver(&qaic_pci_driver);
 }
diff --git a/drivers/accel/qaic/sahara.h b/drivers/accel/qaic/sahara.h
deleted file mode 100644
index 640208acc0d13d423bd9220e6861b7c141af74ff..0000000000000000000000000000000000000000
--- a/drivers/accel/qaic/sahara.h
+++ /dev/null
@@ -1,10 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-
-/* Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved. */
-
-#ifndef __SAHARA_H__
-#define __SAHARA_H__
-
-int sahara_register(void);
-void sahara_unregister(void);
-#endif /* __SAHARA_H__ */
diff --git a/drivers/bus/mhi/Kconfig b/drivers/bus/mhi/Kconfig
index b39a11e6c624ba00349cca22d74bd876020590ab..720115218c2401c99b29f79bbd4113cd877503ac 100644
--- a/drivers/bus/mhi/Kconfig
+++ b/drivers/bus/mhi/Kconfig
@@ -7,3 +7,4 @@
 
 source "drivers/bus/mhi/host/Kconfig"
 source "drivers/bus/mhi/ep/Kconfig"
+source "drivers/bus/mhi/host/clients/Kconfig"
diff --git a/drivers/bus/mhi/host/Makefile b/drivers/bus/mhi/host/Makefile
index 859c2f38451c669b3d3014c374b2b957c99a1cfe..2e8949f1a2fe6f3f3b2e1dc541f97d2c393d6a0f 100644
--- a/drivers/bus/mhi/host/Makefile
+++ b/drivers/bus/mhi/host/Makefile
@@ -4,3 +4,4 @@ mhi-$(CONFIG_MHI_BUS_DEBUG) += debugfs.o
 
 obj-$(CONFIG_MHI_BUS_PCI_GENERIC) += mhi_pci_generic.o
 mhi_pci_generic-y += pci_generic.o
+obj-$(CONFIG_MHI_BUS) += clients/
diff --git a/drivers/bus/mhi/host/clients/Kconfig b/drivers/bus/mhi/host/clients/Kconfig
new file mode 100644
index 0000000000000000000000000000000000000000..a4f2a3c1d20c887cc474646ea91532d775a13f57
--- /dev/null
+++ b/drivers/bus/mhi/host/clients/Kconfig
@@ -0,0 +1,5 @@
+menu "MHI host client drivers"
+
+source "drivers/bus/mhi/host/clients/sahara/Kconfig"
+
+endmenu
diff --git a/drivers/bus/mhi/host/clients/Makefile b/drivers/bus/mhi/host/clients/Makefile
new file mode 100644
index 0000000000000000000000000000000000000000..62e2fa161565225be7f6a23d3cdf4f2f169cb7ce
--- /dev/null
+++ b/drivers/bus/mhi/host/clients/Makefile
@@ -0,0 +1 @@
+obj-$(CONFIG_MHI_SAHARA) += sahara/
diff --git a/drivers/bus/mhi/host/clients/sahara/Kconfig b/drivers/bus/mhi/host/clients/sahara/Kconfig
new file mode 100644
index 0000000000000000000000000000000000000000..f1fc7013a2dee0be645c50f32305659e591de7e7
--- /dev/null
+++ b/drivers/bus/mhi/host/clients/sahara/Kconfig
@@ -0,0 +1,15 @@
+config MHI_SAHARA
+	tristate "Sahara protocol driver"
+	depends on MHI_BUS
+	help
+	  Enable support for the Sahara protocol transported over the MHI bus.
+
+	  The Sahara protocol is used to transfer firmware images, retrieve
+	  memory dumps and exchange command mode DDR calibration data between
+	  host and device. This driver is not tied to a specific SoC and may be
+	  used by multiple MHI based devices.
+
+	  If unsure, say N.
+
+	  To compile this driver as a module, choose M here: the module will be
+	  called mhi_sahara.
diff --git a/drivers/bus/mhi/host/clients/sahara/Makefile b/drivers/bus/mhi/host/clients/sahara/Makefile
new file mode 100644
index 0000000000000000000000000000000000000000..fc02a25935011cbd7138ea8f24b88cf5b032a4ce
--- /dev/null
+++ b/drivers/bus/mhi/host/clients/sahara/Makefile
@@ -0,0 +1,2 @@
+obj-$(CONFIG_MHI_SAHARA) += mhi_sahara.o
+mhi_sahara-y := sahara.o
diff --git a/drivers/accel/qaic/sahara.c b/drivers/bus/mhi/host/clients/sahara/sahara.c
similarity index 99%
rename from drivers/accel/qaic/sahara.c
rename to drivers/bus/mhi/host/clients/sahara/sahara.c
index fd3c3b2d1fd3bb698809e6ca669128e2dce06613..858dc5bc39c1ad42922cabef3b1abcd43bc4f0f4 100644
--- a/drivers/accel/qaic/sahara.c
+++ b/drivers/bus/mhi/host/clients/sahara/sahara.c
@@ -1,6 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0-only
-
-/* Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved. */
+/*
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ *
+ */
 
 #include <linux/devcoredump.h>
 #include <linux/firmware.h>
@@ -13,8 +15,6 @@
 #include <linux/vmalloc.h>
 #include <linux/workqueue.h>
 
-#include "sahara.h"
-
 #define SAHARA_HELLO_CMD		0x1  /* Min protocol version 1.0 */
 #define SAHARA_HELLO_RESP_CMD		0x2  /* Min protocol version 1.0 */
 #define SAHARA_READ_DATA_CMD		0x3  /* Min protocol version 1.0 */
@@ -923,13 +923,7 @@ static struct mhi_driver sahara_mhi_driver = {
 		.name = "sahara",
 	},
 };
+module_mhi_driver(sahara_mhi_driver);
 
-int sahara_register(void)
-{
-	return mhi_driver_register(&sahara_mhi_driver);
-}
-
-void sahara_unregister(void)
-{
-	mhi_driver_unregister(&sahara_mhi_driver);
-}
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Qualcomm Sahara MHI protocol driver");

-- 
2.34.1

