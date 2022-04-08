Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740B963E
	for <mhi@lists.linux.dev>; Fri,  8 Apr 2022 14:01:38 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id qh7so17482507ejb.11
        for <mhi@lists.linux.dev>; Fri, 08 Apr 2022 07:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XleLYxPj8RqaxqCHhK/axch93UQBu/FbHCjjLsjUXjA=;
        b=qNvDkVqdFLQvTmsmdp6cxlL5q6Xw3jKmCGQxqr2gwMdvx43Ij+98yGe0lwKOKwYB4b
         /z+55WIq2FF4NHsqw9tAOl//EevQr0bim8KXGyG75QrF/AsjTg92mypNfGHrTNb1PHXa
         ZyTSoUf82Y9zyVItYou4HdY2BClgCWZ+WaSUHIqya2QrvtMq/9Vhy6LbpCw3LefQMEqi
         GZU38VAVovAXkiEFH294KSf+Zdk7vHbI491Z8nzf1bTsRf5z+7slUqxh6lxVGhP6l/D4
         Rp90J7nqH7KaDjuno/R9c45BnIASUyMnS9qmlDpvuqiAIRY8oqMIlR3aKCfGGVKJeba1
         swyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XleLYxPj8RqaxqCHhK/axch93UQBu/FbHCjjLsjUXjA=;
        b=07YIMm1nx9qm86HgxsgUkBGTy/f+pjz+d1toTAd71iLQ2Xdj3AGbExn8ESDxuL6Hi1
         dwsn4YMSxFJLzQLO+ow8t1Ux6nFP+l+ZnYFn9eyuTdvtpW/70Grdc7sgPGAkUNlwlVB+
         naoIVdkw1j+TDDWGwUkrEXn1Qab0zyIQX4xDhflBO1BWiGwTnMksuyX0PHFsjmSnajVD
         iFg664f8ZyRFT+eDzKJPPvfNEpU1QXfy8YbCY2/fWeygFzGy3K0Q1ljtOPP4/9+fofXn
         40CwRoBIfT8yCIQTJyW+SN9HGoaY2J4xwMicEOP7y166WRtVJN2JDK/My12S2e3QqarD
         L08g==
X-Gm-Message-State: AOAM533aKza7fn7Ub763PB/7fY+2dBKCyus4Fzuu/1iEyoX6qfqnGtB1
	kvaZDxj+p0gAlNiw70mCHA90wEoUINk=
X-Google-Smtp-Source: ABdhPJwoxV4xVc6PkTwCC1t2MQUq7TowgfnGgoat6kksN9r8UA9IN8sBLbSeMxcLw2s9Go/qf/xdlg==
X-Received: by 2002:a17:906:974e:b0:6bb:4f90:a6ae with SMTP id o14-20020a170906974e00b006bb4f90a6aemr19153584ejy.452.1649426496486;
        Fri, 08 Apr 2022 07:01:36 -0700 (PDT)
Received: from ThinkStation-P340.. (static-82-85-31-68.clienti.tiscali.it. [82.85.31.68])
        by smtp.gmail.com with ESMTPSA id k11-20020a50cb8b000000b0041d20d0bae7sm1046228edi.41.2022.04.08.07.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Apr 2022 07:01:35 -0700 (PDT)
From: Daniele Palmas <dnlplm@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	mhi@lists.linux.dev,
	Daniele Palmas <dnlplm@gmail.com>
Subject: [PATCH 1/1] bus: mhi: pci_generic: add Telit FN980 v1 hardware revision
Date: Fri,  8 Apr 2022 15:59:24 +0200
Message-Id: <20220408135924.3038485-1-dnlplm@gmail.com>
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
 drivers/bus/mhi/host/pci_generic.c | 38 ++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 9527b7d63840..5e786f4a3bdf 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -446,7 +446,45 @@ static const struct mhi_pci_dev_info mhi_sierra_em919x_info = {
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
 static const struct pci_device_id mhi_pci_id_table[] = {
+	/* Telit FN980 hardware revision v1 */
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0306, 0x1C5D, 0x2000),
+		.driver_data = (kernel_ulong_t) &mhi_telit_fn980_hw_v1_info },
 	/* EM919x (sdx55), use the same vid:pid as qcom-sdx55m */
 	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0306, 0x18d7, 0x0200),
 		.driver_data = (kernel_ulong_t) &mhi_sierra_em919x_info },
-- 
2.32.0

