Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535703A9DB2
	for <mhi@lists.linux.dev>; Mon, 23 Mar 2026 12:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774270074; cv=none; b=sSyQH5BnRe0UzNX5DeIEilDGu0wRr+i7k4NDs9hCB5yx5VS3YsjnM99XyoiYkycFP0sMT/0kvXQ4wDQuRFGmZb/Jt0QPsya7Uw64aZuWjZKUbM3sQ0QOO2dao/qviPAoxyMMxVpWbJ/KDC+EAKpma+M3FY1zsFnJaUKnV5U+e70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774270074; c=relaxed/simple;
	bh=kwPIZbAhSt9tPjm+XLgH9wG/LUFAeuGiPKIiLe/hoiY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bvkIk/4DAkjzNevU1h/IqbVj28aYaXRDRn7g4brnp3Axidr8rzOj4DzhkxSMohrjkd+Y0Avih3/bLAlK58wPkh/t01GdmxpKlucQnidlwRdJuJgmEahM/tuVLwnhBRZO/HwOGCxh37K8N0Ndk9XX9b6zOCSPmK/vtsrQVO20+aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GqJcXNd0; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GqJcXNd0"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4853e1ce427so29000105e9.3
        for <mhi@lists.linux.dev>; Mon, 23 Mar 2026 05:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774270070; x=1774874870; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p7mf4ZvvRjCHnVoYzPX8lyAdXXnyrNgsXi8PVr3ZaFQ=;
        b=GqJcXNd0M+4XMdABxpQA2NVpGoSS7sUeK7n8IqiFMhpK1Nvik2L88eGW7pTKGsQShL
         2qIJwobqp8ydpdqg1JhUqN7FziR+LNev/jOj5Bzn7AzoQbIasDUBURk4oz46uBBQItnC
         7vA6KTaoywCGyicLnUdTaOXKFxi7A6tYBttW30NhzFLn95oiLiXmevqlq99sdFb8CFcx
         k5kmIbEXxKbIWjV8k7Om6+zInIB22J5di1jeTk2b/GksS2BQnJCwd0sEc14h+rU1wGjm
         HSwbxs8z7ghFzbxhJgT3zNckYfezSzHcdlhzB9z0a4CyT07fYhQSoeyh2DNxc5JxLOKi
         Uw0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774270070; x=1774874870;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p7mf4ZvvRjCHnVoYzPX8lyAdXXnyrNgsXi8PVr3ZaFQ=;
        b=bABM6R+A+SMH1LyF28+d8A4haXdRNAzx68mDhn1qe56rKYmjg3DZvyfYDeHy74C1vy
         LIQVPCXR/HXLgXVP7vWrMCzriTqXTKvACIPaZFPcQV4vGnymKDEm7AlpZnQqO2v+ulKF
         MEEMmRtctAsiEkY0HeVnBj9LkYf8Pww+bb/5IUSbL0JSEfbBF1ZFw3TbFRTrl9oul4QO
         ZjaSOooUx9RTcAGOW38xnaWD4/bjeSBGzZDnSnUKEpwzbY8cZVrPd38Vhph1VJONtBvn
         6mPhACt5K0py93+mQXunWe+1+8OLAaQvlCdmcnbbNdfSQb9olZMLvVvlbNiqsknm8Fod
         54hA==
X-Gm-Message-State: AOJu0YzVxoAGQEp+7mwwxiNDHrcm9EdxT3+HCQQxtb0/e9lcRtc+tDsM
	RWlqKaBnv1UYvtpv1T99QHaiD3qbYH0GKyLp5tTibvGqQGKg5yZjWD+a
X-Gm-Gg: ATEYQzx13wrQhPK92kOV9jXvSjMmuEVh+0CTxje0S84GSDZUt8+tAJkiHGKIE3mfCN6
	sGxvZcxTvnmsteoqgh9yYl6THSFsyHDACe5aWRqS/aL18sb7jHs6W5kqFnkUIANEONeC4wlGxxj
	2Y7nDwapKB9Th0NRg/uN5fkSj4klHD+ZqjJJ3oukmyf+5MzqNnugNIAxUt+4RvJ9pZiwqpX5BGJ
	avepvp1Ab0+L3uyNkhE2LMTeK36xF9RFhCWwSssYs98TS7bbS16JUMmYN4PkqAaqs7BJnkKUviR
	CcGjYATl8739pq0/iUfntFNxnZQcwVwPRyh0NX0Po7rQa0AuV9c6NGdzRMkFWjOsv/JqBJ+kBul
	urg4PVLPMCUxSudPbfFCczEVhkH0K2nn5SByfe+u5xRhlkUQSD6+syyNF2h4Ac6FnOmfY7p3OFM
	9hV/vM3NedwJXtvXnaOocU4D+oi0hxuHSjos5G3nPVpbArRJlsfvehG9ZfjMe3A1seU7vbgZQ87
	VQAL2vJHYsckop8ljSYabM=
X-Received: by 2002:a05:600c:8710:b0:485:7f02:afd5 with SMTP id 5b1f17b1804b1-486fee01a9cmr165094995e9.13.1774270070262;
        Mon, 23 Mar 2026 05:47:50 -0700 (PDT)
Received: from ThinkStation-P340.tmt.telital.com (static-82-85-31-68.clienti.tiscali.it. [82.85.31.68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486ff19d370sm86475785e9.14.2026.03.23.05.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 05:47:49 -0700 (PDT)
From: Daniele Palmas <dnlplm@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	Daniele Palmas <dnlplm@gmail.com>
Subject: [PATCH 1/1] bus: mhi: host: pci_generic: Add Telit FE912C04 modem support
Date: Mon, 23 Mar 2026 13:28:37 +0100
Message-Id: <20260323122837.3406521-1-dnlplm@gmail.com>
X-Mailer: git-send-email 2.37.1
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add SDX35 based modem Telit FE912C04, reusing FN920C04 configuration.

01:00.0 Unassigned class [ff00]: Qualcomm Device 011a
        Subsystem: Device 1c5d:2045

Signed-off-by: Daniele Palmas <dnlplm@gmail.com>
---
 drivers/bus/mhi/host/pci_generic.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 391ab146f501..750da3dbb4c6 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -904,6 +904,16 @@ static const struct mhi_pci_dev_info mhi_telit_fe990b40_info = {
 	.edl_trigger = true,
 };
 
+static const struct mhi_pci_dev_info mhi_telit_fe912c04_info = {
+	.name = "telit-fe912c04",
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
@@ -931,6 +941,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
 	/* Telit FN920C04 (sdx35) */
 	{PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x011a, 0x1c5d, 0x2020),
 		.driver_data = (kernel_ulong_t) &mhi_telit_fn920c04_info },
+	/* Telit FE912C04 (sdx35) */
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x011a, 0x1c5d, 0x2045),
+		.driver_data = (kernel_ulong_t) &mhi_telit_fe912c04_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x011a),
 		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx35_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0304),
-- 
2.37.1

