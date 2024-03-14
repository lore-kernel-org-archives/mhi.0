Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80AEF74402
	for <mhi@lists.linux.dev>; Thu, 14 Mar 2024 15:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710429868; cv=none; b=NMx0JYf//Af1NiGlzJs/5eQQXxa3lDE43EFwwL/V87qV1+eClg9W3JQJxTMpWEcE/xeaKLA/XuD3g9WJfkLRkHfNGVSIVrcYkxCGT1vpxAP3QEAmNcCyHUtthw1jzUSOLMr0h7bMAQzdhyuRvl73r1oFcMlqYxwSHzaPb6KEueE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710429868; c=relaxed/simple;
	bh=DtlRqv5F0Ytl0/lk4U3qf6wbQNKU/3llSWJh3kC84BI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hXx2+0181Cn63OilM7YlKlH0+CQp5JA0a/9OHf/Y2r2eIGF5t9DiTYHQLaaza0idJLT2J9lCw8uqGcAI8OHHhwHW8sKSQwl4xQS1/oIPJnncM5p2c8uAZuElp7B2udwSl2E7Qi13kSgsNCBU2Uo7xkTenFyxWG61Xa35vLULk0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SArq+JUh; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SArq+JUh"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-5a43329565cso322474eaf.3
        for <mhi@lists.linux.dev>; Thu, 14 Mar 2024 08:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710429864; x=1711034664; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UC/JTb5/el0zq5fPOBPWkuJ8boNZcgw6JdBjsjQkQVo=;
        b=SArq+JUh516SdZH0n8ACD+29bByWKlAzs+RINOU2Q4lmUev1uwEhYa5seujmBjGRV+
         2A+EkM0Lim0Hfv5DDx6Fo1/4UESjrYmReY2tOQXCDSnqwUqadr6yIYRc5peWacRHqU23
         CiHUj899OL1K6bO2M+MHLbQ6rbORKYX/FWQM44FjPIK6IAheAeyTkVG6Xfi8qXOdTQDG
         UGIx7y8SyvoemOer6ARnfXLMMVyFxSHzzEIrdJQVZYTnQCm3eKqValIYHwCu8vvSskov
         u8k1xtW6WAnaix49AEm4ZrxFJjXTEDs3a503VbCQirWC/lksT5QyfRFJRG2uWXhPHuyP
         3sIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710429864; x=1711034664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UC/JTb5/el0zq5fPOBPWkuJ8boNZcgw6JdBjsjQkQVo=;
        b=OQ8sJWwCW53HuJR+IsVGw3WeyEotqU8oMccfWp3Qxw9m6s1gbvsKCuzv9SBmWJr2GI
         P28301TCC4GaNk/n02R+SRs1kYI9unldrfGaA3NKtot/nQcKo1815H0GVTCaJKvqtiTP
         w351+wX2jggzavgsYQ8xuRa1b4JiXy4bSAXRBHGvV8dtsFT9SFFTvOpmhygVbx12v6kk
         gyOFoLoKcC6y207EHbm8hzQWkTQVQUHWI0JMKRb/RJYFzDpK2oljXMuZDTR8WxTTxs19
         CHt1UpVzcNIGvk6Mo1gSerNeHxnZDBJ69w5ESM7gbgRakCDog7i5NmHunwMiT1W/xR+p
         jBUg==
X-Forwarded-Encrypted: i=1; AJvYcCW73FTaLNn7zJKEQ9SEti3z2T32Cc3ylS9AQwDmm7ksLoDC3KGxpJIyL4uPsSIv7s2LOGi4tFslujqe+mq0TJAch1tJ
X-Gm-Message-State: AOJu0Ywu0YcIm7sD7Dy0Czt6Gi9VawvprtWy73QPc57IMgwavwyeF+hJ
	q21s35BcTC2DYUhI2gLqWLZpWSZZvPaWSYtXoFp+z5C/Mz2nGD/9sdPSbVHgOA==
X-Google-Smtp-Source: AGHT+IEvaMb+kq/9lTqNU5RsDY6HF44EQNDk3hWuMaLlsYMMXmYN4cL3/H6gm79wueLO7Uah/GddRw==
X-Received: by 2002:a05:6359:4595:b0:17b:f721:4565 with SMTP id no21-20020a056359459500b0017bf7214565mr2583482rwb.9.1710429864237;
        Thu, 14 Mar 2024 08:24:24 -0700 (PDT)
Received: from [127.0.1.1] ([117.207.30.211])
        by smtp.gmail.com with ESMTPSA id m4-20020a63ed44000000b005e438ea2a5asm824021pgk.53.2024.03.14.08.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 08:24:23 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Thu, 14 Mar 2024 20:53:43 +0530
Subject: [PATCH 04/11] PCI: epf-test: Refactor pci_epf_test_unbind()
 function
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240314-pci-epf-rework-v1-4-6134e6c1d491@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3251;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=DtlRqv5F0Ytl0/lk4U3qf6wbQNKU/3llSWJh3kC84BI=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl8xaPAyz+988uZe7rmcr+FE4mObQJvWgDMjtPA
 pAtrbNOuvGJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZfMWjwAKCRBVnxHm/pHO
 9eAoCACI5/CJ9PWdvD+VU8d2Gn0KeJ6lsXgzuOnuu7+hCl2uaapddhtT3FSiPt8UOBMPW32QezH
 voUagEwTlRqpJMy0UkgnEoq1kMK6xbhDLeY6hIGR6RnSxfEm1gRiD3gLtV0rNnktVnLxUdRPmJM
 zdTyuxOgUqqzpQ6MNumI/x1yw0WQfuKiw+upojxa1/FiXJ7M/sel6J9BNXwlAhajWItXWqbTXgR
 Bkh3Uxczc4c3Tzhsw2aMUMYM6nV88U3neL+jQQirLKOI3T/vE/WJwgdtlZla9fhFgM0Qj4iJ7JP
 YnzT7vSyoFTjsesiBTM7ZgqPwTUSfCATX++DwyKM1V80BZSB
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

Move the pci_epc_clear_bar() and pci_epf_free_space() code to respective
helper functions. This allows reusing the helpers in future commits.

This also requires moving the pci_epf_test_unbind() definition below
pci_epf_test_bind() to avoid forward declaration of the above helpers.

No functional change.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/endpoint/functions/pci-epf-test.c | 63 ++++++++++++++++++---------
 1 file changed, 42 insertions(+), 21 deletions(-)

diff --git a/drivers/pci/endpoint/functions/pci-epf-test.c b/drivers/pci/endpoint/functions/pci-epf-test.c
index 1dae0fce8fc4..2fac36553633 100644
--- a/drivers/pci/endpoint/functions/pci-epf-test.c
+++ b/drivers/pci/endpoint/functions/pci-epf-test.c
@@ -686,27 +686,6 @@ static void pci_epf_test_cmd_handler(struct work_struct *work)
 			   msecs_to_jiffies(1));
 }
 
-static void pci_epf_test_unbind(struct pci_epf *epf)
-{
-	struct pci_epf_test *epf_test = epf_get_drvdata(epf);
-	struct pci_epc *epc = epf->epc;
-	struct pci_epf_bar *epf_bar;
-	int bar;
-
-	cancel_delayed_work(&epf_test->cmd_handler);
-	pci_epf_test_clean_dma_chan(epf_test);
-	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++) {
-		epf_bar = &epf->bar[bar];
-
-		if (epf_test->reg[bar]) {
-			pci_epc_clear_bar(epc, epf->func_no, epf->vfunc_no,
-					  epf_bar);
-			pci_epf_free_space(epf, epf_test->reg[bar], bar,
-					   PRIMARY_INTERFACE);
-		}
-	}
-}
-
 static int pci_epf_test_set_bar(struct pci_epf *epf)
 {
 	int bar, add;
@@ -746,6 +725,22 @@ static int pci_epf_test_set_bar(struct pci_epf *epf)
 	return 0;
 }
 
+static void pci_epf_test_clear_bar(struct pci_epf *epf)
+{
+	struct pci_epf_test *epf_test = epf_get_drvdata(epf);
+	struct pci_epc *epc = epf->epc;
+	struct pci_epf_bar *epf_bar;
+	int bar;
+
+	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++) {
+		epf_bar = &epf->bar[bar];
+
+		if (epf_test->reg[bar])
+			pci_epc_clear_bar(epc, epf->func_no, epf->vfunc_no,
+					  epf_bar);
+	}
+}
+
 static int pci_epf_test_epc_init(struct pci_epf *epf)
 {
 	struct pci_epf_test *epf_test = epf_get_drvdata(epf);
@@ -885,6 +880,22 @@ static int pci_epf_test_alloc_space(struct pci_epf *epf)
 	return 0;
 }
 
+static void pci_epf_test_free_space(struct pci_epf *epf)
+{
+	struct pci_epf_test *epf_test = epf_get_drvdata(epf);
+	struct pci_epf_bar *epf_bar;
+	int bar;
+
+	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++) {
+		epf_bar = &epf->bar[bar];
+
+		if (epf_test->reg[bar]) {
+			pci_epf_free_space(epf, epf_test->reg[bar], bar,
+					   PRIMARY_INTERFACE);
+		}
+	}
+}
+
 static void pci_epf_configure_bar(struct pci_epf *epf,
 				  const struct pci_epc_features *epc_features)
 {
@@ -940,6 +951,16 @@ static int pci_epf_test_bind(struct pci_epf *epf)
 	return 0;
 }
 
+static void pci_epf_test_unbind(struct pci_epf *epf)
+{
+	struct pci_epf_test *epf_test = epf_get_drvdata(epf);
+
+	cancel_delayed_work(&epf_test->cmd_handler);
+	pci_epf_test_clean_dma_chan(epf_test);
+	pci_epf_test_clear_bar(epf);
+	pci_epf_test_free_space(epf);
+}
+
 static const struct pci_epf_device_id pci_epf_test_ids[] = {
 	{
 		.name = "pci_epf_test",

-- 
2.25.1

