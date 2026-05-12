Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FD325B096
	for <mhi@lists.linux.dev>; Tue, 12 May 2026 11:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778586337; cv=none; b=hlWRV9kxiWF8wM/CsQL49XSu36DGVRUbZDTOmJe+ZcSafcPwq4X3TP4ydDcLFOB3SwY9SKUzLL9CJn3KHmpl7uUROj3+Z30+juHmeUO1VNl8p6U9gTG6myypPzKFl9iEUhpRjtJtgX0EPH0sdq9OUHd10vO9XPM3GJqIY5e5TCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778586337; c=relaxed/simple;
	bh=ZrEzIHpJKUH04VIV1aOFXpMO6x5uT0snNxYaIEv5MRc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ii3mPgLfOFndFR75OKiZDb4F78IzhSM1UKN4G107vEjOn7GNmt+Ubq7+GUfmuABkX5YpS5qWp+fmfU5FgFuWsn95zupX++BfcUaCBlg+hZzkNf5uW4H2mEg6gjp6V9+5PLbkjdV7erddQemhR5lZw+m40o1UqzqjSR2WD5UXqXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SitQFmyY; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SitQFmyY"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48e82c23840so18851365e9.3
        for <mhi@lists.linux.dev>; Tue, 12 May 2026 04:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778586333; x=1779191133; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tHeRIq3gd81J0mQ1jp9zUiVyyBrvNpsMzoSo1odTZjU=;
        b=SitQFmyYn/u6IpP9t4+iAk7GyWuo49KUSAUHdz2z1nbVOv+NM9hcJVO+c30yUr29lK
         iWFJulmudNNe0eSHql59GGeUiy+19VXMC2wgcKLuW+ZtGKd7qbUv/g3/s0PaIww+WOrm
         ijmebre1yvwpUTv9PFt0bRWsp10OjN4EQfFVxM3652XzEL2+tSjroQDhC2PjoPMjc8ep
         DFEgE2RZ6SGSaFRJdT21w9q0CufjTaAOamtu6GaT2dnyqHt1pubKYHc99jcyi0A7Y9U5
         uytQ2mKn0pfreyMhGZ9HiO4w4S+P3h5NyoQ5zVPLWsILNjR5mDMI+tOnO+aFQqcLR1z5
         K1/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778586333; x=1779191133;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tHeRIq3gd81J0mQ1jp9zUiVyyBrvNpsMzoSo1odTZjU=;
        b=NYbfOZMy2rOvN7hf58gt3ViWXuKa6tqEDgenw2CIZlqcuQrDp/s9buMYK4+pLS1e5H
         J+5n8SFuEIu7ZsCbTBLfrhQysw7X6+pqOITExaW6klIQ8AaLL3lsih9Jm6ZjR3DRSPin
         kGhqqLD/tFbAGsbm64+7cgHGQDtbF4s2oG2uExIn3WzKbP84Oc7skvG0UKJP4SPqH0BO
         I5sTPjV44aqweckTyimhRBepjpINjFWmKKiZ1AjgwJZ2VmLR7m2zpYp2VZRe05npky5R
         puYNM3oNcBcmBWosbJjevMlfbC1LEbretDtAjY5odbXI1PS0dXQ6jLbDorloV5QY0Ldp
         PVMg==
X-Gm-Message-State: AOJu0YzLdtnedf3sKws06rP4EX8V2nSMKtDOaoQjd0krAqfNzhzg4Y2z
	WfbWRE/EAzsvtQKOCrKQAUVs6IQVbizzA8HjGQEMpMfSdBuULULy9WWj
X-Gm-Gg: Acq92OEUS7zKFWbVCv501sKCKLZfO6qZlP1xr8Fip/c1nds8DId5+BHIHy10FF7TpiS
	Cu0zYBZJZuFnj/hr8vxVW8hUTPqrtycdV8jBpOdIm3rI7KGh46OR5YPj9ODQ0TIixdV2FL+MM4w
	/5fvohA+55TXRi0NW++t9KUViObgy8gUamPpxsV4c5BMgTvR8s5oIRQRXG8I+l/1iRfkAhlSRdh
	CEvBZJsjVd4Zm/uNCtG7Y/Vj0ZH9iX+5r1wh7Y+IfnJEeRwKoMUuAYFXZ5PskyDPdBqv5M3x2Og
	hMSZKxVl8kxXRUwatLnnXt7fJFM4NdMUK5+Oex60h/QRdtxPRParK2IlymjErv6XKVChdT+shPu
	adiQtZVRY9nE+o2JrqXhyuiYIrDWfWTUXm90fOY3Yd4cd+5FARL4F9tcfoMXKJslDbt/OTJCwcN
	G9JWd3LMZ3jSCm3Gp9fswDOLBQJAfxFntSVZKvkoIzcudTMGDZfkHRHT0AS56+NxAZJwA/u5t+D
	VYg0XsjmYEQ
X-Received: by 2002:a05:600c:3510:b0:48a:8b02:ae91 with SMTP id 5b1f17b1804b1-48e8fe50c53mr35510305e9.11.1778586332917;
        Tue, 12 May 2026 04:45:32 -0700 (PDT)
Received: from ThinkStation-P340.tmt.telital.com (static-82-85-31-68.clienti.tiscali.it. [82.85.31.68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8f3cf0cdsm28438525e9.2.2026.05.12.04.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 04:45:32 -0700 (PDT)
From: Daniele Palmas <dnlplm@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	Daniele Palmas <dnlplm@gmail.com>
Subject: [PATCH 1/1] bus: mhi: host: pci_generic: Add Telit FE910C04 modem support
Date: Tue, 12 May 2026 13:24:58 +0200
Message-Id: <20260512112458.1048999-1-dnlplm@gmail.com>
X-Mailer: git-send-email 2.37.1
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add SDX35 based modem Telit FE910C04, reusing FN920C04 configuration.

01:00.0 Unassigned class [ff00]: Qualcomm Device 011a
        Subsystem: Device 1c5d:202a

Signed-off-by: Daniele Palmas <dnlplm@gmail.com>
---
 drivers/bus/mhi/host/pci_generic.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 750da3dbb4c6..947ab89a09b4 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -914,6 +914,16 @@ static const struct mhi_pci_dev_info mhi_telit_fe912c04_info = {
 	.edl_trigger = true,
 };
 
+static const struct mhi_pci_dev_info mhi_telit_fe910c04_info = {
+	.name = "telit-fe910c04",
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
@@ -941,6 +951,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
 	/* Telit FN920C04 (sdx35) */
 	{PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x011a, 0x1c5d, 0x2020),
 		.driver_data = (kernel_ulong_t) &mhi_telit_fn920c04_info },
+	/* Telit FE910C04 (sdx35) */
+	{PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x011a, 0x1c5d, 0x202a),
+		.driver_data = (kernel_ulong_t) &mhi_telit_fe910c04_info },
 	/* Telit FE912C04 (sdx35) */
 	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x011a, 0x1c5d, 0x2045),
 		.driver_data = (kernel_ulong_t) &mhi_telit_fe912c04_info },
-- 
2.37.1

