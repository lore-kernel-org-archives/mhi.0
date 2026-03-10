Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D733E8C44
	for <mhi@lists.linux.dev>; Tue, 10 Mar 2026 07:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773127345; cv=none; b=Pt1h3RXng2mh/zq+2jivAj+EwwoU74UWhmHiYGnIFLaeGnNh+leOcHQze2GvHeMZzQLF/jGB64tqMoqQ4PN0bkDj0MVooerYJj8Oa/asrOubyzzUAzB6OepOi0AE/GXrGiHtqQBP8NG85rU0mwHACqvokhOjISrVEF04ZMydPNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773127345; c=relaxed/simple;
	bh=9tH2JRuQd/Ntg0H7RVSyFLnl0a6EFmaIQsmT7afSET0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A+/suqUyv8ERX5yxxwBe0DYAKH4mg9lD1C0tfAJZimyjOC5PeCb8tQ1HIeFzXV0E0K39PLLqY1Pb4nvHMJ9CRByHwd5onRvILpOqMMPmbJM+yCvQAPkWN7agIfaoz2ONLeQmIj+RORd1r3VSdNzWEwrtMuFQ+i3V599bdQa0gKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ooz8C04O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dbsveG85; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ooz8C04O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dbsveG85"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A6VLJU2021379
	for <mhi@lists.linux.dev>; Tue, 10 Mar 2026 07:22:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pD2aEY9dZogWGWfrJ0ewLTBoCN0zxUacyNzSIWJJ810=; b=Ooz8C04OwXZBUbNT
	8TlSTp6Uq7FZi7DPTEg8Vj65YQQi6VTS7fNQac8c8egbo6eU3+WEQNz3gBxCZ1Ed
	hE88nc1OOh6qhWIkd3G1FA3qDPNDqlBjuDNQtomkovagphQo1Uj17dbHz1qkdFIo
	m+hSIydMVZrhIGomISweb4meh8z1rbEUpa8beX2y3q9nJqp5b89jVWYp3siE7bn2
	Ans2xSkPcUHZMmhKjpU7Wkd0eyCPEkBko9rTYasIdOtnCagyp/fmskMQ9z4OUMt/
	+fEaVIFKZxebFUO1fmWZ6qr6ZbO2sBaqYD23UvXahEfCUxdWXMhXKQMeCMsgta6D
	YuFkhg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cte3w85cv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Tue, 10 Mar 2026 07:22:23 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-358f058973fso12459985a91.1
        for <mhi@lists.linux.dev>; Tue, 10 Mar 2026 00:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773127342; x=1773732142; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pD2aEY9dZogWGWfrJ0ewLTBoCN0zxUacyNzSIWJJ810=;
        b=dbsveG85KuxsbeAp3VGngRvMPEM4u27bAG8vNb1C1A7r3FIqB/ZCR9DR/EbLlbVwyj
         tquCaw96vOdHYvpszJaB+G22CchkTdGMXnNXo8+7lhkP3nhsYPiflEdncMh44gIxMgSf
         02HgJkoC3tUDmB5kMiFDBhN2dIRsE3kFvzpV/clxl0fYafP9wM8bv4jn+8i6D4Wgzjsj
         w/MP+rC1yXcs1qJ6QVpSEfhK8hKV0cE5vpLqABD6fIMvAlYT4yYfOgaQPruC/UwzVEP0
         1XGIhSX0m/9rYS3te40/ECgOOQOmixGaJVOFHMXzlQqR6+JybyZ+BMDEMakkVR/+e018
         2drQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773127342; x=1773732142;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pD2aEY9dZogWGWfrJ0ewLTBoCN0zxUacyNzSIWJJ810=;
        b=BaBaq/POcJCtoqXVCjRoKZtwEV7pyO35Z9CHTzxMx4O4v2faeJFU16ry792v1S728Q
         GUmQ2bJvVS6jBjlV9b+MdNRFOGaKDF+GL3q8GXAHf3XNvP+gvc844IIjakakEoQrsxa9
         fl1MaLUJ40pBh4Yee6QavvJWoir5UMqN6nuCI3brdeUMbU2DI1DlJDjhfyVzdil466fK
         eM0H8Ulb3p2dKne8jUDXJtdyyOrxhdLuMQ04bu/VByphcoN+pcRMFeMndN8ZfuqUpQav
         A8wRv6+e/q0XvQB3G2SXx8Cq2C0GmO5IDzd7GZd62pSe26S5dXWxs633vbaiQNZL4Aie
         TFnQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9M0KZr4Kl6yXbo2pLwWup84qTxffNHWNnnsO8LBL6EsE7B51t5mU55YbAQomgcwBNKdg=@lists.linux.dev
X-Gm-Message-State: AOJu0YyiVGcNGVqmmDhQnwcUS/0hR8BYwYaFud1nafixlSq0cT3i16EH
	SI2zbT+GMF3vEBwf1A8Nueoh4oCRTQImwkGaaEVB3A0eXtCuQXZfD9xGeqdnBGspE9nkfL9enqs
	UBzZe1j8d3Y+XbS0p/tyM/M1o74IIrsSh8bPbLC3uNK3VBP1l8L8Y6SM=
X-Gm-Gg: ATEYQzyY7ZQPUb1AoBTWvqY2vOM7hlj8uc5BzzxKZnwcQcu4zuk/Kuh/BKN80EzbuFA
	XWQd9DOdERSKcMqp3q5yd2TcOYbdbIPsWLQjvkNkQHuikO41/PBJxlllOmZks15tqMkK59tcDSQ
	X2SjjZGX6KOES/csWuxhI3yy3cYNxcao2yrzVZY6gJw+A36+k+9LJSpkN+e3wS7WhzShi8rFu30
	0IwT91lBTCFBts102QT3Uapz51razyPXKVGpFSdLg8Sq8ronBco4eVtU41qyHoyE3MTS70T0Bw8
	z5m5TiLn46n0h9xSaPDL2Wve8KSLfl1NTLsVL2XVbgpyBuMjaNCGFTI75GALh4G3jvnJkUkxDQy
	Kflklmj7IsBS4F1/ztdXxlmPn3VMW+4Mrn/AJJ8oNEKNblxNKuPM=
X-Received: by 2002:a17:903:28c8:b0:2ae:5671:7071 with SMTP id d9443c01a7336-2ae8252cf0fmr84229535ad.43.1773127341535;
        Tue, 10 Mar 2026 00:22:21 -0700 (PDT)
X-Received: by 2002:a17:903:28c8:b0:2ae:5671:7071 with SMTP id d9443c01a7336-2ae8252cf0fmr84229315ad.43.1773127340964;
        Tue, 10 Mar 2026 00:22:20 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae840b2e9dsm185200325ad.85.2026.03.10.00.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 00:22:20 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 12:51:59 +0530
Subject: [PATCH v3 2/9] bus: mhi: Move sahara protocol driver under
 drivers/bus/mhi
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-sahara_protocol_new_v2-v3-2-994ea4b0d5ad@oss.qualcomm.com>
References: <20260310-sahara_protocol_new_v2-v3-0-994ea4b0d5ad@oss.qualcomm.com>
In-Reply-To: <20260310-sahara_protocol_new_v2-v3-0-994ea4b0d5ad@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773127328; l=7115;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=9tH2JRuQd/Ntg0H7RVSyFLnl0a6EFmaIQsmT7afSET0=;
 b=20vWjzKlRnk/9wE+EJycNzcoNARHdhA1CnPR7MKZJH4jM0oFANtPLttuFQ+0HwW06haVpKRr6
 CzkUHIRR0+jA3h+trbSzk22o93onrQM34x4e7BPrasmyztsTO8bOcTK
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA2MCBTYWx0ZWRfX+7SV+3WDOTDh
 317BsTW2uH9gQ0pOfR2ux7H/xS36phIObYS/hchhHYrnhXer70wwLutnw6g/b6So4scrQvC6h5h
 ElUiKnuW39LVdXcNbdlfdkitRWPUbWgC3uqJbD77UWeDLkTD4Sz0Cv33CjnvAr+BntIEK8CSMSa
 QYlDhtbUAwAIdza9+bRVNjBQ6NPhlPMfTJAZLdQE3XILjsXMzNh/XSOrexVxLfqTlSUvaaXZZDw
 N5dcTK3Z4qUbKZ7r1FhDDnzgQP1H9+yH6usqTUS0rjM4yRf9U7mYKLCWiQBJrdfSNXiBJdUylD1
 Om0TrjR1sTLjy+ntCxcor6Wam2nupU0/I3FGExUIv3AyGRBJDimU4NSZ25HFqWQsSZnjA0k2BWx
 iAOab7hYXxS15dMVscgSg0+4EUHqnRdf5R599ih6LLDZv1SHR+aatO+SX3AOHWU7pdCyR/4Wr6q
 OzsUd2pgFTJKxAp3b+g==
X-Authority-Analysis: v=2.4 cv=GtFPO01C c=1 sm=1 tr=0 ts=69afc6af cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=YoiwXk0N_qN2JQiW-xcA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: bzDN1WShjDCgC4X3U-KVy3OH5sDsCKwg
X-Proofpoint-GUID: bzDN1WShjDCgC4X3U-KVy3OH5sDsCKwg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100060

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

