Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064E123746
	for <mhi@lists.linux.dev>; Fri,  4 Oct 2024 02:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728009244; cv=none; b=sPFOx0KzEOlOs8qu+XaDJTcsN9jB4/qS4SRfzagLYnM/Ez4G303CtXjgVhaJTdcWgQXw90LZ6VWMV9i1shCljm6Uzoh4CHEXyqxOZTP1s44JwFe1tFfZpuW/af8fqYa5hqQpaXdOIefbHhNZZumrq6CYy7zxov/GgraB2oeJ9mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728009244; c=relaxed/simple;
	bh=dbCuEJvEVy7YBDG6K3ryuaINHgFsf6v50vwWGbHLnKk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UKroqg83f3vFeLnDbRK10Rh5mQuxUIhvoqMkdHO18vkSJB/wsONpXk/5uwZcTGv9eBFZGCOjhGBRm5jI73BvGXyfI3E1yhxc0829WGskJ1hW0PlUaJ96x+/yPFT09ELjDOZKwVYgLko7Hsv/H1dlCYav5rb6L29pnob6R2nR/0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G7oK+O/f; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G7oK+O/f"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-71de9e1f431so31981b3a.3
        for <mhi@lists.linux.dev>; Thu, 03 Oct 2024 19:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728009241; x=1728614041; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=du7/JNW+sZETMBVLzCx5tmC+OyPTiZDvBweNek+J/Aw=;
        b=G7oK+O/fH4scbmRHV8sdCkAI6FWEsrX3Vk2/kKNMq3D8qYLb600FofucgMq9xMj57W
         q4GNA08OmkMZ3Bimsdct5CQnGENgSQ/60Of+7nJjq9WDnZsu5CnOFkGgy/bbkCdOUx9k
         02SN5iaa1xm1q5wiAFgNMN76oiGwp7UIMP+bmNMuvbagpSg5+n2p+tDNtQdEE3YODy6L
         flXIeCcgyDUM6ZchvCZxbj4B9PjOSJAhA/uu9Q3HyBQxBL3WKJZ7ry9bPRMs560VzKBv
         ea3ftLwtiBQK7K7tswkDdNfBYv3vxdfkBVY4OCC7GXSHaksnxQZCJl26B6XcWoPyQxh+
         hPgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728009241; x=1728614041;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=du7/JNW+sZETMBVLzCx5tmC+OyPTiZDvBweNek+J/Aw=;
        b=WlvkwLqwpImQRBeXwAsgxyyowzFK1b1Kzt5qCaO/W1OLEgMZsQroIkzSFyBsAvD1og
         UUYME1A6hbOX4bgXWJjCK6J8QJkMfGx5NCw9Df84HLuyyZIt3k+RUrgWPVTkSNJd3aW6
         V01RFCLMVsDTfbc8hZHXK11p2eLHiVMudqHnATdDCl9tAeV1I+MjcbD4Q0FDw/Uyr6Ul
         3B5Ee4LmRuQWCq77etgh012wfNNduDRUGzT9knc+zhpydJ/upxZJ+rOrVHAOwWR+JPy9
         dMBX/dIFxDWtsg0Te35tCOOFPAXFa7V3BhSjbaQRcnjYna9jk5cg0WbZEeXFEVH0uVdd
         bDwQ==
X-Gm-Message-State: AOJu0Yzy/XOTCNSafaeybAgYG46dqN2k7rRdokuJbh9EdalDLrqT0Z0x
	aT29mS22v6XUIP3Q8zJunCajIOIQaUBzKhZ/gWrvjeRqTCYjFXKmUdNI9GbVgyVWm/vxO9YSocQ
	=
X-Google-Smtp-Source: AGHT+IEJLHXoyO1KJ5gqYKT2vrlKIjq3nJ/JcU72LMLiwqc0Zrq8Su6VykZ+KjqgevvyyKpX4ruZBg==
X-Received: by 2002:a05:6a20:c89c:b0:1d6:ded8:8f33 with SMTP id adf61e73a8af0-1d6dfa46be2mr1848311637.23.1728009241075;
        Thu, 03 Oct 2024 19:34:01 -0700 (PDT)
Received: from localhost.localdomain ([36.255.17.115])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71dd9d7e523sm2127696b3a.65.2024.10.03.19.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 19:33:59 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: mhi@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH] bus: mhi: host: pci_generic: Use pcim_iomap_region() to request and map MHI BAR
Date: Fri,  4 Oct 2024 08:03:51 +0530
Message-Id: <20241004023351.6946-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use of both pcim_iomap_regions() and pcim_iomap_table() APIs are
deprecated. Hence, switch to pcim_iomap_region() API which handles both the
request and map of the MHI BAR region.

Cc: Loic Poulain <loic.poulain@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---

Compile tested only.

 drivers/bus/mhi/host/pci_generic.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 9938bb034c1c..07645ce2119a 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -917,12 +917,12 @@ static int mhi_pci_claim(struct mhi_controller *mhi_cntrl,
 		return err;
 	}
 
-	err = pcim_iomap_regions(pdev, 1 << bar_num, pci_name(pdev));
-	if (err) {
+	mhi_cntrl->regs = pcim_iomap_region(pdev, 1 << bar_num, pci_name(pdev));
+	if (IS_ERR(mhi_cntrl->regs)) {
+		err = PTR_ERR(mhi_cntrl->regs);
 		dev_err(&pdev->dev, "failed to map pci region: %d\n", err);
 		return err;
 	}
-	mhi_cntrl->regs = pcim_iomap_table(pdev)[bar_num];
 	mhi_cntrl->reg_len = pci_resource_len(pdev, bar_num);
 
 	err = dma_set_mask_and_coherent(&pdev->dev, dma_mask);
-- 
2.25.1

