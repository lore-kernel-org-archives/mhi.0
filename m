Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE5F2C82
	for <mhi@lists.linux.dev>; Thu,  2 Dec 2021 11:37:28 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id q16so26713965pgq.10
        for <mhi@lists.linux.dev>; Thu, 02 Dec 2021 03:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pQ5+JHiLyGpfXmy2bsX3P8Df+ylH09T7mwEUuuuixTs=;
        b=SOqs8efhcz0+ib+JhnFnjXq3AgpFPZWSBwTD0qos3KsEN+S+uuhWj+1qoZf9+c7F9J
         3ug5tChJ7O7T76gPnnwv22leOUPQuTrA2MjKFWRNPiFK0fNV5h7bp2CGJ4v1yLZFqe1N
         MjTutvXWYXu5rgO7CxOnP1BFlIioQB83AFyRIWnEXTp6VT+vm2MC5Yy1RV7e2N6LFv4Z
         ihZtFR36Pd1NP2wRcUrXr2wh2Qd1iQwWKvQu2Kf/idkRiq0P80IUNzJIDM/nKAC2Taoi
         cGqNbHTEFe1EmuQ/MbbUU394Ymj37ytl3qru4UrpNecejIemtRLwi3sFeRJxXeLbKjZL
         3LZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pQ5+JHiLyGpfXmy2bsX3P8Df+ylH09T7mwEUuuuixTs=;
        b=GF1WeznyLilWi8/TOVBlj6h+hTqd4TbllAG3JcA47zNVse3spYKWW2z+vgjwdEJkrj
         hpE0qmQ6JGoxqZzZLTcT0dqk415Bby0y2TuM0+K0irlUpITq2WN6d7NAIirKTqQkLA/n
         RQO0WVONMDIz+hv1bNM42+LCZGNK1I9cEJy453SjzayRIwUzOh1zEl7SWK/3tgJhVUNf
         Qp18yhnD9y+mnDgqPMfRuimvdbY+bk9RxZUUPdun+tBkckGQXRSbt56lllX+IxWpPt1P
         UDzI44bHhH2jrZpBlSZCQAp0m/R0el5ejXKvUxYj99wXHoQwLOKJjHq2Tp16JH0E6wnc
         2yLA==
X-Gm-Message-State: AOAM532QWvoLZ/q5MdvJmnn34h9n7mWmeh8tep8KrMZddlpsxcveLFCw
	PPgmhnEQUp7boWinF1w0NGSx96Lk3hAq
X-Google-Smtp-Source: ABdhPJwoMatBfxxHTzgLxRPvhk5QJKQHuZ6U2D2hQf9FWvqoI7GyI5TfAiyNwcJaFjHEuEKzsHdC2g==
X-Received: by 2002:a62:5142:0:b0:4a3:4d13:e7da with SMTP id f63-20020a625142000000b004a34d13e7damr12150089pfb.84.1638445047944;
        Thu, 02 Dec 2021 03:37:27 -0800 (PST)
Received: from localhost.localdomain ([117.202.184.5])
        by smtp.gmail.com with ESMTPSA id h5sm3602552pfi.46.2021.12.02.03.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 03:37:27 -0800 (PST)
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
Subject: [PATCH 06/20] bus: mhi: ep: Add support for registering MHI endpoint client drivers
Date: Thu,  2 Dec 2021 17:05:38 +0530
Message-Id: <20211202113553.238011-7-manivannan.sadhasivam@linaro.org>
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

This commit adds support for registering MHI endpoint client drivers
with the MHI endpoint stack. MHI endpoint client drivers binds to one
or more MHI endpoint devices inorder to send and receive the upper-layer
protocol packets like IP packets, modem control messages, and diagnostics
messages over MHI bus.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/ep/main.c | 85 +++++++++++++++++++++++++++++++++++++++
 include/linux/mhi_ep.h    | 53 ++++++++++++++++++++++++
 2 files changed, 138 insertions(+)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index db664360c8ab..ce0f99f22058 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -193,9 +193,88 @@ void mhi_ep_unregister_controller(struct mhi_ep_cntrl *mhi_cntrl)
 }
 EXPORT_SYMBOL_GPL(mhi_ep_unregister_controller);
 
+static int mhi_ep_driver_probe(struct device *dev)
+{
+	struct mhi_ep_device *mhi_dev = to_mhi_ep_device(dev);
+	struct mhi_ep_driver *mhi_drv = to_mhi_ep_driver(dev->driver);
+	struct mhi_ep_chan *ul_chan = mhi_dev->ul_chan;
+	struct mhi_ep_chan *dl_chan = mhi_dev->dl_chan;
+
+	if (ul_chan)
+		ul_chan->xfer_cb = mhi_drv->ul_xfer_cb;
+
+	if (dl_chan)
+		dl_chan->xfer_cb = mhi_drv->dl_xfer_cb;
+
+	return mhi_drv->probe(mhi_dev, mhi_dev->id);
+}
+
+static int mhi_ep_driver_remove(struct device *dev)
+{
+	struct mhi_ep_device *mhi_dev = to_mhi_ep_device(dev);
+	struct mhi_ep_driver *mhi_drv = to_mhi_ep_driver(dev->driver);
+	struct mhi_result result = {};
+	struct mhi_ep_chan *mhi_chan;
+	int dir;
+
+	/* Skip if it is a controller device */
+	if (mhi_dev->dev_type == MHI_DEVICE_CONTROLLER)
+		return 0;
+
+	/* Disconnect the channels associated with the driver */
+	for (dir = 0; dir < 2; dir++) {
+		mhi_chan = dir ? mhi_dev->ul_chan : mhi_dev->dl_chan;
+
+		if (!mhi_chan)
+			continue;
+
+		mutex_lock(&mhi_chan->lock);
+		/* Send channel disconnect status to the client driver */
+		if (mhi_chan->xfer_cb) {
+			result.transaction_status = -ENOTCONN;
+			result.bytes_xferd = 0;
+			mhi_chan->xfer_cb(mhi_chan->mhi_dev, &result);
+		}
+
+		/* Set channel state to DISABLED */
+		mhi_chan->state = MHI_CH_STATE_DISABLED;
+		mhi_chan->xfer_cb = NULL;
+		mutex_unlock(&mhi_chan->lock);
+	}
+
+	/* Remove the client driver now */
+	mhi_drv->remove(mhi_dev);
+
+	return 0;
+}
+
+int __mhi_ep_driver_register(struct mhi_ep_driver *mhi_drv, struct module *owner)
+{
+	struct device_driver *driver = &mhi_drv->driver;
+
+	if (!mhi_drv->probe || !mhi_drv->remove)
+		return -EINVAL;
+
+	driver->bus = &mhi_ep_bus_type;
+	driver->owner = owner;
+	driver->probe = mhi_ep_driver_probe;
+	driver->remove = mhi_ep_driver_remove;
+
+	return driver_register(driver);
+}
+EXPORT_SYMBOL_GPL(__mhi_ep_driver_register);
+
+void mhi_ep_driver_unregister(struct mhi_ep_driver *mhi_drv)
+{
+	driver_unregister(&mhi_drv->driver);
+}
+EXPORT_SYMBOL_GPL(mhi_ep_driver_unregister);
+
 static int mhi_ep_match(struct device *dev, struct device_driver *drv)
 {
 	struct mhi_ep_device *mhi_dev = to_mhi_ep_device(dev);
+	struct mhi_ep_driver *mhi_drv = to_mhi_ep_driver(drv);
+	const struct mhi_device_id *id;
 
 	/*
 	 * If the device is a controller type then there is no client driver
@@ -204,6 +283,12 @@ static int mhi_ep_match(struct device *dev, struct device_driver *drv)
 	if (mhi_dev->dev_type == MHI_DEVICE_CONTROLLER)
 		return 0;
 
+	for (id = mhi_drv->id_table; id->chan[0]; id++)
+		if (!strcmp(mhi_dev->name, id->chan)) {
+			mhi_dev->id = id;
+			return 1;
+		}
+
 	return 0;
 };
 
diff --git a/include/linux/mhi_ep.h b/include/linux/mhi_ep.h
index 14fd40af8974..bc72c197db4d 100644
--- a/include/linux/mhi_ep.h
+++ b/include/linux/mhi_ep.h
@@ -119,7 +119,60 @@ struct mhi_ep_device {
 	int dl_chan_id;
 };
 
+/**
+ * struct mhi_ep_driver - Structure representing a MHI Endpoint client driver
+ * @id_table: Pointer to MHI Endpoint device ID table
+ * @driver: Device driver model driver
+ * @probe: CB function for client driver probe function
+ * @remove: CB function for client driver remove function
+ * @ul_xfer_cb: CB function for UL data transfer
+ * @dl_xfer_cb: CB function for DL data transfer
+ */
+struct mhi_ep_driver {
+	const struct mhi_device_id *id_table;
+	struct device_driver driver;
+	int (*probe)(struct mhi_ep_device *mhi_ep,
+		     const struct mhi_device_id *id);
+	void (*remove)(struct mhi_ep_device *mhi_ep);
+	void (*ul_xfer_cb)(struct mhi_ep_device *mhi_dev,
+			   struct mhi_result *result);
+	void (*dl_xfer_cb)(struct mhi_ep_device *mhi_dev,
+			   struct mhi_result *result);
+};
+
 #define to_mhi_ep_device(dev) container_of(dev, struct mhi_ep_device, dev)
+#define to_mhi_ep_driver(drv) container_of(drv, struct mhi_ep_driver, driver)
+
+/*
+ * module_mhi_ep_driver() - Helper macro for drivers that don't do
+ * anything special other than using default mhi_ep_driver_register() and
+ * mhi_ep_driver_unregister().  This eliminates a lot of boilerplate.
+ * Each module may only use this macro once.
+ */
+#define module_mhi_ep_driver(mhi_drv) \
+	module_driver(mhi_drv, mhi_ep_driver_register, \
+		      mhi_ep_driver_unregister)
+
+/*
+ * Macro to avoid include chaining to get THIS_MODULE
+ */
+#define mhi_ep_driver_register(mhi_drv) \
+	__mhi_ep_driver_register(mhi_drv, THIS_MODULE)
+
+/**
+ * __mhi_ep_driver_register - Register a driver with MHI Endpoint bus
+ * @mhi_drv: Driver to be associated with the device
+ * @owner: The module owner
+ *
+ * Return: 0 if driver registrations succeeds, a negative error code otherwise.
+ */
+int __mhi_ep_driver_register(struct mhi_ep_driver *mhi_drv, struct module *owner);
+
+/**
+ * mhi_ep_driver_unregister - Unregister a driver from MHI Endpoint bus
+ * @mhi_drv: Driver associated with the device
+ */
+void mhi_ep_driver_unregister(struct mhi_ep_driver *mhi_drv);
 
 /**
  * mhi_ep_register_controller - Register MHI Endpoint controller
-- 
2.25.1

