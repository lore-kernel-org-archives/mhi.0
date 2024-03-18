Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8AC22F17
	for <mhi@lists.linux.dev>; Mon, 18 Mar 2024 06:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710741897; cv=none; b=DZa6jP0jbe3jT5v0Ig3uQAAovSTDl5tWhuDr/6aEAc8HWmEVqO5E80+xCbXV8sj7o2ow5KEEUAl7JwrKVAW8KVfh3BqYoKgInjkKR3OSuocIJTWrzRyV/vic8K/4r6rKgVY8OWUI4xiBZnyIX5Jp1hLK0qRDjJChO3itnO4BqyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710741897; c=relaxed/simple;
	bh=Z8yc5kS/Xk3EUHfDIyIs2RMRtLJ4RDqGCzWQ1mNuKIw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nPwCW30FMIL0sGLczKfaODMy7Sf6x2z3/gM4MVdoDUwDIN2Dh6gO7fxrcGVUR0VLbfzZaboCrDuJTjiD84nLOYsZQ1iQcRddgrAhfoUAHZLK9D0Kb5Pxb7bXrMB7+G6BB2259lL16cBDDnRALUoyCww/PBkbPjuD2QzSHvigEY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nWn6yKSN; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nWn6yKSN"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6e622b46f45so2872779b3a.1
        for <mhi@lists.linux.dev>; Sun, 17 Mar 2024 23:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710741895; x=1711346695; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FTM5ZErKcaRFWc0GzJqy/id8CdgJhbx2a4ZepQEFvSI=;
        b=nWn6yKSNSeiRo/MRfGsLODhCCQGgGeBHzZ8NizqsmP01F8YQokYTtUWhHxZAa7wcCd
         SVNhVHjaxmcuVRfhJTLw9Bj9GlBCVCdndgaFBe19gGusRfQZj8X5UmfHQvRCj/4N4Own
         DzBd8irbunVt8hmjGnE/1IlYHnnpblwyNVqjq7Kcxx/PvemAdCthvkxVIywRkbh1T02o
         KL6SKCc8qWbXTUJRO100bJrYUmY1TD2pNlAlF5DdqHDZmeGrgVJKLhqZ8NZeWOFsP2Pp
         dK4O0k2vLpsByHOO5fg642aK+HMNDLn/s90a3y2VIb1L9vZLIqWWeb46wssr8cfXDD/N
         ejAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710741895; x=1711346695;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FTM5ZErKcaRFWc0GzJqy/id8CdgJhbx2a4ZepQEFvSI=;
        b=j8V65pJTvTwGBjsdv1bv4w/AxyMghYa06Jl4/pHdIDB6waiQVpec8IaVyAxpkxQ5OF
         SRP9jKjRmHToj33olNfW2ZuMDwME5nEaX78H6NGUcISygrhRvUflUhLYHJ4ZbVTIVSW5
         BKLRbIQNQMbDMsAyBHfHZEV4ulNsoghCZwzWoGJocxAd8RlzAhhDrqLKlVmrRFtVuk85
         qxyQ1GUeDEsbeGqjM7Uh7YMK7SDxbhW64o/Hmm3W25BoA/O1UkMHBP7t6MkjVKiqAV0r
         qteLL4D2YbeTLh8rLzbaq59l5VWa3KOSPCoLsGbmqMWb5EcPw09KvgklRHPKmfBQPag/
         fC5Q==
X-Forwarded-Encrypted: i=1; AJvYcCV36zaLM1o0xUhd4MkE/ay6/+qBkzw0ZRJ2+5IEhClZjFEUhr8iUVnfAoj4TvNF/ctX+QKwMj4uex+u4tGyNBiPXEpk
X-Gm-Message-State: AOJu0YzALqoTVloTSY15Pwkn70bWTu/E+sZVhCf/eiYGDSXyDog+//02
	WXwsX1sSboL8qi6wEJu9Hnsd/PCZTNlEkmOij3igUINKj2gyvLI7DYmSg7+PXw==
X-Google-Smtp-Source: AGHT+IHnEdlpqwSxdB8NU89n4D/kCtbLpMcmTwyraHnP8Wkb9MSrw7TZEgbRlT5Yb02IybzPYJ5M1g==
X-Received: by 2002:a05:6a00:2d0b:b0:6e5:736e:9e4c with SMTP id fa11-20020a056a002d0b00b006e5736e9e4cmr9952086pfb.29.1710741895486;
        Sun, 17 Mar 2024 23:04:55 -0700 (PDT)
Received: from [127.0.1.1] ([103.246.195.160])
        by smtp.gmail.com with ESMTPSA id p12-20020a62ab0c000000b006e6c5b065f5sm7064268pff.28.2024.03.17.23.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Mar 2024 23:04:55 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Mon, 18 Mar 2024 11:34:26 +0530
Subject: [PATCH v5 2/5] PCI: dwc: Skip finding eDMA channels count for HDMA
 platforms
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240318-dw-hdma-v5-2-f04c5cdde760@linaro.org>
References: <20240318-dw-hdma-v5-0-f04c5cdde760@linaro.org>
In-Reply-To: <20240318-dw-hdma-v5-0-f04c5cdde760@linaro.org>
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
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Siddharth Vadapalli <s-vadapalli@ti.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2178;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=Z8yc5kS/Xk3EUHfDIyIs2RMRtLJ4RDqGCzWQ1mNuKIw=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl99l3q47qkLp0U9npo6Py5yQ4OY+WK/EHpE3Yl
 4W6m1leXY2JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZffZdwAKCRBVnxHm/pHO
 9QUmB/46ll/6UrviIDKiSHi5sdZ/noJukn7at6SDWAZIY/BNdd50G5WLQ6/nNVf3eA/oUV97E2N
 lWIoVYJScC7suTJc/ZClLS0zLXElwMcGXJ4XobHQVgmtLqirIHX0U9Qk7NylcDe71hmGvF414/C
 6PcvFGinwyWE8IEqofam/rmPm6HkzG35+izBTnf8LG1AfDKtAiGt7EPpPEKUD9gKTptNQKtGuCY
 otQBBXdGaIIJUcYXGJB1yfTKMXNus2/02jl+hx+TiLmA4atTVeW+B0AywIgmpb/JthczOecMFZ2
 AFOisWnlY+z898Dflj0CJ6q9G0XjUMy6oUy7EM/tZ2l0uiay
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

In the case of Hyper DMA (HDMA) present in DWC controllers, there is no way
the drivers can auto detect the number of read/write channels as like its
predecessor embedded DMA (eDMA). So the glue drivers making use of HDMA
have to pass the channels count during probe.

To accommodate that, let's skip the existing auto detection of channels
count procedure for HDMA based platforms. If the channels count passed by
the glue drivers were wrong in any form, then the existing sanity check
will catch it.

Suggested-by: Serge Semin <fancer.lancer@gmail.com>
Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-designware.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
index e591c1cd1efb..d17549f67e72 100644
--- a/drivers/pci/controller/dwc/pcie-designware.c
+++ b/drivers/pci/controller/dwc/pcie-designware.c
@@ -927,10 +927,18 @@ static int dw_pcie_edma_find_channels(struct dw_pcie *pci)
 {
 	u32 val;
 
-	val = dw_pcie_readl_dma(pci, PCIE_DMA_CTRL);
+	/*
+	 * Autodetect the read/write channels count only for non-HDMA platforms.
+	 * HDMA platforms with native CSR mapping doesn't support autodetect,
+	 * so the glue drivers should've passed the valid count already. If not,
+	 * the below sanity check will catch it.
+	 */
+	if (pci->edma.mf != EDMA_MF_HDMA_NATIVE) {
+		val = dw_pcie_readl_dma(pci, PCIE_DMA_CTRL);
 
-	pci->edma.ll_wr_cnt = FIELD_GET(PCIE_DMA_NUM_WR_CHAN, val);
-	pci->edma.ll_rd_cnt = FIELD_GET(PCIE_DMA_NUM_RD_CHAN, val);
+		pci->edma.ll_wr_cnt = FIELD_GET(PCIE_DMA_NUM_WR_CHAN, val);
+		pci->edma.ll_rd_cnt = FIELD_GET(PCIE_DMA_NUM_RD_CHAN, val);
+	}
 
 	/* Sanity check the channels count if the mapping was incorrect */
 	if (!pci->edma.ll_wr_cnt || pci->edma.ll_wr_cnt > EDMA_MAX_WR_CH ||

-- 
2.25.1

