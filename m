Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD907157493
	for <mhi@lists.linux.dev>; Wed, 16 Jul 2025 09:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752658286; cv=none; b=d9HEZptLZzXpmcOWMh/zvutSXF6+I8ZtOfIG/qP7qJe8T0CyUplSgvEzhTs7prsN+vBRQHVzxBcQ4+AthVRrwGF1NNbfwqnWipJY8GGMTL8t6x2N67bp2kya20V1ofugudyRvadGRjd1qzaJXASgG0weXdUUSAr4xmDxohhJetY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752658286; c=relaxed/simple;
	bh=ej+5hkCMRkx/GE1qcDYWd0xc2QxcktAYnQnGWSkkqpo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FQvyI83WVdZSVd8EKbTg5KFJMfXDS8xojVzTVQvW8F1zbaUs6JdvKgjwxu4ParKKH5OaOwpcg+D3i6xSPj1vrXE9VscN8O9MP1lLryQOiaNOtbMYcK7h9DNYr5XQQJDHIw0F/ugjbJ6bHLYao3qvt2CbfJzsU7FsHhY2/H/l014=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GecNRxPu; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GecNRxPu"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4561514c7f0so26532035e9.0
        for <mhi@lists.linux.dev>; Wed, 16 Jul 2025 02:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752658282; x=1753263082; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eG0tZ6GuO2rfXlaJ2pbUobsFrC3TERYmTm+061kXYtA=;
        b=GecNRxPuD8PkXcOwsbfKr7OPokPa48tnrR3FycZFYpxZD91brhgeLcuiSSWHhQ5tGY
         ypT498AsgGw+ljVIwMKkoZq2C+kUoAqqhoaAP3Qpia03weT8X/2LlhEtF7EuUpMF8G0P
         mpyp6bgb6TMWwkt9EfM4Cb1++JhDzFWdmW+TbDzUI4uT2rSMV65/r91xXtgL8iUuho/z
         GMzh/OXAzxo8dHZK1ATfYKD8zA7g+L0huYtvshSIvCOeJwts/tx9lOfQMZqx+vKjqZbg
         Iren44qpWIY9k7QjuUCGg+Ahz0B5R37Bzqf9/yHvYDOwlSly/GxDUuBbKDwnr4YFPoYT
         hX2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752658282; x=1753263082;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eG0tZ6GuO2rfXlaJ2pbUobsFrC3TERYmTm+061kXYtA=;
        b=sZk2YI0js0Gqa0juivl0qywANC9/FxUmTvzvkoLjbyrsD8STaLShPRkskH117IU1ME
         4/6VuCFj/FHR8oVp4PSTYJsfIGL8D0Ek4AlO191HJivkuG2YtDhVoOK/AsDzTkpAb3V0
         uGCjHmDyWpIhfjZLjdFsg6xYy7i7u9P3fv1WNyXPCw+p3deRM+8yUAhJeJeo2FSn3GBA
         bGnNhCCmCL8hxtH13nInPgw//KYaOh1eEshg4ONADOnFCRAz5qCWThCy/HkcgZ6HxP/6
         8vVn6xj2gffsig+cCfZ66+cZza+dg9lCYbcTLssLif0CjNTxVGUb5vvcKZIU24DWUFiU
         BaeA==
X-Gm-Message-State: AOJu0YzTtP9vPJKJP+7Df8leJkwbJEnjAYdPbgAEjDFjUum4msC2US0c
	6ILBiuS68qEnhKZXnw0yWJVvk4JqSSQ/gXn75uo2kxSUxt5iyZ1pksg+Z8EqaQ==
X-Gm-Gg: ASbGncsgmRHMQT992aDfLRtkrENtkyWErrn0ATfcwi9vmWoGBgtaWcK82XRIyDZWWjL
	fNwil+3K0PhjHj7bkCsWHl5CbG0fw63nVDkD7GvLJhovCI1ERD4VrFbRN/RLXZNCJfN46JIXhUt
	SQTnmMDzVcaBpd7HErVlePW6nH+gsZ21suwxC9WIPsqWhAAfwQueF2EZtiSl+5GCmUZ4FLdETmT
	T1+YQtoiadUYamo2EobfrWNKHIQv/Vd8JxTF6cfGez+df5E6oFexgKBCVgxrsM8Gwqq0mnk+Zv/
	J+4xbRKiS+Nnv0tteTyU4Pq8hHYuinNdI957XOoDhgb1kFA74IRFkoPfoL6HRu9ElMPxcCfmBaZ
	Xm6ujkyzG5rKurSnPTVxo1gnlvuvTRWeyNj82rJwtZIGSdeTarht0Yyld7NoW71THWvmyumUkXL
	94gMU+o6Gp
X-Google-Smtp-Source: AGHT+IGymcNYqKVn9PbuWWgMCBfnL2OyVM+FICG2nm+gz961Q3FNsg5yfkRvxn/+Iahe96pjcUCCcQ==
X-Received: by 2002:a05:600c:3496:b0:456:1b8b:b8c6 with SMTP id 5b1f17b1804b1-4562edaa066mr16201335e9.14.1752658281904;
        Wed, 16 Jul 2025 02:31:21 -0700 (PDT)
Received: from ThinkStation-P340.tmt.telital.com (static-82-85-31-68.clienti.tiscali.it. [82.85.31.68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4562e82cf22sm15396205e9.26.2025.07.16.02.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 02:31:21 -0700 (PDT)
From: Daniele Palmas <dnlplm@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	Daniele Palmas <dnlplm@gmail.com>
Subject: [PATCH 1/1] bus: mhi: host: pci_generic: Add Telit FN990B40 modem support
Date: Wed, 16 Jul 2025 11:18:36 +0200
Message-Id: <20250716091836.999364-1-dnlplm@gmail.com>
X-Mailer: git-send-email 2.37.1
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add SDX72 based modem Telit FN990B40, reusing FN920C04 configuration.

01:00.0 Unassigned class [ff00]: Qualcomm Device 0309
        Subsystem: Device 1c5d:201a

Signed-off-by: Daniele Palmas <dnlplm@gmail.com>
---
 drivers/bus/mhi/host/pci_generic.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index ec2c7410ce62..48f061e1eb06 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -859,6 +859,16 @@ static const struct mhi_pci_dev_info mhi_telit_fn920c04_info = {
 	.edl_trigger = true,
 };
 
+static const struct mhi_pci_dev_info mhi_telit_fn990b40_info = {
+	.name = "telit-fn990b40",
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
@@ -924,6 +934,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
 		.driver_data = (kernel_ulong_t) &mhi_foxconn_t99w696_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0308),
 		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx65_info },
+	/* Telit FN990B40 */
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0309, 0x1c5d, 0x201a),
+		.driver_data = (kernel_ulong_t) &mhi_telit_fn990b40_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0309),
 		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx75_info },
 	/* QDU100, x100-DU */

base-commit: 0bfe192d90fea2c1b523868a9c110d176a2be741
-- 
2.37.1

