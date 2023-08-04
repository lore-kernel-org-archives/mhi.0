Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C755A929
	for <mhi@lists.linux.dev>; Fri,  4 Aug 2023 09:52:10 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1bc3bec2c95so13691225ad.0
        for <mhi@lists.linux.dev>; Fri, 04 Aug 2023 02:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691142730; x=1691747530;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ztEtGsHv8LUsy3rYuXtTs4zJ+h/bmJ//A4c7nlgI5hw=;
        b=DF4vOh9oYjsGO5mn6q0HtK0qqUgf67d94y1xNpqbMUE5/ZlvETU4qywX2jSiq2IJdb
         x0xvfCu3TwzjRUiH25JAogM+QJZ2hrT/p4NUXShuFTwm1OqqCAMaGeo3OC2+kbMrdDyN
         tzjgB/w51/f13PYfMIIKiHNDfp7DWSsFnKhN1CcFWUsjkjjS5SSSTUwixiIu83+jqcao
         vfP4bAGcC1xaw0ENAnJGRDfD8Wa8DFq4Ga22c2T0M6Dmy64N1NlrK+BhXPAemHj2j7rP
         6uS9t+eEqAO4qqLpYoVNkAtr1O7whwMHAUXwNFKXcC3/YIvRJN5o5tiEJ62Om8aphw8/
         udVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691142730; x=1691747530;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ztEtGsHv8LUsy3rYuXtTs4zJ+h/bmJ//A4c7nlgI5hw=;
        b=P+7TO4NIP5Dw/CahBy7L+Xb7tVJ5tzjFmJc47ew1000yAMMzWf/aOyhh0zZ7ztsnNW
         tYs7urVnFykUc71USGjdJ0KcePZJsofjZ2EsglfTyHoeDQRyuw8FIxzrymWEWpLSopW+
         FVZACQNryJ2PXIm9ZU20RIsk1NnO+GnAZwAWR1QwZfpDsFryJjn2YtukMWbc+lPMe1iT
         4CtIXO2cfT/EiiIOPRMSz72F0sfjQG1515J0NbXNztnQfL9uAU6mfK5zV+qQxZBLKlTj
         W6S2KHwXgslWg1ck6CDayLyNefGKH+Y9BY5vDb+dcpUFEDs3wGnu1cXZYH9OgTGsbeHh
         vOfA==
X-Gm-Message-State: AOJu0YymCWQhRjQ/8IPdD42tdGY0x86Mj0p4vTrsBXP4ExH3ZhbHLRE5
	Bd5KzvFQYloGc0WYnf0P0k4=
X-Google-Smtp-Source: AGHT+IE/WipBRcaU+FY6R8C3CdC0fD2YKmltWH+7ElgTn4fIfxyJjtfY+77F/BZaTL1oP+sWFDhhCw==
X-Received: by 2002:a17:902:f54b:b0:1bc:4df5:8bfe with SMTP id h11-20020a170902f54b00b001bc4df58bfemr1768138plf.20.1691142730365;
        Fri, 04 Aug 2023 02:52:10 -0700 (PDT)
Received: from ThinkStation-P340.tmt.telital.com ([2a01:7d0:4800:7:ed2b:eb02:183:4c01])
        by smtp.gmail.com with ESMTPSA id ja4-20020a170902efc400b001b8013ed362sm1344866plb.96.2023.08.04.02.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 02:52:08 -0700 (PDT)
From: Daniele Palmas <dnlplm@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	Daniele Palmas <dnlplm@gmail.com>
Subject: [PATCH 1/1] bus: mhi: host: pci_generic: add support for Telit FE990
Date: Fri,  4 Aug 2023 11:40:39 +0200
Message-Id: <20230804094039.365102-1-dnlplm@gmail.com>
X-Mailer: git-send-email 2.37.1
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for Telit FE990 that has the same configuration than FN990:

$ lspci -vv
04:00.0 Unassigned class [ff00]: Qualcomm Device 0308
    Subsystem: Device 1c5d:2015

Signed-off-by: Daniele Palmas <dnlplm@gmail.com>
---
 drivers/bus/mhi/host/pci_generic.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index fcd80bc92978..676f3ae33ae9 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -595,6 +595,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
 	/* Telit FN990 */
 	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, 0x1c5d, 0x2010),
 		.driver_data = (kernel_ulong_t) &mhi_telit_fn990_info },
+	/* Telit FE990, same configuration than FN990 */
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, 0x1c5d, 0x2015),
+		.driver_data = (kernel_ulong_t) &mhi_telit_fn990_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0308),
 		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx65_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QUECTEL, 0x1001), /* EM120R-GL (sdx24) */
-- 
2.37.1

