Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1BA3F787B
	for <mhi@lists.linux.dev>; Mon, 17 Aug 2026 10:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786961696; cv=none; b=UAdli1Gd3Z2/Sy05lWGUZ2r0KpEi3sXik4vurKtQs7p68DDAa4GYiRAJ2K0fbxGUqrFwpCF8yFOuSjeiefJgK7O91Ki3jsi7w+FWWEf42uP6Ux7FtIOyuE4TZeW2gbxxyRaLAsm5GccsjIz7TntVJ8MTSE9KUY1Ktoes5jHvrRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786961696; c=relaxed/simple;
	bh=XoQxJJ4G4Dr0ttKF9Uej+JnGlrI6hRsCj0OAR11OKhY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IUblrcOVmzQRoxnfZUqBixbOqVbrogQT0WITpdrlrfhMfpLVMdk4rcziFj1svwrG79S3FLYPJPPTdOvkxmorpPbxLa1+ZLn1Ue+lWXNEeEIhESSouZvRuNuVgFTNFjm0l+ttb2TxIZRMOvKUcINNpRKf9wby22/xQfXdJKLlxL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lMDBHQLm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a9tmKZEQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lMDBHQLm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a9tmKZEQ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67H9dwMm1963829
	for <mhi@lists.linux.dev>; Mon, 17 Aug 2026 10:14:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dX9CJTTi2Ly8+vgHI4D9jojeLGUDlkOkyBwFunQwNU4=; b=lMDBHQLmNyAMV7LZ
	ibaz7TogGOvP8C0SOFc4gJ8XLNL5l9Pu+gXOUPgdfJW//riKYXc1v62LBruxC5uh
	bT7j1wGo6s1bIkd2dGrDwPnUwRNmm1z6SsjqFCSuHw4WES8G8CZKLo2LttjCVC4P
	Yx6RSvqx5ncDmpIqLntqzHp5DJAJsb3GFDmZK+EWgLrFTU4yuvymyAaaA5Qa5BSB
	NF0htXkJGTQaNSgNJaWqxDJH77i+9VDvqkvNKBlOks5uYdBYj3jjmGv77713ukO0
	W9kzYkN8b5AXVcaQ2TbF6QUV0XEXxzGRMzkiq/ZFxIAYuzWevOIAMS8Bhj7h+1ok
	TFO2qg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3wregpbv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 17 Aug 2026 10:14:49 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3950b1371a7so2777904a91.2
        for <mhi@lists.linux.dev>; Mon, 17 Aug 2026 03:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786961688; x=1787566488; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dX9CJTTi2Ly8+vgHI4D9jojeLGUDlkOkyBwFunQwNU4=;
        b=a9tmKZEQSlL1UY8Xlpsm5FS+IBKPqfNqiQpPOGBUSVohTRc5nXvZqLS18XWTq1cWgC
         zkhaJv08Bt1V6362VOmjNf0FpllUiHfWHB0M71WDQwsmZCI4aBsJF/ZdsND6exWTh8hV
         MInBFF/uDea/9mDk+MHEePydW6MXzL+JuWZCiwiMIrt9ErYBdYDLbY8dLt2Nuzxa12L8
         G9frm0obaLNZaWQppBYe1WxKXEocOHZsofEDtZKfDuZ60GY846UaN2F2glkEuis9k/Lm
         ICWKjp6T1qF+hLZs1DPAqP+fy7hk1o9xcYDLaCqkzDxWDMklixKAWdHmwzdZGpsuWiG/
         WRyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786961688; x=1787566488;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dX9CJTTi2Ly8+vgHI4D9jojeLGUDlkOkyBwFunQwNU4=;
        b=HJmr8GQjHd59AoyycT9ShpMBhfz/TlRVPhXo0H5QyK/LxMqIkIdV7tqaXQHEibjXmb
         i36z6Q1mfPZ4Tvlk+KUvqEsGdELJgc6qqcEt+J+pua+uYkpp7UlYZQJOQU83fdzYPh20
         M5/JorKrVX/zsV08cZImfReBzwnuSomckdPNS5wS2U++wY4eENx6jpD6BIYGd9In/V2+
         y/wKpfABPL8KuJ48im8LQ8qgnLePjPwa8T2J3h8r4nrS5QB63RS1TjuyNjF8S6OS3qtD
         PKm7XEFZCa4s6q8qxoVi8qvlXGTgbqJ3ud48XsS9IdJ6+zl9XrT1qn4AGS57Mf0NvRwV
         uYDA==
X-Gm-Message-State: AOJu0YwXrzqKeQV1zN9GHqhXySCyszJoD3A89zo4o1ps/jaEZdGjNDni
	AfhXEw5IZXjtfQ/TpLh0AbXsGcZJa6gz/ANvtsOThiMlVBUcDfjAoqq+Ak3hLqI+F5gqjzqJRqf
	Vv+36CWYTJfUyVfeGqtqFuumQmxA9NjBL17jYs3ldlZRUDTNOq4hVATU=
X-Gm-Gg: AR+sD11MLPkuDJ/ffXhkoOPXASsv0RY2VUHmWOYh75yXGeJwO1cnAfgp36EroMEpzA9
	qRt0ZAw/bSyoLZwKh+YRNr5v7oTJ+l2dioy+mFtRyPqAAEfd/Lmxbax5tKpjs/hUKXLzMGzrQ49
	B3R+2MkwY8HXQLAvfYVf3sgrs5IISNC5PXYRUFSYxBsE7mas4n17UsmAgm1VOzAH/dVsgvPMhKA
	Nl32tJlVX6i/3cPidtgyFpXzcZ1b5tkcWpsyOOHkd8iTWhaf3NuM2/oaDM3SLNV77+Orswd7fBp
	S5mRwyvw2lbdw32R15Ykj473wx4FwCbx4J1jf1w9UgwDPkvcgk7ir+6XYTqkNQNDyhu9ZMKEQ2R
	1sEutkeZc66xrOtqCKvjWcrQXKg==
X-Received: by 2002:a17:90b:1a87:b0:38e:57a3:f218 with SMTP id 98e67ed59e1d1-3933b956294mr24198932a91.13.1786961688422;
        Mon, 17 Aug 2026 03:14:48 -0700 (PDT)
X-Received: by 2002:a17:90b:1a87:b0:38e:57a3:f218 with SMTP id 98e67ed59e1d1-3933b956294mr24198874a91.13.1786961687867;
        Mon, 17 Aug 2026 03:14:47 -0700 (PDT)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3954d3d2adcsm1744315a91.17.2026.08.17.03.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 03:14:47 -0700 (PDT)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 15:44:36 +0530
Subject: [PATCH v5 3/3] bus: mhi: ep: clients: Add loopback driver for data
 path testing
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260817-loopback_mhi-v5-3-50efc7360b7f@oss.qualcomm.com>
References: <20260817-loopback_mhi-v5-0-50efc7360b7f@oss.qualcomm.com>
In-Reply-To: <20260817-loopback_mhi-v5-0-50efc7360b7f@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sumit Kumar <sumit.kumar@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786961675; l=7186;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=XoQxJJ4G4Dr0ttKF9Uej+JnGlrI6hRsCj0OAR11OKhY=;
 b=6lYGLte404UZocgwzJBcKpkiCEszoNVkI0+J2liHJMXrXMFxi9/XCW9WX0+3hPCgfG7r/uzLw
 DXGl81ZwcK3Cn5S7/s3MiV3bO5GioGST8Hp7E/n6AsA3eh6AJx7DFS1
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Authority-Analysis: v=2.4 cv=FqI1OWrq c=1 sm=1 tr=0 ts=6a82df19 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=F9PWhn0UeK7EsyOwsFYA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: dYkNiZpZDmUVQNEt0TYyPtji6M-I0Ek5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA3NSBTYWx0ZWRfX6EhoNGqVKNg9
 CbA1Hy+hB4XgPVKrvsm4Oy66Hb1soQ5VsTuar6CriR69mkTZeEuF2iGPasgHqsFY6SKUGMj6lL2
 B39wCgpT0Vq2ea6KmmlE3mj/Wf9sIT8OSwh8tUpRhK3dhA8DaCzYeuGBQKtL6AENBI700HkjHz6
 JL9cpSS/Uz5OBJkuZWaYjNw7T2MFnbg/Fl//Qt8mJSAI9BuMVNUcYKmTrArA4sX2oLUdHEV8/sZ
 zvALdc6AvdtEmcEmsvM77pOpaMLgjMrOXR2b8IHwvc4HCQPpkvziFMUzMDDaiNojXKxsdqcMm5o
 QjcvEGGk2Snuk44238gO6BIweZMz3iBV1yiuvzsYrNllW2KLj5MwaDqr+DWDyHBzqxUVtW9Gjlo
 FDoloCHIuJIu0qHitrlQJxm4xmiZbX7pT2zHXKh/z/2qDf5nr8uX5Ljba1Tos8PSYJR7/6IMxrk
 xem5hEZ5EXgYS7lDvNg==
X-Proofpoint-GUID: dYkNiZpZDmUVQNEt0TYyPtji6M-I0Ek5
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA3NSBTYWx0ZWRfX6RVqRVdWBzRX
 oEHDJ1AK5pFpHHcoJ1iIcWggyvEXPvj5uc5Y+vfyumZVEXGm0oqeWaSqodFLtWSoYNkbiH6/H5v
 QVBaSQulkzUq/i6WO3WEAWJNDOAgsrU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170075

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
 drivers/bus/mhi/ep/clients/loopback.c | 130 ++++++++++++++++++++++++++++++++++
 5 files changed, 151 insertions(+)

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
index 0000000000000000000000000000000000000000..18a92d6a40e0f7de277d155cdb5495d14a60c19d
--- /dev/null
+++ b/drivers/bus/mhi/ep/clients/loopback.c
@@ -0,0 +1,130 @@
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
+	struct workqueue_struct *wq;
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
+		dev_err(&mhi_ep_lb_work->mdev->dev, "Failed to queue buffer: %d\n", ret);
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
+	if (!mhi_ep_lb)
+		return;
+
+	if (!mhi_res->transaction_status) {
+		if (!mhi_res->bytes_xferd)
+			return;
+
+		buf = kmemdup(mhi_res->buf_addr, mhi_res->bytes_xferd, GFP_KERNEL);
+		if (!buf) {
+			dev_err(&mhi_dev->dev, "Failed to allocate loopback buffer\n");
+			return;
+		}
+
+		mhi_ep_lb_work = kmalloc(sizeof(*mhi_ep_lb_work), GFP_KERNEL);
+		if (!mhi_ep_lb_work) {
+			dev_err(&mhi_dev->dev, "Failed to allocate loopback work\n");
+			kfree(buf);
+			return;
+		}
+
+		INIT_WORK(&mhi_ep_lb_work->work, mhi_ep_loopback_work_handler);
+		mhi_ep_lb_work->mdev = mhi_dev;
+		mhi_ep_lb_work->buf = buf;
+		mhi_ep_lb_work->len = mhi_res->bytes_xferd;
+
+		queue_work(mhi_ep_lb->wq, &mhi_ep_lb_work->work);
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
+	mhi_ep_lb->wq = alloc_ordered_workqueue("mhi_ep_loopback", WQ_MEM_RECLAIM);
+	if (!mhi_ep_lb->wq) {
+		dev_err(&mhi_dev->dev, "Failed to create workqueue\n");
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
+	destroy_workqueue(mhi_ep_lb->wq);
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

