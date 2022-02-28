Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBE253BA
	for <mhi@lists.linux.dev>; Mon, 28 Feb 2022 12:45:51 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id gl14-20020a17090b120e00b001bc2182c3d5so11856014pjb.1
        for <mhi@lists.linux.dev>; Mon, 28 Feb 2022 04:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2C1yMFxjGjTvy7CTcaK951xmErKjxy0jIgFxKiOd2x8=;
        b=uCgxUvlhbxXapqigUVqcFyuP9S9KjvbT0yXIw8/FPCsDoaD2hNpa2y3PJzNSNdODAr
         5zDhcTr/ij16AhJmkGPyizu6m6bHhQtfS97/5nHbtJQseebt0KAS6FLY4CCg6gC7/GTf
         iyjobFHGeV21HdU7eOby0Tea6CfGSsJfeWDeDl3oCR1xiOu3s7FSnjpcdUs5NeDiWN/t
         RAa3QRflTim0C2fmA1sq61+lzsoSO7KF93OI2xS4bVUftnprdOuV2W+odrUxJ0VYZsLa
         NUXmK0AdFC7VlAvXxN3XZA/TOwzt3c2y3gvZdz6wgL8Qsw8qq9G+9N2X55tNsbIOD8n7
         kvTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2C1yMFxjGjTvy7CTcaK951xmErKjxy0jIgFxKiOd2x8=;
        b=xPY1ntwSMrD+2cK/Zr9oPHNbvs5Khjzic6pa/dz5sOamh5rwDMOntcxRq8H1wByTB+
         rs+82bqtfapBRiYly48wy3uPztxVi73l4pZ8UcmyhgxoNURNszgiIB1xlunaXBrQFyQk
         29YqccFyeX1YcIgBPIEuZbiB+MrjcfyI7UXFDQgVF9cqKfmjosdq0BVg9zIeJnHvav4s
         Vcfj3gkTvxn0RR7hisGKvg/Ox7hsdeNaJDC08DthKd9jgsZVIexJTqM671YsaAWs5kmw
         5mYPQUXdTKUhPjQcBk8+aY1fcgyR8s6pxPMiR3LgGsVDklpqD3UpysqOvulTJiUlJIT2
         hDAw==
X-Gm-Message-State: AOAM533vOK2E643PtfidkZt00jM04r7pcG/J9abZOaHI2Atx8x7eB1sr
	n//St/dM6TIVMhBI8IEXPNLVdM9kU+2T
X-Google-Smtp-Source: ABdhPJyf1eJc3IYDKvt+eJAGN6QzUWzHYipo4VQoUgN4Kv11Lx10mYz/Jhw5zCXCPZ2W0XVnJStrSQ==
X-Received: by 2002:a17:902:6b0a:b0:14d:8ee9:3298 with SMTP id o10-20020a1709026b0a00b0014d8ee93298mr20252851plk.125.1646052351008;
        Mon, 28 Feb 2022 04:45:51 -0800 (PST)
Received: from localhost.localdomain ([117.207.25.37])
        by smtp.gmail.com with ESMTPSA id y12-20020a056a00190c00b004f39e28fb87sm14256737pfi.98.2022.02.28.04.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 04:45:50 -0800 (PST)
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
Subject: [PATCH v4 21/27] bus: mhi: ep: Add support for handling SYS_ERR condition
Date: Mon, 28 Feb 2022 18:13:38 +0530
Message-Id: <20220228124344.77359-22-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220228124344.77359-1-manivannan.sadhasivam@linaro.org>
References: <20220228124344.77359-1-manivannan.sadhasivam@linaro.org>
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
index a2ec4169a4b2..a229d8b70227 100644
--- a/drivers/bus/mhi/ep/internal.h
+++ b/drivers/bus/mhi/ep/internal.h
@@ -209,6 +209,7 @@ int mhi_ep_set_mhi_state(struct mhi_ep_cntrl *mhi_cntrl, enum mhi_state mhi_stat
 int mhi_ep_set_m0_state(struct mhi_ep_cntrl *mhi_cntrl);
 int mhi_ep_set_m3_state(struct mhi_ep_cntrl *mhi_cntrl);
 int mhi_ep_set_ready_state(struct mhi_ep_cntrl *mhi_cntrl);
+void mhi_ep_handle_syserr(struct mhi_ep_cntrl *mhi_cntrl);
 
 /* MHI EP memory management functions */
 int mhi_ep_alloc_map(struct mhi_ep_cntrl *mhi_cntrl, u64 pci_addr, size_t size,
diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index 99cbad2a94c9..132fd9f51a1f 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -548,6 +548,26 @@ static void mhi_ep_reset_worker(struct work_struct *work)
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
index ad49276ec044..4d6e8c2d615c 100644
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

