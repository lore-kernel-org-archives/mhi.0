Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7892F8BC5
	for <mhi@lists.linux.dev>; Wed,  3 Dec 2025 13:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764770047; cv=none; b=BA9oO20PiA1prXngyuzNK244O7cWiyl3cTksmwRM+Jka/HA7HlfCQPX5eZdxl2WLkT6yBBdsrR8dRat/jTC5tQCMUhW20SJUgw3C6DD3CtRplEo8alzVUp/Ji8HqahztB43iiJkd0uVr7W2l1tULx/xpM4eia6IJmF6ClFnleV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764770047; c=relaxed/simple;
	bh=DF6G/XFdIfJQ7qeQs0VYU3rAkTrUx9BZ15KmoHCPoLI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZzNMcIa0yxn3G147TXr04vJwl+F1+RKL9/37c6+74UyXhjy6tJHbG7Q1WOSdBt78nI47m2ibWikARXhDgp6KxYBKQepKn0x0RmuRPSN2lLIKhvdO+eFKgR4Lj4ZxwsNENJScb3WDbZGBwPaXLC+qtN8Rr0LcYUpWGOkQ2RaTWR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fHGEtiKh; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fHGEtiKh"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4779a637712so43137525e9.1
        for <mhi@lists.linux.dev>; Wed, 03 Dec 2025 05:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764770044; x=1765374844; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kU5E10zMYIkw7ZF/4aNGAYwgRL3UWcgkSyY4TJegpo0=;
        b=fHGEtiKhsVmvqzA+v+6ZwlYo02h/wUsNheC0CPAI0wSp81cTmbW3UgL8K4eXzMU8ze
         ivrWSIsqVu+Q2C9+A8du6SC89VW1L/eyO+QNwL1swEDQ9pXXKnpX2lJoJIQZL3hEqZRK
         T7L/4M4Bg17eWaN1vXBlBLX53pIXf3+XFIkdvpFhCSy9rLDLkmyGoPA0Ss08IekrHCTr
         yBW2VOtZ3ARI4wUq8U73IWq1hQMTEFziw/yGJ4stRCJN2ORPevOxYcIUSeVh8QU5QMWZ
         0h7SKxsIB0lomX0Q/fs0+tIsYqXvN7Gbq4fhNnWVWuU7Ig8pvRR33fJ+ydCBV642MIUX
         fnsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764770044; x=1765374844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kU5E10zMYIkw7ZF/4aNGAYwgRL3UWcgkSyY4TJegpo0=;
        b=jkLNiWbYCiwguWIYZLeG7f7fAWo+B/tCnx6aai+KPuA7b3ZMzJw79L83qT8ZwF6NQ1
         4rEQgatLBol6wn8xuix8FrgRI6RMMTWavBfKi6aF7ar/6DNYYoXxrVIyqRsyUqsOIJxY
         l6mn7SFlO+wIeKbL5ev+9boPdadalgx59RnCewGNDatF+4BnmP92fgrrCcjICfodMCpR
         POiUauVqM0anigZ7cLWgg8yy5LBfbnzxaxMLUl411ZQ0zKwHZ6jWCSYOhsxJYrWU8pdr
         +3+ugl5lc6uxOtcGH8ajmKRN1LbrY/PbnzoY01AHNK/9ES8GOCXTl9z/q0LLmy9YQn2S
         1LAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaino9BpLrbTDQdlp+WsenJlAxxMLzdm6D38lGbnB3GJ11Q35ReqNECbcxoR6YDIWAkQ0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwizchvpDylC3ErZfug4CjOnPDMWUCwkBiqlKhceLg8/ZyAiMAT
	RneBez5h7VhYyyG7sbJ+y1QgcdYg0hXtouaIuvQItMblt2o2JbsvxkpR
X-Gm-Gg: ASbGnctToy0nVFnNtL6VxkMzuwRu6j9+v891hrdKjukSU/rXdxWMOVcdsWo2Qx7He9L
	VpceIf/D6ciOAjUJeNHYxoJbI+6djMyJnClEKgnYNausL2/4hMbu4I6vyotvoMAWiBbjY2L2dgQ
	EEdnYVLpvJDiobPXeLn9c2l+eHAHHsf7mkkjEpc/5oN/zd0hPO/j7QUfKvxv04a8EyTCK7KMuNT
	saszP7r0nEwPR+4ce8cGIaJW//+acH2097PNhKX/bvvQndZJK8biaRXaI4+Io9tp8QzFPzzahyO
	ncAFR0rEJlIT98Fj3j3GsShgjguXs4GErk/tYsHrQXvljmsH8/7ugn8AgquD8TfLuddBcbmk0+f
	URwZQV9hVcddGtfG5jvfy8YLc70Ds31QG8CdzJNFsQWHjbPko2aHVrpSmtqsYjDgLx6An/t7hWJ
	mkCy88AJ8MQX0/sKntpDycopo0RambM9/br2A8x0FVhB4sPz7wldiQHRryCWIx8YToP56tnVNC6
	ozCxNz3NKD50E2+yl6m2OHrg6Z2+wUN7k4JS1W4dQ==
X-Google-Smtp-Source: AGHT+IFXgqjYg+s9C0ZBpSRfYz1JGeFjdbj2Fq/FubajeWelCOReDZbc8uwYFRx72hU/FuPHbhayig==
X-Received: by 2002:a05:600c:524d:b0:477:333a:f71f with SMTP id 5b1f17b1804b1-4792af30ea0mr22550265e9.17.1764770043606;
        Wed, 03 Dec 2025 05:54:03 -0800 (PST)
Received: from labdl-itc-sw06.tmt.telital.com ([2a01:7d0:4800:a:8eec:4bff:febd:98b9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca8e00fsm40433575f8f.34.2025.12.03.05.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 05:54:03 -0800 (PST)
From: Fabio Porcedda <fabio.porcedda@gmail.com>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org,
	mhi@lists.linux.dev,
	Daniele Palmas <dnlplm@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Fabio Porcedda <fabio.porcedda@gmail.com>
Subject: [PATCH 6.12 2/2] bus: mhi: host: pci_generic: Add Telit FN990B40 modem support
Date: Wed,  3 Dec 2025 14:53:53 +0100
Message-ID: <5091bf715f9ecf449b270af23352be15e4560df7.1764769310.git.fabio.porcedda@gmail.com>
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

commit 00559ba3ae740e7544b48fb509b2b97f56615892 upstream.

Add SDX72 based modem Telit FN990B40, reusing FN920C04 configuration.

01:00.0 Unassigned class [ff00]: Qualcomm Device 0309
        Subsystem: Device 1c5d:201a

Signed-off-by: Daniele Palmas <dnlplm@gmail.com>
[mani: added sdx72 in the comment to identify the chipset]
Signed-off-by: Manivannan Sadhasivam <mani@kernel.org>
Link: https://patch.msgid.link/20250716091836.999364-1-dnlplm@gmail.com
Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 drivers/bus/mhi/host/pci_generic.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index b8520ca40e8c..abf070760d68 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -734,6 +734,16 @@ static const struct mhi_pci_dev_info mhi_telit_fn920c04_info = {
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
@@ -779,6 +789,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
 		.driver_data = (kernel_ulong_t) &mhi_telit_fe990a_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0308),
 		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx65_info },
+	/* Telit FN990B40 (sdx72) */
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0309, 0x1c5d, 0x201a),
+		.driver_data = (kernel_ulong_t) &mhi_telit_fn990b40_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0309),
 		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx75_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QUECTEL, 0x1001), /* EM120R-GL (sdx24) */
-- 
2.52.0

