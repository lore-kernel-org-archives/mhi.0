Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BECC3B3BFA
	for <mhi@lists.linux.dev>; Tue, 13 Oct 2026 08:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791881157; cv=none; b=Y+Y/r/sKjvD+fLsyohFi44VlZWh1raSJml6cJxN29GUcwapP7FyMUupmlaE94RkdC6yoEw8LUxlqxMUN2jarwdugqz2PyGBthoNgTscwR03+Mwqkf0jJ3nJIXSqJqB/yWriv3qVxdDM7emXtjS2uju7GXM3nEa91r52yMQAY51Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791881157; c=relaxed/simple;
	bh=c81Ncsft2VVG5nJP0v+rEpGREl+pBGszmXyGri/TePY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UQ9ktyOmlWwvVQeTsqIc/I+ic6C/vXve+i/Td5gRHcED+CGJi/DzgpXtW2Yt3eFHQH+4/31Rnbq/AXh+qJodDSa74/pS4SamKyO5YpnZ2uoEvRCCSLjmCiNs8v0IqZ/gPDdoTLaOYyxUAAxMi7xihr45Bm5sifJ5CWerBgXcf58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cHDvHLWl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P78AgsL9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cHDvHLWl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P78AgsL9"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D6CR3L949370
	for <mhi@lists.linux.dev>; Tue, 13 Oct 2026 08:45:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kJz2HhWMtc9b/2odgKGLEGE+s//TZSVvWyfkwnNWaxE=; b=cHDvHLWlxNsgwfVE
	YCcRfm0b6MyalTK8Q5eKJN/kG3ZsdWFc5oOviFwffKSYPWx2woZqG3MdoHViZknn
	baaXj6WOdV8JA6XNgR03YpcijWtSfcxAL3Hmnnf2h/6O4fCeixT19Aggz4N5EXwv
	qpq32xTgpQYukn9tNij+NsrR9IDLQsUoQoYZw8iKZ1Pgvtf/xW8mnkvhxNHSd+A5
	axae19A3A5ndGkAU5P3iWRSm4K+eLQp0Ys5zE27eRO/mufI0w8MfLB14bI/2xA9B
	AI3qRfYJoPXqKxKS8iGffC6p6Vm7hkhOkOodMkYuxJnue6hHdHG6BNo8EhUcAJMg
	nQWP0A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9f628kmk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Tue, 13 Oct 2026 08:45:54 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd5fd34fee0so1237769a12.3
        for <mhi@lists.linux.dev>; Tue, 13 Oct 2026 01:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791881154; x=1792485954; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kJz2HhWMtc9b/2odgKGLEGE+s//TZSVvWyfkwnNWaxE=;
        b=P78AgsL9xxfm5wCRz0MwaVig4HceH7Ifr1m8xHwlDyRZoz+wgVG4LSCtO0HeK5bUsE
         cyN2jOQh7GZQLdT5FfvguZmrXNCaf0XGBZwZg4RTyL1imuvni6PZeX8EDx1hODkw9Xru
         vfTaFOZn9jbwq6J/7/P1lxKanNuZ3/PSUvC9kfSUFa5xaloUMEWIP5PUDmoR99acsj0z
         SR3lvQzZjILAi42VG9wQ9wordbod35q4eVkZ/68HQ7Ye+9MphCLPjR2yLK+Mf7AQJEXY
         /jDG0K0oGhL5C2fxvKJG76/7HxY0p8DQ/TVzuyoozS/HeimQPkkRvRwtSigHSsulct8T
         vrrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791881154; x=1792485954;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kJz2HhWMtc9b/2odgKGLEGE+s//TZSVvWyfkwnNWaxE=;
        b=yzznVtrp8UgRkbAu6KAI+ahRDRQj5LafddiIvyTWln69g5QYsGKRkMa9hHq23ohgTU
         XduwZI7JsQzl7Dwisv5qoiRFgNBGAMb+NStRi5HJkr6o72SO+nHWiOS6MRVj6d1iLBcz
         EpVPc0oG0DePcD9ByopcSh7qH3TSW5dwJb8O18zafSmIeNOVJlB8ekZG8EMwCtO8aCnf
         Y1Il2QgcfB2l+x5juJKE8YQryxQJzDIUYWN7u8ZCFZVTI/zcbfyWVp1DcCe+gsxQH63P
         Hl2PVlEgrzwNAcwfkutC8vAGZhczUifPa64fY5fQVc5MjSR7ATa5iszX5p+jPuF38/SY
         83RQ==
X-Forwarded-Encrypted: i=1; AKwUvBxMYSxlOJvFaPNfPgILnAfMLiYWw5hl3xuvnEbqh9VFMMOLz73Tir0gruGdjUsPTqgk4No=@lists.linux.dev
X-Gm-Message-State: AFq9FYIDRSUubc6hENDx/xSMPM2wziMzFTu+zdl4FriKj33Hin3PO8rQ
	TUHYVPxYVOgZMPGx4HkFPNFxUSnF3xKI9fCaH3C4YQnXIk/Q0rJ2/lT62axMWEM/GYZ32+pzv6T
	JQCPz1Z7+eM6Hle+pTHx4hapId3BFrrUeLZczOzKj+ThHdYPnoID0ZbQ=
X-Gm-Gg: AYBFou0p8EL9CTngEIM3rFlsrvVzYAQYLnV6BdzjmgCrJgUVwjiBeFr437OSqNOTcsW
	x6IuxEHtNBAb8UBIInLHlDhDbP+FdKc+0/tsApkAAY+LfstPcoJ9VwmDDLmRcXCksuQzaHzGaMp
	IUNOIe/0jFexkRXxjyEqv+fV5aMz8H0xjN22lf3Rz7ZAv6NGYy92aEKU/0bl/8Y81j+KzWxa24o
	62Af63UUfeUCQCyLApwsTcefulsibUvN0BvuOL/RVAR/bb9jAWbi61c+4NfTOGF4jWGAsbm2fyj
	87fq6PP9bteyhqCkmL9KlJBUUz+l1U1TrG2jXbpNGIcY6ZhRltJUttwwx+E8ApChkexM6YnSjXL
	PV4EJcuznKYpPKTuqcKsDBMK5nreC
X-Received: by 2002:a05:6a21:3290:b0:3e1:a27e:3037 with SMTP id adf61e73a8af0-3e1a27e6848mr4810744637.19.1791881153876;
        Tue, 13 Oct 2026 01:45:53 -0700 (PDT)
X-Received: by 2002:a05:6a21:3290:b0:3e1:a27e:3037 with SMTP id adf61e73a8af0-3e1a27e6848mr4810707637.19.1791881153105;
        Tue, 13 Oct 2026 01:45:53 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da0596f9sm5384721a12.31.2026.10.13.01.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 01:45:52 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 14:15:33 +0530
Subject: [PATCH v9 2/7] bus: mhi: Move Sahara protocol driver under MHI
 host client drivers
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-sahara_protocol_new_v2-v9-2-dc9f24357c4a@oss.qualcomm.com>
References: <20261013-sahara_protocol_new_v2-v9-0-dc9f24357c4a@oss.qualcomm.com>
In-Reply-To: <20261013-sahara_protocol_new_v2-v9-0-dc9f24357c4a@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791881139; l=8139;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=c81Ncsft2VVG5nJP0v+rEpGREl+pBGszmXyGri/TePY=;
 b=FKHiDhrXcuWPSscw+hfJohCQPoutAq//8uuzEHfpCaq5AYIdUEKQhb7mY6FmNdqUWD/b6FOLL
 oyL+WWDHgsxAq7ar99BJSn1LAjoAOc0GIf2azQdkiMozJ0wrpTRy97n
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Authority-Analysis: v=2.4 cv=FOKOVOos c=1 sm=1 tr=0 ts=6acdefc2 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=EyST5JTptKXFtIIvUhkA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzNCBTYWx0ZWRfX4CDuSaAjV9Uu
 iDPcaD9yMoH9pEM1G8EymP8gQcCj4wOVoNYg8vXK/GROAbhWmq8zZ8r1b5jRgLY5Hoozem8f0Jb
 IBUmZyrushIEaF0vWmjy9flbVOfDKTE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzNCBTYWx0ZWRfXySLkftPOYazz
 asNZ2QUEfjAGb2OhpLZjrjh6hW3xM2z4zcHbb+NT2a+m0kKAvvED4C0GkKf8/Rtr2deFGFXjm1K
 5P8suIg6nvT96qiHgRtflL9aATgS5ArVdOlnMgmMMjmREUbVxqcfxvWhBfLPkIltlpD6i6kN1J6
 JSQzy4unUYA+nzyMsmAtby/xqP7n+VZcn1RJLdFdNnefw9xGgF7nh7fuJQq/eB+n0pqTszKYbnZ
 ukxjbMm+n3//kTeuuPF2jJsEmTllxLaaUBWjwFZ5Tjcc+ITbL472X0ntrnLDPXOmhJZauDwsR5B
 leFohfqqKoku14BAgygtxnjSIrS9igRih6BOSabeW0EekUpbyKql9rXqFbCGXSevU1gnotLpotG
 pAM1qdoRK3BpnSn0PYMK323W35Cg9nOZqRsUoAgsceHdIKS8UjMNiczorL8NdWuD0u1QTcRhQtS
 8Au10gtSk4EI3kcbFeA==
X-Proofpoint-GUID: gfBCzG68jTPt-6a0Lso-rM-X6t1iMOjY
X-Proofpoint-ORIG-GUID: gfBCzG68jTPt-6a0Lso-rM-X6t1iMOjY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130034

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
 drivers/bus/mhi/host/Makefile                        |  2 +-
 drivers/bus/mhi/host/clients/Kconfig                 |  6 ++++++
 drivers/bus/mhi/host/clients/Makefile                |  1 +
 drivers/bus/mhi/host/clients/sahara/Kconfig          | 15 +++++++++++++++
 drivers/bus/mhi/host/clients/sahara/Makefile         |  2 ++
 .../qaic => bus/mhi/host/clients/sahara}/sahara.c    | 20 +++++++-------------
 10 files changed, 34 insertions(+), 35 deletions(-)

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
index 0acf6cdd44f81430ec52c7120b8b50c60721a615..64e87dfaa560376ecdf1e6f8bf7abf6153160926 100644
--- a/drivers/accel/qaic/qaic_drv.c
+++ b/drivers/accel/qaic/qaic_drv.c
@@ -32,7 +32,6 @@
 #include "qaic_ras.h"
 #include "qaic_ssr.h"
 #include "qaic_timesync.h"
-#include "sahara.h"
 
 MODULE_IMPORT_NS("DMA_BUF");
 
@@ -789,12 +788,6 @@ static int __init qaic_init(void)
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
@@ -816,7 +809,6 @@ static int __init qaic_init(void)
 
 free_bootlog:
 	qaic_bootlog_unregister();
-free_mhi:
 	mhi_driver_unregister(&qaic_mhi_driver);
 free_pci:
 	pci_unregister_driver(&qaic_pci_driver);
@@ -845,7 +837,6 @@ static void __exit qaic_exit(void)
 	qaic_ras_unregister();
 	qaic_bootlog_unregister();
 	qaic_timesync_deinit();
-	sahara_unregister();
 	mhi_driver_unregister(&qaic_mhi_driver);
 	pci_unregister_driver(&qaic_pci_driver);
 }
diff --git a/drivers/accel/qaic/sahara.h b/drivers/accel/qaic/sahara.h
deleted file mode 100644
index 08037281c80e28f6c85b924c45ce2c2f9dc60c39..0000000000000000000000000000000000000000
--- a/drivers/accel/qaic/sahara.h
+++ /dev/null
@@ -1,10 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-
-/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. */
-
-#ifndef __SAHARA_H__
-#define __SAHARA_H__
-
-int sahara_register(void);
-void sahara_unregister(void);
-#endif /* __SAHARA_H__ */
diff --git a/drivers/bus/mhi/host/Makefile b/drivers/bus/mhi/host/Makefile
index 2a16008aeb38127494782bbff4e1656428d2b776..2e8949f1a2fe6f3f3b2e1dc541f97d2c393d6a0f 100644
--- a/drivers/bus/mhi/host/Makefile
+++ b/drivers/bus/mhi/host/Makefile
@@ -4,4 +4,4 @@ mhi-$(CONFIG_MHI_BUS_DEBUG) += debugfs.o
 
 obj-$(CONFIG_MHI_BUS_PCI_GENERIC) += mhi_pci_generic.o
 mhi_pci_generic-y += pci_generic.o
-obj-y += clients/
+obj-$(CONFIG_MHI_BUS) += clients/
diff --git a/drivers/bus/mhi/host/clients/Kconfig b/drivers/bus/mhi/host/clients/Kconfig
index 8bb5715e61d0d6e64a51012b4e1594ba46e5bfc1..1932344157a5b1dc25c8d63f6d4ac38f896d08a7 100644
--- a/drivers/bus/mhi/host/clients/Kconfig
+++ b/drivers/bus/mhi/host/clients/Kconfig
@@ -15,3 +15,9 @@ config MHI_BUS_LOOPBACK
 
 	  To compile this driver as a module, choose M here. The module
 	  will be called mhi_loopback.
+
+menu "MHI host client drivers"
+
+source "drivers/bus/mhi/host/clients/sahara/Kconfig"
+
+endmenu
diff --git a/drivers/bus/mhi/host/clients/Makefile b/drivers/bus/mhi/host/clients/Makefile
index 3811b6928f42b38f94b1167941cf3b0fe512d32b..67e70de280369870164b4808f39d9b3340f2589b 100644
--- a/drivers/bus/mhi/host/clients/Makefile
+++ b/drivers/bus/mhi/host/clients/Makefile
@@ -1,2 +1,3 @@
 obj-$(CONFIG_MHI_BUS_LOOPBACK) += mhi_loopback.o
 mhi_loopback-y += loopback.o
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
index c7c0b3eb4b65fb7776a6c724cb3105046cf6f7eb..75c0cf6010e1506fe661cfd110112bbb37465880 100644
--- a/drivers/accel/qaic/sahara.c
+++ b/drivers/bus/mhi/host/clients/sahara/sahara.c
@@ -1,6 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0-only
-
-/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. */
+/*
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ *
+ */
 
 #include <linux/devcoredump.h>
 #include <linux/firmware.h>
@@ -12,8 +14,6 @@
 #include <linux/vmalloc.h>
 #include <linux/workqueue.h>
 
-#include "sahara.h"
-
 #define SAHARA_HELLO_CMD		0x1  /* Min protocol version 1.0 */
 #define SAHARA_HELLO_RESP_CMD		0x2  /* Min protocol version 1.0 */
 #define SAHARA_READ_DATA_CMD		0x3  /* Min protocol version 1.0 */
@@ -922,13 +922,7 @@ static struct mhi_driver sahara_mhi_driver = {
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

