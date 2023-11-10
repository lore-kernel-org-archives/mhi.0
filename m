Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B45913FF3
	for <mhi@lists.linux.dev>; Fri, 10 Nov 2023 10:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FEMuPxSj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8865C433C7;
	Fri, 10 Nov 2023 10:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699611727;
	bh=ab4hJ+WGBzMisQV6Ojq6aJpO+VJWeDjG2dADKw346TY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FEMuPxSjW85Dg30AAfEBXedIMOmUpuA4pp7+yo8f5vV7qR5gPy9bqHsw6WrGN0cyW
	 1v4EPjuqIwuxl2kB0r+5v4T6PQCye7yW1AQEIWUls+TeQAn92Egt7xW3Qc749IPHwG
	 SGF19XeUH6eUfQXB7JPKoZwwbG418vyc9H04/ZN8JCOc0AerB991pNmekjWdzJISD7
	 cdG1LulNW+4Sdq1bJbnbMLpTbxkmzUGaGwl34H7Xd4tcidQnu1ZYt8ACVE9c5eJRRy
	 vsG8LgO89Rgx7xyylLdQ4dhBT6p1X2/iAP//JXoEPlF2Y2DfoLtyM2mOL0q4LudCMC
	 S+8n/rcRP2HYw==
From: Kalle Valo <kvalo@kernel.org>
To: mhi@lists.linux.dev
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: [PATCH RFC 2/8] bus: mhi: host: add new interfaces to handle MHI channels directly
Date: Fri, 10 Nov 2023 12:21:56 +0200
Message-Id: <20231110102202.3168243-3-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231110102202.3168243-1-kvalo@kernel.org>
References: <20231110102202.3168243-1-kvalo@kernel.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Baochen Qiang <quic_bqiang@quicinc.com>

When using mhi_power_down_no_destroy() MHI hosts need to unprepare MHI channels
by themselves.  Similarly, MHI stack will also not create new MHI device since
old devices were not destroyed, so MHI hosts need to prepare channels as well.
Hence add these two interfaces to make that possible.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/bus/mhi/host/main.c | 91 +++++++++++++++++++++++++++++++++++++
 include/linux/mhi.h         | 18 ++++++++
 2 files changed, 109 insertions(+)

diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
index dcf627b36e82..9bcf8a49c000 100644
--- a/drivers/bus/mhi/host/main.c
+++ b/drivers/bus/mhi/host/main.c
@@ -1667,6 +1667,49 @@ int mhi_prepare_for_transfer_autoqueue(struct mhi_device *mhi_dev)
 }
 EXPORT_SYMBOL_GPL(mhi_prepare_for_transfer_autoqueue);
 
+static int __mhi_prepare_for_transfer_autoqueue(struct device *dev, void *data)
+{
+	struct mhi_device *mhi_dev;
+	struct mhi_chan *ul_chan, *dl_chan;
+	enum mhi_ee_type ee = MHI_EE_MAX;
+
+	if (dev->bus != &mhi_bus_type)
+		return 0;
+
+	mhi_dev = to_mhi_device(dev);
+
+	/* Only prepare virtual devices thats attached to bus */
+	if (mhi_dev->dev_type == MHI_DEVICE_CONTROLLER)
+		return 0;
+
+	ul_chan = mhi_dev->ul_chan;
+	dl_chan = mhi_dev->dl_chan;
+
+	/*
+	 * If execution environment is specified, remove only those devices that
+	 * started in them based on ee_mask for the channels as we move on to a
+	 * different execution environment
+	 */
+	if (data)
+		ee = *(enum mhi_ee_type *)data;
+
+	if (ul_chan && ee != MHI_EE_MAX && !(ul_chan->ee_mask & BIT(ee)))
+		return 0;
+
+
+	if (dl_chan && ee != MHI_EE_MAX && !(dl_chan->ee_mask & BIT(ee)))
+		return 0;
+
+	return mhi_prepare_for_transfer_autoqueue(mhi_dev);
+}
+
+int mhi_prepare_all_for_transfer_autoqueue(struct mhi_controller *mhi_cntrl)
+{
+	return device_for_each_child(&mhi_cntrl->mhi_dev->dev, NULL,
+				     __mhi_prepare_for_transfer_autoqueue);
+}
+EXPORT_SYMBOL_GPL(mhi_prepare_all_for_transfer_autoqueue);
+
 void mhi_unprepare_from_transfer(struct mhi_device *mhi_dev)
 {
 	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
@@ -1682,3 +1725,51 @@ void mhi_unprepare_from_transfer(struct mhi_device *mhi_dev)
 	}
 }
 EXPORT_SYMBOL_GPL(mhi_unprepare_from_transfer);
+
+static int __mhi_unprepare_from_transfer(struct device *dev, void *data)
+{
+	struct mhi_device *mhi_dev;
+	struct mhi_chan *ul_chan, *dl_chan;
+	enum mhi_ee_type ee = MHI_EE_MAX;
+
+	if (dev->bus != &mhi_bus_type)
+		return 0;
+
+	mhi_dev = to_mhi_device(dev);
+
+	/* Only unprepare virtual devices thats attached to bus */
+	if (mhi_dev->dev_type == MHI_DEVICE_CONTROLLER)
+		return 0;
+
+	ul_chan = mhi_dev->ul_chan;
+	dl_chan = mhi_dev->dl_chan;
+
+	/*
+	 * If execution environment is specified, remove only those devices that
+	 * started in them based on ee_mask for the channels as we move on to a
+	 * different execution environment
+	 */
+	if (data)
+		ee = *(enum mhi_ee_type *)data;
+
+	if (ul_chan) {
+		if (ee != MHI_EE_MAX && !(ul_chan->ee_mask & BIT(ee)))
+			return 0;
+	}
+
+	if (dl_chan) {
+		if (ee != MHI_EE_MAX && !(dl_chan->ee_mask & BIT(ee)))
+			return 0;
+	}
+
+	mhi_unprepare_from_transfer(mhi_dev);
+
+	return 0;
+}
+
+int mhi_unprepare_all_from_transfer(struct mhi_controller *mhi_cntrl)
+{
+	return device_for_each_child(&mhi_cntrl->mhi_dev->dev, NULL,
+				     __mhi_unprepare_from_transfer);
+}
+EXPORT_SYMBOL_GPL(mhi_unprepare_all_from_transfer);
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 85edc9c5df88..c15f4c44029d 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -838,4 +838,22 @@ int mhi_queue_skb(struct mhi_device *mhi_dev, enum dma_data_direction dir,
  */
 bool mhi_queue_is_full(struct mhi_device *mhi_dev, enum dma_data_direction dir);
 
+/**
+ * mhi_prepare_all_for_transfer_autoqueue - if you are using
+ * mhi_power_down_no_destroy() variant this needs to be called after
+ * calling mhi_power_up().
+ *
+ * @mhi_cntrl: MHI controller
+ */
+int mhi_prepare_all_for_transfer_autoqueue(struct mhi_controller *mhi_cntrl);
+
+/**
+ * mhi_unprepare_all_from_transfer - if you are using
+ * mhi_power_down_no_destroy() variant this function needs to be called
+ * before calling mhi_power_down_no_destroy().
+ *
+ * @mhi_cntrl: MHI controller
+ */
+int mhi_unprepare_all_from_transfer(struct mhi_controller *mhi_cntrl);
+
 #endif /* _MHI_H_ */
-- 
2.39.2

