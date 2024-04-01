Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370EE4C602
	for <mhi@lists.linux.dev>; Mon,  1 Apr 2024 15:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711986669; cv=none; b=f0s5ddCeo700NncWd8FPx/bKQIod2ukZWR5RV8xBnjfGfjWHQUVXj9SbQxehQU8Ux4AUfwszm6yz3pnER9Wrum5CFZKA23RBYYgu+9mu1DQG234kUjTL/QnhAQJA0TNt5t5+AggpErSlQvd5jr14ooKR/Tet8ETEM1uPbYwhF8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711986669; c=relaxed/simple;
	bh=NTOjNFStN9Mh4j+b7clh1lbnhfGj8ME9hVFJ3hTsGNo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tk0UmC+BoN0kpevFxopet7ice3tnrru9VALxbVAfwthxHm328N+hw7q3k3C3PcdKQ/LhetAUxnkyiTKw9iR6yMWtcTBnAY+gcN5h4l8sNX7Xag4Yae6Db+uRtk8V6ZwgWJ1qQSioiA/ZadO46F4ua+KOrstIqwVoPQN6G6bS9dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aPSnwK3c; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aPSnwK3c"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1e0f2798cd8so33389385ad.3
        for <mhi@lists.linux.dev>; Mon, 01 Apr 2024 08:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711986667; x=1712591467; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r6tzY8d/xfIhFb+ZbL3y2BfcCJ2gq49NENfnmt3naZI=;
        b=aPSnwK3cRR3aNQockarSLPlu0ZLIs63HTVxNhnlOmMY2vaJtzeqK7z7WY1Rj7sLaKb
         VETkANJuctm1r8Z2Dhg96B4KCk+SpruqrLMPI9VqVo3BDfu5KMHxY+6K3FUAZnmaFBIi
         v7ocncZDCvGfBQxwX/Iws6nTQh0bUNNJzx9/V0F+RU8FoV7+aIcwUurbqqOs0OKKEo89
         SSPVwTRlM8DGR33qK+uhinBb/YgQwUy3M0QemDNgrEqcaOGMqWOB0iD6Q9hNuONer0Uk
         CP+Ay/EA2EYUnuV1ro0A3C8jl5jQxantSABa3+n5pfvbxg4YQXJB6M4chFcW9UARmMYI
         USxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711986667; x=1712591467;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r6tzY8d/xfIhFb+ZbL3y2BfcCJ2gq49NENfnmt3naZI=;
        b=JyzbU2V1mzoFMYqtkuzRRX47QsZQn1wqRXjlzzMlnY4Wrn+n5Ca94OSZhsIJAordkH
         FMXU4EmWM24EAyY7VE3IOa6uGvn61R0rP4koJ6PvYx2HIziq4BjWk3NB7eQzMMWttQKz
         HKZ7sWsVHyrxUxNPpQdeKWWxqjsv9My4tE7gY6xpoXvDzsJ15R+k31BQjpo08DLcyoeN
         +F/wEVolntR1PM4RhrLMrRqJPmayflNaaa6T7e0pmu440X7fM3S6m8qGb/toA8sL2suo
         IVA9yGjkuOC8KtoyNPZXDLrd/KUjHF1xS2fQQPPa4i+DZkKixEYcEZrNtl04nOLUW53T
         dIUw==
X-Forwarded-Encrypted: i=1; AJvYcCWuu6CWkNaQnlBHZLICu3AJJERCHJKjavbGna66hsKD5VDxAI5vt0vrqyP/ZSLiYjwPGpJyGQnpjHk7uED6nuJWEXs5
X-Gm-Message-State: AOJu0Yw9CuOTjbkYpPgfZKVSjs2vyfvjKWXXnjOLrzfbHt76Xljb6K9U
	CTN5oHOTu+DEXMLjWFz+hyqcVurHd/TrthR2nJaK9jVXj+apOVgzT1/alKSsrQ==
X-Google-Smtp-Source: AGHT+IHyJekoMaeQcGcozgAM5pV2dqnXrvcwmxmXkRdSAM0lPTKOjocAwPdmy4VAU/YzGfKeRM/5cw==
X-Received: by 2002:a17:903:244a:b0:1e2:6191:89a3 with SMTP id l10-20020a170903244a00b001e2619189a3mr419731pls.0.1711986667236;
        Mon, 01 Apr 2024 08:51:07 -0700 (PDT)
Received: from [127.0.1.1] ([103.28.246.102])
        by smtp.gmail.com with ESMTPSA id kh6-20020a170903064600b001e21957fecdsm8949076plb.246.2024.04.01.08.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Apr 2024 08:51:06 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Mon, 01 Apr 2024 21:20:30 +0530
Subject: [PATCH v2 04/10] PCI: epf-test: Refactor pci_epf_test_unbind()
 function
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240401-pci-epf-rework-v2-4-970dbe90b99d@linaro.org>
References: <20240401-pci-epf-rework-v2-0-970dbe90b99d@linaro.org>
In-Reply-To: <20240401-pci-epf-rework-v2-0-970dbe90b99d@linaro.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Jingoo Han <jingoohan1@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mhi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, Niklas Cassel <cassel@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3105;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=NTOjNFStN9Mh4j+b7clh1lbnhfGj8ME9hVFJ3hTsGNo=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBmCtfUeBbFz6ykVhE/8sBoCrGpBkoYycOQ+OGli
 s6ZAGyAD9OJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZgrX1AAKCRBVnxHm/pHO
 9bXSB/4+zDeChvCqyz4AE3yw/LRmzQ+rlSiVQDpQahPNavfvnn0+1pgpkCQfnDMbChWpnzUCYNP
 EJtQO+6sVuNXRdHpb/hokpr3G/rrpcup3rrMpDO7j2vf49DYUJ20H7bdDvU6KrjGvup1jBE8JmR
 rzhqzERdqMM4k1LyMHwV/89+FfrcAnoQNWoAVVwrteSnBSnw5YyKEsESWEDkaxOj59WQJrZuDsY
 E7Xd+YuWSpNunAdxOZJAQadZUxkOM8HVdoyixN+jpxLeaPHTxrHq5X3ZPnTZbOYk06bKtlCIjsc
 lRgaWpBoo6zsNvmr/O8esTCsLHkVpzp/TU6kVQBC2CilHkSp
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

Move the pci_epc_clear_bar() and pci_epf_free_space() code to respective
helper functions. This allows reusing the helpers in future commits.

This also requires moving the pci_epf_test_unbind() definition below
pci_epf_test_bind() to avoid forward declaration of the above helpers.

No functional change.

Reviewed-by: Niklas Cassel <cassel@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/endpoint/functions/pci-epf-test.c | 58 ++++++++++++++++++---------
 1 file changed, 39 insertions(+), 19 deletions(-)

diff --git a/drivers/pci/endpoint/functions/pci-epf-test.c b/drivers/pci/endpoint/functions/pci-epf-test.c
index abcb6ca61c4e..1a4a35e7bf94 100644
--- a/drivers/pci/endpoint/functions/pci-epf-test.c
+++ b/drivers/pci/endpoint/functions/pci-epf-test.c
@@ -686,25 +686,6 @@ static void pci_epf_test_cmd_handler(struct work_struct *work)
 			   msecs_to_jiffies(1));
 }
 
-static void pci_epf_test_unbind(struct pci_epf *epf)
-{
-	struct pci_epf_test *epf_test = epf_get_drvdata(epf);
-	struct pci_epc *epc = epf->epc;
-	int bar;
-
-	cancel_delayed_work(&epf_test->cmd_handler);
-	pci_epf_test_clean_dma_chan(epf_test);
-	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++) {
-		if (!epf_test->reg[bar])
-			continue;
-
-		pci_epc_clear_bar(epc, epf->func_no, epf->vfunc_no,
-				  &epf->bar[bar]);
-		pci_epf_free_space(epf, epf_test->reg[bar], bar,
-				   PRIMARY_INTERFACE);
-	}
-}
-
 static int pci_epf_test_set_bar(struct pci_epf *epf)
 {
 	int bar, ret;
@@ -731,6 +712,21 @@ static int pci_epf_test_set_bar(struct pci_epf *epf)
 	return 0;
 }
 
+static void pci_epf_test_clear_bar(struct pci_epf *epf)
+{
+	struct pci_epf_test *epf_test = epf_get_drvdata(epf);
+	struct pci_epc *epc = epf->epc;
+	int bar;
+
+	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++) {
+		if (!epf_test->reg[bar])
+			continue;
+
+		pci_epc_clear_bar(epc, epf->func_no, epf->vfunc_no,
+				  &epf->bar[bar]);
+	}
+}
+
 static int pci_epf_test_epc_init(struct pci_epf *epf)
 {
 	struct pci_epf_test *epf_test = epf_get_drvdata(epf);
@@ -860,6 +856,20 @@ static int pci_epf_test_alloc_space(struct pci_epf *epf)
 	return 0;
 }
 
+static void pci_epf_test_free_space(struct pci_epf *epf)
+{
+	struct pci_epf_test *epf_test = epf_get_drvdata(epf);
+	int bar;
+
+	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++) {
+		if (!epf_test->reg[bar])
+			continue;
+
+		pci_epf_free_space(epf, epf_test->reg[bar], bar,
+				   PRIMARY_INTERFACE);
+	}
+}
+
 static int pci_epf_test_bind(struct pci_epf *epf)
 {
 	int ret;
@@ -897,6 +907,16 @@ static int pci_epf_test_bind(struct pci_epf *epf)
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

