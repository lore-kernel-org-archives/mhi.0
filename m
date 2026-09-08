Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D977C524AFD
	for <mhi@lists.linux.dev>; Tue,  8 Sep 2026 09:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788859660; cv=none; b=YQoJmV/iENIry5fJCOwFAqulfKBQm3IkrfRll+Uh+QepKW0EAw/YKSbOQDDiTCCP8tIBheTBqXI1Yg9alIJllJzBU4wL+q/QJMwcNmtX1mmGS70G7Zd0nOS07LokuEyc+M0lAHPQlW6a9VAnLR2FDmw/tyLznU4BhRzNWNAuJgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788859660; c=relaxed/simple;
	bh=rQFvOgrxAjTZgIQ8VEY+1I8jX16u5bvsCq37mDZ8aos=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=umNMPvvE4LJJObjJLUDwkykuOItXD9ezSJI7dJNHHKb4WEOSVJ9HEbM+oJQ3jhkpmRPq8p6qD02V8Ansi3pJFwj6kOq9vj+Hg3Sujd9a9tNTpWaye9n6cHEHXjKGM5TigjLN/IopNi8RZcIpq4YxsVxDUUfmBuGpD5FtlSHGg5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a2zP8Nhy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W4nR1Gzc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a2zP8Nhy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W4nR1Gzc"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6888cQWG2380979
	for <mhi@lists.linux.dev>; Tue, 8 Sep 2026 09:27:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	30HDs5bhuPq5ln0VMFr+h91aND3ddoQz9VJRS079r2U=; b=a2zP8Nhy81UeXUu1
	q7KuIEu3vyMI0fxugfkysbTi4wOHKhKIvV7V/FYLiDZr1Oq8R87wjXPOArP0fTvz
	8XmZTuKOq01UjHcxKPg4KT7ag6X6kjXAoeH6Aga+jGYFBlAZV8Mo8idMz4bxy8Fb
	UT3j8fEkARu9OYP4hI2mvGxd5yRgKYGDkMZWp8CScw//2eXENvEs7sXiPNIZOAcY
	nz4piIamznUwRwqJuYTIPrEM4+MNwEvU8p1XooES3YQUXt+wfwA3DbannBouXUEW
	kR8u6pNxZv7O85RRFiDZekjWkNwIN39e6xeJ3Q5ccozn5h1UX/g9qK2aouo6G+G7
	S964MA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjf1cg6k5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Tue, 08 Sep 2026 09:27:37 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc39363cc88so4543973a12.0
        for <mhi@lists.linux.dev>; Tue, 08 Sep 2026 02:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788859657; x=1789464457; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=30HDs5bhuPq5ln0VMFr+h91aND3ddoQz9VJRS079r2U=;
        b=W4nR1GzcLeIipyw4Om0TZanG5Sfzz4AuWPvZuZgDgrNNPIFKzM+3tTtciEE7dBYEmT
         +S7V6zKAy2pAUKpvq25blhXcKajRO0wSNfxJVJtJpvUaI7bTZGDLVgXcpV/+OsRSg3y7
         zYY5b4vRmWe5uwUXKReso40VTHanaqiEcUnUErs5JqfLm8HI93+Z2x/1veqWSdYk6ucT
         nIRdsUPaT1EFo99KB5yLRzp1pYJiz1kC20DvJB7NNsYptN4N5b8fjLkQfAwiyVrtwrr2
         4f7vI4vD9tocMUCePO7yAdbECC2tezhy1dV9tCwPybGNXk5UeMiL9ZyyOjxMPd3LURXo
         /aEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788859657; x=1789464457;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=30HDs5bhuPq5ln0VMFr+h91aND3ddoQz9VJRS079r2U=;
        b=rsRJMhNGA4rNJp33tWlDrYCApK/eZJX05m6HuvmOtchH8fNU4b2H1KLSTxAzN81Oi5
         UjWjKJGgVI3T6B5GmuYZKqptV7zf7AfxbpkfQmQflkmXVNm9VJ+0I1pvRln4/JC1JDig
         AVH1YPWKhXKkjgdUMZ+RkrPg0fM4fPzIAvVSGIgC42M2crsDtLUQ0Q0IXQRBFYuDDEh+
         dCCUaZN0j+Ca32iznmrCRNOtqMfTzicKZSDsNn2HXYRwGUHdc6pAZ5cCmEJguDCUB9sf
         Mohe0Lk/AcMLkirjFQnafhr6bR7o8q+LKa4PWiiqGRNSou0WbvkYVt7f1DaB1rTgyjz8
         HhZw==
X-Gm-Message-State: AFuF++nu+XLC+otP8FqauFfsDS75lEDzsw+7sCNVnaGa/7jnd3L3ApDp
	qybweMY4aVbc8ygHJEipDfgfy9DqsjQOcTc+cbA0rCd8PqJNrzesBFswwueX0zacVRvz/tlrFJ9
	4LppHQMAVvXPJIFpfMEZdrAWKayvua3WRq9nsS5/+rWUgWiUzwfac9AZCmqH4WoE=
X-Gm-Gg: AYBFou2SCL9UUK8FjxziP213mnGioiQIvtvfD0yYTyup7slX6OKIce99j7uvHezn7Zu
	r7T7pKEeuvgGLyXd+kmFagYREuhK4TFPBhCUsBpphSA3L4qEukIkyYiWtMRGA8g1L5eeRiF0Anc
	v0RvGWmws/5XoPN5i6RX3kozwOn7VWoZmaekyff8nur51MgY5fFu96n/dx5NKKeSBHfCmBrs9MF
	H7fJ96uztrtimL4zJXixT0XrXuRi/4QnNfxbi6v14adwJEt3NasptugPFea2UMBp0lndCnK2elf
	5S+wnym8a+gJCVXvqQU6ZAFSUt4mCieLTlFb0RwHoThBYB/HV2NOaXYlEFnv/i7h4rzdfWXxDu7
	W+HIJI88/13UWne72gv5nenaqWQ==
X-Received: by 2002:a05:6a20:a108:b0:3cc:45cc:c401 with SMTP id adf61e73a8af0-3da39ff4c0amr37329399637.13.1788859656573;
        Tue, 08 Sep 2026 02:27:36 -0700 (PDT)
X-Received: by 2002:a05:6a20:a108:b0:3cc:45cc:c401 with SMTP id adf61e73a8af0-3da39ff4c0amr37329328637.13.1788859655874;
        Tue, 08 Sep 2026 02:27:35 -0700 (PDT)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339befe870sm38281492eec.30.2026.09.08.02.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:27:35 -0700 (PDT)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 14:57:24 +0530
Subject: [PATCH v6 3/3] bus: mhi: ep: clients: Add loopback driver for data
 path testing
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-lb-v6-3-66755ceb16cc@oss.qualcomm.com>
References: <20260908-lb-v6-0-66755ceb16cc@oss.qualcomm.com>
In-Reply-To: <20260908-lb-v6-0-66755ceb16cc@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sumit Kumar <sumit.kumar@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788859644; l=7151;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=rQFvOgrxAjTZgIQ8VEY+1I8jX16u5bvsCq37mDZ8aos=;
 b=piWV5N2uDa+lClVajd0K8RReCK5wkLo0NB1f/P1WD5rDIhmzDeydm/kWjtl6pJxUQ6hGtIr6o
 0+zDV3VUXaaDQKv9Rd8DQDvKo0Blbar7JXg3OjuR32tFl6/xYikWtgP
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Authority-Analysis: v=2.4 cv=VN3tWdPX c=1 sm=1 tr=0 ts=6a9fd509 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=F9PWhn0UeK7EsyOwsFYA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: ytCNyIGuMJB_kPytfgNVSy2odlzICUP3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA5OSBTYWx0ZWRfX0dYIoMYS6xMa
 NSPjlut3GX1lp8Zm0APFmh7PIrAzdSp9ogkY6jlyIDGPQ0m+G/G7JMIeuUEDoSWYn6rB3zonqfa
 sQbUD6RN/aQSJylfUqw8Z9hUpeTcYXA=
X-Proofpoint-GUID: ytCNyIGuMJB_kPytfgNVSy2odlzICUP3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA5OSBTYWx0ZWRfX4MkkNm/GHXec
 mg84XPN8WafbigWmfoAXp7cV9+8NIPUcVfgGF7vTp56AS+zn+gmQ6WMnRF2103JPGKBDVni9xo9
 NMw8xC54c/AHC/c/Av50kXy8rQ2EV+rtxjJsVpWQKyZn3Jy1AMHhkn8JQ1PwtCweYTkrp1VVSMx
 8KUXkifSLxJJN+jDVxN3UfceinvTQJI0C0SDcsgZJXS+wF72QwzrtwHTfbUOcA80KAovtWI/ar9
 cd/cGyvZW464dnBAb+6N/wtX+6BadCx9DPEjJH2mAKkZgsUXjrhF3SHAyrqY917SHuZH1FTXlfs
 wl3zffCuaNRkVBmgMpt3TqpKDTlK4vMa7blAH0R0MWMc/OJB5Lt511HtVAEZiksuzu+i6zz3GBX
 ClsVHoCT0on52oOIi5l9/60q4jcA9LK28pV3aJYX0orgL7RGvY+feJY1F/pEqCCaYaS/nfaASNm
 PhvmX0BkpwsLePQ1Ang==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080099

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

