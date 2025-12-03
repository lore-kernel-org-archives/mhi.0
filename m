Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FA42FB966
	for <mhi@lists.linux.dev>; Wed,  3 Dec 2025 13:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764770044; cv=none; b=QZNJZ4eI4U9HSklQZSwlauftbeh5uOR/k57AxpwfqXV4I/QcKqdRE2kV14bujPR/bd493z+Kpk9LlMyL7wGFr+lHahGanCc5zt9HpjRP/RWetir7HDAgF6Zk4200jI9k83Gj1pdOk/LGj6s9hRHbOSu4i8rsyugBtJamFz2Hmfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764770044; c=relaxed/simple;
	bh=zH2PKrfPlxwtdF3X9LqBt5Z/eXC9XeGkjygYrrB/tYY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uuh+wrgd1rmB6N+0QhZYSd76RyfHCZ3uo5ddtkuBNJiNSNDx0VyP2RKMHZhVoJa3pMt52BZx6PHQWtkVuwrVKE1CsYh2zI8ZzhB3xIzkobBujSiuvd7vn5MUrp6z14artTKcStGM7KaqQ4n5w4r6P1rC5adR55HTpDEahzHqv4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FWGT6RI6; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FWGT6RI6"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4779a637712so43137105e9.1
        for <mhi@lists.linux.dev>; Wed, 03 Dec 2025 05:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764770041; x=1765374841; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6gmAM79L0urJOkGk5BdJYyX+Tz0Pp5q3Q6ArqpzSYNE=;
        b=FWGT6RI6CzCOStxDY9BiCWUfcEurBS0dK93HSIpik5ASt9iS0eD5FN1YC8G1kYOdCS
         mH0eS9BlI8S+neQ3sJGDhS4zpp/qZ9i1ndNzAKwA2k3fKk2brtybl9VVqU3iGUWp31rO
         K/eBvt90QOdkxcS7cYZ01Hkg/kk5egZuDSIAMNvVJ0SGmlGFIfK0j2wGYDH+2Sbrq+Pw
         0jOEONnyaSjZ4/jQvWv5czH/1iFjBMkf3f40NmrnxnjoTZkvyhPpUL+5CsJRKtX4FN94
         ITxuLNezumpB2kvS5xf8o8oZBCA9l8mE2a1JFHRMYG38zjUmwL4UG1DzwII890ga+8Ne
         klyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764770041; x=1765374841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6gmAM79L0urJOkGk5BdJYyX+Tz0Pp5q3Q6ArqpzSYNE=;
        b=iC+AVHYSKTwIZnVNghmsFjCTIwwBCZcjeEX3dBI3zSqytzYMiXnxtmjxNadLEC6vGW
         sqyz6hjt0YDr/U5f5fs7cB2alvFeIDdS/2zOFLHnrdhZ5I0P+Gn5+N/KKi8RI93odnIR
         c8FAKtDnG2y5B8vK9EamZVYWU6E0+Z732q2c+PPXxpEI0wf+Or2qhW7mgZFJabW4F5PL
         oirjK8j2WhfJfYkjZazD5ZFXacOdLHf9WNHTzVUUmfPKEabNEV9LnVAsCYzmyGDadhvx
         pintGmqCLmhQYKcuSQPF89v1ZQduqOxFzA4uHtyit/hKwOp2shC6QtglOmYkeKlH4LKT
         BdQg==
X-Forwarded-Encrypted: i=1; AJvYcCUwuwNHyTZ7HGwN52yGn15LyO9YZwDLiujP26arwL/vgDZLES0k1d+Yh1xlvM5MbNkMfCM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwBOVXaUtOBtZkHvqVxxDdnTv2DU5BDVD4j3AQDgWYQR7XAwpzu
	6WlwojHI6Qm1B2ZR7FKItiioX1JEmJu/vQ3hdktAA7CAsIbxkcSogY1/
X-Gm-Gg: ASbGncu7OpkMKXsT+dCJBCyLjDldFTn+4JNZqT4tFbpJ6cJY1HNTQlUIMtf2qea31/E
	7cM8zBrn3i77lYIRg8w7Dns9iiB50w+GioHlJSS5iKm+9mcHUvKJjB6dki286iDIZQS/3dGWkMc
	qV7o1rSH3HeRRaLhCN4JKk4Vl6olJA+8gCIuuAMhWr+URt2VZOA8CmQzEliG2tskzX/Ne2wZOIy
	nyHQ5Zo5/jlQoRl0DEOb8bqzbdBUZHIPIPv9gP9vtHCwKxoMPCj6ttaZE8qaZVqO6tK2ZsgF6BW
	F86/DDZjvWqceGEJyXGN8NBIua399l8czIlNpFoAbrYGs//21AqgXv6y8YhAv0NJnMRhceccicW
	hw+onbgDwScvzeq3JT3smViXjN5lvMP6Dt+PgvaOWMDT48R9tatVSNYKBJ9oa8OY/eSSRn3RIRP
	yCuVAvCgrKs+0ZrRhSlME11t54KBROevHVkuwdluOu7/YFwdGkIt+ly+gMx2swzlz4boAViaVLV
	73YcJLTXCRD9riU/qxMNbnCdUNi0Ew=
X-Google-Smtp-Source: AGHT+IFNsQjyU64y9iSDrc/RmB+GP+KFMTNCOG7l14/Rm9rfloIWa0YLlJjHBN7TJSs2QojrjfBpqg==
X-Received: by 2002:a05:600c:8b16:b0:477:afc5:fb02 with SMTP id 5b1f17b1804b1-4792af31394mr23140715e9.21.1764770040594;
        Wed, 03 Dec 2025 05:54:00 -0800 (PST)
Received: from labdl-itc-sw06.tmt.telital.com ([2a01:7d0:4800:a:8eec:4bff:febd:98b9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca8e00fsm40433575f8f.34.2025.12.03.05.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 05:54:00 -0800 (PST)
From: Fabio Porcedda <fabio.porcedda@gmail.com>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org,
	mhi@lists.linux.dev,
	Daniele Palmas <dnlplm@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Fabio Porcedda <fabio.porcedda@gmail.com>
Subject: [PATCH 6.12 1/2] bus: mhi: host: pci_generic: Add Telit FN920C04 modem support
Date: Wed,  3 Dec 2025 14:53:52 +0100
Message-ID: <d2b91b3097c693f784393a28801a3885778615df.1764769310.git.fabio.porcedda@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1764769310.git.fabio.porcedda@gmail.com>
References: <cover.1764769310.git.fabio.porcedda@gmail.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daniele Palmas <dnlplm@gmail.com>

commit 6348f62ef7ecc5855b710a7d4ea682425c38bb80 upstream.

Add SDX35 based modem Telit FN920C04.

$ lspci -vv
01:00.0 Unassigned class [ff00]: Qualcomm Device 011a
        Subsystem: Device 1c5d:2020

Signed-off-by: Daniele Palmas <dnlplm@gmail.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Link: https://patch.msgid.link/20250401093458.2953872-1-dnlplm@gmail.com
Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 drivers/bus/mhi/host/pci_generic.c | 39 ++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 6505ce6ab1a2..b8520ca40e8c 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -698,6 +698,42 @@ static const struct mhi_pci_dev_info mhi_telit_fe990a_info = {
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
@@ -720,6 +756,9 @@ static const struct mhi_pci_dev_info mhi_netprisma_fcun69_info = {
 
 /* Keep the list sorted based on the PID. New VID should be added as the last entry */
 static const struct pci_device_id mhi_pci_id_table[] = {
+	/* Telit FN920C04 (sdx35) */
+	{PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x011a, 0x1c5d, 0x2020),
+		.driver_data = (kernel_ulong_t) &mhi_telit_fn920c04_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0304),
 		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx24_info },
 	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0306, PCI_VENDOR_ID_QCOM, 0x010c),
-- 
2.52.0

