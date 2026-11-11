Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794398247;
	b=qOlITp1Gx7tnh3mpg97myATql0FXRALZoMARF3O0pJBFsOLte7DGb73IR+/1s/SX08o2
	 w+sVtIQgGkHIh0JfK3kVKyrw95oZojUTLsg2kORy6040iUoK1SMVvPYwzW7TtGcZuh9lR
	 U3kkDXWbTL193Ijw8ZqJOWIAlJFl97yXS6rME/ppbaVqUE+LWykBM0FLMUPCzsD01+7Hw
	 FDMoNJKXSP74wSpvC0xBUgE2Tt4UP+tUgSE9iEsU5mwpacyom2mA8W7AtpCO6yu1BzIat
	 Qya0ooa3ulw1IXJWELA6RUFT8JZRaNuHJaLKv4n4kRQ5MYoCSxEeWqlFOI4EBGmmwFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794398247;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=y9K5hfpcxXuOPfEUoYiaexziePCngEFsF91KAM1M6Eg=;
	b=V523MFpfGxX/Y9mYn1HvzN79jX5GRfSlKarw3nyxj+uUPt27szcp4IwEbrUVYekrYKgA
	 5z9o9cx5TWqnCD0JzM1pNu3yNXPN7emH4edlxvUZHG9yl9RPWHtGd/VilSRRwnf+58SsQ
	 kHUS6iWyXtK+9M1YRw3S6RdevgWU1ThKAovci5QsVg6dqav33Nz3qvjA3DRemx3D6a2p4
	 FhAw6GfiCuh7LG2TFrbCNdWtNS9N2x56p4zsxLuHUJaCZeG84TZ0bRQMsEK4XfHbOstZJ
	 uSO12i1tscxYWSyoxeMZ+Ymt6rdNmO6/HrTObhd3BWksfI4P32ghuXh/Otrndcl3XFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=KNDUv0sr;
	arc=none smtp.remote-ip=220.197.31.4
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7C4606A324
	for <mhi@lists.linux.dev>; Wed, 11 Nov 2026 11:57:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC7C4606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=KNDUv0sr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=y9
	K5hfpcxXuOPfEUoYiaexziePCngEFsF91KAM1M6Eg=; b=KNDUv0srvErDWZYa5U
	Uer59iylm6/ergp4jadBlVZEiDX546mbG7mqsGVbgv0+5X+wOLAZqTo9juT2gyi0
	Gi2YshkhWOtTOq7UvlDuIJeGewXHTXm+4YmxDMHkzbsNK8Aa93TCoGUKs/PoGjuo
	NKZ8jTkEmOsuYJ7xuSxpfiD8M=
Received: from jbd-ThinkPad-X1-Carbon-Gen-14 (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wCnj78NWPRq5VWtGQ--.46389S2;
	Wed, 11 Nov 2026 19:57:02 +0800 (CST)
From: Slark Xiao <slark_xiao@163.com>
To: mani@kernel.org,
	jeff.hugo@oss.qualcomm.com,
	bbhatt@codeaurora.org
Cc: mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Slark Xiao <slark_xiao@163.com>,
	stable@vger.kernel.org
Subject: [PATCH] bus: mhi: host: Only expose controller sysfs attributes on the controller device
Date: Wed, 11 Nov 2026 19:56:58 +0800
Message-ID: <20261111115659.11943-1-slark_xiao@163.com>
X-Mailer: git-send-email 2.53.0
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
X-CM-TRANSID:_____wCnj78NWPRq5VWtGQ--.46389S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCFWkXw4xXrW3tryfKrWktFb_yoW5uFW7pa
	yDGFy5tr15Gw43Kan7uw42g3W3urs3C34UArsrKw12kwnxW3sFqFy7tFyYqFy3CFZYk3Wj
	qr1rW3y8GayDAFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEBOJnUUUUU=
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/xtbC5w7wVWr0WA42tgAA3E

The serial_number, oem_pk_hash and soc_reset attributes are registered
through mhi_bus_type.dev_groups, so the driver core creates them for
every device on the MHI bus.  MHI client devices (the per-channel
devices such as mhi0_DUN or mhi0_MBIM) are also MHI bus devices, so
each of them ends up with its own copies of these files even though
they all operate on the same mhi_controller:

  $ ls /sys/bus/mhi/devices/mhi0_DUN/
  driver  oem_pk_hash  power  serial_number  soc_reset  subsystem  uevent

This is wrong for several reasons:

  - The attributes describe the controller, not the channel.  Their
    callbacks all dereference mhi_dev->mhi_cntrl and read BHI registers
    or issue a controller-wide SoC reset, so writing soc_reset through
    mhi0_DUN resets the whole device while looking like a per-channel
    operation.
  - oem_pk_hash reports failures with dev_err(dev, ...), so a single
    failing controller produces one log line per registered channel
    device instead of one.
  - Userspace has no way to tell which copy is authoritative.

Move the attributes off the bus and attach them to the controller
device only.  mhi_register_controller() now installs the group via
mhi_dev->dev.groups before device_add(), while the channel devices
created by mhi_create_devices() are left untouched.  No functional
change for the controller device; the files stay at the paths listed
in Documentation/ABI/stable/sysfs-bus-mhi.

Note that trigger_edl was already handled this way, through an explicit
sysfs_create_file() on the controller kobject, which is why it never
appeared on the channel devices.

Fixes: 21cb9b18edea ("bus: mhi: core: Introduce sysfs entries for MHI")
Cc: stable@vger.kernel.org
Signed-off-by: Slark Xiao <slark_xiao@163.com>
---
 drivers/bus/mhi/host/init.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
index fd3050889412..b4b254d1c6b9 100644
--- a/drivers/bus/mhi/host/init.c
+++ b/drivers/bus/mhi/host/init.c
@@ -150,13 +150,21 @@ static ssize_t trigger_edl_store(struct device *dev,
 }
 static DEVICE_ATTR_WO(trigger_edl);
 
-static struct attribute *mhi_dev_attrs[] = {
+static struct attribute *mhi_cntrl_dev_attrs[] = {
 	&dev_attr_serial_number.attr,
 	&dev_attr_oem_pk_hash.attr,
 	&dev_attr_soc_reset.attr,
 	NULL,
 };
-ATTRIBUTE_GROUPS(mhi_dev);
+
+static const struct attribute_group mhi_cntrl_dev_group = {
+	.attrs = mhi_cntrl_dev_attrs,
+};
+
+static const struct attribute_group *mhi_cntrl_dev_groups[] = {
+	&mhi_cntrl_dev_group,
+	NULL,
+};
 
 /* MHI protocol requires the transfer ring to be aligned with ring length */
 static int mhi_alloc_aligned_ring(struct mhi_controller *mhi_cntrl,
@@ -1019,6 +1027,8 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
 	dev_set_name(&mhi_dev->dev, "mhi%d", mhi_cntrl->index);
 	mhi_dev->name = dev_name(&mhi_dev->dev);
 
+	mhi_dev->dev.groups = mhi_cntrl_dev_groups;
+
 	/* Init wakeup source */
 	device_init_wakeup(&mhi_dev->dev, true);
 
@@ -1455,7 +1465,6 @@ const struct bus_type mhi_bus_type = {
 	.uevent = mhi_uevent,
 	.probe = mhi_probe,
 	.remove = mhi_remove,
-	.dev_groups = mhi_dev_groups,
 };
 
 static int __init mhi_init(void)
-- 
2.53.0

