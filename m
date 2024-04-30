Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529553FE2E
	for <mhi@lists.linux.dev>; Tue, 30 Apr 2024 06:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714457663; cv=none; b=KZnp6s3PwvO3njBdhmNNeNaj8A9/cV3J1pe9xf18LJiHMdRAzaZ00pl1SIqauCnogERtRYOJ49wA4C5b2fCcyxs9Qv342m4RO2+DRMw0VsLf9mUPp6JWsjxSknUP5+/RcF+q1OgxdQ1qu+lw3qtz/nGudOLiWdOAJD/I+7LXExs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714457663; c=relaxed/simple;
	bh=fxOFlEqrH8s0NmdUpIncfdRJDV9aXSUPg8/Z2JiONmY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p0zkccOc1dCgoJn175a85Sc9dL7LoulSy50i+vcbOOUUE7IovjdU9UcLQ8svwNWN7NC4CW0G3ImDYrMszdvYHtkkAd1ENbSLy8zfKESRHvCaDEm8aNDTi1VpqtI524JHV5ZobnJ3ZC1En+yS2nQZkl6vDvP0pfJEY3NJqIStlL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SZj4C3Ew; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SZj4C3Ew"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1ec44cf691aso1373875ad.0
        for <mhi@lists.linux.dev>; Mon, 29 Apr 2024 23:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714457662; x=1715062462; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u+LhLTTRlVPNIxUlsbxDURUHk794oxoOs4EVupx50CU=;
        b=SZj4C3Ew809Z4XIo3SXGImeT6rFGUnxs8ILJLUETC4DjgbYZY9PBqI1iuw1CGNh/0C
         r7QCwxs7f8/JCjKa3xSzFcwpVYuNuk8+V4sfkqws+/kPOpjxaQdj0zs2iPUmAq6odlcZ
         zk+f5lCJMhgunwuks1o7L3F2LiM0C+C6+SHtobfDwUDkERmcnrN86Jl8sMn+JLyEExW8
         8q3NFGaVjECFnICCQimVtZpeZjWkNv2DQzD4IQYUXvxcexgBhjs1RlRyES4+TB4yEK5+
         0ppg/6aB460qJpPdAXnua3nsbS/4tYaU5rc8gSqc1nnuj/PcWiNpMH3qMr5O1xx1s05K
         cjjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714457662; x=1715062462;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u+LhLTTRlVPNIxUlsbxDURUHk794oxoOs4EVupx50CU=;
        b=jFrFh3e0DnV1mdSQmAFI7Y2oi6zFgqv0iMFoAlvTRwrzEIVHhOR76HjzSQAzrZQekl
         z/eUriumk1oRJrn+NtP5q2ubpJD4OONat4RZEe5SrpuzQMoo05PBNVCF9S5yXLlYL+Td
         wPctmhEWA5IazTS/xiWwbOzehQgnjfx4B+QNTc0KE6xe34fRtZrHcX0KUKndYbrsF3G+
         tPGPEDhofMazLhlVDEjjBJfC3FGnTO+a7pN4hTfaMg4UUIjLSnrE9mRKxEaJhVrOrkWZ
         6H3d2/cWw5A4G/uBbqBQz5mpVkhMzF0Z3yZS2Cgc/j16Y01kUJZ7Q+0RxXLOp6gFvdOT
         nVXg==
X-Forwarded-Encrypted: i=1; AJvYcCWfjNc630iGJz+F/i8cQp3ZJapGjVG6xrXDQoTPF2X1Y9G4y2E+gF+f5tApQa3z3FEXKIXEJoUknkvaV6OmHmdBNY0I
X-Gm-Message-State: AOJu0Yx1wfsp72st/rnmKVgrJhH3QWvIdShy42+XWHdBRRqXjPMkcq6o
	tDg+RHQTIFkdDvz+hZCESFnBNm6V5QzjnTL7YqojtJLRFnm62d+xPT9cTOX13A==
X-Google-Smtp-Source: AGHT+IFWlPaXe3kuXbbaQlVjvn0iudNPxNrJncJAz+KnsWqRTsjZxYwDlzmEsK2RjGwFICO+fhb75A==
X-Received: by 2002:a17:902:ee85:b0:1e4:3909:47e9 with SMTP id a5-20020a170902ee8500b001e4390947e9mr1978403pld.11.1714457661486;
        Mon, 29 Apr 2024 23:14:21 -0700 (PDT)
Received: from [127.0.1.1] ([220.158.156.15])
        by smtp.gmail.com with ESMTPSA id bi2-20020a170902bf0200b001e27ad5199csm21393298plb.281.2024.04.29.23.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 23:14:21 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Tue, 30 Apr 2024 11:43:47 +0530
Subject: [PATCH v4 06/10] PCI: endpoint: pci-epf-{mhi/test}: Move DMA
 initialization to EPC init callback
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240430-pci-epf-rework-v4-6-22832d0d456f@linaro.org>
References: <20240430-pci-epf-rework-v4-0-22832d0d456f@linaro.org>
In-Reply-To: <20240430-pci-epf-rework-v4-0-22832d0d456f@linaro.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mhi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, Niklas Cassel <cassel@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2562;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=fxOFlEqrH8s0NmdUpIncfdRJDV9aXSUPg8/Z2JiONmY=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBmMIwck7CQqxzGBBs27ekqmsyQcFl5lEyaDCdB8
 8krlBTAf++JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZjCMHAAKCRBVnxHm/pHO
 9QUzCACfAYietdg49h4Io7A9JcQicHUuAGWxbqV4vUVXxeXJtCl6Miy+KCY5XHgGfOgjQtuZvXm
 zvS6jYckAS2N4pvESS0iQlIDy9luPOi0FObpSjpHGWDUabNNjqMIo9CBT+aJartV64WtMWkiwcU
 RGyqedqiMsrit5fYARIa+aBaDTHJaR72PchxxQCcybCBFi2VxP7VfFNzMfOZTyt+uS2FlVRqEe0
 2k1l9TA8KiH8iEx46IL1N6Fy9GsMuJg+yp0McCsDyhEZ2NutAjxigxr7iXRUe+Q0yQnEqHptit1
 go5SFswb1gMp4kr4mCLqpIsVNRVcgVrE/dsmada8hKq3phx3
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

To maintain uniformity across EPF drivers, let's move the DMA
initialization to EPC init callback. This will also allow us to deinit DMA
during PERST# assert in the further commits.

For EPC drivers without PERST#, DMA deinit will only happen during driver
unbind.

Reviewed-by: Niklas Cassel <cassel@kernel.org>
Tested-by: Niklas Cassel <cassel@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/endpoint/functions/pci-epf-mhi.c  | 16 ++++++++--------
 drivers/pci/endpoint/functions/pci-epf-test.c | 12 ++++++------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/pci/endpoint/functions/pci-epf-mhi.c b/drivers/pci/endpoint/functions/pci-epf-mhi.c
index b662905e2532..205c02953f25 100644
--- a/drivers/pci/endpoint/functions/pci-epf-mhi.c
+++ b/drivers/pci/endpoint/functions/pci-epf-mhi.c
@@ -753,6 +753,14 @@ static int pci_epf_mhi_epc_init(struct pci_epf *epf)
 	if (!epf_mhi->epc_features)
 		return -ENODATA;
 
+	if (info->flags & MHI_EPF_USE_DMA) {
+		ret = pci_epf_mhi_dma_init(epf_mhi);
+		if (ret) {
+			dev_err(dev, "Failed to initialize DMA: %d\n", ret);
+			return ret;
+		}
+	}
+
 	return 0;
 }
 
@@ -765,14 +773,6 @@ static int pci_epf_mhi_link_up(struct pci_epf *epf)
 	struct device *dev = &epf->dev;
 	int ret;
 
-	if (info->flags & MHI_EPF_USE_DMA) {
-		ret = pci_epf_mhi_dma_init(epf_mhi);
-		if (ret) {
-			dev_err(dev, "Failed to initialize DMA: %d\n", ret);
-			return ret;
-		}
-	}
-
 	mhi_cntrl->mmio = epf_mhi->mmio;
 	mhi_cntrl->irq = epf_mhi->irq;
 	mhi_cntrl->mru = info->mru;
diff --git a/drivers/pci/endpoint/functions/pci-epf-test.c b/drivers/pci/endpoint/functions/pci-epf-test.c
index 2430384f9a89..ab714108dfdb 100644
--- a/drivers/pci/endpoint/functions/pci-epf-test.c
+++ b/drivers/pci/endpoint/functions/pci-epf-test.c
@@ -739,6 +739,12 @@ static int pci_epf_test_epc_init(struct pci_epf *epf)
 	bool msi_capable = true;
 	int ret;
 
+	epf_test->dma_supported = true;
+
+	ret = pci_epf_test_init_dma_chan(epf_test);
+	if (ret)
+		epf_test->dma_supported = false;
+
 	epc_features = pci_epc_get_features(epc, epf->func_no, epf->vfunc_no);
 	if (epc_features) {
 		msix_capable = epc_features->msix_capable;
@@ -895,12 +901,6 @@ static int pci_epf_test_bind(struct pci_epf *epf)
 	if (ret)
 		return ret;
 
-	epf_test->dma_supported = true;
-
-	ret = pci_epf_test_init_dma_chan(epf_test);
-	if (ret)
-		epf_test->dma_supported = false;
-
 	return 0;
 }
 

-- 
2.25.1

