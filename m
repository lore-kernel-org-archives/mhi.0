Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FD91332AF
	for <mhi@lists.linux.dev>; Fri, 16 Feb 2024 17:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708104910; cv=none; b=rStUpnNz1lkebn06qAT/JMJ0atO72uE3nN6tDuwD4fASgghiAIaaSMmVNSwFfBpL97yjWs+ri4ALheDh/shaFBuFAxkcTQmOLMOxdYCZ/zjoaOorYOvZZQI427ExYCgfx1a4GBAT6kTQY18kwyCT+FDPug8Vm1v3WxxhW81KiUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708104910; c=relaxed/simple;
	bh=RekqSZtiSMFVKlk/3EkQASVDRUVZ9OTERPK+baLtHhE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RDQcd6K03FOG6mWVYEClSv2d7q6idbvbULgDw8MxQAhT8d8Oa4RD4yPLD5V8uhFvojrjcWMzxdnVtl22FLf0JlCARme1Tg2iMBYAPRKcVsHXaHXniqGrNM/H2UI7b2ixa4GURFxSpn31LS605gl84cAvB3bx8Nr7O3svj2b/nzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=INnlxmxO; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="INnlxmxO"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-5dcc4076c13so925967a12.0
        for <mhi@lists.linux.dev>; Fri, 16 Feb 2024 09:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708104908; x=1708709708; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xammFEIqB1ELfrS5tvbq4AnuR2HTos7f1tV8KUMgLV4=;
        b=INnlxmxOmBcrgKqaxt8akNtTgrTzXRHeTQDKheiiOxMZ0wqzXSfNBe2MipwX5fKVTK
         9xqbrttIPGq5FMyp1kjNpDgzYJMqs+gtGmHx44RR4SC7Q/Og0WCzgOcs7xdTbhhHFDgZ
         zpsqhxVkLKwoQU/LCJOF2KMqgL5J8+2tD01ME5ersxezXBEUHEn/EraYlzFLBpba5ZCa
         iperPmKABudz7O1rfYKvdIFYx9Ev7ff6eS5esyoPh9cSn7xSqVxGOXfkY4XWdVWEBwwZ
         ACcBQL1K71pbA2LACbD1pU3uzpTjPxaqkrieFRHENcblUVeWRIKZPNdrvGxNoB0WsMIf
         L+xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708104908; x=1708709708;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xammFEIqB1ELfrS5tvbq4AnuR2HTos7f1tV8KUMgLV4=;
        b=aI7IW/o97HQ6B5Mcl1NZj3GCPLSeZDOwAXQ3cfwPPEOlj87IcYyenzFL/XaVRpeNGL
         U5cl7pnPuFoMsXEKEWmhymlJ3CDrjR3HzPX/ctkU96lDncxLfgyBOMaSV4tJ+3Rv6L4+
         DjYApQdRMOdTlq3WHM1vFR6uP9GKtywXAf3bGKujz3xiQvk3NaUFruxgw2tFp8bQIr36
         oV3uP9vS4ZKXrPUdC3p3DGGVoYdkt+CwE1ryxYebww6vtOyMcwoQqHhjhP9yxB+4hIbf
         htgi6ykQOL2VZ+V7PSp6UDH6oofrGHD/KohVIOO3m7Z59Ysc4h7e+AV2zV4I2lX3XCKR
         wZIQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5M2O6kYbWk/W420LKQOlS5cTk/wRrLGoS8+hsVxt7AoxWV6iMB70GMUWN0IWDVPTlQ85ibSGAyDdTfbQTbnwJhgvn
X-Gm-Message-State: AOJu0Yyy3hyyN0Yw/LmN+OW8dMy5Hjdf+DsTR0GCdYYAsF7KSzXjQ5Zf
	lph5SFP0uDxuLekHR6jLQMXiQfWNLoPTW1r4miS4Fu6/J//hEjsnWgnCf0cgsQ==
X-Google-Smtp-Source: AGHT+IFzBAuuPuQuLTiYxx+j7ldGM84RTYsglDp/i8J5dfiqMg2Ng/LJlGXbzuCaWcmDtmPzmK4jeg==
X-Received: by 2002:a17:902:dacc:b0:1db:b8dc:a016 with SMTP id q12-20020a170902dacc00b001dbb8dca016mr1379120plx.7.1708104907726;
        Fri, 16 Feb 2024 09:35:07 -0800 (PST)
Received: from [127.0.1.1] ([120.138.12.48])
        by smtp.gmail.com with ESMTPSA id v9-20020a170902b7c900b001db5241100fsm118592plz.183.2024.02.16.09.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 09:35:07 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Fri, 16 Feb 2024 23:04:41 +0530
Subject: [PATCH v2 2/5] PCI: dwc: Skip finding eDMA channels count if glue
 drivers have passed them
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240216-dw-hdma-v2-2-b42329003f43@linaro.org>
References: <20240216-dw-hdma-v2-0-b42329003f43@linaro.org>
In-Reply-To: <20240216-dw-hdma-v2-0-b42329003f43@linaro.org>
To: Jingoo Han <jingoohan1@gmail.com>, 
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Marek Vasut <marek.vasut+renesas@gmail.com>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Serge Semin <fancer.lancer@gmail.com>, linux-pci@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1927;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=RekqSZtiSMFVKlk/3EkQASVDRUVZ9OTERPK+baLtHhE=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBlz5y9/dWOuITX0EUn0FvBzx7o7bYPq2sZ8rd6q
 kD80Y0LWmeJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZc+cvQAKCRBVnxHm/pHO
 9fm+CACfgHz+JvCH4MmxxLzx+X9AeL4F72MbLIqnXLvjCirHbczvAebR7r+yhtXRUQZrW8pABKb
 dEEbsW9yeC4uZGj8aeX9HLzfyUS1eCLIefMV2CTm+K/OiV0HlsY9xvWwxuxmqfEb/71eo1hnSXU
 d4QqxAFnw+JMN6csdpz6mood7odPKeTbAlxDnbdSuYw9lHzACeDXsVMjyANSnLAwd+B6LK9JWAV
 +ClaAClq6lmt67AY+JMZ5yOjztGgnPBYaRarTTfAUa9rY8zVpjrh3UbcO01JVFb69+DQ4wmKgIl
 HI/URt8Q7o0QamMyaBg2ZyFodnp5SjhvSt8jJg/Vg47Tej2w
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

In the case of Hyper DMA (HDMA) present in DWC controllers, there is no way
the drivers can auto detect the number of read/write channels as like its
predecessor embedded DMA (eDMA). So the glue drivers making use of HDMA
have to pass the channels count during probe.

To accommodate that, let's skip finding the channels if the channels count
were already passed by glue drivers. If the channels count passed were
wrong in any form, then the existing sanity check will catch it.

Suggested-by: Serge Semin <fancer.lancer@gmail.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-designware.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
index 3a26dfc5368f..d07747b75947 100644
--- a/drivers/pci/controller/dwc/pcie-designware.c
+++ b/drivers/pci/controller/dwc/pcie-designware.c
@@ -927,13 +927,15 @@ static int dw_pcie_edma_find_channels(struct dw_pcie *pci)
 {
 	u32 val;
 
-	if (pci->edma.mf == EDMA_MF_EDMA_LEGACY)
-		val = dw_pcie_readl_dbi(pci, PCIE_DMA_VIEWPORT_BASE + PCIE_DMA_CTRL);
-	else
-		val = dw_pcie_readl_dma(pci, PCIE_DMA_CTRL);
-
-	pci->edma.ll_wr_cnt = FIELD_GET(PCIE_DMA_NUM_WR_CHAN, val);
-	pci->edma.ll_rd_cnt = FIELD_GET(PCIE_DMA_NUM_RD_CHAN, val);
+	if (!pci->edma.ll_wr_cnt || !pci->edma.ll_rd_cnt) {
+		if (pci->edma.mf == EDMA_MF_EDMA_LEGACY)
+			val = dw_pcie_readl_dbi(pci, PCIE_DMA_VIEWPORT_BASE + PCIE_DMA_CTRL);
+		else
+			val = dw_pcie_readl_dma(pci, PCIE_DMA_CTRL);
+
+		pci->edma.ll_wr_cnt = FIELD_GET(PCIE_DMA_NUM_WR_CHAN, val);
+		pci->edma.ll_rd_cnt = FIELD_GET(PCIE_DMA_NUM_RD_CHAN, val);
+	}
 
 	/* Sanity check the channels count if the mapping was incorrect */
 	if (!pci->edma.ll_wr_cnt || pci->edma.ll_wr_cnt > EDMA_MAX_WR_CH ||

-- 
2.25.1

