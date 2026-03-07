Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1BE34D923
	for <mhi@lists.linux.dev>; Sat,  7 Mar 2026 11:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772883730; cv=none; b=TRcOCXmxuFdmAcYbQKBZh0dJPv5fweq+X175LW7IM1PB2qJOjs0orTeqXmUe0IbRSqpenhbOt4i8U8igeXvY+Mr0zCGaCfsV9r2L6nn+gBqrbWginbvo/khfxv8jpZhDwXatERDzYeOfi+T7CPJAMhmIp5uM7r0IJ4bm5qcPnAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772883730; c=relaxed/simple;
	bh=9tH2JRuQd/Ntg0H7RVSyFLnl0a6EFmaIQsmT7afSET0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uNl8jWXXpKZscVdxWdpsa+yEVK2BOo2uv/rqzXRLsfidHebmHd06i9iN0ZuQI3p61cai9dikslJJhHjzFmIVpxkfZqYAQI0G5aYNm9XyBV2nw8vhDwibyL5a4F7lh9uCOLiIej3vJJlbCt6Vxs9cL7f+n5nzf0b9c9EsfqPUCdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gNk12wwE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gqlfqccL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gNk12wwE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gqlfqccL"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6276qg3N2401819
	for <mhi@lists.linux.dev>; Sat, 7 Mar 2026 11:42:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pD2aEY9dZogWGWfrJ0ewLTBoCN0zxUacyNzSIWJJ810=; b=gNk12wwEvqGjV6Bw
	E1UxjUwzpZv5/BpXbGl7Xt6p2L2DrPdJ5Hk4W5/6KkdMcCwlPh+PzuxUmOaoEP+g
	3BZEc71w0oH2RF1PHha+FsMsTNZAmy0L1GRzUOHW5D7w56kX5kQl3tRkei4l8nkn
	x/NCpW0+UcDnQbzwr+nOtY2kivDFwR0XNdqieGkQLNrgQHB3TLkV+QNuZwWgpSJM
	RP4b25Y13X4pnTMcCeEoPTD54/tsT+8GRbtegH6GvqILF27VBmUd8BOSocZrG9+l
	pAjZ6wnKFbjZFaOQVPBjqtvQMzIGkkEuknY/i6yf+mmOf2ppFtCEUKaG5KdO5k+n
	RUWHTQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cr9qes1g2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Sat, 07 Mar 2026 11:42:08 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ae4af66f40so73707975ad.1
        for <mhi@lists.linux.dev>; Sat, 07 Mar 2026 03:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772883727; x=1773488527; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pD2aEY9dZogWGWfrJ0ewLTBoCN0zxUacyNzSIWJJ810=;
        b=gqlfqccLv49YOe9fd0HHLp7aY3ZY/EQ5b0fvUQdjEfgb71nffs0Pxllht8Q2abHMvw
         PtilyZdiC5FvpRDjyjd5viZYNrsKrTpN/7K0NbfdlqzCUMabCYt0wzp5Qa63YeMkJDp8
         60Y4Z98Z8op0rOdV0BJFFLHRPv0li0ZcIa9SzeH/+yec1efP4We+v0yMwqR9Hpa/WxJ9
         xh7R9FqRMxfnEuJ+qP0DXRgXdyE+Agtby2gsXDW7nY/tHJT4j5Kv7qbUUBhrgMuDJSpn
         rVj1ajLIuUhWWl/XBbN06wqAebWMhaXd6263x/fAoRDou4bYDAH+3bkPiUh02emJ2vFQ
         x0ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772883727; x=1773488527;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pD2aEY9dZogWGWfrJ0ewLTBoCN0zxUacyNzSIWJJ810=;
        b=By35E/JuPzX8xJsrV2e/D6qxWxRKoyf0aiLfS05yDI8mLfJiDpI2Ctu3jxjQMWbx8f
         LAeobWEZvKjKwAartYyptjy7WxguF+NEsEEiQ4x5K10Q9eNc/YXQRYhMoYkCzsQhFL6O
         Ed9mhNDN4eKGCZVarSY+iT/SSQBvnXBHQG21LGHrn3mf/9IZWbhdcmfup//Q66zaSvGs
         HjMYzOFT1NSHLpt0SesIeuqdR2JRIhd2bJTpfBjZlh2tZ8NRTNPSHgNdmDhuy9QZfroL
         2Okcxa+o4KBKIyrO8Yx9OyKUdDC9F047tR6uoZsAf75mfbFt0enrcQjec4oLphF/49QG
         K/1g==
X-Forwarded-Encrypted: i=1; AJvYcCWOj7SQkXD7sb9DQnYHMxMX9wvjVLw4yW+SyrEyWWuZ+9wTe8Ym88RdMotWRZIJqiwmeYk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzDTBJ0MEPKoPGtgDRML3z8BboBuZkrbTVOFDVA4qZ3Q6rnZxUr
	lWsvkr2kRXqaMSt0zOR7fhEaVsXcbWCRbwFdHASlFhQr1v5r7THukpRhAzkCCQCQqgloJT0sgXD
	YvrJl4aZowYWMpiVfCGOWcJXxstM2om15vs1dbyVZrzgSVROUdRw5csXmTCsRWPM=
X-Gm-Gg: ATEYQzwzg1Izext2ujva1tpeqYxZHbwzL6oo2W5K6W6AKCC2pGQJbwpiTzn5BZA+O52
	TxixdP4hNk3x8PPv/6QU+A92s+FFxeKgUYmaf65vx2et5tSWmXcl4kfeYpoOGy0vtXXW7yH2MVW
	azI3EShxva/omQABzLbY//tOscbIh6LidNSX2mkYeIsa9R43p7YK+ZvUWYHuZxf+GmcZyvW6MFs
	gAy45kQohhn7Qdgda0zLU+OMqj+VD/SlAppYB0M+92TLynL+1Gb6Tb8T0JVbk1SAP05/hn3kbi6
	HUlPd/mVuGpQWvBxAg9zKcwryUHDwjXiejejfYRZetmOWp9cHXhZFAOPzNrEOcKbgh04SlsbknW
	T0N2S6qVmKOLFgiExi3+vdHDBfF7DtC7WCI38nssrmz1wGrOTdFE=
X-Received: by 2002:a17:903:f87:b0:2ae:44f4:1678 with SMTP id d9443c01a7336-2ae824b83e7mr49683725ad.57.1772883726697;
        Sat, 07 Mar 2026 03:42:06 -0800 (PST)
X-Received: by 2002:a17:903:f87:b0:2ae:44f4:1678 with SMTP id d9443c01a7336-2ae824b83e7mr49683535ad.57.1772883726214;
        Sat, 07 Mar 2026 03:42:06 -0800 (PST)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83f8c713sm47996145ad.66.2026.03.07.03.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 03:42:05 -0800 (PST)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Sat, 07 Mar 2026 17:11:23 +0530
Subject: [PATCH v2 2/9] bus: mhi: Move sahara protocol driver under
 drivers/bus/mhi
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260307-sahara_protocol_new_v2-v2-2-29dc748b5e9c@oss.qualcomm.com>
References: <20260307-sahara_protocol_new_v2-v2-0-29dc748b5e9c@oss.qualcomm.com>
In-Reply-To: <20260307-sahara_protocol_new_v2-v2-0-29dc748b5e9c@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772883713; l=7115;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=9tH2JRuQd/Ntg0H7RVSyFLnl0a6EFmaIQsmT7afSET0=;
 b=Bo19H5v5jiStPSIXraymY3yh7iYxzNy7Xdt66+3ME/Uk7tUYGKYT26DGqjMR/x2bpA+wuK7Tu
 XTrWrkx49N6AmMV7cDMJ2+vyyXkxls6jXEAbdyT+j2Y71GvoN/iNbdK
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-ORIG-GUID: 1B1BlwJ1kL422X21aeWbDs3PDP5fVatI
X-Proofpoint-GUID: 1B1BlwJ1kL422X21aeWbDs3PDP5fVatI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA3MDEwOCBTYWx0ZWRfX9y4gFFudoYKx
 +U1+5QZqZ5wkMLEbAaFfrpx5Osg7D9n8/04dPdeLg1dXupIbCGnZkyYhGn6xvNgt5BVNVCVeGD8
 pP3i+TmIVv/sJRLfUOyzQYY6QhqIlg4M5oI7X8l4eUkdvbVkeyoTLvbvJCBlgeJYersKinzLd0F
 kGLWs4rQR7VzRqR32p4Y2AFuR0++vupbc4hMY9Ba1wHPnaByvGwPpdpt7d4eJZmn1vIJBV0+N1+
 LjvLDxC05wc98Jm5IeW8bkdK0Ufz3R8ycYSvZCgz0c22A0pGXV0VR2hxflmW9e8rpDyWbSPFGG3
 A4LH8Ns5inmAP3g+xQWCcMTHc48M3lcvub6s1jKFycllHrPrcvIKo1+8EpWeQapTg+WZUqhpSWd
 1x0OhdTjL5tyK0ltFeDsQ60VN7eTVOgek7PYURLPbH/rRhsCNRu0KnOABJovv/H2OYUi1foKHdF
 vjw8LzrhX9X10lzilkg==
X-Authority-Analysis: v=2.4 cv=dcqNHHXe c=1 sm=1 tr=0 ts=69ac0f10 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=YoiwXk0N_qN2JQiW-xcA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-07_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1011 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603070108

The Sahara protocol driver is currently located under the QAIC
accelerator subsystem even though protocol itself is transported over the
MHI bus and is used by multiple Qualcomm flashless devices.

Relocate the Sahara protocol driver to drivers/bus/mhi and register it as
an independent MHI protocol driver. This avoids treating Sahara as QAIC
specific and makes it available for reuse by other MHI based devices.

As part of this move, introduce a dedicated Kconfig and Makefile under the
MHI subsystem and expose the sahara interface via a common header.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 drivers/accel/qaic/Kconfig                      |  1 +
 drivers/accel/qaic/Makefile                     |  3 +--
 drivers/accel/qaic/qaic_drv.c                   | 11 ++---------
 drivers/bus/mhi/Kconfig                         |  1 +
 drivers/bus/mhi/Makefile                        |  3 +++
 drivers/bus/mhi/sahara/Kconfig                  | 18 ++++++++++++++++++
 drivers/bus/mhi/sahara/Makefile                 |  2 ++
 drivers/{accel/qaic => bus/mhi/sahara}/sahara.c | 16 +++++++++++-----
 {drivers/accel/qaic => include/linux}/sahara.h  |  0
 9 files changed, 39 insertions(+), 16 deletions(-)

diff --git a/drivers/accel/qaic/Kconfig b/drivers/accel/qaic/Kconfig
index 116e42d152ca885b8c59e33c7a87519a0abc6bb3..1e5f1f4fa93c12d8ca8fb37633f2f0bee9997499 100644
--- a/drivers/accel/qaic/Kconfig
+++ b/drivers/accel/qaic/Kconfig
@@ -8,6 +8,7 @@ config DRM_ACCEL_QAIC
 	depends on DRM_ACCEL
 	depends on PCI && HAS_IOMEM
 	depends on MHI_BUS
+	select MHI_SAHARA
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
index 63fb8c7b4abcbe4f1b76c32106f4e8b9ea5e2c8e..76cc8086825e7949ed756d51fcb56a08f392d228 100644
--- a/drivers/accel/qaic/qaic_drv.c
+++ b/drivers/accel/qaic/qaic_drv.c
@@ -15,6 +15,7 @@
 #include <linux/msi.h>
 #include <linux/mutex.h>
 #include <linux/pci.h>
+#include <linux/sahara.h>
 #include <linux/spinlock.h>
 #include <linux/workqueue.h>
 #include <linux/wait.h>
@@ -32,7 +33,6 @@
 #include "qaic_ras.h"
 #include "qaic_ssr.h"
 #include "qaic_timesync.h"
-#include "sahara.h"
 
 MODULE_IMPORT_NS("DMA_BUF");
 
@@ -782,18 +782,12 @@ static int __init qaic_init(void)
 	ret = pci_register_driver(&qaic_pci_driver);
 	if (ret) {
 		pr_debug("qaic: pci_register_driver failed %d\n", ret);
-		return ret;
+		goto free_pci;
 	}
 
 	ret = mhi_driver_register(&qaic_mhi_driver);
 	if (ret) {
 		pr_debug("qaic: mhi_driver_register failed %d\n", ret);
-		goto free_pci;
-	}
-
-	ret = sahara_register();
-	if (ret) {
-		pr_debug("qaic: sahara_register failed %d\n", ret);
 		goto free_mhi;
 	}
 
@@ -847,7 +841,6 @@ static void __exit qaic_exit(void)
 	qaic_ras_unregister();
 	qaic_bootlog_unregister();
 	qaic_timesync_deinit();
-	sahara_unregister();
 	mhi_driver_unregister(&qaic_mhi_driver);
 	pci_unregister_driver(&qaic_pci_driver);
 }
diff --git a/drivers/bus/mhi/Kconfig b/drivers/bus/mhi/Kconfig
index b39a11e6c624ba00349cca22d74bd876020590ab..4acedb886adccc6f76f69c241d53106da59b491f 100644
--- a/drivers/bus/mhi/Kconfig
+++ b/drivers/bus/mhi/Kconfig
@@ -7,3 +7,4 @@
 
 source "drivers/bus/mhi/host/Kconfig"
 source "drivers/bus/mhi/ep/Kconfig"
+source "drivers/bus/mhi/sahara/Kconfig"
diff --git a/drivers/bus/mhi/Makefile b/drivers/bus/mhi/Makefile
index 354204b0ef3ae4030469a24a659f32429d592aef..e4af535e1bb1bc9481fae60d7eb347700d2e874c 100644
--- a/drivers/bus/mhi/Makefile
+++ b/drivers/bus/mhi/Makefile
@@ -3,3 +3,6 @@ obj-$(CONFIG_MHI_BUS) += host/
 
 # Endpoint MHI stack
 obj-$(CONFIG_MHI_BUS_EP) += ep/
+
+# Sahara MHI protocol
+obj-$(CONFIG_MHI_SAHARA) += sahara/
diff --git a/drivers/bus/mhi/sahara/Kconfig b/drivers/bus/mhi/sahara/Kconfig
new file mode 100644
index 0000000000000000000000000000000000000000..3f1caf6acd979a4af68aaf0e250aa54762e8cda5
--- /dev/null
+++ b/drivers/bus/mhi/sahara/Kconfig
@@ -0,0 +1,18 @@
+config MHI_SAHARA
+	tristate
+	depends on MHI_BUS
+	select FW_LOADER_COMPRESS
+	select FW_LOADER_COMPRESS_XZ
+	select FW_LOADER_COMPRESS_ZSTD
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
diff --git a/drivers/bus/mhi/sahara/Makefile b/drivers/bus/mhi/sahara/Makefile
new file mode 100644
index 0000000000000000000000000000000000000000..fc02a25935011cbd7138ea8f24b88cf5b032a4ce
--- /dev/null
+++ b/drivers/bus/mhi/sahara/Makefile
@@ -0,0 +1,2 @@
+obj-$(CONFIG_MHI_SAHARA) += mhi_sahara.o
+mhi_sahara-y := sahara.o
diff --git a/drivers/accel/qaic/sahara.c b/drivers/bus/mhi/sahara/sahara.c
similarity index 99%
rename from drivers/accel/qaic/sahara.c
rename to drivers/bus/mhi/sahara/sahara.c
index fd3c3b2d1fd3bb698809e6ca669128e2dce06613..8ff7b6425ac5423ef8f32117151dca10397686a8 100644
--- a/drivers/accel/qaic/sahara.c
+++ b/drivers/bus/mhi/sahara/sahara.c
@@ -1,6 +1,8 @@
-// SPDX-License-Identifier: GPL-2.0-only
-
-/* Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved. */
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
+ *
+ */
 
 #include <linux/devcoredump.h>
 #include <linux/firmware.h>
@@ -9,12 +11,11 @@
 #include <linux/minmax.h>
 #include <linux/mod_devicetable.h>
 #include <linux/overflow.h>
+#include <linux/sahara.h>
 #include <linux/types.h>
 #include <linux/vmalloc.h>
 #include <linux/workqueue.h>
 
-#include "sahara.h"
-
 #define SAHARA_HELLO_CMD		0x1  /* Min protocol version 1.0 */
 #define SAHARA_HELLO_RESP_CMD		0x2  /* Min protocol version 1.0 */
 #define SAHARA_READ_DATA_CMD		0x3  /* Min protocol version 1.0 */
@@ -928,8 +929,13 @@ int sahara_register(void)
 {
 	return mhi_driver_register(&sahara_mhi_driver);
 }
+module_init(sahara_register);
 
 void sahara_unregister(void)
 {
 	mhi_driver_unregister(&sahara_mhi_driver);
 }
+module_exit(sahara_unregister);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Qualcomm Sahara MHI protocol driver");
diff --git a/drivers/accel/qaic/sahara.h b/include/linux/sahara.h
similarity index 100%
rename from drivers/accel/qaic/sahara.h
rename to include/linux/sahara.h

-- 
2.34.1

