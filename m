Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF9A18E345
	for <mhi@lists.linux.dev>; Tue, 20 Aug 2024 08:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724141097; cv=none; b=WmKXajJn+qogSFefpefmcIV54s3KLvUKY9YcAXu5uy/h3CwAwQPkQiTk0uRJodEzPLtKTa1YslP8MeTlAJ/+W8UnvY+ErGeY/hr9IPxLHZuo1pLquVp4A5JH/dNZjWZLDmXrij0azvtcQoFUHMEa0KCRHkHaKn80gt8GcPqqE5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724141097; c=relaxed/simple;
	bh=nLDE8aqv7ibiDI+AnLjAU/rDCYSS1DmP41EiC6RFcmc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AhvgR1RuDMTM9jDm/xKyXuXL+oCTRgqVbXfHAex+n29xEmRsYafXV+EuPWQPVGUDNYnQezMLKQTAwoJJ9C3OKLma6XN/jxXDhJYHhRajLl0y3KTynCWBLeWmR39WArT1GKOEk79zGabPdcm19DpjGM/cpfnU9x4cXDN/g7vI0Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fQOua15r; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fQOua15r"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a7a8a4f21aeso630170066b.2
        for <mhi@lists.linux.dev>; Tue, 20 Aug 2024 01:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724141094; x=1724745894; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bWFgus7bmtmFt8A1IpRat5xjHQCJCzf5TqRiBZFH+5c=;
        b=fQOua15r+nAUkk4f5CqbNu56VyH3iprIAF79BflcEYm03d40x0gBVNK8uqO/n/fwkt
         WYfSJU0VsO7RuF8zVdGFcAVLbAYb0X/QO21QILe6/3VtaT0BABsvl1wGkNm9SjyFDzqy
         wgIxcKrB0WWj+wQYzH/Hl5lWT+yDodLjaoAsisd/AfmIW6QDh3t1aBJhnDJPoVOFJ38G
         BHjcRgBEd+iDsX8Bko8L72FhcLvJwQp96tXvSPSuWMk6JM1BR5fOswLqslYJgljhn6o4
         66SEsn255xEG4nXN9u+B6HhLXwDTSko8NLHOBGm+qG4FRGvsz2X3LWtX+U74tTsdZ5+d
         4BRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724141094; x=1724745894;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bWFgus7bmtmFt8A1IpRat5xjHQCJCzf5TqRiBZFH+5c=;
        b=nJgcOlkb3HMVgr6krcKryJPgYAWepq2E7rb1qcNhPi9hlnqE45V1uiZv42eBOtn0ny
         yPod0Ov49rbNCoRq3obws73hWIbFRVoF7i7JCjLC7qeq5pR7DZUFtlQYvQ/i0II3UY+W
         mjpZzcC04DdgCiH8/BuWv5Iwunq8LBdJaenkL4fqQwRWEEWZwoKhjjMqh6prO7ivzQ/N
         dHx63VBQNBIYzinISR+67MMwwQoR+aQcfWwO/h88L+KkPPbmoCDG0b5KUUX4v/bC0c4G
         OUhEW3GTQvKDoQTE4ZBNIQmxnRshhWFbKtuY6s/T2OxbZex0Ii5HHofS/3YLDkLqQkCs
         q2Fg==
X-Gm-Message-State: AOJu0YwvRuxkXjKqna3djr/SGiuoQgBx7deWK1Cvug0Y+o8qPPmlxL5F
	jNR0TjVFzUVJjqxPXxf35yVNsIUOdkKgYfAusNzeFa2AMGUf7tGd
X-Google-Smtp-Source: AGHT+IEylAwKGfhOSRiPpbSpW/mefft1BLen+BVub0FwVY6eJPQ1OxSK1kbb37LXb0EZJFVLDfx10Q==
X-Received: by 2002:a17:907:d581:b0:a7a:8cb9:7490 with SMTP id a640c23a62f3a-a8392a15b30mr943309266b.47.1724141093178;
        Tue, 20 Aug 2024 01:04:53 -0700 (PDT)
Received: from labdl-itc-sw06.tmt.telital.com (host-217-57-98-66.business.telecomitalia.it. [217.57.98.66])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8383948d19sm728431066b.186.2024.08.20.01.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 01:04:52 -0700 (PDT)
From: Fabio Porcedda <fabio.porcedda@gmail.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Daniele Palmas <dnlplm@gmail.com>
Cc: mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Fabio Porcedda <fabio.porcedda@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] bus: mhi: host: pci_generic: Fix the name for the Telit FE990A
Date: Tue, 20 Aug 2024 10:04:39 +0200
Message-ID: <20240820080439.837666-1-fabio.porcedda@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a mhi_pci_dev_info struct specific for the Telit FE990A modem in
order to use the correct product name.

Cc: stable@vger.kernel.org # 6.1+
Fixes: 0724869ede9c ("bus: mhi: host: pci_generic: add support for Telit FE990 modem")
Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 drivers/bus/mhi/host/pci_generic.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 14a11880bcea..fb701c67f763 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -680,6 +680,15 @@ static const struct mhi_pci_dev_info mhi_telit_fn990_info = {
 	.mru_default = 32768,
 };
 
+static const struct mhi_pci_dev_info mhi_telit_fe990a_info = {
+	.name = "telit-fe990a",
+	.config = &modem_telit_fn990_config,
+	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
+	.dma_data_width = 32,
+	.sideband_wake = false,
+	.mru_default = 32768,
+};
+
 /* Keep the list sorted based on the PID. New VID should be added as the last entry */
 static const struct pci_device_id mhi_pci_id_table[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0304),
@@ -697,9 +706,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
 	/* Telit FN990 */
 	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, 0x1c5d, 0x2010),
 		.driver_data = (kernel_ulong_t) &mhi_telit_fn990_info },
-	/* Telit FE990 */
+	/* Telit FE990A */
 	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, 0x1c5d, 0x2015),
-		.driver_data = (kernel_ulong_t) &mhi_telit_fn990_info },
+		.driver_data = (kernel_ulong_t) &mhi_telit_fe990a_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0308),
 		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx65_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0309),
-- 
2.46.0

