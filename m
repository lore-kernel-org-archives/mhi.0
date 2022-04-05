Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706602F3A
	for <mhi@lists.linux.dev>; Tue,  5 Apr 2022 13:59:07 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id ku13-20020a17090b218d00b001ca8fcd3adeso2622501pjb.2
        for <mhi@lists.linux.dev>; Tue, 05 Apr 2022 06:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FlDX9fQV9YwI2F2bsF/EhT89ZCpPX/Uxw6NOPcG/zWs=;
        b=vpfHXe2NKDpDlZOUubw/epseFWJYmzTK8I77LrHDUtVgVvNxWJLYVFm4Nw6VlN9whs
         Kxln9wEZ2CRA8FsH9PU5mi95PNoHoP4GWEapJH4Xc4U/PGwzruUl1h93BQlSvnQcdyPe
         y0YtQEVbBngqi2TDqoSexbidaWxDM8Tp8ht1yMXLHWsIdRZdcPv1QdnlYuo9c8FCPE89
         Nn/SFJmJKbIQuh5k/DtqmvQKF/kJWgO7D2kdmy6w7w0ZBqO7VrPBkMBEttF6JVVKhmG7
         QLUOVZxVU0YbWzDp6ydW7J8xT6qUkJeLpVIponOsgiyiBbqFyvaEEcoibQcBj1xbqbJ/
         fj5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FlDX9fQV9YwI2F2bsF/EhT89ZCpPX/Uxw6NOPcG/zWs=;
        b=G4GHem2VuN6fVknnwF1fyMY54PY4buIFJ8DYN4kzDaX6VUsBYEZpuSfvWulM07+Cjs
         ApkrJ+bm1yxWLBeDauz6dIRBUHrgkNKQScWnFTwH6K/kzXCzNPwk7RoBvm0FNu4i5LZB
         Ud8Z1fQPlCZeDOWJFxzWlLk8HlliYsyJ5dTb9DaXTY1FpivQYZ+QDIsNtoO8S4NrOuiQ
         8BgVZsGco5okJb4OMhXRb32UO8V4D7G4d4wM1LgXKtud9ndFWqIe1GoiSup+HcJJEUGV
         9leMEGVn0QTGuboDFfROZ8CWunq2Oapzs0zQDzPgdIqMsdwqCanBXB1CwDzQAeq07/Kd
         H/Ig==
X-Gm-Message-State: AOAM530XsenHSOOYEne4rMd8dBydnZDKpdJLQb5iyC6ufOVhg6Z9Ggbr
	m4RBPT735VW3UTpilGDvU8sZ
X-Google-Smtp-Source: ABdhPJx9jXnVCoeYIBfz9Q4nYaydHk89UYiMnWdYdSATjinvEhEEvVQ+jncDXj6i4vUE9kjQAl0gmA==
X-Received: by 2002:a17:903:40c7:b0:156:8b56:5fa1 with SMTP id t7-20020a17090340c700b001568b565fa1mr3657852pld.108.1649167146927;
        Tue, 05 Apr 2022 06:59:06 -0700 (PDT)
Received: from localhost.localdomain ([59.92.98.98])
        by smtp.gmail.com with ESMTPSA id u14-20020a056a00124e00b004fab8f3245fsm16785402pfi.149.2022.04.05.06.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 06:59:06 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: gregkh@linuxfoundation.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	elder@linaro.org,
	mhi@lists.linux.dev,
	quic_hemantk@quicinc.com,
	quic_bbhatt@quicinc.com,
	quic_jhugo@quicinc.com,
	bjorn.andersson@linaro.org,
	dmitry.baryshkov@linaro.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 12/18] bus: mhi: ep: Add support for handling SYS_ERR condition
Date: Tue,  5 Apr 2022 19:27:48 +0530
Message-Id: <20220405135754.6622-13-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220405135754.6622-1-manivannan.sadhasivam@linaro.org>
References: <20220405135754.6622-1-manivannan.sadhasivam@linaro.org>
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

Reviewed-by: Alex Elder <elder@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/ep/internal.h |  1 +
 drivers/bus/mhi/ep/main.c     | 20 ++++++++++++++++++++
 drivers/bus/mhi/ep/sm.c       | 11 +++++++++--
 3 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/mhi/ep/internal.h b/drivers/bus/mhi/ep/internal.h
index 4f2e26841702..d201d755560c 100644
--- a/drivers/bus/mhi/ep/internal.h
+++ b/drivers/bus/mhi/ep/internal.h
@@ -211,5 +211,6 @@ int mhi_ep_set_mhi_state(struct mhi_ep_cntrl *mhi_cntrl, enum mhi_state mhi_stat
 int mhi_ep_set_m0_state(struct mhi_ep_cntrl *mhi_cntrl);
 int mhi_ep_set_m3_state(struct mhi_ep_cntrl *mhi_cntrl);
 int mhi_ep_set_ready_state(struct mhi_ep_cntrl *mhi_cntrl);
+void mhi_ep_handle_syserr(struct mhi_ep_cntrl *mhi_cntrl);
 
 #endif
diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index d36708d43eb6..706473ea4918 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -516,6 +516,26 @@ static void mhi_ep_reset_worker(struct work_struct *work)
 	}
 }
 
+/*
+ * We don't need to do anything special other than setting the MHI SYS_ERR
+ * state. The host will reset all contexts and issue MHI RESET so that we
+ * could also recover from error state.
+ */
+void mhi_ep_handle_syserr(struct mhi_ep_cntrl *mhi_cntrl)
+{
+	struct device *dev = &mhi_cntrl->mhi_dev->dev;
+	int ret;
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
index ffc02f5d0a0d..e3865b85399d 100644
--- a/drivers/bus/mhi/ep/sm.c
+++ b/drivers/bus/mhi/ep/sm.c
@@ -68,8 +68,10 @@ int mhi_ep_set_m0_state(struct mhi_ep_cntrl *mhi_cntrl)
 	ret = mhi_ep_set_mhi_state(mhi_cntrl, MHI_STATE_M0);
 	spin_unlock_bh(&mhi_cntrl->state_lock);
 
-	if (ret)
+	if (ret) {
+		mhi_ep_handle_syserr(mhi_cntrl);
 		return ret;
+	}
 
 	/* Signal host that the device moved to M0 */
 	ret = mhi_ep_send_state_change_event(mhi_cntrl, MHI_STATE_M0);
@@ -99,8 +101,10 @@ int mhi_ep_set_m3_state(struct mhi_ep_cntrl *mhi_cntrl)
 	ret = mhi_ep_set_mhi_state(mhi_cntrl, MHI_STATE_M3);
 	spin_unlock_bh(&mhi_cntrl->state_lock);
 
-	if (ret)
+	if (ret) {
+		mhi_ep_handle_syserr(mhi_cntrl);
 		return ret;
+	}
 
 	/* Signal host that the device moved to M3 */
 	ret = mhi_ep_send_state_change_event(mhi_cntrl, MHI_STATE_M3);
@@ -132,5 +136,8 @@ int mhi_ep_set_ready_state(struct mhi_ep_cntrl *mhi_cntrl)
 	ret = mhi_ep_set_mhi_state(mhi_cntrl, MHI_STATE_READY);
 	spin_unlock_bh(&mhi_cntrl->state_lock);
 
+	if (ret)
+		mhi_ep_handle_syserr(mhi_cntrl);
+
 	return ret;
 }
-- 
2.25.1

