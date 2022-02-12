Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6407C
	for <mhi@lists.linux.dev>; Sat, 12 Feb 2022 18:23:16 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id l8so1254806pls.7
        for <mhi@lists.linux.dev>; Sat, 12 Feb 2022 10:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nOeAtH9KqQy90Wc3/INZFeCi473Iwk1s2/Fhz+I9C3k=;
        b=QVyTtzeYWyHPclKxH4SZFHtF3XCzqOxoFhFxXy2EYmqZBAs4qu7xculGq8C+XBIAQ6
         mnNoxhoezaVExurBfqUDBoG3+QukjV1xsSgsJlIjJlO4sV87QeTciq+pweb+NPWSneBR
         C44eWQfK50ltPyKIiD3qTuO3qum1GxmwW1cyNx2oPma5DknsnycP2tuaKg0k5GAqKJth
         cGarVlOqQcCCVWh1BuSIgqN4LpBclde/55vIUNGLj4jA9IZafiqXmx+yLG7dL9UbQ1ov
         AgAP9+h1euN1dD2TQP2QT2et4qNLNxru/nSDrpDxYGV0ko9UG+GcGfi9BiKBR3fFxRIc
         JqlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nOeAtH9KqQy90Wc3/INZFeCi473Iwk1s2/Fhz+I9C3k=;
        b=W7ABh3Z2j3qe6UIxnLrXTEv2f8kR5v6UiRtmPZidmGEdS1iauEOKi0BlpjHUZT73nI
         ehwLGwAnkR5L/jAClxYW2uu5i2e0DTTOhXZtA5UQRKuEyBJnZQMD6h1dW/mMSiB4D2ZS
         gP0j+TXw46kNE5VKDuARXltk2zyOn/vrX4juy7FgE6lFWBvvkqAXmEkNyGfXtspwgsjy
         Q/LosVJMvqh0vAHu/nOXZL8FJiHT5CQ1l2QbVZeXHWkBhpH8+tPvbap0Vux3LYIShblA
         27rfsiF1/7RgjTVJA7jvQ0akf4W/LwzDlc/P+NUhR8gBvEc1Rd7kjOA7G5TfGqckbrlf
         x1YQ==
X-Gm-Message-State: AOAM530NUd7Ztr7/CyidG3Eg52GhJZx5Yj/0HMuoUQnPE6NbZ+hiYYOf
	lrYtjgN4qZBjjHFv2zvoEqiOX5+5hYbUEog=
X-Google-Smtp-Source: ABdhPJx6sakHNoUbIv6WLbXVv5/bnUcjzl4CHpRshFMWafwsldLiP14yjSqXEdQQorWGmy1gsOxkKA==
X-Received: by 2002:a17:90b:4c0d:: with SMTP id na13mr6274373pjb.96.1644690195423;
        Sat, 12 Feb 2022 10:23:15 -0800 (PST)
Received: from localhost.localdomain ([27.111.75.57])
        by smtp.gmail.com with ESMTPSA id g12sm14961987pfj.148.2022.02.12.10.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Feb 2022 10:23:15 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: mhi@lists.linux.dev
Cc: quic_hemantk@quicinc.com,
	quic_bbhatt@quicinc.com,
	quic_jhugo@quicinc.com,
	vinod.koul@linaro.org,
	bjorn.andersson@linaro.org,
	dmitry.baryshkov@linaro.org,
	quic_vbadigan@quicinc.com,
	quic_cang@quicinc.com,
	quic_skananth@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	elder@linaro.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 19/25] bus: mhi: ep: Add support for handling SYS_ERR condition
Date: Sat, 12 Feb 2022 23:51:11 +0530
Message-Id: <20220212182117.49438-20-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220212182117.49438-1-manivannan.sadhasivam@linaro.org>
References: <20220212182117.49438-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for handling SYS_ERR (System Error) condition in the MHI
endpoint stack. The SYS_ERR flag will be asserted by the endpoint device
when it detects an internal error. The host will then issue reset and
reinitializes MHI to recover from the error state.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/ep/internal.h |  1 +
 drivers/bus/mhi/ep/main.c     | 24 ++++++++++++++++++++++++
 drivers/bus/mhi/ep/sm.c       |  2 ++
 3 files changed, 27 insertions(+)

diff --git a/drivers/bus/mhi/ep/internal.h b/drivers/bus/mhi/ep/internal.h
index ee8c5974f0c0..8654af7caf40 100644
--- a/drivers/bus/mhi/ep/internal.h
+++ b/drivers/bus/mhi/ep/internal.h
@@ -241,6 +241,7 @@ int mhi_ep_set_mhi_state(struct mhi_ep_cntrl *mhi_cntrl, enum mhi_state mhi_stat
 int mhi_ep_set_m0_state(struct mhi_ep_cntrl *mhi_cntrl);
 int mhi_ep_set_m3_state(struct mhi_ep_cntrl *mhi_cntrl);
 int mhi_ep_set_ready_state(struct mhi_ep_cntrl *mhi_cntrl);
+void mhi_ep_handle_syserr(struct mhi_ep_cntrl *mhi_cntrl);
 
 /* MHI EP memory management functions */
 int mhi_ep_alloc_map(struct mhi_ep_cntrl *mhi_cntrl, u64 pci_addr, size_t size,
diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index ddedd0fb19aa..6378ac5c7e37 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -611,6 +611,30 @@ static void mhi_ep_reset_worker(struct work_struct *work)
 	}
 }
 
+/*
+ * We don't need to do anything special other than setting the MHI SYS_ERR
+ * state. The host issue will reset all contexts and issue MHI RESET so that we
+ * could also recover from error state.
+ */
+void mhi_ep_handle_syserr(struct mhi_ep_cntrl *mhi_cntrl)
+{
+	struct device *dev = &mhi_cntrl->mhi_dev->dev;
+	int ret;
+
+	/* If MHI EP is not enabled, nothing to do */
+	if (!mhi_cntrl->is_enabled)
+		return;
+
+	ret = mhi_ep_set_mhi_state(mhi_cntrl, MHI_STATE_SYS_ERR);
+	if (ret)
+		return;
+
+	/* Signal host that the device went to SYS_ERR state */
+	ret = mhi_ep_send_state_change_event(mhi_cntrl, MHI_STATE_SYS_ERR);
+	if (ret)
+		dev_err(dev, "Failed sending SYS_ERR state change event: %d\n", ret);
+}
+
 int mhi_ep_power_up(struct mhi_ep_cntrl *mhi_cntrl)
 {
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
diff --git a/drivers/bus/mhi/ep/sm.c b/drivers/bus/mhi/ep/sm.c
index 68e7f99b9137..9a75ecfe1adf 100644
--- a/drivers/bus/mhi/ep/sm.c
+++ b/drivers/bus/mhi/ep/sm.c
@@ -93,6 +93,7 @@ int mhi_ep_set_m0_state(struct mhi_ep_cntrl *mhi_cntrl)
 
 	ret = mhi_ep_set_mhi_state(mhi_cntrl, MHI_STATE_M0);
 	if (ret) {
+		mhi_ep_handle_syserr(mhi_cntrl);
 		spin_unlock_bh(&mhi_cntrl->state_lock);
 		return ret;
 	}
@@ -128,6 +129,7 @@ int mhi_ep_set_m3_state(struct mhi_ep_cntrl *mhi_cntrl)
 	spin_lock_bh(&mhi_cntrl->state_lock);
 	ret = mhi_ep_set_mhi_state(mhi_cntrl, MHI_STATE_M3);
 	if (ret) {
+		mhi_ep_handle_syserr(mhi_cntrl);
 		spin_unlock_bh(&mhi_cntrl->state_lock);
 		return ret;
 	}
-- 
2.25.1

