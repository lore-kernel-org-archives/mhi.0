Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9307C47ACD4
	for <mhi@lists.linux.dev>; Mon, 12 Oct 2026 18:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791829129; cv=none; b=T4tfpX1DF6ti2wZidzgzvaIKiOz5FUiP+CboHVm53j734WcFJ6PQdPDROzzAHPH1TZGHRNwUYU48TT9O+0Pi7PV8rxFt1onKpi+P0bickrA8jIY0lXXPu678hkWw4EQUoaskQNjcTzRFxW+qxYm5VcloTBnGBLQUJDQ7Pm/sGfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791829129; c=relaxed/simple;
	bh=biCTKkk9cWwd98gBnjAIhfURZEagU2QQtk7DUdBFB1g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tIaJzpRge5F2F+HKI2Bao4kS+B36NscIxioq3DMc3KfadeoOiQ3bDc5vjjT/InmYxWz/x6JccTfGfDmHvAAbErkYqfa81N2FD5GY2tDoiLzMcg/0GfyU5ZCTtx/Q1CWJMdwNdAwFy6EcfrIvS6XxKfWKFgraXK36fVWHyYnAF/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EStGBjCo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aJgdHfUe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EStGBjCo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aJgdHfUe"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CHuj3E3040353
	for <mhi@lists.linux.dev>; Mon, 12 Oct 2026 18:18:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0Kob68wC/vc0CfoybXsR+8YcXmWpEwtZguxE0zOu4xE=; b=EStGBjCodd9FAh4m
	bPsTOibAtmpubqjgoz0cfp5wjfMBuzOGviTM+Rmebo+ODGP7bS7cQqYwyJpX2sLd
	/4bNHmmFB+tlnh87XwuDfjS7t6N9h71ePUsCjqXxrXOfZvoMGTYCtWEd/0VkqpE+
	UJqMYBBvB3yt7Hq5MooLEuqTENBW0MrUob0uvf8lnS2Eid0gbYtonkanr6rJCoBp
	nwDRe2R+4nIwqUO6jb/8Wc5KYZOaUBN32U5JWWQMM0n76WLp6HutqXqsgVtRSmvX
	dFoh24twaI9gYzoAJ106nESWQZmVfDzncpbjCD7cbsRQOmEe6Sx4utpW7A9bPQMa
	Ygk02w==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h92jjrq23-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 12 Oct 2026 18:18:46 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35a04491c56so1381771eec.0
        for <mhi@lists.linux.dev>; Mon, 12 Oct 2026 11:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791829126; x=1792433926; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Kob68wC/vc0CfoybXsR+8YcXmWpEwtZguxE0zOu4xE=;
        b=aJgdHfUeJ1tbpgAxFYZRR2lqnak+nFLvLEfNr9dNPwiQ4IFUplgUvcjE6dyHyph33d
         aXTVcmYr356bUacOvTJFLZsjH1YLBAlhzDMNSwOlwAY2GT3KHFWQOmaL2jfes91cPVjc
         4nUknsvVSt/kBADltIz9Oyw3d9VUPEyp2dO6A6R8q8KntiGkMoC7we3/3qwAGVqbOK/5
         r3CMCHhfLGaSIBW88soOU2Yuu8IU5Yxc2OSgxjO7eegmN5DNNWEur5ZovH02YYx/SmD2
         55FbsepqoOx0rZWt44VZtLstqeMfHI74GK4zaxtPuCzvF7pglKgVVm7PcPct1HeM3AI7
         trqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791829126; x=1792433926;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Kob68wC/vc0CfoybXsR+8YcXmWpEwtZguxE0zOu4xE=;
        b=JMvegx81EeiN51S2Dpon7K/xPB5gWe5LILxgWSLNaNvAZFmYNROEzFSbmZy6Ri6lG/
         Dh9kR8iKeVX8Gwcuy+rguOOrTouz/oWlACXrk2nxDqpjR2EvYbt1FPCF38kK+qxtDf5o
         w967Dw2SeYp7rnUUbnN5sFipVLp03XNhS4rHed6lYQih91Q7/RLDxS+v9M/8oAyCEzx6
         NCLpgIe7xsYCC7i9YeJ+er7hqNftIdFdYRzmodnju1mkZ8G4r0lcv0xNUJlwFfh67RcP
         Ib3gVrEDPBZfMu7YTkgganXlnNruavTyh4ZOGNgKoMMbSJZTmbPw+IaRuPWnKZIn9IJc
         GM4Q==
X-Forwarded-Encrypted: i=1; AKwUvBySbuZG8n1hDnjN93NTKcYr8yp/03hRExf3GElx9b8slaj8U//kVVhYH81O87H3MOxvOMw=@lists.linux.dev
X-Gm-Message-State: AFq9FYL3nfnEiSHD4N3C02/whWtO9iJ0yB/9aZAIaoN1NT6wO212wkRB
	HCIXZka4YM1FrPY++Aer58rQpcatMp8Ukc6w3AOLsBeFnBanzIT2tldpvO2dCGwyAvC6E2Mkf9v
	9TfCie7e6R/ol6DXB6ognD1V5j1QTbkoCSsZTCWiDLYPnz/5rC1Z1Jtg=
X-Gm-Gg: AYBFou3cyipjrxAXmPUYR3P77MVdyW5dY5KCVbYuImVz8jKPrjPyQ+gbL7/hCn9W7S4
	9pxIB8l+uWA8L9hmTAlutnz+r/jZfX2NSUtPkwTzKvLYxIReJOIiJg0PIL6lHN9nai5g4a3H97A
	KSjr6885/x/N2o8g7eDWlYFIL0vkw1R0Dp7XjG24lTF8cLsXScnpWmB0jXbNpsoL0S/HeuPsw7w
	fxazdWyJtFu5T9iVejc18J9W5azTe8WAiAjezAlDSxC6QgJP2emVYm6oVn5QVMIxDlqrbqEs0J/
	oJbyFxWQ6kHqrBoC4Kdn4L32MYg6rYlrym9e4aFZmW6OK6Y4l4pU2UMZV5BS7eovTcEhZbKN7BR
	+UA0OJvYIkyJXKqZsZ/qJIiYmuA2D
X-Received: by 2002:a05:7300:c87:b0:33e:61ab:8309 with SMTP id 5a478bee46e88-3537b291a93mr20292619eec.23.1791829125382;
        Mon, 12 Oct 2026 11:18:45 -0700 (PDT)
X-Received: by 2002:a05:7300:c87:b0:33e:61ab:8309 with SMTP id 5a478bee46e88-3537b291a93mr20292580eec.23.1791829124783;
        Mon, 12 Oct 2026 11:18:44 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-358de54fe47sm22827311eec.31.2026.10.12.11.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 11:18:44 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 23:48:05 +0530
Subject: [PATCH v8 7/7] bus: mhi: Expose DDR training data via controller
 sysfs
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-sahara_protocol_new_v2-v8-7-e12939d229a1@oss.qualcomm.com>
References: <20261012-sahara_protocol_new_v2-v8-0-e12939d229a1@oss.qualcomm.com>
In-Reply-To: <20261012-sahara_protocol_new_v2-v8-0-e12939d229a1@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791829086; l=5269;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=biCTKkk9cWwd98gBnjAIhfURZEagU2QQtk7DUdBFB1g=;
 b=rNpcIcoT6p3dUnSxv/tKEOCWAlWVtheh7cYYCU9K6GOgg6t4DyK90xgIrBJrCYfXNMOEguhvw
 v7VzamcyOC8DU1fJQMMd3Gu4CvV3DyLKOcnfVQ+lfHBL6pJl8tuhOL0
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-GUID: 18pc5c0Wf-pbSRwcz7za4tLgBWs3OIGM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA3MiBTYWx0ZWRfX4Y7XkyiEqBYu
 cABnkmLmWtC5tomVJn4HKsOMx0qqryXO3WAdpSk6itGLAdUeHeXZGtRoj/e+k3Cl4ki5Gs3DUZ6
 laBfRCrc5lNRHsldffKKILwJkEOQdhs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA3MiBTYWx0ZWRfX9YFfLEMk6Og9
 G/6LBwk0+3+DYTaJXNIHoU3pZZh+DHj4jBMHT/f0+x/mHvpI9BhuPoqo9Tmq26p9L0TeruZvpRZ
 VJTiHcw1MCYXKFbIg73CXxPxe4+tN/FB/2lIyweXtqNUA8MO7RQsTX1/LSiYjiArPT8876FW5Ji
 C1ONryKBwenilm5kee57C1qF3FLff7+9e0D49yWbk53OXp3+1i+T2WX+T/r4msZ1ek7hIanmD+B
 E7TJx89cHmM1DSvHkMdGTS5EJZSRp8dsrh4DdfIkaKVn3SkmBJvkpuxwuzWPhnKqz9HZnnZaVCG
 F5v+TUE5zzLXM6niuDJxIHl9XmBROvdgol8a0/hclZmoF3rXskfa9wdCK4MTxd8WLF1zQocrBVC
 VfEuBcVzv74/17miRrm5TZ/1ZhlcykisfOTkF8b0RtMLhq4+1JtCpafhpkucKXcLKquVWK/ldHp
 ZsxQlEBnbrLpcaGpqBg==
X-Authority-Analysis: v=2.4 cv=GfKCDgXL c=1 sm=1 tr=0 ts=6acd2486 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=NePjL4a1hEawMabAjiMA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: 18pc5c0Wf-pbSRwcz7za4tLgBWs3OIGM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 spamscore=0 adultscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120072

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
 drivers/bus/mhi/host/clients/sahara/sahara.c       | 63 ++++++++++++++++++++++
 2 files changed, 82 insertions(+)

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
index e7a6289b11a72d5dda008d6107eff6b4f9b67519..db6fb966fd93c9fef82e5599b7133299e1a4c337 100644
--- a/drivers/bus/mhi/host/clients/sahara/sahara.c
+++ b/drivers/bus/mhi/host/clients/sahara/sahara.c
@@ -273,6 +273,67 @@ static struct sahara_cntrl_training_data *sahara_cntrl_training_get(struct devic
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
+	/* No complete data yet or offset past end */
+	if (!ct->data || ct->receiving || ct->copied != ct->size ||
+	    offset >= ct->size) {
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
@@ -1130,6 +1191,8 @@ static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_
 		return ret;
 	}
 
+	sahara_sysfs_create(mhi_dev);
+
 	return 0;
 }
 

-- 
2.34.1

