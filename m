Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A190046C4AE
	for <mhi@lists.linux.dev>; Mon,  5 Oct 2026 10:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791196785; cv=none; b=l6FUqBvYLNGn/kFXOsZfI/+Uck2oJoAdu6YD347v7PmYqvM7j0d/YE54mPQUINTnr116dVtNK8i2Ro+62Zf1CZ3QotNtloza992tCB6lwjvQ5RpjA1eiMW6Ni7eugVNe5qYajt8IxU28gGeYmxQwgZ4Ra/xaqljlWtD+1K8dWnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791196785; c=relaxed/simple;
	bh=STfBNCDyyiejPUHLTMj04VQx34ZZn6+1CW9+lIIClDU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W/1ku0CMkmBNCmbUDjv/zwkebHziOBiHMEIicJ79DB2CggaRBRDIdbjSqVZ3KyMFNowFwgMDsmsYAhhkzeOqDJdCRcC/c8e3Dq66+YLsDcNVhOnKDNkOnC+WlkMpZl4/V4Surrp8r4u6PaWtc1ysC9T+ALDFZRWYsgL+WVt7G70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pUIhFZO5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K10vsCN8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pUIhFZO5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K10vsCN8"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6958xb2A873841
	for <mhi@lists.linux.dev>; Mon, 5 Oct 2026 10:39:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8VIJrV3/UxFATk91iMHPGYi3MRx/FWHyZy80zjzolh4=; b=pUIhFZO5kL5OeR+o
	AgWhVC1bfwKMCrQTJb2Sk5LtW2sTAP1Nx7VIcx+9J/xQmGXy+8eVQY1OpnmGiWjR
	hlrQbO8j8m9BVT7B7ap5idDz32cBt7eJi46Goq3s9nYSBsVbj++xZK8cMGUaGn6A
	9WvgF9kghxOFRe86wFfTe5sF/YKiEDWSKQHneo54SrKhmwqtSjpiZwmFxSyvIyFI
	0Mv4UAIqWpBm3JayAgDSHWtTM/eED/3rWypXpEkYSSRAFbZwADoa+gF22THzjqwe
	24dz/H4849eiA0dj09l210tZeIm1il0+a/Nq8mpdc+sIs8cBeURHDtjuUW9LoYuy
	zq1mRQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h41gn9ejv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 05 Oct 2026 10:39:42 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a0be20102fso1597367a91.0
        for <mhi@lists.linux.dev>; Mon, 05 Oct 2026 03:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791196782; x=1791801582; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8VIJrV3/UxFATk91iMHPGYi3MRx/FWHyZy80zjzolh4=;
        b=K10vsCN8wRjF5zdkoBnQT7ZMBkm3SocExZA+13qxY9/s4vOSGV44VvZ/8am8UTcBho
         /oY6TLa4FUxqoqUE/meSMuaVWP9UkYk70Oh9kBRcjrVMRp60akzNU/IPWAtph0dR5Ray
         3zNgMmLOFTBGq/36NRTQikqVSHzZnzG0fa1lLzhrURGaBJrOeJm6hqubAVIjaYrZzQtz
         5oD1EbH9kE2yFLvK62iy4/QO0z6jNHIJ6cYsHH1RsKhBOZcy85971Rimdnyk8eLM9IL5
         z+n11MBdZOT/6yXTyqjyfuwQdnm0ntZeggTs/X+VbIf1D096xTlTYe47JMCuWyKLwDRD
         Nq9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791196782; x=1791801582;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8VIJrV3/UxFATk91iMHPGYi3MRx/FWHyZy80zjzolh4=;
        b=GOhL0feOzAWKYBseu6FXxCZviSiwMjbMu68PYn/jgUsp2Uxf6tfSs3HThW0/fQnnup
         CJyA54JANKsyC6+fsi94aaWjdXCx2vABGK/l/1hzn+Ek6xrQdc6CYdgIiTgPKGbWDGx5
         cS35Mou4SXK7wBA3+u63CN5HPZnml3eheFOEOb7bwDIX5U6Txmd7a9H+RTz6gqbhfP/y
         leCb7Q+btDHiN9GAnFmteHQolx4cRz9s3Z2GyuIBvnmgE0r6GYxw8n+sPmmwamJWkBf1
         TmOU9BwQnl50wqMms8zXyyeKCHJFVNaI0TXb05krfOQ5LwrQSfrKTONEBrlymln/2qjM
         I3RA==
X-Gm-Message-State: AFq9FYIi+Wtr6HGpVd36EnL+KC4oDVGcTL2uwzbOLoGA22J2RSm4j5t8
	WGtQCfyNv8EBLIuUUqQAbqfvdsB0ooq8CliJ6m9A6oqGLYnpgiurtQ8Duh+lX/H9pKUusTPe4wQ
	8rOBL/Btq6XxjvOxRoU5V08XI2WxERhlMw7jg+n7qsJ/ruhhsyVMfgLM=
X-Gm-Gg: AYBFou0M2QABtuvyq5nphXhC8LIiuEWxLbnwD9UhJYVgRUbpD10oMNK/At7UgRKarFj
	VAFlQMmScDBNBBQZfIrzeiRzq+D/Ph+EyjOZsaMdyfYMqCw7sFb7OqUzSLE+yys96B1cL3XSA+U
	va9PZOFA8zF9jOLzOB+DBE0+mCL/1fyefL6bN76gvODpkhzsQKjpxEJLwSaH+EuH0pTDUegKrFr
	FaeUhddGTJjUYKU+x7CnVp7YHIZaTDqAZNPtW8/1W+jKjfDrg6VkG3KnjrEppeFee7nyyqYxSlJ
	75dIv7PNbV4L/CLG1/S71lhEcCZbf3sOb/CNWvsNW+FtJp7n2oSAoJdWs3gIgN2FveQIHWTROuZ
	Wku8fTefJZEjbyZfpuZXPM2rR
X-Received: by 2002:a17:90b:2d8d:b0:3a0:dcf1:afa7 with SMTP id 98e67ed59e1d1-3a7876339efmr5841885a91.57.1791196781692;
        Mon, 05 Oct 2026 03:39:41 -0700 (PDT)
X-Received: by 2002:a17:90b:2d8d:b0:3a0:dcf1:afa7 with SMTP id 98e67ed59e1d1-3a7876339efmr5841859a91.57.1791196781008;
        Mon, 05 Oct 2026 03:39:41 -0700 (PDT)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78e61386csm11223918a91.17.2026.10.05.03.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 03:39:40 -0700 (PDT)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 16:09:29 +0530
Subject: [PATCH v7 1/3] bus: mhi: host: clients: Add loopback driver with
 sysfs interface
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-lb-v7-1-36a268b6386f@oss.qualcomm.com>
References: <20261005-lb-v7-0-36a268b6386f@oss.qualcomm.com>
In-Reply-To: <20261005-lb-v7-0-36a268b6386f@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sumit Kumar <sumit.kumar@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791196775; l=15638;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=STfBNCDyyiejPUHLTMj04VQx34ZZn6+1CW9+lIIClDU=;
 b=953DRH6vLmTfN+ZUvOb+Cha4588RpRcAGG4yM4WU6Ei+Npw7Aa8QyJuzNCL8nklqE0OOhc7GI
 SFNt2fa1tJ0DgbU5Lw3zeS9B1giuGYoWmNaH8mbvYEGMMWkDUzvXGKL
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Proofpoint-ORIG-GUID: z0TsawvqCuZWgkdXnyZdNkO5iQFkt9xs
X-Proofpoint-GUID: z0TsawvqCuZWgkdXnyZdNkO5iQFkt9xs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0MSBTYWx0ZWRfX54o8VAJ/AmbX
 mDaui1A9IsX6kuz96lnuY1ySMzbk9RWr5KaS+5iLfJuBpabZZMuY3ERT63mpkDcOExwhVqBj5/0
 zBEEuaHvPW8UFcAfYz1l7HapvlIhM///iEfq6DjhlXIcvqT7wL5YEStUb3lRy8RK7bhKTmg9fim
 eCJbYv5S4bM5l8lD520fnGMifFqP0bmjAnE8JmwwOre/vi6NrXzl7CCgeR5hsgPB56wcYHJTMJ5
 qpA9HWtaag7ENeUmKLuj87FFDReggtBoEI27tZBQwsyd8fzCDYcNcpe6jaavPFXmNmM3vOzXqUP
 8scDS06vDmhJEVgfojunPKIa+cSrS7S2ws7n8Av8+RK+TDrC1iqgQbiksWQjfJqYPUzfSc37dbi
 l/DElCeW5q4ZqnlegRHdvs+gMzocyUJ4pcb7NaWshJcoP5+3v0JoQb/gvBMeTCFOb852rpSUTOn
 btVH+JOzPUnrPPV6K8Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0MSBTYWx0ZWRfX4nlVRUcOM1qf
 lY8eAKC+/tv2cdCRG6NZDVgFctqjfd8kwrh9LZJEtuP6VQLa2L5Q7Lfk5D++cJObtBywmYIlMeA
 G3NpEXLDY6o+ZipHuvm+w+7GM/R4hWY=
X-Authority-Analysis: v=2.4 cv=P9WvFSAu c=1 sm=1 tr=0 ts=6ac37e6e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=R8rHFXO4f44GsdJEDD8A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050041

The MHI specification defines a LOOPBACK channel. The endpoint firmware
echoes back whatever the host sends on this channel. Without a host-side
driver, there is no way to exercise this channel to validate MHI data path
integrity between host and endpoint.

Add a host-side loopback driver that binds to the LOOPBACK channel and
expose a sysfs interface for data path testing. The sysfs interface allows
users to configure TRE buffer size and count, trigger a loopback test, and
read the result.

The new sysfs ABI is documented under Documentation/ABI/testing/, not
stable/, since this is a new interface without established API
guarantees yet. It is unrelated to the existing stable MHI sysfs ABI
documented in Documentation/ABI/stable/sysfs-bus-mhi, despite both
being covered by the same MAINTAINERS entry.

Co-developed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-mhi-devices-loopback     |  49 ++++
 MAINTAINERS                                        |   1 +
 drivers/bus/mhi/host/Kconfig                       |   1 +
 drivers/bus/mhi/host/Makefile                      |   1 +
 drivers/bus/mhi/host/clients/Kconfig               |  17 ++
 drivers/bus/mhi/host/clients/Makefile              |   2 +
 drivers/bus/mhi/host/clients/loopback.c            | 312 +++++++++++++++++++++
 7 files changed, 383 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-mhi-devices-loopback b/Documentation/ABI/testing/sysfs-bus-mhi-devices-loopback
new file mode 100644
index 0000000000000000000000000000000000000000..5435e65ef05603d7a64e29f6af136d0a3f8760bd
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-mhi-devices-loopback
@@ -0,0 +1,49 @@
+What:		/sys/bus/mhi/devices/mhi<N>_LOOPBACK/tre_size
+Date:		August 2026
+KernelVersion:	7.4
+Contact:	mhi@lists.linux.dev
+Description:
+		(RW) Size of each Transfer Ring Element (TRE) buffer in bytes
+		used for the loopback test. Valid range is 1 to the value
+		reported by max_tre_size. Default value is 32 bytes.
+
+What:		/sys/bus/mhi/devices/mhi<N>_LOOPBACK/max_tre_size
+Date:		August 2026
+KernelVersion:	7.4
+Contact:	mhi@lists.linux.dev
+Description:
+		(RO) Maximum allowed Transfer Ring Element (TRE) size in bytes.
+		Reading this file returns the upper bound for the tre_size
+		attribute.
+
+What:		/sys/bus/mhi/devices/mhi<N>_LOOPBACK/num_tre
+Date:		August 2026
+KernelVersion:	7.4
+Contact:	mhi@lists.linux.dev
+Description:
+		(RW) Number of Transfer Ring Elements (TREs) to use per
+		loopback test. Must be greater than zero and must not exceed
+		the value reported by max_num_tre. Default value is 1.
+
+What:		/sys/bus/mhi/devices/mhi<N>_LOOPBACK/max_num_tre
+Date:		August 2026
+KernelVersion:	7.4
+Contact:	mhi@lists.linux.dev
+Description:
+		(RO) Maximum number of Transfer Ring Elements (TREs) currently
+		available on the channel ring. Reading this file returns the
+		upper bound for the num_tre attribute.
+
+What:		/sys/bus/mhi/devices/mhi<N>_LOOPBACK/start
+Date:		August 2026
+KernelVersion:	7.4
+Contact:	mhi@lists.linux.dev
+Description:
+		(WO) Write any value to trigger a loopback test. The driver
+		sends random data to the endpoint using the configured tre_size
+		and num_tre parameters, waits for the endpoint to echo it back,
+		and verifies the received data matches what was sent.
+
+		This is a blocking write that returns when the test completes
+		or times out after 5 seconds. The write returns an error code
+		if the test fails or times out.
diff --git a/MAINTAINERS b/MAINTAINERS
index 70663089f071c4eaa07fe7b9baf9003d8b981c07..b10f8cd592954e1450e5851045962bf05dcf1a50 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17628,6 +17628,7 @@ L:	linux-arm-msm@vger.kernel.org
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
index 0000000000000000000000000000000000000000..8bb5715e61d0d6e64a51012b4e1594ba46e5bfc1
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
+	  implemented by MHI-based devices (e.g. modems, WLAN) in the field,
+	  where the endpoint firmware echoes back whatever the host sends.
+
+	  This driver exposes a sysfs interface for testing MHI data path
+	  integrity between host and endpoint. Users can configure the TRE
+	  size and count, and trigger a loopback test.
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
index 0000000000000000000000000000000000000000..35312f025598651fc64e30ad29559c3c00b8174f
--- /dev/null
+++ b/drivers/bus/mhi/host/clients/loopback.c
@@ -0,0 +1,312 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/atomic.h>
+#include <linux/cleanup.h>
+#include <linux/completion.h>
+#include <linux/errno.h>
+#include <linux/mhi.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/random.h>
+#include <linux/sizes.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/sysfs.h>
+#include <linux/types.h>
+
+#define MHI_LOOPBACK_DEFAULT_TRE_SIZE	32
+#define MHI_LOOPBACK_DEFAULT_NUM_TRE	1
+#define MHI_LOOPBACK_TIMEOUT_MS		5000
+#define MHI_LOOPBACK_MAX_TRE_SIZE	(SZ_64K - 1)
+
+struct mhi_loopback {
+	struct mhi_device *mdev;
+	/* Serializes the sysfs attributes against a running test */
+	struct mutex lb_mutex;
+	struct completion comp;
+	/* Counts pending DL completions; comp fires when it hits zero */
+	atomic_t tre_pending;
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
+static int mhi_loopback_ring_capacity(struct mhi_loopback *loopback)
+{
+	return min(mhi_get_free_desc_count(loopback->mdev, DMA_TO_DEVICE),
+		   mhi_get_free_desc_count(loopback->mdev, DMA_FROM_DEVICE));
+}
+
+static ssize_t max_num_tre_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	struct mhi_loopback *loopback = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%d\n", mhi_loopback_ring_capacity(loopback));
+}
+static DEVICE_ATTR_RO(max_num_tre);
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
+	el_num = mhi_loopback_ring_capacity(loopback);
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
+static void mhi_loopback_reset_chan(struct mhi_loopback *loopback)
+{
+	struct device *dev = &loopback->mdev->dev;
+	int ret;
+
+	mhi_unprepare_from_transfer(loopback->mdev);
+	ret = mhi_prepare_for_transfer(loopback->mdev);
+	if (ret)
+		dev_err(dev, "Failed to re-prepare channel for transfers: %d\n", ret);
+}
+
+static ssize_t start_store(struct device *dev,
+			   struct device_attribute *attr,
+			   const char *buf, size_t count)
+{
+	struct mhi_loopback *loopback = dev_get_drvdata(dev);
+	u32 total_size, tre_count, tre_size;
+	int i, ret;
+
+	guard(mutex)(&loopback->lb_mutex);
+
+	tre_size = loopback->tre_size;
+	tre_count = loopback->num_tre;
+	total_size = size_mul(tre_count, tre_size);
+
+	if (total_size > KMALLOC_MAX_SIZE)
+		return -EINVAL;
+
+	if (tre_count > mhi_loopback_ring_capacity(loopback)) {
+		dev_err(dev, "Not enough ring space for %u TREs\n", tre_count);
+		return -ENOSPC;
+	}
+
+	void *recv_buf __free(kfree) = kzalloc(total_size, GFP_KERNEL);
+	if (!recv_buf)
+		return -ENOMEM;
+
+	void *send_buf __free(kfree) = kzalloc(total_size, GFP_KERNEL);
+	if (!send_buf)
+		return -ENOMEM;
+
+	get_random_bytes(send_buf, total_size);
+
+	atomic_set(&loopback->tre_pending, tre_count);
+	reinit_completion(&loopback->comp);
+
+	for (i = 0; i < tre_count; i++) {
+		ret = mhi_queue_buf(loopback->mdev, DMA_FROM_DEVICE,
+				    recv_buf + (i * tre_size), tre_size, MHI_EOT);
+		if (ret) {
+			dev_err(dev, "Unable to queue read TRE %d: %d\n", i, ret);
+			/*
+			 * TREs already queued for this iteration still point at
+			 * recv_buf, which is about to be freed. Reset the channel
+			 * to reclaim them before returning.
+			 */
+			mhi_loopback_reset_chan(loopback);
+			return ret;
+		}
+	}
+
+	for (i = 0; i < tre_count - 1; i++) {
+		ret = mhi_queue_buf(loopback->mdev, DMA_TO_DEVICE,
+				    send_buf + (i * tre_size), tre_size, MHI_CHAIN);
+		if (ret) {
+			dev_err(dev, "Unable to queue send TRE %d: %d\n", i, ret);
+			/* Reclaim the queued DL and UL TREs before recv_buf/send_buf are freed */
+			mhi_loopback_reset_chan(loopback);
+			return ret;
+		}
+	}
+
+	ret = mhi_queue_buf(loopback->mdev, DMA_TO_DEVICE,
+			    send_buf + (i * tre_size), tre_size, MHI_EOT);
+	if (ret) {
+		dev_err(dev, "Unable to queue final TRE: %d\n", ret);
+		/* Reclaim the queued DL and UL TREs before recv_buf/send_buf are freed */
+		mhi_loopback_reset_chan(loopback);
+		return ret;
+	}
+
+	if (!wait_for_completion_timeout(&loopback->comp,
+					 msecs_to_jiffies(MHI_LOOPBACK_TIMEOUT_MS))) {
+		dev_err(dev, "Loopback test timed out\n");
+		mhi_loopback_reset_chan(loopback);
+		return -ETIMEDOUT;
+	}
+
+	if (memcmp(send_buf, recv_buf, total_size)) {
+		dev_err(dev, "Loopback data mismatch\n");
+		return -EIO;
+	}
+
+	return count;
+}
+static DEVICE_ATTR_WO(start);
+
+static void mhi_loopback_dl_callback(struct mhi_device *mhi_dev,
+				     struct mhi_result *mhi_res)
+{
+	struct mhi_loopback *loopback = dev_get_drvdata(&mhi_dev->dev);
+
+	if (mhi_res->transaction_status && mhi_res->transaction_status != -ENOTCONN)
+		dev_err(&mhi_dev->dev, "DL callback error: status %d\n",
+			mhi_res->transaction_status);
+
+	if (atomic_dec_and_test(&loopback->tre_pending))
+		complete(&loopback->comp);
+}
+
+static void mhi_loopback_ul_callback(struct mhi_device *mhi_dev,
+				     struct mhi_result *mhi_res)
+{
+	if (mhi_res->transaction_status && mhi_res->transaction_status != -ENOTCONN)
+		dev_err(&mhi_dev->dev, "UL callback error: status %d\n",
+			mhi_res->transaction_status);
+}
+
+static struct attribute *mhi_loopback_attrs[] = {
+	&dev_attr_tre_size.attr,
+	&dev_attr_max_tre_size.attr,
+	&dev_attr_num_tre.attr,
+	&dev_attr_max_num_tre.attr,
+	&dev_attr_start.attr,
+	NULL
+};
+
+static const struct attribute_group mhi_loopback_group = {
+	.attrs = mhi_loopback_attrs,
+};
+
+static const struct attribute_group *mhi_loopback_groups[] = {
+	&mhi_loopback_group,
+	NULL,
+};
+
+static int mhi_loopback_probe(struct mhi_device *mhi_dev,
+			      const struct mhi_device_id *id)
+{
+	struct mhi_loopback *loopback;
+	int ret;
+
+	loopback = devm_kzalloc(&mhi_dev->dev, sizeof(*loopback), GFP_KERNEL);
+	if (!loopback)
+		return -ENOMEM;
+
+	loopback->mdev = mhi_dev;
+	loopback->tre_size = MHI_LOOPBACK_DEFAULT_TRE_SIZE;
+	loopback->num_tre = MHI_LOOPBACK_DEFAULT_NUM_TRE;
+
+	mutex_init(&loopback->lb_mutex);
+	init_completion(&loopback->comp);
+
+	dev_set_drvdata(&mhi_dev->dev, loopback);
+
+	ret = mhi_prepare_for_transfer(mhi_dev);
+	if (ret)
+		return dev_err_probe(&mhi_dev->dev, ret, "Failed to prepare for transfers\n");
+
+	return 0;
+}
+
+static void mhi_loopback_remove(struct mhi_device *mhi_dev)
+{
+	mhi_unprepare_from_transfer(mhi_dev);
+}
+
+static const struct mhi_device_id mhi_loopback_id_table[] = {
+	{ .chan = "LOOPBACK" },
+	{ }
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
+		.dev_groups = mhi_loopback_groups,
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

