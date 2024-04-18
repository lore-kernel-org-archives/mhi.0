Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B13C15FA8C
	for <mhi@lists.linux.dev>; Thu, 18 Apr 2024 11:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713441539; cv=none; b=Kqp1IWr0/F50IhZXaCL4LAgNUJQZxp2LpmBejfrZp/gJRfyD5MiGTnrMpk3B9R+9K0AyUq6fXSC5+zodWKi3pq21TYx3TZ9QykO1uNvcjxxufsdLaGMiwNzDhGWP7kKVerBVd1z1a/zbg5DO9obrytx6P5m5nWF0vc8CfBEwBmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713441539; c=relaxed/simple;
	bh=EiCo8PoNc6cg3qXS12lnExu1Vwt+xqfEZf7YkYu86EA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dAuANs9YFxEZ8PM95ivjgvyeAxGfjkmHk5Hn6DBi41rxV8K2qanpVTRH042IRdwAH5XwcJpC+msU/+vGoLG/o3d2YIkX8N9GvRn3yqBtcu70X8ud50jnI0kdewddxSgoRk/XC74NlaNdJsHBznfMbro83tWO6tvr+NM70qEqM0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r7lthK7M; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r7lthK7M"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-6eb55942409so341400a34.1
        for <mhi@lists.linux.dev>; Thu, 18 Apr 2024 04:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713441537; x=1714046337; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=79MJpTqAjl8O6Pv0vbT9iUqFML3hqwQuq9I/aS5KbP0=;
        b=r7lthK7MvOa77GnHFNoLMrwUWoyRa2S2GGp6h/Oqs3wqEjKPiEWLwsq/E+9MtZ3e03
         AkTdEMwON/PsK1DqHdyCQf5goQ1Ca6tH3NduAx+3ImN7asiKunNvHA4CkVPNIhzIceTK
         QbCCErdPPdhIK51DRNJjCuFE/l7c6cC/Y5Tbqhfz4x2r1vr2cCTA2w1t6b2ZpIvAwLMM
         YyhtOzkhWzmXTBMbckMnBghMTS/r+gSO0iJQ5cO2LrcqE+JJmIL6LczjIjDPBzhL4tKg
         jE7XskeCcNk052RMtEhlelF3hGdhy4UBM95Zg6hFR0FD7VOqGUmn9nrltsyPwxReppce
         eZDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713441537; x=1714046337;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=79MJpTqAjl8O6Pv0vbT9iUqFML3hqwQuq9I/aS5KbP0=;
        b=Ro4yn1cbPd1i/h9VMwHtrkom9CQrKpT8XZoP1auAFf0dElmD1IrGRXkRIljK3l4idT
         NaYN9E20tCd2AMRC27vG+MWxThH1PjK499rTbBGYWPSDXShqjcI7f0pN0dfmo/17iGBW
         xJYOVI5ymsKx+6kHklNQQZ1eHqG+fJXGbcCLc39BxNwkVDXczZ22n8hjyC5ruIJ1E3Bn
         6s5rVEhRS+dhWrjc8WAyYYC0xiAttCghDykAqQPPzfECLIAib/HSiM0cgi58UlJ7A7u6
         EWmgvkWtTN8aSLGefsMc4lWShrjJjYqO02xgu0Xj/zZk2UKyo6hCMTeeE8RC3hhtBDBN
         nFNg==
X-Forwarded-Encrypted: i=1; AJvYcCVZZ4WUwLKkKiULFWt46Zb5Viv214cIRZ1hxhcl+Sim/U3FiaKY/a3pT+uK55+F0wpll8TiW/CJ1ALWwKOQuRIHpNsS
X-Gm-Message-State: AOJu0YzDrZgxwToFe3dBOIx0GpwD7tJq1J1Nsdklf4lSm23wtqRy0y6N
	WRAgledvS57wig3XLx3nywsN5Az/JNA2lGdBweA1yVAbpwx9hQnUJcbzNWqIFA==
X-Google-Smtp-Source: AGHT+IGAJCI718Rs8anfjsRigMWsxEJP6XeVOzGi9Nb+kHa9PcoCWJzBu3rLNMYJDSPbAxRGyta0ng==
X-Received: by 2002:a05:6870:3324:b0:22e:c6b2:84aa with SMTP id x36-20020a056870332400b0022ec6b284aamr3295224oae.27.1713441537189;
        Thu, 18 Apr 2024 04:58:57 -0700 (PDT)
Received: from [127.0.1.1] ([120.56.197.253])
        by smtp.gmail.com with ESMTPSA id ei16-20020a056a0080d000b006ed06c4074bsm1305512pfb.85.2024.04.18.04.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 04:58:56 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Thu, 18 Apr 2024 17:28:30 +0530
Subject: [PATCH v3 2/9] PCI: endpoint: Rename core_init() callback in
 'struct pci_epc_event_ops' to epc_init()
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240418-pci-epf-rework-v3-2-222a5d1ed2e5@linaro.org>
References: <20240418-pci-epf-rework-v3-0-222a5d1ed2e5@linaro.org>
In-Reply-To: <20240418-pci-epf-rework-v3-0-222a5d1ed2e5@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5520;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=EiCo8PoNc6cg3qXS12lnExu1Vwt+xqfEZf7YkYu86EA=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBmIQryxIrFpq1A2J+VEu+QuPdoUer2VPq15EkrK
 GjkY9IY3AuJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZiEK8gAKCRBVnxHm/pHO
 9Wf5CACMprbQP9Um+MWSRGrqauvRG2mPr2zXmfQlPdKcarkzSnjVKfos755tBQyCy0XpzlFHR3Z
 wTTFnnap5Tnx4cZwwukuPa3K3/CK5YMv6ug8FOuE9LYiW2FDkVUNRcucytBKCJGt+SAWF5Cs7BF
 iqIjLKbrs7xXm1/yzCfvLSg6AqE0lnYkQ1sRXuzJ7LqLkFHVVBJ7tbzYKqIhcErcU6yaInu+8yN
 ZIUMuN22f2RWaSQTLaV4LsB2lzUuiSbAT/NZ/dukxnAbJhiUxCI48Hwph6Z2QtODTjE6I+wKCkm
 tCMH5UeDKcb74KDLQ+GMe82VWsvm3lHyP7kj8I6Dav8qgvcq
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

core_init() callback is used to notify the EPC initialization event to the
EPF drivers. The 'core' prefix was used indicate that the controller IP
core has completed initialization. But it serves no purpose as the EPF
driver will only care about the EPC initialization as a whole and there is
no real benefit to distinguish the IP core part.

So let's rename the core_init() callback in 'struct pci_epc_event_ops' to
epc_init() to make it more clear.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/endpoint/functions/pci-epf-mhi.c  |  4 ++--
 drivers/pci/endpoint/functions/pci-epf-test.c |  4 ++--
 drivers/pci/endpoint/pci-epc-core.c           | 16 ++++++++--------
 include/linux/pci-epf.h                       |  4 ++--
 4 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/pci/endpoint/functions/pci-epf-mhi.c b/drivers/pci/endpoint/functions/pci-epf-mhi.c
index 2c54d80107cf..95c3206f609f 100644
--- a/drivers/pci/endpoint/functions/pci-epf-mhi.c
+++ b/drivers/pci/endpoint/functions/pci-epf-mhi.c
@@ -716,7 +716,7 @@ static void pci_epf_mhi_dma_deinit(struct pci_epf_mhi *epf_mhi)
 	epf_mhi->dma_chan_rx = NULL;
 }
 
-static int pci_epf_mhi_core_init(struct pci_epf *epf)
+static int pci_epf_mhi_epc_init(struct pci_epf *epf)
 {
 	struct pci_epf_mhi *epf_mhi = epf_get_drvdata(epf);
 	const struct pci_epf_mhi_ep_info *info = epf_mhi->info;
@@ -897,7 +897,7 @@ static void pci_epf_mhi_unbind(struct pci_epf *epf)
 }
 
 static const struct pci_epc_event_ops pci_epf_mhi_event_ops = {
-	.core_init = pci_epf_mhi_core_init,
+	.epc_init = pci_epf_mhi_epc_init,
 	.link_up = pci_epf_mhi_link_up,
 	.link_down = pci_epf_mhi_link_down,
 	.bme = pci_epf_mhi_bme,
diff --git a/drivers/pci/endpoint/functions/pci-epf-test.c b/drivers/pci/endpoint/functions/pci-epf-test.c
index 977fb79c1567..8175d4f2a0eb 100644
--- a/drivers/pci/endpoint/functions/pci-epf-test.c
+++ b/drivers/pci/endpoint/functions/pci-epf-test.c
@@ -731,7 +731,7 @@ static int pci_epf_test_set_bar(struct pci_epf *epf)
 	return 0;
 }
 
-static int pci_epf_test_core_init(struct pci_epf *epf)
+static int pci_epf_test_epc_init(struct pci_epf *epf)
 {
 	struct pci_epf_test *epf_test = epf_get_drvdata(epf);
 	struct pci_epf_header *header = epf->header;
@@ -799,7 +799,7 @@ static int pci_epf_test_link_up(struct pci_epf *epf)
 }
 
 static const struct pci_epc_event_ops pci_epf_test_event_ops = {
-	.core_init = pci_epf_test_core_init,
+	.epc_init = pci_epf_test_epc_init,
 	.link_up = pci_epf_test_link_up,
 };
 
diff --git a/drivers/pci/endpoint/pci-epc-core.c b/drivers/pci/endpoint/pci-epc-core.c
index 47d27ec7439d..e6bffa37a948 100644
--- a/drivers/pci/endpoint/pci-epc-core.c
+++ b/drivers/pci/endpoint/pci-epc-core.c
@@ -727,9 +727,9 @@ void pci_epc_linkdown(struct pci_epc *epc)
 EXPORT_SYMBOL_GPL(pci_epc_linkdown);
 
 /**
- * pci_epc_init_notify() - Notify the EPF device that EPC device's core
- *			   initialization is completed.
- * @epc: the EPC device whose core initialization is completed
+ * pci_epc_init_notify() - Notify the EPF device that EPC device initialization
+ *                         is completed.
+ * @epc: the EPC device whose initialization is completed
  *
  * Invoke to Notify the EPF device that the EPC device's initialization
  * is completed.
@@ -744,8 +744,8 @@ void pci_epc_init_notify(struct pci_epc *epc)
 	mutex_lock(&epc->list_lock);
 	list_for_each_entry(epf, &epc->pci_epf, list) {
 		mutex_lock(&epf->lock);
-		if (epf->event_ops && epf->event_ops->core_init)
-			epf->event_ops->core_init(epf);
+		if (epf->event_ops && epf->event_ops->epc_init)
+			epf->event_ops->epc_init(epf);
 		mutex_unlock(&epf->lock);
 	}
 	epc->init_complete = true;
@@ -756,7 +756,7 @@ EXPORT_SYMBOL_GPL(pci_epc_init_notify);
 /**
  * pci_epc_notify_pending_init() - Notify the pending EPC device initialization
  *                                 complete to the EPF device
- * @epc: the EPC device whose core initialization is pending to be notified
+ * @epc: the EPC device whose initialization is pending to be notified
  * @epf: the EPF device to be notified
  *
  * Invoke to notify the pending EPC device initialization complete to the EPF
@@ -767,8 +767,8 @@ void pci_epc_notify_pending_init(struct pci_epc *epc, struct pci_epf *epf)
 {
 	if (epc->init_complete) {
 		mutex_lock(&epf->lock);
-		if (epf->event_ops && epf->event_ops->core_init)
-			epf->event_ops->core_init(epf);
+		if (epf->event_ops && epf->event_ops->epc_init)
+			epf->event_ops->epc_init(epf);
 		mutex_unlock(&epf->lock);
 	}
 }
diff --git a/include/linux/pci-epf.h b/include/linux/pci-epf.h
index adee6a1b35db..afe3bfd88742 100644
--- a/include/linux/pci-epf.h
+++ b/include/linux/pci-epf.h
@@ -70,13 +70,13 @@ struct pci_epf_ops {
 
 /**
  * struct pci_epc_event_ops - Callbacks for capturing the EPC events
- * @core_init: Callback for the EPC initialization complete event
+ * @epc_init: Callback for the EPC initialization complete event
  * @link_up: Callback for the EPC link up event
  * @link_down: Callback for the EPC link down event
  * @bme: Callback for the EPC BME (Bus Master Enable) event
  */
 struct pci_epc_event_ops {
-	int (*core_init)(struct pci_epf *epf);
+	int (*epc_init)(struct pci_epf *epf);
 	int (*link_up)(struct pci_epf *epf);
 	int (*link_down)(struct pci_epf *epf);
 	int (*bme)(struct pci_epf *epf);

-- 
2.25.1

