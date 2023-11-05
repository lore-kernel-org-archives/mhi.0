Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190A9C8E3
	for <mhi@lists.linux.dev>; Sun,  5 Nov 2023 15:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E4QyPr6P"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7788ebea620so235438885a.3
        for <mhi@lists.linux.dev>; Sun, 05 Nov 2023 07:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699196686; x=1699801486; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fEG9kPj5CJD+rtid4fYcQp2weHAsG/Xfik4WDUkS/OA=;
        b=E4QyPr6Pp8hNmT1qWpaJ9EdfHkWme/ZiDeRRCqshvz6hl7Rl/96aqcpjIbex347OE/
         e9AYjInofSAhRDjAgK8OV5Rw9aP0lDLrQAGXTluH3lZFfN6hlQK53V+WnSSvEn3CibWK
         3ulvFufFi8E61h5TM6B5UAxUy6F8yc6nVYWm5GUJ+Ku/lxoZUouZ/ZL2gjSe8b0uBSJj
         w5ec6vaG715vqA/BmyfdgwEvFzMMeWYeEg69NFqvhosfS0zqhwUIL5tNBMf0xEunoVSt
         ThGhKWInojj1AZRE4cENDrOD45DFup6DwN8geuB+875hkpqg73KqHiEH0+jLPfyXtYF+
         KDlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699196686; x=1699801486;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fEG9kPj5CJD+rtid4fYcQp2weHAsG/Xfik4WDUkS/OA=;
        b=prHk7R28a+tTwncwqYGIBkBGWcYvcUZXt7XPBhgTivihaNtaV8LYpH11EnuT+pbEG6
         QlgzEa/MbIQm2agmw2G6a7g29J19JiDk2VW3mFw7U/ga/2aSmrkgwRc+N9so5dU//i/Q
         beIWzxa96igX98ajDea9XZVQtmM8DrxFBf4wdP4Ip+eMNMa8O4GSYuRNHCjJSe7QTmVZ
         SyzdB+OFQowFd3fWuDDkB6URl/VALZjR2VBetIE4VjtbN2jmRrQSqwGJ+1pWyM1UdqWN
         In5N6Z91WzylSULizorzFkESo4A2LJHHOeJT3nwrLNX7vf501OiDAEj3KNs9c1D/MTn8
         PImg==
X-Gm-Message-State: AOJu0YyIPo27fAtvMS2Ky5QLTHLVIUgHJ4x37i8fBplNr0C/eAekGFrh
	4llClz1CFHxz+LCwJM28W84=
X-Google-Smtp-Source: AGHT+IHUV0dHK2B6cJ9/ReMlGV+h3jKOsOHsCJyR1xuP7KFxb1scRptYF2ABS3u5YAVS24l+5wmKSw==
X-Received: by 2002:a05:622a:115:b0:41e:453a:4dfd with SMTP id u21-20020a05622a011500b0041e453a4dfdmr32567901qtw.54.1699196684398;
        Sun, 05 Nov 2023 07:04:44 -0800 (PST)
Received: from luigi.stachecki.net (pool-96-246-165-101.nycmny.fios.verizon.net. [96.246.165.101])
        by smtp.gmail.com with ESMTPSA id i5-20020ac813c5000000b0041b9b6eb309sm2528607qtj.93.2023.11.05.07.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Nov 2023 07:04:44 -0800 (PST)
From: "Tyler J. Stachecki" <stachecki.tyler@gmail.com>
To: mani@kernel.org
Cc: mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	"Tyler J. Stachecki" <stachecki.tyler@gmail.com>
Subject: [PATCH] bus: mhi: host: pci_generic: Add support for Sierra Wireless EM9291
Date: Sun,  5 Nov 2023 10:05:10 -0500
Message-Id: <20231105150510.96136-1-stachecki.tyler@gmail.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the Sierra Wireless EM9291 modem.
Empirically, it seems to use the same configuration as
EM9191.

$ lspci -vv
03:00.0 Unassigned class [ff00]: Qualcomm Device 0308
        Subsystem: Device 18d7:0301

Signed-off-by: Tyler J. Stachecki <stachecki.tyler@gmail.com>
---
 drivers/bus/mhi/host/pci_generic.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 08f3f039dbdd..a9ac49a94832 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -503,6 +503,14 @@ static const struct mhi_pci_dev_info mhi_sierra_em919x_info = {
 	.sideband_wake = false,
 };
 
+static const struct mhi_pci_dev_info mhi_sierra_em929x_info = {
+	.name = "sierra-em929x",
+	.config = &modem_sierra_em919x_config,
+	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
+	.dma_data_width = 32,
+	.sideband_wake = false,
+};
+
 static const struct mhi_channel_config mhi_telit_fn980_hw_v1_channels[] = {
 	MHI_CHANNEL_CONFIG_UL(14, "QMI", 32, 0),
 	MHI_CHANNEL_CONFIG_DL(15, "QMI", 32, 0),
@@ -587,6 +595,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
 	/* EM919x (sdx55), use the same vid:pid as qcom-sdx55m */
 	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0306, 0x18d7, 0x0200),
 		.driver_data = (kernel_ulong_t) &mhi_sierra_em919x_info },
+	/* EM929x (sdx62), use the same vid:pid as qcom-sdx65m */
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, 0x18d7, 0x0301),
+		.driver_data = (kernel_ulong_t) &mhi_sierra_em929x_info },
 	/* Telit FN980 hardware revision v1 */
 	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0306, 0x1C5D, 0x2000),
 		.driver_data = (kernel_ulong_t) &mhi_telit_fn980_hw_v1_info },
-- 
2.30.2

