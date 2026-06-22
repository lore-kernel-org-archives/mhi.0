Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BB1355803
	for <mhi@lists.linux.dev>; Mon, 22 Jun 2026 05:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782104972; cv=none; b=uyx93HIPpHLFjFGGKbPz44F2tsSZ4BIQxmSOkgC+8fDF3hYIGCyt7POtqdYa9PW1wiMfVCcY2k8BuWnMofjn0UhZpr1mgeRACbQqejLWjMi0XnXuwTL+1PjdimAVwVeE6FJybM1i3JqsMwWVNPzemMn+LyH9WTXC+DmOrOblK4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782104972; c=relaxed/simple;
	bh=yx64t4XAMHE0z7lDJmlBWupNmecgou3W14tKJ6zAt7A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UFQ0A7Rvq2SLx2JRZz+i6UrX3eW+YLXv9iJTE/4qWCtPhaM4gnmAdA0gvFIzd1flMOEz49lQu7H5cKBlhd0W6cEV8tY3z001HrlNN7zXKSCVINjxDzVllJnD/cxjYTleaoiGiOe0j6DVMN5vYF1hbwdSV6tpMdPFJh/7OgTai3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L/zFe7t1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ATbtzH/v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L/zFe7t1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ATbtzH/v"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65LDurdJ2323702
	for <mhi@lists.linux.dev>; Mon, 22 Jun 2026 05:09:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2foTe9u0+0jA2F7WQbtMiKVUOBLINMVJce7lwxJmKq8=; b=L/zFe7t1p6n6oT+R
	jNS6Vvsgq2tlYpfx+f+vkimhpSpQhZ8828uKXkQX/hlZTWMgtTGemzYVvKnKxUht
	LrUAfovoTNWDjvR/qBg2aJlqsTwMjLlTwe6zKz05leEeKb4EM+TzyyXhoyy6wTPD
	w4gLzvKzI0Ma039fvuvNeNCjNcah2BTMQP/o/ZsFdesFqHAfR50K6xkoVi2XTJIC
	lwt3X4eKYjTTnbApG8ATBPC2DMqqlrMrciujhUa92ZUJGYrigps1cQC6cVtr0+rY
	04KbiStJbYN2wjx3VQEUxkGDHQukClK5zjcub9DJ4zoJghyL0+Cp/I7sJb1TU8r6
	MCf4kg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewj6h4vw3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 22 Jun 2026 05:09:30 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8421f5d76aaso2734641b3a.2
        for <mhi@lists.linux.dev>; Sun, 21 Jun 2026 22:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782104969; x=1782709769; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2foTe9u0+0jA2F7WQbtMiKVUOBLINMVJce7lwxJmKq8=;
        b=ATbtzH/vEmVJ+J2YzOYIh/jzkwDRG+3MuYmeDLmstaEW2qHkJn8eEvBcJ7tx+en12h
         K84MzO8QH+rJM8uXf4fVrvhItWwATGh5b2AbvOKdpurtZm+gXu6EknMOP+gkNE/Sf80F
         sjUXA6qXSoM6u1AnY/IiSLQ1LgE24VcWobSdFwb185B52PET7Uu69DHt4QW19UVoUS6A
         uAK7O5+2xxu66n7ZFlnYqFhp7EpVeDDGWLNC2pY5nf57q25rv7qBspoSQ99jsnNj1ra7
         7iKgD4sdgOTuzKIZtMq5k/w/VmqipqovLZg6Ird874jLUmLl73ZogFYSuRerTqOy6K1h
         3qJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782104969; x=1782709769;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2foTe9u0+0jA2F7WQbtMiKVUOBLINMVJce7lwxJmKq8=;
        b=fEIKQg3NDbikhbddGrZ5zDhrFpht9p11FuFIDn89g3cK0EWRdt2cRRzhSh/p9nZsSI
         KC9NHo280CpsBmah47E7XcVjwJtJOz1ChvQ62a+nYKokazSY8JE96vjSvoFSamQ5xD+X
         DqXcTa1a6Kc9gIIQ3M9TzxvyK4ucap9yt5n4TXh74A+Kg5cLfF3rn51vcB1Rn/dbzUAB
         215/oGiqIg5lUx778f2B5NVd4PDfOjEewKi9oNy6Su+4IESBFCW/k3eMWzGBmLTYdTbx
         1lURboSy93ocjbPFXiQ6ZDA63ZK0+yN3bmyozqp3YYIMaJuNqwJYdLgeye7mZT4TlySQ
         64mQ==
X-Gm-Message-State: AOJu0YytSDLGnzTKjLIo+dF4Hy2rDtSxgrw2CD6iIv3l94vhzw4cStP2
	ZHll2srS79WCexoZtpxA3v/z8QZWyXQqPTXZWk0RK9qPbWw4hv0h1nx/TOOsKG2hidgBBzhtTHa
	A9PLzUHHBU/PvJb2/EG7mPb2D0Pot0S6pv0bA7vhVjWdTji4H5cB4KtY=
X-Gm-Gg: AfdE7clEr/wczqmYKIb0Nhl/KNN+55qnPG8+maOC/Yc3Ow4NFK0VHblt8wSwnLlCY6z
	xGGD4e/GFbm6yTec4AStaW+AK5ODFpoFaDPhy8tLqcOkkYaSO6gldn03B+4c9wHpJ4IPYfmJsAL
	gD/SN074g8qjoVFpjsyOGCj8jmMDSHGiF4r6Jk/GXdiBlRwQHc+rUOzjHB9ApEYFhrda+aAQxdO
	VctnrWLjM7Q8C0JO+NdbW3sLo7CuI7cPoG8LsR8F9JrRDmIIf0s4uRBj63HwnRzTdi1KnQyLEeI
	8X4lKyNfmBi0O3UU3PqeYOz4j9J1FpAP3ZfHzIV6B05ihUfVzYMHtjjZsefgPld0tjGxrPksOCT
	cOhJXhQd5nmdc2NB9F3X1bmytMQlvTnMAwTLb
X-Received: by 2002:a05:6a00:94f6:b0:82f:2b0:2809 with SMTP id d2e1a72fcca58-8455077cc5fmr14048555b3a.1.1782104969172;
        Sun, 21 Jun 2026 22:09:29 -0700 (PDT)
X-Received: by 2002:a05:6a00:94f6:b0:82f:2b0:2809 with SMTP id d2e1a72fcca58-8455077cc5fmr14048532b3a.1.1782104968497;
        Sun, 21 Jun 2026 22:09:28 -0700 (PDT)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564d6c5dbsm5905996b3a.12.2026.06.21.22.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 22:09:28 -0700 (PDT)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 10:39:17 +0530
Subject: [PATCH v4 3/3] bus: mhi: ep: clients: Add loopback driver for data
 path testing
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-loopback_mhi-v4-3-782b3a0f2eef@oss.qualcomm.com>
References: <20260622-loopback_mhi-v4-0-782b3a0f2eef@oss.qualcomm.com>
In-Reply-To: <20260622-loopback_mhi-v4-0-782b3a0f2eef@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sumit Kumar <sumit.kumar@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782104957; l=7123;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=yx64t4XAMHE0z7lDJmlBWupNmecgou3W14tKJ6zAt7A=;
 b=gNhPY9LtEd/nPhg9yrSsepZfRkA6bDOBQOhFmG4SoIbgCwU7NJtVL1FUO7Ju0LBLLP7qsWCUA
 EBEWynyk9OaCYvUmMiFC+j0jpicmloeik9UeQbdJgeaG5Ab5jwTtqEI
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA0NyBTYWx0ZWRfX5sbqvprbsY/P
 AWMukKSEXXLuCVktZyqQC83IbQRqnq8DKvlZgg+B6ud6MikNAf0R/9tlNhV+JeVPs34kCmS6L68
 nco19mHTt1U3d3WNy3aVQsKP5/a6SOjFwX05q70RpAtkO6ErD8iY/ps61DuoacwH1rUSw1igLEe
 wqjsizOhP1+cxODZGxI1pHJoUNjNvm182HOT4gH/L2XnCjaRlqCMhMZUrLQtP2X95L+qh9hIsOa
 ct90NyMmVHvHe2+DtCeK8KAD3isJENdCyOyuD8zjJyzMdLFHwda0GjHfA1z9g2B7Ltflu04xIhC
 4L/JMkxKDkiLO/zL4tQ0rxVENNtCMXgLsEQcillbtAK6kU7BNIBjtxORnJ9oPgSrvsyqwfsDfb6
 l1DMsul+44rTyr///z9eEbpbhX59bM3nNnMyQQEM9aTe5uJwbxOXdBF24UiqxzD2onv5N10Zsr9
 vTp4jg2YupbyX1yNJkw==
X-Proofpoint-ORIG-GUID: bZRRxjYd7Ig2EU54oiK_9n2A86wXtU4H
X-Authority-Analysis: v=2.4 cv=E7P9Y6dl c=1 sm=1 tr=0 ts=6a38c38a cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=F9PWhn0UeK7EsyOwsFYA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA0NyBTYWx0ZWRfXzWpMkGQqXsoD
 VwuIxRb8dt+4WA20Ic/ouMcwf4qE6iY3RzlrcG4ScAOGSQejuHxpWgOjs6PxBf0pJWNtPFaHkWv
 hDqpDn8PmWBgLpduylixAroLpuVTdO4=
X-Proofpoint-GUID: bZRRxjYd7Ig2EU54oiK_9n2A86wXtU4H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-21_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1011 suspectscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606220047

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
 drivers/bus/mhi/ep/clients/loopback.c | 128 ++++++++++++++++++++++++++++++++++
 5 files changed, 149 insertions(+)

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
index 0000000000000000000000000000000000000000..05db91be6ffc5afe5a2022962410c96a7ec19962
--- /dev/null
+++ b/drivers/bus/mhi/ep/clients/loopback.c
@@ -0,0 +1,128 @@
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
+	if (!mhi_ep_lb)
+		return;
+
+	if (!mhi_res->transaction_status) {
+		if (!mhi_res->bytes_xferd)
+			return;
+
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

