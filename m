Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB70017EE
	for <mhi@lists.linux.dev>; Fri, 19 Aug 2022 08:36:31 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id f22so4804505edc.7
        for <mhi@lists.linux.dev>; Fri, 19 Aug 2022 01:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citymesh-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=r3HFdP2OqG4ybpkvHS1CPlFTw2RYozms1UhdGm/SGGA=;
        b=Vy5cVf4gaUBnSLnYMbVB3DmQvEo+3QRM3fc5SkzlmTCslbxqitux6CKaZMc7qoBdBM
         fAyP9k0inUrEAOQTCFdOFhOCz/L+4OuIvFGef+buHqq2D52vfKwXNjAQKDuOBkwHAYMn
         DzZHSd9AHUWRu7ihyFybT0mZd0MKqZKQtnYPu3fmhuN8wTwcyQ1JdU+nxFOY8nmtOaBl
         pa4BCmL8f+KBKMZb3w/3521O5NtOnKfkRfiI8YRczTIUDI60KH0IkqkeKfIAgdR7zCtf
         kF869tmTuKkxn9xTiQFUnugQnqbJYfoYTKOhi2e2V14XfUjkwFk+mawi555njW32j2ns
         0d6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=r3HFdP2OqG4ybpkvHS1CPlFTw2RYozms1UhdGm/SGGA=;
        b=XQtPcrPuDhGrfdusoeVfNDLfc1jsAprm9dJRr4oKFMFAdVWwW7iSMNUm2G4bUkwREY
         RE6ok7FrZp6jkzwnhZ9C9b74S1BIy+zHTr+Bd3x+Qu0geIOUigbl43R12l+IGaReTXAP
         gH77UvjIP1WKHD6/Iex6KRG7LjRmk/sNAC9L1ljmVuIvkOROwzYqg9JWACB378MR4ehK
         G+zZl3XjSR62rAusG6OIQQ+F5BYJp4G58fqAAY/y6VHODN6csbvBsYUlZrFikyp5EQ4X
         pL4aeIN9f9CDg4aS6JSVh2OSwMQM6z+NJMAu1YNRDpFgLhcGHQdnTrxNzdbOXvBqt3SW
         jMBw==
X-Gm-Message-State: ACgBeo36UmcSEWAHoSsEZiLJA63iP9enTDwc7OpHW5opjqsMF58alF9V
	m0BBtU8WytkYbKGYsOet8h0GTcW2107IJw==
X-Google-Smtp-Source: AA6agR72lhs+Y7dojsFADDGvK+Qw4STwBUH6MMfisRC1cpoypmw6ZeyzzBVEW6GXt6oPrklSePJ/pQ==
X-Received: by 2002:a05:6402:42ca:b0:43e:3f8d:faf3 with SMTP id i10-20020a05640242ca00b0043e3f8dfaf3mr5306878edc.122.1660898189331;
        Fri, 19 Aug 2022 01:36:29 -0700 (PDT)
Received: from localhost.localdomain ([31.31.140.89])
        by smtp.gmail.com with ESMTPSA id lb4-20020a170907784400b0073c80d008d5sm1184076ejc.122.2022.08.19.01.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 01:36:28 -0700 (PDT)
From: Koen Vandeputte <koen.vandeputte@citymesh.com>
X-Google-Original-From: Koen Vandeputte <koen.vandeputte@ncentric.com>
To: mhi@lists.linux.dev
Cc: Koen Vandeputte <koen.vandeputte@ncentric.com>
Subject: [PATCH] bus: mhi: host: always print detected modem name
Date: Fri, 19 Aug 2022 10:36:15 +0200
Message-Id: <20220819083615.251960-1-koen.vandeputte@ncentric.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This harmless print provides a very easy way of knowing
if the modem is detected properly during probing.

Promote it to an informational print so no hassle is required
enabling kernel debugging info to obtain it.

The rationale here is that:
On a lot of low-storage embedded devices, extensive kernel
debugging info is not always present as this would
increase it's size to much causing partition size issues.

Signed-off-by: Koen Vandeputte <koen.vandeputte@ncentric.com>
---
 drivers/bus/mhi/host/pci_generic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 9e545f2a5a26..51e2b901bae0 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -841,7 +841,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	struct mhi_controller *mhi_cntrl;
 	int err;
 
-	dev_dbg(&pdev->dev, "MHI PCI device found: %s\n", info->name);
+	dev_info(&pdev->dev, "MHI PCI device found: %s\n", info->name);
 
 	/* mhi_pdev.mhi_cntrl must be zero-initialized */
 	mhi_pdev = devm_kzalloc(&pdev->dev, sizeof(*mhi_pdev), GFP_KERNEL);
-- 
2.34.1

