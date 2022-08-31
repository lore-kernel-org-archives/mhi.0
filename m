Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4F57E7
	for <mhi@lists.linux.dev>; Wed, 31 Aug 2022 10:04:25 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id bj12so27277183ejb.13
        for <mhi@lists.linux.dev>; Wed, 31 Aug 2022 03:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citymesh-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=jQYlfahpB48jeiJ1hgrXrVCoWgK6RfgfsPEVfyTWprY=;
        b=AFoa9HVVJx3h/1Qz3iPBYkCyLWSc0JNl4jhq3d7Q0emuNoI4Rj/F3gmmBdT7oySxRd
         9ucTpex/+C+MUgu2xEO89lzpwFrzEcOmewAKdaHQfiMrsFlIqtfOIypnHNe45OBKopiQ
         81jpUJvPFf0WfS+DKo51j2DBCNp0D6yikyQdxeD7E/2GSte0NP3EGgFebChxU7e0XyIs
         gyvGN3fBGI9ug1tLYkTklhtri3q+a4BkLET5ieLwZuiRoE7wEyY0U5tSY4AsRV33QxSe
         z2rv+xTl8aFupO+YxtCjtRApArm/qJzGeBfmgRyhGg5kPSD/6cB5ee+Ewv8sm236MsAo
         g50A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=jQYlfahpB48jeiJ1hgrXrVCoWgK6RfgfsPEVfyTWprY=;
        b=USkLL6wNwTf26VavmZqSXxeDNNrBq8GSZPh+zmiY3s3kh0Db4wARztqINupBTCE8jR
         1K9209RCElrPBATByxW98Hekg4DmLL7fmJUJyqDokPvDwRAWQLrujvBDZWJlNcJwht7G
         uRSTbCGWLFVzZMOYzd/+bymISCYddgVYNoWGcvvAlXUFP0ZJ9sE4TLSgG7sBKS5xe+Z1
         V0C5qS7UNNqBvSAjY2/hI3PhX5wED4WH9YAwetKfsYUy7WxpYsnvf3ntVmdhUTmgBpYQ
         451iZOmVnsiwNO1IvGysc0idh6Fk6RugW4n9VFZCPWQSJSGUOWvkNJB203pnUOowGmi9
         b8Zg==
X-Gm-Message-State: ACgBeo2kmQ4WWu3fH+D4CV0lUhbR6pKcbhmyVK9JFshTcPzVx9mKXA0n
	tAumjO3pu3XOk+CJgHpDWAYPbpTNjtkoTg==
X-Google-Smtp-Source: AA6agR7bDXfh7hk3C6f8wohPe/Mn74FK5/HF2ds2o7wmt3tJIoQBj0+a49iWrgvsrwNeEtt8dZdL0A==
X-Received: by 2002:a17:907:9619:b0:730:8ebb:9e45 with SMTP id gb25-20020a170907961900b007308ebb9e45mr20008260ejc.628.1661940263916;
        Wed, 31 Aug 2022 03:04:23 -0700 (PDT)
Received: from localhost.localdomain ([31.31.140.89])
        by smtp.gmail.com with ESMTPSA id f23-20020a05640214d700b0043ba437fe04sm8841500edx.78.2022.08.31.03.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Aug 2022 03:04:14 -0700 (PDT)
From: Koen Vandeputte <koen.vandeputte@citymesh.com>
To: mhi@lists.linux.dev
Cc: mani@kernel.org,
	Koen Vandeputte <koen.vandeputte@citymesh.com>
Subject: [PATCH v2] bus: mhi: host: always print detected modem name
Date: Wed, 31 Aug 2022 12:03:49 +0200
Message-Id: <20220831100349.1488762-1-koen.vandeputte@citymesh.com>
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

Signed-off-by: Koen Vandeputte <koen.vandeputte@citymesh.com>
---

v2 -> sync SoB email with From
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

