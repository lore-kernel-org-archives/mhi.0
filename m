Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959473E0C50
	for <mhi@lists.linux.dev>; Thu, 16 Apr 2026 14:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776348637; cv=none; b=ANn2fFHLrTb7njfzOJOwTqiY6CH0F+iOyRHADRu2oJ4JZhVo5SH/lUjM0381bCsKHd9BPsU9Jdmgxwbc1PBMmG3q9+ibVtN91nAvq+QKlz0QZA7QES9cT0eFNBmnb9Qh7pKpcHo/VioAR6e3l9jBRf+E8QMxxOoKKuWWGukqf5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776348637; c=relaxed/simple;
	bh=ED34D8b+KIsBJGlgWYmYp+bxz9nF9W6dhG3Lu+L8T+Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hbQtAAXjhIBCDcJEgzfdNyJPxdDBWABBNjiXk4XVc2C1LkqoGvvSoWL3KlnfdWj3XUx+TNvaZrc3adrV9v6KqTvxC/snCzTQ+j1QuBdIHOylrzgFjJ8mz9+6/RiAicgdhEb6/2TDicEsM8Q3AyM30sffTn96u2/Gp7RErC1rrow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XqjGIXZd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f+hziMbF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XqjGIXZd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f+hziMbF"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63GBqhPm2652256
	for <mhi@lists.linux.dev>; Thu, 16 Apr 2026 14:10:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	olONKICAQIN5WecCXZoB05Va0xoXxi3BtToDJt2JvlU=; b=XqjGIXZdw6NKQMIj
	hSdPAXMczheOQYqH98Bq4weVCFDDFn4Zl9dpgUgwEA0k6WsX6U5CdxHcdpikXQ7I
	osU9HlveeflD3qM1vNr9ljKCejtLeubry2wpPTOPiclUymeC3eF06EVlH6SlR4jV
	1Uh5MPrhLPMk0lQIwaNs1LdmIlInNKAYvidiw08ZmneMzSWnRoroYB9Yg7kyLU3D
	0XeKNpgw4tok3ZAlx3r6RONqmRy3Rdn4RycrT99ZTnszi2EZVnOawonyeWfylSV5
	HCyH90Yqe4uIR75M6mt0P2Rk+k9EmjsU7XGSzRifJSks8W0s1UqK5vMDGjGdWEl2
	8ThZ0Q==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djtfuhkyc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 16 Apr 2026 14:10:34 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-651c92dd649so7741417d50.1
        for <mhi@lists.linux.dev>; Thu, 16 Apr 2026 07:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776348632; x=1776953432; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=olONKICAQIN5WecCXZoB05Va0xoXxi3BtToDJt2JvlU=;
        b=f+hziMbFpOaKfAsR0VmAU9upl+nq5792yysNfG0r4JtJcx1WTofsGVO+wN45eXMBVv
         a0a3VDkErUJ8XZ6owOvzaWXmPyV9oEHiTiep5tveLT2DI/46EMdxTzC1mLR6G7jo+yp7
         ZE9lGxugPszAzK8/xADSnpIJ8lj9E4uknvzObcho8WQP914Jl5c05KgbBveGjFZYOXvI
         9fkKoqSXFfQiKGbD9aYzOSCmVdzbA98yX93lrTlolI0FrRXT2T+BnsV7R/dKd9nfEQ7S
         O7ve9FuUAqKd1+FlGEDZOa1riXjPjEOP35iG/EHOJPXDkDQanNwZSTbRieULrQrHM+hZ
         l/zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776348632; x=1776953432;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=olONKICAQIN5WecCXZoB05Va0xoXxi3BtToDJt2JvlU=;
        b=tKbzlUvG5QFFvsDJr5Wz+7j94i0cqW7Y5GOLzgZjOnkB1SuJeo4gpFdJwUczk7xF5x
         QXJyGgSzB9d/cSPBjW58s4KwRd7OGj1lmSoIE1Zxs0T7+eDOuWKp83UCy5P70CvXdmkJ
         xPFHcf/20rpQy2M6DsloK8/1tdy+tw39i/hYchzbB+PmhYAVv3lvW+3WRkpLyqhjzI32
         XW7erVopAj+ChJ01dFAVZSWfycTaYuaDbXJxtFG+++PHL27RDWnFa3m7Q+mG9qoCvGpY
         sKQwy492Ds3ZRjto4N5TAu2x83recbMEQy8Kd3992hmwfwgM4r4qHPvKDKeukl0KvEQL
         vJkQ==
X-Forwarded-Encrypted: i=1; AFNElJ+xWs89XKgnXT/ruq6bK3bLqHWPKh5B17Kng2Zdv7yBBVKZ5EyISo0xyHW1uNSFYwyJDsU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxFbow3ImIrlGS5mA35rVLon9CBA9ymCEPjIMqZSXm09iHaGYPH
	tGV9O04oregTquqszeTD1HTIwzjJOgCitY3f0XUrF4Hd+IdPXfN2087VtbrztBZEaiuF2NxYxph
	jYLVjKlfZKa9uovFhyZU+Tf5pxKCS1cVPx4eBM5Qqq7ysWe5k3fQGeN4=
X-Gm-Gg: AeBDiety2T0CPlgZV3ACRjsSieo6cOq/il008iiO2Yfwpkkyfo/IoLa7UcDeYtDzpTZ
	jorExUjURT4GTLy0QDFAEYJr9aSVfT0lOlleBnD9KzEhceg9gruTd/M/6T01+oG/MzJhMilSA3s
	fB5fFdt99jjrAkBOK91KY9S/wN+FB+6O0sOeAXo97vBwB9vv0KjKatvQvvoUeGzcPPlu75C2FB5
	U5EtPeHY2X8EYFqRXSvtTQ09ZSiT+UOxFBzmrRY38823NrBFWiM3YuTxMLsGlsDtYHS1l7BDXCd
	oPt+gw+PLW2MWZpDmB+ZRzsXGKMn+oV4yDgqkK+eUQbjUZuyodt3FscxPjG4eFCcDaYWmgIdPnl
	bFuLhmw0vIfb8zJb9nliLbZKTWhrPbKsZUzlSIiPh9szgijo220E=
X-Received: by 2002:a53:cf05:0:b0:650:4aec:29fa with SMTP id 956f58d0204a3-65198b734cbmr16936294d50.38.1776348632100;
        Thu, 16 Apr 2026 07:10:32 -0700 (PDT)
X-Received: by 2002:a53:cf05:0:b0:650:4aec:29fa with SMTP id 956f58d0204a3-65198b734cbmr16936245d50.38.1776348631578;
        Thu, 16 Apr 2026 07:10:31 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-652e47ba4a3sm2084691d50.17.2026.04.16.07.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 07:10:31 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 19:39:48 +0530
Subject: [PATCH v5 7/7] bus: mhi: Expose DDR training data via controller
 sysfs
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-sahara_protocol_new_v2-v5-7-6aebf005e4ba@oss.qualcomm.com>
References: <20260416-sahara_protocol_new_v2-v5-0-6aebf005e4ba@oss.qualcomm.com>
In-Reply-To: <20260416-sahara_protocol_new_v2-v5-0-6aebf005e4ba@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776348592; l=5329;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=ED34D8b+KIsBJGlgWYmYp+bxz9nF9W6dhG3Lu+L8T+Y=;
 b=wr3vSGs78JSxGrL9+BaCDjQaV430OdwRmfmRxGfEA18NdKlc7cPBYHUMyREr7q9wjEQydgh2n
 fowGZKpD2eLBYkBvWD8gp2LTGudSo2ECATeMbqaMDKsHQlDphB0Yaf9
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-ORIG-GUID: JEunkXMVUIUvpu4_T93VSP-n4gSbwYGj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDEzNiBTYWx0ZWRfX1p9B7ftUzYV1
 /mpOxMZHTRvOtPqj8VqMVU3ko6rfBV3WDHPHf7AotWulNU9kkCJ3Rk0bFb0d5cu5q51oRq2lyxY
 /3scPXgTuS6Y0DPKzOS4304h4S061yCi7vYXSvhlNvjycEvSlFuY+STcOQjOLZohjLoYL92fbSP
 C0ywg9eoSpakK3PpkaZ+ZJocXmj+RkK0p72Z63FTsn9KAWwYSfnxZPQe7MtZUTQ9n3uLoSKdMrn
 LP5186WyrNtXLAGa3h1aM1EuEwJ6qT7dq7LtlTyQjVL8rQb65pw/s/2OMWs+kE3dA6fTVmFaEZd
 9PRl2zqZAiONwQmhS5F0EwDFsdbgZk15EMoyimGbW/EyFNUniIbaMBaksMd6nxQtB6m5gHlUs3X
 CSn0uKSFwAv0OuNHsEjalXx5azFHQNEf90pxqBNNjd0PPbSE9O976WsrwJDH5295aCMEwk+DlYU
 GMuvkYr1BKtvtepoIdQ==
X-Proofpoint-GUID: JEunkXMVUIUvpu4_T93VSP-n4gSbwYGj
X-Authority-Analysis: v=2.4 cv=KrF9H2WN c=1 sm=1 tr=0 ts=69e0edda cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=6t33SRJ6vQwVIDTtI9kA:9 a=QEXdDO2ut3YA:10
 a=nd2WpGr1bMy9NW-iytEl:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160136

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
 .../ABI/testing/sysfs-bus-mhi-ddr_training_data    | 19 ++++++
 drivers/bus/mhi/host/clients/sahara/sahara.c       | 69 ++++++++++++++++++++++
 2 files changed, 88 insertions(+)

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
index 07bc743aa061dd2fa85638067d494562152474e3..fef5dc1d8884133397d204f23361584fd1d9b075 100644
--- a/drivers/bus/mhi/host/clients/sahara/sahara.c
+++ b/drivers/bus/mhi/host/clients/sahara/sahara.c
@@ -273,6 +273,73 @@ static struct sahara_cntrl_training_data *sahara_cntrl_training_get(struct devic
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
+
+static const struct bin_attribute ddr_training_data_attr = {
+	.attr = {
+		.name = "ddr_training_data",
+		.mode = 0444,
+	},
+	.read = ddr_training_data_read,
+};
+
+static void sahara_sysfs_devres_release(struct device *dev, void *res)
+{
+	device_remove_bin_file(dev, &ddr_training_data_attr);
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
+	ret = device_create_bin_file(dev, &ddr_training_data_attr);
+	if (ret) {
+		dev_warn(&mhi_dev->dev,
+			 "Failed to create DDR training sysfs node (%d)\n", ret);
+		return;
+	}
+
+	cookie = devres_alloc(sahara_sysfs_devres_release, 1, GFP_KERNEL);
+	if (!cookie) {
+		device_remove_bin_file(dev, &ddr_training_data_attr);
+		return;
+	}
+
+	devres_add(dev, cookie);
+}
+
 static int sahara_find_image(struct sahara_context *context, u32 image_id)
 {
 	char *fw_path;
@@ -1131,6 +1198,8 @@ static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_
 		return ret;
 	}
 
+	sahara_sysfs_create(mhi_dev);
+
 	return 0;
 }
 

-- 
2.34.1

