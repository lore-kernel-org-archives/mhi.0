Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177541B968
	for <mhi@lists.linux.dev>; Tue, 30 Apr 2024 06:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714457645; cv=none; b=mEbaqA2twBLdYf6GUIf2fWQAjKHKd29ROqEH//EFYHjxHlYOc5iZczSqSpBQjXxp4uLycXi5lLHfFq3IybyUedcU0Wf0f8uB+x45LXOvORJ3tljyNeBtrEXvJEcNZJqdn2P15VVTOTJt9+uBQXCpyhVzg2gm5Ymvyw409jITCgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714457645; c=relaxed/simple;
	bh=yKmOOaJz6i/wVDMqUoPJz0PoZUhAo27Wo6a6cpCeIcI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cj4UJlJqPT+zM7bbBgDwddJk+w2VG6yDJWNfEx5TGmxrw9AUgR5hB+oXwqnrjg/mcT6zt+xvWOJPS+V5Mqf3K4z47qVvcvuQzGOagdww/3UWiCuCZALdrg1sCE7ziZ0OeAXi6RXEjJr8eBncSYKF5zZ9wn8iz20l5F35Um1YtS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q5Ba7JEU; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q5Ba7JEU"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6f4081574d6so1479044b3a.2
        for <mhi@lists.linux.dev>; Mon, 29 Apr 2024 23:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714457642; x=1715062442; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RXHWTwzfZvv6uYitrN43H3qh6MlnEfQjLqcWZK2Nh3g=;
        b=Q5Ba7JEUcNE/cotZz6xRHMjkqz5WMQyGqzXh2TpfP8s1HJ+UXNfhMEJ8SaXC6guTsi
         syiTKyjKzCHvhAoHPHNqbEWT4BIpjg40WXQ2WmsQrgG4vyu1CSJGeAs3FR/2IrvdMapp
         9ihForjVTD+GM6nk/g1USD4aGWX+EDVnBtLx3ZRxEYMu/fOyVDpFrn9i2KLW2dbal8vf
         ypeB0KXtK02L/ogIdwGS5ULyluQq4JMXhSiIp2NZKIBNT59Zad+bT0uV22z8lIK5W8h3
         7nvbc1+p2KJhAlIaIBZKIiWGkBtKNgXd3sQGNNL68TwdF7DQvjwKgOSY6RQ3PAHQDV3E
         6bTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714457642; x=1715062442;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RXHWTwzfZvv6uYitrN43H3qh6MlnEfQjLqcWZK2Nh3g=;
        b=XRCm4kqRnCiIWYL4gSasAxTqwAcj07ACsfWGlrvPP1LQJQVKCHBvZiSOVDIEsSC0BL
         6eujs7jfaxp7PI/E9Xh1XHF++/HgT5Rr1NpIgMEppqgBPfwXe3mmgeS+4mK6tDIa8C2N
         zO0IaWGhcU9tVcrf9ro/HlZg6x667xhsqTI62hRj+31paenSaeb7nDov4pXj8SAuJ4Qk
         sC60PO0Hx4GJWkNZ5BR/CFzfb79NDupwiF3GkgaaI1ciQfL6zqh4jTZjNRnuIKSgQULa
         TwOxSyPrGjLB1AWJ7mJlonQX6XgMV/SBzESAVZasVC9MWRHGY2pxG07UvO3qA95D1zjM
         Gt7A==
X-Forwarded-Encrypted: i=1; AJvYcCW3Mo6koMmEaWlvYfszcozAlivemFu84M9vKYvwoKvmB57w51ftzZnR2zhE1iprhVnEFD+BPT13KvKQ/EN6IP3t78N+
X-Gm-Message-State: AOJu0YyMjLUBY1KQJqi9OTG+OnuHdgr/IbSXZl6b9TikfEWdH73umPC4
	aYJW5r87a76GZcgb768iXw0xqGCECmZRBeSm6ziNXHTM7XxDANtEAe45kjfiIw==
X-Google-Smtp-Source: AGHT+IHRnaevKePYUyqhOl83dh54XWnj9qmpld7AKyPvIOscju3+tYJusTYfY1t7WIa0eSqzmrgVHw==
X-Received: by 2002:a05:6a20:918e:b0:1ac:6762:e62e with SMTP id v14-20020a056a20918e00b001ac6762e62emr15304457pzd.30.1714457642237;
        Mon, 29 Apr 2024 23:14:02 -0700 (PDT)
Received: from [127.0.1.1] ([220.158.156.15])
        by smtp.gmail.com with ESMTPSA id bi2-20020a170902bf0200b001e27ad5199csm21393298plb.281.2024.04.29.23.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 23:14:01 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Tue, 30 Apr 2024 11:43:43 +0530
Subject: [PATCH v4 02/10] PCI: endpoint: Rename core_init() callback in
 'struct pci_epc_event_ops' to epc_init()
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240430-pci-epf-rework-v4-2-22832d0d456f@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5614;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=yKmOOaJz6i/wVDMqUoPJz0PoZUhAo27Wo6a6cpCeIcI=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBmMIwbIgMEUUVe4HsEcCgfAQPJnzSfgUhA+mY8J
 1G3MD3KQrqJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZjCMGwAKCRBVnxHm/pHO
 9VZOB/48tkYcFkSJngFn0it+wlMUxFNsv5Wi3aeZerWI8GdEuH0YGu2iiVpSTxN5F6qWIrDnvtg
 5hH4UgGPYAgXOD6pjAe7mvr1jkuG3KkC+KfQdbkT8kvO6yCXFkyNUfPlzUBNY5yqwNrVZeZNqt4
 wse4giYnhWc2KGJ1MpQJVV0gvcGR+UZCRJJ7YjNTCiAPfy1JQCzH8BswrxKacovF7qUek6zWAYQ
 KFPH8vJO1HFaIc0cbRuL32PFy2o8B1pu/r252b6akQJATr5BsW04nEZCsgKcNtZFkcV8uj5zwtE
 TnG2ysOFzPAPWBXdU+xxb25slgqbC96twv8UgMiwQMLQRf0B
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

core_init() callback is used to notify the EPC initialization event to the
EPF drivers. The 'core' prefix was used indicate that the controller IP
core has completed initialization. But it serves no purpose as the EPF
driver will only care about the EPC initialization as a whole and there is
no real benefit to distinguish the IP core part.

So let's rename the core_init() callback in 'struct pci_epc_event_ops' to
epc_init() to make it more clear.

Reviewed-by: Niklas Cassel <cassel@kernel.org>
Tested-by: Niklas Cassel <cassel@kernel.org>
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

