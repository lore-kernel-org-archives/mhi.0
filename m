Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00E539856
	for <mhi@lists.linux.dev>; Mon, 26 Feb 2024 11:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708947482; cv=none; b=NiYHxX4kZ7yukWX+CbgmyQ06ASiTtcEPkiMMDVIeoIfMza/fqAu20JIIrZfysK7vT3wwRS6858ts7ut6gPaxggmjuRgfi8rZGSlZgTMVKZsj4sZAQCCyDflAaUkaLfP78bZ/z+Oow3idOrl5VFnsLM9f2ZFYepaWEPnkcSjB7Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708947482; c=relaxed/simple;
	bh=nHkU+s/hofqacaD6DKpKZMYQycR1YXGCRfONZEYjupQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hxEpWgXMEOqcOBX05ZDagRMEbEiw0dTqGPNAoEFrZ614CAMf8EIu+EDd/nB/JTunZ9VTrxJ8yP6is8kDT/WE68+z6taKBQD1QjLDovtIDb5lHIL+/X/V1I/4AD/7CC0b6tWR1ks9MHOj+Eja9uJRI5Yd04lnb2VX2YpIcINQOF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H3WeueLI; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H3WeueLI"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-787a8cc7d95so248798185a.0
        for <mhi@lists.linux.dev>; Mon, 26 Feb 2024 03:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708947480; x=1709552280; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MkHgfdlubDIZc6YiSfjHe4pC8mX8qCcfR0RdSpyweMY=;
        b=H3WeueLI3cKXKyO40QrTTqcaZEv7lMGi8lODviP9Gi9JZIWEeG/okAho4PYx7cJte4
         l05KlQv5EACoWxFVDksPYEHoWl+A7a69BkJSR1RCbreU9fhTj67x1VYg/MiUF4XmXm5c
         AZ+GcxRiK/5ZnfGnh8sJRxXEO0wz3ozOsXXDMiFzwl7sz9E5PQms0+Qff5SS0mAodJqX
         O/mpIpo2ib0W5eOk9Ft0YHDitRUctXV82YnnRQaQg2z02qE5a4hZn1VB1s4Bj24/ax0s
         B42TRD+etzrHl8fQeSs5ZRGnAtbOfXiJbzV9MbjV8lwNgbEEbBUKd2f/skWrre+ROPV5
         mJSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708947480; x=1709552280;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MkHgfdlubDIZc6YiSfjHe4pC8mX8qCcfR0RdSpyweMY=;
        b=dVnJxlx2wWmm9f+4WasoCWXZRf7UmLy0Y+4tRnW/K54mwRW4eml7KXG5iCaV2F+tHi
         1dCyx9XcI0czvAHZYWc4S01Cs2kUV2K49Q98fSwG7zHUg3gE/eoBzdLQ57ELlEAuImmg
         iA4tldmJ8OTJXA8SRgd4TDsPIbpD/BfP3q6/WF2TGL5feW/MuAZ1Sob+H8ak4Tuy4msd
         9OOvg0CjQRx+ByhnGXSa+qDJAw3TNUtGzv3SrsswY6TbXHO2OxwkVAJuigHwulinKQPr
         bfWuF3XdvLJj6Si1pyW+p/h9vmlj2v6ZAXX35Oscu+oAGezj/e5vyel05WelXx6X8aug
         vlxw==
X-Forwarded-Encrypted: i=1; AJvYcCXdKnTU3IhoC1NSRAFL3KHa6HSwko2Jz728g4zm7hu2mMEwjREDfU44hj45DD0k2Xj6+65xf1wLoVzygIs6v6j2gYoS
X-Gm-Message-State: AOJu0YxbB0vH9iZpmTZAfKEONlCId24HiUUK9r1VwiR3CVbXx6nXpoSY
	mTs8utuSQGOnEQl8hbZ1R6sFxkPHshV90ASMUnOSaeXIK34m+3b5LI+V9p5r7w==
X-Google-Smtp-Source: AGHT+IGPmvmoIeAgzVE7znxhwcyGl4vLUPNeK2hT4NfYJOQM/VYz+VPl0uXr2ByjXdUb0go/U4WAjg==
X-Received: by 2002:a05:620a:a09:b0:787:bd2f:e30d with SMTP id i9-20020a05620a0a0900b00787bd2fe30dmr12995662qka.19.1708947479856;
        Mon, 26 Feb 2024 03:37:59 -0800 (PST)
Received: from [127.0.1.1] ([117.202.184.81])
        by smtp.gmail.com with ESMTPSA id q15-20020a05620a0c8f00b007878babb96asm2341842qki.94.2024.02.26.03.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 03:37:59 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Mon, 26 Feb 2024 17:07:27 +0530
Subject: [PATCH v3 2/5] PCI: dwc: Skip finding eDMA channels count if glue
 drivers have passed them
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-dw-hdma-v3-2-cfcb8171fc24@linaro.org>
References: <20240226-dw-hdma-v3-0-cfcb8171fc24@linaro.org>
In-Reply-To: <20240226-dw-hdma-v3-0-cfcb8171fc24@linaro.org>
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
 Siddharth Vadapalli <s-vadapalli@ti.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1982;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=nHkU+s/hofqacaD6DKpKZMYQycR1YXGCRfONZEYjupQ=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl3HgF/rASIKBtYR+ctXJQGfZnVs/PLtISbbelP
 4j25M3FMvCJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZdx4BQAKCRBVnxHm/pHO
 9RAEB/0f+JgPn81KF1QoksP35fTFnUOaahH5T1Ggq54hdmm83UwdirBwQRPYJoo83ttnBr0g+tG
 mBgVdFOBCPSBv1ccH+TL3DJy1AEXKyLh3cZ8Kdaf79ZoEGpjrjCDQvj2qcRfD5yEeXjMgvjREpJ
 nmB3ENkWrQsx71qOeeXlq+zoAswDcGaM27iZr01yxP2xOKJyudftYZoINsGwVzqcAqf/WZ7RUtd
 /57hoXRwB8kDATQEWBFlAMlchTcTixFAgyeUw8iFxaJoRzziT/eyIFaLDEoHPU1cz7hlnx3bD1K
 P4UN5LN+i9ZoS+zGOWUkRM6SnJR1Ttljmp7hBiKlzj4fJogF
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
Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-designware.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
index 193fcd86cf93..ce273c3c5421 100644
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

