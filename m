Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1167F3C9890
	for <mhi@lists.linux.dev>; Thu,  8 Oct 2026 06:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791440671; cv=none; b=HJ0ZYoDxYTwWQqjhb4K0Rqf1l7S3d5hVk9WTeYMMHv3QO3gDsZqDAXKQc2s6NPbUqFmoE2aRzrN3fRRO26IhMvNrb2BP2K2wlNo++iN5NlIKesbOl6RX3Gi+gkZWqdWDzMW8tBhWhqKMZM9H9wi1i20KekZFE3Tdc+Q6xzowafU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791440671; c=relaxed/simple;
	bh=XVetEM5Q2ug5nyBqvhNaS/084gMekcQG8SGiCqI6YvA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UAwlMnhmIRlvlePeJLqDXx3Lqqm3jBW8xKWvBaFXcKBwSaIMWq4RUKAEzlu+YFzCmnjOsFYvMql/ctosM0YJHG9e2hOTo7dGcUiksxkN72XMmto+iN3RmZLv1KamEu9SemBx6SaeQrueLbWcped3Rrqa4e6fbeELAU3wR6K5jHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=evcTkvsz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VAlDPMq2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="evcTkvsz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VAlDPMq2"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BYOL753898
	for <mhi@lists.linux.dev>; Thu, 8 Oct 2026 06:24:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eS4PvSA7/Ma74eWd/k9oJLAImFrqW7ASvtLawTHJBjs=; b=evcTkvszK+8U31jJ
	ku8eUG7knSKpAMWE8bRHO311PA3pCziQipIRWzLnodfqSvJuVFktYYKncxBzIvUl
	gLDEZe2LP5GWc/pkRBZpMNOjIu89q2JVzssEjgc0ApQsyAk3DHZZQOwIcympLD0b
	kVa7NVF1tAu8hqsGimVBWj/loMp2sXzFNEaQX4i76qj7ZBlpbUNMjHdYpxialLQY
	xxe5ArNsgIGZYnChYDd4PFHlrcX1A7LxL9mj8o/KRyYJEmAmZ29PJo5R/8mLWqgj
	DCDc8qFzEpAY+xLo22eEtuyXowfX++2XM7L7UcZ+9Sk41xe0qXQPuNbWtwDx21nS
	FdyBgQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe39d0m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 08 Oct 2026 06:24:28 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so3929952a91.3
        for <mhi@lists.linux.dev>; Wed, 07 Oct 2026 23:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791440668; x=1792045468; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eS4PvSA7/Ma74eWd/k9oJLAImFrqW7ASvtLawTHJBjs=;
        b=VAlDPMq2UEfe1LsKWkjS8/Bsq+VtvV2r/zXe8xO5cTIvAbg/yigArH78tYm11qHKgz
         +3vG73w5Q+6z3yrXl/6WZoXX2Wvk06r7ZCijgKsSt4DfD6CFi2vvvTwfDl7g5yMXscec
         qM9a4gw0jCWusKUiALtvplRJj1sI1yezW4z7GRNrR6iYYyWOwzXczseeK7YpZIUPASri
         t+kDgN9iKD9AnEtvfGHJvYNSZp7eXeXMUNJkjdrqRZRWbzGGvAb/SSKQPT2mlHaMkBrF
         wHU6z9UCGwc3Nnsae7SkDzfh40xBjOiQgKaSSLxXk2wBmEc6B9gWOcnbALEt8InJdnE9
         FAXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791440668; x=1792045468;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eS4PvSA7/Ma74eWd/k9oJLAImFrqW7ASvtLawTHJBjs=;
        b=FB8A8vuqz9XSDeOu8yB3nWjLFCEfT4M8G4ldiy5OudRivxOkdr2k6tfGB3VK8EYDCt
         3P/st5K4L8crln0KXsBAgZVP/t4auJttwB5zghFDjoV3+3BtokEwnu6Oopsp0QYyMcfL
         3i3Yq7hVXCfJdiK3yoqfwERjK6W/9jEI+IyYuitTivbkZH6+jHy76yXVI5xfFgdX1gI2
         rlakPt+FkNKcKhMoTlnguuooVu0rEkc9VDmuzCPRzt6rebBFYACCGYuLOWVgvXZTM817
         DXs4APJrZuvolqCi5vWfuRM88UzuoLZgFA0Tyj++KMOYC1HVz1kJPdJCYoGgyqrr3GaL
         3xlg==
X-Forwarded-Encrypted: i=1; AKwUvBwrd4bd6KGWvggV7/AURmDjGHWX96kU8IHA7fOnFbs4kmJXLwTzsX810ElhqYmwDvcdIM8=@lists.linux.dev
X-Gm-Message-State: AFq9FYJKy/CqXz2LKta6oiLAKkiuIFWgri5m+7n2WYT2Lrt+F5Vpv7sy
	ZeGGcWuON3uUooe+892wWh/lh7AZJ4mkp8x3Pc/RUAJf4NsjAGY1IrMdrzckcTGgV++58VPsFZ5
	sOIjLUZIpbPHp5dbgnhzIeBx6jr4df70u4oftfclODLHP4UYBR8acU5k=
X-Gm-Gg: AYBFou1zbJEaA0M4ty7h8ytGUroSI8kuV3NV7kCum0YQ5/p8vrRF4lsw2ag5+nYZ/gD
	XXsJbJwuyVGKI+ztLiazZLybns5lp30NkfWbmV81E2EDP3KPCCpnBTmqZztzLEgqegM+YhLoLNV
	Zw3dp0XrAozhEWxNoOu30OhgEpaBItPHtq3xfEcChg7ijFmvxdCfmSfKac4fS2Yt7AB0+/1FK2U
	ym9GfgMbmC303YoacbDukdNOvB0Q7syueVQ5gOMyYcuFxhmVbT1p8uFqhkpW81/LKXmbtzICcPl
	e0Gh+sFYHGYAWPeE82nTSPeIXxQi49X22fXLNsAbOUvwIXvn6ZCJ2KazxMoqJ0OjFH7SW3wPccE
	VkRGO+BdcgbDcUMdAvDo6FHTMinRc
X-Received: by 2002:a17:90b:1811:b0:3a4:a592:4cfa with SMTP id 98e67ed59e1d1-3a8a1bbf16dmr4105708a91.45.1791440667838;
        Wed, 07 Oct 2026 23:24:27 -0700 (PDT)
X-Received: by 2002:a17:90b:1811:b0:3a4:a592:4cfa with SMTP id 98e67ed59e1d1-3a8a1bbf16dmr4105630a91.45.1791440666413;
        Wed, 07 Oct 2026 23:24:26 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9ff7ab034sm2767618a91.4.2026.10.07.23.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 23:24:25 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 11:53:51 +0530
Subject: [PATCH v7 7/7] bus: mhi: Expose DDR training data via controller
 sysfs
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-sahara_protocol_new_v2-v7-7-90d278bd7414@oss.qualcomm.com>
References: <20261008-sahara_protocol_new_v2-v7-0-90d278bd7414@oss.qualcomm.com>
In-Reply-To: <20261008-sahara_protocol_new_v2-v7-0-90d278bd7414@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791440631; l=5210;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=XVetEM5Q2ug5nyBqvhNaS/084gMekcQG8SGiCqI6YvA=;
 b=XwGMCYWzlGTsjAzJeyIcI3VnMQ7Gv2772DSFZeD+o6JRTtp9YjGcLODcxasJ/NPHil0Hp/nRa
 XEkzdLU4MUSCax5CLl3/wd4fJbJlZHVoEzE2OFoKpXGO4EqpVFMmk6M
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-GUID: 5UHhja1pzWVfTITbsfnvu67ts_MqIHXc
X-Authority-Analysis: v=2.4 cv=QOz91QLL c=1 sm=1 tr=0 ts=6ac7371c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=W7Sg6yURm1IBNJFiFuEA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyNSBTYWx0ZWRfXwCjhmid/torr
 ab+YhvRBAB+K2NPYgGxjASZRgRIBXyZin3hE6/6xAXYPI7QdW5DpJlhxbc1qdJX2TlIXZw+iapL
 MEUTDzbp3uA/JRcMqQWmAHlXMc9Zk1c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyNSBTYWx0ZWRfX9XVuaXVmp+jC
 SPZS0sSEyTeshWv+Ozb2gcDxOroA99HmG+IztS207WLPwmLf7FXkN7e+zGsIk3+Ti/zGAF3bTsI
 EMjsSsHNYQQcvFfETVLolM2T6nS6pdhEFqdaXSDsv4ee65DuRMzRa0rYIQuhg50lOhSUFtBSb7a
 Fixqptv64daIIUlly4J/Y1/cUhP6SFAVMBgq+Sk+XX+DKkzlBN6GuXulOAJQvjdlCINrEY6dxXU
 2Viyf9ms4huJE7CbjY2yOnqIMpX2++iZLjreQ5kzpM8jPbV38lT0vK/dUGXpYhOEmYDkRY7uHUM
 zxAdqIXqOV1A5Z8crDav8mBgiJOrZA9HjK5pO8PYv2p9xEdX+ACp+iRih3IvCEgHN4jnUnt2u0F
 z0SQXEBzjWqIbW8C2dkJ2qxc+hLRh7SPhRNqZ757vw27UlWTwkPrk95QagUNt+w78VgekmBUWO5
 /JrqrcnRNLOJTxPH+Cg==
X-Proofpoint-ORIG-GUID: 5UHhja1pzWVfTITbsfnvu67ts_MqIHXc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080025

DDR training data captured during Sahara command mode needs to be
accessible to userspace so it can be persisted and reused on subsequent
boots. Currently, the training data is stored internally in the driver
but has no external visibility once the Sahara channel is torn down.

Expose the captured DDR training data via a read-only binary sysfs
attribute on the MHI controller device:

/sys/bus/mhi/devices/<mhi_cntrl>/ddr_training_data

The sysfs read callback serves data directly from controller scoped storage
and protects access with the controller training data lock. The attribute
lifetime is tied to the controller device via devres, allowing the data to
remain readable after Sahara channel teardown and ensuring automatic
cleanup when controller device is removed.

Userspace flow:
1. For each controller device, userspace reads the ddr_training_data sysfs
   attribute.
2. If the read returns non-zero data, userspace persists it using a
   serial specific filename (for example, mdmddr_0x<serial_no>.mbn).
3. On subsequent boots, the Sahara driver attempts to load this serial
   specific DDR training image before falling back to the default
   training image, restoring DDR calibration data and avoiding retraining.

Add ABI documentation for the DDR training data sysfs attribute exposed by
Sahara MHI driver.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-mhi-ddr_training_data    | 19 +++++++
 drivers/bus/mhi/host/clients/sahara/sahara.c       | 62 ++++++++++++++++++++++
 2 files changed, 81 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-mhi-ddr_training_data b/Documentation/ABI/testing/sysfs-bus-mhi-ddr_training_data
new file mode 100644
index 0000000000000000000000000000000000000000..810b487b5a5fdba133d81255f9879844e3938a10
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-mhi-ddr_training_data
@@ -0,0 +1,19 @@
+What:                   /sys/bus/mhi/devices/<mhi-cntrl>/ddr_training_data
+
+Date:                   March 2026
+
+Contact:                Kishore Batta <kishore.batta@oss.qualcomm.com>
+
+Description:            Contains the DDR training data for the Qualcomm device
+                        connected. MHI driver populates different controller
+                        nodes for each device. The DDR training data is exposed
+                        to userspace to read and save the training data file to
+                        the filesystem. In the subsequent boot up of the device,
+                        the training data is restored from host to device
+                        optimizing the boot up time of the device.
+
+Usage:                  Example for reading DDR training data:
+                        cat /sys/bus/mhi/devices/mhi0/ddr_training_data
+
+Permissions:            The file permissions are set to 0444 allowing read
+                        access.
diff --git a/drivers/bus/mhi/host/clients/sahara/sahara.c b/drivers/bus/mhi/host/clients/sahara/sahara.c
index 11f65cbfa66b87cb6f144eb096f96773621978fa..2f2d18e4ed4da4ab023c8d68a5e69abad0480555 100644
--- a/drivers/bus/mhi/host/clients/sahara/sahara.c
+++ b/drivers/bus/mhi/host/clients/sahara/sahara.c
@@ -273,6 +273,66 @@ static struct sahara_cntrl_training_data *sahara_cntrl_training_get(struct devic
 	return ct;
 }
 
+static ssize_t ddr_training_data_read(struct file *filp, struct kobject *kobj,
+				      const struct bin_attribute *attr, char *buf,
+				      loff_t offset, size_t count)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct sahara_cntrl_training_data *ct;
+	size_t available;
+
+	ct = sahara_cntrl_training_get(dev);
+	if (!ct)
+		return -ENODEV;
+
+	mutex_lock(&ct->lock);
+
+	/* No data yet or offset past end */
+	if (!ct->data || offset >= ct->size) {
+		mutex_unlock(&ct->lock);
+		return 0;
+	}
+
+	available = ct->size - offset;
+	count = min(count, available);
+	memcpy(buf, (u8 *)ct->data + offset, count);
+
+	mutex_unlock(&ct->lock);
+
+	return count;
+}
+static BIN_ATTR_RO(ddr_training_data, 0);
+
+static void sahara_sysfs_devres_release(struct device *dev, void *res)
+{
+	device_remove_bin_file(dev, &bin_attr_ddr_training_data);
+}
+
+static void sahara_sysfs_create(struct mhi_device *mhi_dev)
+{
+	struct device *dev = &mhi_dev->mhi_cntrl->mhi_dev->dev;
+	void *cookie;
+	int ret;
+
+	if (devres_find(dev, sahara_sysfs_devres_release, NULL, NULL))
+		return;
+
+	ret = device_create_bin_file(dev, &bin_attr_ddr_training_data);
+	if (ret) {
+		dev_warn(&mhi_dev->dev,
+			 "Failed to create DDR training sysfs node (%d)\n", ret);
+		return;
+	}
+
+	cookie = devres_alloc(sahara_sysfs_devres_release, 1, GFP_KERNEL);
+	if (!cookie) {
+		device_remove_bin_file(dev, &bin_attr_ddr_training_data);
+		return;
+	}
+
+	devres_add(dev, cookie);
+}
+
 static int sahara_find_image(struct sahara_context *context, u32 image_id)
 {
 	char *fw_path;
@@ -1130,6 +1190,8 @@ static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_
 		return ret;
 	}
 
+	sahara_sysfs_create(mhi_dev);
+
 	return 0;
 }
 

-- 
2.34.1

