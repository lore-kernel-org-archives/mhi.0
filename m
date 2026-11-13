Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794572622;
	b=rFQwmLZzWVGB2u7qXEs6meSxyLBPeP4yb5m1NgrEQDFC/SXCfrHdZrDbhOZ2MRGtrdHx
	 d+hjMMLYp9nyZ4B+NANhJXv/EdseObrqohWnVANOj+3FrA1RebyGZis7diYjlPuJGp8LF
	 QCV7ZP+3yaKk2/Ttqri+72t79wyXQ40070IES4bv/nyj9LefS87QgLKRzul3aFNZsTs+O
	 pkQN0Q3PnybyKJ6L3bOOiUzBOQ/rcSMjvarSg5zR475dPctc9Cr1BypSc4y0P5M4Unkgt
	 daitUJi0sbt1XwyvaI2QdscLZLShH3tRW6AWE4XYWDhQYMKQ1pvnyWcocdne4tdfXUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794572622;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=PPw9PWasR2rS5GKMzC2u2cQcum5MxJJjCtnx3izk4c0=;
	b=Qzv88HfEw7t7Hr8K4uZepaJTYFP3e9NEHbfiP0XpQVOguSbBOa9fADOtJhSPz8YRRDb0
	 EURSPIsxmHO8gkw9ymoEQ5KDD0/wKZYtrQW1AmU7On1meufh4w2Gk0Htk3UeoHdVl6EP6
	 wAm9BQtnLu9TXPi3CWYUBvDWsQZ4x5dPWNq4eZzd4bT/FkkN4mwd4Ja6g6G9axmB9f+1g
	 g6Xhddi06m35tZEaxiuDjA8ht/s4qN5mSXfOjRfsSwqcAiGg+4WUv9eCcSq8ZFenvWBPE
	 UtFM5otNAbYYAg1NK2jwst2dWRBV+tE4tVuC93YCfXOEUZwzN1x1+9hvSs0UYdYo+lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=f0YpHSmF;
	arc=none smtp.remote-ip=117.135.210.2
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070CA606A327
	for <mhi@lists.linux.dev>; Fri, 13 Nov 2026 12:23:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 070CA606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=f0YpHSmF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=PP
	w9PWasR2rS5GKMzC2u2cQcum5MxJJjCtnx3izk4c0=; b=f0YpHSmFAScYjfCFOy
	yaTSQiT9KxQOLsHTYHzt4YhnZgbNUSKglXbYeCpbEohx9OCW3q3WwJq7IiVlQhSU
	MTSB14ZPg8hMvn64kwZYPN3INcrFyROxztwr+hpYGFE57ChDkyRzGhMgkmwyQkp7
	eLIzVYqvScOpBIyAYD5QOxQEA=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wDnr684AfdqBTIvHA--.19870S2;
	Fri, 13 Nov 2026 20:23:26 +0800 (CST)
From: Hongxing Xu <xing1989093@163.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] bus: mhi: host: Add debug port personality switching
Date: Fri, 13 Nov 2026 20:23:01 +0800
Message-Id: <20261113122302.2174-1-xing1989093@163.com>
X-Mailer: git-send-email 2.40.0.windows.1
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Post: <mailto:mhi@lists.linux.dev>
List-Help: <mailto:mhi+help@lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mhi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnr684AfdqBTIvHA--.19870S2
X-Coremail-Antispam: 1Uf129KBjvAXoW3ury5Gw47urWkur4xtFWDArb_yoW8XryrKo
	Z3Wrs3Xw15Xrn8XrW7GF4DJ3Z5ZrW8Ka98Xw1rtFsrJa1qva4Yva4Ygwn3X34avF4Ykr47
	Ja4xWr15ZrsrtF1fn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUs9a9UUUUU
X-CM-SenderInfo: 50lqwiqzyzimqt6rljoofrz/xtbC3x7npGr3AT7TyQAA36

Modems expose two different sets of MHI channels depending on the product
configuration they are running. In the commercial personality only the
channels that carry user traffic are usable, so the host must not create
WWAN ports for the diagnostic and debugger channels. In the debug
personality those channels are active as well and userspace needs a
device node for each of them, e.g. one for the diagnostic interface on
top of the MBIM and AT ports.

Which channels are usable is a property of the firmware that is running,
so the host cannot know it at probe time. It has to be told at runtime,
after the device has booted into mission mode. There was no way to do
that: mhi_create_devices() unconditionally created a device for every
configured channel whose EE mask matched, so the debug channels either
always appeared or never did, depending on whether the controller driver
declared them.

Add a per-channel debug_only flag and a debug_ports attribute that lets
userspace switch the personality. Channels carrying the flag are skipped
by mhi_create_devices() unless the debug personality is active, and are
created or destroyed when it changes. The flag defaults to false, so
existing controllers keep behaving exactly as before and the attribute
describes itself as having no effect on a controller that does not
declare any debug-only channel.

The attribute is part of the bus-wide attribute group, like the
existing controller attributes. That group is applied to every MHI
device, including the channel devices created here, so debug_ports_store()
accepts a write only from the controller device. A write from a channel
device would otherwise tear down the device that is executing the store.

Device creation and destruction cannot be done from the sysfs store
directly. The state transitions create and destroy devices on
hiprio_wq, and pm_mutex does not exclude them: they drop it before
calling mhi_destroy_device() through device_for_each_child(). The
request is therefore queued on that same ordered workqueue, which
serialises it against the transitions. The store flushes the work before
it returns, so the ports are in place when userspace regains control.

mhi_create_devices() is split so that the bidirectional pairing logic
has a single instance. mhi_create_device() takes the channel index by
reference and advances it past a UL/DL pair, which is what lets
mhi_update_debug_devices() walk the channel array without revisiting the
second half of a pair.

Signed-off-by: Hongxing Xu <xing1989093@163.com>
---
 Documentation/ABI/stable/sysfs-bus-mhi |  14 ++
 drivers/bus/mhi/host/init.c            |  43 +++++++
 drivers/bus/mhi/host/internal.h        |   3 +
 drivers/bus/mhi/host/main.c            | 171 ++++++++++++++++++-------
 include/linux/mhi.h                    |  16 +++
 5 files changed, 198 insertions(+), 49 deletions(-)

diff --git a/Documentation/ABI/stable/sysfs-bus-mhi b/Documentation/ABI/stable/sysfs-bus-mhi
index 8b9698f..1fe8510 100644
--- a/Documentation/ABI/stable/sysfs-bus-mhi
+++ b/Documentation/ABI/stable/sysfs-bus-mhi
@@ -30,6 +30,20 @@ Description:	Initiates a SoC reset on the MHI controller.  A SoC reset is
                 non-responsive, or as a means of loading new firmware as a
                 system administration task.
 
+What:           /sys/bus/mhi/devices/.../debug_ports
+Date:           November 2026
+KernelVersion:  7.5
+Contact:        mhi@lists.linux.dev
+Description:    Controls which set of ports the MHI controller enumerates.
+                Writing 0 selects the commercial personality, in which the
+                channels that are only useful for debugging are not
+                enumerated. Writing 1 selects the debug personality and
+                additionally enumerates those channels, so that the extra
+                WWAN ports appear, e.g. one for the diagnostic interface.
+                Reading returns the currently active personality.
+                Controllers that do not describe any debug-only channel are
+                unaffected by this attribute.
+
 What:           /sys/bus/mhi/devices/.../trigger_edl
 Date:           April 2024
 KernelVersion:  6.10
diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
index fd30508..938fc9d 100644
--- a/drivers/bus/mhi/host/init.c
+++ b/drivers/bus/mhi/host/init.c
@@ -150,10 +150,50 @@ static ssize_t trigger_edl_store(struct device *dev,
 }
 static DEVICE_ATTR_WO(trigger_edl);
 
+static ssize_t debug_ports_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	struct mhi_device *mhi_dev = to_mhi_device(dev);
+	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
+
+	if (!mhi_cntrl)
+		return -ENODEV;
+
+	return sysfs_emit(buf, "%d\n", READ_ONCE(mhi_cntrl->debug_ports));
+}
+
+static ssize_t debug_ports_store(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf, size_t count)
+{
+	struct mhi_device *mhi_dev = to_mhi_device(dev);
+	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
+	bool enable;
+	int ret;
+
+	if (mhi_dev->dev_type != MHI_DEVICE_CONTROLLER)
+		return -EOPNOTSUPP;
+
+	if (!mhi_cntrl || !mhi_cntrl->mhi_dev)
+		return -ENODEV;
+
+	ret = kstrtobool(buf, &enable);
+	if (ret)
+		return ret;
+
+	WRITE_ONCE(mhi_cntrl->debug_ports_pending, enable);
+	queue_work(mhi_cntrl->hiprio_wq, &mhi_cntrl->debug_ports_work);
+	flush_work(&mhi_cntrl->debug_ports_work);
+
+	return count;
+}
+static DEVICE_ATTR_RW(debug_ports);
+
 static struct attribute *mhi_dev_attrs[] = {
 	&dev_attr_serial_number.attr,
 	&dev_attr_oem_pk_hash.attr,
 	&dev_attr_soc_reset.attr,
+	&dev_attr_debug_ports.attr,
 	NULL,
 };
 ATTRIBUTE_GROUPS(mhi_dev);
@@ -840,6 +880,7 @@ static int parse_ch_cfg(struct mhi_controller *mhi_cntrl,
 		mhi_chan->offload_ch = ch_cfg->offload_channel;
 		mhi_chan->db_cfg.reset_req = ch_cfg->doorbell_mode_switch;
 		mhi_chan->wake_capable = ch_cfg->wake_capable;
+		mhi_chan->debug_only = ch_cfg->debug_only;
 
 		/*
 		 * Bi-directional and direction less channel must be an
@@ -957,6 +998,8 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
 		goto err_free_cmd;
 	}
 
+	INIT_WORK(&mhi_cntrl->debug_ports_work, mhi_debug_ports_work);
+
 	mhi_cmd = mhi_cntrl->mhi_cmd;
 	for (i = 0; i < NR_OF_CMD_RINGS; i++, mhi_cmd++)
 		spin_lock_init(&mhi_cmd->lock);
diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
index 7b0ee5e..abb52d0 100644
--- a/drivers/bus/mhi/host/internal.h
+++ b/drivers/bus/mhi/host/internal.h
@@ -287,6 +287,7 @@ struct mhi_chan {
 	bool configured;
 	bool offload_ch;
 	bool wake_capable;
+	bool debug_only;
 };
 
 /* Default MHI timeout */
@@ -320,6 +321,8 @@ struct mhi_device *mhi_alloc_device(struct mhi_controller *mhi_cntrl);
 
 int mhi_destroy_device(struct device *dev, void *data);
 void mhi_create_devices(struct mhi_controller *mhi_cntrl);
+void mhi_update_debug_devices(struct mhi_controller *mhi_cntrl, bool enable);
+void mhi_debug_ports_work(struct work_struct *work);
 
 int mhi_alloc_bhie_table(struct mhi_controller *mhi_cntrl,
 			 struct image_info **image_info, size_t alloc_size);
diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
index 4d45839..d9260a9 100644
--- a/drivers/bus/mhi/host/main.c
+++ b/drivers/bus/mhi/host/main.c
@@ -366,75 +366,148 @@ void mhi_notify(struct mhi_device *mhi_dev, enum mhi_callback cb_reason)
 EXPORT_SYMBOL_GPL(mhi_notify);
 
 /* Bind MHI channels to MHI devices */
-void mhi_create_devices(struct mhi_controller *mhi_cntrl)
+static bool mhi_chan_is_available(struct mhi_controller *mhi_cntrl,
+				  struct mhi_chan *mhi_chan)
 {
-	struct mhi_chan *mhi_chan;
+	if (!mhi_chan->configured || mhi_chan->mhi_dev)
+		return false;
+
+	if (!(mhi_chan->ee_mask & BIT(mhi_cntrl->ee)))
+		return false;
+
+	if (mhi_chan->debug_only && !READ_ONCE(mhi_cntrl->debug_ports))
+		return false;
+
+	return true;
+}
+
+static int mhi_create_device(struct mhi_controller *mhi_cntrl, int *index)
+{
+	struct mhi_chan *mhi_chan = &mhi_cntrl->mhi_chan[*index];
 	struct mhi_device *mhi_dev;
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
-	int i, ret;
+	int i = *index;
+	int ret;
 
-	mhi_chan = mhi_cntrl->mhi_chan;
-	for (i = 0; i < mhi_cntrl->max_chan; i++, mhi_chan++) {
-		if (!mhi_chan->configured || mhi_chan->mhi_dev ||
-		    !(mhi_chan->ee_mask & BIT(mhi_cntrl->ee)))
-			continue;
-		mhi_dev = mhi_alloc_device(mhi_cntrl);
-		if (IS_ERR(mhi_dev))
-			return;
+	mhi_dev = mhi_alloc_device(mhi_cntrl);
+	if (IS_ERR(mhi_dev))
+		return PTR_ERR(mhi_dev);
 
-		mhi_dev->dev_type = MHI_DEVICE_XFER;
-		switch (mhi_chan->dir) {
-		case DMA_TO_DEVICE:
+	mhi_dev->dev_type = MHI_DEVICE_XFER;
+	switch (mhi_chan->dir) {
+	case DMA_TO_DEVICE:
+		mhi_dev->ul_chan = mhi_chan;
+		mhi_dev->ul_chan_id = mhi_chan->chan;
+		break;
+	case DMA_FROM_DEVICE:
+		/* We use dl_chan as offload channels */
+		mhi_dev->dl_chan = mhi_chan;
+		mhi_dev->dl_chan_id = mhi_chan->chan;
+		break;
+	default:
+		dev_err(dev, "Direction not supported\n");
+		put_device(&mhi_dev->dev);
+		return -EINVAL;
+	}
+
+	get_device(&mhi_dev->dev);
+	mhi_chan->mhi_dev = mhi_dev;
+
+	/* Check next channel if it matches */
+	if ((i + 1) < mhi_cntrl->max_chan && mhi_chan[1].configured &&
+	    mhi_chan[1].debug_only == mhi_chan->debug_only &&
+	    !strcmp(mhi_chan[1].name, mhi_chan->name)) {
+		i++;
+		mhi_chan++;
+		if (mhi_chan->dir == DMA_TO_DEVICE) {
 			mhi_dev->ul_chan = mhi_chan;
 			mhi_dev->ul_chan_id = mhi_chan->chan;
-			break;
-		case DMA_FROM_DEVICE:
-			/* We use dl_chan as offload channels */
+		} else {
 			mhi_dev->dl_chan = mhi_chan;
 			mhi_dev->dl_chan_id = mhi_chan->chan;
-			break;
-		default:
-			dev_err(dev, "Direction not supported\n");
-			put_device(&mhi_dev->dev);
-			return;
 		}
-
 		get_device(&mhi_dev->dev);
 		mhi_chan->mhi_dev = mhi_dev;
+	}
 
-		/* Check next channel if it matches */
-		if ((i + 1) < mhi_cntrl->max_chan && mhi_chan[1].configured) {
-			if (!strcmp(mhi_chan[1].name, mhi_chan->name)) {
-				i++;
-				mhi_chan++;
-				if (mhi_chan->dir == DMA_TO_DEVICE) {
-					mhi_dev->ul_chan = mhi_chan;
-					mhi_dev->ul_chan_id = mhi_chan->chan;
-				} else {
-					mhi_dev->dl_chan = mhi_chan;
-					mhi_dev->dl_chan_id = mhi_chan->chan;
-				}
-				get_device(&mhi_dev->dev);
-				mhi_chan->mhi_dev = mhi_dev;
-			}
-		}
+	/* Channel name is same for both UL and DL */
+	mhi_dev->name = mhi_chan->name;
+	dev_set_name(&mhi_dev->dev, "%s_%s",
+		     dev_name(&mhi_cntrl->mhi_dev->dev),
+		     mhi_dev->name);
+
+	/* Init wakeup source if available */
+	if (mhi_dev->dl_chan && mhi_dev->dl_chan->wake_capable)
+		device_init_wakeup(&mhi_dev->dev, true);
+
+	ret = device_add(&mhi_dev->dev);
+	if (ret) {
+		put_device(&mhi_dev->dev);
+		return ret;
+	}
+
+	*index = i;
 
-		/* Channel name is same for both UL and DL */
-		mhi_dev->name = mhi_chan->name;
-		dev_set_name(&mhi_dev->dev, "%s_%s",
-			     dev_name(&mhi_cntrl->mhi_dev->dev),
-			     mhi_dev->name);
+	return 0;
+}
+
+void mhi_create_devices(struct mhi_controller *mhi_cntrl)
+{
+	int i, ret;
 
-		/* Init wakeup source if available */
-		if (mhi_dev->dl_chan && mhi_dev->dl_chan->wake_capable)
-			device_init_wakeup(&mhi_dev->dev, true);
+	for (i = 0; i < mhi_cntrl->max_chan; i++) {
+		if (!mhi_chan_is_available(mhi_cntrl, &mhi_cntrl->mhi_chan[i]))
+			continue;
 
-		ret = device_add(&mhi_dev->dev);
+		ret = mhi_create_device(mhi_cntrl, &i);
 		if (ret)
-			put_device(&mhi_dev->dev);
+			return;
 	}
 }
 
+void mhi_update_debug_devices(struct mhi_controller *mhi_cntrl, bool enable)
+{
+	struct mhi_chan *mhi_chan;
+	int i, ret;
+
+	for (i = 0; i < mhi_cntrl->max_chan; i++) {
+		mhi_chan = &mhi_cntrl->mhi_chan[i];
+
+		if (!mhi_chan->debug_only)
+			continue;
+
+		if (enable) {
+			if (!mhi_chan->configured || mhi_chan->mhi_dev ||
+			    !(mhi_chan->ee_mask & BIT(mhi_cntrl->ee)))
+				continue;
+
+			ret = mhi_create_device(mhi_cntrl, &i);
+			if (ret)
+				return;
+		} else if (mhi_chan->mhi_dev) {
+			mhi_destroy_device(&mhi_chan->mhi_dev->dev, NULL);
+		}
+	}
+}
+
+void mhi_debug_ports_work(struct work_struct *work)
+{
+	struct mhi_controller *mhi_cntrl = container_of(work,
+						       struct mhi_controller,
+						       debug_ports_work);
+	bool enable = READ_ONCE(mhi_cntrl->debug_ports_pending);
+
+	if (enable == READ_ONCE(mhi_cntrl->debug_ports))
+		return;
+
+	mhi_update_debug_devices(mhi_cntrl, enable);
+	WRITE_ONCE(mhi_cntrl->debug_ports, enable);
+
+	dev_info(&mhi_cntrl->mhi_dev->dev, "MHI %s ports %s\n",
+		 enable ? "debug" : "commercial",
+		 enable ? "enumerated" : "removed");
+}
+
 irqreturn_t mhi_irq_handler(int irq_number, void *dev)
 {
 	struct mhi_event *mhi_event = dev;
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 65e8a39..565297a 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -234,6 +234,8 @@ enum mhi_db_brst_mode {
  * @offload_channel: The client manages the channel completely
  * @doorbell_mode_switch: Channel switches to doorbell mode on M0 transition
  * @wake_capable: Channel capable of waking up the system
+ * @debug_only: Channel is only enumerated when the controller is switched
+ *		to the debug port personality (see mhi_controller.debug_ports)
  */
 struct mhi_channel_config {
 	char *name;
@@ -250,6 +252,7 @@ struct mhi_channel_config {
 	bool offload_channel;
 	bool doorbell_mode_switch;
 	bool wake_capable;
+	bool debug_only;
 };
 
 /**
@@ -381,6 +384,16 @@ struct mhi_controller_config {
  * @no_m3: Device doesn't support M3 state
  * @irq_flags: irq flags passed to request_irq (optional)
  * @mru: the default MRU for the MHI device
+ * @debug_ports: Whether the debug port personality is active, i.e. whether the
+ *		 channels marked with debug_only are enumerated. Controlled
+ *		 from userspace through the debug_ports sysfs attribute and
+ *		 applied by debug_ports_work. Zero-initialised, so a
+ *		 controller starts in the commercial personality.
+ * @debug_ports_pending: Latest personality requested from userspace, applied
+ *		 by debug_ports_work
+ * @debug_ports_work: Applies @debug_ports_pending from the ordered high
+ *		      priority workqueue, so the device creation it performs
+ *		      cannot race with a state transition
  *
  * Fields marked as (required) need to be populated by the controller driver
  * before calling mhi_register_controller(). For the fields marked as (optional)
@@ -440,6 +453,9 @@ struct mhi_controller {
 	struct work_struct st_worker;
 	struct workqueue_struct *hiprio_wq;
 	wait_queue_head_t state_event;
+	bool debug_ports;
+	bool debug_ports_pending;
+	struct work_struct debug_ports_work;
 
 	void (*status_cb)(struct mhi_controller *mhi_cntrl,
 			  enum mhi_callback cb);
-- 
2.40.0.windows.1

