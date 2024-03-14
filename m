Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCBC7441E
	for <mhi@lists.linux.dev>; Thu, 14 Mar 2024 15:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710429872; cv=none; b=Ugt3jJuuJJsS9CRs54DEgBAFKnLwaLyVIZRlBb1sCCXyS5t5gxadpIdUWerBGKsEAnB5kqnZnulZvUdXl4bO84OPhPZ+y4rciRpP31Nr5Skdry+ldP9Jghi3psExklnwQ1ZLE+uJ7pgyXkgqZApard+FxLNmV3P7jY97w1wKQ5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710429872; c=relaxed/simple;
	bh=CBpicfl2jZnCC76RyM7G2pppIecHVAKp449ulgCHbMc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c7yjo5hIiAZIxCB2ceR5Vbx3cabCdyZ43kjvJYueveELI0oIy84L1kyJOBFMaouLNZezGL4r61KDwCxZdfsmWLLk7VohUqC0wNB1267lSMq5ZzZF3fanndIssFeU5xijnMWCS/GacrheynYiHbURIgzSILIoe7TdtONxd7xCFx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZfnuYTOg; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZfnuYTOg"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6e4d48a5823so925631b3a.1
        for <mhi@lists.linux.dev>; Thu, 14 Mar 2024 08:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710429869; x=1711034669; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8ZKNFv7W+z0Jmquv6Bh6TAujvuXFvLOzGspkZq/gQ/k=;
        b=ZfnuYTOgyiNUTGik0StYuJb52MMn9BHb0K8BQy4+gSfnamCy1oU6kC8lLxsvcPBGlR
         Buuhg0+R/h4iCSgH6hy+h/bW99OmxJ+xddw4tApIBrt5v+yEt1Br1gzo//urlYA0VUE1
         CPbAG3GfzrxJ3+imqkUAtnV4qIK4wvY9wx4z4og/XFQcQS5qf1LUUsLtURXSpiB1SCBs
         ORb/qUO3ePw8xmdi/Ukv1UOjoVdMhpXs+vV3VbCIwCGnIeD9e0XvSA9eFbtVsrJnkA4c
         mOn1Vy+Bs8BrNJzXaqINRn0mFiCSRrdksw3zSi2HnK37sydXb1FgkVthhl4g3L5BWgsr
         h26A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710429869; x=1711034669;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ZKNFv7W+z0Jmquv6Bh6TAujvuXFvLOzGspkZq/gQ/k=;
        b=R6CMIDzagJsa3LnNxqXf1iyBLCyZ6F67ANvANmCk+0ju7guTBomUEICqLQDZqnG9Us
         gd3G4ogvXNfRQbz0EzECg6ONCyys82mR9Q1CDiUc5KwJhggUhUaIBFyWHlb+LSRRhhVs
         AWZBZfiENEuyL+XxdmexJns/uSlbZV4A7nMhCpEmEzDGjAST0oh0lPSWiBG3aewctg4m
         F63sWhgaVtW5yGK8pMsHS8htYe2tPFnKOqZZtJhXdSBMKWnNnA7YVfChiqie+6RRYPyX
         jdFjSHFs0w5tQkEDOuNmlv4Rcu5sFH/7CYH8maXGdDv+pM0WDO/a1ZkNJvRhqeDVQD1R
         ClaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUg5uaJ/COvOegsXUz/P2NIHEaz8aofH/Myzkge6YKi1Ggy1lnJLiG9TselgNOtgYfUqntf6WeErFTjrkZZ83Zeg/K
X-Gm-Message-State: AOJu0YxpxMfw2Fn1ptO2BXrXZRglqLSZpW8nQpWNfDB55M2Epfalms/C
	NsDJGNqE/SFtKvZ7RznQ1zW/zuQV1NLDftshmVdRio3+3dHZo3xqyae1uO+Srw==
X-Google-Smtp-Source: AGHT+IF66n5aH76Dwfjq/9Zk53tqHbvE+/63K2G3MyytOYMIznHuwCihGVuqIpBwIw1J3oOM+HPzWg==
X-Received: by 2002:a05:6a20:12d5:b0:1a1:8c2f:39d7 with SMTP id v21-20020a056a2012d500b001a18c2f39d7mr465209pzg.34.1710429868800;
        Thu, 14 Mar 2024 08:24:28 -0700 (PDT)
Received: from [127.0.1.1] ([117.207.30.211])
        by smtp.gmail.com with ESMTPSA id m4-20020a63ed44000000b005e438ea2a5asm824021pgk.53.2024.03.14.08.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 08:24:28 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Thu, 14 Mar 2024 20:53:44 +0530
Subject: [PATCH 05/11] PCI: epf-{mhi/test}: Move DMA initialization to EPC
 init callback
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240314-pci-epf-rework-v1-5-6134e6c1d491@linaro.org>
References: <20240314-pci-epf-rework-v1-0-6134e6c1d491@linaro.org>
In-Reply-To: <20240314-pci-epf-rework-v1-0-6134e6c1d491@linaro.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Jingoo Han <jingoohan1@gmail.com>, 
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mhi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2468;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=CBpicfl2jZnCC76RyM7G2pppIecHVAKp449ulgCHbMc=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl8xaP+o8zfBr0UizIqcxCHqrxTSXAATyIlsJwT
 F6IqVxYZHeJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZfMWjwAKCRBVnxHm/pHO
 9TJPB/9+jDVZAzNzQ64Fun9kiNXglbqEvRtb92z/JqLw9+ncYlfS3fJEf98CKNoFgGr6bDjyT9C
 kK6apBbEDwcNZ2WIi5QGuvdXuU7aVl/pP3+qkOlNSvWdBuxMvfcJZieT794IBIpvrUwVcf6/l/5
 KvFbJlU8lNGlsVsX93cr/vWPtE0f3zNv+C0tIdesuuPz/6jynH7Ib78QbuagPs7sHzLxB33uIC9
 ZeJ0qDsORVdgZOUqroJ8nqIsepuYBIKq3c5gkyGj+jHDZlrREvJT+YQDuxCAoUCasTmtFmMTesO
 7GU9Rn5mXuGwvyVlF6EaE+/8SWzr/xb/wGWDiS6lZIoZy5N0
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

To maintain uniformity across EPF drivers, let's move the DMA
initialization to EPC init callback. This will also allow us to deinit DMA
during PERST# assert in the further commits.

For EPC drivers without PERST#, DMA deinit will only happen during driver
unbind.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/endpoint/functions/pci-epf-mhi.c  | 16 ++++++++--------
 drivers/pci/endpoint/functions/pci-epf-test.c | 12 ++++++------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/pci/endpoint/functions/pci-epf-mhi.c b/drivers/pci/endpoint/functions/pci-epf-mhi.c
index da894a9a447e..4e4300efd9d7 100644
--- a/drivers/pci/endpoint/functions/pci-epf-mhi.c
+++ b/drivers/pci/endpoint/functions/pci-epf-mhi.c
@@ -737,6 +737,14 @@ static int pci_epf_mhi_epc_init(struct pci_epf *epf)
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
 
@@ -749,14 +757,6 @@ static int pci_epf_mhi_link_up(struct pci_epf *epf)
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
index 2fac36553633..8f1e0cb08814 100644
--- a/drivers/pci/endpoint/functions/pci-epf-test.c
+++ b/drivers/pci/endpoint/functions/pci-epf-test.c
@@ -753,6 +753,12 @@ static int pci_epf_test_epc_init(struct pci_epf *epf)
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
@@ -942,12 +948,6 @@ static int pci_epf_test_bind(struct pci_epf *epf)
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

