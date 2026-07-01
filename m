Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2AA1428475
	for <mhi@lists.linux.dev>; Wed,  1 Jul 2026 10:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782902302; cv=none; b=riOMaicgTErymZZgHCVwKIU/JyNKffRh06kT8N0dOdylbFsoo9g1S4pKSH4ECdmgHsiAa4N9V9DUVw/rq6oSUvgKqSJI7HkR5hT5NZ/lXKM3iXWoyiSQPFKQ8dsq6yIeUZDCgJsURTZmql8slJ8UvTdy0AdJO23mUlnpKPvy9Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782902302; c=relaxed/simple;
	bh=Jan+rO3lHREsYWShXbf2aFwmvonRIbh7Bu+veXE/AIU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f7RqQXwDse7leDk5zu9pIurs2+LRFsCfaU/NV5Bvu85U9nvWJhalFT6Z5zaLOe2Fi1Ks0nN2Wj+lX6KBJfDZyRzc00rkmRU9mflRiYhD7vSiSHZuOlSGP8uvcBfVCQgWiDAPvk63ccp7O82e3Ph0bczNEre2UmYc2a/cM6959sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aEs6ogGG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pc6gakw/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aEs6ogGG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pc6gakw/"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8ohT762976
	for <mhi@lists.linux.dev>; Wed, 1 Jul 2026 10:38:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ok+6fNf56WQpIHo1nYgzH/b5G92QcDwfXWueRnDPmYA=; b=aEs6ogGGQDI74RO/
	lRblGrlJ+2OeazJFLlUe+c44as9KDJvck6imiu0lQHDBWfm2IQyJosWij8m2Mizo
	GE9DvpzYy5FdSuPaYc9UaaV6dh9CWfjTJwRkpz4bVhHIqwTleNU3wSvVzmCVGd8l
	pupHFbqm3H9fGUE9EzjwK160C0hiRWLiuFzGQQ9Rw6ilImQgPfjY6vAfpzzwyPyA
	fAD531S9z3di9k3RX+keHKw5am3xfo1kf9MRqfMfDDn7/dOkve1mkA2D8omnuVoS
	hoxA9OH5EI/hbC4nvfbQJjTTK0cUUujvbG4jfjyZ5veoz7Nb+sza9Va9oFdO6Bt1
	Dtu9jQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jktbp88-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Wed, 01 Jul 2026 10:38:19 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-37fe5d16d15so858591a91.0
        for <mhi@lists.linux.dev>; Wed, 01 Jul 2026 03:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782902299; x=1783507099; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ok+6fNf56WQpIHo1nYgzH/b5G92QcDwfXWueRnDPmYA=;
        b=Pc6gakw/BJ3UDp3CGsWzdzrsgMh3sPndK34bbDIZdrsGJpPjjWS3VEAMSTfyHi74n8
         P5lUqyp91kefk0hwpJbXX6YsNXao6pYcMd1Bq4S9q+9DNgGPT0I0MYFvnUp/gSOp1ssN
         DRcoOoiUUOhRGvm5O64NL9J2LBg6DpNYV/Tiyw8jNDKPaRkbWfkNP2WQ3drGNvjoEnx9
         rNPKU1E2VzTGhdgUY5btk9FNlcHOS+W9F0/PdyEzvBQQgDXaA9KcSxoSfgu9d0JsSWzI
         hJvGoOfiQxg0d/pDoc1RhRsENvjTgh2M7ic+GfkOrOLf787evy0SZwDz5EAOXlQLlDlZ
         yZKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782902299; x=1783507099;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ok+6fNf56WQpIHo1nYgzH/b5G92QcDwfXWueRnDPmYA=;
        b=U8jxh+y3ko81uzW4a3GgyYFMPqxV0P1Nf7X/t9SS15TIYYj6oP3CVl/ygqeCGZ9ria
         IXdxXcU9epJ67LIqqSj6SIjNv43G3H5tqWGHwpkBsIYozxfCJ0TY3kjEIvDXIUukcQka
         QvSiU1HgwW8tIQO87QzDc0EXsaahKwoiueJYez64GLzrbwuBRf4ZUJF1IZwxrxO+mSYC
         DLo+QDcX1+RaZeUncYNk1blETWfa5oKCF+wDsppQ8XTW4wwoIvtRdURTm0ANxZwHNyZv
         dJLjOCUWU8rmZuiw6uCCTKYJAby2UDQverBKDzswc/LPugGtHbKHSSV9sl4l7KT4d0Ae
         Qz5g==
X-Forwarded-Encrypted: i=1; AHgh+Ro/CpdMlkgxCAyKsSFVptGo++CUCi5nDdvy/vYX9OjIgIcrfG7wLxbPdz2G3ROKk/xXe6g=@lists.linux.dev
X-Gm-Message-State: AOJu0YxMCxVE3LJRH0L/F4Rf4rC8p4WoKrsfpwtzxYWgz88UGUxbzkBM
	daj+R2Luwu9d2peebAOCcbINpQQ52XrPq3CZEJIWl23Oaf+TEhPD2n+5XtRXZS44I1TsoRkwXNh
	UtwoASZaMigFw2fNlWUu19McG6Or1cNMaRTLdyMvfhXiiNMiJ7JCjr+Q=
X-Gm-Gg: AfdE7cnG+qQCmOapXwxY9MoWC8oRem6G9zDQQ5sbFkPdeV9wmKAfBO6dzsa+pbFawQM
	PCeMY1OHGcjQjEe7BJrHNiaMp2JnClExcBOBhLlZhynHEaRp+k9zBXVtMifi6+/8a+6V5lPk//w
	iPalCAbQzCKMGd4IOE0IE7K1fxVCazKjX4yLyWwcbDM6m01NZvURGwfgmKDk5Gi34EGApMy9NCf
	aD51fohf0vNo74l5vZcqTPqDiMaFz8XI58YVvBeQfbtWmjOF/SUyCP1bN4Ri+7cLjjFOiMaN1ul
	aaXIn/8QwHxYOLH0JgFeOyyN/jPLP+2iMtq4eNDO7LvtYcqwyNa9xtm9XKCLJ0nFgJi4qaHOD9q
	ADUNHTJsEjyuMGWBvbgkZrT82w1FHqGA/1ToebyZl
X-Received: by 2002:a17:90b:17cd:b0:36b:9c4a:e05d with SMTP id 98e67ed59e1d1-380ba9455b4mr221612a91.17.1782902298740;
        Wed, 01 Jul 2026 03:38:18 -0700 (PDT)
X-Received: by 2002:a17:90b:17cd:b0:36b:9c4a:e05d with SMTP id 98e67ed59e1d1-380ba9455b4mr221594a91.17.1782902298250;
        Wed, 01 Jul 2026 03:38:18 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38095bc8a2asm765251a91.0.2026.07.01.03.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 03:38:17 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 16:07:41 +0530
Subject: [PATCH v6 7/7] bus: mhi: Expose DDR training data via controller
 sysfs
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-sahara_protocol_new_v2-v6-7-3a78362c4741@oss.qualcomm.com>
References: <20260701-sahara_protocol_new_v2-v6-0-3a78362c4741@oss.qualcomm.com>
In-Reply-To: <20260701-sahara_protocol_new_v2-v6-0-3a78362c4741@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782902263; l=5210;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=Jan+rO3lHREsYWShXbf2aFwmvonRIbh7Bu+veXE/AIU=;
 b=1aIjX2/TG/4sjfrA0UmBKYhS7juF931y5uK7Gq7FUFa9jfohXouXcnQFh9yaSzTv8NA4fWyk3
 +pWLVc+XgmyD6NA7Aks92EyaC86mt609EWMML0n5d2hWDNfOuI52pJL
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDExMSBTYWx0ZWRfXz+C6KAS9fvto
 sKAd8mSxpcjN7Gk5Q4eg/0NhuQnIIuvI9DCU150/jJ8nHj1HLY4Z9cJuX2fDEvG4VPCBGWgs1nL
 HlXy/naj6QRhUuyb8Wo9jxKpIt7KhcQ=
X-Proofpoint-GUID: 9j9VTZpZeQ2IhcRJSjiTL7Pxr5gst8DF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDExMSBTYWx0ZWRfXw5c+2xQbyY93
 GNuqKbQkE6LtBLUBBiv3iXetyfa5HAMBV4ES4l0f5LxqWvBpwOPG7oxJL+6oVj6PWgYw/p6z6Ka
 X6ugkNuv/aunnmuQga4Dq+gc2pr6Ee9XWBbitzVPM7q4YCXFWvyVTvYcQb4z7xF5PqZ3bdsHNcO
 nlizZEMMh11nkQyVxp9giPUnD29yOZQXw4mGVuN7jhF3qmGlFQBr2itTqCDeOKerKfeElTjmiPY
 0BXSihyJxgATRMP1LHQ3rL2yaoJa6jyk+hHp4+u4HBKSxWQ3M82zYIH7LzcW2E+pO7TsbNI0usd
 dRM+kplK53yni4YjT6tdZJgVbCkUXRpe3OnCKPY31Z82BRuxhzNj5Yly7NxxJ0bEF8rAwfMfAv1
 twMbfyCCV6bzrpRyvYys2grS97DohpfX4FCX1GPjJE3jeGfardVbFLes6bO0AotSqsVD4sdzaoi
 vcY1b4k32EcZ2Mwik0Q==
X-Authority-Analysis: v=2.4 cv=R+wz39RX c=1 sm=1 tr=0 ts=6a44ee1b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=6t33SRJ6vQwVIDTtI9kA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 9j9VTZpZeQ2IhcRJSjiTL7Pxr5gst8DF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1011 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010111

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
index 07bc743aa061dd2fa85638067d494562152474e3..72ac751c302a98448b5756c9feb438647bd0ce4b 100644
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
@@ -1131,6 +1191,8 @@ static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_
 		return ret;
 	}
 
+	sahara_sysfs_create(mhi_dev);
+
 	return 0;
 }
 

-- 
2.34.1

