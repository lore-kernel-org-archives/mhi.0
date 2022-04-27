Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B238D7EF
	for <mhi@lists.linux.dev>; Wed, 27 Apr 2022 07:29:30 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id a21so921287edb.1
        for <mhi@lists.linux.dev>; Wed, 27 Apr 2022 00:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UAlx2TBjO4zQdUcfk7qqadkkIfHQi8ARgELGZX9bCmw=;
        b=PEphi8sYJzvphwEoCiLlI9mGjWjjX9Cs66ONkH1ncMkLqi8AGIQyJbGwtqVy1s3XaG
         66H13C6gcheANfFBr2n7ztHTNI7RLhm+LC77zDf4U9ZuxDgVspi5X6F4jqHCKnBG9Dl5
         u9zzrZG0uyOh/OHY+LOe0pm73k2KyL206hm4fEWxGE+yUhKzsyBnN4y1ADePANAg2+ZO
         zCrNSqqY3JXu/cfcgiyuyHaku0XAK0gT8QXWtsjc23DZbP+FSUhXMEY96RQziKcLvJfd
         1qr4v7th9QzYBZ+3eVsgGFrKnJCfL8WngX6i6E01IE7iOIp1b2fhdn11EEee3FrGWTxg
         M9eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UAlx2TBjO4zQdUcfk7qqadkkIfHQi8ARgELGZX9bCmw=;
        b=RYfIuFaq9WZ59i5CQiOr1E98cgPhpI7FUbOjE2zUJ2T4O8ezoAcVxC7kaKRjt76KGi
         qUw8f3kfEOJjXz2WjJZulXSPoouYTYQ0pBbl8hhepHDcmqnbnnJdY/Md1kdmh0/MJ4xo
         r7cNeMx1V6AIDY2yDgoB4a5UF60j3KOcYwHaWOXVj4r8sA6u5ey7+XR/fUwyKipWrURW
         IbE24TlQgATzlvfLwyoAGjH4QNDLcD1evA7Ry5HeOQtqbsoUO1KA4RuK93wRZh7bA2Q5
         AHxnGqQSOo9WaLf4oSDDOPEzAGARtOdXlBUbgYUSHyQi7H9CYjrKIUaEAfLlYEZlzgwW
         f/8Q==
X-Gm-Message-State: AOAM532wO9nk3JUXzK4a01LYgV1UFR5S5Yi7rc4eu1FTjH3jcF3aXUbI
	NpZ8wTZsUWvK1j3eXsNwEDU=
X-Google-Smtp-Source: ABdhPJxtBTXJSQIimDntmvaIM/BgqDf9lsYm5rpzTR6BaZmo90nKmPqrUgEjNwkHfEId+CvHwTgyDg==
X-Received: by 2002:a05:6402:1d4b:b0:425:e0ad:7203 with SMTP id dz11-20020a0564021d4b00b00425e0ad7203mr16883708edb.367.1651044568757;
        Wed, 27 Apr 2022 00:29:28 -0700 (PDT)
Received: from ThinkStation-P340.. (static-82-85-31-68.clienti.tiscali.it. [82.85.31.68])
        by smtp.gmail.com with ESMTPSA id 10-20020a170906310a00b006e834953b55sm6235499ejx.27.2022.04.27.00.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 00:29:28 -0700 (PDT)
From: Daniele Palmas <dnlplm@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	Daniele Palmas <dnlplm@gmail.com>
Subject: [PATCH v2 1/1] bus: mhi: pci_generic: add Telit FN980 v1 hardware revision
Date: Wed, 27 Apr 2022 09:26:48 +0200
Message-Id: <20220427072648.17635-1-dnlplm@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Telit FN980 v1 hardware revision:

01:00.0 Unassigned class [ff00]: Qualcomm Device [17cb:0306]
        Subsystem: Device [1c5d:2000]

Signed-off-by: Daniele Palmas <dnlplm@gmail.com>
---
V2: rebased after mhi_pci_id_table reordering
---
 drivers/bus/mhi/host/pci_generic.c | 38 ++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 8858f3bf4f04..8e453b74e6cd 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -446,6 +446,41 @@ static const struct mhi_pci_dev_info mhi_sierra_em919x_info = {
 	.sideband_wake = false,
 };
 
+static const struct mhi_channel_config mhi_telit_fn980_hw_v1_channels[] = {
+	MHI_CHANNEL_CONFIG_UL(14, "QMI", 32, 0),
+	MHI_CHANNEL_CONFIG_DL(15, "QMI", 32, 0),
+	MHI_CHANNEL_CONFIG_UL(20, "IPCR", 16, 0),
+	MHI_CHANNEL_CONFIG_DL_AUTOQUEUE(21, "IPCR", 16, 0),
+	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0", 128, 1),
+	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0", 128, 2),
+};
+
+static struct mhi_event_config mhi_telit_fn980_hw_v1_events[] = {
+	MHI_EVENT_CONFIG_CTRL(0, 128),
+	MHI_EVENT_CONFIG_HW_DATA(1, 1024, 100),
+	MHI_EVENT_CONFIG_HW_DATA(2, 2048, 101)
+};
+
+static struct mhi_controller_config modem_telit_fn980_hw_v1_config = {
+	.max_channels = 128,
+	.timeout_ms = 20000,
+	.num_channels = ARRAY_SIZE(mhi_telit_fn980_hw_v1_channels),
+	.ch_cfg = mhi_telit_fn980_hw_v1_channels,
+	.num_events = ARRAY_SIZE(mhi_telit_fn980_hw_v1_events),
+	.event_cfg = mhi_telit_fn980_hw_v1_events,
+};
+
+static const struct mhi_pci_dev_info mhi_telit_fn980_hw_v1_info = {
+	.name = "telit-fn980-hwv1",
+	.fw = "qcom/sdx55m/sbl1.mbn",
+	.edl = "qcom/sdx55m/edl.mbn",
+	.config = &modem_telit_fn980_hw_v1_config,
+	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
+	.dma_data_width = 32,
+	.mru_default = 32768,
+	.sideband_wake = false,
+};
+
 /* Keep the list sorted based on the PID. New VID should be added as the last entry */
 static const struct pci_device_id mhi_pci_id_table[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0304),
@@ -453,6 +488,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
 	/* EM919x (sdx55), use the same vid:pid as qcom-sdx55m */
 	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0306, 0x18d7, 0x0200),
 		.driver_data = (kernel_ulong_t) &mhi_sierra_em919x_info },
+	/* Telit FN980 hardware revision v1 */
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0306, 0x1C5D, 0x2000),
+		.driver_data = (kernel_ulong_t) &mhi_telit_fn980_hw_v1_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0306),
 		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx55_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0308),
-- 
2.32.0

