Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D108F2C80
	for <mhi@lists.linux.dev>; Mon,  6 Dec 2021 16:11:07 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id r5so10911636pgi.6
        for <mhi@lists.linux.dev>; Mon, 06 Dec 2021 08:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/dZMe5fXW3JmkstQUnuTxaguikQO8croA43e/A9yBnw=;
        b=wsxIo8iRiao/IrGDfq47xrllVJ4TjbrPMq5pi3ujnxN/VKCJ3gsfxKRCeoeCqPfYQu
         kOwY5U32UUnpRggGW8w10rv9Qb+gMMChBODZE8cet49sqH0aXLIuy3Hy/fNcF2I49xtW
         w/tPBkVH6OZ0gml4qbyNHA2LKoSRu2Duh75QZw7O02/WxlK7y7iu/eS+gRwq5vnZ0TMf
         4NrQWs80FVlPsg+02Ay9mkBOTx6d4n9cp8+8F0Dpa7NfdGkA7BMrgrVXUDuNa+sp9Oa0
         tBWh2Wm8WKIWHNKf1R7ackwqOJUltuACyxAA6XpX27PTUDAPkFN9K/s0tPCDvwcBdLVB
         v8Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/dZMe5fXW3JmkstQUnuTxaguikQO8croA43e/A9yBnw=;
        b=xvlfTwjNzWm5mDBZc/eBMaUKocB5k2d03qU1ZqOh/2/PJxmyEqYXRT5+gUV0FFwmo4
         JfxQHTaH9uEulyPqCClcVkI0IxTtHi9HQQkjwVyhJSpEN1NzX++kP5yjiqfsYY+dMheP
         0Qru/bF8QAbA6zDqlFMTCGl9Epw7pihc+IHcDUIvNfGAAjgf7BytJ/aH0y2pc7xoyCZz
         Ga90DtirFBzRRHKO2eS18Mjk+asvBc0Tltywm59KGpeH48tvpXnRSHU7BTYkPZWptxnA
         ybbgj4mnUsIgz0auaRf+MHnJZZiubTNdZjd2fbEdscSD98O2dCKyI5+r1OoCAvT9wSQZ
         h/4w==
X-Gm-Message-State: AOAM533a5VnG+HMNTC83YrO8owtCUvloUNKdjCk9ieviv3TZeGuFFcbK
	d/rUkSeLNAiYIOeqk17PGxPJWYERzsFt
X-Google-Smtp-Source: ABdhPJzHztOd8XGPiN1RUx+EQUVKeXqRT/D1cHtxog5GiB7PeT8WgTwjvv+39GKJ//C4Nqx58PR66g==
X-Received: by 2002:a05:6a00:1594:b0:4ae:dc6:f344 with SMTP id u20-20020a056a00159400b004ae0dc6f344mr7919655pfk.56.1638807066912;
        Mon, 06 Dec 2021 08:11:06 -0800 (PST)
Received: from localhost.localdomain ([117.217.176.38])
        by smtp.gmail.com with ESMTPSA id lr6sm11288968pjb.0.2021.12.06.08.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 08:11:06 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: mhi@lists.linux.dev
Cc: hemantk@codeaurora.org,
	bbhatt@codeaurora.org,
	loic.poulain@linaro.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	kvalo@codeaurora.org,
	stable@vger.kernel.org,
	Pengyu Ma <mapengyu@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH] bus: mhi: core: Add support for forced PM resume
Date: Mon,  6 Dec 2021 21:40:59 +0530
Message-Id: <20211206161059.107007-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Loic Poulain <loic.poulain@linaro.org>

For whatever reason, some devices like QCA6390, WCN6855 using ath11k
are not in M3 state during PM resume, but still functional. The
mhi_pm_resume should then not fail in those cases, and let the higher
level device specific stack continue resuming process.

Add a new parameter to mhi_pm_resume, to force resuming, whatever the
current MHI state is. This fixes a regression with non functional
ath11k WiFi after suspend/resume cycle on some machines.

Bug report: https://bugzilla.kernel.org/show_bug.cgi?id=214179

Cc: stable@vger.kernel.org #5.13
Fixes: 020d3b26c07a ("bus: mhi: Early MHI resume failure in non M3 state")
Reported-by: Kalle Valo <kvalo@codeaurora.org>
Reported-by: Pengyu Ma <mapengyu@gmail.com>
Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
[mani: Added comment, bug report, added reported-by tags and CCed stable]
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/pm.c             | 10 +++++++---
 drivers/bus/mhi/pci_generic.c         |  2 +-
 drivers/net/wireless/ath/ath11k/mhi.c |  6 +++++-
 include/linux/mhi.h                   |  3 ++-
 4 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index 7464f5d09973..4ddd266e042e 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -881,7 +881,7 @@ int mhi_pm_suspend(struct mhi_controller *mhi_cntrl)
 }
 EXPORT_SYMBOL_GPL(mhi_pm_suspend);
 
-int mhi_pm_resume(struct mhi_controller *mhi_cntrl)
+int mhi_pm_resume(struct mhi_controller *mhi_cntrl, bool force)
 {
 	struct mhi_chan *itr, *tmp;
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
@@ -898,8 +898,12 @@ int mhi_pm_resume(struct mhi_controller *mhi_cntrl)
 	if (MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state))
 		return -EIO;
 
-	if (mhi_get_mhi_state(mhi_cntrl) != MHI_STATE_M3)
-		return -EINVAL;
+	if (mhi_get_mhi_state(mhi_cntrl) != MHI_STATE_M3) {
+		dev_warn(dev, "Resuming from non M3 state (%s)\n",
+			 TO_MHI_STATE_STR(mhi_get_mhi_state(mhi_cntrl)));
+		if (!force)
+			return -EINVAL;
+	}
 
 	/* Notify clients about exiting LPM */
 	list_for_each_entry_safe(itr, tmp, &mhi_cntrl->lpm_chans, node) {
diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index 9ef41354237c..efd1da66fdf9 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -959,7 +959,7 @@ static int __maybe_unused mhi_pci_runtime_resume(struct device *dev)
 		return 0; /* Nothing to do at MHI level */
 
 	/* Exit M3, transition to M0 state */
-	err = mhi_pm_resume(mhi_cntrl);
+	err = mhi_pm_resume(mhi_cntrl, false);
 	if (err) {
 		dev_err(&pdev->dev, "failed to resume device: %d\n", err);
 		goto err_recovery;
diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
index 26c7ae242db6..f1f2fa2d690d 100644
--- a/drivers/net/wireless/ath/ath11k/mhi.c
+++ b/drivers/net/wireless/ath/ath11k/mhi.c
@@ -533,7 +533,11 @@ static int ath11k_mhi_set_state(struct ath11k_pci *ab_pci,
 		ret = mhi_pm_suspend(ab_pci->mhi_ctrl);
 		break;
 	case ATH11K_MHI_RESUME:
-		ret = mhi_pm_resume(ab_pci->mhi_ctrl);
+		/* Do force MHI resume as some devices like QCA6390, WCN6855
+		 * are not in M3 state but they are functional. So just ignore
+		 * the MHI state while resuming.
+		 */
+		ret = mhi_pm_resume(ab_pci->mhi_ctrl, true);
 		break;
 	case ATH11K_MHI_TRIGGER_RDDM:
 		ret = mhi_force_rddm_mode(ab_pci->mhi_ctrl);
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 723985879035..102303288cee 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -660,8 +660,9 @@ int mhi_pm_suspend(struct mhi_controller *mhi_cntrl);
 /**
  * mhi_pm_resume - Resume MHI from suspended state
  * @mhi_cntrl: MHI controller
+ * @force: Force resuming to M0 irrespective of the device MHI state
  */
-int mhi_pm_resume(struct mhi_controller *mhi_cntrl);
+int mhi_pm_resume(struct mhi_controller *mhi_cntrl, bool force);
 
 /**
  * mhi_download_rddm_image - Download ramdump image from device for
-- 
2.25.1

