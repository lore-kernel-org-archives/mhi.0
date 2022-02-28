Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E0753BA
	for <mhi@lists.linux.dev>; Mon, 28 Feb 2022 12:44:58 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id a5so10207547pfv.9
        for <mhi@lists.linux.dev>; Mon, 28 Feb 2022 04:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZcgB3dsdYiRl3IlyzXkbVRVAGkvq7C0XqoDwm1YpiDY=;
        b=GhYcbIp8tl+HCeZLLWNLL78a+UBg8ENdh+6DB0LKRKhWzZfGDgw2eo9oVztZXBD0TX
         RE0GS/MiHefahHVkb1HgC2O7onA79BHR+PoNUfBuFidzwnDbsW212sIeElmxN8rwyQta
         K4SX3rMEcOXUnDy+ftpC0JgAHS5j5ObaJHh/0UJgPpeRuZ4cr4Gy6f97NfUpjIjdknid
         FmjwBkkR1xpBANOn72YMH7Xnow266xS0/sI1qvLjVnxQUAPSCUd5s74M2YAAtdvutmI2
         uI0mjoUMB3+f4YDdJaCyHukNawwXZKIjDz6+G3StKP9ePZMzFyDxQm7kLiUHGL3pdDtl
         1Xbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZcgB3dsdYiRl3IlyzXkbVRVAGkvq7C0XqoDwm1YpiDY=;
        b=b84apTRxThfq4ei8COfRhFHrBh/Y3hlcig27hhBx439A+hKOP5F4Bs/5WtVojVW9Az
         Ca31V+esqphcGqZ2Gk6YMjlR/hhGhoMkRHBXMRemZ7SAT1teNZRiLf95o8vtrjapgg/o
         aC+pC4JNw4mnLwFlQbznqudxbd6F7C7qrCw7X/5EmDMdkKSx66ccdK0tH6cfhmzOr/rX
         Z0gBvXHpzwBLJK4vmnErAw/8Pvm2kQCBIXYVk4sMWkL/CitJDK2KR2mK9c1lsH11/Gbo
         88eLaafzzH/cMd/zwwQSNceq9zZF3TqyY+2xhIkd4TcZKtm8555euqt5UNQqWdGqySko
         fcbQ==
X-Gm-Message-State: AOAM533Ms/MCxCSs2phz7vZ0RkLN2oXU1K3zIQwJxHNChixlvYmbe+qk
	POvdwdxEfSFOEhNzVBhw+K0TAU0SB21I
X-Google-Smtp-Source: ABdhPJwJMnbkJ1SKjLiLJpAn6iKdpFTpYoyXgypL+MzEbarFklFbYBw6RGIkoOEL3J0SOHnBsyJkqg==
X-Received: by 2002:a63:6908:0:b0:372:d919:82ed with SMTP id e8-20020a636908000000b00372d91982edmr17305878pgc.104.1646052297522;
        Mon, 28 Feb 2022 04:44:57 -0800 (PST)
Received: from localhost.localdomain ([117.207.25.37])
        by smtp.gmail.com with ESMTPSA id y12-20020a056a00190c00b004f39e28fb87sm14256737pfi.98.2022.02.28.04.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 04:44:57 -0800 (PST)
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
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Hemant Kumar <hemantk@codeaurora.org>
Subject: [PATCH v4 11/27] bus: mhi: ep: Add support for registering MHI endpoint client drivers
Date: Mon, 28 Feb 2022 18:13:28 +0530
Message-Id: <20220228124344.77359-12-manivannan.sadhasivam@linaro.org>
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

This commit adds support for registering MHI endpoint client drivers
with the MHI endpoint stack. MHI endpoint client drivers bind to one
or more MHI endpoint devices inorder to send and receive the upper-layer
protocol packets like IP packets, modem control messages, and
diagnostics messages over MHI bus.

Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/ep/main.c | 85 +++++++++++++++++++++++++++++++++++++++
 include/linux/mhi_ep.h    | 57 +++++++++++++++++++++++++-
 2 files changed, 140 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index 87ca42c7b067..2bdcf1657479 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -198,9 +198,88 @@ void mhi_ep_unregister_controller(struct mhi_ep_cntrl *mhi_cntrl)
 }
 EXPORT_SYMBOL_GPL(mhi_ep_unregister_controller);
 
+static int mhi_ep_driver_probe(struct device *dev)
+{
+	struct mhi_ep_device *mhi_dev = to_mhi_ep_device(dev);
+	struct mhi_ep_driver *mhi_drv = to_mhi_ep_driver(dev->driver);
+	struct mhi_ep_chan *ul_chan = mhi_dev->ul_chan;
+	struct mhi_ep_chan *dl_chan = mhi_dev->dl_chan;
+
+	ul_chan->xfer_cb = mhi_drv->ul_xfer_cb;
+	dl_chan->xfer_cb = mhi_drv->dl_xfer_cb;
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
+	/* Client drivers should have callbacks defined for both channels */
+	if (!mhi_drv->ul_xfer_cb || !mhi_drv->dl_xfer_cb)
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
@@ -209,6 +288,12 @@ static int mhi_ep_match(struct device *dev, struct device_driver *drv)
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
index 9c58938371e2..efcbdc51464f 100644
--- a/include/linux/mhi_ep.h
+++ b/include/linux/mhi_ep.h
@@ -108,8 +108,8 @@ struct mhi_ep_cntrl {
  * @mhi_cntrl: Controller the device belongs to
  * @id: Pointer to MHI Endpoint device ID struct
  * @name: Name of the associated MHI Endpoint device
- * @ul_chan: UL channel for the device
- * @dl_chan: DL channel for the device
+ * @ul_chan: UL (from host to endpoint) channel for the device
+ * @dl_chan: DL (from endpoint to host) channel for the device
  * @dev_type: MHI device type
  */
 struct mhi_ep_device {
@@ -122,7 +122,60 @@ struct mhi_ep_device {
 	enum mhi_device_type dev_type;
 };
 
+/**
+ * struct mhi_ep_driver - Structure representing a MHI Endpoint client driver
+ * @id_table: Pointer to MHI Endpoint device ID table
+ * @driver: Device driver model driver
+ * @probe: CB function for client driver probe function
+ * @remove: CB function for client driver remove function
+ * @ul_xfer_cb: CB function for UL (from host to endpoint) data transfer
+ * @dl_xfer_cb: CB function for DL (from endpoint to host) data transfer
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

