Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F5A35837C
	for <mhi@lists.linux.dev>; Sat,  7 Mar 2026 11:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772883757; cv=none; b=agiNL3RAlF5kbn/nicJZPgZ+553+fI94K0MG77ACAysne+Skl1KOvDka7ck3ymaIAQ1ByuoZasR7JRDllSdYWqKkaGUWXtByuMj77ozRepbwUxHs8Fb7ZV/8Tmt2GxNLn0nP9yhxIBYxZIX9iFu8RoMtHGcjAC665oC8zgERzmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772883757; c=relaxed/simple;
	bh=RC4ivP66A8RUn2mgY5duP+YJn6Z5mWCRkIxORYBNQHw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CIcVSjJvZ3fHCVUkcl1lN+r+9g2LosEWwBXHmbLs6FZeSnYODVBgK0XOZ1MnWr7mf5Ingc2wU3VZSmLtjz5nuM1fYZnMoVf1P6V57f/VJuCORZPwPhZnPBW5JHjNEhwtHl52phdAQwohoU2NlIK1JwkS3Iffz5ODwNoDMbBOhRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hWGB27ll; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FrQd2I7D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hWGB27ll";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FrQd2I7D"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6276t6L23907516
	for <mhi@lists.linux.dev>; Sat, 7 Mar 2026 11:42:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x1pj+ok54ZPuMkS+PNjBXQIJn7FjoPSNgDGNG77A/LU=; b=hWGB27lloBw/FEY7
	X7EQ/4+iRmGn/GWkMXJJkGZLiLCOaaJgDaZMRJN0RYOpZ+mE2U1nrikwHPZBmQ/Q
	MAnHck7YCQg3HMvgfsCTkiBwywFyMkaijDodxWAWHEBoHkF5BdLL3FKp3O6lU/4I
	b3lG+MjcjDU9MKixMHZLksg9kD+nEkJtSaq3/YzjNaY30TYte4XM6KlXgWO5A8/u
	1smd54gyxHbwSnRNxFJRVsoP8BCIbrhAV8+aFvvFQlHW80suvZVsFSIwcJHk7SCc
	nVAWYvwJh08ThDiARVyImfSzXNLAr10J/fa/NeuY2Y0+p3SDa3ZZb8em2Uxl17l6
	38rtSA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crb14ru77-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Sat, 07 Mar 2026 11:42:33 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ae4e9577ceso284423765ad.1
        for <mhi@lists.linux.dev>; Sat, 07 Mar 2026 03:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772883752; x=1773488552; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x1pj+ok54ZPuMkS+PNjBXQIJn7FjoPSNgDGNG77A/LU=;
        b=FrQd2I7D2vg+VzmSCLRA0fFMHCNhja/7Ak/yejqhRXNxlFaK8MbJXHDbAYMbyhSodN
         EUrCNJ3kg7BQv23ZA1AvF9Mk1+2g3VgVmFnFt5mKVgg5i0DqVz/PZJ0hUk//j2xUAyIb
         6OrLz6SaQhiRErwEsQYa4pG7c0m3cdH6fPqML/tlExWWBvt8oYQzbKS1IjKg+I8oZM8F
         6+vDDE8TMC10d3VDXTcr/++CW7eCewd0qu2dZicwvD2/ZE1nJ4/vEk5gynClb0r/qezs
         aA+rDEghrxp5wHpCFcHmVI0cl7MtyCP9StCacjs8eLhuPPqIBlOXaowvUQF3bdsLnTxe
         1QxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772883752; x=1773488552;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=x1pj+ok54ZPuMkS+PNjBXQIJn7FjoPSNgDGNG77A/LU=;
        b=I+j0Y8dXiWJmUPWtMcMasb3PvOG3/r+PmkRbacxj8NOl0qwIRynaNQsW52G8QvGJtP
         TXDTVNdJQwZQoxVLULtWomd6U/2wxwhETKgCCj/rOiG+gDjsssc1sAYGBC/HgiiDDEPu
         JGXmhk3oljS9su/WWYz7VmKcTY/R/e+66lYbNPUsuEgvYv1RGjHolWikQVi8A/oSw0T+
         +cr3KvvIQK1o5SM6VEqud2kIICLZOLqaBylb2EAsINNDpkwmNgfJy4K1GuzFSFeV+tOH
         KYwQtZFUEjeiw02kuhrMWWeOU1pTJDOVcs41UN2cmAIuZ8VsIQR7lCuhcXWY7lTFWI/2
         KXkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRq9G4NrHUsXruPfVv4nrB9qY7QFSKLaGrHyKLHTlDq6Od5hpzsvOwtcoaVFnaqZuhTTw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyyha5IdsCN4dyzpokUwu8iiOkIlpiNGSH+DazG2TDngRajL1q4
	SKsekvMKo8M2KHRKlVZ2my7oK8Ap+HNN1oAaqg83A+bvO+97Z/r0Slvp4HoUIqcZxRa+uCom2y5
	4Rgn9c4fYF5WT6hNod5nCtqZ0ADq5hj9Dn/VjTJNt8QYuHDz05azRyAegRomCxRc=
X-Gm-Gg: ATEYQzzfFpYdFvGDzFwgniyGnyr0rzMLsM0N+Apg54twOZl+gEKrS9YseV/WuXpJXVe
	ZMejEfikoQ8u16palefGvIfAaEHfG0Tv0AcZrBgqU0sSAKE5gKTkXNjbe/LFaxKV+PM/m/vDivw
	7GW81I8TSFvMiWU2+i+gRfTmgzDYwHd9F/fP/7P5vmj1+00GqLIGqDxAWx4N9oI8Sk6ePbGXZGd
	M385UDuGpToR/yM0+/Tsj2WoqZ6ZVOqeUfU0tg0KIFsjeFgtVcHKryPbWbXmix3TT1QQML6/XNx
	UMBmoUkIzqROTBbbDYV1bIwi6gpI3opoOoX5FOknp8JLtvGshdy2ZmlNGdoijgyqW5r5HCFFGs6
	Rj0Q7SfMkzKfel9FexYGpyXDX88A8/h1v4RjCiVRG6mfiXBOtRfc=
X-Received: by 2002:a17:902:e74f:b0:2ae:4ad5:b76a with SMTP id d9443c01a7336-2ae823a246bmr55868045ad.21.1772883752161;
        Sat, 07 Mar 2026 03:42:32 -0800 (PST)
X-Received: by 2002:a17:902:e74f:b0:2ae:4ad5:b76a with SMTP id d9443c01a7336-2ae823a246bmr55867845ad.21.1772883751723;
        Sat, 07 Mar 2026 03:42:31 -0800 (PST)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83f8c713sm47996145ad.66.2026.03.07.03.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 03:42:31 -0800 (PST)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Sat, 07 Mar 2026 17:11:29 +0530
Subject: [PATCH v2 8/9] bus: mhi: Expose DDR training data via controller
 sysfs
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260307-sahara_protocol_new_v2-v2-8-29dc748b5e9c@oss.qualcomm.com>
References: <20260307-sahara_protocol_new_v2-v2-0-29dc748b5e9c@oss.qualcomm.com>
In-Reply-To: <20260307-sahara_protocol_new_v2-v2-0-29dc748b5e9c@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772883713; l=3311;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=RC4ivP66A8RUn2mgY5duP+YJn6Z5mWCRkIxORYBNQHw=;
 b=WTCK3v2dWMuJgvV+WvtdUdlEGdN9Q3tZgllxtaV70N5KpZhm5jlgTO4F899UDqqR4f5zYYf9T
 1QqtJ9iX5efCi7+fx9C1L6G4XBCBD3USOrXwifUqcHoRjDxe0fTw67n
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Authority-Analysis: v=2.4 cv=IYSKmGqa c=1 sm=1 tr=0 ts=69ac0f29 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=9mPLix8uEUeM4unapbcA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 62367lfXGnnqjMMFkA_utS7f_Sp7y7sv
X-Proofpoint-ORIG-GUID: 62367lfXGnnqjMMFkA_utS7f_Sp7y7sv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA3MDEwNiBTYWx0ZWRfXxIypeJ2QkZDx
 unk2ZlVuIR0V8DWUzGWQ6ChmgM/bQy+qJdjpXOK7ma1lsLcaB1UYCEk5mStNeSVuFaAYJJlLr1L
 u2RHugPgCeopM2aZPbqCRHHNYaKEHKXcLxuvWTAJWZnGLFGCQnYDtJLRxjfpK5wTo7pjPmZ85of
 5NhMaZ3C3QDy6akokIvgIVohhhLPOGzf4MOBEH62U0mMzGsE5ktyPODnnH90ydVY7pFTMoVYR82
 YPk66XIK1U4sj/VK1KeBniXNHMg0McX+aszmIiv0zD9ABAa3H1I/HJaosbNbAivQohQWwRHT2IO
 2WPt6v8GoE2SnVkfmHBYc+ZvUokWRA6TceQdU/AK6O4r+WjOqhdbS4ulVYKbmflnkdY3bPX+Kxe
 mNr4L2RnJEx5l2fxrxIT/aYFuHuAU5eWf8FQD/CH4gmNmytYfyUPM8Hcuxtze/+iXmueqBY0G2B
 z4d5ffoNC3OJV7HUZ7A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-07_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603070106

DDR training data captured during Sahara command mode needs to be
accessible to userspace so it can be persisted and reused on subsequent
boots. Currently, the training data is stored internally in the driver
but has no external visibility once the sahara channel is torn down.

Expose the captured DDR training data via a read-only binary sysfs
attribute on the MHI controller device. The sysfs file is created under
the controller node, allowing userspace to read the training data even
after the sahara channel device has been removed.

The sysfs attribute reads directly from controller-scoped storage and
relies on device managed resources for cleanup when the controller
device is destroyed. No explicit sysfs removal is required, avoiding
lifetime dependencies on the Sahara channel device.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 drivers/bus/mhi/sahara/sahara.c | 69 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/drivers/bus/mhi/sahara/sahara.c b/drivers/bus/mhi/sahara/sahara.c
index 1eea93384724f559f3b6b78cb6a6e9a77cd5de6b..147bbe20c768198851ce78b9ea36867c554867be 100644
--- a/drivers/bus/mhi/sahara/sahara.c
+++ b/drivers/bus/mhi/sahara/sahara.c
@@ -404,6 +404,73 @@ static struct sahara_ctrl_trng_data *sahara_ctrl_trng_get(struct device *dev)
 	return ct;
 }
 
+static ssize_t ddr_training_data_read(struct file *filp, struct kobject *kobj,
+				      const struct bin_attribute *attr, char *buf,
+				      loff_t offset, size_t count)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct sahara_ctrl_trng_data *ct;
+	size_t available;
+
+	ct = sahara_ctrl_trng_get(dev);
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
@@ -1249,6 +1316,8 @@ static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_
 		return ret;
 	}
 
+	sahara_sysfs_create(mhi_dev);
+
 	return 0;
 }
 

-- 
2.34.1

