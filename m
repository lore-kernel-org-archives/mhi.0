Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4782C82
	for <mhi@lists.linux.dev>; Thu,  2 Dec 2021 11:38:17 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id u17so20003374plg.9
        for <mhi@lists.linux.dev>; Thu, 02 Dec 2021 03:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uXxNxYYV5RcHGgry8/y8RqGwg5B0/QotcI3nKFMorEY=;
        b=BXPRbj2Qu5dHWVrN6tGOyX9geBDY49fZxhhIDpA9RXI9OOTtqG5b+BBW36OIbpgmZc
         GGMMazAOykh6BNZZK39dZwfRT0EQPeuVu5FWr1oR1OCJGAKR+YwBRwpFtoaOhwMHW6V5
         fRhYdjTCE9cb/tHOZI9+Mx+e7kOrNIwKsNl+m6rpnaTzYghpyGhItJovE6TF9ctZVPCM
         z1TlqaLXS76YXOgOrYXi9nXk96uBXziK22vwppp4Bq1l1UinDo/4XNT8DHY3sGhulZzn
         WBJqUjxx8cbNb+cak6TA8xR003fwnFir7UQ9HZ5YQhWBDJbF5LXbqUjDJKOQqJ0az172
         IBwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uXxNxYYV5RcHGgry8/y8RqGwg5B0/QotcI3nKFMorEY=;
        b=HzSSRkvBfV3rdTZgRNQABZ5uXmoFXi+yQ3FZ8qBIdcOSRTVy9BzXYQY9vq9w3yU1kQ
         M1umNPkhp7VT7r4d6JMnl0F/m94Yg9M/lO1kV8DNAJD36oQq2OvOY8g66nLZuhpKXuRz
         AlL3JDZDj7fwE0F5KgninMKa8wfgIt++AjtdaF9YSeuLBGEXivvm41EJ7NRXltl+yqfK
         EAex6ySa8mphN0ybH+EOJZ8Nt+4B6keARez5+tOU8xDlaB9w+ag8WLyrDdiPb4Gfv8AC
         1FicTEKaWRe/cC1Lasd4f7vr++v0tTTUMETXfpHvtxMboygoLaJrRlfMSnjnWMj3afFu
         FDSg==
X-Gm-Message-State: AOAM531A9s0c7iRfR1kwModNlCMqT6EnMaWNG/A49Cfk8UG1IyJvuon3
	kYBMPqaepUBzW/nkaNy1e8xtIDF048vu
X-Google-Smtp-Source: ABdhPJwqoDiWydSWys1ELJ6GFmYWiGCZ1L72iBAely2qK/nzEA+cXaOXsaHsOnLjY0WBHqRk2jMPTw==
X-Received: by 2002:a17:90b:33d0:: with SMTP id lk16mr5506453pjb.20.1638445097166;
        Thu, 02 Dec 2021 03:38:17 -0800 (PST)
Received: from localhost.localdomain ([117.202.184.5])
        by smtp.gmail.com with ESMTPSA id h5sm3602552pfi.46.2021.12.02.03.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 03:38:16 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: mhi@lists.linux.dev
Cc: hemantk@codeaurora.org,
	bbhatt@codeaurora.org,
	quic_jhugo@quicinc.com,
	vinod.koul@linaro.org,
	bjorn.andersson@linaro.org,
	dmitry.baryshkov@linaro.org,
	skananth@codeaurora.org,
	vpernami@codeaurora.org,
	vbadigan@codeaurora.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 16/20] bus: mhi: ep: Add support for handling SYS_ERR condition
Date: Thu,  2 Dec 2021 17:05:48 +0530
Message-Id: <20211202113553.238011-17-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211202113553.238011-1-manivannan.sadhasivam@linaro.org>
References: <20211202113553.238011-1-manivannan.sadhasivam@linaro.org>
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
index ec508201c5c0..5c6b622482c9 100644
--- a/drivers/bus/mhi/ep/internal.h
+++ b/drivers/bus/mhi/ep/internal.h
@@ -228,5 +228,6 @@ int mhi_ep_set_mhi_state(struct mhi_ep_cntrl *mhi_cntrl, enum mhi_state mhi_stat
 int mhi_ep_set_m0_state(struct mhi_ep_cntrl *mhi_cntrl);
 int mhi_ep_set_m3_state(struct mhi_ep_cntrl *mhi_cntrl);
 int mhi_ep_set_ready_state(struct mhi_ep_cntrl *mhi_cntrl);
+void mhi_ep_handle_syserr(struct mhi_ep_cntrl *mhi_cntrl);
 
 #endif
diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index 0b0fad6bf69a..088eac0808d1 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -148,6 +148,30 @@ static int mhi_ep_send_cmd_comp_event(struct mhi_ep_cntrl *mhi_cntrl, enum mhi_e
 	return mhi_ep_send_event(mhi_cntrl, 0, &event);
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
 static int mhi_ep_cache_host_cfg(struct mhi_ep_cntrl *mhi_cntrl)
 {
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
diff --git a/drivers/bus/mhi/ep/sm.c b/drivers/bus/mhi/ep/sm.c
index 95cec5c627b4..50378b9f7300 100644
--- a/drivers/bus/mhi/ep/sm.c
+++ b/drivers/bus/mhi/ep/sm.c
@@ -98,6 +98,7 @@ int mhi_ep_set_m0_state(struct mhi_ep_cntrl *mhi_cntrl)
 
 	ret = mhi_ep_set_mhi_state(mhi_cntrl, MHI_STATE_M0);
 	if (ret) {
+		mhi_ep_handle_syserr(mhi_cntrl);
 		spin_unlock_bh(&mhi_cntrl->state_lock);
 		return ret;
 	}
@@ -133,6 +134,7 @@ int mhi_ep_set_m3_state(struct mhi_ep_cntrl *mhi_cntrl)
 	spin_lock_bh(&mhi_cntrl->state_lock);
 	ret = mhi_ep_set_mhi_state(mhi_cntrl, MHI_STATE_M3);
 	if (ret) {
+		mhi_ep_handle_syserr(mhi_cntrl);
 		spin_unlock_bh(&mhi_cntrl->state_lock);
 		return ret;
 	}
-- 
2.25.1

