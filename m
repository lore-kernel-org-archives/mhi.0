Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C4F13A88A
	for <mhi@lists.linux.dev>; Wed, 26 Jun 2024 05:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719379978; cv=none; b=ZW5GqIq9YnhLHOAGpsR1WmDzE09Jcsj7KK9A8GKNyFi4+LN6t/lAZUVdIuS6sUeUT3oxiDVaC9OCYyzEaBvNkFmk2ST303pQwfYN/j6mGWh2Kp5VRrisFKSPKXUpF+fQeBqa31tIdRwpuDN5dINhQjuIdO//F6dvsFZI+pl+1rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719379978; c=relaxed/simple;
	bh=xCT7lVp98kCRZtyWYRxfixQfe2CIPTxNgxIBvGBDguI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RmEcWIxA7EOKntZr6WU053JOKVnSJzHDjZtm17qIy01/uneGhr476sUpvcSV3phQQxiNiV9ke4O+9gatSmyhkzYalhTF3hWLUHsE3qXQxEioyodF2BhNlOLrwZioY7NqhJx7MArTVjFYjXy/ckYJy+GGNxvCXi3hkUJh6HYKB4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ATVltWBy; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ATVltWBy"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1f9ffd24262so32710755ad.0
        for <mhi@lists.linux.dev>; Tue, 25 Jun 2024 22:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719379976; x=1719984776; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1S+AEoskXT5Wt8HN5vslZq0yRwGsMLc0XREaoIRCLVM=;
        b=ATVltWBy78J46qYG3AZf4AYk91sMwbrg7t0ueK9b8q90bUvfjxc6SOsZzAldyJunmD
         bi6mSQLNMvZEIycPsCrcc0cQ+omrNEVCVbKFUEa81gZ8vjtUba0jKBhTDHzpnhuYNSqA
         RcbSq9aFM98BimvvxJ8+sGM+s4D0MFwNBWqZFIWybi1xlwiyMep9Ek9F9aXUngaoKrR7
         E8WCtnT3teUrW+bxJsXfHUROQYitpMG/fzHsU/JJkZ5fzLDBzQb1i+6GtcO0lY77gZzg
         D9eDMWZylQzVGn4afkPo0TH+ikr/kT3aswsOsnEA+Zd+iD8aV+mggt8aeHizIQY0iu4z
         oFAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719379976; x=1719984776;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1S+AEoskXT5Wt8HN5vslZq0yRwGsMLc0XREaoIRCLVM=;
        b=PzQweQom5XluBWRSwyeO+Uw0Ci3AwprQlzTQHoC0qIAguGkX5n9V/0MDXvlBpc5ywB
         rETOjsx6cJpjecCPRMzGj9ByJ2GsLJOnpd0Sv2WHFQs6nfirXUwqRyAwn2efPeyXWW3R
         +BrwPsYfME0FyFKeWj+ri/aDo3tVMWOSem9H1olT02X2PUteH9lD2XoLpgpsS5bM/ES3
         jIonqWfyd0+gCD1eq2Ct2LpOnrxEHYD8N/Eds+tJsi4K6TkaAX1aBlEQaXRVt9fCH8LH
         5s5Q0y3NeGbTf3PG/JtHKqpi+8/4nuWGcGrDDWLtox0tIM9pDENEb9ktxKfJhDB+PHI5
         Rw7w==
X-Gm-Message-State: AOJu0Yy0/jE5QAc5wmmJrh4wJVKeuhXaRuPyA/VxZF9iSgILTRb54YB1
	MEbXtyOYgm4OTC0LNyRv3bIqT7BSuoOTyukKA3WDbNRwUqNz6nLurnFesgwgMUbLwmTNEsP/oOk
	=
X-Google-Smtp-Source: AGHT+IHO3kspsD4A/iShQUWYN2rXxiofepDsn0PW/d6X0ZHmL7FAhVYbvvthnUL6HyeynPdbr74pOg==
X-Received: by 2002:a17:902:bb10:b0:1f7:b24:c271 with SMTP id d9443c01a7336-1fa23f6750amr76532745ad.21.1719379976122;
        Tue, 25 Jun 2024 22:32:56 -0700 (PDT)
Received: from localhost.localdomain ([120.60.143.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fa95e9a456sm2876925ad.66.2024.06.25.22.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 22:32:55 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: mhi@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Slark Xiao <slark_xiao@163.com>
Subject: [PATCH v2] bus: mhi: host: pci_generic: Use unique 'mhi_pci_dev_info' for product families
Date: Wed, 26 Jun 2024 11:02:37 +0530
Message-Id: <20240626053237.4227-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, a single 'mhi_pci_dev_info' is shared across different product
families. Even though it makes the device functional, it misleads the users
by sharing the common product name.

For instance, below message will be printed for Foxconn SDX62 modem during
boot:

"MHI PCI device found: foxconn-sdx65"

But this is quite misleading to the users since the actual modem plugged in
could be 'T99W373' which is based on SDX62.

So fix this issue by using a unique 'mhi_pci_dev_info' for product
families. This allows us to specify a unique product name for each product
family. Also, once this name is exposed to client drivers, they may use
this name to identify the modems and use any modem specific configuration.

Modems of unknown product families are not impacted by this change.

CC: Slark Xiao <slark_xiao@163.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---

Changes in v2:

* Used 'mhi_foxconn_t99w175_info' for HP variant as well

 drivers/bus/mhi/host/pci_generic.c | 78 ++++++++++++++++++++++--------
 1 file changed, 59 insertions(+), 19 deletions(-)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 08844ee79654..35ae7cd0711f 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -419,8 +419,10 @@ static const struct mhi_controller_config modem_foxconn_sdx55_config = {
 	.event_cfg = mhi_foxconn_sdx55_events,
 };
 
-static const struct mhi_pci_dev_info mhi_foxconn_sdx24_info = {
-	.name = "foxconn-sdx24",
+static const struct mhi_pci_dev_info mhi_foxconn_sdx55_info = {
+	.name = "foxconn-sdx55",
+	.fw = "qcom/sdx55m/sbl1.mbn",
+	.edl = "qcom/sdx55m/edl.mbn",
 	.config = &modem_foxconn_sdx55_config,
 	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
 	.dma_data_width = 32,
@@ -428,8 +430,8 @@ static const struct mhi_pci_dev_info mhi_foxconn_sdx24_info = {
 	.sideband_wake = false,
 };
 
-static const struct mhi_pci_dev_info mhi_foxconn_sdx55_info = {
-	.name = "foxconn-sdx55",
+static const struct mhi_pci_dev_info mhi_foxconn_t99w175_info = {
+	.name = "foxconn-t99w175",
 	.fw = "qcom/sdx55m/sbl1.mbn",
 	.edl = "qcom/sdx55m/edl.mbn",
 	.config = &modem_foxconn_sdx55_config,
@@ -439,8 +441,46 @@ static const struct mhi_pci_dev_info mhi_foxconn_sdx55_info = {
 	.sideband_wake = false,
 };
 
-static const struct mhi_pci_dev_info mhi_foxconn_sdx65_info = {
-	.name = "foxconn-sdx65",
+static const struct mhi_pci_dev_info mhi_foxconn_dw5930e_info = {
+	.name = "foxconn-dw5930e",
+	.fw = "qcom/sdx55m/sbl1.mbn",
+	.edl = "qcom/sdx55m/edl.mbn",
+	.config = &modem_foxconn_sdx55_config,
+	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
+	.dma_data_width = 32,
+	.mru_default = 32768,
+	.sideband_wake = false,
+};
+
+static const struct mhi_pci_dev_info mhi_foxconn_t99w368_info = {
+	.name = "foxconn-t99w368",
+	.config = &modem_foxconn_sdx55_config,
+	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
+	.dma_data_width = 32,
+	.mru_default = 32768,
+	.sideband_wake = false,
+};
+
+static const struct mhi_pci_dev_info mhi_foxconn_t99w373_info = {
+	.name = "foxconn-t99w373",
+	.config = &modem_foxconn_sdx55_config,
+	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
+	.dma_data_width = 32,
+	.mru_default = 32768,
+	.sideband_wake = false,
+};
+
+static const struct mhi_pci_dev_info mhi_foxconn_t99w510_info = {
+	.name = "foxconn-t99w510",
+	.config = &modem_foxconn_sdx55_config,
+	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
+	.dma_data_width = 32,
+	.mru_default = 32768,
+	.sideband_wake = false,
+};
+
+static const struct mhi_pci_dev_info mhi_foxconn_dw5932e_info = {
+	.name = "foxconn-dw5932e",
 	.config = &modem_foxconn_sdx55_config,
 	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
 	.dma_data_width = 32,
@@ -646,40 +686,40 @@ static const struct pci_device_id mhi_pci_id_table[] = {
 		.driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
 	/* T99W175 (sdx55), Both for eSIM and Non-eSIM */
 	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0ab),
-		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
+		.driver_data = (kernel_ulong_t) &mhi_foxconn_t99w175_info },
 	/* DW5930e (sdx55), With eSIM, It's also T99W175 */
 	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0b0),
-		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
+		.driver_data = (kernel_ulong_t) &mhi_foxconn_dw5930e_info },
 	/* DW5930e (sdx55), Non-eSIM, It's also T99W175 */
 	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0b1),
-		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
+		.driver_data = (kernel_ulong_t) &mhi_foxconn_dw5930e_info },
 	/* T99W175 (sdx55), Based on Qualcomm new baseline */
 	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0bf),
-		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
+		.driver_data = (kernel_ulong_t) &mhi_foxconn_t99w175_info },
 	/* T99W175 (sdx55) */
 	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0c3),
-		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
+		.driver_data = (kernel_ulong_t) &mhi_foxconn_t99w175_info },
 	/* T99W368 (sdx65) */
 	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0d8),
-		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx65_info },
+		.driver_data = (kernel_ulong_t) &mhi_foxconn_t99w368_info },
 	/* T99W373 (sdx62) */
 	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0d9),
-		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx65_info },
+		.driver_data = (kernel_ulong_t) &mhi_foxconn_t99w373_info },
 	/* T99W510 (sdx24), variant 1 */
 	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0f0),
-		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx24_info },
+		.driver_data = (kernel_ulong_t) &mhi_foxconn_t99w510_info },
 	/* T99W510 (sdx24), variant 2 */
 	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0f1),
-		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx24_info },
+		.driver_data = (kernel_ulong_t) &mhi_foxconn_t99w510_info },
 	/* T99W510 (sdx24), variant 3 */
 	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0f2),
-		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx24_info },
+		.driver_data = (kernel_ulong_t) &mhi_foxconn_t99w510_info },
 	/* DW5932e-eSIM (sdx62), With eSIM */
 	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0f5),
-		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx65_info },
+		.driver_data = (kernel_ulong_t) &mhi_foxconn_dw5932e_info },
 	/* DW5932e (sdx62), Non-eSIM */
 	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0f9),
-		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx65_info },
+		.driver_data = (kernel_ulong_t) &mhi_foxconn_dw5932e_info },
 	/* MV31-W (Cinterion) */
 	{ PCI_DEVICE(PCI_VENDOR_ID_THALES, 0x00b3),
 		.driver_data = (kernel_ulong_t) &mhi_mv31_info },
@@ -694,7 +734,7 @@ static const struct pci_device_id mhi_pci_id_table[] = {
 		.driver_data = (kernel_ulong_t) &mhi_mv32_info },
 	/* T99W175 (sdx55), HP variant */
 	{ PCI_DEVICE(0x03f0, 0x0a6c),
-		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
+		.driver_data = (kernel_ulong_t) &mhi_foxconn_t99w175_info },
 	{  }
 };
 MODULE_DEVICE_TABLE(pci, mhi_pci_id_table);
-- 
2.25.1

