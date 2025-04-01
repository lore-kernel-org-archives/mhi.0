Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BD11E5B8E
	for <mhi@lists.linux.dev>; Tue,  1 Apr 2025 09:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743500773; cv=none; b=M100BE8hiYZbN4EYnrB/a+0meU0Te6Y0bCqU464qxKXYV1rqUqcI+nyviodKvLQ4FLN/rA8qPbQEfrrQFXrtbnoyw74PhsZq+Pw+FdwLA+jOWaGdV9JNXJSBGnBgulXwtf98kPOWVW6nJtREotlXHEtSqC/mb9+PMRo4bHcB3N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743500773; c=relaxed/simple;
	bh=Tcp9HZvb/PCjmWGO0vLFRf9U5b3H4XvfILX8CiczJ7w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mCiS10q6kEEn94qqqT9Cy5cLKWu/3bsuVGOPVNnyO7uR4xvaJiVAIChUbuXJg1TKoQGO8ecFnZ1Y9jl1yqsCRxLKq3PK+epI6u4my6zQaQx7qdWWOuvj6cvkgwzb8bYanEvEYbKZXV8HRT0Ty5vZw7Jj3fI3qAZsBw0TEdLQhS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HB0x+xaQ; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HB0x+xaQ"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso3934587f8f.1
        for <mhi@lists.linux.dev>; Tue, 01 Apr 2025 02:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743500770; x=1744105570; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S7+YdZHx61WuTchvbidr6WBqABkO4VpBqCfmvieNgI8=;
        b=HB0x+xaQrsdZGzUzgpfkbYNYZ57Pp3Pt+2W/1ab87dNRvjEtpsXeVnRaFBQdRBSV0r
         b4C+JBEKrGR9s26XNNnUyFdXeDhx4ZBrZKXi2prUjcIMZJbY3/RQH46TIu239UXAj3iX
         a7LuwE0gMB4+NkrGZF2v5EbuXT05wvZjGyvz6M0I1KqdrQLI3JqiAFEA0vEB4/Iji18V
         DRFHndpobxfbQ/qeBa+TlQzXcvhmiZ5zuyYKKdI5E2Y2R4wcIx9O27Ar9IKwBT3ayZzy
         3NK4jJCFZu+xYSwY8v+INb+sAH1zsazd7wudEmownJub2PU+HKDyL1fla3ysGDWRpJT3
         nLCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743500770; x=1744105570;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S7+YdZHx61WuTchvbidr6WBqABkO4VpBqCfmvieNgI8=;
        b=cqDi9IrF6ngBuaG5RUe5wCIqYyu163f/37SaTw34GDkInhdRVnSdF59fhYz/R6HPII
         iFk75Z/bI8V9zrz8LGOMtvb5mAsEdirOHJ5dB6by7OCFz8Xd4xeRm/IeounZA18Fm9kF
         zPuLOQ703G6ZpcOcbKKFVnuUa4ZKExbFeJvVNm4Pq/TigJBOnSle6TZHtZm462UPU0o6
         KtqqV4527chybWRnMufDasBhGFvmr7+tn+dv3bjq5oih3G8FZK0+VfNjBXLnoHic6PwC
         c0NZSv7YD+HBsVGW6NgRVjKO1P3j3W+oKD1Z/OZEzFK7ixH3KXtisvMFmQmlkfJi/+Mr
         0QxA==
X-Gm-Message-State: AOJu0YwmL85f/I08FJJ3KuTWlQCxznrBTGryVvT6iRP+H+wCaqpCNJeb
	Xi2vrzwA728JwkUwjYoxA0UkjpjHjQ5qVI/1m3skUeku8nzUz0HRbWhjWw==
X-Gm-Gg: ASbGnctrHgTBoFR2Srsw8F56ew27Suv+gnnmehl343ob6RnEXsbEtrf4ujvKCs/tOyA
	AZdJzl/aXKjchvfXFGthiXurkACmgrGU1LwnIUuUM79A+XjeNrLmcXHoj44wbjE471fltr2+cJs
	j1BlNQ9oyKa60yDbDN4NaUxUOxm9rZBItevce/xiCklyWw2Co/rd1IZmfjpsX8ixrpmP59swW78
	de/FTeqfD+A5Fy2023nE7R+O7jKuk/RvWcz7woaOOkAk1QqK+xzc2rFCDeyjBO/sw7+4umCNJ+/
	3S5O365N8M7mPHWbzFRLhgmIYtu+ZNwwg7Ksqu6UDwl5q3cLiWMGAOSs6FnxxnlcaY8OdhWt+2s
	zsqFlqzUZ/lWe0IoiVKUdWZT19/he2UjeSDM+FQD1YQ==
X-Google-Smtp-Source: AGHT+IEfTiqdPr7CDdHg9a2sCxdofzFSZuIHFyBZIk15u9z3/nLhzGyPEhb5orbSu5hzrs5gh+i4aw==
X-Received: by 2002:a05:6000:40cb:b0:39c:1efb:f7c4 with SMTP id ffacd0b85a97d-39c1efbfcaemr4268918f8f.25.1743500769928;
        Tue, 01 Apr 2025 02:46:09 -0700 (PDT)
Received: from ThinkStation-P340.tmt.telital.com (static-82-85-31-68.clienti.tiscali.it. [82.85.31.68])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b79e0a3sm13788511f8f.71.2025.04.01.02.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 02:46:09 -0700 (PDT)
From: Daniele Palmas <dnlplm@gmail.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	Daniele Palmas <dnlplm@gmail.com>
Subject: [PATCH 1/1] bus: mhi: host: pci_generic: Add Telit FN920C04 modem support
Date: Tue,  1 Apr 2025 11:34:58 +0200
Message-Id: <20250401093458.2953872-1-dnlplm@gmail.com>
X-Mailer: git-send-email 2.37.1
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add SDX35 based modem Telit FN920C04.

$ lspci -vv
01:00.0 Unassigned class [ff00]: Qualcomm Device 011a
        Subsystem: Device 1c5d:2020

Signed-off-by: Daniele Palmas <dnlplm@gmail.com>
---
 drivers/bus/mhi/host/pci_generic.c | 39 ++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index efe43592e170..57e2360c397b 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -782,6 +782,42 @@ static const struct mhi_pci_dev_info mhi_telit_fe990a_info = {
 	.mru_default = 32768,
 };
 
+static const struct mhi_channel_config mhi_telit_fn920c04_channels[] = {
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
+	MHI_CHANNEL_CONFIG_UL(92, "DUN2", 32, 1),
+	MHI_CHANNEL_CONFIG_DL(93, "DUN2", 32, 1),
+	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0", 128, 2),
+	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0", 128, 3),
+};
+
+static const struct mhi_controller_config modem_telit_fn920c04_config = {
+	.max_channels = 128,
+	.timeout_ms = 50000,
+	.num_channels = ARRAY_SIZE(mhi_telit_fn920c04_channels),
+	.ch_cfg = mhi_telit_fn920c04_channels,
+	.num_events = ARRAY_SIZE(mhi_telit_fn990_events),
+	.event_cfg = mhi_telit_fn990_events,
+};
+
+static const struct mhi_pci_dev_info mhi_telit_fn920c04_info = {
+	.name = "telit-fn920c04",
+	.config = &modem_telit_fn920c04_config,
+	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
+	.dma_data_width = 32,
+	.sideband_wake = false,
+	.mru_default = 32768,
+	.edl_trigger = true,
+};
+
 static const struct mhi_pci_dev_info mhi_netprisma_lcur57_info = {
 	.name = "netprisma-lcur57",
 	.edl = "qcom/prog_firehose_sdx24.mbn",
@@ -806,6 +842,9 @@ static const struct mhi_pci_dev_info mhi_netprisma_fcun69_info = {
 static const struct pci_device_id mhi_pci_id_table[] = {
 	{PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0116),
 		.driver_data = (kernel_ulong_t) &mhi_qcom_sa8775p_info },
+	/* Telit FN920C04 (sdx35) */
+	{PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x011a, 0x1c5d, 0x2020),
+		.driver_data = (kernel_ulong_t) &mhi_telit_fn920c04_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0304),
 		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx24_info },
 	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0306, PCI_VENDOR_ID_QCOM, 0x010c),
-- 
2.37.1

