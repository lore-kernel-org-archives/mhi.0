Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F323159C
	for <mhi@lists.linux.dev>; Tue,  7 Nov 2023 15:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SAb3zCeB"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-66d09b6d007so40392856d6.1
        for <mhi@lists.linux.dev>; Tue, 07 Nov 2023 07:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699371675; x=1699976475; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ObVN4OHcPVQWsUpE/966fOo3IFl5zYaTQP4Ff/lWTe4=;
        b=SAb3zCeBzZ5MWzWHg8o02b6wWrJ55jWKZ92iEotl1eb8np2Y5el6PNikEz7FYksWZg
         uNjs6gOXmJnwVy4XkwZkcodl+/4E81zEXiRkVzkkUikbnedt+uYAXb8Lm+agJSvpsk/7
         ljF1DXwY9rbXaX7ONKIBNq3p7Iqse49nquPtgpcduMWRRKSx9Xn7ted5oYA7zzwV5qWF
         AWnArV3fIfbbC6XkBGNILTGioeLQDwbY0HbosI2qOIPUiIb70GMuNJi+VreYdwTN+esY
         X3n/YQ98vigCaP5i0h9TZSEpQIaKxlJur9OAUX1OH7PZqDt2rZ5mTnizp4TRkpKqAJE5
         WavQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699371675; x=1699976475;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ObVN4OHcPVQWsUpE/966fOo3IFl5zYaTQP4Ff/lWTe4=;
        b=fOkSU/x9T5i/Rwju6lRQ/IiX2yCfr5X58MakaldYvqm6DO+6Fv+QaD+OfRltS2LcBi
         /HvuBGyqJjEpfLROhQjjbiT3oGRdL9kfSbZv5NO+C48OZEqpt+AkFpd9OJSX/on6qaA1
         7Ch1gTlOheZ3aCNblxa8vhzwKUoTuMzR25jwmbuHhfTaE7P19rsLlnL0/xbTc/jOWHac
         ebTa5zNDkzT658wvYJuHCfUl5nlR6L/AD+IOY0rdl1GZFt7BQMkoC0iFwvHbo1ILxuNO
         jGR3IF19Uypruatiy7CztYk1EhEdF7u66689LxHwbew+HwZK46t4cBpMuI9Idk9AGNbq
         Fehw==
X-Gm-Message-State: AOJu0YyukHd26gtYY2FJ0aTnR4RjgsDazBCGSPl8ohqPjOAs4hG/z+vz
	sYBIgRRbCj5uY6Tc7ncUJVN/77zV0yfwk4VPhw==
X-Google-Smtp-Source: AGHT+IHHqmworfLQWEekvi8UO9gWd02E+Uc289e8Y39lqPlgbomqRT6SyOFmuPC/YBTPy52YJ0fB4w==
X-Received: by 2002:ad4:5ca2:0:b0:66d:3723:294b with SMTP id q2-20020ad45ca2000000b0066d3723294bmr34665070qvh.64.1699371674936;
        Tue, 07 Nov 2023 07:41:14 -0800 (PST)
Received: from localhost.localdomain ([117.217.186.253])
        by smtp.gmail.com with ESMTPSA id u3-20020a0cb403000000b0064f43efc844sm4565789qve.32.2023.11.07.07.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 07:41:14 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: mhi@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH] bus: mhi: host: pci_generic: Add local VID definitions for Telit and Sierra
Date: Tue,  7 Nov 2023 21:11:00 +0530
Message-Id: <20231107154100.154492-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the definitions locally for now since it was agreed earlier that we
keep it this way until the definitions show up in other drivers.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/host/pci_generic.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 08f3f039dbdd..58ce1ecddd19 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -25,6 +25,8 @@
 
 /* PCI VID definitions */
 #define PCI_VENDOR_ID_THALES	0x1269
+#define PCI_VENDOR_ID_SIERRA	0x18d7
+#define PCI_VENDOR_ID_TELIT	0x1c5d
 #define PCI_VENDOR_ID_QUECTEL	0x1eac
 
 /**
@@ -585,18 +587,18 @@ static const struct pci_device_id mhi_pci_id_table[] = {
 	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0306, PCI_VENDOR_ID_QCOM, 0x010c),
 		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
 	/* EM919x (sdx55), use the same vid:pid as qcom-sdx55m */
-	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0306, 0x18d7, 0x0200),
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0306, PCI_VENDOR_ID_SIERRA, 0x0200),
 		.driver_data = (kernel_ulong_t) &mhi_sierra_em919x_info },
 	/* Telit FN980 hardware revision v1 */
-	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0306, 0x1C5D, 0x2000),
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0306, PCI_VENDOR_ID_TELIT, 0x2000),
 		.driver_data = (kernel_ulong_t) &mhi_telit_fn980_hw_v1_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0306),
 		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx55_info },
 	/* Telit FN990 */
-	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, 0x1c5d, 0x2010),
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, PCI_VENDOR_ID_TELIT, 0x2010),
 		.driver_data = (kernel_ulong_t) &mhi_telit_fn990_info },
 	/* Telit FE990 */
-	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, 0x1c5d, 0x2015),
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, PCI_VENDOR_ID_TELIT, 0x2015),
 		.driver_data = (kernel_ulong_t) &mhi_telit_fn990_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0308),
 		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx65_info },
-- 
2.25.1

