Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794906831;
	b=3/Z022zC0oh1lmJyQwihUnm4l1/mF2mC0VlgHC5VQt3tpb3dkCkW3jxexBn3CMMTCXuv
	 IwzKfHBKrLFiP42HA9BMuIinxR+Jr9GJfAZvrEMU+ZLEbHdXslXeQd7CL/fZ6bESrFmPy
	 6QcP6q+nrQtYhvQcnmfd2FICqAN5ZQYMaNnrAqZdmJX44cUkJgYP6cc9lI00ylZBJKxwh
	 4Zl2OhoTrfYZDNrCPbDGXfooB60waxBFfF4ICLePkHRP3cb4SQ/bu5QRqIJ2uVVorT3Wv
	 gS/axBzp8m/JwGYI7UK1dRRu5VLffKXeanaueRYVKCAsFuATb1nSrfzEsUkCPqD+2iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794906831;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=Q3V60X/cuBh42d34gBp1xIimrGQdT/S3EQ0ZytO9pbQ=;
	b=Gy/FmOprlpB1XTYxBh1EZxVEGLZBg+ciynYzgEeYVcHBvLCvvQJ4Q1VRw2Nbi5tZjbJr
	 dt4aLJn90sAyRGL4m0BjvxtPfGu9Vd5jjpRey2EAlZXit2aR3u3KyYUO2dH33dbzCXCDU
	 JOz03LdudW2g0rhhbqE2DqlMJzHUdSHvMKZi3c1ZG4muQF/NpGGKkYirTPMX+VEfRlXjN
	 IECPamwVUyKOLhJAqSsgMA90vQDBnwA7GaPTc8OAgEzA8OFdYSPMNahagysNDGLzMfTh5
	 rOtNPsmLBtlczEHEfU8W1+S13vvZAnXZs4416/vtuQa5WcVmIgVdLPM5VQF6Q3dfPag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Rh462Mdm;
	arc=none smtp.remote-ip=117.135.210.3
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91063606A31C
	for <mhi@lists.linux.dev>; Tue, 17 Nov 2026 09:13:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91063606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Rh462Mdm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Q3
	V60X/cuBh42d34gBp1xIimrGQdT/S3EQ0ZytO9pbQ=; b=Rh462MdmjIjzDc9rM+
	3m7+2B9aNJ1O9/LwJfybdvIZ7u5AUYKjLXIrNfOKfZLCefnssF+pMX3OKROHS1Zi
	aqp4Lw2X3iZn0AZ060DWT1e15sQ6+fI4fXmKC7qgxfZ+8cuOgmlrmw9kNYI8k8n6
	jp7rr//g2o4TLGwuc7Tn/7tLE=
Received: from GHT-5854251031.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wAX9iK1GvxqVX_fIA--.31468S3;
	Tue, 17 Nov 2026 17:13:28 +0800 (CST)
From: Wanquan Zhong <zwq2226404116@163.com>
To: mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org
Cc: Wanquan Zhong <zwq2226404116@163.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Sergey Ryazanov <ryazanov.s.a@gmail.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH v7 1/2] bus: mhi: pci_generic: add Rolling Wireless RW135R-GL and RW151 support
Date: Tue, 17 Nov 2026 17:13:23 +0800
Message-ID: <7a9617af129fac54b3a2575e39a006c57854142e.1794905977.git.zwq2226404116@163.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794905977.git.zwq2226404116@163.com>
References: <cover.1794905977.git.zwq2226404116@163.com>
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Post: <mailto:mhi@lists.linux.dev>
List-Help: <mailto:mhi+help@lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mhi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAX9iK1GvxqVX_fIA--.31468S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxtr45ZF43ZF47JF1UGFW3ZFb_yoWfZr47pF
	WfArZ5tr4ktw1rWFW8A34kKF9Yvan8WryUKrnrKw1Ig3WFya10vay8K347trWYvw4vqr1F
	gFnxCryxuFsrJrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRq9aPUUUUU=
X-CM-SenderInfo: h2ztjjaswuikqrrwqiywtou0bp/xtbC9BiO5Wr8GrhrRwAA3f

Add MHI PCIe device configuration for Rolling Wireless modules:

- RW135R-GL (Qualcomm sdx35): SAHARA, DIAG, MBIM, DUN, FIREHOSE, ADB,
  NMEA and IP_HW0
- RW151 (Qualcomm sdx75): MBIM-based config for most SKUs
- RW151 SP (2099:1502): QMI on channels 14/15 instead of MBIM

Register PCI_DEVICE_SUB entries per chipset:

- RW135R-GL on QCOM 0x011a (sdx35): sub-vendor 0x2099, sub-device
  0x1300/0x1301
- RW151 on QCOM 0x0309 (sdx75): sub-vendor 0x2099, sub-device
  0x1500/0x1501/0x1502; HP OEM sub-vendor 0x103c, sub-device
  0x8fb8/0x8fb4

Use Rolling-specific EDL firmware paths under qcom/sdx35/rolling/ and
qcom/sdx75/rolling/.

Tested suspend-to-RAM (mem) on Rolling RW135R-GL and RW151 hardware: MHI
resumes cleanly and MBIM/wwan function after wake. Hibernate (disk) could
not be tested on this platform (/sys/power/state lacks "disk", ENODEV).

Tested-on: Rolling RW135R-GL hardware (MHI probe, MBIM, DIAG, ADB,
suspend-to-RAM)
Tested-on: Rolling RW151 hardware (MHI probe, MBIM, DIAG, ADB,
suspend-to-RAM)

Signed-off-by: Wanquan Zhong <zwq2226404116@163.com>
---
Changes in v7:
- Standalone series on mhi-next (v6 not merged); includes full v6 content
- Add mhi_rolling_rw151_sp_* for 2099:1502 (QMI instead of MBIM)

Changes in v6:
- Full RW135R/RW151 channel config and PCI IDs; no_m3 dropped; MBIM ring 32

 drivers/bus/mhi/host/pci_generic.c | 152 +++++++++++++++++++++++++++++
 1 file changed, 152 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index b636e2c23b4d..ce9a1205c2e9 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -948,6 +948,137 @@ static const struct mhi_pci_dev_info mhi_netprisma_fcun69_info = {
 	.sideband_wake = true,
 };
 
+static const struct mhi_channel_config mhi_rolling_rw135r_channels[] = {
+	MHI_CHANNEL_CONFIG_UL_SBL(2, "SAHARA", 32, 0),
+	MHI_CHANNEL_CONFIG_DL_SBL(3, "SAHARA", 32, 0),
+	MHI_CHANNEL_CONFIG_UL(4, "DIAG", 64, 1),
+	MHI_CHANNEL_CONFIG_DL(5, "DIAG", 64, 1),
+	MHI_CHANNEL_CONFIG_UL(12, "MBIM", 32, 0),
+	MHI_CHANNEL_CONFIG_DL(13, "MBIM", 32, 0),
+	MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
+	MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
+	MHI_CHANNEL_CONFIG_UL_FP(34, "FIREHOSE", 32, 0),
+	MHI_CHANNEL_CONFIG_DL_FP(35, "FIREHOSE", 32, 0),
+	MHI_CHANNEL_CONFIG_UL(36, "ADB", 32, 0),
+	MHI_CHANNEL_CONFIG_DL(37, "ADB", 32, 0),
+	MHI_CHANNEL_CONFIG_UL(60, "NMEA", 32, 0),
+	MHI_CHANNEL_CONFIG_DL(61, "NMEA", 32, 0),
+	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0", 128, 2),
+	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0", 128, 3),
+};
+
+static struct mhi_event_config mhi_rolling_rw135r_events[] = {
+	MHI_EVENT_CONFIG_CTRL(0, 128),
+	MHI_EVENT_CONFIG_DATA(1, 128),
+	MHI_EVENT_CONFIG_HW_DATA(2, 1024, 100),
+	MHI_EVENT_CONFIG_HW_DATA(3, 2048, 101),
+};
+
+static const struct mhi_controller_config modem_rolling_rw135r_config = {
+	.max_channels = 128,
+	.timeout_ms = 8000,
+	.num_channels = ARRAY_SIZE(mhi_rolling_rw135r_channels),
+	.ch_cfg = mhi_rolling_rw135r_channels,
+	.num_events = ARRAY_SIZE(mhi_rolling_rw135r_events),
+	.event_cfg = mhi_rolling_rw135r_events,
+};
+
+static const struct mhi_pci_dev_info mhi_rolling_rw135r_info = {
+	.name = "rolling-rw135r",
+	.edl = "qcom/sdx35/rolling/prog_firehose_ddr.elf",
+	.config = &modem_rolling_rw135r_config,
+	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
+	.dma_data_width = 32,
+	.mru_default = 32768,
+	.sideband_wake = false,
+	.edl_trigger = true,
+};
+
+static const struct mhi_channel_config mhi_rolling_rw151_channels[] = {
+	MHI_CHANNEL_CONFIG_UL_SBL(2, "SAHARA", 32, 0),
+	MHI_CHANNEL_CONFIG_DL_SBL(3, "SAHARA", 32, 0),
+	MHI_CHANNEL_CONFIG_UL(4, "DIAG", 64, 1),
+	MHI_CHANNEL_CONFIG_DL(5, "DIAG", 64, 1),
+	MHI_CHANNEL_CONFIG_UL(12, "MBIM", 32, 0),
+	MHI_CHANNEL_CONFIG_DL(13, "MBIM", 32, 0),
+	MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
+	MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
+	MHI_CHANNEL_CONFIG_UL_FP(34, "FIREHOSE", 32, 0),
+	MHI_CHANNEL_CONFIG_DL_FP(35, "FIREHOSE", 32, 0),
+	MHI_CHANNEL_CONFIG_UL(36, "ADB", 32, 0),
+	MHI_CHANNEL_CONFIG_DL(37, "ADB", 32, 0),
+	MHI_CHANNEL_CONFIG_UL(60, "NMEA", 32, 0),
+	MHI_CHANNEL_CONFIG_DL(61, "NMEA", 32, 0),
+	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0", 128, 2),
+	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0", 128, 3),
+};
+
+static const struct mhi_channel_config mhi_rolling_rw151_sp_channels[] = {
+	MHI_CHANNEL_CONFIG_UL_SBL(2, "SAHARA", 32, 0),
+	MHI_CHANNEL_CONFIG_DL_SBL(3, "SAHARA", 32, 0),
+	MHI_CHANNEL_CONFIG_UL(4, "DIAG", 64, 1),
+	MHI_CHANNEL_CONFIG_DL(5, "DIAG", 64, 1),
+	MHI_CHANNEL_CONFIG_UL(14, "QMI", 32, 0),
+	MHI_CHANNEL_CONFIG_DL(15, "QMI", 32, 0),
+	MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
+	MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
+	MHI_CHANNEL_CONFIG_UL_FP(34, "FIREHOSE", 32, 0),
+	MHI_CHANNEL_CONFIG_DL_FP(35, "FIREHOSE", 32, 0),
+	MHI_CHANNEL_CONFIG_UL(36, "ADB", 32, 0),
+	MHI_CHANNEL_CONFIG_DL(37, "ADB", 32, 0),
+	MHI_CHANNEL_CONFIG_UL(60, "NMEA", 32, 0),
+	MHI_CHANNEL_CONFIG_DL(61, "NMEA", 32, 0),
+	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0", 128, 2),
+	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0", 128, 3),
+};
+
+static struct mhi_event_config mhi_rolling_rw151_events[] = {
+	MHI_EVENT_CONFIG_CTRL(0, 128),
+	MHI_EVENT_CONFIG_DATA(1, 128),
+	MHI_EVENT_CONFIG_HW_DATA(2, 1024, 100),
+	MHI_EVENT_CONFIG_HW_DATA(3, 2048, 101),
+};
+
+static const struct mhi_controller_config modem_rolling_rw151_config = {
+	.max_channels = 128,
+	.timeout_ms = 8000,
+	.num_channels = ARRAY_SIZE(mhi_rolling_rw151_channels),
+	.ch_cfg = mhi_rolling_rw151_channels,
+	.num_events = ARRAY_SIZE(mhi_rolling_rw151_events),
+	.event_cfg = mhi_rolling_rw151_events,
+};
+
+static const struct mhi_controller_config modem_rolling_rw151_sp_config = {
+	.max_channels = 128,
+	.timeout_ms = 8000,
+	.num_channels = ARRAY_SIZE(mhi_rolling_rw151_sp_channels),
+	.ch_cfg = mhi_rolling_rw151_sp_channels,
+	.num_events = ARRAY_SIZE(mhi_rolling_rw151_events),
+	.event_cfg = mhi_rolling_rw151_events,
+};
+
+static const struct mhi_pci_dev_info mhi_rolling_rw151_info = {
+	.name = "rolling-rw151",
+	.edl = "qcom/sdx75/rolling/prog_firehose_lite.elf",
+	.config = &modem_rolling_rw151_config,
+	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
+	.dma_data_width = 32,
+	.mru_default = 32768,
+	.sideband_wake = false,
+	.edl_trigger = true,
+};
+
+static const struct mhi_pci_dev_info mhi_rolling_rw151_sp_info = {
+	.name = "rolling-rw151",
+	.edl = "qcom/sdx75/rolling/prog_firehose_lite.elf",
+	.config = &modem_rolling_rw151_sp_config,
+	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
+	.dma_data_width = 32,
+	.mru_default = 32768,
+	.sideband_wake = false,
+	.edl_trigger = true,
+};
+
 /* Keep the list sorted based on the PID. New VID should be added as the last entry */
 static const struct pci_device_id mhi_pci_id_table[] = {
 	{PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0116),
@@ -961,6 +1092,12 @@ static const struct pci_device_id mhi_pci_id_table[] = {
 	/* Telit FE912C04 (sdx35) */
 	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x011a, 0x1c5d, 0x2045),
 		.driver_data = (kernel_ulong_t) &mhi_telit_fe912c04_info },
+	/* Rolling RW135R-GL (sdx35) */
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x011a, 0x2099, 0x1300),
+		.driver_data = (kernel_ulong_t) &mhi_rolling_rw135r_info },
+	/* Rolling RW135R-GL (sdx35) */
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x011a, 0x2099, 0x1301),
+		.driver_data = (kernel_ulong_t) &mhi_rolling_rw135r_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x011a),
 		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx35_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0304),
@@ -995,6 +1132,21 @@ static const struct pci_device_id mhi_pci_id_table[] = {
 	/* Telit FE990B40 (sdx72) */
 	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0309, 0x1c5d, 0x2025),
 		.driver_data = (kernel_ulong_t) &mhi_telit_fe990b40_info },
+	/* Rolling RW151 (sdx75) */
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0309, 0x2099, 0x1500),
+		.driver_data = (kernel_ulong_t) &mhi_rolling_rw151_info },
+	/* Rolling RW151 (sdx75) */
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0309, 0x2099, 0x1501),
+		.driver_data = (kernel_ulong_t) &mhi_rolling_rw151_info },
+	/* Rolling RW151 (sdx75) */
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0309, 0x2099, 0x1502),
+		.driver_data = (kernel_ulong_t) &mhi_rolling_rw151_sp_info },
+	/* Rolling RW151 (sdx75) */
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0309, 0x103c, 0x8fb8),
+		.driver_data = (kernel_ulong_t) &mhi_rolling_rw151_info },
+	/* Rolling RW151 (sdx75) */
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0309, 0x103c, 0x8fb4),
+		.driver_data = (kernel_ulong_t) &mhi_rolling_rw151_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0309),
 		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx75_info },
 	/* QDU100, x100-DU */
-- 
2.53.0

