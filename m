Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABD43E7179
	for <mhi@lists.linux.dev>; Tue, 10 Mar 2026 07:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773127368; cv=none; b=dmqUCy7b/T3LAc0oWZfDNXx1n5VHPBSuWZYmUNi+lJYQnk1BcVmbf0IDEARalGZxqS9oTSalp6Y/sFKU67gW8gUGpdY6/vWk2fMojhCpK/SPStIeCEllBLuO916EssQbqdGY574vGKuNP6CRU2ZZl1Kio/2wwi83lhSAAsY70AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773127368; c=relaxed/simple;
	bh=zLHdxvYlh3SgJM3zwdFzuQdChe4Q/8MyqXYe5cHG93o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uTEJONyj2q1tKF1Qcnk+fw451b9wVzRcgJcO4Az8AH0UpLYeynvVDrQcwkC6vYYg27nVl3WlMA22UjpsmHu30gzRGZhGoKPL+2P0ityitaGCBW5zFpKtaRUdamF2FZnKoeuElqkGnfykeIeghAZPvKV+nE/T290lA5HT37PPW0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oYn2oJD7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V46ZQJT5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oYn2oJD7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V46ZQJT5"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2EQUq2460666
	for <mhi@lists.linux.dev>; Tue, 10 Mar 2026 07:22:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iiXrCv65t5Cfe7JS9CAoM+yCgarvykPh0XYvrPKdD3o=; b=oYn2oJD7ZYS6xKDv
	L4wJAW3KR170Qvd8MThH0/2fBJzXL3055SL3k7YpFmDUnHdsOxVtI4l2o8XLU3SE
	4kO7QO6FhO3XrKNJBfNmVkprnYwOuOoyeRbVfVAXlLf9TIYrxjGFHn/JS7w8Db+h
	ogugjfX5CIH9HsQytnjPa/xHoZkmUn4WnJFaFCT6H0cRKcXvYTa4aKRsA8NVAqKb
	7cpvBcPnBOQXifSV8Bnyej6olfF4ztc4vT+wszB39fTvwDyhgwV89LA3AR5XVAWg
	qtw36XPeAG82UftvrPS/YmU9GZrL36LlWzXYCjLmWy1UmPBhiMAPHvTxjL/c4hEF
	paaFMA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyv1b3es-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Tue, 10 Mar 2026 07:22:46 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ae6961bff0so355343215ad.2
        for <mhi@lists.linux.dev>; Tue, 10 Mar 2026 00:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773127365; x=1773732165; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iiXrCv65t5Cfe7JS9CAoM+yCgarvykPh0XYvrPKdD3o=;
        b=V46ZQJT51STiV1p2FB+ysK7Zl4y8G09ipNciF6qpv38svvbWqMDucniZHul914VazR
         xj46ZttK4okwytEV7e9/v8IOAWlSH8FnDHx/bdPGAqRiQU8ItXHH6WAVdOf+cQWm8axz
         ChnBiOOW3SOaGIZY/uvKu6saE1yWPh9LnA3U3uuvG6HM3XOclCIV1c//Cf7qk4/wZYV5
         6WaaMnHGYuyn51cIxFVJeRmqXRriyHSAd1lTSetQJb2OmzbGcDc83BwJ3dYs+5ZkQk40
         4CLrkrSjZD/glSO0TI7TmNf3NXCPt7xs+0wI3zCDnpTvW72XzW5zjB7JCy1LHYny0xhE
         krmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773127365; x=1773732165;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iiXrCv65t5Cfe7JS9CAoM+yCgarvykPh0XYvrPKdD3o=;
        b=eLWyhu/b66mo/XBkODEar+j9mXmMCcpzZmALidcgV1oQI+aaeZK4wmh8RxdY69zdD1
         5I+bKOXkkiqO0Nh2Rr3szduhgi6X70yyrW7vK2VTqHELPfUmHizVAjECjmHr6atOwku+
         B9Y1LVRMsHjdRmduUI1X0f3xyeV7t0w4IWTF2bUkSzL6F49QH0CNXiO34sPj0ubhRh/8
         lXRK3njlxBK0cKP2v1q93zxudv9Rbt6l8ss6ShQSaF0pcdGHvzMXNptZ4Pu4oM7nOeEa
         ygM5nAGbFaiVf79W8iJCpU1Wxd7FDS2YNy+Q0rsHpHTiOvj1A633EAk+x4AIk0V+l5/U
         TIFw==
X-Forwarded-Encrypted: i=1; AJvYcCXQnIAbMPXea8oja/RnyDHRQvYgjUD/KF3ZmxQaRaOZ4CUASNsNCxBlEjowd90IYLe7hWw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxmbS4+zcZ461ozME2dF6+9CsP/k5Ty3KGCVRmS2WfgXJEBeUmh
	DLPTNAJddGqb6vt2LH2ZBbEzUP1K5wY9XoDwitqfcT6EeVWrKzVnkXfpucEwu1zcLqflsa2TXPs
	6Aq3GqPSEClFNpygxxeN2v1/KxO+/hSlj5GY1EoMYFVInNjXpl2yI9KMMzfTNnyE=
X-Gm-Gg: ATEYQzzCgVKvzl11Y5V1QPiFbySJc2AtTbsxcFh7aKs1PaOax5Ms1flMh4/zmOiAZDG
	7tHY1djMLke/EWEjkgPky9hokVsnB6j0A7Zr73ik8P/jICyDlliXDS3K8e1nk83QeIWPVaBqsEU
	xSJ6DIkoYSeKx7XjhDvBoxancsI3YEev+mdFk5l/RU9kYCGTOwd5TeLTGQea2iIefN4o7b5WkiE
	gq/xLNlDIF//3+lemU6J7SX6teSQA9nLIYP74GZPhYeMoGNqq9tiP0hYnjkrjalCXUq3diSc27r
	/TaInUO1I0T+cj78evoAB9piCAkjgsi8BWOnRE4geWu2XCJ2dUPYAV2MMAl0Crh6VIjuycMipa0
	AuVtSvUqCeBtvDl7Mf4dqtsGA9+m5wmYhlLni3YdjrT0ogR8o9x4=
X-Received: by 2002:a17:903:2ac4:b0:2ae:673b:6a3 with SMTP id d9443c01a7336-2ae8249d4fcmr140850895ad.49.1773127365105;
        Tue, 10 Mar 2026 00:22:45 -0700 (PDT)
X-Received: by 2002:a17:903:2ac4:b0:2ae:673b:6a3 with SMTP id d9443c01a7336-2ae8249d4fcmr140850645ad.49.1773127364647;
        Tue, 10 Mar 2026 00:22:44 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae840b2e9dsm185200325ad.85.2026.03.10.00.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 00:22:44 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 12:52:05 +0530
Subject: [PATCH v3 8/9] bus: mhi: Expose DDR training data via controller
 sysfs
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-sahara_protocol_new_v2-v3-8-994ea4b0d5ad@oss.qualcomm.com>
References: <20260310-sahara_protocol_new_v2-v3-0-994ea4b0d5ad@oss.qualcomm.com>
In-Reply-To: <20260310-sahara_protocol_new_v2-v3-0-994ea4b0d5ad@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773127328; l=3311;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=zLHdxvYlh3SgJM3zwdFzuQdChe4Q/8MyqXYe5cHG93o=;
 b=pes+jy19Oahyjrj9tGIH89vFrAWYY4NOq1AgxQcEUjKQTpqGWSIU3tWU0VFnNvOBkuhrGWxoq
 VU6vI4W5RVXAVK+t9BMlRNCZDOBecfyTaszyNRJ9WUpQiU+8fxa1BuN
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-GUID: BXPjdkwpg5M6_qQghLDrS6ER9w4a5O49
X-Proofpoint-ORIG-GUID: BXPjdkwpg5M6_qQghLDrS6ER9w4a5O49
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA2MSBTYWx0ZWRfX6AxHWgo/KxlN
 g8VEXBAERacua92goiURTHcBtdXfyAnu07vrMCTBpfKu54mxH9uWwE84UQTuYLlSK0sbmXIffz/
 +udvjPdkA0Zc5hFzhoa2T7IzzSyJXs4B3hJpAJLqmgownPdjRAH451WPA8Dp8esX7BwdVSKaOMC
 Xa2BQDiAd+UN++GO+etXo+vvXhdJTnfqeuZfeTTssYWXANrV6yt+bQFFmQTew/3RVFhqwr8849w
 VnU3QfkJBP7lheFOriip5NnmCkX7Wqcs3vby+QFlGlOJIJmVIPLRi6pNymOJgwQUikd49lFXcZB
 DPufdisz6Culmfjy8TkOOMCMYgl1VG7SLq9U3SOMpS4H5fqIkXg28ZUwtTHxqryxj+cA95K3cBh
 xfpyn8BfOjAbXbuxKduxKxsRVnBKkkX/GktYJ+6nl2TL85TsYwqY89L7p6VZWBEG4TXGN7smnoK
 uaYzLDh3Np8df9/LLTA==
X-Authority-Analysis: v=2.4 cv=Cuays34D c=1 sm=1 tr=0 ts=69afc6c6 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=9mPLix8uEUeM4unapbcA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100061

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
index c88f1220199ac4373d3552167870c19a0d5f23b9..b7208738df10fc3c3895acd46873412818dc1730 100644
--- a/drivers/bus/mhi/sahara/sahara.c
+++ b/drivers/bus/mhi/sahara/sahara.c
@@ -415,6 +415,73 @@ static struct sahara_ctrl_trng_data *sahara_ctrl_trng_get(struct device *dev)
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
@@ -1272,6 +1339,8 @@ static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_
 		return ret;
 	}
 
+	sahara_sysfs_create(mhi_dev);
+
 	return 0;
 }
 

-- 
2.34.1

