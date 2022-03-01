Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2B65CAB
	for <mhi@lists.linux.dev>; Tue,  1 Mar 2022 16:04:00 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id a5so13790731pfv.9
        for <mhi@lists.linux.dev>; Tue, 01 Mar 2022 08:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WEFxl3A7U0PLSCvQxVSal2TFd6/cSAkyMe9Kxv0kMXA=;
        b=PQ6oxHrdWBdIaMbE9UUJmesX7geXNmAap+YUbfL3K1Cj3KuTKeu3GnFt4lOJ9Wg+kb
         xLe7JM+uJTIFBtN9kU7SCSzKISc0+EfVVPHTvQ7UATDV6j4Y7VgFF5PYeboHeMVx/m7P
         5/EZrOy5nIqX+BkUkexf8sTBI7PoxcFASZ/14ns7fSAJRL2CAy1O2nEShvTeL3R2cLss
         hJJiCbtrC/3F0fg62kcC8pGaVsAv7Ym2kMYZkU/ABsJ9sXYiBoCZHMbKdCZACkIKKVAx
         SPJ33nB+A1Mllx5Mu8DGwKHsFOCcgVJl+gHX8CHTI3ABHEzWam4utDHYI1o1eWIET+xx
         e3BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WEFxl3A7U0PLSCvQxVSal2TFd6/cSAkyMe9Kxv0kMXA=;
        b=C2Nr8Asek2RiTmxjtkVjhG4RJH9SX5wtA2z/x+KCVUl8JPfzPJjfQgQNiOsaGE7c92
         9zCrz68NanGKmayviac21XTY5uyaz0q7Ds0KFxVWSQLU7uMNIK//yzx43n0gocw/h0Fn
         MI4uTR6DcKWgUT1H+jcipZ6L6qjRSVen4vJ4JPz+bXVTKrvJ2S5i3VnwFDTuOXmSSSqw
         N54JpE8oQ3Mza36EskQeTiBRSHtDxBsHNkLb/sHia+0GPe+wpc8mW2kk2nbSGI8DNKXE
         2dP8HqGS3898TaKKnsN1UDuiWNSskXnOaDYeEOJh2GY1HsmtuK66rLN5oYj13F17DvT8
         JKsQ==
X-Gm-Message-State: AOAM532L3tc+lJ46M7uA6Urh2IyQSLUEZnJvD7MfVVzqOoEIrRxTRmSO
	QVEY0unLSfEX6aTcgBNTJXF+
X-Google-Smtp-Source: ABdhPJyo8/ilgKOlhR/BNVZbuEfZJ3ZDKPulqUD708NOU0TmwhEhteBmTUATw9qqQtKt+IJJIprSAg==
X-Received: by 2002:a65:5782:0:b0:378:43c1:ac18 with SMTP id b2-20020a655782000000b0037843c1ac18mr17409335pgr.158.1646150639862;
        Tue, 01 Mar 2022 08:03:59 -0800 (PST)
Received: from localhost.localdomain ([117.207.25.80])
        by smtp.gmail.com with ESMTPSA id m17-20020a17090a859100b001bc20ddcc67sm2489530pjn.34.2022.03.01.08.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 08:03:59 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: gregkh@linuxfoundation.org
Cc: mhi@lists.linux.dev,
	quic_hemantk@quicinc.com,
	quic_bbhatt@quicinc.com,
	elder@linaro.org,
	paul.davey@alliedtelesis.co.nz,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Hemant Kumar <hemantk@codeaurora.org>
Subject: [PATCH 10/10] bus: mhi: Make mhi_state_str[] array static inline and move to common.h
Date: Tue,  1 Mar 2022 21:33:08 +0530
Message-Id: <20220301160308.107452-11-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301160308.107452-1-manivannan.sadhasivam@linaro.org>
References: <20220301160308.107452-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mhi_state_str[] array could be used by MHI endpoint stack also. So let's
make the array as "static inline function" and move it inside the
"common.h" header so that the endpoint stack could also make use of it.

Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
Reviewed-by: Alex Elder <elder@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/common.h       | 29 +++++++++++++++++++++++++----
 drivers/bus/mhi/host/boot.c    |  2 +-
 drivers/bus/mhi/host/debugfs.c |  6 +++---
 drivers/bus/mhi/host/init.c    | 12 ------------
 drivers/bus/mhi/host/main.c    |  8 ++++----
 drivers/bus/mhi/host/pm.c      | 14 +++++++-------
 6 files changed, 40 insertions(+), 31 deletions(-)

diff --git a/drivers/bus/mhi/common.h b/drivers/bus/mhi/common.h
index f2690bf11c99..b4ef9acd3ce7 100644
--- a/drivers/bus/mhi/common.h
+++ b/drivers/bus/mhi/common.h
@@ -275,9 +275,30 @@ struct mhi_ring_element {
 	__le32 dword[2];
 };
 
-extern const char * const mhi_state_str[MHI_STATE_MAX];
-#define TO_MHI_STATE_STR(state) ((state >= MHI_STATE_MAX || \
-				  !mhi_state_str[state]) ? \
-				"INVALID_STATE" : mhi_state_str[state])
+static inline const char *mhi_state_str(enum mhi_state state)
+{
+	switch (state) {
+	case MHI_STATE_RESET:
+		return "RESET";
+	case MHI_STATE_READY:
+		return "READY";
+	case MHI_STATE_M0:
+		return "M0";
+	case MHI_STATE_M1:
+		return "M1";
+	case MHI_STATE_M2:
+		return "M2";
+	case MHI_STATE_M3:
+		return "M3";
+	case MHI_STATE_M3_FAST:
+		return "M3 FAST";
+	case MHI_STATE_BHI:
+		return "BHI";
+	case MHI_STATE_SYS_ERR:
+		return "SYS ERROR";
+	default:
+		return "Unknown state";
+	}
+};
 
 #endif /* _MHI_COMMON_H */
diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
index d5ba3c7efb61..b0da7ca4519c 100644
--- a/drivers/bus/mhi/host/boot.c
+++ b/drivers/bus/mhi/host/boot.c
@@ -67,7 +67,7 @@ static int __mhi_download_rddm_in_panic(struct mhi_controller *mhi_cntrl)
 
 	dev_dbg(dev, "Entered with pm_state:%s dev_state:%s ee:%s\n",
 		to_mhi_pm_state_str(mhi_cntrl->pm_state),
-		TO_MHI_STATE_STR(mhi_cntrl->dev_state),
+		mhi_state_str(mhi_cntrl->dev_state),
 		TO_MHI_EXEC_STR(mhi_cntrl->ee));
 
 	/*
diff --git a/drivers/bus/mhi/host/debugfs.c b/drivers/bus/mhi/host/debugfs.c
index bdc875d7bd4d..cfec7811dfbb 100644
--- a/drivers/bus/mhi/host/debugfs.c
+++ b/drivers/bus/mhi/host/debugfs.c
@@ -20,7 +20,7 @@ static int mhi_debugfs_states_show(struct seq_file *m, void *d)
 	seq_printf(m, "PM state: %s Device: %s MHI state: %s EE: %s wake: %s\n",
 		   to_mhi_pm_state_str(mhi_cntrl->pm_state),
 		   mhi_is_active(mhi_cntrl) ? "Active" : "Inactive",
-		   TO_MHI_STATE_STR(mhi_cntrl->dev_state),
+		   mhi_state_str(mhi_cntrl->dev_state),
 		   TO_MHI_EXEC_STR(mhi_cntrl->ee),
 		   mhi_cntrl->wake_set ? "true" : "false");
 
@@ -206,13 +206,13 @@ static int mhi_debugfs_regdump_show(struct seq_file *m, void *d)
 
 	seq_printf(m, "Host PM state: %s Device state: %s EE: %s\n",
 		   to_mhi_pm_state_str(mhi_cntrl->pm_state),
-		   TO_MHI_STATE_STR(mhi_cntrl->dev_state),
+		   mhi_state_str(mhi_cntrl->dev_state),
 		   TO_MHI_EXEC_STR(mhi_cntrl->ee));
 
 	state = mhi_get_mhi_state(mhi_cntrl);
 	ee = mhi_get_exec_env(mhi_cntrl);
 	seq_printf(m, "Device EE: %s state: %s\n", TO_MHI_EXEC_STR(ee),
-		   TO_MHI_STATE_STR(state));
+		   mhi_state_str(state));
 
 	for (i = 0; regs[i].name; i++) {
 		if (!regs[i].base)
diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
index 016dcc35db80..a665b8e92408 100644
--- a/drivers/bus/mhi/host/init.c
+++ b/drivers/bus/mhi/host/init.c
@@ -45,18 +45,6 @@ const char * const dev_state_tran_str[DEV_ST_TRANSITION_MAX] = {
 	[DEV_ST_TRANSITION_DISABLE] = "DISABLE",
 };
 
-const char * const mhi_state_str[MHI_STATE_MAX] = {
-	[MHI_STATE_RESET] = "RESET",
-	[MHI_STATE_READY] = "READY",
-	[MHI_STATE_M0] = "M0",
-	[MHI_STATE_M1] = "M1",
-	[MHI_STATE_M2] = "M2",
-	[MHI_STATE_M3] = "M3",
-	[MHI_STATE_M3_FAST] = "M3 FAST",
-	[MHI_STATE_BHI] = "BHI",
-	[MHI_STATE_SYS_ERR] = "SYS ERROR",
-};
-
 const char * const mhi_ch_state_type_str[MHI_CH_STATE_TYPE_MAX] = {
 	[MHI_CH_STATE_TYPE_RESET] = "RESET",
 	[MHI_CH_STATE_TYPE_STOP] = "STOP",
diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
index dabf85b92a84..9021be7f2359 100644
--- a/drivers/bus/mhi/host/main.c
+++ b/drivers/bus/mhi/host/main.c
@@ -477,8 +477,8 @@ irqreturn_t mhi_intvec_threaded_handler(int irq_number, void *priv)
 	ee = mhi_get_exec_env(mhi_cntrl);
 	dev_dbg(dev, "local ee: %s state: %s device ee: %s state: %s\n",
 		TO_MHI_EXEC_STR(mhi_cntrl->ee),
-		TO_MHI_STATE_STR(mhi_cntrl->dev_state),
-		TO_MHI_EXEC_STR(ee), TO_MHI_STATE_STR(state));
+		mhi_state_str(mhi_cntrl->dev_state),
+		TO_MHI_EXEC_STR(ee), mhi_state_str(state));
 
 	if (state == MHI_STATE_SYS_ERR) {
 		dev_dbg(dev, "System error detected\n");
@@ -844,7 +844,7 @@ int mhi_process_ctrl_ev_ring(struct mhi_controller *mhi_cntrl,
 			new_state = MHI_TRE_GET_EV_STATE(local_rp);
 
 			dev_dbg(dev, "State change event to state: %s\n",
-				TO_MHI_STATE_STR(new_state));
+				mhi_state_str(new_state));
 
 			switch (new_state) {
 			case MHI_STATE_M0:
@@ -871,7 +871,7 @@ int mhi_process_ctrl_ev_ring(struct mhi_controller *mhi_cntrl,
 			}
 			default:
 				dev_err(dev, "Invalid state: %s\n",
-					TO_MHI_STATE_STR(new_state));
+					mhi_state_str(new_state));
 			}
 
 			break;
diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
index bb8a23e80e19..3d90b8ecd3d9 100644
--- a/drivers/bus/mhi/host/pm.c
+++ b/drivers/bus/mhi/host/pm.c
@@ -541,7 +541,7 @@ static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl)
 
 	dev_dbg(dev, "Exiting with PM state: %s, MHI state: %s\n",
 		to_mhi_pm_state_str(mhi_cntrl->pm_state),
-		TO_MHI_STATE_STR(mhi_cntrl->dev_state));
+		mhi_state_str(mhi_cntrl->dev_state));
 
 	mutex_unlock(&mhi_cntrl->pm_mutex);
 }
@@ -684,7 +684,7 @@ static void mhi_pm_sys_error_transition(struct mhi_controller *mhi_cntrl)
 exit_sys_error_transition:
 	dev_dbg(dev, "Exiting with PM state: %s, MHI state: %s\n",
 		to_mhi_pm_state_str(mhi_cntrl->pm_state),
-		TO_MHI_STATE_STR(mhi_cntrl->dev_state));
+		mhi_state_str(mhi_cntrl->dev_state));
 
 	mutex_unlock(&mhi_cntrl->pm_mutex);
 }
@@ -859,7 +859,7 @@ int mhi_pm_suspend(struct mhi_controller *mhi_cntrl)
 	if (!ret || MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state)) {
 		dev_err(dev,
 			"Did not enter M3 state, MHI state: %s, PM state: %s\n",
-			TO_MHI_STATE_STR(mhi_cntrl->dev_state),
+			mhi_state_str(mhi_cntrl->dev_state),
 			to_mhi_pm_state_str(mhi_cntrl->pm_state));
 		return -EIO;
 	}
@@ -885,7 +885,7 @@ static int __mhi_pm_resume(struct mhi_controller *mhi_cntrl, bool force)
 
 	dev_dbg(dev, "Entered with PM state: %s, MHI state: %s\n",
 		to_mhi_pm_state_str(mhi_cntrl->pm_state),
-		TO_MHI_STATE_STR(mhi_cntrl->dev_state));
+		mhi_state_str(mhi_cntrl->dev_state));
 
 	if (mhi_cntrl->pm_state == MHI_PM_DISABLE)
 		return 0;
@@ -895,7 +895,7 @@ static int __mhi_pm_resume(struct mhi_controller *mhi_cntrl, bool force)
 
 	if (mhi_get_mhi_state(mhi_cntrl) != MHI_STATE_M3) {
 		dev_warn(dev, "Resuming from non M3 state (%s)\n",
-			 TO_MHI_STATE_STR(mhi_get_mhi_state(mhi_cntrl)));
+			 mhi_state_str(mhi_get_mhi_state(mhi_cntrl)));
 		if (!force)
 			return -EINVAL;
 	}
@@ -932,7 +932,7 @@ static int __mhi_pm_resume(struct mhi_controller *mhi_cntrl, bool force)
 	if (!ret || MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state)) {
 		dev_err(dev,
 			"Did not enter M0 state, MHI state: %s, PM state: %s\n",
-			TO_MHI_STATE_STR(mhi_cntrl->dev_state),
+			mhi_state_str(mhi_cntrl->dev_state),
 			to_mhi_pm_state_str(mhi_cntrl->pm_state));
 		return -EIO;
 	}
@@ -1083,7 +1083,7 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
 
 	state = mhi_get_mhi_state(mhi_cntrl);
 	dev_dbg(dev, "Attempting power on with EE: %s, state: %s\n",
-		TO_MHI_EXEC_STR(current_ee), TO_MHI_STATE_STR(state));
+		TO_MHI_EXEC_STR(current_ee), mhi_state_str(state));
 
 	if (state == MHI_STATE_SYS_ERR) {
 		mhi_set_mhi_state(mhi_cntrl, MHI_STATE_RESET);
-- 
2.25.1

