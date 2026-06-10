Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9842DC331
	for <mhi@lists.linux.dev>; Wed, 10 Jun 2026 05:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781070778; cv=none; b=O1LED5og6oL52E7sbSFiim4ZXB+G/SY8RE/iE8LSxjEzToSpOk+NwNntBI8m8PbILd4VsXQO7fn5/E/7W3PT9N9EtiwE0IcUQfbTizy263VgWj2Umfm9NPUQpUkIlPydymqK300hSBHSQdf2NCMeioK1j2YD7IIXkTtdWrF9drM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781070778; c=relaxed/simple;
	bh=SCb5JdpwwyhuPYxgnCpTsUjM/m5K7yjby9KZ/2wyEu4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CitzpHrOQJ4+UByRlvkHDDl/Z5xufOVJOWPiFkudMydR0UdhTzyz5JybXjzfIuOBkpfpWVnOObMUOcUDH/MosRJGkpwRlrCEnh9MrkMa5wQkKnEyIYXX+aRPYT6piZ+cse8HnorG29S1+vmINtfSnmCGkr2S2NbRA40kqsr8Zzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l9+GZBpd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FoWf4FvN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l9+GZBpd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FoWf4FvN"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A5Si1n688972
	for <mhi@lists.linux.dev>; Wed, 10 Jun 2026 05:52:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0RaNe1EFZcr7pe+M0opguIhKZAP/A4Gj9NbfkvE3bNQ=; b=l9+GZBpdx/IMyHBt
	oFftq8PD5DcOfIhMxdf1Z7e5J4ZlvqG4xwUB8L2eqq3G0+ecexO9MZX36G7aaXrM
	JZVeRc9EWCR9tIgGs3rDrpyHZAkP/ypEaclwXn+gkQIS23aFzQBMtu5tg87CTiNA
	aqPQgLB8wSFpbFI+XBxbXGP+e4OzE5+NhZDpkqjr1LGaGYqh0ZBkVye7RXILmd87
	/ET3kQ7JoLfWhZG0IoGZbDTTmwFdY5sbO1/vA/QCN6ZAMY0NU6+U+gcH1i9SIrzy
	25mJTbIspTi/UUiGI01eSSU0gQIoZSDjKzQsmBCGyO8iOl2dIvfUGYt7u7KK2kll
	X7lxvQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq1tg02kf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Wed, 10 Jun 2026 05:52:55 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf1845bddfso74272885ad.1
        for <mhi@lists.linux.dev>; Tue, 09 Jun 2026 22:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781070774; x=1781675574; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0RaNe1EFZcr7pe+M0opguIhKZAP/A4Gj9NbfkvE3bNQ=;
        b=FoWf4FvNzvX2D9ct3dw3m4TbGk3x4uSLENt+s2Swg2J+OIhjWMikJyrix90ilqfRjL
         W+aqtX81fJzzcJ25bu4dBcVpAKRQUTGt1zSfn9fMhcGWptvZSgH7zSfoDiBxEV0QN2bE
         eRHQWvi4TRDudGSOBRH4Psd2RTb9mC1kqGDHAIQh8B6AnosCE0JU7J5ZIiYgeYbEEvwb
         dmCPVk3CcKRI1oHK0Up2fXalvXEdP8otw8VeHsKWTqasyhBobVJ8TPuQ4MInbJzF2sz/
         blW8vIbcWZD1T1NqXmKO7SyNiOWpLyZASC0o9Fz1WTGGC/7Wn0OXusNXLdt/VBovcrhy
         sJEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781070774; x=1781675574;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0RaNe1EFZcr7pe+M0opguIhKZAP/A4Gj9NbfkvE3bNQ=;
        b=DzWt399MqmH77trff6BDxknVZ4FwQiCEhOd6aQfhWvtkIB11lfYGrsS3thWWg/cpy1
         EZTjLvlefUCILBL1oTAHwTkOzuszA/cCY/CRmdqS1qOzAN0+dvp7prtB20V1AaJ7hvI/
         qWtQMQ7CyjzFF9/u89/po4MlOQnrzs7LWwFVhBiilq1LoMQX43iF2a/00iDwWx9Xc/9r
         u6mau8kEzQaZttuk3atPESZ4tKAPPYK4J8fgGiFbDBYo75wUw1Q7/H89zF1s5uzxAZoP
         Qa83F5ag57HEmO7Hz78PUveFRl1XOl0t3PyuELn10oqSo3cQ1ZfyFccVEDM453PcQt1n
         im0g==
X-Gm-Message-State: AOJu0YzPd1sBfslApYvsJJrDk5CZU4DVX2tiWilMj6IZfXEKmmdpBJHk
	rt4/ydVJdjWpFXsicrMV6At+V2niBl2TIeYx9TLgr1QNd4WLtpBpEW1W2gzfh9nJWR+MTq/Y6zI
	vKht4G1JRbixY4rq9Zme3SKu3pT9KJ0zVPS5wAFnNqL5QMtytQ7THK+Y=
X-Gm-Gg: Acq92OHVwr5RQ1i4zKKWNV/f4NsNf1TYHpNl59BvmmJNxMhM/LqZNR1Tk0Zbi/XDQey
	ZjLrD9aEEMFDk5qbG0tp26AxD+y1ni0HlN0w0agMPIbIYeSifCp9QbSfdlEFaM65qb5KL0wuK2V
	WaSEyNcqGVP5UFsnUuWVnVXx/KOzKCmQtmA8/96v3HDB4TICEmaZCl9MjwKMK/PY8Ba/b4o1Gg6
	mwOVztVexSvRjkT7rEXVAZVSwB8gJ/Mmhn8g/XNq8UkrX3cl2/VsMbtEnnAvdQnNAy2WOCfv8/A
	u/dpmWhmknktBwgDgJcKRqj3jogNtIWp1VWOworX+2CDWFJci6Gc2axZIgyMORnJPVoNxTeqwiI
	8GASB+/zz63pqTRfZHkmpgKDlKBXWAYGGXSkXW0wATXlHaJwdABtOoij7rg==
X-Received: by 2002:a17:903:3c48:b0:2c0:eee2:fc40 with SMTP id d9443c01a7336-2c1e80cede0mr273610995ad.3.1781070774280;
        Tue, 09 Jun 2026 22:52:54 -0700 (PDT)
X-Received: by 2002:a17:903:3c48:b0:2c0:eee2:fc40 with SMTP id d9443c01a7336-2c1e80cede0mr273610625ad.3.1781070773718;
        Tue, 09 Jun 2026 22:52:53 -0700 (PDT)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c24edc8acasm108601105ad.45.2026.06.09.22.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 22:52:52 -0700 (PDT)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 11:22:27 +0530
Subject: [PATCH v3 3/3] bus: mhi: ep: clients: Add loopback driver for data
 path testing
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-loopback_mhi-v3-3-a733c0cef61a@oss.qualcomm.com>
References: <20260610-loopback_mhi-v3-0-a733c0cef61a@oss.qualcomm.com>
In-Reply-To: <20260610-loopback_mhi-v3-0-a733c0cef61a@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sumit Kumar <sumit.kumar@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781070762; l=7042;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=SCb5JdpwwyhuPYxgnCpTsUjM/m5K7yjby9KZ/2wyEu4=;
 b=uHKlPIIHk3sZ4Hmksb0hNEK7d4tgAZm1RgXWtX6c2UdT7jJUFFaUDZFI1Q2z5NWZYDHVbSfGt
 UtwoUNsfsgiCum+DK0gpzhlckCvp6o1CGkxhrIezi+7PqQDrZBfg7/m
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Proofpoint-GUID: S8hkkh3zduOdAVjcEZUop6W9pDBOvuli
X-Authority-Analysis: v=2.4 cv=dLmWXuZb c=1 sm=1 tr=0 ts=6a28fbb7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=F9PWhn0UeK7EsyOwsFYA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA1MiBTYWx0ZWRfX3bhXv3bxUrmR
 v7RS2DBYeKeKnCU4M3K2IUvOobkADiFP4Cc5/8ssEuiQVLDoiQ4Xk5bWjpFqjFsRaOGoKWORprt
 CI6bxj+fxhXz/aQ4C9/28hi8dWOGeLgbgW9lRpiTO9Lvn0Q2DGaGYY4PBtG2lxmoOP7BFwdaQAr
 jSwNeG+5YrK9qDH6AT4lwj0QJ6in1GRVWEEBlZq5sdR8NSMNlFn597FteNKP64wfoBqPCzAfZLR
 pO641otShL3hECQUQt0+UyrDcXHREvYLqKA6iYCQZeIGZR6gW6A7nuhscWzdoquXmnlVTsRlv5l
 NXxcKeO2oXNVfTr2ASmGnLzc4Cat0Guf6RYPBcEEv/t/xoAtee/UImEhaMHG3GRugZwCQB0iYSF
 VqzBhEJ6ZUOQQJVKELhIeALQbMuD7wyf/ToLLzdl00mGAD0wbbwPNR4dYDr/VsY22fPwio1Wgo7
 ePqEgbGe+GtZx4Lib5Q==
X-Proofpoint-ORIG-GUID: S8hkkh3zduOdAVjcEZUop6W9pDBOvuli
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100052

When an MHI endpoint device runs Linux, there is no firmware to implement
the LOOPBACK channel echo that real modem firmware provides. Without an
endpoint-side driver, the host loopback test has no software echo partner
and cannot exercise the full end-to-end MHI data path.

Add an endpoint-side loopback driver that binds to the LOOPBACK channel and
echoes received data back to the host. An ordered workqueue is used for
asynchronous processing to preserve packet ordering. Together with the
host-side loopback driver, this enables complete MHI data path validation
for Linux-based endpoint devices.

Co-developed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
---
 drivers/bus/mhi/ep/Kconfig            |   2 +
 drivers/bus/mhi/ep/Makefile           |   1 +
 drivers/bus/mhi/ep/clients/Kconfig    |  16 +++++
 drivers/bus/mhi/ep/clients/Makefile   |   2 +
 drivers/bus/mhi/ep/clients/loopback.c | 122 ++++++++++++++++++++++++++++++++++
 5 files changed, 143 insertions(+)

diff --git a/drivers/bus/mhi/ep/Kconfig b/drivers/bus/mhi/ep/Kconfig
index 90ab3b040672e0f04181d4802e3062afcc7cf782..9edb81b39890e093a51138465a4d7705767eafa5 100644
--- a/drivers/bus/mhi/ep/Kconfig
+++ b/drivers/bus/mhi/ep/Kconfig
@@ -8,3 +8,5 @@ config MHI_BUS_EP
 
 	  MHI_BUS_EP implements the MHI protocol for the endpoint devices,
 	  such as SDX55 modem connected to the host machine over PCIe.
+
+source "drivers/bus/mhi/ep/clients/Kconfig"
diff --git a/drivers/bus/mhi/ep/Makefile b/drivers/bus/mhi/ep/Makefile
index aad85f180b707fb997fcb541837eda9bbbb67437..ab36ef2a40ab8174e5ddae44a3e6ccb8eb31168d 100644
--- a/drivers/bus/mhi/ep/Makefile
+++ b/drivers/bus/mhi/ep/Makefile
@@ -1,2 +1,3 @@
 obj-$(CONFIG_MHI_BUS_EP) += mhi_ep.o
 mhi_ep-y := main.o mmio.o ring.o sm.o
+obj-y += clients/
diff --git a/drivers/bus/mhi/ep/clients/Kconfig b/drivers/bus/mhi/ep/clients/Kconfig
new file mode 100644
index 0000000000000000000000000000000000000000..4cf27184058ca2be020885b6f57b4cc44b5054b6
--- /dev/null
+++ b/drivers/bus/mhi/ep/clients/Kconfig
@@ -0,0 +1,16 @@
+# SPDX-License-Identifier: GPL-2.0
+
+config MHI_BUS_EP_LOOPBACK
+	tristate "MHI Endpoint LOOPBACK client driver"
+	depends on MHI_BUS_EP
+	help
+	  MHI Endpoint LOOPBACK client driver that binds to the MHI LOOPBACK
+	  channel as defined in the MHI specification. The LOOPBACK channel is
+	  implemented by MHI-based endpoint devices (modems, WLAN) in the field,
+	  where the endpoint firmware echoes back whatever the host sends.
+
+	  This driver receives data on the uplink channel and echoes it back on
+	  the downlink channel for testing the MHI endpoint data path.
+
+	  To compile this driver as a module, choose M here. The module
+	  will be called mhi_ep_loopback.
diff --git a/drivers/bus/mhi/ep/clients/Makefile b/drivers/bus/mhi/ep/clients/Makefile
new file mode 100644
index 0000000000000000000000000000000000000000..71dc91cc63b02592b177cf66db6090748c0653a6
--- /dev/null
+++ b/drivers/bus/mhi/ep/clients/Makefile
@@ -0,0 +1,2 @@
+obj-$(CONFIG_MHI_BUS_EP_LOOPBACK) += mhi_ep_loopback.o
+mhi_ep_loopback-y += loopback.o
diff --git a/drivers/bus/mhi/ep/clients/loopback.c b/drivers/bus/mhi/ep/clients/loopback.c
new file mode 100644
index 0000000000000000000000000000000000000000..f346ad9ffca9eb957680b1d259c9789e55cffae9
--- /dev/null
+++ b/drivers/bus/mhi/ep/clients/loopback.c
@@ -0,0 +1,122 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/mhi_ep.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/string.h>
+
+struct mhi_ep_loopback {
+	struct workqueue_struct *loopback_wq;
+	struct mhi_ep_device *mdev;
+};
+
+struct mhi_ep_loopback_work {
+	struct mhi_ep_device *mdev;
+	struct work_struct work;
+	void *buf;
+	size_t len;
+};
+
+static void mhi_ep_loopback_work_handler(struct work_struct *work)
+{
+	struct mhi_ep_loopback_work *mhi_ep_lb_work = container_of(work,
+								struct mhi_ep_loopback_work, work);
+	int ret;
+
+	ret = mhi_ep_queue_buf(mhi_ep_lb_work->mdev, mhi_ep_lb_work->buf,
+			       mhi_ep_lb_work->len);
+	if (ret) {
+		dev_err(&mhi_ep_lb_work->mdev->dev, "Failed to send the packet\n");
+		kfree(mhi_ep_lb_work->buf);
+	}
+
+	kfree(mhi_ep_lb_work);
+}
+
+static void mhi_ep_loopback_ul_callback(struct mhi_ep_device *mhi_dev,
+					struct mhi_result *mhi_res)
+{
+	struct mhi_ep_loopback *mhi_ep_lb = dev_get_drvdata(&mhi_dev->dev);
+	struct mhi_ep_loopback_work *mhi_ep_lb_work;
+	void *buf;
+
+	if (!mhi_res->transaction_status) {
+		buf = kmemdup(mhi_res->buf_addr, mhi_res->bytes_xferd, GFP_KERNEL);
+		if (!buf)
+			return;
+
+		mhi_ep_lb_work = kmalloc(sizeof(*mhi_ep_lb_work), GFP_KERNEL);
+		if (!mhi_ep_lb_work) {
+			kfree(buf);
+			return;
+		}
+
+		INIT_WORK(&mhi_ep_lb_work->work, mhi_ep_loopback_work_handler);
+		mhi_ep_lb_work->mdev = mhi_dev;
+		mhi_ep_lb_work->buf = buf;
+		mhi_ep_lb_work->len = mhi_res->bytes_xferd;
+
+		queue_work(mhi_ep_lb->loopback_wq, &mhi_ep_lb_work->work);
+	}
+}
+
+static void mhi_ep_loopback_dl_callback(struct mhi_ep_device *mhi_dev,
+					struct mhi_result *mhi_res)
+{
+	kfree(mhi_res->buf_addr);
+}
+
+static int mhi_ep_loopback_probe(struct mhi_ep_device *mhi_dev, const struct mhi_device_id *id)
+{
+	struct mhi_ep_loopback *mhi_ep_lb;
+
+	mhi_ep_lb = devm_kzalloc(&mhi_dev->dev, sizeof(*mhi_ep_lb), GFP_KERNEL);
+	if (!mhi_ep_lb)
+		return -ENOMEM;
+
+	mhi_ep_lb->loopback_wq = alloc_ordered_workqueue("mhi_ep_loopback", WQ_MEM_RECLAIM);
+	if (!mhi_ep_lb->loopback_wq) {
+		dev_err(&mhi_dev->dev, "Failed to create workqueue.\n");
+		return -ENOMEM;
+	}
+
+	mhi_ep_lb->mdev = mhi_dev;
+	dev_set_drvdata(&mhi_dev->dev, mhi_ep_lb);
+
+	return 0;
+}
+
+static void mhi_ep_loopback_remove(struct mhi_ep_device *mhi_dev)
+{
+	struct mhi_ep_loopback *mhi_ep_lb = dev_get_drvdata(&mhi_dev->dev);
+
+	destroy_workqueue(mhi_ep_lb->loopback_wq);
+	dev_set_drvdata(&mhi_dev->dev, NULL);
+}
+
+static const struct mhi_device_id mhi_ep_loopback_id_table[] = {
+	{ .chan = "LOOPBACK"},
+	{}
+};
+MODULE_DEVICE_TABLE(mhi, mhi_ep_loopback_id_table);
+
+static struct mhi_ep_driver mhi_ep_loopback_driver = {
+	.probe = mhi_ep_loopback_probe,
+	.remove = mhi_ep_loopback_remove,
+	.dl_xfer_cb = mhi_ep_loopback_dl_callback,
+	.ul_xfer_cb = mhi_ep_loopback_ul_callback,
+	.id_table = mhi_ep_loopback_id_table,
+	.driver = {
+		.name = "mhi_ep_loopback",
+	},
+};
+
+module_mhi_ep_driver(mhi_ep_loopback_driver);
+
+MODULE_AUTHOR("Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>");
+MODULE_AUTHOR("Sumit Kumar <sumit.kumar@oss.qualcomm.com>");
+MODULE_DESCRIPTION("MHI Endpoint Loopback driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1

