Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30CC271B2D
	for <mhi@lists.linux.dev>; Thu, 14 Mar 2024 15:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710429848; cv=none; b=ljnEQQj5OVnbxubFYosbBDtw2ZJB+0ht2Ovk0QX3pMFfr0NKJ4/itsiFE9fpYO5iF4ApRMmS5yJqMgOC8I55rwRVeldC5FCJx8OoBtr2Ovl2KYwC9+zmEbyjKf6bQynjVSF7qJS2vRJCAXQJd13ZMUCFIJ+AeWddVkm0dILOszA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710429848; c=relaxed/simple;
	bh=+XqMRpYE8HYIeYnArh9TOIJOZHL3dBFs8VCBPD9Q15c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=L57WF6vVbkt6CaL2NThk0ddWToP1DcPEY3thkY1j0K/vAkq/xtc705PeEykD6wdZ9EGSdbTR58pTN2em7tbxmk7vrxjcoUawBqp7jWVqTW0ReuNazXUnXlvlKBLEaHKUg6eO0D6m8vOgZ2MiBCasQttgYXIK3onEQX5XBoyFlZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wJ+HSJw+; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wJ+HSJw+"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6e6b6e000a4so885649b3a.0
        for <mhi@lists.linux.dev>; Thu, 14 Mar 2024 08:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710429846; x=1711034646; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uipF2nWjwEvJ8FinmI/99ZEfUz9FMdfPX7qMJmCrSQo=;
        b=wJ+HSJw+p2byaQgD5IFaNRXJicjcqJjAQxfoRrmBh2EOzgdgL9i/K1DMPm6V0wb4B9
         uUrfz5hZ0WY791IZyacAshqQB5Gm/LIRK+qw7yaSbzDOlhbDD9dL5bpwPu0CO+2ufmdU
         +pwmysE/wush/BCH2QbETz0vNL6aCVzr5CAVbrJ3KKVLsyMOWZaZ768CPvdofnrjlC9F
         jOZG6YB9YYsXxWeMZb1AWnA/WwQ024t+je9OqQWbqC/7uBT5j++jDMkHFA5e+mqys3lI
         ZXpxxbjFBtHcWn8avzcFfRmVFQB5Oi9YCF5/RdYO7W0sJZ5zINFLtHKrvsUtV+4GGECj
         JA2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710429846; x=1711034646;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uipF2nWjwEvJ8FinmI/99ZEfUz9FMdfPX7qMJmCrSQo=;
        b=rwiRgrX+kXJtNrNH09PZzE6IwnaDyC1DgFfo5J5OSI0lrOrVaIM6DQD+E0aVeuIhdK
         Zdu35Tk2YUv4jlhxnsQE885mKnVBvqdslMe5pXca942tHwDC71n0r8C1CFuuahhgv97d
         RrwjvXUcjv0zcIY0tvaykulPqYJelSe9rsI6vMYjoE8iQkqt54gbYe6rwlsQLn7uXWhA
         qnnqMtiPPYdU+57kxFXDCDodmr8dM+PmgPJSmVRDlMiBReqPkeuCgdtPPqAfDYpFaCYw
         2u1IQ6mlN7gqH9/KxuRHZpfKpFIWtaI50u7Eh6zYIA6NCiAf4bHSXxia5D21ffNOyCJ6
         jlqQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9QneKPDyalVRppbPmHccTT3s98XHbCw2ZQZRtP69ZeEfLd5U30oRCE1+mXmKdHCpvlEgk3BPiw/8j46klsHSutswn
X-Gm-Message-State: AOJu0Yw35UbBJMWsIqhXMdnteDqhbLJKe5DYoEIIOypf8bYWezj19LSx
	Hc3WQJ/oNKG4d6H+jBRLDPYSFkB/sc5Y+f4V29zEqbl+XeM1fU3dYGSfPLyUXQ==
X-Google-Smtp-Source: AGHT+IFklPwK5lYnqo3cgyMR3pbXaUxnP8BhUJMkvG0Mpsc5bJGrHi6YT+MWzcxtRkOPSBXX0DpvhA==
X-Received: by 2002:a05:6a21:99a2:b0:1a1:5a12:9119 with SMTP id ve34-20020a056a2199a200b001a15a129119mr8387816pzb.3.1710429846330;
        Thu, 14 Mar 2024 08:24:06 -0700 (PDT)
Received: from [127.0.1.1] ([117.207.30.211])
        by smtp.gmail.com with ESMTPSA id m4-20020a63ed44000000b005e438ea2a5asm824021pgk.53.2024.03.14.08.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 08:24:05 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 00/11] PCI: endpoint: Make host reboot handling more robust
Date: Thu, 14 Mar 2024 20:53:39 +0530
Message-Id: <20240314-pci-epf-rework-v1-0-6134e6c1d491@linaro.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHsW82UC/x3MQQqAIBBA0avIrBtQs6KuEi2sphqCkhEqCO+et
 HyL/1+IJEwROvWC0MWRzyPDFAqmzR8rIc/ZYLV1ujQOw8RIYUGh+5QdfU11NRpd+qaFHAWhhZ9
 /2A8pfYuAfZ5gAAAA
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
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Niklas Cassel <cassel@kernel.org>, Vidya Sagar <vidyas@nvidia.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2289;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=+XqMRpYE8HYIeYnArh9TOIJOZHL3dBFs8VCBPD9Q15c=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl8xaJsDnRXWXOn639N6QSYpQWMRYVyNmaaXhJa
 fn0bkPxFe2JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZfMWiQAKCRBVnxHm/pHO
 9aycB/9b/o4Li6j8PqMVlSnWfc7wdfhcraMkEMFGScwUc/THnarLDa5UEMcMICzCyb9OLOWRndt
 oCBxFCx4BL1ZKDe4PUbQUdo47vJm12TLIoq5bnXsy8rl7eUSaxklwzQaG1HxCbenXX6Ob93oo3M
 nOaWZ/FWBuLztkGRERM5PsXEcw0ViOcPwn3IlQ/1qBvKdBCQ+bJEtrJFih8ES1wXtxMCeeeBMem
 0kVbsWosc0pA5xP6Q8EKQfQRX3VLIpRuoL1MmkEA+yQTL03Au8rJS8JowKwbh/MjtDwv+XSiSUu
 Xx+afP9RJhNfpvDPNHIJ/UKyy2Hhztd6xfR07xVMgfhQgjzZ
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

Hello,

This is the follow up series of [1], to improve the handling of host reboot in
the endpoint subsystem. This involves refining the PERST# and Link Down event
handling in both the controller and function drivers.

Testing
=======

This series is tested on Qcom SM8450 based development board with both MHI_EPF
and EPF_TEST function drivers.

Dependency
==========

This series depends on [1].

- Mani

[1] https://lore.kernel.org/linux-pci/20240314-pci-dbi-rework-v10-0-14a45c5a938e@linaro.org/

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
Manivannan Sadhasivam (11):
      PCI: qcom-ep: Disable resources unconditionally during PERST# assert
      PCI: endpoint: Decouple EPC and PCIe bus specific events
      PCI: endpoint: Rename core_init() callback in 'struct pci_epc_event_ops' to init()
      PCI: epf-test: Refactor pci_epf_test_unbind() function
      PCI: epf-{mhi/test}: Move DMA initialization to EPC init callback
      PCI: endpoint: Introduce EPC 'deinit' event and notify the EPF drivers
      PCI: dwc: ep: Add a generic dw_pcie_ep_linkdown() API to handle Link Down event
      PCI: qcom-ep: Use the generic dw_pcie_ep_linkdown() API to handle Link Down event
      PCI: epf-test: Handle Link Down event
      PCI: qcom-ep: Rework {start/stop}_link() callbacks implementation
      PCI: tegra194: Rework {start/stop}_link() callbacks implementation

 drivers/pci/controller/dwc/pcie-designware-ep.c |  93 +++++++++++++-------
 drivers/pci/controller/dwc/pcie-designware.h    |   5 ++
 drivers/pci/controller/dwc/pcie-qcom-ep.c       |  30 +++----
 drivers/pci/controller/dwc/pcie-tegra194.c      |  25 +++---
 drivers/pci/endpoint/functions/pci-epf-mhi.c    |  47 ++++++++---
 drivers/pci/endpoint/functions/pci-epf-test.c   | 108 +++++++++++++++++-------
 drivers/pci/endpoint/pci-epc-core.c             |  53 +++++++++---
 include/linux/pci-epc.h                         |   1 +
 include/linux/pci-epf.h                         |  27 ++++--
 9 files changed, 265 insertions(+), 124 deletions(-)
---
base-commit: d65c75fc384ada26392a975c351689ec4e069c50
change-id: 20240314-pci-epf-rework-a6e65b103a79

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

