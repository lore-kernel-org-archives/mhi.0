Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C903F47728A
	for <mhi@lists.linux.dev>; Mon,  5 Oct 2026 10:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791196790; cv=none; b=S0+dHOBWe95nmNk8KXHEB66vbrYs9xXzJXn8b5+SL4rNuefy8fe0HQ10zhmMVK9M02UCnb+PKBj9aP6rfz62P2g4wk10VVV5RKupN0w7M9d8/ID4bJIoCfZMZ0TsB+Pb2U8yC29Kn87I6sCW/3FfNMDFoKS4BKOcfac5ECpha38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791196790; c=relaxed/simple;
	bh=rQFvOgrxAjTZgIQ8VEY+1I8jX16u5bvsCq37mDZ8aos=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cSxFSjJLp6kb+cyhIkQc0BB4M0F7i+YeSO0NlQEdd9soQqsONdrv9+K0rhmVpaJgLJkVLO84drE3Rc8ykbxRpxnv0xzS+JSVB1baarUUH5j5mr6p6VK1f/XVv+Jkr9AdVpiU1Vfho2TI/pP1Z4M0q5XDej3Ivh/MT1MGUEcSSVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nbtC1pgF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C8r4Tm4C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nbtC1pgF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C8r4Tm4C"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6958xQv8646051
	for <mhi@lists.linux.dev>; Mon, 5 Oct 2026 10:39:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	30HDs5bhuPq5ln0VMFr+h91aND3ddoQz9VJRS079r2U=; b=nbtC1pgFkdMrH7qx
	RS0S7UWgn7v9Z0gl70HdTznttImMG06CHpSGq79vBlKw5pGF3Zr32rG27c8jL9ST
	e6gAzioDe4IzyL70rtZCpJTGHnOS8j8OuPNX5hbDL9bA5ChlGjVXrnt2BuSWCKrp
	PKFcUBf1mWLXK15M93+vNN2bEb9rZxsQhH93bm3DNNdkn5YEcnV3YqeXOpHNK4sk
	a8soV60BmaE0YUalDe/OHF1c1/46vOAu7ay4BdlPirUXuhvNy8AQmeHdF+YOXmeN
	3/GFBJFC+brSUhwhLcOnUCRe/TmfVhZoUJbG9VZsIpPnX0tN9i2D3jKG/fhpaqKy
	v0uXvA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2u08nca5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 05 Oct 2026 10:39:48 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3a6d30f66c9so1876516a91.0
        for <mhi@lists.linux.dev>; Mon, 05 Oct 2026 03:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791196787; x=1791801587; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=30HDs5bhuPq5ln0VMFr+h91aND3ddoQz9VJRS079r2U=;
        b=C8r4Tm4CZSsd2rIxSkNbiKxMXqmc+1TrM4fSKBhiY+TWgfNhajT/88Swo7c9BQNrzw
         6g3vRISZHpBZEWG8OYn0/rmRWMlgQvfYMwR+opZ8seterA9H4A/N7UlbyDUnR1KfA9KQ
         TN13Rnlhm02aAQlVEB7ZnKqiZ58M4QO0LkdnUzNERpJqMrz37Kqw8VcQeOHevrQ84IEP
         S5Q/gVaLLgHtSlT97Y+YDDnuVqNmvttsbA8yki0n2Ge8HJEnukubncljZv1Eb6t3u35/
         boCt1Nj+qtMYR2CAMK8X2XSOVY1TCBAfa62VZhR9xIF+6HiH2MRCe/wUqdfiIX8UvLXL
         M4sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791196787; x=1791801587;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=30HDs5bhuPq5ln0VMFr+h91aND3ddoQz9VJRS079r2U=;
        b=w30PNadJ67DSaAMlUuvKO9TZH1qAPkddOrFzGe2wTINkun52wPkjQ6AUm3BrQY3NH1
         B7A+TE9/pmBJOzSAKfmjhx2xJLtUTDApz2Gb7a7/eobj4c+kialnEb8I+66t5U1nHvnL
         C9tIdyvwfLqGWZvE6zNiJiDt7J462+CzegyJbQsx5SoRhO2vdkj6bDulgenDmcb6BRN8
         DkzX3Ldt4/1BQGNUJj6e003dz2KHQsa5cs0PIRfCj+q4ZH7JaG1IcZ8MHuUMGIbmvZfO
         Ztdq9RmEMULRaT9Ba431lHBUHD/rP7w4feqt9y8Uk35sUjXCH8JBvcbuCrd21Ixqbi6T
         jZRA==
X-Gm-Message-State: AFq9FYKqN4kcqjjekI4mAjv+KIldfoUZvVofVulTu0FdJE0KiCo6eAQm
	pzzJ5yXIsR1vV+whXO0kEoI0AiMbEo0ml2XOgRiWWCZ4ney3K6CMduzUgTZo+IKBT9eZ77GwsIB
	pmZTxwAqZcxyHInR1GzU0vwfgfDeGvs7Nn9KRg4eGRkr0WFzK9nXOAWw=
X-Gm-Gg: AYBFou27gLHVWRn95Noqxu1f7V7L7i3AlOYYVmagyfpJEd9LAnoSwpadY8e/SulUilI
	l5ZFvjfiSx71bZHn0qbMkdN2O0avqfoybrVCCgkcExHr1TeFwn4ND3UVgZTHfDV/BAnMcp+PAB0
	o4CzI2MBCrxxps8elzlNg3WsJxc2j3lvSF5gXbVawEBy4H7DWByOiZ6ErtAmGeRse5xpLJtyMA5
	p/o8hLFyShxp17/cLg/XkkPMvqhG/Fi12Fap+3pKljt4DyPRfiTup5TAlkCZ4s2zpcdjb8dHDeh
	NrvqomnDdaTeGfjJyWfGXxafXZSoIbQPuVe5tsMRKZ4z+kCeGLgSqMOVB5lR6jKcAoiUyn3u1h/
	xnJPdgWwlVseFnkxcYXNwQJkn
X-Received: by 2002:a17:90b:3ec7:b0:3a0:c20b:2ff1 with SMTP id 98e67ed59e1d1-3a6cec1edf5mr6072594a91.28.1791196787237;
        Mon, 05 Oct 2026 03:39:47 -0700 (PDT)
X-Received: by 2002:a17:90b:3ec7:b0:3a0:c20b:2ff1 with SMTP id 98e67ed59e1d1-3a6cec1edf5mr6072577a91.28.1791196786696;
        Mon, 05 Oct 2026 03:39:46 -0700 (PDT)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78e61386csm11223918a91.17.2026.10.05.03.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 03:39:46 -0700 (PDT)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 16:09:31 +0530
Subject: [PATCH v7 3/3] bus: mhi: ep: clients: Add loopback driver for data
 path testing
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-lb-v7-3-36a268b6386f@oss.qualcomm.com>
References: <20261005-lb-v7-0-36a268b6386f@oss.qualcomm.com>
In-Reply-To: <20261005-lb-v7-0-36a268b6386f@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sumit Kumar <sumit.kumar@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791196775; l=7151;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=rQFvOgrxAjTZgIQ8VEY+1I8jX16u5bvsCq37mDZ8aos=;
 b=WJ7aFCSLgd9GJ34LXq1dwnHufSeWxL2+AR9ZI8gdcUx8rDsNfqOm212vEPF4k7YpdpgPsgIiH
 7S79mDMcbe4D4z1htQWFG2xTCO0kWDUHI7YHGPWe/axCZMR6yRlSMa6
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Proofpoint-ORIG-GUID: 8P7q2gnU-U-WwGWl6C0ywp_a7xQqkMER
X-Proofpoint-GUID: 8P7q2gnU-U-WwGWl6C0ywp_a7xQqkMER
X-Authority-Analysis: v=2.4 cv=JqlkP84C c=1 sm=1 tr=0 ts=6ac37e74 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=F9PWhn0UeK7EsyOwsFYA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0MSBTYWx0ZWRfXxbn+aRnbhIba
 wo4qpx/sUup7e/2PUj+F7uuXR6xw7Se3RU4jIWSh8s8oCIgOtxZNfmcSTYauFoxFKr7/ekEjM6S
 2d81f4rwwZRfI7FcWcWNIW6HR/2TBxs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0MSBTYWx0ZWRfX0G8sVGCIUKJe
 +ZiPkXKXv+XILNRCkjd9Qa+SNnRfRDWbBYBDY91p1qd+PmAHPAZN2WQgq0xvQAPfjMyrNeYnHOK
 mWHMNfzzdofFdCcNNgGH4/cDYdJuzNIx/YZGs1TZiIS5qGyEbbMSgF4jdOiQ3P1QV49LcIkjCTn
 UvTQjw5c/Riq2xjypfQrqw+LncHVYI2N/lUntaPcMWfx2OXO08YYZTjJvwteX8GPhZnGDHWHyEc
 t3X/Va7IQ0B7dzKL/Xg/Z3XRcWNUnzcOd96d/KlBaLtqls9mKr8hGp1LFSwoxj+RiCuJTcErzyV
 cN9YkVaXoqCi3wJyHOtUyfhTKcvggm/l9JfH1GTz24iZKPjPB1e/cQmMN1NB3us1Uc4WomCBglc
 iVsiQ8fjb+xvGfoZHmlLK7DDOMHjQX3pY/NrFEwtWHHBvzgyHCris8EJRpYJWqHb5KmEfgJnytN
 1LJjTZ9QzPRH/2PD4PQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050041

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
 drivers/bus/mhi/ep/clients/loopback.c | 129 ++++++++++++++++++++++++++++++++++
 5 files changed, 150 insertions(+)

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
index 0000000000000000000000000000000000000000..58310644b05d63de19ac7a7237919ef211bb82e0
--- /dev/null
+++ b/drivers/bus/mhi/ep/clients/loopback.c
@@ -0,0 +1,129 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/mhi_ep.h>
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
+	{ .chan = "LOOPBACK" },
+	{ }
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

