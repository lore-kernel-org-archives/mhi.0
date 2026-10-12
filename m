Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42344CDA35
	for <mhi@lists.linux.dev>; Mon, 12 Oct 2026 18:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791829104; cv=none; b=g1Ncs3siaat/izZQvSsHITqmNaOOQZAt4Gtctv10IQmjQ8v+SAhyBD2CvknZyNJwr5e0lKtI2QSpdx/d+Qj7zrIlmJ1kJaTGXkdfjMSfqtpdNGP3j7U1Hn56jnUAK7k0dcES54RlK+xKjjWlSWWHBcQ+LzI4Y56c8L3l8zY3Ijc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791829104; c=relaxed/simple;
	bh=otXVSurn9WsDOA977t6Y5Qwqxk6Pm0fZvFDTUT1u9c0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hMq6dMe2/xo10iI0MVpuLBG05YDRQztNPehHjj4FasKpfOajoIvdB7M5zJe13QLxlfFmxtgZFt1im/0k6f9bCYgMpjCEX7Y+QER6gG5xVeFkoopjjzfNS4AZywlWQVWM91Ywu8pIUD8Mn/0kULqYIIcMdxQFiIqF8t6jnjEoCrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OzBWJ4ba; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EZNwK86D; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OzBWJ4ba";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EZNwK86D"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CHv6OG4086157
	for <mhi@lists.linux.dev>; Mon, 12 Oct 2026 18:18:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VVI5CEirgjq82tfVffqDikfz3jlDY55roUmiPU+0Vys=; b=OzBWJ4baip6gUv9Z
	Qpu1YuapH8lauvVoMwZdtIy0t9Q1dtzQ/Y/OGBv/cz5nI09SNOPSL0MmYIjgN7Yy
	1vJAeptVG+oE73NoUh8JzjAzcUxSAjvs0sJ+gt0EOkb45DwC+jeNs+8kvfvacl80
	rWsQaGtw874drdSCdMQ5KghIVAXjsmhN+pWkH/k+RXbTe2KYnxqlSpY424HVoocj
	MWTFknvYsx1wNnfZLFpAPdV3ZjE/3NCrTDMx8uNXQyY+U7q9oJpS8YVLubH2WYzz
	JgDsVpj8c603BO4hIDgmqiWJysYSRErYEXu6vRgrnvGItwpzxxeEduqCv8m7kbKu
	3embNg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8uh3ju4r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 12 Oct 2026 18:18:22 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30bcb065bfdso4391550eec.0
        for <mhi@lists.linux.dev>; Mon, 12 Oct 2026 11:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791829101; x=1792433901; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VVI5CEirgjq82tfVffqDikfz3jlDY55roUmiPU+0Vys=;
        b=EZNwK86D49JDpzyucjNwNqkZWCKwkKEWj7WBc/HzXkUOqIvhbzGOVqxQ1PYGYXY2Ik
         n39QOMe84C6jN1LPfGSCGu/3xzMldMqrqrx3G6mbTBD4ViJr3HOqyezwTi5VVcI/B4qJ
         UOYdZYjzybP36y3uqnnv59ulHS7D86CcbBlgZbJ9yYtHcu9Avet6fnlBiITmIRdz2+UO
         VyQIGl0KXqVBEIOtJWuRq/2ReSSfHqhrB1ArDyy/jqvY16YS667wiGVxyMCf8lSQSIQb
         z2sTXmkcbQKfnBscVJoyA0MuGBpK61MaMAPLAUg84qOKpKC5aXGTnvjQiqH+EPo+KjSR
         ZK/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791829101; x=1792433901;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VVI5CEirgjq82tfVffqDikfz3jlDY55roUmiPU+0Vys=;
        b=n8M+QSyydW5DBF6tO/AClJ6CNbHI/5p4odiH2Ppebw1/1W4cLV0VJ+pJxBua0iDHHj
         lfWxfg8Bo2q3NlJLKDMP4AXVPmtHxRcyrvr2MZyvT/lP96IRSsNl7xjBNclumrDAqZqv
         N8DMhzZhkdIGZNSWBOfHfWG4xsPI0kSwN5G+7qURmZTWl9veVHEwwE2ygjQYN9lwd3iT
         tTam2y5IRi6FGg9FAPLeLH6KvNuxnVBdUy9FOd3bxWWvGxSkgMQHEnPqAek1prlfTkA5
         oTDr9G7MfnSlhGekHHXVuz1oHS8kHjyu4V92nI8+PqGwcIIwK+dytTuLn1NHEveEFDe4
         uyWA==
X-Forwarded-Encrypted: i=1; AKwUvByY1T4JoanKMKWlBRKWBXdJyGAyXRk2aih6VXvxJZ76i0Tc/CngnM/MpGY03I79vsrWcxU=@lists.linux.dev
X-Gm-Message-State: AFq9FYKCnjqKwINN/xsyCnw7lvKdg2VDhDbaq1yOW0kuLmNPK/g6DTXi
	0MBh+DMzdc00mcX3DJWy+F/HMgPpm8h/3dkwE76BKvmHM8dEgrCELe8VIyh95jvT+eDd83WqTH+
	AGBlgNUZy/4XR/Kvau3Q3sjS1ANZzALyGT+rsS20N57+N2ySioUybQNQ=
X-Gm-Gg: AYBFou3n/h6HEQXkkTWwpu1LqYHTZ9yMysTcmMr15h7hQPFKCpG9Rvw0DTQ9crcFWAy
	qYz6eLmy6GQRti8BA8FSBQMdDi7Z7kq6viRXpYvPPH4rld9x6+YC8LipEuXyRrbxQvVp6UMqE1F
	uArfmoWZVtwB+wEADfjfEj4K+G610v+GcZ04MHSkvaBxv/QuuhfobmxKuD0CKoDOfp2FPv4YRBo
	6IP3ijJW63ZPMo5cXNlnZ/ZYe1nVJ8WGrgi0XzJ5OWxLjbgWzeoA6AjRtgGYFLyrQr0gwyyUfQt
	8ABWcyEW57YVXIqhE64T2bcyryYLjA0g6Qt7hfgfbBqKJ9yyD1KBSlL3uMo/NSCEEmiJmXptBth
	sMlRyTV4CJzuq3q1Yh85H3yZwdTbG
X-Received: by 2002:a05:7300:7fa3:b0:351:4b90:ba01 with SMTP id 5a478bee46e88-3537e086a2bmr17652947eec.15.1791829100999;
        Mon, 12 Oct 2026 11:18:20 -0700 (PDT)
X-Received: by 2002:a05:7300:7fa3:b0:351:4b90:ba01 with SMTP id 5a478bee46e88-3537e086a2bmr17652891eec.15.1791829100253;
        Mon, 12 Oct 2026 11:18:20 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-358de54fe47sm22827311eec.31.2026.10.12.11.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 11:18:19 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 23:48:00 +0530
Subject: [PATCH v8 2/7] bus: mhi: Move Sahara protocol driver under MHI
 host client drivers
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-sahara_protocol_new_v2-v8-2-e12939d229a1@oss.qualcomm.com>
References: <20261012-sahara_protocol_new_v2-v8-0-e12939d229a1@oss.qualcomm.com>
In-Reply-To: <20261012-sahara_protocol_new_v2-v8-0-e12939d229a1@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791829086; l=8288;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=otXVSurn9WsDOA977t6Y5Qwqxk6Pm0fZvFDTUT1u9c0=;
 b=0wwL70/jEopgIlLia3e1QYwwQht1T1MadvDu3R5vESLxqP2reRqk8IzJqMcDdadQfhMEe9fSn
 f4aONVeiTdnAl6a9fM7Y+heJk3+RmzQ4WnTdegqn4HqJGbH6fecsDfx
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA3MiBTYWx0ZWRfXxP0708I8mPiv
 UmGCHXnFzShWh6XWUDGy55N8baXTvpfWWV6PiWEdUk1dlO4n7eV18WuzJAkEedeDueafZJLWP6M
 WqYEGVtLWXXphg9mAgopcuKuiNQPMNzrzrLuvBHBESWK7IS7KecfObKWF4F2tasJ97E/hboMpFh
 6pJC2Xnw7UZ5hoJxXKjjYd8yXMEHG83x6ZLurjcqEedHmietkl5AYRJIJCvhPOuFPoHM82sWsV/
 OwsFabY3fDVCtG4YWlRNBVT3WH4NWDXnErOBFfc8Iim3HMqF7Teg0bCnDg+QQD/0wMUis0vXx4O
 hA4fD3iSpNEZcersVMWncvF0ns8yqgodbRGis8x9k65mvi5zFtUQ8QYq6EYB1ShD4QCsurqWa4l
 r8crW58d9XD6hErrGKKdbf/ULz0nu7JxVBc14pb5faNaF1B2QbwcvS+5UBh6pthcgiHaNiwg4fv
 h6z8aCkjG+9mztVu3Qw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA3MiBTYWx0ZWRfXzTaagPhiuwCa
 sxgNYbOJM5/eO3wXXbj88gl178qvEZfXXg2suU/4Y9MgbWBIqsNDa5frr93ESckAPqJG4H2qm/r
 aTfUSDhcaesslPAY0e3/vbwIPtdSJNU=
X-Authority-Analysis: v=2.4 cv=QO391QLL c=1 sm=1 tr=0 ts=6acd246e cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=YsTF_x4DAHpo6Sg_WHoA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: QSDb8ATG4EpftJTjBbDC-G4wf-sJTDnT
X-Proofpoint-GUID: QSDb8ATG4EpftJTjBbDC-G4wf-sJTDnT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120072

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
 drivers/accel/qaic/Kconfig                          |  1 +
 drivers/accel/qaic/Makefile                         |  3 +--
 drivers/accel/qaic/qaic_drv.c                       |  9 ---------
 drivers/accel/qaic/sahara.h                         | 10 ----------
 drivers/bus/mhi/host/Makefile                       |  2 +-
 drivers/bus/mhi/host/clients/Kconfig                |  6 ++++++
 drivers/bus/mhi/host/clients/Makefile               |  1 +
 drivers/bus/mhi/host/clients/sahara/Kconfig         | 15 +++++++++++++++
 drivers/bus/mhi/host/clients/sahara/Makefile        |  2 ++
 .../qaic => bus/mhi/host/clients/sahara}/sahara.c   | 21 ++++++++-------------
 10 files changed, 35 insertions(+), 35 deletions(-)

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
index c7c0b3eb4b65fb7776a6c724cb3105046cf6f7eb..dc64beae06ada6915a506ed8f4ae4d71c03158bb 100644
--- a/drivers/accel/qaic/sahara.c
+++ b/drivers/bus/mhi/host/clients/sahara/sahara.c
@@ -1,19 +1,20 @@
 // SPDX-License-Identifier: GPL-2.0-only
-
-/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. */
+/*
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ *
+ */
 
 #include <linux/devcoredump.h>
 #include <linux/firmware.h>
 #include <linux/limits.h>
 #include <linux/mhi.h>
+#include <linux/mod_devicetable.h>
 #include <linux/minmax.h>
 #include <linux/overflow.h>
 #include <linux/types.h>
 #include <linux/vmalloc.h>
 #include <linux/workqueue.h>
 
-#include "sahara.h"
-
 #define SAHARA_HELLO_CMD		0x1  /* Min protocol version 1.0 */
 #define SAHARA_HELLO_RESP_CMD		0x2  /* Min protocol version 1.0 */
 #define SAHARA_READ_DATA_CMD		0x3  /* Min protocol version 1.0 */
@@ -922,13 +923,7 @@ static struct mhi_driver sahara_mhi_driver = {
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

