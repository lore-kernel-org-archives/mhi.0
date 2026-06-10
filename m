Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53452DECA3
	for <mhi@lists.linux.dev>; Wed, 10 Jun 2026 05:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781070772; cv=none; b=oWW1xXbnijNtEPS7dTYarfPe1f4xayQ6gQ3IZwWtiFA/cd7LDJq7zbnS3cV7jDxy7O1OZpTpnMMHP/G+5T5VeU2djHpRaXskl1R1xlPxAaLCcngSrpnjFEQoiy+b81uUSqhCzfgMUjixM9apIWD21i9T3HnNC9G2WHj3GcGeLZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781070772; c=relaxed/simple;
	bh=QNVGduDx0nxQ0bQDSfenGVzWTDrg2845VWNRYOROTY8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pgREsGDazz9cVjPeo1PthKfSdZMmBsM1+Vc4OCXb3EhFvi+BtZShNVkfAZH+0uKBkWiLhC7EkvqkD2nKzJhjG9+ibJOlH6KfzmOWGVMUn0ZSdsIBszsT6JEG5mdp2nDj8iX+7ZzkWbNKdNfxKkGDZ8GtcUYIzPLrzvD5dq5rtwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iC36aIsW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bQhKPBeA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iC36aIsW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bQhKPBeA"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A2emFu241213
	for <mhi@lists.linux.dev>; Wed, 10 Jun 2026 05:52:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VpziLNpumf5VyVaf+LUv71Prv1GwddB0rwZE31HmFFc=; b=iC36aIsWwD8i0v8g
	GCRa6n+Ltt8RVo70nPWCVfagPJp1SUok7Y+K9GgSe6dO6wzvoGF9K69X9Mcj2SaE
	vapS9AdXVAoJ72iBY48cQWV7ZKsA2d7o9bvodQ5tlJe/YPvo75/JtmFdA3fg48BT
	7e5qYKQe8pjxfAi0YQ1dLcq23cs3XMre9e0JAjH2JW3XyPzzNvHfj304YpxbPQv2
	YAjM2bJgw5K+WBXZ3CbfGkUlYPZn91X948ZdBVzB7Xf666kodXU/IJuk1msOq+HI
	rJP2cTuko0tqEg6f0JBdERkUUvCduQByyu9Fx1oweUcHJUjM1WwPDaB7LufSryGb
	KlG1sQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epukeseuw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Wed, 10 Jun 2026 05:52:49 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36ba98cc003so4442346a91.1
        for <mhi@lists.linux.dev>; Tue, 09 Jun 2026 22:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781070769; x=1781675569; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VpziLNpumf5VyVaf+LUv71Prv1GwddB0rwZE31HmFFc=;
        b=bQhKPBeA/EYM4TbJDgOWVqJJVgeXb3RLgHEgWyIEFFwY6OmiHTQ7qkBDKiRncgyvz/
         K/zeSseCavzIHtVwAadNV0M3o7cdts8TS4/Dt0ThAvLN2Pq5R10+ErCcTEITPQdnj2pg
         3AsAp6jo1WEi9NeGMpsEixbh+fzVQtC1QkAWkyke3P4tROL7SI6Egfo5CstyoFpcTPUh
         7bVShZzxsITbPDH2SEFYfV8iFo1c0Iomxzy4eZeOIiUb0xwPLIsJypDZQ/Z5uPVGxGlC
         a1wrhuW8LU40tzo9X5ZMPCpcNOVzaCpqR/2yCXUoZC8GHFT2JFrN2k0bEo8IW2dGEjtC
         1u2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781070769; x=1781675569;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VpziLNpumf5VyVaf+LUv71Prv1GwddB0rwZE31HmFFc=;
        b=P0IOxJ3rhznJTw3ei4Nw+kHrDT1rrIOmKknESsxvCdD9UVssFV4t/rHnUyvRNqWaLT
         jljDfT/3EIUnc2ojmvIjr0vc67EtUpxQ7KYjyTeQLXDscv/DW9ml0dqPwv2e3gPsjKaZ
         DKNnmjKQAqEbgRBjVvVicHSOByPda8WmNHlQqV7IF7dBDbA30ht6vLzXrCtPC/vOXlJ7
         cC7YDe5PNgNvEPBL8mnY/Rodm8GgFQXQJI2TM7nCo1HkMGA5e1W2CJdKzIUqd45pMsQT
         1PYEM73WfXdLnh4JCAzPTKMiTLif0EVYh0pE4pwSTvU+8G83oOvILTd/JS/fCDbviIpP
         oU1Q==
X-Gm-Message-State: AOJu0Yx1O7nzDjBM2EPWmJrhBi4iFEt0vokJv8bWj+wwtOGxHu8iT3n0
	bguMdLx+dIB+1uoUZHADp5NBkOLt4283McLju0bbVjf1i+foluSMwft1PE72UdH0kLKidZ9BaFj
	ukAQLGed6OQ7InmCcAJcupb6iowqhZEu2iED8uFXGRJBBq8FZkAafj+s=
X-Gm-Gg: Acq92OG7+L3qtajafxtZpzuQTypscgLXnYfQAkPpEOI6OAY8Lw0GmGJZOObc/Cx/Pmq
	ps0wPX2hHEnnFDYLlRY+PA1cnQ9mBoNDbRIo2V2G1gjWH/T3IEMiglq6eU1fU4AHKXRfClqUZCb
	+kwhZEEXThQUoUTWFSH3Wri9bAlBcdNFIci1kWYuPedocVjO5AyrRVHDagjYnFDnD6/OKTwdeil
	s3NnONxWiKc2KOI++BcwK4k4iO0NpT3VmrNybzxOic3l2xVwH4ulzOfmJkdraz5+XwITVhNiaxi
	rJ17fNDo8QW/T+bM9GTsuq/y16De4qAY6PD048wt3hjKzccA+LIKgSM+7sBlBf1bCzmfYq5Y8OE
	oQP081V1/U++2KmWvWs2IrbA3J6MPEFT5uVuJenO4JPzSImRJ1Ff+0OFDrA==
X-Received: by 2002:a17:90b:54c3:b0:36a:d6dd:9fee with SMTP id 98e67ed59e1d1-37520dc57d2mr7068752a91.12.1781070768474;
        Tue, 09 Jun 2026 22:52:48 -0700 (PDT)
X-Received: by 2002:a17:90b:54c3:b0:36a:d6dd:9fee with SMTP id 98e67ed59e1d1-37520dc57d2mr7068713a91.12.1781070767801;
        Tue, 09 Jun 2026 22:52:47 -0700 (PDT)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c24edc8acasm108601105ad.45.2026.06.09.22.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 22:52:47 -0700 (PDT)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 11:22:25 +0530
Subject: [PATCH v3 1/3] bus: mhi: host: clients: Add loopback driver with
 sysfs interface
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-loopback_mhi-v3-1-a733c0cef61a@oss.qualcomm.com>
References: <20260610-loopback_mhi-v3-0-a733c0cef61a@oss.qualcomm.com>
In-Reply-To: <20260610-loopback_mhi-v3-0-a733c0cef61a@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sumit Kumar <sumit.kumar@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781070762; l=15221;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=QNVGduDx0nxQ0bQDSfenGVzWTDrg2845VWNRYOROTY8=;
 b=mdS3QPhtrDbai2LMCBAd7QP4hXjQ5XzeZeR4F1cMbpwa3vcrCqj1a/fPA6cdUbcNkQRtxw+OP
 LK/yrKbkC9WBLOeWVDFWrVAsgvP5A9/H3KyNpAiDu0dUDfuF3EVdbL1
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA1MiBTYWx0ZWRfX6Qtv7ldGvxbl
 KsrNh32hMpVeHVzG2MG5Uud2BMH/+UyWpxP7QYTLd5W5sBlAGDbO4BQXYVQK65MYK4nZp02+iMM
 arvWXTZ3Sv4QGxssDbCYtwGo5ZHi8vt52/+EGpreaXZk+8PkR+f2OXV6WWMhkJjeR16jsG77da8
 WkyjVRcF1JsXM+ViEorWHeIiur9BYNmettHctWKms1sG878BerciqRRn7iSiPBNDZyPNcefJm+0
 8rKAydQqhA51nd0NghNFoxj2hkqVRKCqZOywaqslTcCqi1DO8io7W+z0oG2hZw5+3XWYrpS8GvE
 4fj4MssnOlVwgyfw6k4pPT78HZtnnbsB9dWxj9jxBIPfnpT/s6XY8mhiZz/hmqPt5K9rckpL01E
 nJAsfxrn1/UD5QFpMpeqj9x5dpeb/hcDm0LZ+TVm1GEr74ny5iEh7kZy8RrlhVBLg1oWwbEiLl2
 tOrTQhxLaqVuz14zybg==
X-Proofpoint-ORIG-GUID: M1jzoUmsiu0CRHTBX0y0ATsTwXViFtP1
X-Proofpoint-GUID: M1jzoUmsiu0CRHTBX0y0ATsTwXViFtP1
X-Authority-Analysis: v=2.4 cv=DNG/JSNb c=1 sm=1 tr=0 ts=6a28fbb1 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=fr5qSj5IhElrMRFVs5kA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100052

The MHI specification defines a LOOPBACK channel. The endpoint firmware
echoes back whatever the host sends on this channel. Without a host-side
driver, there is no way to exercise this channel to validate MHI data path
integrity between host and endpoint.

Add a host-side loopback driver that binds to the LOOPBACK channel and
expose a sysfs interface for data path testing. The sysfs interface allows
users to configure TRE buffer size and count, trigger a loopback test, and
read the result.

Co-developed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-mhi-devices-loopback     |  51 ++++
 MAINTAINERS                                        |   1 +
 drivers/bus/mhi/host/Kconfig                       |   1 +
 drivers/bus/mhi/host/Makefile                      |   1 +
 drivers/bus/mhi/host/clients/Kconfig               |  17 ++
 drivers/bus/mhi/host/clients/Makefile              |   2 +
 drivers/bus/mhi/host/clients/loopback.c            | 316 +++++++++++++++++++++
 7 files changed, 389 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-mhi-devices-loopback b/Documentation/ABI/testing/sysfs-bus-mhi-devices-loopback
new file mode 100644
index 0000000000000000000000000000000000000000..3bd770747799a3341a23903cc1a108e650e915b8
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-mhi-devices-loopback
@@ -0,0 +1,51 @@
+What:		/sys/bus/mhi/devices/mhi<N>_LOOPBACK/tre_size
+Date:		April 2026
+KernelVersion:	7.1
+Contact:	mhi@lists.linux.dev
+Description:
+		(RW) Size of each Transfer Ring Element (TRE) buffer in bytes
+		used for the loopback test. Valid range is 1 to the value
+		reported by max_tre_size. Default value is 32 bytes.
+
+What:		/sys/bus/mhi/devices/mhi<N>_LOOPBACK/max_tre_size
+Date:		April 2026
+KernelVersion:	7.1
+Contact:	mhi@lists.linux.dev
+Description:
+		(RO) Maximum allowed TRE size in bytes. Reading this file
+		returns the upper bound for the tre_size attribute.
+
+What:		/sys/bus/mhi/devices/mhi<N>_LOOPBACK/num_tre
+Date:		April 2026
+KernelVersion:	7.1
+Contact:	mhi@lists.linux.dev
+Description:
+		(RW) Number of Transfer Ring Elements (TREs) to use per
+		loopback test. Must be greater than zero and must not exceed
+		the channel ring capacity. Default value is 1.
+
+What:		/sys/bus/mhi/devices/mhi<N>_LOOPBACK/start
+Date:		April 2026
+KernelVersion:	7.1
+Contact:	mhi@lists.linux.dev
+Description:
+		(WO) Write any value to trigger a loopback test. The driver
+		sends random data to the endpoint using the configured tre_size
+		and num_tre parameters, waits for the endpoint to echo it back,
+		and verifies the received data matches what was sent.
+
+		This is a blocking write that returns when the test completes
+		or times out after 5 seconds.
+
+What:		/sys/bus/mhi/devices/mhi<N>_LOOPBACK/status
+Date:		April 2026
+KernelVersion:	7.1
+Contact:	mhi@lists.linux.dev
+Description:
+		(RO) Result of the last loopback test. Returns one of:
+		  "pass"        - last test completed successfully
+		  "fail"        - last test failed
+		  "not started" - no test has been run yet
+
+		Reading this file while a test is in progress will block
+		until the test completes.
diff --git a/MAINTAINERS b/MAINTAINERS
index 6dcfbd11efef87927041f5cf58d70633dbb4b18d..ff12a6da48947ac853bc638359a7046fea85fc21 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16441,6 +16441,7 @@ L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git
 F:	Documentation/ABI/stable/sysfs-bus-mhi
+F:	Documentation/ABI/testing/sysfs-bus-mhi-devices-loopback
 F:	Documentation/mhi/
 F:	drivers/bus/mhi/
 F:	drivers/pci/endpoint/functions/pci-epf-mhi.c
diff --git a/drivers/bus/mhi/host/Kconfig b/drivers/bus/mhi/host/Kconfig
index da5cd0c9fc620ab595e742c422f1a22a2a84c7b9..627c57948235aa52348179ae8b2d0826ebaed01e 100644
--- a/drivers/bus/mhi/host/Kconfig
+++ b/drivers/bus/mhi/host/Kconfig
@@ -29,3 +29,4 @@ config MHI_BUS_PCI_GENERIC
 	  This driver provides MHI PCI controller driver for devices such as
 	  Qualcomm SDX55 based PCIe modems.
 
+source "drivers/bus/mhi/host/clients/Kconfig"
diff --git a/drivers/bus/mhi/host/Makefile b/drivers/bus/mhi/host/Makefile
index 859c2f38451c669b3d3014c374b2b957c99a1cfe..2a16008aeb38127494782bbff4e1656428d2b776 100644
--- a/drivers/bus/mhi/host/Makefile
+++ b/drivers/bus/mhi/host/Makefile
@@ -4,3 +4,4 @@ mhi-$(CONFIG_MHI_BUS_DEBUG) += debugfs.o
 
 obj-$(CONFIG_MHI_BUS_PCI_GENERIC) += mhi_pci_generic.o
 mhi_pci_generic-y += pci_generic.o
+obj-y += clients/
diff --git a/drivers/bus/mhi/host/clients/Kconfig b/drivers/bus/mhi/host/clients/Kconfig
new file mode 100644
index 0000000000000000000000000000000000000000..d1463c3e0df0da461c815afaec623ba349b51dda
--- /dev/null
+++ b/drivers/bus/mhi/host/clients/Kconfig
@@ -0,0 +1,17 @@
+# SPDX-License-Identifier: GPL-2.0
+
+config MHI_BUS_LOOPBACK
+	tristate "MHI LOOPBACK client driver"
+	depends on MHI_BUS
+	help
+	  MHI LOOPBACK client driver that binds to the MHI LOOPBACK channel
+	  as defined in the MHI specification. The LOOPBACK channel is
+	  implemented by MHI-based devices (modems, WLAN) in the field, where
+	  the endpoint firmware echoes back whatever the host sends.
+
+	  This driver exposes a sysfs interface for testing MHI data path
+	  integrity between host and endpoint. Users can configure the TRE
+	  size and count, trigger a loopback test, and read the result.
+
+	  To compile this driver as a module, choose M here. The module
+	  will be called mhi_loopback.
diff --git a/drivers/bus/mhi/host/clients/Makefile b/drivers/bus/mhi/host/clients/Makefile
new file mode 100644
index 0000000000000000000000000000000000000000..3811b6928f42b38f94b1167941cf3b0fe512d32b
--- /dev/null
+++ b/drivers/bus/mhi/host/clients/Makefile
@@ -0,0 +1,2 @@
+obj-$(CONFIG_MHI_BUS_LOOPBACK) += mhi_loopback.o
+mhi_loopback-y += loopback.o
diff --git a/drivers/bus/mhi/host/clients/loopback.c b/drivers/bus/mhi/host/clients/loopback.c
new file mode 100644
index 0000000000000000000000000000000000000000..3ae4d94dbc6b291006bb206ec40a634ae9561f5d
--- /dev/null
+++ b/drivers/bus/mhi/host/clients/loopback.c
@@ -0,0 +1,316 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/*
+ * The MHI LOOPBACK channel is defined in the MHI specification and is
+ * implemented by MHI-based devices (modems, WLAN) already deployed in the
+ * field. The endpoint firmware echoes back whatever the host sends on this
+ * channel. This driver binds to the LOOPBACK channel and exposes a sysfs
+ * interface for testing MHI data path integrity between host and endpoint.
+ * The sysfs interface is stable ABI because the wire protocol is fixed by
+ * the endpoint firmware and cannot be changed.
+ */
+
+#include <linux/atomic.h>
+#include <linux/completion.h>
+#include <linux/errno.h>
+#include <linux/mhi.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/random.h>
+#include <linux/sizes.h>
+#include <linux/string.h>
+#include <linux/sysfs.h>
+#include <linux/types.h>
+
+#define MHI_LOOPBACK_DEFAULT_TRE_SIZE	32
+#define MHI_LOOPBACK_DEFAULT_NUM_TRE	1
+#define MHI_LOOPBACK_TIMEOUT_MS		5000
+#define MHI_LOOPBACK_MAX_TRE_SIZE	SZ_64K
+
+struct mhi_loopback {
+	struct mhi_device *mdev;
+	struct mutex lb_mutex; /* serializes concurrent test operations */
+	struct completion comp;
+	atomic_t tres_pending; /* DL callbacks still outstanding */
+	const char *result;
+	u32 num_tre;
+	u32 tre_size;
+};
+
+static ssize_t tre_size_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
+{
+	struct mhi_loopback *loopback = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%u\n", loopback->tre_size);
+}
+
+static ssize_t tre_size_store(struct device *dev,
+			      struct device_attribute *attr,
+			      const char *buf, size_t count)
+{
+	struct mhi_loopback *loopback = dev_get_drvdata(dev);
+	u32 val;
+
+	if (kstrtou32(buf, 0, &val))
+		return -EINVAL;
+
+	if (val == 0 || val > MHI_LOOPBACK_MAX_TRE_SIZE)
+		return -EINVAL;
+
+	guard(mutex)(&loopback->lb_mutex);
+	loopback->tre_size = val;
+
+	return count;
+}
+static DEVICE_ATTR_RW(tre_size);
+
+static ssize_t max_tre_size_show(struct device *dev,
+				 struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%u\n", MHI_LOOPBACK_MAX_TRE_SIZE);
+}
+static DEVICE_ATTR_RO(max_tre_size);
+
+static ssize_t num_tre_show(struct device *dev,
+			    struct device_attribute *attr, char *buf)
+{
+	struct mhi_loopback *loopback = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%u\n", loopback->num_tre);
+}
+
+static ssize_t num_tre_store(struct device *dev,
+			     struct device_attribute *attr,
+			     const char *buf, size_t count)
+{
+	struct mhi_loopback *loopback = dev_get_drvdata(dev);
+	u32 val;
+	int el_num;
+
+	if (kstrtou32(buf, 0, &val))
+		return -EINVAL;
+
+	if (val == 0)
+		return -EINVAL;
+
+	guard(mutex)(&loopback->lb_mutex);
+
+	el_num = mhi_get_free_desc_count(loopback->mdev, DMA_TO_DEVICE);
+	if (val > el_num) {
+		dev_err(dev, "num_tre (%u) exceeds ring capacity (%d)\n", val, el_num);
+		return -EINVAL;
+	}
+
+	loopback->num_tre = val;
+
+	return count;
+}
+static DEVICE_ATTR_RW(num_tre);
+
+static ssize_t start_store(struct device *dev,
+			   struct device_attribute *attr,
+			   const char *buf, size_t count)
+{
+	struct mhi_loopback *loopback = dev_get_drvdata(dev);
+	void *send_buf = NULL, *recv_buf = NULL;
+	u32 total_size, tre_count, tre_size;
+	ssize_t ret;
+	int i;
+
+	guard(mutex)(&loopback->lb_mutex);
+
+	tre_size = loopback->tre_size;
+	tre_count = loopback->num_tre;
+	total_size = size_mul(tre_count, tre_size);
+
+	recv_buf = kzalloc(total_size, GFP_KERNEL);
+	if (!recv_buf)
+		return -ENOMEM;
+
+	send_buf = kzalloc(total_size, GFP_KERNEL);
+	if (!send_buf) {
+		ret = -ENOMEM;
+		goto free_buf;
+	}
+
+	ret = mhi_prepare_for_transfer(loopback->mdev);
+	if (ret) {
+		dev_err(dev, "failed to prepare for transfers: %zd\n", ret);
+		goto free_buf;
+	}
+
+	get_random_bytes(send_buf, total_size);
+
+	/* Arm completion before queuing recv TREs to avoid losing an early callback */
+	atomic_set(&loopback->tres_pending, tre_count);
+	reinit_completion(&loopback->comp);
+
+	for (i = 0; i < tre_count; i++) {
+		ret = mhi_queue_buf(loopback->mdev, DMA_FROM_DEVICE,
+				    recv_buf + (i * tre_size), tre_size, MHI_EOT);
+		if (ret) {
+			dev_err(dev, "Unable to queue read TRE %d: %zd\n", i, ret);
+			loopback->result = "fail";
+			if (atomic_sub_and_test(tre_count - i, &loopback->tres_pending))
+				complete(&loopback->comp);
+			goto out;
+		}
+	}
+
+	for (i = 0; i < tre_count - 1; i++) {
+		ret = mhi_queue_buf(loopback->mdev, DMA_TO_DEVICE,
+				    send_buf + (i * tre_size), tre_size, MHI_CHAIN);
+		if (ret) {
+			dev_err(dev, "Unable to queue send TRE %d: %zd\n", i, ret);
+			loopback->result = "fail";
+			goto out;
+		}
+	}
+
+	ret = mhi_queue_buf(loopback->mdev, DMA_TO_DEVICE,
+			    send_buf + (i * tre_size), tre_size, MHI_EOT);
+	if (ret) {
+		dev_err(dev, "Unable to queue final TRE: %zd\n", ret);
+		loopback->result = "fail";
+		goto out;
+	}
+
+	if (!wait_for_completion_timeout(&loopback->comp,
+					 msecs_to_jiffies(MHI_LOOPBACK_TIMEOUT_MS))) {
+		dev_err(dev, "Loopback test timed out\n");
+		loopback->result = "fail";
+		ret = -ETIMEDOUT;
+		goto out;
+	}
+
+	if (memcmp(send_buf, recv_buf, total_size)) {
+		dev_err(dev, "Loopback data mismatch\n");
+		loopback->result = "fail";
+		ret = -EIO;
+		goto out;
+	}
+
+	loopback->result = "pass";
+	ret = count;
+
+out:
+	mhi_unprepare_from_transfer(loopback->mdev);
+free_buf:
+	kfree(send_buf);
+	kfree(recv_buf);
+	return ret;
+}
+static DEVICE_ATTR_WO(start);
+
+static ssize_t status_show(struct device *dev,
+			   struct device_attribute *attr, char *buf)
+{
+	struct mhi_loopback *loopback = dev_get_drvdata(dev);
+
+	guard(mutex)(&loopback->lb_mutex);
+
+	return sysfs_emit(buf, "%s\n", loopback->result);
+}
+static DEVICE_ATTR_RO(status);
+
+static void mhi_loopback_dl_callback(struct mhi_device *mhi_dev,
+				     struct mhi_result *mhi_res)
+{
+	struct mhi_loopback *loopback = dev_get_drvdata(&mhi_dev->dev);
+
+	if (!loopback)
+		return;
+
+	if (mhi_res->transaction_status && mhi_res->transaction_status != -ENOTCONN)
+		dev_err(&mhi_dev->dev, "DL callback error: status %d\n",
+			mhi_res->transaction_status);
+
+	if (atomic_dec_and_test(&loopback->tres_pending))
+		complete(&loopback->comp);
+}
+
+static void mhi_loopback_ul_callback(struct mhi_device *mhi_dev,
+				     struct mhi_result *mhi_res)
+{
+}
+
+static struct attribute *mhi_loopback_attrs[] = {
+	&dev_attr_tre_size.attr,
+	&dev_attr_max_tre_size.attr,
+	&dev_attr_num_tre.attr,
+	&dev_attr_start.attr,
+	&dev_attr_status.attr,
+	NULL,
+};
+
+static const struct attribute_group mhi_loopback_group = {
+	.attrs = mhi_loopback_attrs,
+};
+
+static int mhi_loopback_probe(struct mhi_device *mhi_dev,
+			      const struct mhi_device_id *id)
+{
+	struct mhi_loopback *loopback;
+	int rc;
+
+	loopback = devm_kzalloc(&mhi_dev->dev, sizeof(*loopback), GFP_KERNEL);
+	if (!loopback)
+		return -ENOMEM;
+
+	loopback->mdev = mhi_dev;
+	loopback->tre_size = MHI_LOOPBACK_DEFAULT_TRE_SIZE;
+	loopback->num_tre = MHI_LOOPBACK_DEFAULT_NUM_TRE;
+	loopback->result = "not started";
+
+	mutex_init(&loopback->lb_mutex);
+	init_completion(&loopback->comp);
+
+	dev_set_drvdata(&mhi_dev->dev, loopback);
+
+	rc = devm_device_add_group(&mhi_dev->dev, &mhi_loopback_group);
+	if (rc)
+		dev_err(&mhi_dev->dev, "failed to create sysfs attributes\n");
+
+	return rc;
+}
+
+static void mhi_loopback_remove(struct mhi_device *mhi_dev)
+{
+	struct mhi_loopback *loopback = dev_get_drvdata(&mhi_dev->dev);
+
+	complete(&loopback->comp);
+
+	mutex_lock(&loopback->lb_mutex);
+	mutex_unlock(&loopback->lb_mutex);
+
+	dev_set_drvdata(&mhi_dev->dev, NULL);
+}
+
+static const struct mhi_device_id mhi_loopback_id_table[] = {
+	{ .chan = "LOOPBACK"},
+	{}
+};
+MODULE_DEVICE_TABLE(mhi, mhi_loopback_id_table);
+
+static struct mhi_driver mhi_loopback_driver = {
+	.probe = mhi_loopback_probe,
+	.remove = mhi_loopback_remove,
+	.dl_xfer_cb = mhi_loopback_dl_callback,
+	.ul_xfer_cb = mhi_loopback_ul_callback,
+	.id_table = mhi_loopback_id_table,
+	.driver = {
+		.name = "mhi_loopback",
+	},
+};
+
+module_mhi_driver(mhi_loopback_driver);
+
+MODULE_AUTHOR("Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>");
+MODULE_AUTHOR("Sumit Kumar <sumit.kumar@oss.qualcomm.com>");
+MODULE_DESCRIPTION("MHI Host Loopback Driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1

