Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DCD2524F
	for <mhi@lists.linux.dev>; Fri, 24 Feb 2023 12:07:47 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id e9so11510990plh.2
        for <mhi@lists.linux.dev>; Fri, 24 Feb 2023 04:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rhcJhzQ7qGnrVZ4/jtXBdzD+R3XVaYYf5N+qRIXhKBk=;
        b=wuFYETLFMDfuPnIoFcpo9ASy2MPL6lj321qju9I4Uyl33qCUsEHIHVe+wIgirmo6K4
         P2zopch31YajGh+qKTPNe8Rrlu46Ugluidgo119z8pY4tMGTHRlU3OGVMpnamT1jeDER
         +YEKFrjycOXjD4HBpIz7N9UqqFnquXqUQhzHc48Vv6AHC5WLbMYXE5kDrzVHSDbJLppw
         5HaslIcX6VQHG82YcSx+KYxqooDD2p2mzRuczgIeWDAbLj8R8UbqGn13F4P04Be5wGK0
         qj5BWLrnO/8D03w7GObbcbc8+TrVz3rLKtKczsJjE51XGEZjHmi8KrUj5siyrkSe8zi0
         sDpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rhcJhzQ7qGnrVZ4/jtXBdzD+R3XVaYYf5N+qRIXhKBk=;
        b=HVORnFAoM3XtQP8UTofjAQuHuWg5glUMJa97rkmpub4FSVgBadz6KJp3IIsCUfmwgg
         ZDWoI2RtwOPMoCgW7ngowe0RZLvzfIkGn1hjk8UYEbSD4gI1QlOpsv/xg5cNPzxfEIWm
         /kYqpnrQ2SHTBvBJ1UkvrXTwb7F2CClbjsdO+bm4JAmXZQfelgQW2oxzpT58S1fLeTZz
         Aklyn6ZCf8l4F88O+kyJfXYrr3vFvOnhlmRoBtSicE4uvBytEtk60gPbAhgjfhSU/z64
         bXk03K6ORgUG/ZVi8LunTOQ+AOiwYnBFAMKvIZOfClpQ3MgbreJ/CY2MzxpcwSX3z8Hn
         z6kg==
X-Gm-Message-State: AO0yUKVU5D5uuBdmdkLbQzK3FGKzZyAVg73yqevRKUAzGG5xCMgUrc9b
	xsA5+ahEqWqzOZu94aUEzDdvCTqDjZXPBRE=
X-Google-Smtp-Source: AK7set8pTrKn+7zWEdp5yAIjZPTPJbpUPiDLI7KQVMU7Q5dYwsfNq+bLIfyJ/McZXSLoaROt6MtVlA==
X-Received: by 2002:a17:903:283:b0:199:2e77:fe16 with SMTP id j3-20020a170903028300b001992e77fe16mr18777583plr.58.1677240466547;
        Fri, 24 Feb 2023 04:07:46 -0800 (PST)
Received: from localhost.localdomain ([117.217.187.3])
        by smtp.gmail.com with ESMTPSA id bh4-20020a170902a98400b0019cb6222698sm3808172plb.266.2023.02.24.04.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 04:07:45 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: mhi@lists.linux.dev
Cc: quic_jhugo@quicinc.com,
	quic_vpernami@quicinc.com,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH] bus: mhi: host: Remove mhi_poll() API
Date: Fri, 24 Feb 2023 17:31:47 +0530
Message-Id: <20230224120147.19851-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mhi_poll() API is not used within the MHI stack and also not by any client
drivers in mainline. So let's remove it until any consumer is available.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/host/main.c | 15 ---------------
 include/linux/mhi.h         |  7 -------
 2 files changed, 22 deletions(-)

diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
index df0fbfee7b78..4fa0969472fc 100644
--- a/drivers/bus/mhi/host/main.c
+++ b/drivers/bus/mhi/host/main.c
@@ -1679,18 +1679,3 @@ void mhi_unprepare_from_transfer(struct mhi_device *mhi_dev)
 	}
 }
 EXPORT_SYMBOL_GPL(mhi_unprepare_from_transfer);
-
-int mhi_poll(struct mhi_device *mhi_dev, u32 budget)
-{
-	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
-	struct mhi_chan *mhi_chan = mhi_dev->dl_chan;
-	struct mhi_event *mhi_event = &mhi_cntrl->mhi_event[mhi_chan->er_index];
-	int ret;
-
-	spin_lock_bh(&mhi_event->lock);
-	ret = mhi_event->process_event(mhi_cntrl, mhi_event, budget);
-	spin_unlock_bh(&mhi_event->lock);
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(mhi_poll);
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index a5441ad33c74..f6de4b6ecfc7 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -765,13 +765,6 @@ int mhi_prepare_for_transfer_autoqueue(struct mhi_device *mhi_dev);
  */
 void mhi_unprepare_from_transfer(struct mhi_device *mhi_dev);
 
-/**
- * mhi_poll - Poll for any available data in DL direction
- * @mhi_dev: Device associated with the channels
- * @budget: # of events to process
- */
-int mhi_poll(struct mhi_device *mhi_dev, u32 budget);
-
 /**
  * mhi_queue_dma - Send or receive DMA mapped buffers from client device
  *                 over MHI channel
-- 
2.25.1

