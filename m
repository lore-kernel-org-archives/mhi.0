Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A302C82
	for <mhi@lists.linux.dev>; Sat, 16 Oct 2021 06:58:00 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id v20so7764566plo.7
        for <mhi@lists.linux.dev>; Fri, 15 Oct 2021 23:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PkPlTxMLNL0lEUyw8jTf3gF9SNwtyvdHFPx57MbnYJQ=;
        b=xbNqVVOheQWQTFF0eURdCAN/R7I5PgSPZsP/c5+RBjakjvMKSDFeMlWgetQE6U/Tju
         RJHEG3bIawnEsva6o4YWuxEW8yddOP1PusJwUG3CBr0BD5j0Ah533VUovZAQ35ziQ1YV
         CULSuOXucAiE2PdfZL3a7WC0rsd8CJh7/JNm3MNJ/FK3gnIpaIxgGHHy1qnBYQHnoWzf
         ZB9K/uuW5DadIV9DyAPVQE7UdHn8WkSWJzJuG6yRVaA8MvLMhiIbhvF8mwuCPsw8wbQA
         qwcfZXavUbY55vxdzxlTmcWKuT/xBVZ5b9LWZCoQbXBKrhIugIM45k3yEP9Zwzpy77ih
         i5IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PkPlTxMLNL0lEUyw8jTf3gF9SNwtyvdHFPx57MbnYJQ=;
        b=Ni8+OkBEGM7Qd5+i7vLPoPMCLaYdDmU09InVNATGIrufyDi9ti4VCXNbn0hVa2ZCqR
         v0DzO7VWyrdLalOem0k4eL907qo+8A4DnHK+1B11Fvy3zC59rOPMJd9bL1s8zRbAT90J
         4lNBFZ5NnsFUUFRQgno59754f0S03G2pNhJVPsLk2xhtUW9Qqu1Lxq/n6dyxTwDVRH/i
         8UkyyiJcCO/Q6oOt86vjobxJ4uAyNTIU5WsvnxbI0krsJAqel3purZlTpXRtJMGNcu2p
         2u50QYBiIUnHV897ua4VOf5W1Gd1yj+mEDBrRuHgMGbTG/PQk+kKGsBYQWElZGZeg95+
         DGig==
X-Gm-Message-State: AOAM533yDBCx5R8zcol5uVtL4QDHGKP8fHIlV8g/iq7fl9f4OPgwYUN6
	yf4FMI6br2UwgPK7xGR4h7v1+dUOt1fV
X-Google-Smtp-Source: ABdhPJyMuHY4AiWKf98UqHt0sVl0n6KCkCRYUkpK8FMuSfQqVgC5GCE4dVbwLH8XfZesWjiAXow0Jw==
X-Received: by 2002:a17:903:228c:b0:13e:f389:4ca9 with SMTP id b12-20020a170903228c00b0013ef3894ca9mr15179882plh.80.1634367480191;
        Fri, 15 Oct 2021 23:58:00 -0700 (PDT)
Received: from localhost.localdomain ([117.202.185.237])
        by smtp.gmail.com with ESMTPSA id a17sm7024253pfd.54.2021.10.15.23.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 23:57:59 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: gregkh@linuxfoundation.org
Cc: hemantk@codeaurora.org,
	bbhatt@codeaurora.org,
	loic.poulain@linaro.org,
	wangqing@vivo.com,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH 2/3] bus: mhi: Add inbound buffers allocation flag
Date: Sat, 16 Oct 2021 12:27:33 +0530
Message-Id: <20211016065734.28802-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211016065734.28802-1-manivannan.sadhasivam@linaro.org>
References: <20211016065734.28802-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Loic Poulain <loic.poulain@linaro.org>

Currently, the MHI controller driver defines which channels should
have their inbound buffers allocated and queued. But ideally, this is
something that should be decided by the MHI device driver instead,
which actually deals with that buffers.

Add a flag parameter to mhi_prepare_for_transfer allowing to specify
if buffers have to be allocated and queued by the MHI stack.

Keep auto_queue flag for now, but should be removed at some point.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
Tested-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Acked-by: Jakub Kicinski <kuba@kernel.org>
Link: https://lore.kernel.org/r/1624566520-20406-1-git-send-email-loic.poulain@linaro.org
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/internal.h  | 2 +-
 drivers/bus/mhi/core/main.c      | 9 ++++++---
 drivers/net/mhi_net.c            | 2 +-
 drivers/net/wwan/mhi_wwan_ctrl.c | 2 +-
 include/linux/mhi.h              | 7 ++++++-
 net/qrtr/mhi.c                   | 2 +-
 6 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
index 3a732afaf73e..721739c5e0d5 100644
--- a/drivers/bus/mhi/core/internal.h
+++ b/drivers/bus/mhi/core/internal.h
@@ -682,7 +682,7 @@ void mhi_rddm_prepare(struct mhi_controller *mhi_cntrl,
 		      struct image_info *img_info);
 void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl);
 int mhi_prepare_channel(struct mhi_controller *mhi_cntrl,
-			struct mhi_chan *mhi_chan);
+			struct mhi_chan *mhi_chan, unsigned int flags);
 int mhi_init_chan_ctxt(struct mhi_controller *mhi_cntrl,
 		       struct mhi_chan *mhi_chan);
 void mhi_deinit_chan_ctxt(struct mhi_controller *mhi_cntrl,
diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index b15c5bc37dd4..c01ec2fef02c 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -1430,7 +1430,7 @@ static void mhi_unprepare_channel(struct mhi_controller *mhi_cntrl,
 }
 
 int mhi_prepare_channel(struct mhi_controller *mhi_cntrl,
-			struct mhi_chan *mhi_chan)
+			struct mhi_chan *mhi_chan, unsigned int flags)
 {
 	int ret = 0;
 	struct device *dev = &mhi_chan->mhi_dev->dev;
@@ -1455,6 +1455,9 @@ int mhi_prepare_channel(struct mhi_controller *mhi_cntrl,
 	if (ret)
 		goto error_pm_state;
 
+	if (mhi_chan->dir == DMA_FROM_DEVICE)
+		mhi_chan->pre_alloc = !!(flags & MHI_CH_INBOUND_ALLOC_BUFS);
+
 	/* Pre-allocate buffer for xfer ring */
 	if (mhi_chan->pre_alloc) {
 		int nr_el = get_nr_avail_ring_elements(mhi_cntrl,
@@ -1610,7 +1613,7 @@ void mhi_reset_chan(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan)
 }
 
 /* Move channel to start state */
-int mhi_prepare_for_transfer(struct mhi_device *mhi_dev)
+int mhi_prepare_for_transfer(struct mhi_device *mhi_dev, unsigned int flags)
 {
 	int ret, dir;
 	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
@@ -1621,7 +1624,7 @@ int mhi_prepare_for_transfer(struct mhi_device *mhi_dev)
 		if (!mhi_chan)
 			continue;
 
-		ret = mhi_prepare_channel(mhi_cntrl, mhi_chan);
+		ret = mhi_prepare_channel(mhi_cntrl, mhi_chan, flags);
 		if (ret)
 			goto error_open_chan;
 	}
diff --git a/drivers/net/mhi_net.c b/drivers/net/mhi_net.c
index d127eb6e9257..975f7f9bdf4c 100644
--- a/drivers/net/mhi_net.c
+++ b/drivers/net/mhi_net.c
@@ -319,7 +319,7 @@ static int mhi_net_newlink(struct mhi_device *mhi_dev, struct net_device *ndev)
 	u64_stats_init(&mhi_netdev->stats.tx_syncp);
 
 	/* Start MHI channels */
-	err = mhi_prepare_for_transfer(mhi_dev);
+	err = mhi_prepare_for_transfer(mhi_dev, 0);
 	if (err)
 		goto out_err;
 
diff --git a/drivers/net/wwan/mhi_wwan_ctrl.c b/drivers/net/wwan/mhi_wwan_ctrl.c
index e4d0f696687f..d0a98f34c54d 100644
--- a/drivers/net/wwan/mhi_wwan_ctrl.c
+++ b/drivers/net/wwan/mhi_wwan_ctrl.c
@@ -110,7 +110,7 @@ static int mhi_wwan_ctrl_start(struct wwan_port *port)
 	int ret;
 
 	/* Start mhi device's channel(s) */
-	ret = mhi_prepare_for_transfer(mhiwwan->mhi_dev);
+	ret = mhi_prepare_for_transfer(mhiwwan->mhi_dev, 0);
 	if (ret)
 		return ret;
 
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 723985879035..56e7934f8b23 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -723,8 +723,13 @@ void mhi_device_put(struct mhi_device *mhi_dev);
  *                            host and device execution environments match and
  *                            channels are in a DISABLED state.
  * @mhi_dev: Device associated with the channels
+ * @flags: MHI channel flags
  */
-int mhi_prepare_for_transfer(struct mhi_device *mhi_dev);
+int mhi_prepare_for_transfer(struct mhi_device *mhi_dev,
+			     unsigned int flags);
+
+/* Automatically allocate and queue inbound buffers */
+#define MHI_CH_INBOUND_ALLOC_BUFS BIT(0)
 
 /**
  * mhi_unprepare_from_transfer - Reset UL and DL channels for data transfer.
diff --git a/net/qrtr/mhi.c b/net/qrtr/mhi.c
index fa611678af05..29b4fa3b72ab 100644
--- a/net/qrtr/mhi.c
+++ b/net/qrtr/mhi.c
@@ -79,7 +79,7 @@ static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
 	int rc;
 
 	/* start channels */
-	rc = mhi_prepare_for_transfer(mhi_dev);
+	rc = mhi_prepare_for_transfer(mhi_dev, MHI_CH_INBOUND_ALLOC_BUFS);
 	if (rc)
 		return rc;
 
-- 
2.25.1

