Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D316838DFC
	for <mhi@lists.linux.dev>; Tue, 30 Apr 2024 06:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714457656; cv=none; b=jwRcphpRbKQvMaFfpzn3QISQgOe5rB/Kuw/DEGF9JuCPpMFSZLzPBliROGv4+KvWk5rnW67/8L5bWB70Q3/B946WLGdVbxYkDduQjEAaCJEEm7yKruYhO072iu7NuUgGCywdAYJNTG92672/d6Y/wkgwNzJl4kvaowAtM4gkHbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714457656; c=relaxed/simple;
	bh=oU2zGIiFPGVtB03/PgwQpbKi9Fuvq0u/dW2DrTTfPTI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z3tP4SO6ItsZcdHCvgUiDVrVH0AdULZEPIxJyBQIV8/FetJWv3d4RfAlLgCNiiqBM6ZVDkhUHPTPnxXG/Aa4EvCeF9kh/rNTjBRSBGlP2xVqFKSFAvym/STyqfH+L45TJ7xtKw9Ab9umbYUd+SoAaAcuc9jzSrKv9MA9+9YvtWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vrYhnPo0; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vrYhnPo0"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1eab16dcfd8so45597075ad.0
        for <mhi@lists.linux.dev>; Mon, 29 Apr 2024 23:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714457653; x=1715062453; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Qc41MgSnlAlN8GJf3G4R2xizfhgFiDGpk5F5rdug0A=;
        b=vrYhnPo0UXQLy71rTzeYxzC/d7T+1kDlzdiBYqtJLoj16nU970bhILN7/9K/6ZtPms
         kT/hQLZ7NNbhLq/BwzZnmjRLoaLBQEhC6dwTcQQXdBKtZfIim0w+0IeWr1wtwPThbsMG
         JDvzqDnStQ9Jx+ZoGBPKo51dnhq+s7nYQAePjAz+agInsgmwwxQuXqPIjyUWA1v9nphp
         ofHuSOoh5U7UBzn35fVIhfr6qQqFzY2QpPzkEXQkpJlp4adBCG2cgFh7PTxWX2a2z66d
         KVpcoRXBSDLOlh7D/kiJFl17TRP1d5WRicTVHWuS9HOQBbHuehyqM8hzos/S9szME9p9
         gTug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714457653; x=1715062453;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Qc41MgSnlAlN8GJf3G4R2xizfhgFiDGpk5F5rdug0A=;
        b=UuGucDqG3WmhDnrrJoDzGoTKFCDCf+k3Oi5ip8Br95pYFfcVPCUKgHO2yiFjB0VDZG
         VlHDPNvD585IahqgiBSAvex1yeQTYa+rHECfFyXr/jV3GSvcFFOd2f4efktTL7Gm8cHQ
         /gXvoJ9Z1pVWlC+YmjGAeHvyTs/2O/ScgYMAneUA+aSCPxtFhAZf6SS9NJzlSUnPZnFO
         0fJ/Pz0Rtm9YYAZa3vXfxBy5v9fK0AbcbnJm6sZz/swHjZxlaLJZMX03hbPezIHxS4sY
         llCC3YznIwN0m+MJUgqyHYHSP2ra3C7Xwr8Ht3As3v2+rFa/F+n91F5NAkwcnlfG9C8t
         HZOw==
X-Forwarded-Encrypted: i=1; AJvYcCUYcN4vHkUOtY6PnnZpKQt2Fv1ma7Ly3K/AwPEpqCYSkZLaTVSssL721XbRCV4X+wttQ+4FV8AYItkQWNMCl9XrjycZ
X-Gm-Message-State: AOJu0YzOnz5Ko6ZXUpu4D/iKjfClOgD6dQqDin/ZubPWG5hEtJFBgTYe
	mHGN4yOODi/NM02Ru5aZ8QJVoKAKii78va3367d3BdxWniilwFNx46qZw6lPxQ==
X-Google-Smtp-Source: AGHT+IGNkX2KfxzpxFsv4vcjdwa2UrLryt0PGxLjlOXFlzKdYsy1WviVaOAyHt9CqF0GaAoMsDzcrA==
X-Received: by 2002:a17:903:187:b0:1e5:a3b2:4ba3 with SMTP id z7-20020a170903018700b001e5a3b24ba3mr12980354plg.56.1714457651066;
        Mon, 29 Apr 2024 23:14:11 -0700 (PDT)
Received: from [127.0.1.1] ([220.158.156.15])
        by smtp.gmail.com with ESMTPSA id bi2-20020a170902bf0200b001e27ad5199csm21393298plb.281.2024.04.29.23.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 23:14:10 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Tue, 30 Apr 2024 11:43:45 +0530
Subject: [PATCH v4 04/10] PCI: qcom-ep: Drop 'Link is enabled' from the
 debug message for BME event
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240430-pci-epf-rework-v4-4-22832d0d456f@linaro.org>
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
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Bjorn Helgaas <helgaas@kernel.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1225;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=oU2zGIiFPGVtB03/PgwQpbKi9Fuvq0u/dW2DrTTfPTI=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBmMIwbP0YCI/ZYbaovtlyprT7opKsvmn8IdjyRm
 Gd98arawG2JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZjCMGwAKCRBVnxHm/pHO
 9cLrCACdN3F3bQBncs69QWwIB672VV3E8QT3cBx36vDSp1/ifbMIuD1IqNptAyGEI6yC41YlbpF
 AtEuJX4ci9QQIIyb24g19PTJSGngnOf8T4cga/axBbd9T7wI0J3m4ZUDrXZFcmSMXLapLPvTVbt
 CN74D4CJTVnfDr3PD7Idq1PVKo+fULpbNDfKyMvABx+OTDTuNa2F/9UX4fPZf3cYJefXAgB8ZFM
 pGIalE/c1KTZIJoToV2F+LJRRdFa8q5f/QAmRu/xocXjuMJMrRDkN9REGPMcW26WNw718J9n6e7
 QuU4d1BW9lFmsOxeAlHfZ6HNL78eDwD3eZ/ivim0xuxIjYjD
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

Bus Master Enable (BME) event that is generated by the Qcom PCIe EP
controller due to host setting the Bus Master Enable bit in the Command
register doesn't have anything to do with the PCIe link.

Hence, drop the bogus statement.

Suggested-by: Bjorn Helgaas <helgaas@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom-ep.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index f6e925d434f6..dcac177b55fb 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -636,7 +636,7 @@ static irqreturn_t qcom_pcie_ep_global_irq_thread(int irq, void *data)
 		pcie_ep->link_status = QCOM_PCIE_EP_LINK_DOWN;
 		pci_epc_linkdown(pci->ep.epc);
 	} else if (FIELD_GET(PARF_INT_ALL_BME, status)) {
-		dev_dbg(dev, "Received Bus Master Enable event. Link is enabled!\n");
+		dev_dbg(dev, "Received Bus Master Enable event\n");
 		pcie_ep->link_status = QCOM_PCIE_EP_LINK_ENABLED;
 		qcom_pcie_ep_icc_update(pcie_ep);
 		pci_epc_bus_master_enable_notify(pci->ep.epc);

-- 
2.25.1

