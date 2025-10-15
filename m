Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026822010EE
	for <mhi@lists.linux.dev>; Wed, 15 Oct 2025 10:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760524539; cv=none; b=Zml9ch6Ao6oqd8+OgtgCMTBky2LE+PAwAOJ+IU6kPLCzFUswCUNLfq1uMX+Q3mJHS7gbZIdwhXwe6OOdxWZtbUiLnxQwXOMFUfimEJF5FRq3p+UlcPRZH6R1MCmmM+RlxhqiSLZoukJV/HcD1wt0gDjCJf22lfLXgbEBaYVPxvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760524539; c=relaxed/simple;
	bh=wrYtQbKMdePmpurgrmRwrJx3mIKCnYPozkCXHxbd1is=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DwXpPUYZCWX6R9vJkOvhnCyhHRYwUZB3+zp+9Nz/AjcS3EJua+bbcXoyiH/g3VuQUmKkCUgBoLnW/kfkOCpMQCb+QXib01XvI8DS7eeVIGvte7ledIYGZc2dSvnTTcRPMLBo5VTFv5py7sq1wrwdtOAN7zvoiFlrPD7glRuiQIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dljIpsSe; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dljIpsSe"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47103b6058fso3292895e9.1
        for <mhi@lists.linux.dev>; Wed, 15 Oct 2025 03:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760524536; x=1761129336; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Gu1nsBP84jDmwrrdXdGOmf9QTsYF1hFDTo/FbFzpjBE=;
        b=dljIpsSeV+9sU0ZWffMjiBJjj9d8IFQZl17ax6M3gsInYHDsh+waEghOf5/mh3VFNH
         z3xjviiwSaMhnVCv7TI8U2OnQ019HVzmd7a/kZ9qgOfCZtFqCK5sJ8pFHPimS8CTF2l3
         3jLG/WAteb5bxGdKwQMa020IRISWAUIgDiFnP+XA71TXiZifmUHCQElZTyptFIpqFrGw
         enDXXFCH076++lvbi15lfcGI/iU/12jToU7crRj1NI5ix+KTsjJeVVVLPYq5FZWEQ9sH
         6/rbTh+0MGqL9zjvRlUP/LR9PNDkIPWjpBMtz+NYKOo6sV7MYMcUJ02GzmkS5roNuSRt
         8ikQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760524536; x=1761129336;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gu1nsBP84jDmwrrdXdGOmf9QTsYF1hFDTo/FbFzpjBE=;
        b=wr5nSBe7lXwnIgN06BxeKq/m7a3uh8ZEqmNsc5sXY76dhyHHXDiVh8eSyHBL5mT4EF
         703MKKNQkrVbWekZJYGwvjg7ZCg0lCeuPx9d16/7+qMJS6xRqkqdJpZOF77y51ebb/W/
         INv/Lu6NQLHw2GdHI1WqxPe06/vAa1P1c0glVWciWzgKquO4VgTL975AcyLTVjp0+U0X
         kFYjdEfm1SRuc5dBJIlC8Aegm3uoreoxQHNd127KcEucIdPi3XQRxT1IrLbNvgYymzD1
         1vnrzGoEqvTd+XvboS7TfmrtaRvM8MeaF7txCO7U6Jq1gSQDHzrNQy0llyLbOhLXxSxE
         HuCw==
X-Gm-Message-State: AOJu0Yzr+PyF636P4lDs7HlJUgwBHVj9u+OsmdgdDrnVcye7xGOK4FR0
	GJb0lYCYojn46HVGoJF2OP78pqBO19BJSnE2fAUbN5SeHApjeh2MWgDm
X-Gm-Gg: ASbGncsxZYCpu6RJxVhwRlq1YnNPz8kriT7pUS13VMBVJIMfxs0s0EAkMeqkkDI/9Nr
	Q74s2mWbW+r0lApdqbs0DmiMHgh0RFV/06njQMvhsvWJV6MwNQFQB2i0WO9P12+h/HuTu2YEAZB
	oJgk3lLNO/UCVfR7l9USO0yRLnPiB8SIVIiGfgJPN7rBJfN/9HhIMxDOgenWMadWtkqT3Z1ehf0
	8nfbDhu+hiCk6CMsyHONsxWwRaNugh3JP6OSclsB+7Mfh476gDkqv9BR5KOuXfwkMkUgwTDT+08
	pXrJzoVak0rE7xjZv9CFF9AA8iu1mYNnCOEg5rtijHUTyIscCk1Z0bvoELse15/KYlzSj6Wxy8G
	TYJAOgx+n0MZaithL2sjk/n4HUxwpXXINBGTUBzH8BJw0sLsEwWtWGheXjaPqb71NfMXfvKwEcO
	osvBwaMD6sTerAbhL19EFiDdC98T8=
X-Google-Smtp-Source: AGHT+IGXXSxOEnx0micwjWYM8733husUPk8MH/ndkS4hv+5XE6L0m44UB2hxHV1pzm56wpUwxdpWpA==
X-Received: by 2002:a05:600c:6215:b0:471:846:80ac with SMTP id 5b1f17b1804b1-47108468140mr698725e9.18.1760524536016;
        Wed, 15 Oct 2025 03:35:36 -0700 (PDT)
Received: from ThinkStation-P340.tmt.telital.com (static-82-85-31-68.clienti.tiscali.it. [82.85.31.68])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5e13b6sm28580093f8f.44.2025.10.15.03.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 03:35:35 -0700 (PDT)
From: Daniele Palmas <dnlplm@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	Daniele Palmas <dnlplm@gmail.com>
Subject: [PATCH 1/1] bus: mhi: host: pci_generic: Add Telit FE990B40 modem support
Date: Wed, 15 Oct 2025 12:20:59 +0200
Message-Id: <20251015102059.1781001-1-dnlplm@gmail.com>
X-Mailer: git-send-email 2.37.1
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add SDX72 based modem Telit FE990B40, reusing FN920C04 configuration.

01:00.0 Unassigned class [ff00]: Qualcomm Device 0309
        Subsystem: Device 1c5d:2025

Signed-off-by: Daniele Palmas <dnlplm@gmail.com>
---
 drivers/bus/mhi/host/pci_generic.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index b188bbf7de04..3d8c9729fcfc 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -877,6 +877,16 @@ static const struct mhi_pci_dev_info mhi_telit_fn990b40_info = {
 	.edl_trigger = true,
 };
 
+static const struct mhi_pci_dev_info mhi_telit_fe990b40_info = {
+	.name = "telit-fe990b40",
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
@@ -933,6 +943,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
 	/* Telit FN990B40 (sdx72) */
 	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0309, 0x1c5d, 0x201a),
 		.driver_data = (kernel_ulong_t) &mhi_telit_fn990b40_info },
+	/* Telit FE990B40 (sdx72) */
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0309, 0x1c5d, 0x2025),
+		.driver_data = (kernel_ulong_t) &mhi_telit_fe990b40_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0309),
 		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx75_info },
 	/* QDU100, x100-DU */

base-commit: 54c67740fff7360b6607d02b8499d09b944b3fda
-- 
2.37.1

